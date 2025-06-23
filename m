Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60069C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xt7OUTrywPktYOJiuZd2evNh+8FRdKWZrQtH2q8IKGQ=; b=3op6E1yz27JsZlQwHVKJWgFgsT
	y3oH2qIprBDL9n/0RMsSLBlrBFqelpvxlvunz0sDAN+4UqrnsBf6ZWlGEVdv7/MNeP8KbwB62c73k
	1wgclIrm3aY/CwxuMtsCJz7r/lxKu35ejw9sLB0VkQ1kb4CZjVNaYbECI94QnxJjJkEzJt2XDq1Jj
	jS/651nRIKXrrJnnoCGydtd0Y3pWGAuTfMrLRLpvzxv4knOmE5MdCb56auK1XNCx45ZZj++WLZxk1
	uYMHK66sO+d2HZNYPgth60XTJlcCILCIQsZV6aFwvz6UGDyH5ighxFCwc5jDwr5qI9t3nNzzZXU5a
	6NOmlQmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTi7M-000000032bq-4522;
	Mon, 23 Jun 2025 14:25:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfra-00000002auO-08tW;
	Mon, 23 Jun 2025 12:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680084;
	bh=jSa1CeNENoFw2VoytQdb/vKwJWtYXw3LRI1EfB29zsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hz+rDVLFYVk9aesmFoK7AUvOnSCgSNGelPgUL8KirXBzeGKQK7/JpbImOKHbqeWYo
	 Qq4/+fNuG46SUyxlpO8zc0obuD6adi2PIdw3kNLsEojIVs/jowOIUANu6vAvX3/16/
	 VEH1KxQ0Z2Iq0vzIqEXCDLoVSjV+0gTCNlwbGSnhTQrY3p5YO2IUeQACD69olNEwtX
	 Hlyib3bfzTt185zoixW9BnDXDSAOKX2C6Cp8mFrWOKgRzTMnhyZLHAWaoL00jJvVZI
	 SmUjkSpS3kJ8Tc2PSZwKm3JQ0QmQmJTCogdeZTceX+efIdKjEKWXyRNfDWJMjU3rGB
	 wQHn3WINjsOEA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 10E8717E090E;
	Mon, 23 Jun 2025 14:01:24 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ukleinek@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	john@phrozen.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 2/3] pwm: pwm-mediatek: Pass PWM_CK_26M_SEL from platform data
Date: Mon, 23 Jun 2025 14:01:17 +0200
Message-ID: <20250623120118.109170-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120118.109170-1-angelogioacchino.delregno@collabora.com>
References: <20250623120118.109170-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050126_240863_7B15EC0E 
X-CRM114-Status: GOOD (  14.56  )
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

In preparation for adding support for new SoCs, remove variable
has_ck_26m_sel from pwm_mediatek_of_data and replace it with a
u16 pwm_ck_26m_sel_reg, meant to hold the register offset for
PWM_CK_26M_SEL.

Also, since the reg offset is guaranteed to never be zero, the
logic to check for "has_ck_26m_sel" is changed to check if the
register offset in pwm_ck_26m_sel_reg is more than zero.

Analogously, when writing, use the register offset from platform
data instead of using the PWM_CK_26M_SEL definition.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pwm/pwm-mediatek.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 7eaab5831499..38e9e9dc91c6 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -36,7 +36,7 @@
 struct pwm_mediatek_of_data {
 	unsigned int num_pwms;
 	bool pwm45_fixup;
-	bool has_ck_26m_sel;
+	u16 pwm_ck_26m_sel_reg;
 	const unsigned int *reg_offset;
 };
 
@@ -134,8 +134,8 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		return -EINVAL;
 
 	/* Make sure we use the bus clock and not the 26MHz clock */
-	if (pc->soc->has_ck_26m_sel)
-		writel(0, pc->regs + PWM_CK_26M_SEL);
+	if (pc->soc->pwm_ck_26m_sel_reg)
+		writel(0, pc->regs + pc->soc->pwm_ck_26m_sel_reg);
 
 	/* Using resolution in picosecond gets accuracy higher */
 	resolution = (u64)NSEC_PER_SEC * 1000;
@@ -291,84 +291,78 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 static const struct pwm_mediatek_of_data mt2712_pwm_data = {
 	.num_pwms = 8,
 	.pwm45_fixup = false,
-	.has_ck_26m_sel = false,
 	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt6795_pwm_data = {
 	.num_pwms = 7,
 	.pwm45_fixup = false,
-	.has_ck_26m_sel = false,
 	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt7622_pwm_data = {
 	.num_pwms = 6,
 	.pwm45_fixup = false,
-	.has_ck_26m_sel = true,
+	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
 	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt7623_pwm_data = {
 	.num_pwms = 5,
 	.pwm45_fixup = true,
-	.has_ck_26m_sel = false,
 	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt7628_pwm_data = {
 	.num_pwms = 4,
 	.pwm45_fixup = true,
-	.has_ck_26m_sel = false,
 	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt7629_pwm_data = {
 	.num_pwms = 1,
 	.pwm45_fixup = false,
-	.has_ck_26m_sel = false,
 	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt7981_pwm_data = {
 	.num_pwms = 3,
 	.pwm45_fixup = false,
-	.has_ck_26m_sel = true,
+	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
 	.reg_offset = mtk_pwm_reg_offset_v2,
 };
 
 static const struct pwm_mediatek_of_data mt7986_pwm_data = {
 	.num_pwms = 2,
 	.pwm45_fixup = false,
-	.has_ck_26m_sel = true,
+	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
 	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt7988_pwm_data = {
 	.num_pwms = 8,
 	.pwm45_fixup = false,
-	.has_ck_26m_sel = false,
 	.reg_offset = mtk_pwm_reg_offset_v2,
 };
 
 static const struct pwm_mediatek_of_data mt8183_pwm_data = {
 	.num_pwms = 4,
 	.pwm45_fixup = false,
-	.has_ck_26m_sel = true,
+	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
 	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt8365_pwm_data = {
 	.num_pwms = 3,
 	.pwm45_fixup = false,
-	.has_ck_26m_sel = true,
+	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
 	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
 static const struct pwm_mediatek_of_data mt8516_pwm_data = {
 	.num_pwms = 5,
 	.pwm45_fixup = false,
-	.has_ck_26m_sel = true,
+	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
 	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
-- 
2.49.0


