Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1096CD2FEDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 19:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQ1wEGecTU7HUYJqk8tn/NqQMtz8qSRIa72rOn08pko=; b=f1PSEN0guEnGBN3WAlCPkWLOei
	8a+V/XyzOKDZF4Ztey7arTScmc0ENUafRh5VBQx5ooIJSmxFckf5VcRaUthKqh1As4d+01tIIUJka
	Gn2lr59IHSCU5JUN6m1UQDdXTz4xJ7XHxI67MVhfQDG5z89w5gzgzzGgiN9WPtggZtm3w4Yp0OV1G
	r5Wwqe2DpFbgyJrscX2gM+PsNZD0Eg5mp6iODQRfYtLKDVmCX021+L8+WPAKGaiqH9Je4n9Lun+MD
	tEUVpuLHC0l0HZx4PSiARsILaOf1fkqX8MUQtQcXWasHuH9MZF6eGygXYbJaP6pbjACrMh7u4MDm7
	atvYvdZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoYM-0000000Eu2v-3ZV2;
	Tue, 27 Jan 2026 19:16:42 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoYE-0000000Etz0-1GDS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 19:16:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47edffe5540so69653885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 11:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769541392; x=1770146192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQ1wEGecTU7HUYJqk8tn/NqQMtz8qSRIa72rOn08pko=;
        b=O1tXn7GdxckcEIgqKTloeP8Lbbe2//MKnIZDi4Qiw2pSZQlOlsnbeaHZMeyebEXwFR
         liamqksLGA6238GzmdQJWPWx4bJ4Cq1EsIFP1ahLSIH2+hX+Rs5GqQ3d2SQbQ4pyTbMe
         im5MQG44GE/l14koYaV4XZHLK+o9Kj135xnmzV3X7T46+5N7AFsQy7bHZiZp3ymGSPQ9
         oDCC6Jht2a/cKkYUGgjKf7cZM29tWBxNd2kCzhScD8RPZKeSCqRF1LR3LHC/Nowf4ndy
         vU8xREHPHUcb6NXQXzvzO1Gd21fJnnphTbZTIJX+/Pyp1eOz4GoISS462qydf95aO6Ni
         3xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769541392; x=1770146192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JQ1wEGecTU7HUYJqk8tn/NqQMtz8qSRIa72rOn08pko=;
        b=KQFIhD1qRrJIJU4JxevUDqVZwKpH5PsqmkdkEFg28ikWVoA+HCj3/8xuUOk8Fohb5s
         Skw0dMorYpvpBVpKML/esWUhYlHAV2akR3aSs/d3jZtmcdtTYUTC6vbxAy+9dTT297fo
         NvacI59QjCXtQNaRzQ/jIKjaZFz/rl0xJxOEH5rN6lFfLo2mgWaDtzVx3y0U/qhGFhtS
         HBOR9i7XcgV98cxD6aKRaphAjciBP8ooTzK/DgaLfQSxCEPkvhci5OFD1LqSrIFpz3AD
         otOOaS8Ofo2+voKuXkRvilDiOdtZ8cqDHfXiF+OfnDODXavbPCaYLT7F7B58ObyAm6PH
         eXhg==
X-Gm-Message-State: AOJu0YwlpkirCKi9teo5mQ22cpVmmwECG2ZXZBUJdTsBxyckFpDWy/CL
	IKVqQY/7Q67o/4AF1gI5Qt6o5iiYrxPoDxKXTTgdw+97jSBYCHoIjLjgoejZ1Q==
X-Gm-Gg: AZuq6aKJj/0esjkNQjIaIonNMX7hP8Trvk8HHVR4fKYvfU+yjB15OUIUM4bTGyrKKyW
	e6Z/PnqEZAclvKUTDRhc/IXTwHBbpI4BQZFIBsMKj0JOKc/hXzfQNqwVTOPqcUffET3SrvZnwFj
	dyOJBIQ3/EYJqmkOd3fc46ey0ddvB57RcYzAosWwQf55zfhi6uxn4beAnQ7z+W1giA6N2/zC0Pd
	JrwakQKyinG/Lxc9rGgHSKBZICCuCW07RXC4dqFzmrP2azHUAcs9XSBD2cfm3DOERshbSyuxmbf
	fassKUqDHvt28vMDveHKuD/jzWQskSNTItsAVPv6sVXxRJnY01ZtB03ro8ysy6C4p5J8jIwqAar
	iUGxAyqqxC24LU9BT5f/XmLnPhthulPoffzrdbw6WAftFJv3JBya10lQG4BcF8ztnf7FUHa0BG6
	rtkfspdEaD2cumnZREqdWDzslz
X-Received: by 2002:a05:600c:3553:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-48069c20e4cmr41153145e9.10.1769541392290;
        Tue, 27 Jan 2026 11:16:32 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806df6056esm931525e9.2.2026.01.27.11.16.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:16:31 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/6] ARM: dts: Declare UART1 on zx297520v3 boards.
Date: Tue, 27 Jan 2026 22:16:17 +0300
Message-ID: <20260127191618.551317-7-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127191618.551317-1-stefandoesinger@gmail.com>
References: <20260127191618.551317-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_111634_354141_A84D1EA1 
X-CRM114-Status: GOOD (  13.31  )
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

This is the UART that sends Uboot messages and is accessible via pins on
the boards I have seen so far. UART0 and UART2 exist as well, but don't
have pins enabled by the bootloader. They will be added later.
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index c9295c2f53c5..4977b9a05566 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -7,6 +7,10 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	aliases {
+		serial1 = &uart1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -57,5 +61,23 @@ timer {
 			 * really matters that the offset is random though. */
 			arm,cpu-registers-not-fw-configured;
 		};
+
+		/* The UART clock defaults to 26 mhz. It will be replaced when the zx29 clock
+		 * framework is added.
+		 */
+		uartclk: uartclk: clock-26000000 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <26000000>;
+		};
+
+		uart1: serial@1408000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x001feffe>;
+			reg = <0x01408000 0x1000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>;
+			clock-names = "apb_pclk";
+		};
 	};
 };
-- 
2.52.0


