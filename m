Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F652C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 03:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxECogFnkMA6SSiFQYeE519yjpa6TKSl2zEHDB706vw=; b=UjprgvuKze1rcU9UD8Bnl1Zq0r
	S+EFmIAzUkTDhfrdeVIQJaSWJGD10Yri/gfiGsWE6Xtjc4vg0KotQD2HTNcO1q9R52IivKonYpUhJ
	muV02MvXOu9wismwvJbo+FqSGKPGgri4+FkomB8Yf0+0EFdtwUNzHdCfPs1LXHP+QOZPX4fYrh/FO
	IfDke7WmL90Sxl9EHETFEOm/ZXxnB7+MMiB/bN5Yik9WV0Klp87H8grx4KQP1ORpG2nvdT8mCL6Jp
	+yw3GxLTc8kKBuJmGx9k3CQS4Du1eprH2FGWWWHxqMsa4g1A2OvhdKL6go4GWWy/jPDrOWqlaWBh1
	CxtEfgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6g0g-00000008DkR-1b8Z;
	Wed, 16 Sep 2026 03:08:34 +0000
Received: from mail-oo2-x1b.google.com ([2607:f8b0:4864:31::1b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6g0a-00000008Dip-0rmY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 03:08:29 +0000
Received: by mail-oo2-x1b.google.com with SMTP id 006d021491bc7-6c72bd8a02fso275488eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 20:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528107; x=1790132907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxECogFnkMA6SSiFQYeE519yjpa6TKSl2zEHDB706vw=;
        b=hI2E7VzGA7OQEAdNe2GOdpZ+ozLH6XlBomFMp3ztfwGjzd6qnK8fZLOsevG43iD0Qz
         qd3est5Kv0VsGrS0Mk6hJucM8RFvFB1EomyerPvId+kX0nlWMy1z0wXssUuP4D2+vZEf
         9h4htzljrzJ7lUK7t+h1FhpptSz7e6N5ZDI8knAW3wQHFCRuoaT99JDsKO8Is4C+jMvD
         Pp85Lqe7EkmtuFHoEjpkhRHWS/8JtSHxygx1IQIq9RF2DY05s1NCZQZxxMNmaN4Jw32V
         ftUdTujH299SoqOn8RRwhBHbtIozH7asASCl2HAWSqBfF4IVThnry2v3NWKyOuUlthQ5
         0djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528107; x=1790132907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AxECogFnkMA6SSiFQYeE519yjpa6TKSl2zEHDB706vw=;
        b=TaeN1cBrF70o3Eq0VwCP7Kvx+w2GjYXhACTFdEDXfgduzxNFSiMBuNAykz8iA4Axyj
         mJuvrZhYE3gmjWdcB1+Hwqrgw1Jk9L69elEMGR1Gsk+w3mQpziW1mSubpeocbON7fsjq
         T5fnj2oZ5HNdBfPULQrkqbL9plcLp1zz1TteCKQkOcGxOVtXexkgT7/IgMwcSTaM3Qh9
         Eh+AxAPS+qdNwMQs4P4RbyDY/vd1l9k4x873PnWKHDfMj0cdisspMuzXYG5D2k3qIp5F
         VJpn9ejfOajWr1U3IqCTi/Kq0Q8XKMXQ3WSh5QN1SjSp5rP1lCQ0ear14S0u4OveTk+p
         TR7g==
X-Forwarded-Encrypted: i=1; AKwUvByQ2ol0M3NSbzGmYYzfXYbVOmjPdD2wah4EusfwJWOmZXjVm99o7saeE6HZDjQ3QzTbv6Rd67bEt11D/n/zWZyW@lists.infradead.org
X-Gm-Message-State: AFuF++mBivY8XRjux/QTEenc60v70N7NV5WCoenxhu9BsAxM9G7AJMxW
	gFOxVDn4373+3Zgao0FhS7OxVIF61MdN1VjTc/Qa8iL/ozO+mi/R3neK
X-Gm-Gg: AYBFou2xVZCLvCuxHuRhE6syI5kREqNrX8Wyx9cm4gnyEN2PmzUK3wL7GnLv7Z+R80Q
	4xjL4lNNDSAEgyplwOaacvpgZv0JbuZzAJGQjtDeev7RsqyOWH4DK/KDqsjGxaCoqIyLkyfd9GB
	dwpyVEqbnVo0VFUiW0zplOxTvPiKJasLOss8bjED9N+Rs2ISmKlW/aTDqEAQxDM4gMGMQDYT8dL
	k4JHhIhsSliYqraDy97iks7oTx8qUZqGUVxOdiDD5IbexXcM7roc9V5TKrbo9LxAGI/HYsH/KcF
	KvlLZshydGpi8ssqS/Cg4Su2uhpRfW3rUNLpY1SeY77yWbVqTfDJdqirxRGJj5TdST6lsM0qhlH
	smFJZVQFT27/ObyiL+p1IJ8+nnZ3j8OQ5kfGi3X1Dd36WxRQFxxEEbMgw4jkgqXmasMucy3whNl
	lnyYhWLqnYpcxqLDmI251ca8kWiUtPC9c52bYtmrYc3ODgmHuBrvaOE+MuOufKbtc12UQW+yRtL
	NQqX0KkOqmrgWyeQGcVlthyGfZYXFi4u7ONop0DvQ5zHG9j69bB9AVp4nRcQzZ5j6SABsMwVcaA
	0Jiy09qhoPObXLsmfR9GAX/o340mUbwYatZJJtTcPpTJC74brNQoxII72/0Dqe1fLIU5dpPzrNz
	RXkwmv9wntEeWiijYaf1kiRobvkARCsmZ
X-Received: by 2002:a05:6820:f0c:b0:6b1:6636:e919 with SMTP id 006d021491bc7-6c7d1cc53f8mr2704731eaf.11.1789528106832;
        Tue, 15 Sep 2026 20:08:26 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c7a677b3bdsm1718078eaf.6.2026.09.15.20.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:08:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 21:07:41 -0600
Subject: [PATCH net-next v2 2/2] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-submit-h616-emac1-v1-v2-2-322b32e40eb9@gmail.com>
References: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_200828_368367_F25B9D99 
X-CRM114-Status: GOOD (  13.72  )
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
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..e8f86df50060 100644
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
@@ -1278,6 +1292,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
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


