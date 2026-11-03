Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D46E606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vIwiIvc6;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KK8dLO8v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IG6vdPo3DLcFU0vZfW2Pl6cWGS5wa13nkbiaPWcPPmo=; b=vIwiIvc6NNgDZi
	KRLOsnUti3JfCnvIn4kRTNw8kZVQKjlbm29vudTKGYlouXGEGbHQTFKexzI0iL+/9QuJht1CKm5uu
	g30uwVWWv2hLt2biw0+31nEith1NOjQBW5myoB0wmfjQLuTKlHhTBisbIa3fc0Lz4Koy6oMJIvTwY
	gWe6OyTySVFTcs32dHSNAbz4cnNu66n73ebwRWuG5uvj1Vghm+j/9mMkM+01t9dOMTEYXifxX2xnl
	+laJOhd+FrXnTCyirNQacxfhGcTHA3b344hUb2xh1vkwAVhw9K6EK3qPlayUygSjjnFAdhbbu7qSh
	mRRufp1M4Xxuf/Y06Cuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99l-00000001NRz-3SOD;
	Tue, 03 Nov 2026 07:42:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98v-00000001MLF-3KO7;
	Tue, 03 Nov 2026 07:41:44 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30EC14E46;
	Tue,  3 Nov 2026 08:38:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691537;
	bh=GiwNGh07q6PcCBSOAtw5pEqND3yzss/NEdJJz/Zox7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KK8dLO8vek6tX5nY2ZFiBaz4sxCNTw4TRr+rEi4gAwPkCR3P+THnZEHzH8icZMEjN
	 0IkQYJ3zmOLBn8dmavCcuuzOpHz0vTOl526CnjOoqsdGuILWEcNfIZHPDgVPt7wHrg
	 i0T5B7ajA+8HwpQ9q48Er8gnppHaJh6+TbTMb6aE=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:47 +0000
Subject: [PATCH 11/16] media: rkisp1: Switch resizer subdevice to
 .enable/disable_streams()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-11-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3806;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=GiwNGh07q6PcCBSOAtw5pEqND3yzss/NEdJJz/Zox7Q=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAQgzwdy0o9wp4FEg4lwC4z+oCeDkyHxs+R0
 x1Y2oc/UR+JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQEAAKCRDISVd6bEV1
 MpbAD/4hvBSncHCCLCJ/zsDCMOUQ3voLmSQB+yCyHAR02jkclW9Y/QArsuKMGol7XEgDoLngEXD
 X3A9++anbSDlZ0MUxOJGv0+YfqcFK4mcTbrmHQKxG2BKgUYG9mDE/iPcIZvj7HWod4IIUhcf4o0
 BQEYpv1fiRkgZzXsjCrAqgG0chnUGEzRmkUXdOJDsiQCjnqyeBbBMXEMv4LwQHwMafeU/QnZeYC
 gTYqVg3jC4kFTmeJX1UO26te04ELEOhwXnmQ+OkKNMds3B43sGa7QGia8aeRF+KXsi2nv2GAyDT
 urUkLWIjnc5ofScR9PweuNV/cSqTTgvdW0smPPJJala7l7Lu6e0NFPs8V2rm1xYJSosLDxCMdBa
 GD/rm+cCdPfDRpQn/4psuok/+YDDM3ZIwyb0kQvGEWzaEUGoMZ4sl1eYfnlp9X+3l9+GxAQSUkR
 PRvmHH45FzWBoThtJzZVd+zTjUw69Nqdweyet5Ijlbf5toiq7vCyLDoAo1W/75kzA16rj8Mp8pV
 HacQnRcuOIpDKTYJMsud08XyHU3xbExgNp5YLCeHvlVpoMcLf4gS1xliNk4lRgOvrrACBw37b7C
 M2NUFkH0vuuJH+gSqAaOvbtDalV42ZMBN6fivbVq4rITXNT6hy95MAq0BEKmAMmi1oAsSTqZxHp
 AXOzY6zFAWZGG5w==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234120_010080_48CDC3A7 
