Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F1BCFA446
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oic4BVwh+qFMk9xigP8owFPlA2EeqW1hA7c8LL97tvU=; b=mpkA3kLlEbXVGv8Ijpf0/XqCWe
	4zlo+niqWbkfbKakuzpTHMY3dqA5PSmmoXii1VsnikbfIV58Dyo78/wH4+k1UpH7jqY0kHpaT1OID
	01W3+/SF6kQNQC+gu7kRW7oUOcg+1+6Eqx99BeCBgQL9fHLOyBBgcgwGxEMqnseDTtLoxazl6pBsZ
	A1cBk25AQj+0V8CtpDXYCdwwZoPorMburnKpVVXR3CaCPF2c1XBeAddMu8/w7WZigVTt5CLI1EX1+
	vLpCN5VziR75Vx6EfFM3Iy5w2VKq7LfGRgiKnBKM0K0Ip1Fri0gYyHMDJK7l4tHvZPZgEIKq715ck
	dpmpoy0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCMT-00000007TYs-2gF6;
	Thu, 20 Nov 2025 21:38:41 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCMQ-00000007TWR-208t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 21:38:40 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-343ff854297so1928096a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 13:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763674718; x=1764279518; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oic4BVwh+qFMk9xigP8owFPlA2EeqW1hA7c8LL97tvU=;
        b=dC4B3ecuYEAVhvsMnnKBxzUp4LBfuvO9BCOVbpKqzP8esaZt/AkcOohuIKiM3cOSS5
         m3Z/Mj0Q8exKhTj+PVrd+yeUMlCMxR1LoaBiii+xCd7cFGxrNuoqlgP83GPiL8ZsDFEa
         3SErqFwM0MPIi7Hi6Fr/Xuxx6ijbuIRKaTke9aZzglQNP+e7RerKLoP8NAM16fXVPf0C
         97aaNjQw9NWajFBarDzZLrpUGECy6U5S81K1BPCjGtGqXocDCG+U7WCA6KMpI1n6Yqu4
         QCrq/Lz+zqy0Q68rptLHnKpoTB7ppbj1/rGaO15vnynHwl14VD8ceB5yn8y2+Wv8cNIM
         n24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763674718; x=1764279518;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oic4BVwh+qFMk9xigP8owFPlA2EeqW1hA7c8LL97tvU=;
        b=Wrb29Xckzg/tHUeR8+oxwBktRWqztVb4nM+dVWPDYSqduxSwmEfopAA0WoejDvfjJO
         XDUF30Erl3yn/JtzzyhnuxBsbtKh8dM0crEcqqUPdvJlsPXD+4BPBsRzXzVhWNk2SN4B
         Hlj+oil65XBLbjXDEBwa7GgKsn6v15j1gj1yz2bUrfGN3WUxiLc2HlI8C7tZNWC8sQWH
         B4hL3Kpm6LXCVVm/c3U0WRdBL8wz9x+Y4UNM1bSH1KvdBNHaaEQRBqBvWeZMqqwwLGmL
         /vAFW9L3MbM5TdfnJZhc8POdbUkEXkGkWaaTgdyTqwuv36LF+YPzx4JzN2z2HwO+GJem
         WRbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV61+YRhuLMZHkaL8RwsGLbcje8pIwStm1aiEepVmCZV8HoTILnei9EcKURHb4Dic8Zroy7WFir1L8/POqW2dqN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl6eILJmntfe0itCZBzcau14N5rv5KzmmAmE9uVQk4AcyEMsea
	GyFoGIR662rJipWleXwjxOdwBxL/hHcoKeKYVzJ57l0r3gWdYO/WctaL
X-Gm-Gg: ASbGncunViI/EDjBZu6p6O9JHz5gINBSULcgXBkzbnqVbG1RQNZ3sI6c95pFvbgxa0d
	VPMJd6Asm9mOcaW6vy3DT6ygsJZOiVmGNxsPrCdyXuPx51bmacgVbv12x6cv3YorK+9ll8i31u3
	TpqU7C3a0eP5Zt7qnzilPh20vLtpDF4dvZROOt+GMdAh1Pub597Qrk7FNELSwrxi3+xwRxelywU
	Nwqh10W4KO2tYH3pSGbyo9Mj/SE35NarIxJouuBobxTACOo2G54/ms/lJvcLpEm8XMQVQrWMR8S
	bys9JgPr2YM/rBkNannGKjTcj3VeMiceQ1tXc90ie/SkORW9mhcdXb5/aRoiA9V0Bokb0mqwYal
	xvBE4G55+pep5XPOKnbIHPAl2nCHBILLgYEklwjZgkPA/WEUbH5gMHQ025N4MawpCu1Wh6LYYhk
	vcvnmRb+8WAtEF0Xh1
