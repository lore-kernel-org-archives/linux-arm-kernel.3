Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D86C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlcJviNfe1A7bPODjwx5akEOsNAeWr5kscTUhAqnE8U=; b=wwppb6Ndsd/O3eXsFmZR7wMw97
	OXtZ8flep7ZXj9yF6IVigq9aQcPZlQrdgOR9I4nagAss0jk3/pxNZuC6hgw0CiTKVPMuVT38HFA46
	xjfdDFOzROwc22HWtx8NR2iUVY4eKfHCtGkHywG5u2LqnyjgvSGzdXlPKVTACDvM1Uqo0bwClO3IB
	aIC9YUfjjsXbghdATXIGVMqa6isDQgmYfx73Y14UzlxLeMOHeHgmSP0yP2qzgSJeKVoX0Zmg09Okg
	Ey2lXLbsa4xbV2z1b2DsZh6msxJ6uNerEFaq6qjQupJEP2zCJ3pSeP6xkquSFSB6Mk30+cj0jJVef
	s6baZuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1P-0000000GKYz-18wU;
	Mon, 03 Aug 2026 05:15:31 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1M-0000000GKUY-12GL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:29 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7e6b554044fso2627237a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734127; x=1786338927; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlcJviNfe1A7bPODjwx5akEOsNAeWr5kscTUhAqnE8U=;
        b=JftnwSh0vTgryg3sz+MQ80VWhNqAjo5rGGOFgh2crtD0hI1TDgThCznfTuGheW87Y8
         k/1iTWbXsFbk1DNTQO0FXCmgxb8/V0+e4OIZz8EteyyV35GFL62VIWmEWrAX/Up/nydA
         sn9ig41y9QA6D99vaSa1m2psBZBrfXvLh8kgcpEz468ln8R7rFUo14nH20OafsuB72k+
         xkPcOs6oYrQKsE0XieB0Yj/qjVurJjFHDDMVeYgGA2M410Jq+CqjjFeV3fNfuIFn8vtv
         1FwDrqSRppaXqzq456VuD9Dj+XPtCmr0wuJpv9FtGOqlzHQoQVxJvkmcmNnQSrQMaD8B
         fz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734127; x=1786338927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlcJviNfe1A7bPODjwx5akEOsNAeWr5kscTUhAqnE8U=;
        b=XFuG+PQ46Wr2XuPCKlf+gYeEC52th4SdTIDWOb/YDJ4Dc1GhAwl8j16mGwJAdYW8aB
         54auAALOo7yxs6RUwlvWhnVHsJonSsKcfTLnsc6L3Tbk/lGe0lNeoC69kb8HIq8WYpwB
         IA6IAUD3zId9i5CnneOHeGCkOJTJlqP/u2dLHVrbAHXYfrle8HCpxOSDmw/nw2oDXYYS
         anLN5LFAGzJmoo4rw1lpyNXFOWfCrYhAqFlBIPWcXrBNC03NCk3uQux3esEdKDCled22
         PA/eetcQE2FdxJi3RmeCOr9wgltzHgCR7Bff2c4qn/g3SFuY1dnBdLqfT8Ev0jBv7Sd8
         jcnA==
X-Forwarded-Encrypted: i=1; AHgh+RoIWcwAajv7i82kM/AYcwqXl9EohcxdY012VH9RWi1TsqfGyXI8Sb1LaCdONIqsVpvfSDh5dz5bdhNxZ/TKaBAw@lists.infradead.org
X-Gm-Message-State: AOJu0YyD0RvGTBh8v1DWPrrB2vT7mRUsM+04pndntRb7lagwPuHFa9gN
	QYbLz104RjTMEbF/9dtaHSBTlsi3tHCVyiB58iNIrqlz/py2UN2eRecuBU6GFKDu
X-Gm-Gg: AR+sD116U2Qc+S0WURuXvSCOtYellh4OBj1bk+1+Sm+0RtpT5i6r8hodCH0SlheyhDR
	684vVp5q/CgjnxujXZBAk8LudTXlrF4VlvY29sHogWqKA1QzB/zdaO924k5ALkV+IXOBprzk+7u
	ab8JIBXDivX5hzcfFnyuaAoohj1hQgGdHGzyeXbw9YSqYuFpDl1x2NQHGVdUI7F7ZxV/4jIoOnL
	2o1AijpZYeCkJadfh8EUtTn0o0PEOfk49moQFtGJu0Nj7NQUCKCI54ocLkYuLPIdV0qjbX/rRrV
	ckzP03OLsoFMJ2+iZql35yWVjgARXrQUBar0tbHuhFsfuk1ixOCX/UVm+kfUz6gYlfxVh5NXP4u
	pmH8v0EaBkgdXrEcX1DJOhcEVvVA0FuOk6dPDZcnbGG8qqvSHj2wvhx8klCIqa/AYrbuLxqauem
	BKT7n1ojMhHu39ajyNQ8Pl9I1pj+ciZgHsR7nOwbmwPCENZXEzcWMCpq/JQftujnufW7YSvOycm
	3eA9cUD4DjM8qzoyIEkHLDBDTHoGnOGpaTNk9jDcKDDPiW9ciqGt+njl36avnZRaVPp/yvwzX8K
	17Ph+Kj737m86A5DmUPev8w56d4Alg6lYMLhByrbZwnaSc6zUzsPJdAB+M2soNWigmKa8ClUzml
	2dbx8LH/EMisDEYpN
X-Received: by 2002:a05:6830:211b:b0:7e9:c102:333d with SMTP id 46e09a7af769-7f196f8ad8cmr14493591a34.9.1785734122667;
        Sun, 02 Aug 2026 22:15:22 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:12 -0600
Subject: [PATCH 02/21] net: stmmac: sun8i: add support for Allwinner H616
 EMAC1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-2-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_221528_341468_288C2FEB 
X-CRM114-Status: GOOD (  14.90  )
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

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Its EPHY is provided by a
companion AC200 or AC300 package rather than an internal PHY block.

Add an EMAC1 variant using the dedicated register and mark the PHY as
external. The register retains the standard five-bit RX and three-bit TX
clock delay chains, so expose their supported ranges to the shared
syscon setup.

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


