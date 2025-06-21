Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB4EC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 11:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UF7hadND9s3UrrMKF80WbZP/w/q/Chjap2NrEwYw97g=; b=0JtKwNHtAzfS7MB5egcrhgC5ds
	gYb6A3XXALlzyS20K4hYVOlAoRMahU/iErwVys0BF5d6DJUEXACoeUQbCQ2C0mpBAVLYoWqs5gPzR
	t9AcYBktOE/bLDxY/2jVm8ASR6crkfvvCsRCnNNGe0JYQNTasmrTW07UZ73bydj63iaLUVcdIv7kp
	aeuE4HsTKMbqA/OaqEbdB6M9axuNLL3ZMO/oSUbIk++xMgs3n3CotYPUsrz076CVIShEqEqbeefd8
	7TO+XZrhqYr3PR+WDxNRN23I1buDSbJTz+8UZqo7zgWjhQl0aqAfIJxcUwIKYoWvcJH4p4/n1BDjK
	WN2g29sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSwMF-0000000HOOJ-2DCJ;
	Sat, 21 Jun 2025 11:26:03 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSwJX-0000000HOF4-0yHI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 11:23:16 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3de1875bfd4so11002495ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Jun 2025 04:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750504994; x=1751109794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UF7hadND9s3UrrMKF80WbZP/w/q/Chjap2NrEwYw97g=;
        b=OBPJOplLtEh2OqrRZW7mu4/KNigr1YK0K/wumzBU50qaiRdKyw6Uw9WKQyszjMPwqI
         AXUyKlRDLAu/1v+VZ5J2yUUFjVlc+tO9wp0sA9V+oxofKSR+0Ps6LGIbI4UAmdDTK1T5
         VNMQG4olHXQJub/pV8sf3MwXfcTLiQFfud4m5KKvSLy42itdIiiwyNA66z9q1HjTheTD
         QECZxfxGOreiRd7aQV7Nx2gLPh7Nv91tQs9R6//zzuE24QrmIlApvRNNBR4FFxqsfO+Z
         Hf51k87X/hWb0RCt5J4mYNRiORZOF/L510whskLiPytmGE0E/LLPyOQeMXZtjSKhomXv
         1HzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750504994; x=1751109794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UF7hadND9s3UrrMKF80WbZP/w/q/Chjap2NrEwYw97g=;
        b=Cx0evdpTikCxcp3//0xOVFNQ9nheN+fEQ6SMMFFlQtQ4Jkix1x8cxGeuUYujpp2zmG
         4OxIWbJnuyiWtmB/sQ6OYPCCxelGkSCB5MDZN1qmHig+keR/M4WSDXadeFtj7zhPZnQt
         8lJQ6rea36btFT9EKq6fnTaei27gkbQc3SNjL5h2UXuJ87sN+1x8UUpLfEJLzMIDu7Ed
         EW4FHTc8pVRacJBRtO40SygAhhBlx5mYoDu/cXSJBQqIXdTrPdCrNvlofmVIhoiGDavm
         xigdkIqJoAp8yZWGqXCanopFicIh8PQqaaRmybhR+Y5Q2z4b+ypa4r/WTbQ+CDZNFB3Z
         P0Og==
X-Gm-Message-State: AOJu0YwFGqhGpaZ/y187j8iyHQzS9cqaPxQ3bT5NaGnecZ/tdQccc6rL
	5LT85l2UEklANPVTcRKY93xnE1/vOwP51mIQFV9VU/SCsJtS+Bk2vCWJYd+RPQ==
X-Gm-Gg: ASbGncvInzaZth3I8Rps4al594XMsTDxjQolRTRwhjRmv4wtCbPu4mBBAijuxwxv4MX
	UwZbfEBLLLgm5i/xOPnv9968lT7DbDXpu0U4nsxZW5KGae0fcnLOILNKzvVW/eDRew9jxh+vkPS
	8/CGb8XrwTPghdQzjZHABAC4Ou9AxCKvBZIVt7tUVeL82pTEHjF875BaIc6fZpQ1Jo74A/5dPCr
	FScgF3m7Gey5ghecysb7MgjRqtEyg2S+c3LApP0g/gtDj19ajZPnhXUeGELfX3cD/sKJs8gY2FR
	t8gdKtah9zUf2DcEjyhjtFeRzDrmHzfpifDTNS+IwK85BuKOESt4lWMB7FHjQGnsz6ALNgi+Npw
	kJDLZrHUGvYsPIbQWonwLfnHSZ2zgOmZaTbxyk1Pz8S0ATAs=
X-Google-Smtp-Source: AGHT+IFygc8LNOika5Gsbzg0FvICu6wDzZeaHLaClXsS2ujOTAv2/VuH7qQJ9WvXWPOzMEJqiZfyqw==
X-Received: by 2002:a05:6e02:160c:b0:3dd:d33a:741a with SMTP id e9e14a558f8ab-3de38cc23a5mr66804735ab.18.1750504994014;
        Sat, 21 Jun 2025 04:23:14 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de3761874esm13654385ab.9.2025.06.21.04.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 04:23:13 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
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
Subject: [PATCH 1/2] arm64: dts: imx8mm: Configure DMA on UART2
Date: Sat, 21 Jun 2025 06:23:09 -0500
Message-ID: <20250621112311.68101-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_042315_285294_318DE4BD 
X-CRM114-Status: GOOD (  10.04  )
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

UART2 is often used as the console, so the DMA was likely left
off on purpose, since it's recomended to not use the DMA on the
console. Beacause, the driver checks to see if the UART is used for
the console when determining if it should initialize DMA, it
should be safe to enable DMA on UART2 for all users.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index cfebaa01217e..ded89b046970 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -915,6 +915,8 @@ uart2: serial@30890000 {
 					clocks = <&clk IMX8MM_CLK_UART2_ROOT>,
 						 <&clk IMX8MM_CLK_UART2_ROOT>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 			};
-- 
2.48.1


