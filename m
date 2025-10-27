Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F454CCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23eUEQXgE/OVJfCXbnrki5PnT5McCVtuG+I3zbarJTQ=; b=GvCHIvGEC6OYeKMyk1D5xhW/Yq
	dMU1EVeBoTyq1ZyniWgZP7Lvwin7qhYzFa0f7RuS9394ekPQXyjUCaL0jwkr2DI+MQqclIwWDStRc
	j48lmWFfSrSuzST2I/f2M3AuELiqChAuiDhV59T4YSoC6I5zEMZO5fKF97yWdtJne+fhxzwdUfE1a
	CS2h10h+OVKWc6BEuPk+lPCgGW7qbkHxrPc1pJ4P4bpG80GLgpGoNPlXH+M771fC9jahto6lF24FJ
	zZhZuGPvNXZzMlC2NeiSWlihLDoOVISQRFcfPw6e6qq2QTn7G5NZry5IG/YuHsRLwe/JwQ+KP8MLB
	1+ZE0lPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJab-0000000DXw3-0DdP;
	Mon, 27 Oct 2025 09:32:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJaY-0000000DXtt-0wJm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 09:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=23eUEQXgE/OVJfCXbnrki5PnT5McCVtuG+I3zbarJTQ=; b=Hn689hJmD2dPtosX5Wexlibx6Q
	MClWxBV1aAIy9BQnViwx6o0EmojNdYTjF6dYCBtZTVwJrddCS8T4PsazfaQBoAMiGjmrUvQyoTwZc
	DcfAyH/q9bo2juNyKCpwLxD+thtQaqH+VspFeGP2pLvu2LGNgTgvcq1lvn47TSupaKRdH4QZ8FUSA
	UI/vpxrHp74oG7ze9/w8VIGO3c5QOHAxdun//gyGAoPIzDcfGdVxfWZlSusHP4MOxCO4el7+AsPyl
	tGOtqRREhx47ZWYwjt/BxpHc+Dj3pkQfs77dVMFTsKs3q42ghNlfFru8dnO0RJ1lJybMCkd1SA9mp
	M1nhi1Kw==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIik-00000001kpE-3YqG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 08:36:57 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-63c556b4e0cso317523a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761557545; x=1762162345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23eUEQXgE/OVJfCXbnrki5PnT5McCVtuG+I3zbarJTQ=;
        b=Mr3+JBq5UxGgHIDBmTFKRzC6osuPnHQ9GlZ7ZsEp6IsCdsZLRy6asYVZsKJOSGp/Mj
         aYGKhPSmnnrOIznxWDqU3EBmma8AL0hZe+GKcAtwkv+FfCwoZ7RoiBoqBaMWumApaznx
         kzLwczQVwBbpZx0Q/s8e9nh82QMgx24+libnlcH2wJs+dBTwYHz28m+yJyF1tZfPdofL
         XaMMnDsTI7zi+dJmYPjSvqZR+gq446lpXCr1T0z56oTYVndJDjzA4WfAoHxLLjxq+bR8
         PGhm7Me5jQUbQ3mG3lo+B9HzfLWzvTs5U7Gqjr+nAcpGQaxIqyFBH1HZiy8E2CHx0l8U
         5Fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557545; x=1762162345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23eUEQXgE/OVJfCXbnrki5PnT5McCVtuG+I3zbarJTQ=;
        b=WwBLK46jEFiQfj/TH11p8srQzwPZsjvvNkev5nbXaaykf9jch9IkZ6NKX+xmRZQ+pP
         kFbAja/i1aVDSGkS80wAdyAKZ92qRLNb7HUY4SKZijapl/GTWwQ91gW+T/QNe8b4RjKM
         RvVZSTd3ATw1iWfn96kmFAzCbhE7tY75wqqy8bHie+LFTWc1Uc1dyoe+ORt7ZVcSU3mO
         pQ+7aA7WD1vpp4mIliwY6TL6iuLciC8m+EWAk86+qKbGq18V8QUaZrvSNn1WL6BlWinS
         UZ9ZIxzaoSA3wSjtcAmQ/ksiaqg9Y6/CJ+7b0aUfjx+WZxepXzp29LnUZyeFbsOlbvid
         Vkmw==
