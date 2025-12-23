Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BF0E6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0SmkUAFgkhAyHiqKViysyG2Zix/5NH57pWSiE3UYUY=; b=mF8nJi/0kSjhFvvoR72psBrjJt
	VyqwtCH1ky1xoHOhJsA8PQLNndqvgHaVxRcVCChs2qi4/Vzd36nTSryeFP3J8M7Qk6jb6dXlazXyD
	J/OZveUkWPB/+c0OOgRzTi4WVgzw2AMMF/5mxvdAsT/Y0/B+ClY5eewQ9Q1qjQg/Y555xZo4IJcDv
	te6V8+bDcrskmyow/2i6wc1cUwDdPbMmn8pOvHa4nlIKhne4SUd8hR2TkAqSahnPSNp8UDGsj5jdq
	DC2Xy14QwwrlGsP8COMSvd9s7EXz2uthIijUDQ8dvJdUqXjK0yqPjJSiUEqAuCZ2e0xC3XIZhkXdT
	s/GIs+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4G5-0000000Fg08-03nc;
	Tue, 23 Dec 2025 15:25:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4G2-0000000Ffyv-1Vif
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:25:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBRFDO700694
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i0SmkUAFgkh
	AyHiqKViysyG2Zix/5NH57pWSiE3UYUY=; b=ZtAil2yus2oec1vAHCtAMveo2+3
	LQkTOmZ1EA8lVAwPPTKzQEPt5Ir9hd277yYtyggHZlVrmJLLCkrhi6qmyBlTdcAC
	RRJMuUkEJbMo7FnYS3VBx2R/avumunYTyjUyanmhY8c4jcnjUh5hglEYlU54pF8E
	TwzLTaRQxQfvQgGkrGEkWQcVmlkBNXs/JIWVBHLNzzEbAnO/i8h/skZAATiFfw8y
	yT3NNribNRB9Yufu3S8SpM5C/gy6S7Nbepe3T0j0BrBNnbHfb213P1V92txG6Rx/
	r7qOYEcoxbh/TM33j8SUYLhOZ3MyP0F+1wrtkUUVz+jhl7/zHOCsEnbxMJw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jrmum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09693109so97236181cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503505; x=1767108305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0SmkUAFgkhAyHiqKViysyG2Zix/5NH57pWSiE3UYUY=;
        b=ZAan9DTiCWj2AWTnNjKj+J19fhXdHEYNmmCxBlXL7demIvtTLF5u58deuRYy8fjzcw
         4p/OcTLJ17q6K07SL1OAgXg1HWNddejHMLSF0YK65MW+z0pTHl6bsPRA+7cCIwlBcakS
         KYLTDeeCshbz7Firicrw62SiblHe0/ctUZN9ADfqm5HXo73aE2ASUfNY9NO6JhcYrrF3
         gYBnqdGYsysb6ioXJkVz2IdKtjPkb71bAOTI0U2wC1VFkXfbHR3RsXAjBKzo/OlOh3lK
         MwIkO/TADx2U2Y9BNpUOFjdipQDBw4qt3t5tRn6xKRLQXeHCgtiQSbRa6RRG+Y5u3FXp
         KqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503505; x=1767108305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i0SmkUAFgkhAyHiqKViysyG2Zix/5NH57pWSiE3UYUY=;
        b=i3ZV9TW/GraMjsG4viw5D6caB4YMhYtNo6Bxoh+81+NnX6U7eGHCJHDzbY9IKowd28
         yNRTYpxOSus42SdIyDy1Pl8yRZlkPo0EHONpH42ox+lxcOGAwZlBapRzhqbhHrKEB5J8
         NfBxgsBaCljiYGaN7lU3iEpAMZLCpYLCzpMKLGxgAzaHFsSbIrqyDW41K39WXKjcWjgy
         mMRD5MKM4Y7QLh51yVZRJal4Seayrp7lHw1h/7ebQ9oXRoUMP8cOLDQZ+lx40jHuIakq
         z6voUl8TIhEwutDlHUWwySlzAGSIK1P8AyNQHWl8D388Jvam+ZW/YEnuxu20RiqX1n1A
         /M6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSsCv3tiNoNxU6SBTfw5UZicIVIfo71mmBXJ3Ya+v8yVyNsQe7MqcxNtofDF2CURUWy4fGA3tnzdgbZVkK0hma@lists.infradead.org
