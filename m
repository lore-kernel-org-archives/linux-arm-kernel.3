Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E607AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YibEw3sJAcSolHqapmUCOXlWymZOe8hxYzMF8ebBqhY=; b=0f3Znbj7HUp3aH3fZ0rILCJ4+o
	ORFCQGbMzTwfGLbTu/fFxtoLSuISLC0DbNIsf1i6NypKbvOQCTa/rJGmLLKK4GrZGrvVm/hHvauNf
	0WTc641FJ5eyb5lfAKCEQ5p6VA7qtLXMk/TiAHil6NBGLH9SDt2mfMNPlfRWN+7hDtQM2A4UrRflZ
	CbSoDR/FGiLyGu0BeraLnl6Mt8wPoOsRvxCPEbQsypgR3ojako9u8/MHMldJ6B63/T6vWHymi5oYU
	qnhvrv4NpwSHvDHvSiAQ2tA4Ao+JIUFdqsfLDqS1633Uuii4+Vf9RQ+dln5h+ZEi16Hpwck0Oz63o
	Un82k0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggQa-0000000CBwC-3aqy;
	Mon, 06 Jul 2026 10:19:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggQX-0000000CBsw-2ZyS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:19:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693mdi4172096
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 10:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YibEw3sJAcSolHqapmUCOXlWymZOe8hxYzM
	F8ebBqhY=; b=bWNPjtJPsOwdMdmDkytasz0x8uk0xSuG4uNUSVFSyWWXvXgkimM
	0mQ4t4uSlDT2/QNYgHpD/CWIK5yPyfHA1AVcQWHT8yPkinEpQVZrHOrvg8E819bT
	K6OLaSwEz7dRM5RsqsA4QalJJcytD3MgsWMlSUq841sbulBluV2boWmcSnXPEkzT
	TOlU4qBz9DOTteV7EssKNyqXAHfyo8RXMQpMwWVQ7LPRI4Y6Olwf6CdszwOhY5oj
	3PESfGu7PhE1oQBGAHjCwPqa2SWhQKH24weaMBMLsK+9uwGg06g+3LbPBJL7XgC0
	qHpQfszSz0z3U1PRBW5gpH9UxE+ke+f9QwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88fcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:19:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5740so309652185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333188; x=1783937988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YibEw3sJAcSolHqapmUCOXlWymZOe8hxYzMF8ebBqhY=;
        b=GcXHkZ91xxVH94qzdT5ozWBKgGMqsfn4Wuw+7uj/k+6/8tV/WzOz63OMAVN/xAJIF7
         oQey/eRdB3JL2D3NESBcAzXPGtooqCQ3GCVCh5NK3I4AbN87IQVcGslRCNn22vN0Cd8e
         xPDxzCqLomYX6J7IQgJac9Wz+siKGbe4os4h29tzEDYZkGfdK+rV0PdIr7aXAi8yIbCF
         YkL5o1+WfZlfq1A6Bku8GXYLiZ0y04WDKfAfxzqJAdM/bYC89/683wq/peIHem0JPJkP
         Gns12RXaL/S+O7PbT6klNo/znFvBQS2VzgyliwpQnhBLLMmwDaLwnrZCX0huu6cVPvpW
         UDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333188; x=1783937988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YibEw3sJAcSolHqapmUCOXlWymZOe8hxYzMF8ebBqhY=;
        b=YZnD8RWzln9cvHUHhyA8gSLwu6p4nZVxKMWPB4brgRlzERr+vvIGi/2A9dP+y4/V/y
         c5qCTo2gjk8gYmzOnqZ75b2tjqLumRyYCvW4VZscQtwz+W5gxPmxNDVKDEETg3Y6Tg4f
         KAa71t5d+Hp9P/XP2HIucQUs2HFiqMuPp2Ds0cuviIcb9nVH7tEaqbgGSi6ew+sStqFs
         3Xtl18HoJKuUfhBgTWwKwtMLVQ6c/SUXJ2sisS6Q/FW2SNZRZ1SkC5py0z4s5hcPtmZX
         p+bnlueTss/Ln5HPOaa6+xG7Z8fOaouPBVIMCI4KJm4DretNY0uwV4QxmUGWZz+U2bL3
         8tkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1dMTS1Rkii9f4eKv8p7HUt5UlkpFRYmbga/JqcsWSzYCf2aDXU3opqB94tW+jiSyulxPwW137laZ5YJ0J4PnT@lists.infradead.org
