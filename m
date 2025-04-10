Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F275BC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 01:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mujuAB2P5xapTkmLzG9rvA7e+z7OOYkqAyA+5+v8/uo=; b=Ktne1q+IKTB4DkKf2HA8sz1ubM
	CH836BdNZdCYlhZeSm5lzt6CdWPiVGVXSNXC1YpuwkNveSZaazymWBakDhBOTN6euF+FR4PBosAHI
	OC2zOTOUyElnrKCjCN+vqlVGVt2P5JKl8zJc7vbvdrlN+pRSA/9vFrkhWNAMD9vzjDcTU3KT3Fo7v
	vBJrYBRLR1JV5Le0FsXhvMAERuxRRbOyvqyHnuphRLTXxkJLM8irLgE8h7PMW2kuFdSRgGxonFGyw
	jMkujSYlfTbYRb9xRSzy3BipV+YYhP/zPuPwC4BONsqOx9dscgbGDS4A3+AVGW45bUlokMaO1QZol
	Ftw8kFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gSF-00000008tzj-1J1m;
	Thu, 10 Apr 2025 01:11:43 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gGX-00000008sAt-3NSP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 00:59:39 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7c597760323so28656785a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246776; x=1744851576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mujuAB2P5xapTkmLzG9rvA7e+z7OOYkqAyA+5+v8/uo=;
        b=W5znuazT3KYgQw8lHr72cEIj6jiZvKU0XebNC5gI7BPcg8+SYOg1mHb8r7h2pHIgp+
         wg/U/BHVSALZeydaPIS5m56BG6RcvFaJ80hdPFKHq6uRH1bkffUR4F0HZA5UtEdK4zu4
         ExaSMT+GRaEKegEUApG9QQVFK0JrhT6RtoKPIWMQ6/3sRMeBx+wFCwir5oVc9uxrU9CS
         UyB8S++s0iUQoDGL9NeD5SGfX1Gk6XtCXutQpV80nO5oJzQqFLoHiglOQWlwprd+uUl/
         IEdUIaks/dtJLGmhDAS1Uyb+1uPH83+1nFbe5qyAsgNryv7NshnY0HMuIcgJ+D/DZDDu
         XEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246776; x=1744851576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mujuAB2P5xapTkmLzG9rvA7e+z7OOYkqAyA+5+v8/uo=;
        b=Gj6SsVXPr8Ocde6E1V5FF4HIi4q+X3t+eQ3afT1KxtHnanS4I3P2d8JKFZ9bJBN4GS
         5Ii4sYpGHe694jBfkB0+jGr2hx+jXozEIfDvm5hLhaswTV1n+yFIMKSU2EFguwc4Qvc1
         PkaiTxoRbCAvIkKbMywwK707LOg8v7C07JJlqD7qwPXOFD8IHOu3Q8gmQvE1Q5L3keDz
         iyApiYIevhSLIFOxSkFlAlJxwD0EmwsQzcmywc6f3A05XjcFyYsY01lVxcPE1w7t6MZd
         V0hywvpPeWmtel0XWofwvOr7M7RDEDfL1r4/635pg+VqN2+Wgrs4gLf9uPh7PAZUrCEb
         WNyg==
X-Gm-Message-State: AOJu0YzPgkriaZxFgu0UjHOR40zds8YMqiyjmr21l690ZpFTYP3DgCoH
	DB2rgNB8/RW4mN3loGbgPSZohfz5XqBYDQuMseel0qITrVenem3KP9wCjA==
X-Gm-Gg: ASbGncvfPRuPXo1IH1cEZWBkzp/3GKQoYP6QoXwq7nBDOaxtqw0+rKrWS5yEYc3cUHz
	GbJM9ERj/R1Nd3aija5S330Tlr0lnWv0piDnW/bHDrIoYXgqCpS0VAC1Oqnibmu39Ji28RA/6lA
	D89QSDtY8iJv/Z4KjRw5zNzhGlt0xl/s9OcaKnmkO8jF6SNbGoGNQQZFsUVTEgib/S8FtIdQ0yk
	jApuAQkpnnt3vrVunMYZ/IzHOqGV8qVlhMBqEnu1RwK+s6yrOi74yogH5uMn4Rs5uXYf3eWDyWN
	hkqjA89DH6GdlPXnSzycY7dD9cDR04Qb5OERHufUS4L5DGKHO5zvVZYnCnR72RcwZ+QluDC5Wda
	9noveiC8rrQKXPEg=
X-Google-Smtp-Source: AGHT+IGiC0wxIKVAYN+qM9uXVnocF+7Ky9tlCEp6HAiLzbJqcU+48i/0+uDCdBrHmaGx1GlEDSsSmg==
X-Received: by 2002:a05:620a:d81:b0:7c5:5584:dc1b with SMTP id af79cd13be357-7c7a76d04b6mr178797085a.54.1744246776211;
        Wed, 09 Apr 2025 17:59:36 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:35 -0700 (PDT)
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
Subject: [PATCH 6/9] arm64: dts: imx8mm-beacon: Configure Ethernet reset and IRQ GPIO
Date: Wed,  9 Apr 2025 19:59:00 -0500
Message-ID: <20250410005912.118732-6-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_175937_856067_A847B499 
X-CRM114-Status: GOOD (  11.11  )
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

The ethernet PHY setup assumes the bootloader will pull the PHY out
of reset,but it's not guaranteed.  The PHY is also currently
setup to poll, because it does not configure the IRQ. Enable
both GPIO settings for better optimal ethernet performance.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 9ba0cb89fa24..ed7a1be4a1a6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -78,6 +78,9 @@ mdio {
 		ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
@@ -315,6 +318,7 @@ MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC	0x1f
 			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC	0x91
 			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
 			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10             0x146
 			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22	0x19
 		>;
 	};
-- 
2.48.1


