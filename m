Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB04C88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxYyNH7t0YjYIXb2eXg5KjHiSWUHb9NZkxXeI7htHp4=; b=JltlzoJV7U8O4c34sFNoqGmZYn
	10Kt85vuScqnk9dIhFYaXyBe/nLzKRtZJ5ZHUjNnfYjsW5eP0UIznGSidSim1MhkRCKZn4iqAS3FD
	ZbbWwGmupLTXw/VTgyx04DqBacZvTFt0nJjJMgTxdSPUlj8HtvgTiRfLIBr3uZnFE+s2m1tWZ6F1B
	hXEQCXYbUB85F2nlnrRKBxki1u+KbuumOU0D22JhNo8Yyfo9tBNEmmiMxMChLvZeSUmKph3G7f6Hp
	CGA+Ir8KssVBS+PSJBwsKKpEC4ngIzJ8n5JS9M+B/T2HIKWDpdm1tyStvTNM7TzBYCx4LwgFsBkIG
	Ap1Iy/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yML-0000000GMAq-0Yss;
	Fri, 11 Sep 2026 10:19:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yMB-0000000GM6P-2PjZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:19:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kqQm2311530
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CxYyNH7t0YjYIXb2eXg5KjHiSWUHb9NZkxXeI7htHp4=; b=IY75OocCXIBB1kJV
	MTcUPbF7pstoB4zPbIamuM30JzvzlrwJ+uhxgLBD0WzqMNdrAYK/b3U+rvF1WA+2
	dkE7EChVdcoipptdPVjc15pr6u1WckRnX8+j74CwxgnOWmSIu7EL+aTLf+ZmwH6g
	Cq0AYyVnxaYmMWyYKeWf4n8dzlDn37B8CFqX2XcPVXoy9ELEMZmWGlhGDOD7Rvap
	z8IP8SMOTyvmsVUbbFbsaqjtq0Vkb0tTlfBSuSHnTJ4gVBZRJvpOHaEVytWeGza5
	g8RD6UoxVj1mEySjoB1NaWGsRL+nBIRWvp0HApPzvqHo/4G2YGd29onGXIFBYjL1
	3qhkzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uchxmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so133398485a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121982; x=1789726782; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxYyNH7t0YjYIXb2eXg5KjHiSWUHb9NZkxXeI7htHp4=;
        b=d4DJ5MsFtvQzBvo8K2kkGT/PPGIXIJEuhqYSeXWyCK9Pm/5bec1ITWITMbiKIT5UFp
         bIFQAu3MUiSNBnpccAvZRLCN1nSLkJEYOCycBVwgSQvy3RRpkMAFY8QsVSxUk8mOvmKB
         QzQJL9vC7BRVCRH6n7PJM25wkllVnzKeeLIR9BHkxWWoXX2i1yxWMyVyA6KDnXDNyt3f
         lL+ysCfFc4kEQVlnzwrGCgjuNOfYNFUBVyd2XRiSiN9K/HeeReFJPe3+AUETsDsHZHWo
         MvluE2uwzRvQNJ3SDECMt+yK4vvxyQNegfqlm8s0nAduu/BXgWG7qLzragrRsgPCaqeF
         7kDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121982; x=1789726782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxYyNH7t0YjYIXb2eXg5KjHiSWUHb9NZkxXeI7htHp4=;
        b=i+BXR5GtIXRTCDX/4sJtMHJl1pXEBXobxeIrp+PQJKMOrz3YQtj3e4TpVjcTkH+it7
         4fZh04nDyqlD96mnoxeVGW3Wwj8kNGZ6zifwVJwe7z4saFAt8zAvRqI/djJE5uhH7RdA
         wAuAOLh+9hse7R3UCoHBEaF0fVenGeFA8TwLjb8H1a+L0u5DqK5Iqj2U9McpG36t1qKH
         ALB+05SnFY7tEQ92chKFXEL4n/py6OuGV6G52gz+1SOJtfVOwBJRrocJfroICopDtRId
         heSueEE1Bieuy+tc229UuHdjHPR5PDtbvptgM7hVqfW0voAmKG8AoAsJ73IGeFjvlkm3
         g+Yg==
X-Gm-Message-State: AFuF++k946gGi792CxayGga95pp6JWQ3a5rpx7vAA89Cu+GRy1dcoG/W
	Pq7PTSFd7lk6Sv6KCFzL4OdazBR4lcX2bnipAXWC0k+5W3ub4qkdweMtYwVaYqGxVyoKfC8NcKj
	zzd8j4ep3m//JFHFnuWHBoBOIB1GJk5x/euUEyYJYNA7P/VXAA1RcjcVY20VnMunzjAihXLbOwM
	n5yNpTv6rDgg==
