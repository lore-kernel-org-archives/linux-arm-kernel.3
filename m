Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82C2D358D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 07:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fzuiYUZsutbfQijzdbBIi4mz1jthxhIUaA8wPvRL1e8=; b=QLzAZdEPybxRFIEo/i4a/rNp3y
	gEnbyFI3I8NW+gcp7qgzXEWSSIG10nWLuJsX9tZMVfvWskN4VJlM+sp15rGBGkXwJtEG2L3azmW/e
	GZ0gKNK+ATljFjsWN7e4gwCPAFKc+Ephgww2fC/M42U7KvdbvuEYXPtPEUhUBbK+eytB6Q4Ira/DY
	q5ZNDYmJLSWauxZ0PIIrXcHW5JeZHid7jqJXXsYvKJ/cWnK2ui2iAr/WyYuDTxzt2oWdLKx2KhbKh
	/Y4r0XV5NrW/gb/wY0N5wcvwoHyzmIXPXuDodJ5NQeryu7/Vrh0FIca8mhrr2l20IIhFhjkpJeMNL
	Uu4Lw0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMbH-0000000HOus-1nFc;
	Thu, 29 Jan 2026 07:37:59 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMbD-0000000HOuF-2FrD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 07:37:56 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-81f4ba336b4so594511b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 23:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769672274; x=1770277074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzuiYUZsutbfQijzdbBIi4mz1jthxhIUaA8wPvRL1e8=;
        b=G4evBeny5bUn7JK7eMLCoQcewtIh2TMT56KpMHZHb3szGilMrcc2ZIH947RDD+8FZD
         uuB1rUVRg2g1Tg34zR5u5ZOI7MiS5eiErTCXsPllv4DvjnrCvqiDH1BeFYxhW+zzRylu
         UUqs4v3IVjZ+IrvHfT/9HfYBFY8XF9EG9RScoqtZbspS3WOPP2dIOiZ2qhr/+19WZh1n
         NHeCnjnq8lT1qxy8kLVbMiQjd9KSPrPV56rXWwJdYAUymxOn98POBloKtDy4nOjh71of
         EYacU4KU3SByx0bFyyAuMn2TYyeL3QBumJyvvkKeFewMy9qPbvfbt5bCYrQsWsAYUSUH
         GgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769672274; x=1770277074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzuiYUZsutbfQijzdbBIi4mz1jthxhIUaA8wPvRL1e8=;
        b=ohtnHUUsXKdZp0udXbyf4xSmHiI+bI2F6AnY2clEmb4vfVPQ6CUcIMehCV08nrk19G
         8m5gvOvmtRS3Zfd95dzJr4GZtGRoA5a41zbCKX3iapWy5td0cj41HYjSj9e5KCly34pX
         iEHttiEUyMQ61ST1KPIAu6w3V3HAKt+aWBq++8vNFhCoefICFyQDmemUttXfUYZqPpiw
         5dpi6wbHRs+f/40k8tzfVYHAPJQu9gNSxjOqMT+NgTgFO5cFqclVbOvgYnvQsiqDoW5m
         L0t/24ChbWEhrlrf1J2Eox8FNyH5z2XWTCe7Pw2lejrDN41tqbzJF/T1U86kjsiejIcZ
         xl5w==
X-Forwarded-Encrypted: i=1; AJvYcCUuu03plO0L+Dw9xBQHXSlyVR5FZkjZLvkBpIKzfochP8FCXA2iV8fv0Uuye823aUf+/KYvItqzzbrZUsoCk8II@lists.infradead.org
X-Gm-Message-State: AOJu0YyGJiFnY7hLv3gGhdeboDcYXvktcpSVD8ZbVYKAfJQBDNEmIx+l
	aN9mX4Amfj04JPhCDJhZKaykkuTdC19JCYQfRNbrzmfA2krylHXB6Drx
X-Gm-Gg: AZuq6aIHNUVI7dv405985r1RD195UJeCBan62dYPVAPdTsNEGUgrerxW5wnXKFqeR5X
	D+2hUjeMP+WV1jW32rb+fE3hxfmdqmdG9DQYf8iylIU8AleLYQivSuhzBLB9OaiS1yCwezKstcF
	JN0r/G3MKi2v3J16AGF4Th/6EwKFvOVJsWXx2l389fzJmlagTNFdpY8Vm68S7aEg/H8uyWZ/w7D
	Wy8j32VDurXP0q/WgiCt/NncMCXZDlyLwMg2batRPBXST+CIJW0Vk1CRE3vvtL5XlzAgTakmycH
	uzQzyWBt5dhlwFwZQ5L87dfDIgU0zTDCt4ZXimGON0dfhpC6zk/J8s7BV5Sj1ZOMnQee73yzB7n
	xaDMJIItlH8IiwqpK9UfO+CHMspkcUDSBIj0vpaOYj49xXZotcGcSL17Mgx2UwTJD5eSLUmUTca
	oMtejxm7a6i80AKisGzsNhaF0ekD0Cqd/WxQcRDxC1LRKvxBTvEME4RxVa9aK3BvW0FftTeJIT
X-Received: by 2002:a05:6a00:2402:b0:81f:4208:274f with SMTP id d2e1a72fcca58-82369186775mr7135794b3a.15.1769672273963;
        Wed, 28 Jan 2026 23:37:53 -0800 (PST)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bff93esm5142425b3a.41.2026.01.28.23.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:37:53 -0800 (PST)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed: santabarbara: Add swb cpld io expander
Date: Thu, 29 Jan 2026 15:37:48 +0800
Message-ID: <20260129073749.3155383-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_233755_581153_B564B1FC 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

Add CPLD-simulated IO expanders for cable presence detection and 4 SPI
flash control. To resolve sideband pin shortages, one IO expander is
utilized to aggregate interrupt signals.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../aspeed-bmc-facebook-santabarbara.dts      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 0a3e2e241063..39f7fade8ff7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -1335,6 +1335,39 @@ eeprom@50 {
 &i2c12 {
 	status = "okay";
 
+	ioexp0: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <148 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"IOEXP_21h_INT_N","","","",
+			"","","","",
+			"","","","",
+			"","","","";
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&ioexp0>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"PDB_PRSNT_J1_N","PDB_PRSNT_J2_N",
+			"PRSNT_NIC1_N","PRSNT_NIC2_N",
+			"PRSNT_NIC3_N","PRSNT_NIC4_N",
+			"SWB_PWR_FAULT_STATUS","",
+			"CBL_PRSNT_MCIO_0_N","CBL_PRSNT_MCIO_1_N",
+			"CBL_PRSNT_MCIO_2_N","CBL_PRSNT_MCIO_3_N",
+			"","","","";
+	};
+
 	gpio@27 {
 		compatible = "nxp,pca9555";
 		reg = <0x27>;
@@ -1349,6 +1382,21 @@ gpio@27 {
 			"SPI_MUX_SEL","","","";
 	};
 
+	gpio@28 {
+		compatible = "nxp,pca9555";
+		reg = <0x28>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"SCO_UART_MUX_SEL0","SCO_UART_MUX_SEL1",
+			"SPI_PROG_PL12_SEL","SPI_PROG_PL34_SEL",
+			"","","","",
+			"I3C_HUB_3_MUX_SEL_PLD","",
+			"SPI_PROG_PL12_EN_N","SPI_PROG_PL34_EN_N",
+			"SCO1_SPI_SEL","SCO2_SPI_SEL",
+			"SCO3_SPI_SEL","SCO4_SPI_SEL";
+	};
+
 	// SWB FRU
 	eeprom@52 {
 		compatible = "atmel,24c64";
-- 
2.52.0


