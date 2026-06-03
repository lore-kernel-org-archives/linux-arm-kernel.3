Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4066CCD6E6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YNBR43rYsuzDzzKAUXPCjYnMBRokGK4lII6/eKu93A=; b=VDgPAk64aLmPUp0Ce4Q6ahhea+
	NNnWGqRZHPSo9auH08+Ph+qfxgxr4uOOj5dIX5tcsjukPQ94WH7Dozid35RSMzisLsTz7bTbf+y5n
	N6FSgpa8shQKSXobMazWOtPvmhWAPW5lnh1dhXy1lf16fDJbxkxpj0BmBaf91aKqvf7v3njSNjHcy
	Oh2PJreOCGT7UVh1nqgCdhgBzghD125nYKOdkr+cHAHw6TFxGJ/sD1HrK22BYjvyHV6tKmdNUR/hw
	sy6m31+5aZPUT6xzBCfjMeweN7OG6AJ7joQEO/PLa3uJWcw0zOmKp6mLo3cMuj7CMzZdIKGlylxTg
	IC0cEJLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlPB-0000000F8p8-0xGD;
	Wed, 03 Jun 2026 13:13:09 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP5-0000000F8eR-2gxx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:13:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45eeea039ebso2981801f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492382; x=1781097182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YNBR43rYsuzDzzKAUXPCjYnMBRokGK4lII6/eKu93A=;
        b=LuJ9n2C7K//DeOcqq/K5F5ksAsLWQokE49CIgjXw6ybV7xuJwh49QdNZGgakjYQc2x
         hkcjEuEPV/eAGlfDlGWJjemfB1Ith3DjxiFfrvgOKQpJf9c0m+Km2oXNlsKEkybGadHE
         1+ReZiKvJ0lhjCA9cZ6T2twij0iZM/MwJEtGowLxuIjfua47Si55wD3YMUv6c+SGQIjz
         yeX+SxRgMMKVOecOdkm2dMLUG8Y0CEE1V80/DbK7e41Q0pby+ZWqtv5C5nPjHaOpDdkN
         7z/TpMLRCKWArO4HdaRhE7qIjX8TrkPFUzUhmNQPasH82VuyNdRlDRPVA7bw6KTzIsSZ
         rEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492382; x=1781097182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8YNBR43rYsuzDzzKAUXPCjYnMBRokGK4lII6/eKu93A=;
        b=pzmIuGRZvsogCFfAZ7TjJ3QD9eZR6U6J3HFIqWyjhxa5QLXaSzcX9PR7t8Fe0rJrjN
         aBsLpAGu7a3PY7/iN3pn39Uc+insB60ZomY9Et2tI4Y8w2Y3UsNSIr8yl/0XJfRRqZpV
         mkn2PEggiRe6gYSQMv5GjZQt2o30TlUcwyZpis7iJ4GJAlGim181xoX50ufyLIuvIJT6
         BaAnChqQHJqnuZoV61zbVYR0Lo1IKUJrr2SblKTI+YCcPrnAZleqWLNY2veJQPDW92z8
         JHWRzyTanT9lIHZepQ1muK8Xnk3mM91QlMiyy36Ehugb2iN/KOeqE7D4U5cbf/0rdQSt
         FVUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hMAm80sqF7ybg4t05wsTg8WalYxsTHPQhZs0jowXxO3XilzIhY/y04LX7RYicY5WrgKWp/5inMcypH5s6PgLw@lists.infradead.org
X-Gm-Message-State: AOJu0YygXu223lggVo9xjHDFnE6V8208tLM17k90mgnSqIp8N0FWY1TF
	h51yAaFk9ECK3iddGi5Y/XuVEHpknagW3CdCLN+FmH8OQN+JSorsymDA
X-Gm-Gg: Acq92OHeTMmjgW2QL3rsRFkAjIBm5B8tqzSS4TiGkAWVTZtEJobhB7cuUMhnoTSgFWM
	A4ZUQQkdc7cdFKg786CGMx2hPC1XPGnu71l3nCL3+Rud5UDDofBTr1kUcBAWj3fA8HeTuTu02/9
	Ng0Vz3HoUsMGZB8bh2nKQbbBALD1sKV6xCCYpdFStCX58RBxkL3xwJJMBifdZAwlux6OqmnpAoK
	yE+eQ0JQ67u1kiuq1Kr+uLsSEDoqL/OSBVJhKEL8esDz+DA+O1ZT9JIqcF2UELtyaYF+er7jiLB
	I0JsJerE3cQY+vCP+iG6iDa1NsJiKZLbWMux3dKXATH12AAEttcYzBmJ6YzKRbZTz/bSHBOhsQ8
	oXxv/T72Mlem9qnZUj9ks1gJVJmLfAY/OKocsLk0FJAdYUWjMTmlHrMceQECSx0spuIxjUeyUXB
	r257H2lXdsiXdsnCv174mxFetAohKkE6yRW77baXKsBzqXc99jiJwktSj9PMuIOK10zVtVIqEDU
	0UGkoJ27GhcONauWFUvQtK9/McCASPWGWSGjlQ7gkuqZx6f
X-Received: by 2002:adf:ee49:0:b0:460:1684:ba11 with SMTP id ffacd0b85a97d-460217c31afmr3034562f8f.15.1780492381876;
        Wed, 03 Jun 2026 06:13:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:01 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 08/12] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Wed,  3 Jun 2026 15:12:46 +0200
Message-ID: <3cc5be80b54f270f8ea1079c514e20024dc231b5.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061303_735958_801BAF5E 
X-CRM114-Status: GOOD (  10.95  )
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

Add the FT5206 capacitive touchscreen controller on the Symphony carrier
board.
Describe the interrupt pin and touchscreen geometry.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 4d8791886a78..ca0fc66193ee 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -195,6 +195,21 @@ st33ktpm2xi2c: tpm@2e {
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
@@ -305,6 +320,12 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3