X-Gm-Message-State: AOJu0YyLABrBe1d/3rFu7gWEdfJ1/wFHkTrsaBdzR9r5/3iHa9+90wS3
	O31fy5P4Bvbm62oQh+J44JPLylEdvkkjuLHkyPNbFMU4x+VE6hXm3CyS/XEHH2ZusncoRUN8efc
	jk74Qg+oiXIxoUo8zQ50LjCmeimonWpvvMXTAFjZa3RKH4JUkyybJ0pmaxN0O5ee4Htu0J2siaq
	SYiA==
X-Gm-Gg: AY/fxX6ETjVb366luQTK8wixdqetBM0Y7j46OCyf5/2dV0ZuR7I+zkrZrl3vGfX7uCK
	OsMMDS+KvECmb6xvx6xPFqk5SQNAFw5hxh0lWmFy1NqgXiEBdNVEL9xWSmR6J4JxTtg+YoZ4cXk
	cXlP0CQcWN8831MNJufynwOxkfpHybmMsD6cDTm597aIDULFjaSA7+/qeSDqohoRegy3hPQ0+mC
	0WvDKbPskUwN/9zlEIzzNxHgFq7fJbOw7eL6h0VT/ARBB/JVuKMN3ULnD+S288vtcILp+OtBkwt
	gsSP1Hjjy71YcrdzSvAiz3qaXA3X8BwwSzpIhIvAgxvFKdOdVI7vFWdH8RW1NEyQROnKOfB+vzS
	nePDuMAYAw/gOFO41NElleiKwJTrAgZDPI21SqHG/E0rDeWZ5FwV0HplkJmvBgWzZNwY=
X-Received: by 2002:a05:622a:4d0f:b0:4f1:cd72:f22b with SMTP id d75a77b69052e-4f4abd98192mr229113111cf.52.1766503504790;
        Tue, 23 Dec 2025 07:25:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQKg2fdKfqVLZoHQeyi9qFrIKKVLzKMNIicTx/TH/uvkxikBkD5cfE7b2Zi1xO43MhF9psxw==
X-Received: by 2002:a05:622a:4d0f:b0:4f1:cd72:f22b with SMTP id d75a77b69052e-4f4abd98192mr229112611cf.52.1766503504385;
        Tue, 23 Dec 2025 07:25:04 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f51144sm1465699166b.69.2025.12.23.07.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:25:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: arm: Use lowercase hex
