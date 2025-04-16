Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2884C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 02:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INCYZW3hzgKSK4AliiojJjATw3Q2KBub6aarsjSNZ2g=; b=OkXgJ7S51qJI7TdmUq5ubBJglN
	2NKpfXeNXYVNRSvo6uZQuJvuB3qinSLThoh9T0eEaCdjtKrJQoixcrk+PTLV6Zngh0+0wGMFKBK/R
	H1h8fmsMlg/0Me1BmPqe7RMoIOLyb8Fngz8v33zqUwaGDdHx5qz2PIDKCMdoEC6wXfHTXbhespDkH
	av568MRF45ulWyzwy4DmAK1alPHeK8V2rgLKoDy2JF6rih0Jd1svZwaIJkUSVUOzBwZgcHY5/ZSBA
	b9S/XelYd87Yb834zcyM/6OM2B9R6+efmK24i2X9InM9w9m+qNu+vTfK6TXBvMg3SXmv6k2NcWI35
	yjH4ZPFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4sVh-00000007wTy-3oCJ;
	Wed, 16 Apr 2025 02:28:21 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rAA-00000007jsm-2nkO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:02:03 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-47691d82bfbso27454341cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765321; x=1745370121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INCYZW3hzgKSK4AliiojJjATw3Q2KBub6aarsjSNZ2g=;
        b=AiQAE61SZaRliQG6FK8LP+o9ZcAT8GnajAJ6BHC347WdMmL4MmlgUZAjx6CUudUvMs
         Lg25yvOKTQ00aW/Xw54QqMwIPRyKgW1IyOs86+nQ6Nm1okwyUNQfuMdz0FGzCV/HejGV
         QBa2wsKPXIcr/TJ6sTO9TaogU0i+8JjOpA2nz/leoFmmAWpHoZBWHafbJjXbMXpAzrE8
         J4212+POXJ6zq8Mt5fZwV+CX2ORJ4J76E517rcxTglI07XmLpWv9ryf7VnDzmWNgMGoE
         lequkk/oR2f5BUbYXLYeKBzKz5za0aETZO9hNiCKdAur/JaGoWWHIIRX4nf6vBuKwiOg
         havw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765321; x=1745370121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INCYZW3hzgKSK4AliiojJjATw3Q2KBub6aarsjSNZ2g=;
        b=Sm81DXvE2TdK7z3Nvh21QNHtrfJDXIoeHkqDGyRy3rSPU9KOHciVqkWqgANVFFl9H2
         QIoaLOEivmd9fW86pmJSIPxABo2O0dJaqEDnNyWkAqpS7+CwVsr4/2se1yJtLbWpSDcX
         zlYX7RXhBmKPZSXxyGK4CGZqropEEqO4KyMKjXyiWCM4JNvp+pPYZtGmFMpqeQdgGiPA
         s0+6UcJOquxGFI8cyc3i2unI4nj2wdjWML8pP7XaiMh3zsrhUqOv7nJJrx2KZKXt7jjS
         A5ceN5SXla5u4R0O17Mjdaoo6CDGvvnq45GAwsEv63gyWAwjooYJDUFmfGZphLoX0ipo
         BPJw==
X-Gm-Message-State: AOJu0YwG7hX8+wx0BNul/uj9EH78rqFvZeHh4VbGwZATJeIauQs8Gp1F
	IvlMzlwWl+ODN/MpeLZ9skQOG6XRSrmKi1T0VKaCeKGtsf5sgc8iGzQlVQ==
X-Gm-Gg: ASbGncveYseGjAjISbsuydul99lHjSjydkwAGy/rLaor8SkjnttXX8HPy3A62o1MeW5
	FMDS814aHGaEOnN3JZ+GNR3L42y0TjXod41M08KObqZHF1EwY/uZ6uIHLEECu4YkxfC2ei7gqwn
	9YtGywG15tfRp1QLV4Yx9/AjPyX62bkwvojjXOL5EtsqeDGFUVS06F7MMhWlVV8JcLpXD+QDbtt
	9H8RciI5stvHNvNUKUzLAboxIZCXrkbQ/vxYg3j5Z2zVqlUSNPBb6QXYYcdjPKNlVWT/kUz8xzI
	al2uImL6sZthRxagiPTqIDzO1Qf57PJOJ8uU9uS4O9QLD7EDk52AWEhh+n2f2BH5F1ptxqnxRR7
	d8jrXzvGgFoNPoME=
X-Google-Smtp-Source: AGHT+IGxhkCmvbvhdNDyJBr3gKgLsE1Y/iVTIpUOgdp7ylffmNMMo/b6PF6ouKPTqYWmOf1JNxqzBQ==
X-Received: by 2002:a05:622a:24b:b0:476:bb72:f429 with SMTP id d75a77b69052e-47ad3ac0f4fmr21814201cf.42.1744765321404;
        Tue, 15 Apr 2025 18:02:01 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:02:00 -0700 (PDT)
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
Subject: [PATCH V2 08/10] arm64: dts: imx8mm-beacon: Enable RTC interrupt and wakeup-source
Date: Tue, 15 Apr 2025 20:01:34 -0500
Message-ID: <20250416010141.1785841-8-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_180202_705502_8CB11A1C 
X-CRM114-Status: GOOD (  10.65  )
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
V2:  Update commit message. Re-order node

 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index ed7a1be4a1a6..c7a8f2a6fe90 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -236,7 +236,12 @@ eeprom@50 {
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
 
@@ -354,6 +359,12 @@ MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x141
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x146
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
-- 
2.48.1


