Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807E4C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mk8cMecKkgbp3ggU8S749d1kXaXxaAI+vjsKjEC/ksg=; b=Wt1fMX1IOZEhEyTV672ovGZf8G
	XDlgH+B5jnJzsZ81+8hWwcPMxHvgRn2dTaZRJFNnJsp0EugYNNmWQWOG331Dsnd+YMKzxkS5j+uGR
	tWM/nDnihEB+WfQR/gw4zlB94kSJv1s4YHFaTOpGqBvXxY51Q5MQxmUFAYax9PWkFbAhlfnq3LW9W
	DInhu3oINlKvKRepfyGRbgjI8rbSsDBHSCnSpmmXfLXvzxwI9kQ5WGTWkO699COq/xagFcSRI1NR7
	ikP2z+SebHgmq3xDJWqFap8NOLRtJPoiftAyTOBYx1hXDNEhksylO2UPhC7i/T8DlONuU3EQKNnsB
	mJW/I3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTi9f-0000000332C-19Gx;
	Mon, 23 Jun 2025 14:28:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfra-00000002auh-3fvq;
	Mon, 23 Jun 2025 12:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680085;
	bh=Wqto3p2O9ygvp/uRrLvFV9jgjx5W1SFttAJN2GmqEow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F6jlQNyhDgrrJI6CjJyW6sR77WpPIbp+QS/von5pm8IBLVOWeqzsdCXkk6XDEdfax
	 U4/BchVKrzWHdEqsT36Y1Wzi0ZUnnObvzUfLP3cBuonTvAx0y2dRBmUJqoN6khHKoK
	 UPyHxQcqiqyiwy+4gxfcks/a85Mw8NUISF0paI/AAqFcRm7MqpMaqspYazDYFSo1tb
	 y4nuINI7/cqgC8/G69Zkz3ObsefyOrHLbETPbRjyqJObQAWzLc/avsvlcTAQC9b7BJ
	 uQ5kV2knV+w1qi9ENxu/O0VOK/mnlWQMmAUCvkoS1Di9wiOvG5n1VufNWvAwfpq5a2
	 LSOs8kal7AifA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E38BA17E156D;
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
Subject: [PATCH v1 3/3] pwm: pwm-mediatek: Add support for PWM IP V3.0.2 in MT6991/MT8196
Date: Mon, 23 Jun 2025 14:01:18 +0200
Message-ID: <20250623120118.109170-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120118.109170-1-angelogioacchino.delregno@collabora.com>
References: <20250623120118.109170-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050127_062569_CED88F76 
X-CRM114-Status: GOOD (  11.32  )
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

Add support for the PWM IP version 3.0.2, found in MediaTek's
Dimensity 9400 MT6991 and in the MT8196 Chromebook SoC: this
needs a new register offset array and also a different offset
for the PWM_CK_26M_SEL register.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pwm/pwm-mediatek.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 38e9e9dc91c6..1fbc84d47543 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -29,6 +29,7 @@
 #define PWM45DWIDTH_FIXUP	0x30
 #define PWMTHRES		0x30
 #define PWM45THRES_FIXUP	0x34
+#define PWM_CK_26M_SEL_V3	0x74
 #define PWM_CK_26M_SEL		0x210
 
 #define PWM_CLK_DIV_MAX		7
@@ -64,6 +65,11 @@ static const unsigned int mtk_pwm_reg_offset_v2[] = {
 	0x0080, 0x00c0, 0x0100, 0x0140, 0x0180, 0x01c0, 0x0200, 0x0240
 };
 
+/* PWM IP Version 3.0.2 */
+static const unsigned int mtk_pwm_reg_offset_v3[] = {
+	0x0100, 0x0200, 0x0300, 0x0400, 0x0500, 0x0600, 0x0700, 0x0800
+};
+
 static inline struct pwm_mediatek_chip *
 to_pwm_mediatek_chip(struct pwm_chip *chip)
 {
@@ -366,9 +372,17 @@ static const struct pwm_mediatek_of_data mt8516_pwm_data = {
 	.reg_offset = mtk_pwm_reg_offset_v1,
 };
 
+static const struct pwm_mediatek_of_data mt6991_pwm_data = {
+	.num_pwms = 4,
+	.pwm45_fixup = false,
+	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL_V3,
+	.reg_offset = mtk_pwm_reg_offset_v3,
+};
+
 static const struct of_device_id pwm_mediatek_of_match[] = {
 	{ .compatible = "mediatek,mt2712-pwm", .data = &mt2712_pwm_data },
 	{ .compatible = "mediatek,mt6795-pwm", .data = &mt6795_pwm_data },
+	{ .compatible = "mediatek,mt6991-pwm", .data = &mt6991_pwm_data },
 	{ .compatible = "mediatek,mt7622-pwm", .data = &mt7622_pwm_data },
 	{ .compatible = "mediatek,mt7623-pwm", .data = &mt7623_pwm_data },
 	{ .compatible = "mediatek,mt7628-pwm", .data = &mt7628_pwm_data },
-- 
2.49.0