X-Gm-Gg: AYBFou07ckiU5fQf6lUQwOm7FwZ+q1pPSJ/TyZ0sfxso9hxWyh2L6nrWdhxYVXBWDli
	w3Eo+C/R8qKlLmJd3/LGucWybTpO3ntTnabAfARJVqbgFmDsK+10L+Smncsf/RZysLnYV720bQ1
	NPn0VpzoSqvE0+0nYKLqpmDvoEmRZI3XcVeqHv3sS0l/2P66nIf5B4MPiYtw4fVKvd2L1RTHRXM
	GJ06P1ajTZKdHrLPGd6F9uZqRKGW4Ca9d9aRVtfIVXWK4NN0quW3x1B4La+90ijkC8Gmi7YamvW
	xUZo0F/Guc7WJaKiT9Q+zGWueVVU3LCRu9WNvw0hLkX1uO9r1YAn/O18GBSndtKHoFH1qEomcz3
	hbidWmCOBlKL5DGpOIOG795c=
X-Received: by 2002:a05:620a:90cf:10b0:939:ac74:1bbf with SMTP id af79cd13be357-939ea049212mr309634785a.4.1789121982122;
        Fri, 11 Sep 2026 03:19:42 -0700 (PDT)
X-Received: by 2002:a05:620a:90cf:10b0:939:ac74:1bbf with SMTP id af79cd13be357-939ea049212mr309631985a.4.1789121981614;
        Fri, 11 Sep 2026 03:19:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:12 +0200
Subject: [PATCH 04/10] arm64: dts: exynos: gs101: Re-order nodes to match
 coding style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-4-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5170;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eusrwaG+SvByYvYohBSnaY9dQNEAbeKkEOhPwmxNvmk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9Wqy3dyMhwgraWKPZX0S6JasxEXd1DO5Ezjx
 Wtl9hVDPpqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVqgAKCRDBN2bmhouD
 19WeD/9zaapOLgZRi+jN0Oz1v+6bcdL+vOAQc1QptNHWygXG8aPM5R6Nw1CbMf2tm2nO4WnlBsz
 MkCOoVQ8Q1wCKKTtkNvnaFBpntAc6CJAz2WWMrFxfjJI9h4YNgX4lv846xqJn6cb0UrXdEuG6Xc
 32WHVHCr/tfzXkbJPOjgCiZ/tT3RxBfUJVJqp9Al6PXvGj8lzbehOue/46aeEGSfEh3eFjOCZ+q
 punXzhNdLQ1ucDc+gdIQVDJV30xTn2phDsTEm6zZRWnoelGjWsITPDgTcxPjUsjY0Sy7w7enjFz
 P+JRpnvIQXTm4dzRfJE3XmilLjVZ1criJvvL//m3jCShaJLOccQT/DkKU0s7rvBu6EGcuIJTuti
 eZht7oyLRlWY9VcxyEIen+CvSiFwyavCh8p+xqNZusnqI7kByOo1WiglhaLIMvw/oTu9fSbVybc
 On7NiaqNyohMXFq/ZNJGZldXWiG88UonwKIr7wzs87nHWf6BgjjTs28AkdfmEtUEpxEshfRZQ+o
 w0T1DzJC3H7hLirScWrATi25AAA/oWPWuSbmC5InWknrBj+ll30gUM2JnUT7Sl88FKSaqgTThbg
 LjkqbSReFXDPkM8SUbn22U9MXU9fSVTcOYt0xOytICA42gBKWjVRPOdImruT/aCqZrme0H1umBO
 69zpEl8NaQAMzmQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3d5bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fnwEYphLvHfYI_5qUm8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX/6ZR2sCYzb9C
 Q3Dm4LFdoMnVCqTZxm41U59cK7IUbZgH7JF3mhYq+ipQi3HsjD2sbttofSkR2EGPCS1KsIK6p6y
 VLPa3LD8f+zmTfcxSXcjucQGpqgZYJbCiOba4QkxOeFY7a5GbaRBOkbPxJ0qxIOW3Y3n6LZIzWF
 rw2xCsakDBf8Hyzevt4HSIYUQR9kBk2jCK22moMvK2pbJlpZBaX/jZ81C/7UYpRgJ43r1/KsHiU
 az5EQ5wGS7LqECvUKj9lDoxt61pBiHHJTU+ZylzjRHQA00rhRo07b980dm21ZhuZ+a6uLB8APy1
 b2iGiEJenhLXnDOsPSQ3e3AGJdFKeyw9QTts1Ns6o/23fIHPxlq4972k2S7axSg6HZMJU/3MvIX
 bjjisOEjec68G2GxwY8PvuzxTyE1vKNSEG4vyKlG8BIKCfbuzxZ3dw9op62SCcyWDeuqEUiaVNJ
 Jo1xLWFRS022pb4kxzA==
