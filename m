Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAADFC98338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 18:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AU4yKGQ6L9A+Mmj7ksqDUcZd7jKkYCDxeCg2XUTgNgQ=; b=pvE6D1oiRqNhKuvQ+M1cOM6k8S
	THpIp+Bh344WhX1RL11ht6bEXran/XaPovcgyYhOmlC2HU8Y4EkksHhBZK2RLMRknEtz3o56/ybbg
	aoOaB20eAtmXCj1hjORu5CzdS94+R1GbkbsA+DPAZoZZRPiK0RVjRPkE96KU5C6D6fhHKB9kUl0TH
	LGI99dubrfFXE1AbHqy0L9iyFeAOGjjX078aeC7PAnhI9oRm0ZczSGNqERrriO5qb8wC0m9YpNjyA
	n5rkyBYPmsM0LHPyTxjJwduJbhT6rTshIFwsSXI9WF5gtRBspalbdYx6D3SX5b80aPDd4RC68Xfzd
	L0/dV/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAtzO-0000000GihA-0Re5;
	Sun, 27 Sep 2026 18:52:42 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAtzJ-0000000Gif2-0G6t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 18:52:38 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466ccde2ad8so1511872fac.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 11:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790535156; x=1791139956; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AU4yKGQ6L9A+Mmj7ksqDUcZd7jKkYCDxeCg2XUTgNgQ=;
        b=m/7SvO+K2c7jwDbG9ncrwGqzxS0ww2oT0VYHeEaXzm67VVlmwFVo2SNccMepNXLd06
         ikRzOhg989TNeUHP0tkS1+dZ+1ghxZnFiw79vOyhDmmTKJ0rk+i2n2Tw2virF9zHc8QR
         hVfQel4auu+FfqOaM5HBrx/6iCn1rQLyptZBmnHxvJbWCDdsKZLqHfwPV1EIavvkkV++
         PHlJpHbmCw1jKHw4Zmfl/A/KracBwkJCA7I6HDvvGhi5l92S1XGe1AW5iU3pO0PCmPgk
         dKHraOsy8PagmsflxRSZ1uQpjeIuxGMgeOuF2lvPfNbrL13U56RH4USsrj+QVNByoOis
         0bPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790535156; x=1791139956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AU4yKGQ6L9A+Mmj7ksqDUcZd7jKkYCDxeCg2XUTgNgQ=;
        b=tSnEJQK1WqdrRBdFJ61Nn1U/LamjjBr/wGqs/QyrUFP1OdmOZeMzVPdD7SYY3IXT0L
         ZzDh0JG+xQj5q7i13wGwiXiW16r7a2iQGypdZ+c8rX0zgD5TQuvWyNQgz3FFOZErITl2
         owSZciPaPbb8Tkz/a+Be5YNQgi+JNrU06z4/ILV4olbN34SWLmMaxTfFL7+1xHswpYHT
         xt7g+4rPaO1hjUf2ETPYwU01ZJBngBHAUfWIZ+EjN+042N4XTGS8hhbJ0Zh1ZYoyxuC6
         sLztcI7DFtTBcnBHgc813lRgnwVDZ7O3d3PGQsIuZR/pkcOaE8jB+HbJZ8vcqClk7DYJ
         BXEg==
X-Forwarded-Encrypted: i=1; AKwUvBwxCtfFD5CcNQS6u5vNH28gils642yXMSK/EDkTjn1y7STEjz3/M5IEL66My2sAXDG8iuKh8eckZQQYuEOj7Y/P@lists.infradead.org
X-Gm-Message-State: AFuF++md1XSYoF8q5TBuvrqVN3tkfZ1JRaKB79pAFC7veBOww+o+JI5k
	25BgTS7pnZvqUuPJaTnjyAFBnI7gakCGgcH9MtusePc/yEgWt1dKiupk
X-Gm-Gg: AYBFou2iZrQtIR4pe1iEmJp16dNaQ5h3FD8OM1BEwjceCmvWVmlS5xEZ4EIEdGCcWgV
	UnQZBknE1Ecpq4UrG34VwoMAgnnJSWq7MYiGNafzQdecW2rqri4cBpWBGBdxxpRhGkRoQk8RJ51
	z0xtDrBhCCZzSlJ2Hr3JuuI7q+tgZCyMahS+QRuPmZaedjaQKBJoFr22+BzY3XRQYdwL+olVmx/
	9/QUzACglJNUM7h6cDCQmVn8uzEMLLnurIfQAof1WBOalsKXcsLx8rHm7DPojH37WW8kmirxHQC
	ESkFMJTzKAfemIjc+pHMp04oeZpd6fdJUP85xhMCukgjy2amhXgKPNM8siLhEsKmrFdr8Lc4BZa
	LOHUHlklyngRYkSIr7uNV2xeBy64ledaSKtm7LyMBs9EQcSegnKnaxaW0gXQvvdfFxkBwq61vQ1
	QPNHgCngfbcWbxd3Y1mfEDS3PzYmicXaRRmFWM6mM6EWL06kWRCWCqA6bdq6b/QBXqqdPcMhfFI
	6DTr3QLA920k2B0yC8k7PLZ6bDgr+4VG1yqb3cODMAkSZm/pMNTDkgfJ182QOJ+qjok6CxaEl/j
	lnWaYS3lYNhWV7B6RWY1OC6f2j/HqtSID5tr4QY/vz8ahbVKvEu4LWk5omfNBVhL8qH/dKKg5eG
	bqKPGc3CDRRrkX71rRrfB
X-Received: by 2002:a05:6871:1d2:b0:47b:dbb4:7cbb with SMTP id 586e51a60fabf-491e4f73b4bmr12418319fac.14.1790535156264;
        Sun, 27 Sep 2026 11:52:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-494877590e5sm4489452fac.13.2026.09.27.11.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:52:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 12:52:21 -0600
Subject: [PATCH net-next v6 3/3] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-h616-emac1-v1-v6-3-e64971f4e414@gmail.com>
References: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
In-Reply-To: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: Alastair D'Silva <alastair@d-silva.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_115237_119299_D5615395 
X-CRM114-Status: GOOD (  13.20  )
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
index 5691da796454..47954537b29e 100644
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
@@ -1281,6 +1295,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
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