X-Forwarded-Encrypted: i=1; AJvYcCWOgqscJkXHILqxDhm9bI+o485B2gpauaHiWobELfY/YiFYg4yuEyvE10zejV9aeiF6qq3sNK9pjHlNPt8P308r@lists.infradead.org
X-Gm-Message-State: AOJu0YzDiy1OpXJ7WTo9hPhm7Jg+Gy+xwJdaywWPbY4k+dCQsQ64S7by
	2OIrIBlfq1ZXR7N53l61p7SqhsF/krRKnrTCQpYKYR/+lX1Y3zzSic0J
X-Gm-Gg: ASbGncsSaK4r8pzFgOmhhj5r8eH0U+Uy92U2zpfZFolWh8K92shtcrfHV8r4MHpzWSK
	xoG+wCvO1q9yOo3vu9pXBic9z8wnAOt7i+NcjkWF3s+oJGu9qA3lbmIJtX6HwKq7XuYrP8ENumV
	w8omZHPwKfel0z16FySnqUIVkESuwKYt1iz9LE/P+AaHxOha9rXzw/L54qBvbrwWFvGHIip5MnI
	6hGt70L8iJcFpQ3w4x6ux/yjnTDWS7zZlz/CTNNKNKYPmvhfm2iCFUbcBDu3PyAKazYFo7PAoln
	uCqh7gOGtHsAu4S4l2SjVlFfQAz/ImB3W0+v0e6q9n6kXkru7a4y7liWHYdhJ76Bf19Wm9fXsz+
	6XSlgYYDq1gbDZZDWG5pKhifUV4w9i+C8pf2M4PYIktc5MHtJYNONmZY4X6MeBaVZGitBFJSebK
	BSsL4IC6cgyDKWWRfCDl9e8uXRPfKDt4T5WlGigR3WaO10NpDfGG8f3dji0QXx3JpuQO+uIE+zd
	eZ8MLl6At/zzDhq
X-Google-Smtp-Source: AGHT+IGTNqBigSY+yLBm+K5D+Qhni0CTXFG23WNwy2NenphYWj6Fl0c8XhhQtLNokHDZRXhqxEvdhA==
X-Received: by 2002:a05:6402:2282:b0:63c:2e3:6cb with SMTP id 4fb4d7f45d1cf-63c1f6cea3fmr28237052a12.26.1761557544632;
        Mon, 27 Oct 2025 02:32:24 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6be28sm5681014a12.2.2025.10.27.02.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:32:24 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] arm64: dts: imx8-apalis: cleanup todo
Date: Mon, 27 Oct 2025 10:30:07 +0100
Message-ID: <20251027093133.2344267-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251027093133.2344267-1-max.oss.09@gmail.com>
References: <20251027093133.2344267-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_083654_946611_1BBB4962 
X-CRM114-Status: GOOD (  12.17  )
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

From: Max Krummenacher <max.krummenacher@toradex.com>

Functionality has been added without removing the associated TODO
comments.
Clean that up by removing TODOs no longer applicable.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 8 --------
 arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi    | 2 --
 2 files changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 86d018f470c1..6ebeade2ce72 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -31,12 +31,6 @@ gpio_fan: gpio-fan {
 				      3000 1>;
 	};
 
-	/* TODO: LVDS Panel */
-
-	/* TODO: Shared PCIe/SATA Reference Clock */
-
-	/* TODO: PCIe Wi-Fi Reference Clock */
-
 	/*
 	 * Power management bus used to control LDO1OUT of the
 	 * second PMIC PF8100. This is used for controlling voltage levels of
@@ -269,8 +263,6 @@ &adc1 {
 	pinctrl-0 = <&pinctrl_adc1>;
 };
 
-/* TODO: Asynchronous Sample Rate Converter (ASRC) */
-
 &cpu_alert0 {
 	temperature = <95000>;
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
index f97feee52c81..7594ac61fe56 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
@@ -314,8 +314,6 @@ &pinctrl_pcie_sata_refclk {
 		<IMX8QM_PCIE_CTRL0_CLKREQ_B_LSIO_GPIO4_IO27			0x00000021>;
 };
 
-/* TODO: On-module Wi-Fi */
-
 /* Apalis MMC1 */
 &usdhc2 {
 	/*
-- 
2.42.0


