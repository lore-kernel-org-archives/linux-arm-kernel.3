Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5636606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y0e0UEr4;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=gNA9xwHb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tRxob/FxqAp29srzAeWyBdjeoKfBU9kvQtAvBNpJeC0=; b=Y0e0UEr4bA51Sr
	E0qWjeWZAknseIxWFD5MoPdLYnAN20gpifGc7AnKSkk1sSnbuOw4RsKtKLNToS3EbpSFvPck81Zme
	BMRzBfn+io6ruH8sAX+YLHsjTtIDOvXyFFsu46PA24QV2hm+nfJ2A1ruO96SmsuiTEgbAJHnVbq5U
	qkJqKGQJ79GicbfT3xrI6A7DJvkZPzIRvl3nwEe3kUrjywP9zIV4Yr4KmukS1GAl3VLlbZJ0tCUsT
	59ICZ5iq3G/oDZjIbRnO9TVQYcxAt+IVpS2A8zdWPqc4prDHrPu+2/bwD9tJ+ciTi4TYmxAqnaT2i
	TBzwwDpk1EUkJNF2Vuyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9FF-00000001QUr-0V4h;
	Tue, 03 Nov 2026 07:47:52 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9FB-00000001QR6-08CI;
	Tue, 03 Nov 2026 07:47:47 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC7DE52DE;
	Tue,  3 Nov 2026 08:38:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691540;
	bh=11aYblGNBtQIBApYpdqYmjnXa74aTPYSIDEjpIOfSzE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gNA9xwHbF6wZX2O98sBr/LLOK6ZLI24gnqUXwiDaGhCMYXsrAmSlFGmboc51QdHJS
	 yCznkyZpu+H8X7qyhO71eVIUDOXfN591q7qhVx96HzyEAMcMac39FH6bIr+qczsN9t
	 i952MMht5fOcAdqzVC0eAiBK3mADE/nbhO3SflHM=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:52 +0000
Subject: [PATCH 16/16] media: rkisp1: Allow a live stream to suspend and
 resume
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-16-08f863b6fdc5@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5783;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=11aYblGNBtQIBApYpdqYmjnXa74aTPYSIDEjpIOfSzE=;
 b=kA0DAAoByElXemxFdTIByyZiAGrpkBLI1fvNHWJr1qce5HfSwQohY9y3FVuIXvAX1ZPQI3/KM
 okCMwQAAQoAHRYhBCrK7DIOdl1v6bGab8hJV3psRXUyBQJq6ZASAAoJEMhJV3psRXUyScEP/Aj2
 +U/gsw6Tp6NU21zqDmQOH8Z4ocNDEDIqjEI2VlUQc2IQrS0lc4RX/eneH5lnhzAOYKSH6BQnRC3
 86woIZ5jjGxAxSTRFGa4UZNRMvhahNn9fQ0kwxyimgkxhlCAmxBnncezErumliFxzGHn9EzMSwb
 yAMp68YbKBChyDGAaOGSeHpqyOwEOlh1etdrjqH3D6A672HLJY6A64z29YWKXTvUTd4bu2G+0+H
 TwVBU2gwVdvzv8187mfazGO8b2OT/NWTmK9Rb+vbVhByOJsoG/6u0NeEjjR9KRzQ92lkM9V0nRS
 V8KZPRlEvx6TYpZWu802dQ97V9Sox9h/GaBmljWkt3OuRaG7ehb5OZ4yJHIlJ4d5xF3rtYwy9cx
 L8wxo1UEPFai5JbHgjkpHSnSAfGSJff1veZEp1Xz7MlCYAUJTYvHMl3zcLgvHVm0u3KRYk/qul+
 rQAY/hdIZdiRl11VXoZh4GOpekjcoalWumOK9iNafiM7vGf8wx0NXvpIfDuaIcbh9pNTlNR4EpR
 QzkokLTKiAjgdTiIWRolPPbeGHTK3ScQxUAFWTMOqHBEMiM9tuCnBGoZcefXqqVKBlGX3IQCn+1
 P6FLpTxV4CJ5w2wQQXWGlYK67YZz1ep8HUeJqHtg6NGOcpbsR/R7ewIRtFoL3gQH5QaNZHaoQCA
 GyDdZ
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234745_254949_18772952 
X-CRM114-Status: GOOD (  20.82  )
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

