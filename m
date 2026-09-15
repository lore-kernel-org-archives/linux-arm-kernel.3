Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DCDC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 19:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XXNu+ljv2q2jdXLpwbKTjv8fXsZBsxA93MzoFmASwE=; b=XghckzKKDzTayA9nbBEhl1GpXG
	RRu/G/a5H6ctECkXXeREA2yt/Tr9WmEWb0kBM10GE0y4UG4LEotJne2Ed0vTQ2P9ebD+C36qAehNY
	yixZoQwxPtmvmwVvPteBQ0abOK65p6nRBWZierMlXjOG6czc6WpUInEVttUBA7vSZf9+sx0vdM+Am
	kqCr12YnPEK50Kr7JwWwI+vzGFDrWMHETqPb3vF65A8RRGaVBfR86n8eunE2cLoT0kYJrK/S2FGCk
	UjkwKmRzYI9kTy3rG3fvjI0rbDrSoOsRvgXR5V4Jn56+OGUm++4N6bV4L8gZ+Cdok29BxnlKuHqSG
	obUoVqFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YZ1-00000007q1L-3Dvr;
	Tue, 15 Sep 2026 19:11:31 +0000
Received: from mail-qv2-x0f.google.com ([2607:f8b0:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YYy-00000007q0v-38vr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 19:11:29 +0000
Received: by mail-qv2-x0f.google.com with SMTP id 6a1803df08f44-91058dd77a2so1737566d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 12:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789499487; x=1790104287; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XXNu+ljv2q2jdXLpwbKTjv8fXsZBsxA93MzoFmASwE=;
        b=eH2dKPTncgyavuZV7OILFwTJBsHAE8zSyWfWFC1xNQZ3l69Ckxd+IUY03T5KhQqvuf
         2PZXp8XHWVeg2814qssn6uBmqUPyPakSNnYDDWJ4tzRZo+8wRE8Eqn5cVNce3B89sWDs
         zTyylTSb5JxRmPnXECe3gxM3N1vpLZ3tg9nRZsuxvsNpW4wTQ5C/RcNAQnf2IikgO8ce
         y1CugyiQHqRrMZkJtQHhfCEkuVdgaIRu/ki7i3aktWg3BoYbo5THCHzYDiDRK241K30x
         44Zy1LP415es3bP9TEXFV7LUoGoqj/u9c/Wx6AiLRWdu1R1z4VMjBD7Zz0UsXEEzO3Lb
         KOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499487; x=1790104287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XXNu+ljv2q2jdXLpwbKTjv8fXsZBsxA93MzoFmASwE=;
        b=BZTwmW4yQZa6RMQ/ok1aO9d5TxRS3axgQx7aFBG4jmWiw2ylpApNQetAR09ppvEQbo
         XBvfemU6uK4RBPDS9CMkkox0eROfXSM/wXv/7QJyvHs0iKtzgO92EwVtLp5xjB4bRRkF
         Vgsof7N8CbEOd9D10JoEq5ZFGlCyliwpF8gJx4oekR9o6nr3KbDtgk+BmjjQOgQTVPe1
         4vA+Z2vnMGNaJfSRycfaqmrV54w4KIBIyMVuYjHHt/rDK5QtHyEOfSbRiqbR9bFVRmbL
         Vsv2WsFHVcjSp1WNsDTIfkwcoKRefRiffO2WIfYek88ntsMUwOgwLIHAmJ0eNaoq2QPB
         rbRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdRH4+JbVoTqwbZ/9DcYODFbtD31jgXTF/5ucfsk4lotEIBuhiNyPsrM0WCmrnJMDmxOzNn+WnaDy5IeOCqaIY@lists.infradead.org
X-Gm-Message-State: AFuF++mS02n/sH/WAl595sOdBwQGY60iCG6mbAEbTnFBUR/2I0vB/qID
	ulJnhFVRpZ4zDUfrfggORNHm5BKp9DtbfBGtZnOsCyLtqfD0ZiFEeHDa4y0G1JgD
X-Gm-Gg: AYBFou1gbPdldjyfhAsAMTaawFimh6Sh1AMetrqX/tbbboaXfeSnIgQezPrFJd0Z57q
	xFptrBZmTCBDy0sT0J757E3NK9HmvCLG8cb1yOakQOGCNNntQDSvzEa3Lbv+UzGJO4JhcVXtmtm
	P4ag9qohWvXwb8X/Z3raVVKvyj/MmQB1OAUqe5hdV8pnDgEBo0dg+Li1cAOhWu4UEfp7rJw8rQ1
	URvArZU3xCIxdxXK/a52lnRBvZ/3l43N1nvlkqQToxi1tqadKXAEvLGgc6rjj9nIiWl65AtYvp4
	roDYJQPJUDJrNkt8iXBw/nrnmx5KEgU4M7CWIlGfvhMHR35UephAsL1lHnAThZ660ZLvjfCLfej
	t9wv/drxECS59FbIoTP4yD5njWm2yAM2GQq1KBhPbinAeBfKgC3BhcqDHmKiEdlbsTzHQecE7LQ
	yM24SaiJNvnCr16GnEis5F3pJSmRPYWOgM/n/n/X3bqwsre425H1Fd+I7q+0Y/SdiRuv/0GmhEv
	Sj2hFnuvjAtbL9effBKTlm9Sbiqx9+D44CIn0+OUDL6q9xYav95fDRG+XPlrRBwRsiI8fZudQNq
	B2E1j340/2QNxaglKdLzJqT/WCluHgamxC7DdH3X7F0XCi9U7WQOUag9hS3sfZCIFQ4QDWouFIw
	b56kU1gY2L4KybrABLb31VaM4icuKv4gB
X-Received: by 2002:a05:6820:169e:b0:6aa:cce3:ab61 with SMTP id 006d021491bc7-6c53f555385mr8191833eaf.9.1789499018615;
        Tue, 15 Sep 2026 12:03:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842546a51bsm836569fac.0.2026.09.15.12.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 13:03:19 -0600
Subject: [PATCH net-next 2/2] net: stmmac: sun8i: add support for Allwinner
 H616 EMAC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-submit-h616-emac1-v1-v1-2-195de0bb1f8a@gmail.com>
References: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
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
X-CRM114-CacheID: sfid-20260915_121128_806828_B60FC616 
X-CRM114-Status: GOOD (  13.98  )
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
and supports only RMII at 10/100 Mbps. Its EPHY is provided by a
companion AC200 or AC300 package rather than an internal PHY block.

Add an EMAC1 variant using the dedicated register and mark the PHY as
external. The register retains the standard five-bit RX and three-bit TX
clock delay chains, so expose their supported ranges to the shared
syscon setup.

Co-developed-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..fdc0c3384af8 100644
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
@@ -143,6 +150,18 @@ static const struct emac_variant emac_variant_h6 = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_h616_emac1 = {
+	.syscon_field = &sun8i_syscon_reg_field_emac1,
+	/*
+	 * The "internal PHY" is in a companion AC200 or AC300 package,
+	 * rather than on the H616 die.
+	 */
+	.soc_has_internal_phy = false,
+	.support_rmii = true,
+	.rx_delay_max = 31,
+	.tx_delay_max = 7,
+};
+
 #define EMAC_BASIC_CTL0 0x00
 #define EMAC_BASIC_CTL1 0x04
 #define EMAC_INT_STA    0x08
@@ -1278,6 +1297,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
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


