Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9189BD0E6ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 13:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVFssVMsppemE9LOnYuL76lIRte65ETPod7a5rRBKjc=; b=0pNb31WXGiH/OGpKY0gES3+IAU
	fjWScV8llS0z2y02d/3TfOJYmQwUej9wJV8V9C1sOvjeV43EMtE8YRzC8nqt+VFPmcmVJ9Kpjtiu7
	6Ab0CIJ2+35cRU1VzbUucQlnKO2HpPe+OF6bc4qL8dFQFOwOt2DxenS/7q8SJgNQ+sQH6wHInfdNz
	rDAKUCSsd1SYz/uXE6Po4jKpjTOXne6rlar/mO9hC1JwU7g2EJXJckD7/PaMU+Y/JkW4W5JpoO6o0
	+m5BQQpeTYZJPNiJRNc4210TGUeApZl5jMZCf29kHLjVtRPFdvL3iY2qhAcpX6jYvMD0XsP5hBlhi
	rPssGFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNta6-0000000DOLx-2kDo;
	Tue, 25 Nov 2025 13:59:46 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNta1-0000000DOJt-3Nmz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 13:59:42 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7aab7623f42so5789156b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 05:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764079181; x=1764683981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVFssVMsppemE9LOnYuL76lIRte65ETPod7a5rRBKjc=;
        b=aHPEdBNjeffN0h5Nw7vpB+3fj6eILpVWLoQOXJjunhDGqs8Td0irhVCmO2+BjY3t4x
         t7P6oEQwgaheJGj099bCJ5rJbF3MctdJVs5Es7j4TGx6K0V6lBGCLyfZVJTDs4ydYJPu
         dc4xtR+f6ziZjzRtaK48YPjgCv0BKpg9IXMkdM53XSNEWpnOtURKKHtQfBOWtHAexWXq
         6O29JIR/TIC6+rvjsCiZAmcVRE/q2pcAniHSG202mHX7emlD1SQnzxryY6dFajFD6hvY
         ax87yo34KUAjaZ/ORSt1iG2YGVEyKxrXAErW08ilzNeITg4q/X4FIbLiVkXAX2fmacxV
         THMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079181; x=1764683981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dVFssVMsppemE9LOnYuL76lIRte65ETPod7a5rRBKjc=;
        b=IJTTs9mUCDwNiW09wmd2TmlG6Zk7qD5OhM3L6KrBIDSCyYcEmbeJdj42F+ZYuj1lJP
         Vks0FUCc+a5JV0EevtQ4b62yQmJRq/IvbjZilDEPkQH9Wt/aJFAdOkF7kOx6on7+itlx
         HI9kWW26RqJNcoCsX3ldC1g8zDd3E6iH43PzS/Ki9m2h7o6aGh543twdGGgWIk7mRGKQ
         tD7ZcyrSzZESDhb5xpLpeX36kIyKo8heAbqhs8TmrR8ef+RbNNB7gucJdd5w2bjDLnsj
         W8bQxDPoTWaVOFRoNHJFbpCMsXN0WFyUxCyBJoWfsYVd3iQlUGw+lEEp4kZNcRlC2TNA
         NtoA==
X-Forwarded-Encrypted: i=1; AJvYcCV66jP3Tma+Nli3Ze/sfZTT2Au0MYKkcFqsIunueqI9LWqiCV+fYisAPUX/hAeqL2ot6GbAlVqRnTZ1eg48gJ7N@lists.infradead.org
X-Gm-Message-State: AOJu0YwpsLM3ZErqiahm/1rhca+Xel7VekrEfaFcp7Bz3MnBDMqNQIfj
	jIjUCMvuiG4hozG+4+tYDYUOAY/7hqUlqNie9O7t6F1I9qEiKQvp9+Fg
