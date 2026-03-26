Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D1810A62FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mM0UiIcJttTcdCI1/5YlbfPbmrdM8cHS05utyZNdE8s=; b=NU5m1rRqT1WQmRzAUrP4uY8Rhl
	+X04fzX6t5ybaMmFmNr83mFumPkgav321HNImxnzuUOm7lgAyNJ9QaeAny3/Vp+Fr7csPp/GMiEWQ
	2vnPnQkC2rnUJx02DLuZyU/OpWFioFocOwCCxYnBjStpMjXvZThL2IrZweHV4IswhIzg2w/8jg1b5
	PnaRJ+EqXNzuKpEzVlC4oGmufVnSJBxwHvx0jRy2j0ZPkCbYUfmezdHdUjuqnaFbUSr9n9J+tJtIk
	4fi9Dz9aBoBkoGFdsL4Y5dMurKK1vdmaPkDaVnra/XLGg6mwq3nq2OTlXJIt6zpCu3gvqicn5HmFk
	qNXNip9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lqC-00000005fRZ-2KN3;
	Thu, 26 Mar 2026 14:37:44 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lq6-00000005fP4-2O0K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:37:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso10917955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535857; x=1775140657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mM0UiIcJttTcdCI1/5YlbfPbmrdM8cHS05utyZNdE8s=;
        b=CEaw66bnJ+WK0T29C/JQs3a7QcIAlJaYaRsHd/zPXS3r35hxmdMZk43zbAIIVHS+0v
         NJ0maZ9gJXQRjMwKDQNw4Wd0MotVOVI74E/tKaUrfvDo4DsCiF2AyioS4EaWP+bETKaZ
         fWVa+fOnrU/JHLiBL5Ja2ip9wsKGBgtfIMWpZYCObW2ws4vyFPbaXzrImSJg7EERuZ5X
         H0/KLkzjLqLZiJ4CUgXOx7GnSjbqVr6kplwS4YQtxhB1O/EhscGKEtZGJyAV3dNYI4vz
         bOEIydwNsquIa6cow7v502abQw4sDXPkjKSFEOUjRMTUiUXSC4CEZhMuNmRMbJtHCZWP
         GFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535857; x=1775140657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mM0UiIcJttTcdCI1/5YlbfPbmrdM8cHS05utyZNdE8s=;
        b=AC2K574buvj/bF3HhL9Z/aS6rqiOi5VvZkrtN4jksygUvkTophH7Q5F+7IMy2SJeeZ
         B9lVZP5AYdZXwDReG5pteKFSi8kXS5WcSCcm+GGlkeCznQA4CQmc5tkE/Akd6+ir0S7+
         kujBNtuRoGDJEkS6+BqdREAvQ/WXyXPsgxmvLrWOb+37wVrdFCQekEm8C696NWyQbUKY
         KOFd52pVayqz4v7ozlydD8VJnQosOSBApEBEp3Gui8CDzrJM5syzMjslO4GBxz62VaRm
         u5Os++LZ+jiIjT0gY/LLBo3NSoEL/46+qAs6I06bUsKi1q965TqEpfZv2wUd07kbxF5W
         liBA==
X-Forwarded-Encrypted: i=1; AJvYcCXAn0O8AX7iXduHXN457lX6YhoipSabhviR9i7C0IYpFiyGb5TtAogpi/rrED+xrxvQigoM1ZKNA9j3cJ6FrfxO@lists.infradead.org
X-Gm-Message-State: AOJu0YwGAVqNTQLx/1U6O66DYNrM9G+Ye4tMGOWzhr3eN725eZuHiyI2
	GUsp7jSmMHx5lM251oI6azoykiCAuq9QgyFpMvoeWTaiCtYBmy4BQZwB
X-Gm-Gg: ATEYQzwdcx0wipWiFtzTTyvcgx0c3M5mk9I3LXEtX84HGzqAxqCNj8Fhj98ITnFtPGv
	NuDNa8/6o/BQGr/DyVhizcUWQQ5e2JAHeRvObPRBRVB6+Y8MSnzHPM6igNcPkjFG8UpbSeFjwav
	CCnH5/dQYgo13pBVu+lXvWlO+eibClWgw6+hrtt6mLev6IYIWYGjMMHUxPYIKi/3x1AcpmJ+RlA
	UGiB2kMLeVWIwtY79XD4io4SuUpNf52mIouiTLaPRjEIlVAbyx6rLVbaGPL+/L6+VBnlomN/qbl
	SduWP9mEiRajF5Css13hGBF4+aMu3U+j3L3VXHpb8m1qK4ooRPq0if/Q1865ggPFtYYipj1xmK1
	gPFPZVBqAONtfaaW1PNMlFwlFlYSMgH0+V1+T0N6hU1Wz82uWDEk88tWR8gxWIfdRohtCPmjJdL
	6tVaXdMMLCS3lITxpNoCqslzZQGGDsJxhG8kKiHyH0Umt7d3Zu88CwKyG0rE1VplOUbxYVkuSvp
	8zopzHvsnb8+fZCMreGdw/9YP3GM2ADOfkKH/GjkdG6QROy0A18v8amnMUcg8lQzjTKyUH16gxJ
	RKU71VPktJPvhvoXzaSm
X-Received: by 2002:a05:600c:5296:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-4871605ceb5mr124171915e9.16.1774535856243;
        Thu, 26 Mar 2026 07:37:36 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb5845sm34024185e9.15.2026.03.26.07.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:37:35 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH v2 3/3] arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for WIFI_UART_EN
Date: Thu, 26 Mar 2026 15:37:06 +0100
Message-ID: <20260326143711.143462-4-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326143711.143462-1-fra.schnyder@gmail.com>
References: <20260326143711.143462-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_073738_624086_C5D6443A 
X-CRM114-Status: GOOD (  13.93  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

On the Toradex SMARC iMX95, the WiFi UART signals are shared with the
JTAG. The WIFI_UART_EN signal is used to select between these
two functions. A GPIO hog is used to select the UART function by
default. This DT file is going to be used by both Linux and the boot
firmware, and the boot firmware will configure the GPIO hog way before
the Linux kernel is booted, therefore there is no actual race condition
between the Linux kernel BT UART driver and GPIO hog probe.

Configure WIFI_UART_EN as a gpio-hog driven high.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: Remove unused label for wifi-uart-en-hog node
    Add explanation to clarify the safe usage of the GPIO hog
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a90edefc5197..8eef26eb0f87 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -451,6 +451,13 @@ som_gpio_expander_1: gpio@21 {
 			"",
 			"",
 			"SMARC_SDIO_WP";
+
+		wifi-uart-en-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_HIGH>;
+			line-name = "WIFI_UART_EN";
+			output-high;
+		};
 	};
 
 	embedded-controller@28 {
-- 
2.43.0


