Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459CEC44502
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrmXb78uApy7T4RFmz7aic+KLko6/J+77KD9l2EYeuo=; b=DMVl7w6IXMa6hc0w0BfeFi4EVi
	mIH62ugCRptPax4Y7rSKR49frPyJxiJIkYAVWRpTDH5087mg9mgin4syy5miQY27B7yZyir/AkUqS
	3N+RImo1iE1VziMjP7bpIhDGvGzImLHDIoJcPFls0nsyD9N5hB1VyDZgSbfvlCYKAoeX6X5EUF8h5
	2f7W05YEWRR6JLBIjEewO98p/V/YzngqD+ONt/iOgeUs5THg/jTV5fPaSBEDy28R9VHKM4kN6Rpb/
	Vg3ZA0IG3tUMUz9pNVcu6qZCGGiY4A1ZZARlVlk6ft7Li6pPFFG+pYrIENmVxr2+ra33sTwV+9+YP
	GMTEXGww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjm-0000000C3uW-1S2V;
	Mon, 06 Jul 2026 09:35:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjJ-0000000C3Le-20Y3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493b77b150aso26447435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330508; x=1783935308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrmXb78uApy7T4RFmz7aic+KLko6/J+77KD9l2EYeuo=;
        b=r7FLrRyDq2nbRYrwI04JSmhbAabCeULUSffky0u2YSDjQbBLG9Lo5ZovdwL81NZ5JC
         Pob3ezKIaR6X66en5pellTrra1u4T+X22UJ3yOnu2/3N4ahT0t90L8C6/gqRS0wGcZZQ
         jUNQLc6egclrta5Qt1+Ogcmx6w1wVecDZkygb4XbVLZsCIAk2akire7MQGZbZxCRZBGt
         slEMFem7Ot2sEIo9klUERqy678223SX8GzjeeON9hZG2x5XAUbdkbEt4lTD6sC7m6Mtv
         +mW7ORP05J9786UEiwYDYwWrcLuC2QblamhfRQefy82WCXhgjtl8Nf3MZYt6wygX/9Ah
         nvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330508; x=1783935308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SrmXb78uApy7T4RFmz7aic+KLko6/J+77KD9l2EYeuo=;
        b=rGMZIXNtkfJj5YidmNge6XSlD96JQT3zctkNuk9K1Rr54FB7wSbQ4MpmSa7zzaHQiC
         fxqD5pNzl60UBlJOy0AZ0LfC98ESEX9wKqkwUKJlJZ0FMTJpNA09irul/WaD3taj8l4N
         gDU2ML1X7rZiPev4RS4oDlLC6uFtz53uwWkI63VfWLVi39sYGzyOGzLLJrtFHEi/Ahkl
         W9NCi0Td5g8fBxv+vN9bAiPyl7AJC2ZC0TbgfpL2yfT3vsHOij+/rra6HW2QMoVwQYeP
         Z7C/xtk7VTORMDYwN8QSHoQlV+PxnNa4TonQo5YmWQwfCpaGTOcyT5BR72WC1G3COG6/
         k3HA==
X-Forwarded-Encrypted: i=1; AHgh+RonqUY+owXk6OKv8m0prFTEoARJWpsLUjiveTojOFjpboMmgUNevFUdohs9+e+5aiaZGwkDbf6iSKBA7V7q79c8@lists.infradead.org
X-Gm-Message-State: AOJu0YwUMxC0+8Bn/0rKRXP0blq1gYU7zQjCWPkE2mOPuX3/IWwXkSnn
	34RoB/QJuADS+p54Cf8iFuq89tr9qHQfNUQ2kyl/nFlHsL0/swBp9QZr
X-Gm-Gg: AfdE7cla3v0+QsLwB2HgfHlk7WzLwZN+/ze0KTa6ljecjp9J1XwVBXnBLxBuy4HSLGi
	6/f7iiqKoEPy13OXMn+4G3BIuwoLqzBd5+53FOjSBVhD9CGAWDuf2vygLodIV5Lk84dSZKD92bc
	Rc5kpR/TGz5EXsAMB5GWrLqwS3ArwmOdsPjlmjPJHvahCrfurUPuc1lcEIav3lavXQWB5p3jkv0
	3zKrwAs3XK0obBUXlBMbLsYdvsD8jLX+/ATOXyoycJ/3M7jUXVdsX+/Edx6o+cGcOfZpS5+zkM/
	xO+KEigJgCgng4Jpx+YUS/jvNos542PjzfDkq1gYx5GYACFIXgk3GvrKlJAo6VBEHrGqSQNQ+ao
	Rq/MjZ+M28hXcVya+jYNV1P/fGgScFqAtWsmPQMUIrLV9hXDj0+lWSQsp9SIEXRhhw/bKlsW6tV
	oQOhTLbNkg3xzed4OOiGHWc80ahbh9ZonLL0mgxTzpA2TuuETp7YhQtob6qXobc1KQ/xJpw9Tfb
	AMLWtseX7lR9skCAS988/rZMw==
X-Received: by 2002:a05:600c:46c9:b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-493d11faa18mr95203205e9.30.1783330506886;
        Mon, 06 Jul 2026 02:35:06 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:06 -0700 (PDT)
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
Subject: [PATCH v2 14/15] arm64: dts: imx8mn-var-som-symphony: enable PWM1
Date: Mon,  6 Jul 2026 11:34:44 +0200
Message-ID: <e7b7b016bda85d2d3fe3e804ec868565049a3791.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023509_574881_B8757F92 
X-CRM114-Status: GOOD (  11.38  )
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

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mn-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index ddd4651b35d7..2afb5b438b68 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -217,6 +217,12 @@ &i2c4 {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
@@ -310,6 +316,12 @@ MX8MN_IOMUXC_GPIO1_IO11_GPIO1_IO11	0x16
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_EXT_CLK_PWM1_OUT	0x06
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SAI2_RXC_GPIO4_IO22	0x41
-- 
2.47.3


