Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD30BCD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWQHcfUz+e7hFeGnQ1jO5E5XreEpZyjDk06utPJH+A4=; b=hkQHToq2dlkA0ar1tB8Zu/WFhY
	68J2DSSoMXdgZnr2pfywfbqL8RF/7sgG0FREpQ8jqejdd1F6/iEiruKEs3xmkg6CWHO6FFNMyD2F/
	F27ntvqPk5RzsmbEIG4+fxxISJRPHl45Je/OSG6L5mg/lA67KymkcoOC+vy9D9cuw0Ma+NThyTvuN
	7cWV2d24fcvbZz1+ZFnZfvEuGPTyMDjfGjh4vARgQEryPr5Flfe+oLcVr8zCE7jqKxgUmpttdr1+N
	F2sfFFNu47oX9mxvki8YR0xFKYigB9/CWbJKFYSwapDxwqZld8ADCoAlxZ0admRFCwjq8MCDarIBH
	2lLrLdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSupq-00000007E46-1ZH7;
	Fri, 29 May 2026 10:53:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSupk-00000007E18-3Pxn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:52:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4909e3fa4b2so4479375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051975; x=1780656775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWQHcfUz+e7hFeGnQ1jO5E5XreEpZyjDk06utPJH+A4=;
        b=QU0qkcYUwKCztifwuFN2kInIDm5zfGwKRDltZ+om5i8VOFW1WQN2nyc4+Jc/djJL7Z
         SBhxjEKJUb8eMjNLc3USxL716DFo+6v/Rznr34CsikvZmB2IsxnOv1eivbKBcXYpGcxO
         HCGBmFXd86QA6D+mrPZyYXeE/Lkvw6DPl6ydx0CiQiIpDd6FwSm1OMzzAAS89yxlk4bC
         dxcAVcKkLmS02UXVCUKrVMMfC/kXK5N5Rzpha6WrnMFT0qVc0mJZEogVBbd6c9cqSyVj
         HUOGhs+6hvIyTyHhrIBEL2HE7Wj8TjG/IsrWLPMxQw0qiwB2Z8I/BTThhrmi+GRxWtO4
         64ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051975; x=1780656775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DWQHcfUz+e7hFeGnQ1jO5E5XreEpZyjDk06utPJH+A4=;
        b=hQiUrVavOGEiv1FB1kK0jEsb8v/xeqmaPWB38AjE+m3me31LN62jPNVazKyEY0I23f
         d7tmKU2mlC4Vt7jvGciTmVSbqTSV3UjK0jiRFFTt/6rZ0WHKIRVk/yARQmFzsbDAvQKi
         1Pc0uG8LTncwOeX7lrS6VaV1cT3dkCcRMXwLEmgCFfme+4EvSgm9qpuaG6B8zMEpXZ8/
         I5z0S00FsLbEQfMZnIRP8V6rwF5mfFBw8jcySamKk3/AcXgvpBjBSGl2Mp4tdAsfb5+W
         HuMLxi29PsNjpp/zaV58LugpfWV28Y5aHF2BPNgVHCqGtcbodK9N3ehgE3YirOc4Hqts
         FZlw==
X-Forwarded-Encrypted: i=1; AFNElJ+iPfKlfiZMrhu2HH3KwJoSA4AjAThvBeey4LEhvD+wfoEx6qHU/CSV6NYIsTVIwf3SlkFM/DMyhuZg/rtp7njS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmk3aTz7ISw0eD9uP+qg5gaQ/3ACrO3MNNJw/gzgAxVUwcWk2H
	g5S2Pg8wVG6yag1zRPcggyglfPd/13AON5lEcW1yOqHwCWzIlaZBH36J
X-Gm-Gg: Acq92OHULHsqz2Esa5TVPW9hyqtP4pCVOUBUVk1DdXJL+WQ6dORPcKTEIwpmvF8pHYr
	fuYlSbi5ZiSr2XSl+IJWfwSfEKbFjgaVEpOdyNcyMavaVZws2bNE4d3k+x0sqyfrwnsr2DwDVVA
	BuitLmiZSNQ+w6KZsmkc/JP7q9bUB/DHAGQAKkEUzNkW/fFjUSDNhgO81+1RAilfUDqpBJoSevA
	/EHAgHeKzQIMxxGjqtdzhPGUXRvJtWS758ezDiBXuWiJM9AagnnZuPqGPKdAmSm5iZuhXe55peM
	/ZekVpQGeE7zWijJuUpkpuVAhZE7FPCGtNFzYLN4FAg6tOFLuugm0WUw4Ayl9kJSLdgiM88rPmo
	FQesch88EElPb1wQyrpCqO9HxEeLYuD0GNIM2e4jik5VfiQyZkSuD+kHl9ENnyt+yHvFlu4ORlx
	w9b4+0MXMSdeE2QtUbwyFRKOAgg3RBaAuybE5INbtEfkt8aC0VsjwQWOxi8FSd/V/ONRn7kYzhZ
	RZIQHl8oHuNWKrLGX/xs9cAnIs8gdzGvC6ofLTAGXUqoxL0mMKpANW2vQ==
X-Received: by 2002:a05:600c:1550:b0:490:5191:6e1a with SMTP id 5b1f17b1804b1-4909c0beca6mr44279045e9.24.1780051974848;
        Fri, 29 May 2026 03:52:54 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm2541596f8f.3.2026.05.29.03.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:52:54 -0700 (PDT)
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
Subject: [PATCH v2 4/4] arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
Date: Fri, 29 May 2026 12:52:47 +0200
Message-ID: <a13b3122e9ec41f966909281ac2a801689c7b98e.1780051874.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051874.git.stefano.r@variscite.com>
References: <cover.1780051874.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_035256_880227_9D064A3F 
X-CRM114-Status: GOOD (  10.69  )
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
v1->v2:
 - 

 .../dts/freescale/imx93-var-som-symphony.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 37bae4913bcf..a49c8aebfead 100644
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