X-Proofpoint-GUID: 7HuOfX2LnJGx3nFFHPKuAoP0-_HQAjZD
X-Proofpoint-ORIG-GUID: 7HuOfX2LnJGx3nFFHPKuAoP0-_HQAjZD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXyHc8rQdxQcRM
 KWROzNmP++HHCtaivatKSafbHEW3qphC8v6xCB8PC9Uc96BbpO8HzkqEwyz/sYmpf/Bj4lQkJ19
 tF52KZ7x1LYLBlW9pEXYLCeLwEnHBOg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_031943_632950_D145464C 
X-CRM114-Status: GOOD (  16.35  )
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

Re-order a few nodes to match coding style - ordering by the name, as
pointed out by dt-check-style, e.g.:

  gs101.dtsi:476: [child-name-order] child node 'ect' out of name order
  gs101.dtsi:479: [child-name-order] child node 'clock-1' out of name order

While moving the lines, move also linux,code to the end to follow convention.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 32 +++++-----
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 72 +++++++++++-----------
 2 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index f14c62c8fec8..31bd42c81c38 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -42,6 +42,13 @@ gpio-keys {
 		pinctrl-0 = <&key_voldown>, <&key_volup>, <&key_power>;
 		pinctrl-names = "default";
 
+		button-power {
+			label = "KEY_POWER";
+			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+			linux,code = <KEY_POWER>;
+		};
+
 		button-vol-down {
 			label = "KEY_VOLUMEDOWN";
 			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
@@ -55,13 +62,6 @@ button-vol-up {
 			wakeup-source;
 			linux,code = <KEY_VOLUMEUP>;
 		};
-
-		button-power {
-			label = "KEY_POWER";
-			linux,code = <KEY_POWER>;
-			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
-			wakeup-source;
-		};
 	};
 
 	reboot-mode {
@@ -527,15 +527,6 @@ buck10s {
 				regulator-always-on;
 			};
 
-			buckd {
-				regulator-name = "vcc_ufs";
-				regulator-min-microvolt = <2400000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-ramp-delay = <6250>;
-				regulator-always-on;
-				samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
-			};
-
 			s2mpg11_bucka: bucka {
 				/* lots, IO */
 				regulator-name = "bucka";
@@ -551,6 +542,15 @@ s2mpg11_buckboost: buckboost {
 				regulator-max-microvolt = <3600000>;
 			};
 
+			buckd {
+				regulator-name = "vcc_ufs";
+				regulator-min-microvolt = <2400000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
+			};
+
 			ldo1s {
 				regulator-name = "vdd_g3d_m";
 				regulator-min-microvolt = <450000>;
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 1bf59eae9360..b218ff50d228 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -30,6 +30,18 @@ aliases {
 		pinctrl7 = &pinctrl_hsi2;
 	};
 
+	ext_24_5m: clock-1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "oscclk";
+	};
+
+	ext_200m: clock-2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "ext-200m";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -205,6 +217,19 @@ hera_cpu_sleep: cpu-hera-sleep {
 		};
 	};
 
+	/* ect node is required to be present by bootloader */
+	ect {
+	};
+
+	firmware {
+		acpm_ipc: power-management {
+			compatible = "google,gs101-acpm-ipc";
+			#clock-cells = <1>;
+			mboxes = <&ap2apm_mailbox>;
+			shmem = <&apm_sram>;
+		};
+	};
+
 	cpucl0_opp_table: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
@@ -472,31 +497,6 @@ opp-2802000000 {
 		};
 	};
 
-	/* ect node is required to be present by bootloader */
-	ect {
-	};
-
-	ext_24_5m: clock-1 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-output-names = "oscclk";
-	};
-
-	ext_200m: clock-2 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-output-names = "ext-200m";
-	};
-
-	firmware {
-		acpm_ipc: power-management {
-			compatible = "google,gs101-acpm-ipc";
-			#clock-cells = <1>;
-			mboxes = <&ap2apm_mailbox>;
-			shmem = <&apm_sram>;
-		};
-	};
-
 	pmu-0 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
@@ -1806,17 +1806,6 @@ pmu_system_controller: system-controller@17460000 {
 			reg = <0x17460000 0x10000>;
 			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
-			poweroff: syscon-poweroff {
-				compatible = "syscon-poweroff";
-				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
-				mask = <0x00000100>;
-				value = <0x0>;
-			};
-
-			reboot: syscon-reboot {
-				compatible = "google,gs101-reboot";
-			};
-
 			reboot-mode {
 				compatible = "syscon-reboot-mode";
 				offset = <0x0810>; /* EXYNOS_PMU_SYSIP_DAT0 */
@@ -1830,6 +1819,17 @@ reboot-mode {
 				mode-shutdown-thermal = <0x51>;
 				mode-shutdown-thermal-battery = <0x51>;
 			};
+
+			poweroff: syscon-poweroff {
+				compatible = "syscon-poweroff";
+				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
+				mask = <0x00000100>;
+				value = <0x0>;
+			};
+
+			reboot: syscon-reboot {
+				compatible = "google,gs101-reboot";
+			};
 		};
 
 		pmu_intr_gen: syscon@17470000 {

-- 
2.53.0