X-Google-Smtp-Source: AGHT+IGMJrKF9L1itrJx5jS2bFV3lpyInnC8nIidIwze7pM5BA5o2s2GqhwLJOqjTqB9hc+kWslwdw==
X-Received: by 2002:a17:90b:5251:b0:340:bc90:d9ad with SMTP id 98e67ed59e1d1-34727be88f5mr4852259a91.10.1763674717587;
        Thu, 20 Nov 2025 13:38:37 -0800 (PST)
Received: from SC-GAME.lan ([104.28.206.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d6f48bsm3325479a91.17.2025.11.20.13.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:38:36 -0800 (PST)
From: Chen Minqiang <ptpt52@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	Chen Minqiang <ptpt52@gmail.com>
Subject: [PATCH v2 1/2] ARM64: dts: mediatek: fix MT7531 reset GPIO polarity on multiple boards
Date: Fri, 21 Nov 2025 05:38:04 +0800
Message-Id: <20251120213805.4135-1-ptpt52@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_133838_523176_E771A40E 
X-CRM114-Status: GOOD (  14.17  )
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

The MT7531 reset pin is active-low, but several DTS files configured the
reset-gpios property without GPIO_ACTIVE_LOW. This causes the reset GPIO
to behave as active-high and prevents the switch from being properly reset.

Update all affected DTS files to correctly use GPIO_ACTIVE_LOW so that
the reset polarity matches the hardware design.

Boards fixed:
 - mt7622-bananapi-bpi-r64
 - mt7622-rfb1
 - mt7986a-bananapi-bpi-r3
 - mt7986a-rfb
 - mt7986b-rfb

Note: the previous DTS description used the wrong polarity but the
driver also assumed the opposite polarity, resulting in a matched pair
of bugs that worked together. Updating the DTS requires updating the
driver at the same time; old kernels will not reset the switch correctly
when used with this DTS.

Compatibility
-------------

Correcting the polarity creates intentional incompatibility:

 * New kernel + old DTS:
   The driver now expects active-low, but out-of-tree DTS still marks
   active-high, causing the reset sequence to invert.

 * Old kernel + new DTS:
   The old driver toggles reset assuming active-high, which now
   conflicts with the corrected active-low DTS.

This was unavoidable because the original DTS was factually wrong.
Out-of-tree DTS users must update their DTS together with the kernel.

Signed-off-by: Chen Minqiang <ptpt52@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts             | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts             | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 9f100b18a676..6f29ce828fdb 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -155,7 +155,7 @@
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupts-extended = <&pio 53 IRQ_TYPE_LEVEL_HIGH>;
-			reset-gpios = <&pio 54 0>;
+			reset-gpios = <&pio 54 GPIO_ACTIVE_LOW>;
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 8c3e2e2578bc..6600f06ccebf 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -137,7 +137,7 @@
 		switch@0 {
 			compatible = "mediatek,mt7531";
 			reg = <0>;
-			reset-gpios = <&pio 54 0>;
+			reset-gpios = <&pio 54 GPIO_ACTIVE_LOW>;
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index e7654dc9a1c9..8ec2ec78ee46 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -203,7 +203,7 @@
 		interrupt-parent = <&pio>;
 		interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <1>;
-		reset-gpios = <&pio 5 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 5d8e3d3f6c20..958ce291336b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -87,7 +87,7 @@
 	switch: switch@0 {
 		compatible = "mediatek,mt7531";
 		reg = <31>;
-		reset-gpios = <&pio 5 0>;
+		reset-gpios = <&pio 5 1>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index 58f77d932429..0780b5a36259 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -64,7 +64,7 @@
 		switch@0 {
 			compatible = "mediatek,mt7531";
 			reg = <31>;
-			reset-gpios = <&pio 5 0>;
+			reset-gpios = <&pio 5 1>;
 
 			ports {
 				#address-cells = <1>;
-- 
2.17.1


