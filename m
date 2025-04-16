Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC1BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 01:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOP+Xk7g3usaXB8DY5qKgeIjsWqmRpi7//9PYTGo7zo=; b=0p/vjbDwwXxjadqhXddxHivrO+
	pr7m18cDf7RtYEtZJ6zj+WSPQrQu9Rlk+cQxHsvZ6ZrrwboCZ3pJ0hxFQTP5DIxU3Qs8UHICCdKZJ
	131CX4GIDsjP5QMJB5I1nr7sZ94kEaW6QoGy92JsWbn/ZyhYpDJAWV8frtHMMpRJQYRC5gL3DjP3F
	syQVjHZJnSt5pzlHMCvRNwp8FYeEB9Y2FOT5BButyJCOM1Mc7iF3i3zlwckx2NE9qP6DurvgFjBgv
	RfUYUK5qfh47zk++iLRw+POjA/q9KgJL8elXW1TYv32LKada2m+vZJmE1YTtK+SvTmEWThwduOs3Z
	4VnLVD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rTz-00000007nZa-2kgi;
	Wed, 16 Apr 2025 01:22:31 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rAG-00000007juL-1kTf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:02:09 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4768f90bf36so55690591cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765326; x=1745370126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOP+Xk7g3usaXB8DY5qKgeIjsWqmRpi7//9PYTGo7zo=;
        b=ECKLJC4ZWilzBBn8pG/++Y+A8cD/UD6pLTS4/UStw+iXWui/Q7RzEQRHM2aderMvWr
         UaCoxLFop1mghqfPD6tdhxOsd9nKeBiEjlsVMxj/AlQ8vKPoBmZhhPrM4dXDlMCJ2JtE
         FZ/SiAi9eDE/VGf7dOxUfftoM2LBp6EaC3upcxlkrsaB1+n+QJgfgjcr5K5Z3PH7HarS
         sAEgfKerWH5TcORAxGG8AVOMdG6IarAozJTugGjS6GQH9+4JV3vNiFO0U4ky84zPVCOw
         J2RtHmIq+D7KXGLqoaFPmOK58AOkoemYwnydvlNyE3NnetW70r5zZ5uqHVXbTcK3NmfD
         RoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765326; x=1745370126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOP+Xk7g3usaXB8DY5qKgeIjsWqmRpi7//9PYTGo7zo=;
        b=UcI4yLK8UuUWLtKZUDDsVP74TW93xspt26JAzSRwJxkHFSZx2fIIkCeCnhSofun8W8
         7RmtFHxCwfCozfwUNO6GBuN/2ca4CIbzA26oNFVbeas0mfgJFmiexhLhd3YAUuol5ZtZ
         Z0LMJkmVZzDJZ0tHjLPsJHoj3Kcd6CLb9WwTSnC1SMlYf0ZFiGRsUEGP8JlDgXAuKZkq
         2oKcAJLREHDs8LWa+Zgqju6h2ILrxt8Qnh36Ts23B9ob+FFWNslp0wtLtrHon3TfrgHF
         hT/hLhxzeaw6x4/4orBe3SQZSbMU7lFHmf0YaxXk84s5NXX4KOQcbUjVluv4YCkn4x85
         oODA==
X-Gm-Message-State: AOJu0YyyxWWEfPgItB9rZqedVPTz0ALNmvt+ZpoVKbms9vGpknPvlqIW
	kZuHG9k+0t/S9Ys9wFxJbOXIlgkhxGbAObmruloxOe/j7YpEJoB+4putBg==
X-Gm-Gg: ASbGnctz6CzoKxGuoarP6uBCv1ZHPKgA56XvQzmBjnkuZrlHebgDdPXl+oT3RSs8+8b
	MI7QQEvR1Awt5tvcLr2L7a+tTC+X17vERRUmoeWmvkHx78a3i79Ne60xOL4Y4k1Hrtw5f5iB8+I
	EMoUcBW3nRY3dw6GUHZDyP1JgoPlcU7ZvTPJ4lcteQHNTgk/vu8De5++YgtqEOYrEHg6cTZZwdG
	Fmb5SVoh9KYw9Z7KC4o56jaoRZd8/GTAN3etku8UBrJEpPsQFTRQV5R3DXZopBWQ8uMNPNOFPRq
	BMHpQFA7wYiKWaY/xTSX5HPHK/3sT/a5XED2IuxpWuTlPDRkQwSuiLkQqNP5ZXYTzJDhQeqsOHQ
	npwChaW/xv2hQXHRn0qixMs1DBA==
X-Google-Smtp-Source: AGHT+IEDuQm9Q9+u2jWvi1Km6PvJSKi5AhyyT3K/6Ng/ENPnCAb53xcfqp0yjXnII20xvajqm5l6NQ==
X-Received: by 2002:ac8:59c6:0:b0:477:41fa:1120 with SMTP id d75a77b69052e-47ad3a1d777mr19903451cf.12.1744765326454;
        Tue, 15 Apr 2025 18:02:06 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:02:06 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 10/10] arm64: dts: imx8mp-beacon: Enable RTC interrupt and wakeup-source
Date: Tue, 15 Apr 2025 20:01:36 -0500
Message-ID: <20250416010141.1785841-10-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_180208_454165_D31395A0 
X-CRM114-Status: GOOD (  10.72  )
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

Enable the interrupts and wakeup-source to allow the external RTC to be
used as an alarm.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  New to series

 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
index 88561df70d03..6a62cb32e22e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
@@ -257,7 +257,12 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 		quartz-load-femtofarads = <12500>;
+		wakeup-source;
 	};
 };
 
@@ -382,6 +387,12 @@ MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x40
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13	0x1d0
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX	0x140
-- 
2.48.1


