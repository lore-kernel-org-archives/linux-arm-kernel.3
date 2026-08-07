Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19AEC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MesJTCCNQlP4+x64Hx4yUyNd9X6ssapmn5zWFOTB7M=; b=nGzeLQsKeu93g2TnfASfSyArs8
	wQuDO42lnqw9FhxJLcqXj642ZFVjDuJF4KQVAyk4/81ATHVnKgWEji678indh40nr8Ieh5QPyN+at
	e2SNjR5E9TqLt8kzR1RmKcX8wTFqZ+VpCSh48+e5DDKpRehnOPWcKubhYxC+WfN3ekflpiv1G2GlD
	DqxzWloJWkgDielDGXSAb4ZSY4SHFp2ZfYBxBZdKAIZIi5DPw5NSTzqkJXnMn7TBLOhBe2681CYDC
	HVitpNufybRp+eiy8SRn7qlf5QNe++Fy0dtMkxLgnOstIEcep8rKtUzWFFKllD9VvRbik/aGWIwVe
	//3kaG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFzz-00000007QJd-1wLL;
	Fri, 07 Aug 2026 08:32:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFzy-00000007QIq-2FWO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=3MesJTCCNQlP4+x64Hx4yUyNd9X6ssapmn5zWFOTB7M=; b=gbzKDxP0olmYC9mQgZnuv5fMFp
	3J3/LiZhFTEnYk5Aupesz3ocByyD3P+nj5zkwOXyVdKtl74cmsie2TxD8AfjXguBDrpK43Z1DzfRG
	cTeCnqyDgqoHBQDaOxWYkUTI3N4oAx9WcRoUSPKmGTcbF2u9D8hXUE96J5AD+hOOp3bqBUb6JuyFU
	jYecz5jaB14Ts6UDGiIuQAZeQ6Vtw5FZbS2m3i6ZEXiUs5J0C+np9H1G9DH9au+AiHSjLHT7xph/O
	2BA5n+qIfs0h7+EesVPlQO2SS8UkKAtL+41YjUTjK9ld6qG6+vljlhRiYkcvk2RqgyTIE4RfT2Fun
	6j0B5U1A==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFzv-0000000CCTM-3KTq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:32:13 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so2866086b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786091529; x=1786696329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3MesJTCCNQlP4+x64Hx4yUyNd9X6ssapmn5zWFOTB7M=;
        b=myXvcmkz84PmkDVFnEqDcy4sKjJ8/d2RvT/ncWEmIGurmNULmWeUwa2fIu4RaZlmv0
         6dQyV2AqBmPbAiQvnhN6Uzl82IWHNBLnNBNrBilmYegDbhne9MP/ktVDqT670WuMCpnS
         TnoAg/dBe0TVynEwgqfe+haNl/YPGM1aAMAHmBcwo9Up0kIouZ5UzIs8vGLxP8C+k82M
         OO8/IPfzUTu5+yOe6DfEinMATbCgrjsTbgOXz+WUhOrcG5Ky+eqgpiekvF3ZnMjAkDrf
         Z3xvw5m/FJxd6YzA1xgERV0qondpAU03RF1PT18JXuSIyB/2HkYbZJrJiLMzw2SR6ZlZ
         zOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091529; x=1786696329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3MesJTCCNQlP4+x64Hx4yUyNd9X6ssapmn5zWFOTB7M=;
        b=balHhePQHAfHHyLWg9KuqYdjJ0sojL/xU1yW9GRt9zWbA3dIssSQnwJNGmm8/wJ1jo
         TInkJF9qlV4D5JrPs2g536ZLMxjjoy3/A0fjdm9umGwfDTOC3/m2o7Z5jszaUD6OdW2I
         BYmsBdrtCvUEpaZbhhFd8LqDK2rWRw3zBGSwbI7pExaa+7+dE90Jv1Gz5WG51hLjLDlH
         QqklCbUUSeX55O9S4RFD2pA14eq8+FT6srHKtKGp7qvtMK7sjX8rPPo2le5ieO84N7xu
         e68r5jS7O+dJO+oi2aX/MIrx7FzT4hKCm4fkQfY7CaIVCO4WdxCX5Z8PhG7kYb3ud4k8
         uhyw==
