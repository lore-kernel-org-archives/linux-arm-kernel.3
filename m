Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C028C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 01:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFICO/f3GRYnQyGnM8JAgOAEAAxAb7Le1DtrMpG+6/M=; b=4MuPT7Zs+/2o/hAs7eVjCf38gc
	08/bJR4e87mkfQy1qdQV7rNYW+gur9nImDdlyByhd/e0+62x98tm+xalzuHDhaPW6xSHawnAo7E+L
	SEfi+uRi2yE8+e78J7IZIZcOe9gLGbNnJ6TPOgVUv0nurR5u0aPyvX0Zrt5g5GJfr/VYov+lQ+u32
	qbLmiN+jmj2KTHtaYX4On1dKw/VUyyvljDwB8juKAFpxwBSPswGsq0EFvI3sIDKXAn2QG1prTDxXA
	SrjxbshrplhMAWf1Na8Zqcqc11K7BhqN006h41NJ/TuQsdH+aHvNjbN1ZC+qvJEYoALyZBwRC6fgu
	WlX07GPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rMT-00000007mFJ-3KNR;
	Wed, 16 Apr 2025 01:14:45 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rA7-00000007jr2-1heN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:02:00 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-47662449055so32473701cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765318; x=1745370118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFICO/f3GRYnQyGnM8JAgOAEAAxAb7Le1DtrMpG+6/M=;
        b=BnoQJNf2OMR4pWCvBjgO9LUnu7QqdJO5AuxmptWcWp8Zo4ff/qEjQfKkXaboqf8BS5
         F8cJktwJ/SPLnAZKHLX/1IMll04NZMpc4Ci7thWoFmIHLVlm0WbqeMct2y1PQgWiyHrF
         2sBE8eoYsic84EpMAraQvchoSiv0AJrnthkqi/97JFbEcJCIcqFkUz+MLqjIwGUmPf8b
         YcqwLdBoXmVkm/MEKPx4kAovOCVH5HyCsAkI/jPB2b2Z8jiZXkqY6r90rfpWonZIngYz
         c64T9mcdCxUpJAqQ5ZV1UzM3e2+l555e8boanui+Qx1bz1XGnzomb2VvaCVsG7buTWGY
         7iGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765318; x=1745370118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFICO/f3GRYnQyGnM8JAgOAEAAxAb7Le1DtrMpG+6/M=;
        b=qDr8xf8WoqCZ8uwU8sZlGI7ryE3sEecofGcvE4Wn33rPmVvZfnFuXaSerHOBH1cMxD
         W0VUUilEviXruOGui1f4zam7p+u9cvDiM2uvLwY973MeHb73FJ3VAzuRPIKtDakjeoHS
         mS9qGKPk4ptdWbRnvYr2HF7MKlOJ7hBZH+wx6N3kY8cFSrX++iqxD8LwjsRiUzSOhzkI
         Hcmam5+W990Z8dWNbHCtso0qMEItMUMT0QH9vxWICHsjRqhXhurLl9wmXqcHM9If3bRO
         mH8kZvJPDiu5M+hBoQzzOn+bMWSC9Jcvb0rhoAJq6k3aOiq7952hJ+9DdSrUIRO6XLZB
         tJbw==
X-Gm-Message-State: AOJu0YypMkoSSEu5tmPOIRph9uNAWc4C6tdh2du5OllKtS6quGKZuAra
	Scp5gG7/vJ1MFpNb76BBBBVkCkZ6oLo5cARTXxQPA+H6lLNBFq1em9lUrw==
X-Gm-Gg: ASbGnctE9gCkcg5zL8iLQkI0B81bIRFqs0BGoQwn1eQja4soGFpin+oDiUKZcmu4Frh
	75ma7iJkEQZwHo92c/ncTW484pT8ev5ebhGn62TBDBkcychqofJHWmJyFtogHG4JaPZh0/EWVoY
	Rb++faNAf9o0KvZWXnVtiIjY8zt0aDnkLyyHXYJ9GGB26GrXP8BRiCotfQn7tG+kLb+qbrZ+fRU
	cznd252nuKKW6f25BguFIVkmOl4DQKgJWs/GV8FyIKzhapjsoA1LsDVEGaD2lxQRshgFOI2O4i3
	0xAA0F2bujioq5/y+bHwlBxEHhAcBXIegh/dmp2nNqn+Rv2Oa37eBNVYW7GO0MQOiMC+Prn95Bv
	8IGvQ7uGGsbTDLZk=
X-Google-Smtp-Source: AGHT+IE5vymre3jMvOIqMTFZOIcLz3gAqcPHBCaqYI7xneF2ijTBn4EouQOs7gqt1Ik+3CpFQFHmTw==
X-Received: by 2002:a05:622a:114:b0:476:8cef:4f0e with SMTP id d75a77b69052e-47ad3a3b807mr19517671cf.29.1744765317693;
        Tue, 15 Apr 2025 18:01:57 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:57 -0700 (PDT)
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
Subject: [PATCH V2 06/10] arm64: dts: imx8mm-beacon: Configure Ethernet PHY reset and GPIO IRQ
Date: Tue, 15 Apr 2025 20:01:32 -0500
Message-ID: <20250416010141.1785841-6-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_180159_452331_B3BF9712 
X-CRM114-Status: GOOD (  11.53  )
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

The Ethernet PHY setup currently assumes that the bootloader will take the
PHY out of reset, but this behavior is not guaranteed across all
bootloaders. Add the reset GPIO to ensure the kernel can properly control
the PHY reset line.

Also configure the PHY IRQ GPIO to enable interrupt-driven link status
reporting, instead of relying on polling.

This ensures more reliable Ethernet initialization and improves PHY event
handling.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Update commit message. No active changes.

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