Date: Tue, 23 Dec 2025 16:24:59 +0100
Message-ID: <20251223152457.155392-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223152457.155392-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152457.155392-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2477; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kfBs5umcn6wnNbBT9wHQdh8n1yg5yAtvW9uywSpZS88=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrRKuVtD4PeupYzv8wV3yix9NoyTh0U3uyyR9
 WJvY6FWsYWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0SgAKCRDBN2bmhouD
 13GFEACBacz1GTOMxn9uQJF7Bl4khj2URkqSDl1gW2lUSFVbmXbDJMIjBH/li8tlow34jtF5D/k
 IL/lx1HZg68Fxvn5pkEXS1cPdq1vnUftBWQotm0amMkCHUPJeUEGIrUTExNRrSXraJZdwwwBtK4
 EOYv/3uq0aMoQHan3vas6vSjHIwXQpkzuefsjvXWU6qZd2dssfoIKAvjqVTOy6EFLnu/e9PGDyK
 XMs1mBg9b9iMokxiAhCUHYRYtC3gR24HiiU9Z3SEwWoH59BiRZ+5uDVnvuP0XXe0EcSQg4lRwbr
 HzpWzMKlzEpk2tFXSxmHZR0QlejBs23FcubtuQR/lxLh15EldExlBra7KDQVDrizytQlSldbfQm
 P+OerugMMO5FiSJp7It+anDGABAJUPdwiY8OGqxErgMeOjiroGhF1GNzEi2KTPI4wJ2ek9J0mEG
 POFyOPkRTduUUqkmX5MJQPhKag46UJVouTkggValIPe71bTdr0X79tKYNJlKa/WBRYBXjlr8W2t
 iexqemZwZEMw1uye2PuQQi7eXefXBj/af8ii399+KgOylMljn0PECZvO9AoyKu+myyBPcV64vi6
 Nk0Pci0SX/8x0pygNLrD1VC/OJLxpXDWoz8hsXCD+FRwlvaYvucxK1SMfBQj5fdvjqn/ODxRkl1 1BNWhzu55rvvenA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX+39tVFPmlf3V
 oGe6ILnr2WTDyp5BqKIJoIjjCqLBVMJE2LDgOR1OzpR1JgjAgOPjYmbtThr4iV5X7nHASjqH/Z3
 dP5DmtTNDTMTaz+JrcO14vF79go5iy0HBVOcaQCcjHjorZje7m+oGoVdajPME7hFUj9GRY5lgOx
 lXObLVmVU1kJDvfxyz3oDLQPijLZq4FH6CvKir+2dk2K80nYH+UxKcpkkcK9BIbhT/7OEUfdCFW
 dw/mceRO/rgbG6A4fGBdEVq1Vwzp4qZipoparS2iUy2teM9631uF8/nWg4IQDT+XXdsCmG8TY8N
 0auiCBGhDufpWKPgiFFdnsTDQ/J5r2s2EC4t7rwWoUZUp6g7d4VYvSAjSyAmWJsTooW561fEIeE
 cKPY1zq5gWTSnmNV7/alc9cMoZpKJk2Qcwq5hW7v4r0aTwxcxbMHhZA1YOvAgZiUVSRU2rislHf
 A8FcnhmHtEt2+kiI55A==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694ab451 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IFuFvOSg1DZuT3FR_m8A:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: a8WWsFm3Ve9sxnzP2B4kPRqpQSgGSmzm
X-Proofpoint-ORIG-GUID: a8WWsFm3Ve9sxnzP2B4kPRqpQSgGSmzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072506_526993_83E6BA20 
X-CRM114-Status: GOOD (  14.18  )
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

The DTS code coding style expects lowercase hex for values and unit
addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/arm/arm-realview-eb.dtsi    | 2 +-
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts | 2 +-
 arch/arm/boot/dts/arm/arm-realview-pb11mp.dts | 2 +-
 arch/arm/boot/dts/arm/arm-realview-pbx.dtsi   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
index 16f784da5a55..ae370d4eb9d8 100644
--- a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
@@ -234,7 +234,7 @@ oscclk0: clock-controller@c {
 				reg = <0x0c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
-				vco-offset = <0x0C>;
+				vco-offset = <0x0c>;
 				clocks = <&xtal24mhz>;
 			};
 			oscclk1: clock-controller@10 {
diff --git a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
index b9b10cbd65aa..a75d8b107fe1 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
@@ -260,7 +260,7 @@ oscclk0: clock-controller@c {
 				reg = <0x0c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
-				vco-offset = <0x0C>;
+				vco-offset = <0x0c>;
 				clocks = <&xtal24mhz>;
 			};
 			oscclk1: clock-controller@10 {
diff --git a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
index db1b6793cd2c..59c78def83f2 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
@@ -343,7 +343,7 @@ oscclk0: clock-controller@c {
 				reg = <0x0c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
-				vco-offset = <0x0C>;
+				vco-offset = <0x0c>;
 				clocks = <&xtal24mhz>;
 			};
 			oscclk1: clock-controller@10 {
diff --git a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
index e625403a9456..0d3d96ffa6e6 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
@@ -256,7 +256,7 @@ oscclk0: clock-controller@c {
 				reg = <0x0c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
-				vco-offset = <0x0C>;
+				vco-offset = <0x0c>;
 				clocks = <&xtal24mhz>;
 			};
 			oscclk1: clock-controller@10 {
-- 
2.51.0