X-Forwarded-Encrypted: i=1; AHgh+RpfDapi2uNkNUm+BFfONmUDpjDcT+lj6Ulip2fdcm5aPfZ471VMDXpvatSe4salz0uRr862b8ZLWA/+RUk+rnKa@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6FaLBG63/TaO5tLvGNC96xMz8zja641wb18k3x+XwGjJmdkpE
	unilDxskneG8WNL9tR8DKZHdwJXm+5e5mrKMDITYLKsUhpt36yDeYCfi
X-Gm-Gg: AR+sD12weYNnDjJW31JvCBtNcz3BIUWfGZhgSG6Cc3aBCj33Jp9OZNnAGemNvBt97dr
	GY5So37JkDiv9nQSP9uUuCjW3LQoZeEnRrI58ds9o4KEYcDjWVHPnYSBBs8bhQ8km9FsW2oEIBD
	nHb7y1Z/UD/CNCbPPLO655xZ7fJYprM3rr7on+WVmokKZ/0pfXfVSvpAAt2Gm//3A6WhbIgSqtC
	Ls613d4mdI13Upj/gbnmNmecew6A47sNZHcC3w9BdNOR6mLrV4Agev5I/ItrVYqoL3XAGTWlNN+
	uRQ26Ap1qFWe1z36b93GJZ9U+jmGKUie6BfdEekGyIvI7LYSbtoJHVJ/M8UXf7ayvN4p4mO+4by
	NqyHXa559jv/wJeDR7CwLNs4CHxt1Ry7WWfLuwEI27GTvL8zlUzNPHIlBavNaDJEzd2a2CVAk2j
	IzoiFxdK5nYwEfUdkEX0XWTGMm3oOnWp8DoEAyGDvsI+sk8ShW2Je0Xez4JYHInMd0PB92NJiKz
	3smISOYaEWqu8XqPVplF/TZTgRuifabDTfUKk/GAZsVez8bzQ==
X-Received: by 2002:a05:6a00:3d54:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-84f2e014151mr23029742b3a.3.1786091529420;
        Fri, 07 Aug 2026 01:32:09 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a553071sm627409b3a.43.2026.08.07.01.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:32:09 -0700 (PDT)
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
Subject: [PATCH v3 5/5] ARM: dts: aspeed: santabarbara: Add leak cable present IO expander
Date: Fri,  7 Aug 2026 16:34:08 +0800
Message-ID: <20260807083415.672008-6-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
References: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_093212_041057_CBF2FF62 
X-CRM114-Status: GOOD (  12.50  )
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

Add a pca9555 GPIO expander (0x22) on i2c6/i2c8/i2c10/i2c13, one per
module board, to expose the PRSNT_MODULE[0-3]_LEAK_CABLE_R_N line used
to detect whether the module's leak-detection cable is plugged
in.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../aspeed-bmc-facebook-santabarbara.dts      | 56 ++++++++++++++++++-
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 3d35a5a74104..ca5bd805d975 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -641,6 +641,19 @@ gpio@74 {
 &i2c6 {
 	status = "okay";
 
+	gpio@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <150 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"PRSNT_MODULE0_LEAK_CABLE_R_N","",
+			"","","","","","",
+			"","","","","","","","";
+	};
+
 	// Rainbow0 FRU
 	eeprom@52 {
 		compatible = "atmel,24c256";
@@ -866,6 +879,19 @@ ipmb@10 {
 &i2c8 {
 	status = "okay";
 
+	gpio@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <154 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"PRSNT_MODULE2_LEAK_CABLE_R_N","",
+			"","","","","","",
+			"","","","","","","","";
+	};
+
 	// Rainbow2 FRU
 	eeprom@52 {
 		compatible = "atmel,24c256";
@@ -1106,7 +1132,20 @@ eeprom@56 {
 &i2c10 {
 	status = "okay";
 
-	// Rainbow3 FRU
+	gpio@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <158 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"PRSNT_MODULE1_LEAK_CABLE_R_N","",
+			"","","","","","",
+			"","","","","","","","";
+	};
+
+	// Rainbow1 FRU
 	eeprom@52 {
 		compatible = "atmel,24c256";
 		reg = <0x52>;
@@ -1588,7 +1627,20 @@ i2c12mux0ch7: i2c@7 {
 &i2c13 {
 	status = "okay";
 
-	// Rainbow1 FRU
+	gpio@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <162 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"PRSNT_MODULE3_LEAK_CABLE_R_N","",
+			"","","","","","",
+			"","","","","","","","";
+	};
+
+	// Rainbow3 FRU
 	eeprom@52 {
 		compatible = "atmel,24c256";
 		reg = <0x52>;
-- 
2.52.0