X-Gm-Message-State: AOJu0YxG4ptSlPl0Nrpp0ob0gPFgDlPrMdubeVltK6B10MB2pTr9tGz9
	NWIa+CXMQrJCBedFqnMOiD1olcd+HV4iQ8gt8/s1E+JD4wyS1+J5sUVVqFtL3hT5FBdqVNT2MM6
	f38J349WEhqzyIR0GzuFxwbfnpYlZfG2X4HxO0LQlCTjklJohHWCXlsO5Hg4GH29Z6qUCRewdNi
	+3k3VjHeb3Zg==
X-Gm-Gg: AfdE7ckpU0yEwBqcRsGiipcvcUs557reW3A4+9ItEN8QpdMqI16SmaiHN3spiUjBJON
	KIpekd3wvl3ksUetZ+qq/s3Al5wh0Ac84lzWS+ez+uVtBtlVhZPq2KkZUregtiB41YomswiDMDB
	HqPnUdR25xPtNZOMzv7voZQLY73AYbkItS96nNXvSi1ZoW+mYvgtgT4PAIOz2qeDIYOeNmRh9Fb
	qXnd7RquMtVA0roJzVP0iIzCtCJhadRzMv9pLac4seVOA8SvcWtNgq2WTr+ZGGFfUQ1GBCpSWu0
	ogzDilYlVPj6sw9A6Z/kSF0s9J9KBqwtJGDSMJnkXfybTElIewvvLrVlsAvFzMSXxP2bTJ8TRxQ
	jqXOMbTwSwZJbNMOc05vKGIHk5+A=
X-Received: by 2002:a05:620a:4010:b0:92b:774:da66 with SMTP id af79cd13be357-92e9a4e2ac2mr1284754785a.56.1783333188205;
        Mon, 06 Jul 2026 03:19:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4010:b0:92b:774:da66 with SMTP id af79cd13be357-92e9a4e2ac2mr1284752685a.56.1783333187744;
        Mon, 06 Jul 2026 03:19:47 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm23476020f8f.3.2026.07.06.03.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: arm: Correct indentation
Date: Mon,  6 Jul 2026 12:19:43 +0200
Message-ID: <20260706101942.341681-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4333; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=VDmibN1fWdrfR9pAZ88lBdyDaXap/xrx0iLyGpN/UMg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4E+/PLFebUfxxG3EhT+cKJzU1imqeU5JyKiF
 O6NaJZnmVWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBPgAKCRDBN2bmhouD
 1zCAD/9WYw11atzwt7os0PeoE41INjD3LkexrCCcqdrxUHKNOZwPLIz1FcS+OUZ0HtHuPh/ua51
 /sqtLD+PxCBd8jH8+yAyg/wkZSWRQpmQxqWtaiZ+7WxFOiNSV52ddVD3qi9NbSQZZDYZy9T2S8Z
 rEnrJeeSb/BCHLIv6uVG4jQpkIzDpCOoCyp+2EwJ0sDiJ5uRom0BIoYihH1RSm2ODCCi5vptWU7
 kNuGjdkqvIuW7fNVOL3YLwifEyGOSpoQRRTDCl0Lqk39EKUDykNYIalrOquy6MS7211m1dsqRqd
 DrZ0Z/tYLIb0nMwsEXyGH5/XsrBa/EFlxoToiUNi3C1PlXuzFQ/jn0IZkw4SeA58CxVlxkD8O0T
 ywJBDhuxo9tJZuiiuX4nc648gPv6bKzHBQJRKUTU2tD3gyEvk2cvlxCD/159IdARA2n3SfGjIvJ
 v5+YYGfyxfRgzw1EYmFflZPlETQcgnH7iUvsd86QmB+H2RLhvfAjUUA0ZW2B7NUf438FM8V0q+9
 SybexaDn0SiYHdrvLEitXOrz4qP+n3vSOTwTSQQRdeeGFb4ahz+338HUhoscTHO7VJgQm9b2goE
 MJ7NUp3KuyfMcts8NF7hy4kuOtvKKr0hhsHZqxLr/CtW504KRlEUW0lR41T5KS4YP3g894buhJh RguOaqfOnCAsOsA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX8arbR0t1H1HE
 EqI5WyNlYx9u1ZIrVbRwIyrllf6qlZzdto4kkB6N3I6bC3rhpdMzneRKlJ43bjmDr3JUofCCq9L
 +DmYtWfBY6mSgdkU1rPoWWo+CvEzJKE=
