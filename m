Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ED3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiTPaztlaBR2pEeoDnHua6pbqmiqcP154lbAnOqqcM4=; b=sMNJi+ufxnBalZj6b3u84RxogZ
	1qZnck7S7oemhCkqSAWVKyQADY3e21uglHqrXL60YE29Gd4ddgxNEPzev27f+ozgmtmR9zpoXZbd9
	zgKVEr5Aggy8iKqajTFlkI7liVsaCyJVVUEz21SxmZ50vN7CaeA+wnrBA1GGyaQhOePeQOcYQYwSQ
	FYRvWLb+CWG4NQLoQuFiuZ8JFkJG+GHOIva081SpTXQaN7lSkxW9AtX9RYOww8J4CG6kSzXXd+eP3
	N1eGcRnc2/A/12XxjV3jxeGIiaZ36iW6ctz0n1KtzMaFMSlI45VZqLeLq3H5tJc1dGLEe6T9E9/FE
	/VyQwv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXV-00000006OMA-1lmG;
	Fri, 03 Jul 2026 08:46:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXQ-00000006ODB-3Cxy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so2932135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068379; x=1783673179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiTPaztlaBR2pEeoDnHua6pbqmiqcP154lbAnOqqcM4=;
        b=V0uoZb7AF22HQy4LXfnqXWVN4BMnSDO8gL9NrAcoIaQgPGzAkqYSwCulidiUlBP4dv
         VUpPL9fGo80FlBj4LjMDf3lIeGRGUVnb6tlBI48CsE2rVEMZMPCRhSiSLpfbIXYWsHQ/
         NdGRcxsaXdaKFBlDPvLrht3vA2W20dsrfwLFkaogPYJYSEibM6Lsgase5axoi3QuTwDc
         +p9IMz2V1/6fuNyo95m9i6yYkvDrUCFrsW9hsovEQH44KOiXk84JEB/X/i5H+uqyp1hk
         ez3rKTcV8m/yx7aVgt2HYViMw35Oy3/wCt3cjNGpUF/rapRmBLOTbOCriaBR2xBLqO0U
         4aEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068379; x=1783673179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OiTPaztlaBR2pEeoDnHua6pbqmiqcP154lbAnOqqcM4=;
        b=dNPaiCLMWW0SjAyAcEJAdIQnrV9Nk/kgnp+p6TccI1wOXYcfKbgu5y1D98nGbs1fum
         5mSbW5zTLgs2600JBq0bXG30Ea0ddqvGGbcLLRaDyUK/IUHHCVQqwxbogmn2Nz8TlLjC
         RMytCV/kJPDO8oQMXbhAwwtlweyw4l9+j4Nz0doZ9HiwkC0NQfGp3XKaqHpnEuidTsE7
         6h8Ebwve/d0F4hANGkNI6PWGfA9P4HLhitteNJW1gXCIbYbPDyQFtRqfXDr9C+694tGE
         fM5k6JEFks/7ODYTK3IgP+dH8JYB2Qz75fq2Cie+JHFSNZbhTj7iv0MA6nV9LWoQbRf4
         1YWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8SPJzPJ1FHhBwlllg43OdxUcCFWgA4BAopjv1Vcze0q/E4/ZIonDQXPmgm9ZWjeHhDk+JCtOmVrlUVapwWk4Ew@lists.infradead.org
X-Gm-Message-State: AOJu0YwHv/vO7OZuwpqCLy8/tOqp5NqmWtKjQHslgtHgR28yRWZTmbzn
	eRzH+1ZY4Oe9UdnUC7Rn7KqBNvG9+ySEcLQxuWjCbjkYsyM8jHOc75f/
X-Gm-Gg: AfdE7cn8RLHoc2EQpQa1cAhXatcCixxaM8Y46kAZ7p6FxWQYxQTHz+WqV5A46eT9tfL
	x0PjKi816kk1C5tWKI74xjnuxQe0mXW8ZtVRq67v4AK5sYdEp90n1FNq5isjdSYiUqwfZY34RSV
	HWwTYrAV6fPBb8hpjc9/odn3fDN17heF+PfNM/FME/y4Llm3HnBhXwmUgMTaMJw2eN1MLfEaMAE
	cJU2o7ODWf1DpqWVzFqvk8Lz8sSvQTH5FgQI4GWMWu2FRTwfT/BiQGhtRummircnPp3YWmJ2zbQ
	Pp61yYRuMeLjWW4BNyYkvtiJHgXxdt4P98o8oNoiKJb4Om4XIK21dAm7+r1vcRbtmxPE81slLrQ
	INwPBEYvGRiHmqMBEUpgBFxb15TH0kcIYl8+MrGV/8HnuyuUPAyy9qO6ER1QZe7KZsNu1pe7Cw+
	/8AaB4IRrVSw1RJD06Z+y3j5RQEPTn6I28U7+QGoU4p53cheRb/uO+PzI6Ul5Sbu48fQA7NTa/k
	0OzfnbxFGHhb64wtPowenTa3Q==
X-Received: by 2002:a05:600c:5391:b0:490:c032:ae92 with SMTP id 5b1f17b1804b1-493c3df2b42mr114145085e9.33.1783068378849;
        Fri, 03 Jul 2026 01:46:18 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:18 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 10/15] arm64: dts: imx8mn-var-som-symphony: Add TPM2 support
Date: Fri,  3 Jul 2026 10:45:57 +0200
Message-ID: <fb9bfa8584a608e9ba8179b2749593bc23c040ea.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014620_914606_959DF938 
X-CRM114-Status: GOOD (  11.76  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM2 device on the VAR-SOM Symphony carrier board.

The ST33K TPM2 is connected over I2C, and A PCA6408 GPIO expander is
used to control the reset signal required to release the TPM from reset.

Add the PCA6408 GPIO expander and the ST33K TPM2 device node.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mn-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 53130b521b5b..7d016ed5e911 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -160,6 +160,20 @@ typec1_dr_sw: endpoint {
 };
 
 &i2c3 {
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5406";
-- 
2.47.3


