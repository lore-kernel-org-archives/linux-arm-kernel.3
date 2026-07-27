Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0601C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wCGKHXxtGl6+x0K8ImCCepzCmvd/Lbkwu0KaZnoo6vI=; b=vPdWj0x/lkt1b1szpeet3Gmw+w
	9xsR4mf3gB9UbkIKXPztd/lV6C/BiEkjRg2gyPi6VjVX1iY34dvafNz110UHfFs7/63G9r7TTsFPC
	OD6H9Avd1+rGALyevpgCMsmvc7Ao1e0D0RN+j+DgOBl+dRpO9y8MFcA6qVCSKOnTGURlgFWMCHSQH
	fP9JRUDphyIU9121R534gKPij8d8RkhzG6+oERIzbBV2fAuhFHMoPAEipT9uORMIPvrxmEMLgqkQA
	C4G9TU9W2IxoVh3HuBj2dDCUsl3tfHzbU1k3C3TQy5A8yakjLRjmJqTEdtO4fELHURCLrO1rJBTJB
	kluP0ZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRvz-00000003poz-04CQ;
	Mon, 27 Jul 2026 20:28:23 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRvw-00000003poL-2323
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:28:21 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1926368a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184100; x=1785788900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wCGKHXxtGl6+x0K8ImCCepzCmvd/Lbkwu0KaZnoo6vI=;
        b=ctw/mxhfkXrT8fP0I2rCqIAbfBzentGlSmzj2wMaRKAv7Oiabj0VmFfzods8BAarCr
         ye4zH7VgPWPFJ93Z4VPXK2XYXmJdjptU43OmIx7lgTrQip7uMfXLNc4P9nYoG6FihIF+
         XzBMhpqB+nclHJrzJTjMg435FTKpEcApIRMROXYSi3COsPHkUMePDFq8AqeoV523PyaE
         lyeIUxnzJWPsVuhtFwqbXf+wkA7xejPDxZfdlsvSgdza4iSTHLtakpoQwd0NkQtDy8OU
         92qmbIJ31quKgVuySKXsr/LweL8o/yWKiQ2Ys/KA2/lTFTLL4F+2j5b4R5f0eEXPRTSm
         yHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184100; x=1785788900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCGKHXxtGl6+x0K8ImCCepzCmvd/Lbkwu0KaZnoo6vI=;
        b=EowKMOmAkdZ4K+r44GmDgKX6/2LX/CLp4IreTOCbPpcXL72guazRDMVJ1aCiLMVO31
         IaES2bTmqWMA3h9ToJT/S4S8XU7XPWMDnHJVNEKWQcqVoislFZnWQVkcP57fzAXz7fRu
         H7jRW6KaanLM8FCEvp/Q01aoyrgUejTpYWYbrlAF/PW/nR3y8Jwphkr6Zey2mBdxt+IM
         gJc1OcUbrpg4xNo2Ijs22qcdOpCN7r+c2VfMg0r7PiqnNpL1Ae3LwOuOX/2bVAxu+2bd
         tAlcV1McsXOItYZ4PkSLKzqzGrE8lnrVpP78hWHBCQpMTeLXv5NMVDSwcbk3zwgs7QQT
         ERtg==
X-Forwarded-Encrypted: i=1; AHgh+RpZy6OMx52+9rh1N/icClS1u7X28QG+PnYx7/V3SwBy2EKy7nqlW3S7As5Mk2m5V4mR+3OAwXfZmxkU8GD2LvfA@lists.infradead.org
X-Gm-Message-State: AOJu0YzPJmk5fQTZv6d+U/S0WIQAgx+wkZCiKK9HaPAhEdk/2axhk3af
	08bWu1k0fLSmPDllvViLJ8X8NlR8hzmk3Icqi4Jt0sbbbneIKRVaXKPi
X-Gm-Gg: AR+sD10tupXkAElpEjryaIK6AkvO04oMlR3F/BwD6o5erwWYQ6xxZ58lvqTD9M9DQa2
	tf2Ev0UR40PgIGgK0vbfzSUAheouP/vO5C5hs0oQ0Brol2YEMppzjhtXAPDlh6EIvh8Nghq6SYy
	rV/7VrFw3fH7zPcoB0uAuSri5zoHy7AqLtwVzc7J1H+wHgDuJcxEmP3JA5/k8A7y78vINq44YME
	eCJ42qLqeYrpob+c+KcCCYrLCPes3Cydk7hPTIlRMPkJO+0jwAiPuD2teV6PiupLZGde2C29kqe
	+uF7nuz/1j21R433mqS/V+yIK6bS9EooHfGsiS2wKHAQeitC0R0LW/UZyRArgocj8zq8D07R9BY
	Bvv7CUePRh0iuyeKm+S3NbDWIIL335herSYI7zf6KEvOIG2FWD/TTMLtWxXa84HCZLcflViuhQY
	8ha2t58nDwuPGxGZC4OZk7QAnBgBNnWSjGelKMXhcxZEm3+vQt4LCgAWmVarjY62pdEDXX0s3ya
	GxEQIpWkEb+oH3ItCETAuIdykrF3+SPV+VHBRk9ZEgvcXpd9RWsyM9Ft1cpk77bwA==
X-Received: by 2002:a17:90b:524e:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-38f64938266mr765946a91.3.1785184099513;
        Mon, 27 Jul 2026 13:28:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1290sm35391534eec.1.2026.07.27.13.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:28:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: SR400AC: set WAN MAC from nvram
Date: Mon, 27 Jul 2026 13:28:17 -0700
Message-ID: <20260727202817.22085-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_132820_523566_1D194231 
X-CRM114-Status: UNSURE (   9.78  )
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

The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
userspace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-smartrg-sr400ac.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
index b226bef3369c..03f4a6d37a67 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
@@ -25,6 +25,16 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1eff0000 {
+		compatible = "brcm,nvram";
+		reg = <0x1eff0000 0x10000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -118,6 +128,11 @@ &spi_nor {
 	status = "okay";
 };
 
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &srab {
 	status = "okay";
 
@@ -140,6 +155,9 @@ port@3 {
 
 		port@4 {
 			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
 		};
 
 		port@5 {
-- 
2.55.0


