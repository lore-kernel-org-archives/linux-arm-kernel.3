Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3E4C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 19:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3DFUfXqvkAAqLQZFN4Ckoxh3RRXE+KNp2R9hzzLROaA=; b=S+ArMZZKWWYt3roDqwr9mBHH4C
	Jjk6TNTmnsonGCK8lTPz3X2sQ00kHJzD6oI2/m3KOPITzXyKxngE66hy2MAfxv/W+0V052PJTjq3I
	QpSn2Cg4DfQuZ/V0i4vGASIpKjB1j95Vj0eVXkRZ6URmtP4bbYJHGhU21c1ucBmHbD3qJ7Eiv9WDs
	tj2lO6cWiJrN0jST6mJmNwihN6xJuUC3L+WNb8KZy2ubyyg09n3DPa/dppBMIHgeXvKei21/wdb+i
	J/ot6ex323WP+33sKpD+8T8j3ooVwkpv63ySnfsq8uGIYPgH3B6LMnb17s0XhM9Yo0fXqigcyu+Dq
	R7tjWxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2b9h-00000008KM2-0UIi;
	Wed, 09 Apr 2025 19:32:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2b7t-00000008K19-3LBe;
	Wed, 09 Apr 2025 19:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744227019;
	bh=t4u/q6sRSEWyUERde3llNPL9IiDRHYERj2C5djskamU=;
	h=From:Date:Subject:To:Cc:From;
	b=JS6FVVeUIqgnOONv0XQvXmw23VuDLc0E+7Lvwj5TkaBPfw+pUJHu9qbA4mEX6PxO9
	 JMJgAi/Rbky3lZHs8fI4/ZRrzUSzqB6sYmoPjPd7yPJ+hfGD2P139zBbIufjfAZw0o
	 WT59HFDZgjW+uySU1J3fhYJHfmLsg+W+q++5+TIa57oK9RE6vO7mCPF96Ar9ra/R5E
	 IuoS2wTFpjjrxRtzkapjpCcT7IjT3e5BCkZ94hpok3QtRanuTDKCYF+Maci7gZq8Wi
	 yTtxNOPVZivIPGzHHQdbu/PIh2CBoZM1NCBvlb3LA8f8o4DafdDmpbSZo3iJG/YRE0
	 OecnRd0sDQ9yQ==
Received: from [192.168.13.180] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 19FBE17E0125;
	Wed,  9 Apr 2025 21:30:17 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Wed, 09 Apr 2025 15:30:09 -0400
Subject: [PATCH] media: verisilicono: Enable NV15 support for Rockchip
 VDPU981
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-b4-hantro-nv15-support-v1-1-7e11e47fd0c9@collabora.com>
X-B4-Tracking: v=1; b=H4sIAMDK9mcC/x2MywqAIBAAfyX23IKZIvQr0aHHVntRWUsC6d+Tj
 jMwUyCRMCUYmgJCmRMHX6FrG1jP2R+EvFUGrbRVRvW4GKz+koA+dxbTHWOQC5XbaDfkZts7qHE
 U2vn5x+P0vh8u04MLaAAAAA==
X-Change-ID: 20250403-b4-hantro-nv15-support-07def4e7a537
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_123021_988780_D04DF88B 
X-CRM114-Status: GOOD (  11.11  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This is a "customer" format, though on Rockchip RK3588 it has been
verified to be NV15 format, which matches what the GPU and display
handles has 10bit pixel formats.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c           |  1 +
 .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c      |  4 ++++
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c       | 14 ++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 2bce940a58227c2bfef2bc3343992e4588ab36a4..7c3515cf7d64a090adfb8d8aff368f9a617f8c8a 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -77,6 +77,7 @@ int hantro_get_format_depth(u32 fourcc)
 	switch (fourcc) {
 	case V4L2_PIX_FMT_P010:
 	case V4L2_PIX_FMT_P010_4L4:
+	case V4L2_PIX_FMT_NV15:
 	case V4L2_PIX_FMT_NV15_4L4:
 		return 10;
 	default:
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 69b5d9e12926fb408c08f8ba2139d05ba44389b7..e4703bb6be7c175a89c0b8868cf2eafb84a872ed 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -2202,6 +2202,10 @@ static void rockchip_vpu981_postproc_enable(struct hantro_ctx *ctx)
 	case V4L2_PIX_FMT_NV12:
 		hantro_reg_write(vpu, &av1_pp_out_format, 3);
 		break;
+	case V4L2_PIX_FMT_NV15:
+		/* this mapping is RK specific */
+		hantro_reg_write(vpu, &av1_pp_out_format, 10);
+		break;
 	default:
 		hantro_reg_write(vpu, &av1_pp_out_format, 0);
 	}
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 964122e7c355934cd80eb442219f6ba51bba8b71..f7c4a176167b40fe79ec5a6759dff8a77e849ae3 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -92,6 +92,20 @@ static const struct hantro_fmt rockchip_vpu981_postproc_fmts[] = {
 			.step_height = MB_DIM,
 		},
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV15,
+		.codec_mode = HANTRO_MODE_NONE,
+		.match_depth = true,
+		.postprocessed = true,
+		.frmsize = {
+			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
+			.max_width = FMT_4K_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
+			.max_height = FMT_4K_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	},
 	{
 		.fourcc = V4L2_PIX_FMT_P010,
 		.codec_mode = HANTRO_MODE_NONE,

---
base-commit: 9ddc3d6c16ea2587898a315f20f7b8fbd791dc1b
change-id: 20250403-b4-hantro-nv15-support-07def4e7a537

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


