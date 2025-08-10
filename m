Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925F3C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 23:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PimwDS8LC37CYWaFf7XT6w/idZMKOZ2fzD26lIMQhVg=; b=40DT+INsIGv1btYM968BGC/wkL
	qVdFokW6bmiwsY+nW0FVrr2YJX0NKTjNzja4L4VLVU+Ir1n2GD39jl6Y4RniSbYX3zgAeynx5lgSu
	s9Sd6TXXThXPlhWa+RQ+E+iRwurKBtaOeJ2kK9kfBmYDNtnj8/pl2jc0GSbWgCQ6XuhgRQ8D1tZKe
	9WzkqdUuoKPkCbCVnPM7rnAlAkWAJ2zUtXLQ9x8BAck7s+0/Plk4fEmPltCeIKWvc5mwlsSQqAdPO
	KvWF6GDPyJaI+eJZnbk54UHgA3wr9X6RCSLwjLiqsfP8/MU5Gfedx5oA7lhWsdK7rxou4bRgXTv8+
	3Y9PFDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulF1T-000000069mK-0tqv;
	Sun, 10 Aug 2025 23:00:15 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDso-000000064Ia-0Bd8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 21:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1754862433; bh=PimwDS8LC37CYWaFf7XT6w/idZMKOZ2fzD26lIMQhVg=;
 b=uwBHJpr8QK3f+MvsxQVE/sel6ZZsMrjloUDEGORyICSO72Ow5pfXPafGWE6GwkZnDoEsYRIsO
 RyC2Bnl+bLouPbf3gKPDwfY4/hZ4D2dq/W/fKpGQgKvlqxCbpf4Gyibgx/iwFj4uQfQ7V4nksD8
 vgRFQVxLC3bFj3ELVW89Ac8xNFUQ9mKbLDhq4bP9pdBn6+iAJnzirZwCJ8JxlEZSKfTvZxENVtk
 xBhILZWDZMN/gc2vld0saW6rCoq7LrA60Q2E9DRoGmJhFxfFaXc8FXqGZ8EPvJWCqd4SUVASLEi
 nBfs+b+lfwFKtBLWET2UZV3Fjo71EUSelzeOPOd6RzxA==
X-Forward-Email-ID: 68990e6b797ab8962779245a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 5/7] media: rkvdec: Disable QoS for HEVC and VP9 on RK3328
Date: Sun, 10 Aug 2025 21:24:35 +0000
Message-ID: <20250810212454.3237486-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810212454.3237486-1-jonas@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_144714_125741_34DB117D 
X-CRM114-Status: GOOD (  15.73  )
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

From: Alex Bee <knaerzche@gmail.com>

The RK3328 VDEC has a HW quirk that require QoS to be disabled when HEVC
or VP9 is decoded, otherwise the decoded picture may become corrupted.

Add a RK3328 variant with a quirk flag to disable QoS when before
decoding is started.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c |  9 +++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h |  2 ++
 drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c  | 10 ++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c      | 12 ++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h      |  4 ++++
 5 files changed, 37 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index 1994ea24f0be..f8bb8c4264f7 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -789,6 +789,15 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
 	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
 
+	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
+		u32 reg;
+
+		reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
+		reg |= 0xFFFF;
+		reg &= ~BIT(12);
+		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
+	}
+
 	/* Start decoding! */
 	reg = (run.pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) ?
 		0 : RKVDEC_WR_DDR_ALIGN_EN;
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
index 540c8bdf24e4..c627b6b6f53a 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
@@ -219,6 +219,8 @@
 #define RKVDEC_REG_H264_ERR_E				0x134
 #define RKVDEC_H264_ERR_EN_HIGHBITS(x)			((x) & 0x3fffffff)
 
+#define RKVDEC_REG_QOS_CTRL				0x18C
+
 #define RKVDEC_REG_PREF_LUMA_CACHE_COMMAND		0x410
 #define RKVDEC_REG_PREF_CHR_CACHE_COMMAND		0x450
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index 0e7e16f20eeb..cadb9d592308 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -824,6 +824,16 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
 	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
 
 	writel(0xe, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
+
+	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
+		u32 reg;
+
+		reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
+		reg |= 0xFFFF;
+		reg &= ~BIT(12);
+		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
+	}
+
 	/* Start decoding! */
 	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
 	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index c20e046205fe..d61d4c419992 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1226,6 +1226,13 @@ static const struct rkvdec_variant rk3288_rkvdec_variant = {
 	.capabilities = RKVDEC_CAPABILITY_HEVC,
 };
 
+static const struct rkvdec_variant rk3328_rkvdec_variant = {
+	.capabilities = RKVDEC_CAPABILITY_HEVC |
+			RKVDEC_CAPABILITY_H264 |
+			RKVDEC_CAPABILITY_VP9,
+	.quirks = RKVDEC_QUIRK_DISABLE_QOS,
+};
+
 static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
 			RKVDEC_CAPABILITY_H264 |
@@ -1237,6 +1244,10 @@ static const struct of_device_id of_rkvdec_match[] = {
 		.compatible = "rockchip,rk3288-vdec",
 		.data = &rk3288_rkvdec_variant,
 	},
+	{
+		.compatible = "rockchip,rk3328-vdec",
+		.data = &rk3328_rkvdec_variant,
+	},
 	{
 		.compatible = "rockchip,rk3399-vdec",
 		.data = &rk3399_rkvdec_variant,
@@ -1267,6 +1278,7 @@ static int rkvdec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rkvdec);
 	rkvdec->dev = &pdev->dev;
 	rkvdec->capabilities = variant->capabilities;
+	rkvdec->quirks = variant->quirks;
 	mutex_init(&rkvdec->vdev_lock);
 	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 8e1f8548eae4..e633a879e9bf 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -26,6 +26,8 @@
 #define RKVDEC_CAPABILITY_H264		BIT(1)
 #define RKVDEC_CAPABILITY_VP9		BIT(2)
 
+#define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
+
 struct rkvdec_ctx;
 
 struct rkvdec_ctrl_desc {
@@ -69,6 +71,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 
 struct rkvdec_variant {
 	unsigned int capabilities;
+	unsigned int quirks;
 };
 
 struct rkvdec_coded_fmt_ops {
@@ -121,6 +124,7 @@ struct rkvdec_dev {
 	struct delayed_work watchdog_work;
 	struct iommu_domain *empty_domain;
 	unsigned int capabilities;
+	unsigned int quirks;
 };
 
 struct rkvdec_ctx {
-- 
2.50.1