X-Proofpoint-GUID: RoC0qNI_ipZWb597J7kosbqqkL57VALL
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b8145 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=X-djH8jZVkJicJ5Eiu0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: RoC0qNI_ipZWb597J7kosbqqkL57VALL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX2C0IcaJR//q3
 uoiiJVCactZ75Tw6ZXuQJHZPsAq9vwePRg4O/O3XkXw9aTl5aaq6xURZLBIGO2tjiSe9BGKmlUP
 ckZYe9cKpEF+WxNRq/oS6K9aWLEBt9t9ZOAHXXHWlZ/AQEXAsjMzlC5hWPpl6mSV5h4etBcZXot
 ApQzYAZ3KNU3vYftl4j66OTvp3ZrbWS3alQxx3iRLfrL0+xfM8HVk5X7IiXs0+J5Dh1eOv+5dgD
 8wqtziBfCiasWQsO82NZ8nIIyCV+XABjlEqnWDHls+GhYZ5R/kJ7WOLqsbym8RHOgOUQFbrdf+y
 THubhaqUTQdWDSgKdSl0k+KMg5nN81DZB5BjOYrFbO9aTnh/l6QEo0ILYhcjrOW6kAFnuynDcFx
 sEdtQyh3q4URuvIqsa170jGo6Osi37l0cMyWuEeixNhkJ8ZuskkkogdWKUbbsGHrvRoZzu4yQr5
 Pb4f/7l0aXCAYO9UnBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031949_676943_B5317707 
X-CRM114-Status: GOOD (  14.92  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/arm/arm-realview-eb.dtsi     | 2 +-
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts  | 2 +-
 arch/arm/boot/dts/arm/arm-realview-pb11mp.dts  | 6 +++---
 arch/arm/boot/dts/arm/arm-realview-pbx.dtsi    | 6 +++---
 arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
index ae370d4eb9d8..f90e28ee4cb9 100644
--- a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
@@ -51,7 +51,7 @@ vmmc: regulator-vmmc {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-        };
+	};
 
 	xtal24mhz: mclk: kmiclk: sspclk: uartclk: wdogclk: clock-24000000 {
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
index a75d8b107fe1..1cd095496832 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
@@ -53,7 +53,7 @@ vmmc: regulator-vmmc {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-        };
+	};
 
 	veth: regulator-veth {
 		compatible = "regulator-fixed";
diff --git a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
index 59c78def83f2..635b09030f60 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
@@ -153,7 +153,7 @@ vmmc: regulator-vmmc {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-        };
+	};
 
 	veth: regulator-veth {
 		compatible = "regulator-fixed";
@@ -544,7 +544,7 @@ timer01: timer@10011000 {
 			interrupts = <0 1 IRQ_TYPE_LEVEL_HIGH>;
 			arm,sp804-has-irq = <1>;
 			clocks = <&sp810_syscon 0>,
-			         <&sp810_syscon 1>,
+				 <&sp810_syscon 1>,
 				 <&pclk>;
 			clock-names = "timer0clk",
 				    "timer1clk",
@@ -558,7 +558,7 @@ timer23: timer@10012000 {
 			interrupts = <0 2 IRQ_TYPE_LEVEL_HIGH>;
 			arm,sp804-has-irq = <1>;
 			clocks = <&sp810_syscon 2>,
-			         <&sp810_syscon 3>,
+				 <&sp810_syscon 3>,
 				 <&pclk>;
 			clock-names = "timer0clk",
 				    "timer1clk",
diff --git a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
index 0d3d96ffa6e6..366c8baefe8c 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
@@ -52,7 +52,7 @@ vmmc: regulator-vmmc {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-        };
+	};
 
 	veth: regulator-veth {
 		compatible = "regulator-fixed";
@@ -373,7 +373,7 @@ timer01: timer@10011000 {
 			compatible = "arm,sp804", "arm,primecell";
 			reg = <0x10011000 0x1000>;
 			clocks = <&sp810_syscon0 0>,
-			         <&sp810_syscon0 1>,
+				 <&sp810_syscon0 1>,
 				 <&pclk>;
 			clock-names = "timerclk0",
 				    "timerclk1",
@@ -384,7 +384,7 @@ timer23: timer@10012000 {
 			compatible = "arm,sp804", "arm,primecell";
 			reg = <0x10012000 0x1000>;
 			clocks = <&sp810_syscon0 2>,
-			         <&sp810_syscon0 3>,
+				 <&sp810_syscon0 3>,
 				 <&pclk>;
 			clock-names = "timerclk2",
 				    "timerclk3",
diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
index 6ef23c53d2d8..64f87e6c12bf 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
@@ -209,11 +209,11 @@ dma@7ff00000 {
 		clock-names = "apb_pclk";
 	};
 
-        scc@7fff0000 {
+	scc@7fff0000 {
 		compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
 		reg = <0 0x7fff0000 0 0x1000>;
 		interrupts = <0 95 4>;
-        };
+	};
 
 	timer {
 		compatible = "arm,armv7-timer";
-- 
2.53.0


