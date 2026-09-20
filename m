Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA21C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 19:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFndLx5Yqc+lsDlrSDVoBXxkYOfQ85XX/QivbJQF5Mw=; b=c2HAK1h3eCem5hCozrDmpkIlF9
	ZfdRBrlCo42aRpvO6Qfchn9slqBBD3zA8j9/rzmJGYQLrIP8LONiT9GUvj9gLVcRjoqyq2wvCJH0e
	kRCDefhnEpZC0IzCd8tEEiNnV0N+9RzwPIXV74q4q1lLZB6IIsZNJyiA79tb6mVQxYHPT/2Dhk6LS
	l4VCFVWPy6d9xxAtV4x3WhWhs0udkXd6ht0q14CkwU+MrjeeOOPFlznDRXT3s3nvDkChQ7NQeiJne
	BSU8SaOtHrHHv0sC5E3rsLziIiF4+b17KLY0V3OGNkGSF1iZW7JKpFeBzIOdZGW3dJpuHMHN4DDdU
	abGjxTqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NUG-00000000Jz2-2seM;
	Sun, 20 Sep 2026 19:46:08 +0000
Received: from mail-oa2-x0f.google.com ([2607:f8b0:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NTz-00000000JpZ-1GGs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 19:45:52 +0000
Received: by mail-oa2-x0f.google.com with SMTP id 586e51a60fabf-470417e5b52so1709356fac.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 12:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933550; x=1790538350; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFndLx5Yqc+lsDlrSDVoBXxkYOfQ85XX/QivbJQF5Mw=;
        b=j4E2xmlAHIN+9V/pwa+q2zlpO66dnOujtRq+ngdZs0dd0v4DYIk5xA1cYL7WFmxvj+
         fZ0O1LwSBr8gsEkdGK1w5ZQNBin3AuHEEGkuP/w3teFAwt8iWsH0d4JlZ88yT3epx9cT
         30F134tZun9PDl6Np9K6hGuWiSYIst2GsYaTqHGPKTiffkfFcfyzvpLD+aGf/jRL6i8i
         lMV6YD2MizOXO6DQFRU2MaygLw+Nk43fvh9Ty0/ud6DAL98FxACB9OfBRFzqeFGfu/50
         CJyTMjoMlsgy3rewDnViFS1jDo7irpUt7W+dlhg5Pn2YNoa32M3QxdQaYgW4vC8fNFny
         hOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933550; x=1790538350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFndLx5Yqc+lsDlrSDVoBXxkYOfQ85XX/QivbJQF5Mw=;
        b=mfOyAVDgYDMZ+CIkRzvvXgE6Cv8CBJgBbxHpb/5t13HHdfQk1szeSvFZwlzC+OM839
         fk70qt/d1VUkHaOZ1Wy8Gf0XLqWJBnZD/NvF6KwEYwX2g8ukeuNukxPs0xmVQ/62poia
         L/wk9wjnroG07C84p0ZoYTYfGVlTVKvXJsefSvSXJX1I8PEeLtUkEFoZ/sM5OxFT9nt7
         TnItIQokMJ/nZlrHMm8QSZGwN52TW1JyM6Vq8SJ/2gO/LCcahBgtcrcGH5w9Mh1C+7ok
         HjncgDYJGm5cQfQOX+SSgQGQPKmn1Y/rJbmrTMeqjEzyRbd43itOqLD1Hsf7gigCAt4O
         7JMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYFgztwayYuVuBcbuGARE9NIilcE+i8odichoNj0oG6dQRaBxaOyCM+43+wWT4xr0rNDE8Q18i3oVsrWQ+I86S@lists.infradead.org
X-Gm-Message-State: AFuF++krbefrGiyUWycSllgwkHY00sgQ+bz6GjidLrwNDx5dfJqHKVwZ
	NpGPuPq1dQYLdScHKVL66e6/QGSghyDIUZ/MeDCVKjZHiTt7ZADi+/s3
X-Gm-Gg: AYBFou0conLuS+LtX/DdA4sbZmfPJJc7oLuXqhEptiBwZShAKRU1fU77lJqlJSpNZpz
	cRYW8n05nR26sM4uhzhWPVia1NDCbjVPeiaD1ZyXIjpWMNWlN1bkw9pJXFkD9X52plJqG9SxfZt
	7iyv2KeP/rXLbGa/2/m6dnD9qnXbOR8xYz7SyYc0Ytld0wXugNH8BJDi72ujB5g1osC9JhCG4Lp
	8ePKquFuTaDjuv8UbY6qoNXKPo1zacGL4CaUTT8wVgmRDAlrDw10sQ9oQDCeh4XcktmJcimLZXt
	oZ3QBlpAhAyDLUPrR4dGfD0wo3M6ANX8AuYiq1Qs7Gws7Y0iP7wqXeuG2gx/tybMuhYMmcgmJAq
	bstiCp+XMzOeFO2MFJ3QRyjds15McB4v61dCcF5We7DcBIBu7LAjKaagl4mnv8myP2jczvPks3i
	0VhN0Chvdy6B+NzyrxbT0C+TbmAbiZ/7CNLSH1wXXhVOljnZJ6oDnGKl0Me/PeY7K1ocrQu3DpL
	trhs+JEu3GO+7DK2YdMjGQD30FI5dR/bNxV+i+QTbaHgikqUv7XaVeZUBnCUqvMGW3SCLtQfK0Z
	fPuUzqSzdeHK5gK9Blu9DW5X8dxf9aQabFkDLDtGT+u6ruCuYcRWU32uvzd5qhYUff3AXtyNEW+
	jRiVzM9L9u1/OvCgo6iXZ
X-Received: by 2002:a05:6820:16a6:b0:6bd:af9e:a7f8 with SMTP id 006d021491bc7-6ca9a130336mr7595370eaf.10.1789933550220;
        Sun, 20 Sep 2026 12:45:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:32 -0600
Subject: [PATCH net-next v4 6/6] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-6-8347dfe2eb7d@gmail.com>
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
In-Reply-To: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_124551_356332_BF3BC27A 
X-CRM114-Status: GOOD (  13.38  )
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

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. It connects internally to the
co-packaged AC200 or AC300 EPHY and has no external PHY pins.

Add an EMAC1 variant using the dedicated register and enable only RMII.
Leave PHY initialization to the PHY driver instead of using the H3
internal-PHY controls. No RX or TX clock delays are configured for this
RMII-only variant.

Co-developed-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 9598c386bb21..0ea1860cf203 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -81,6 +81,13 @@ static const struct reg_field sun8i_syscon_reg_field = {
 	.msb = 31,
 };
 
+/* EMAC1 clock register @ 0x34 in the "system control" address range */
+static const struct reg_field sun8i_syscon_reg_field_emac1 = {
+	.reg = 0x34,
+	.lsb = 0,
+	.msb = 31,
+};
+
 /* EMAC clock register @ 0x164 in the CCU address range */
 static const struct reg_field sun8i_ccu_reg_field = {
 	.reg = 0x164,
@@ -143,6 +150,13 @@ static const struct emac_variant emac_variant_h6 = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_h616_emac1 = {
+	.syscon_field = &sun8i_syscon_reg_field_emac1,
+	/* The co-packaged AC200/AC300 PHY does not use the H3 PHY controls. */
+	.soc_has_internal_phy = false,
+	.support_rmii = true,
+};
+
 #define EMAC_BASIC_CTL0 0x00
 #define EMAC_BASIC_CTL1 0x04
 #define EMAC_INT_STA    0x08
@@ -1277,6 +1291,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
 		.data = &emac_variant_a64 },
 	{ .compatible = "allwinner,sun50i-h6-emac",
 		.data = &emac_variant_h6 },
+	{ .compatible = "allwinner,sun50i-h616-emac1",
+		.data = &emac_variant_h616_emac1 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_dwmac_match);

-- 
2.53.0


