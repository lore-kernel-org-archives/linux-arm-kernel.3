Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC30AC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 00:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFndLx5Yqc+lsDlrSDVoBXxkYOfQ85XX/QivbJQF5Mw=; b=KxbwhBvHz2VUNck1WlCxAcf4Rz
	rE2apZFpk3QfZC74pDVaoYrkI1F4DDZcdg5hTQ4rH62SmrD7wsaoKbrm9GSOCv/JqWOtYXxHxYLtZ
	72ZQ7RoRMuUjEqSMnuvmzB2wTVkO3WU6B3wF6oX5FqE+mhtNNeYpCHhCBZveP80vqzn789yRZu8NY
	oH1iCICtriuTY9MsUj2ycothlKBFDY77iY2PCYG3wSXMJrdKe5EF4SJ7m1V6yDT+smeJR9myRBk47
	jwurdfTb3SEBKBuGnMVo28N6nTmb/1h/6rTUCwyVZHEhvgONleORpbQu8Y5NJvndy4SWDe1bjKe4V
	zkI5R88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8odd-00000003o70-048E;
	Tue, 22 Sep 2026 00:45:37 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8odY-00000003o4y-3IzH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 00:45:33 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4c13f2685f2so1996590b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 17:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790037931; x=1790642731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFndLx5Yqc+lsDlrSDVoBXxkYOfQ85XX/QivbJQF5Mw=;
        b=dG4bZkQzVcYePzj4Zw6d49Q1L2DYSWUHn4VXoAWCb0J5xZ8k5joEBwTaVoR5y2VJse
         d7N2TQuSaSreKOrvNuDnR3bU9bSS2ZDdfy/J/uVbSPMbypW8eCfG/+ukdgvLyqgnVleC
         NQLy4HB27XPDmmv3MVJelsq4ldQd6QSei8sOb1IGPYGVs2mATT7lbymqm3ShbA8xPWE0
         dEck1oh1RVKfZ5w2N5i7GqcmJ9kDDGr+TTgqJgd/3U3O8+F7FgIPPoPC/3+ZIjyR7D7e
         KQeOTL/E5N2hsmhMcshSY5hf2HGC1bBmw5ypWLz7ZqVrJM4K4MIgL3vv6KJLBtBJZCTd
         8gpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790037931; x=1790642731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFndLx5Yqc+lsDlrSDVoBXxkYOfQ85XX/QivbJQF5Mw=;
        b=1BIF8Od2HphcYjj8Z07KTIz3qIRL0xV+tyBH4WFDwDPOc+DopIh+CNDECh9c6wlftx
         3iVgcWal87ChDuIbBAXN/cAZcgwWjFQzMBmt5fR74svBWUBDUXfrrey4bV1lQbQ1kVsc
         hvidt2Wy5ZVRyWBDJ1islEM5ZmYNSxQAUw8hsjGqeKlzXoEzg+a0ZAgxUWsVly497K9V
         xZ0Y29GIQ+q4dmFvU+EwR0BjhYv9i0G9m+mlOrLVYnzu/W2gnHQuIIxv3kCpNK9gZeCI
         j24IRHoVgmdH44d31Q0ZEVQp5E3xd27dTl/MUZxRXJAZRtmvK7AIuUyx8tzz5HAGFfn9
         +d9A==
X-Forwarded-Encrypted: i=1; AKwUvBwvGIkRmhrS3838pv5IZl1G2jocCyzEjpVRhT1kdwWv7jWvubyJG2+qj4hghbnnFvjcrvYP/P+KDnk+PAMS0PRq@lists.infradead.org
X-Gm-Message-State: AFuF++lMAPCFjxS8H65k31/UqO8X5TjnINsML6KUTdrrLVDv4EiOuSO8
	T2gOKIdYIVF0610vRxnVmMEB5Dxm1EwQKRTPUh3nL7MTu8fFAjEuEJWF
X-Gm-Gg: AYBFou2hbYsXJRzDnoApyGsXHNlWSQ59EjvNxvvKMcXQnwQbkN9IqaPFjS1E6UstzNq
	XoLf+Qn+bYfW5KqkybToD4JRqYVP9DvgY3upCmYdDl+7F0wGFESEXHsmkXGMv0V3DMypyBsg/fo
	7qRZSRx3br+uKNrVOJb8nC7TJWaSEgZXwt0w/SYZbLLeNb3CbuFvK+jzNFJJEFrOVG9xy/RCwE0
	Jp0JIyiugsjZqILj6JtId/SSwUogbG7QogJzsVwN3fOMHyj0Kr0ZcGZM3n5M772/b4GP/n/s1hY
	CQiT8THgKlcl3hVBYGe4uS6p2URrxK5snayTkamWwtovDL6C6FEMCPCodaL60THzv3aWCoj8dPu
	t5XN1Qs5c8hklaGLMEXi9Dv6JPpTMs2jeTF7vq7JjdtKgLu9Ycfw0M0lPWywsGeqakU8CyRtsHl
	9LoUkSP/8SbNAtwjf7GqwusuEmVojJDSC6OLo8+SmVLri1alOaeMQU2oNkOgsbaRpj7IWRB1FEg
	UzHj3MylKOdPLAJTcc7BdyfYtsSIRctpcvzGQyhqUp0Xj6BfLer9yK4OjfVrYJORFdcbduIqPiw
	T7ttsfXtEagxRQ3VswZdOyL09P/2a/eXmNd2nao7gVlodnqR2j+w14FegQkXH9w+TbmJwr4FCSc
	KiCr6Un/qdNxRJLRIGdI9OwbQPRGfGABZ
X-Received: by 2002:a05:6808:1701:b0:4b9:a8ac:487 with SMTP id 5614622812f47-4ccf91570e3mr11567524b6e.37.1790037931601;
        Mon, 21 Sep 2026 17:45:31 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d4bb6be7b3sm60201b6e.0.2026.09.21.17.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:45:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:45:26 -0600
Subject: [PATCH net-next v5 3/3] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-submit-h616-emac1-v1-v5-3-ada661ed9e9b@gmail.com>
References: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
In-Reply-To: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
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
X-CRM114-CacheID: sfid-20260921_174532_837831_D14A8BD1 
X-CRM114-Status: GOOD (  13.50  )
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