At present the rkisp1 driver makes no provision in its suspend and
resume operations for a live stream. The effect of this is that if
userspace is streaming images through the ISP and suspends to RAM,
upon resuming the system that stream has died, but userspace has no
visibility of that.

To resolve the problem check if a VB2 queue is streaming in runtime
suspend and if so, tell connected subdevices to stop streaming and
mark all buffers as returned to userspace. On runtime resume, check
again if a VB2 queue is streaming and if so set tell the connected
subdevices to stream again. Userspace will - when unfrozen - process
the returned buffers and requeue them ready to receive images.

Because the hardware will have been power-cycled and therefore lost
its configuration, reapply the parameters buffer to restore as much
of that as possible.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
This patch re-applies the last-applied params buffer.

The driver can use the extensible parameters format, in which case
the majority of frames will not have the full configuration. Most of
them will only contain rapidly changing settings like AWB gains, and
in that case unless the scene has not changed at all (which does not
seem very likely) then they will be out of date anyway. If userspace
has configured the extensible format then at this stage the
reapplication of parameters is probably not that useful, but I have a
follow-up series which will handle that more fully.
---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  1 +
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    | 28 ++++++++++++++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 18 ++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 8f379a783da1fa97a330a7ec547354eb936cfadd..94f03310e92f110062313bf2a34afb0692d9122c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -697,6 +697,7 @@ void rkisp1_stats_vb2_return_all_buffers(struct rkisp1_stats *stats);
 void rkisp1_params_vb2_return_buffers(struct rkisp1_params *params);
 void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
 			       enum vb2_buffer_state state);
+void rkisp1_params_reapply_config(struct rkisp1_params *params);
 int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap);
 void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap);
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 9f1d0f72ee9bf4364c696d9fdd8febea80d2bcde..d9c7500c92d810763775417a32f6850f48825398 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -307,6 +307,22 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
 {
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
+	bool active_stream = false;
+
+	for (unsigned int i = 0; i < rkisp1_path_count(rkisp1); i++) {
+		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
+
+		if (rkisp1_vb2_is_streaming(cap)) {
+			active_stream = true;
+			rkisp1_pipeline_stream_disable(cap);
+			rkisp1_return_all_buffers(cap, VB2_BUF_STATE_ERROR);
+		}
+	}
+
+	if (active_stream) {
+		rkisp1_stats_vb2_return_all_buffers(&rkisp1->stats);
+		rkisp1_params_vb2_return_buffers(&rkisp1->params);
+	}
 
 	rkisp1->irqs_enabled = false;
 	/* Make sure the IRQ handler will see the above */
@@ -333,6 +349,7 @@ static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
 static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
 {
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
+	unsigned int sequence;
 	int ret;
 
 	ret = pinctrl_pm_select_default_state(dev);
@@ -346,6 +363,17 @@ static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
 	/* Make sure the IRQ handler will see the above */
 	mb();
 
+	for (unsigned int i = 0; i < rkisp1_path_count(rkisp1); i++) {
+		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
+
+		if (rkisp1_vb2_is_streaming(cap)) {
+			sequence = rkisp1->isp.frame_sequence;
+			rkisp1_pipeline_stream_enable(cap);
+			rkisp1_params_reapply_config(&rkisp1->params);
+			rkisp1->isp.frame_sequence = sequence;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 1f08b57e616159a389411e13f9217c4f4fcddd57..f440e15afc74c029510e0777a9ec2f6ea4d5be88 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2326,6 +2326,24 @@ static void rkisp1_ext_params_config(struct rkisp1_params *params,
 	}
 }
 
+void rkisp1_params_reapply_config(struct rkisp1_params *params)
+{
+	guard(spinlock)(&params->buf.lock);
+
+	if (!params->buf.curr)
+		return;
+
+	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
+		rkisp1_isp_isr_other_config(params, params->buf.curr->cfg);
+		rkisp1_isp_isr_lsc_config(params, params->buf.curr->cfg);
+		rkisp1_isp_isr_meas_config(params, params->buf.curr->cfg);
+	} else {
+		rkisp1_ext_params_config(params, params->buf.curr->cfg,
+					 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
+					 RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
+	}
+}
+
 static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
 					  struct rkisp1_params_buffer *buf,
 					  unsigned int frame_sequence)

-- 
2.43.0