X-CRM114-Status: GOOD (  13.27  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The rkisp1 driver's resizer subdevices currently use the legacy
.s_stream() operation. Switch to the newer .enable_streams() and
.disable_streams().

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      | 62 +++++++++++-----------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 5926917434af441f718b46388860139600af0fe2..ce0b2c68cf826992ed07c453a611a7cab7dfb96a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -615,20 +615,9 @@ static const struct media_entity_operations rkisp1_rsz_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
-static const struct v4l2_subdev_pad_ops rkisp1_rsz_pad_ops = {
-	.enum_mbus_code = rkisp1_rsz_enum_mbus_code,
-	.get_selection = rkisp1_rsz_get_selection,
-	.set_selection = rkisp1_rsz_set_selection,
-	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = rkisp1_rsz_set_fmt,
-	.link_validate = v4l2_subdev_link_validate_default,
-};
-
-/* ----------------------------------------------------------------------------
- * Stream operations
- */
-
-static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
+static int rkisp1_rsz_enable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state, u32 pad,
+				     u64 streams_mask)
 {
 	struct rkisp1_resizer *rsz =
 		container_of(sd, struct rkisp1_resizer, sd);
@@ -636,35 +625,48 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
 	struct rkisp1_capture *other = &rkisp1->capture_devs[rsz->id ^ 1];
 	enum rkisp1_shadow_regs_when when = RKISP1_SHADOW_REGS_SYNC;
 	bool has_self_path = rkisp1_has_feature(rkisp1, SELF_PATH);
-	struct v4l2_subdev_state *sd_state;
-
-	if (!enable) {
-		if (rkisp1_has_feature(rkisp1, DUAL_CROP))
-			rkisp1_dcrop_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
-		rkisp1_rsz_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
-		return 0;
-	}
 
 	if (has_self_path && other->is_streaming)
 		when = RKISP1_SHADOW_REGS_ASYNC;
 
-	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	rkisp1_rsz_config(rsz, sd_state, when);
+	rkisp1_rsz_config(rsz, state, when);
 	if (rkisp1_has_feature(rkisp1, DUAL_CROP))
-		rkisp1_dcrop_config(rsz, sd_state);
+		rkisp1_dcrop_config(rsz, state);
 
-	v4l2_subdev_unlock_state(sd_state);
+	return 0;
+}
+
+static int rkisp1_rsz_disable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state, u32 pad,
+				      u64 streams_mask)
+{
+	struct rkisp1_resizer *rsz =
+		container_of(sd, struct rkisp1_resizer, sd);
+	struct rkisp1_device *rkisp1 = rsz->rkisp1;
+
+	if (rkisp1_has_feature(rkisp1, DUAL_CROP))
+		rkisp1_dcrop_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
+	rkisp1_rsz_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
 
 	return 0;
 }
 
-static const struct v4l2_subdev_video_ops rkisp1_rsz_video_ops = {
-	.s_stream = rkisp1_rsz_s_stream,
+static const struct v4l2_subdev_pad_ops rkisp1_rsz_pad_ops = {
+	.enum_mbus_code = rkisp1_rsz_enum_mbus_code,
+	.get_selection = rkisp1_rsz_get_selection,
+	.set_selection = rkisp1_rsz_set_selection,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = rkisp1_rsz_set_fmt,
+	.link_validate = v4l2_subdev_link_validate_default,
+	.enable_streams = rkisp1_rsz_enable_streams,
+	.disable_streams = rkisp1_rsz_disable_streams,
 };
 
+/* ----------------------------------------------------------------------------
+ * Stream operations
+ */
+
 static const struct v4l2_subdev_ops rkisp1_rsz_ops = {
-	.video = &rkisp1_rsz_video_ops,
 	.pad = &rkisp1_rsz_pad_ops,
 };
 

-- 
2.43.0


