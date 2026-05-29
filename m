Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54952CD6E4E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+aM/24gP63Krqe0+2Zo2UxbF+//YntcPeOEzBEtHfs=; b=Z4pZB69jvI+ouTWk+AlhApx1lL
	OaacUSzxS+WzVqcHJwXEHVs2iywMKUfIGNwTUamOvnyhjLa3DzWnWvGcKIwBjOxr84dgmZ6qTs2sB
	V4a21QnuycFiMARiqDLySJ2eZ9qO3uibRanPFE1A2YcyMq/I/vTqLgpunCY0P+N8XQoHwLZU33x8o
	O603PTW1F3jDR+F7lu1ONQGxRidx68RSC2d/TjOa8vndC7oSsvBR/0qVMmlQpWplWNSZFYMAp/my8
	5yyK4PDwzd9VeQk1xmwEZDRYbXVvJmXNsKf6KN9TbqLvE8FWq6CsOdevD7jgIUn3jZRT8J258nip7
	8wY1R3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuBV-0000000799f-0JM4;
	Fri, 29 May 2026 10:11:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuBQ-0000000797g-3Qr5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:11:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4904fd4f6aeso60589125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049475; x=1780654275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+aM/24gP63Krqe0+2Zo2UxbF+//YntcPeOEzBEtHfs=;
        b=Qp45RIJBphav2B4WIDqErmsnMIEsT+PgIdbaOrgL2vXvj0d0YgUiZB/ScDH4uDahyg
         PBS49YhzaT1EsJeTHyP6ALimX0ofnVybwzIz/W4hOYSgoVIQ0thYktl2vbxXVEciwI9w
         +2b4ZKiU7Vi3+Kqy9lvdHxdyD7YY2R8d6v0+6b4bmUhcB4kkQtmhAr8LosNonqS5oDHP
         PQ/yBK2CRJdTxKg9Fc9MhVILkk889/S5ZwBQAKD/9m6I1DeK7YYydszFME/25fSB25nu
         hBSewtw3FUx6U+L9QgEMz/DfCPB2wMddFYKRTGYs3Gl2IIbF14E4bd2bO8951zv387mB
         mAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049475; x=1780654275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+aM/24gP63Krqe0+2Zo2UxbF+//YntcPeOEzBEtHfs=;
        b=OUI0+4ShKEhhcxK5fV+SWhOejQBrg524J/tF+r2pgvDEg6cb6hdNtJs7eJcSJ9+P59
         vuIzU573lf3hjHWR6I0+trxcOw3hHn0Wxb1NOZrY77UaKGCT5IrQmiW8W73OM6n43WDr
         OQNe52gG51MOuhL+3ZRBKgT84vFcoxW7IZ7LvqcokiKUq6xXPIo0QLbPyxAT0zGxZ5Uf
         fhSKafjb1kXFK/HmU0+QsyqaN9nuoPlC+exYaSXQegRzvoEChFvxo3svm58hhTK/mPS8
         ZUPP8CXICCG+RAT5kGJAU10V1tkpOSJad8g71yt1W3UWCgKXekXZy/dVQXNvuIL7fmw4
         ZHHA==
X-Forwarded-Encrypted: i=1; AFNElJ9bQdem1efj6eAH8wTDZzrhnahZe+8R5zFE+z8ZZA/wJJGh1EiXbx5K1B3YOX6g6wVn8NhG3joxfq36F+vL53pQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwFHs8LyVHV2iHZCZLs3uADxboNttoAx+SmIH6qmoKW3P1PqbNb
	r663sLKGJ5ICBX8cRgBziwMEwsJ8jWRCjv8kZnM7FhfBoz/IPK7UBP9b9+7XPw==
X-Gm-Gg: Acq92OE/OZEX4b+0T+1hO7tWdYQonRYjvyIYMDLivCJgsXJmO/orlQ/npUl14ZF3jd5
	5HeCKiH9Ob8Hc53W47Rk8K5kF+7EXmFI9MSsPymebdEUHIyKNwHqHeei29rZgRhOhIouvMVsZWo
	GmWq3fuUW4xDctMiYq3czSVJrFouUrVKgxEdatJMLNhAZejReLwQzc5ovOIPqJ52uLq+FwvOmDw
	UuWpnU1ZYqhCB4t8q6mDDMcmJSWADJx9W81FWUbiF6+BijXkEn+mZoJ+9qARYq5V64YsN3yojg5
	C+t6ZAvXO9F98FYuFWhqcrfBfQzjR20KpK7AHtlRXfZNMkstTwk2JrtUlC5zSTrwMrTl9saY5p0
	JH2JYdUCDVn9Ouab0O3lpcXr+161AA+qSFEirr8JU/th3Eeyl7gSJzFbR6q8Szv6NBGYDlEbSu3
	ARUQ/eUHXuFF9n7uktzS2U0SygnA3EFms2BGoapUZ+dnEVwrOCqGhf7PAiCEV75JDN2dKdrnNgM
	+zx2tBVHDKxX7VOVwyr2YtKaSazT3IsCvpTXETQRAYNYO4=
X-Received: by 2002:a05:600c:468a:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-4909c0c9b87mr40354715e9.33.1780049474638;
        Fri, 29 May 2026 03:11:14 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:14 -0700 (PDT)
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
Subject: [PATCH v1 4/4] arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
Date: Fri, 29 May 2026 12:10:51 +0200
Message-ID: <7fa810b0227fde0205eb0fdefc6a6ef9cfb279eb.1780049085.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780049085.git.stefano.r@variscite.com>
References: <cover.1780049085.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031116_880937_068F1D6C 
X-CRM114-Status: GOOD (  10.61  )
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

Enable TPM3 on the Symphony carrier board and add the pinctrl states for
the PWM output and sleep configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx93-var-som-symphony.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 23b359e39094..7f79cd7e7a4c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -325,6 +325,13 @@ &lpuart7 {
 	status = "okay";
 };
 
+&tpm3 {
+	pinctrl-0 = <&pinctrl_tpm3>;
+	pinctrl-1 = <&pinctrl_tpm3_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -447,6 +454,18 @@ MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10            0x31e
 		>;
 	};
 
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__TPM3_CH3			0x51e
+		>;
+	};
+
+	pinctrl_tpm3_sleep: tpm3sleepgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__GPIO2_IO24			0x51e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
-- 
2.47.3