X-Gm-Gg: ASbGnctbXf4YCZpokm5UITlOyz0wYYyFEWF74/xkYsqQpMkDocuOmCHXSEQ1JtjwLN1
	4LNa8JnI1iWnQlUoQ0efAsj8iomzC/2HLSsbFZCmdOEwZ3ePRpLLDHfItGM+KGmQSmTRrk5a8f0
	rZQJaupxsGnURcN09TJgQZX1PfpWh4mlV7syPoFrgFCSnaM3HtsOXA1pidjFFiRNU303NBKb0y2
	bT/FpDxLoSFk/zOobWv5hiYVUxd8p0dL2TOveWfmxSD74lAxIEkpzHxN5Mzwy5SrO3Lh6qyOjVb
	8n+C2rhsWnSrxXsR+T+N07E1Ujqhn3DTCO7KDXg8U1Sg6fLXnMdjsVs62cqoVOVQNrwe5W3W3rg
	9k3oW7H0e5JP8bH9/Xy5adIneyJsT/Fb66f1iP4nQ80AH0K7o7rnoZ8w9o/wcsU/Djh+8eC6CCn
	zEYub69Hg/kKGHaB74/7zpOPZD7POMi3k1szpE20JeTEtqJjaFAwFbm+6mYo0siSDa8BFK9YNvR
	KE=
X-Google-Smtp-Source: AGHT+IEoiD8kKI6Top0lfEQal/JV1zBoB+qPW4yD9aP3atTXvknCMZhsSOAa24TqvLJc3MCbiSy7yg==
X-Received: by 2002:a05:6a00:9508:b0:7aa:9ca5:da9c with SMTP id d2e1a72fcca58-7c58e50cc8dmr15953870b3a.22.1764079181213;
        Tue, 25 Nov 2025 05:59:41 -0800 (PST)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63dbcsm18216028b3a.50.2025.11.25.05.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:59:40 -0800 (PST)
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
Subject: [PATCH v1 1/2] ARM: dts: aspeed: santabarbara: Add swb IO expander and gpio line names
Date: Tue, 25 Nov 2025 21:59:30 +0800
Message-ID: <20251125135934.3138781-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125135934.3138781-1-fredchen.openbmc@gmail.com>
References: <20251125135934.3138781-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_055941_844553_4E6C1895 
X-CRM114-Status: GOOD (  11.04  )
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

Add IO expander emulated by the switch board CPLD to handle UART and SPI
mux control signals. Also add SGPIO labels with FM_MODULE_PWR_EN_N_*
signals, which control power to each ASIC module individually.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../aspeed-bmc-facebook-santabarbara.dts      | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index f74f463cc878..4312ead311df 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -1328,6 +1328,20 @@ eeprom@50 {
 &i2c12 {
 	status = "okay";
 
+	gpio@27 {
+		compatible = "nxp,pca9555";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"PEX0_MODE_SEL1_R","PEX0_MODE_SEL2_R",
+			"PEX0_MODE_SEL3_R","PEX0_MODE_SEL4_R",
+			"","","","",
+			"UART_MUX_SEL","RST_SMB_NIC_R_N",
+			"RST_SMB_N","RST_CP2102N_N",
+			"SPI_MUX_SEL","","","";
+	};
+
 	// SWB FRU
 	eeprom@52 {
 		compatible = "atmel,24c64";
@@ -1758,11 +1772,11 @@ &sgpiom0 {
 	"","BIOS_DEBUG_MODE",
 	/*H0-H3 line 112-119*/
 	"FM_IOEXP_U538_INT_N","",
-	"FM_IOEXP_U539_INT_N","",
-	"FM_IOEXP_U540_INT_N","",
-	"FM_IOEXP_U541_INT_N","",
+	"FM_IOEXP_U539_INT_N","FM_MODULE_PWR_EN_N_1B",
+	"FM_IOEXP_U540_INT_N","FM_MODULE_PWR_EN_N_2B",
+	"FM_IOEXP_U541_INT_N","FM_MODULE_PWR_EN_N_3B",
 	/*H4-H7 line 120-127*/
-	"FM_IOEXP_PDB2_U1003_INT_N","",
+	"FM_IOEXP_PDB2_U1003_INT_N","FM_MODULE_PWR_EN_N_4B",
 	"","",
 	"","",
 	"FM_MAIN_PWREN_RMC_EN_ISO_R","",
-- 
2.49.0


