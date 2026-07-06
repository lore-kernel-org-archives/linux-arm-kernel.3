Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD0DC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YOxRusCSvDS7I6PNHmslnpo+9Tmz+Dk0zTJT/ahx32w=; b=r/qm8ojvvXeR/3q32AJDnN/oal
	yZ0gO6cy86XKLzrXBrZD30YqsR+XJmotsE1Ba8uoywTpI83Kso8uxP4bnuGbNVAbldfMXO/BKCWg7
	HoiAaR222Gx6lXmVrVLqhG45ImZaWXRN7Rk509vI0uLKSV1xE+rhFPLMmnLhIf2TMocxny9icKYXf
	zPoJctb7es/Dk22DdBMAUe5VB1CgXeg/XXC4chVMMY6I8WDcIYL/QK2k82+EMcgJlqhy3YKml5bqa
	4qHwiT5ZnPz61Od99ULyHs9jvkTtiEoD2Pl9qDu3OERBBrrFBylLadDlOuKJfbd9+ucti/3NmlsYq
	j73d6Y1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggP6-0000000CB0f-0IAX;
	Mon, 06 Jul 2026 10:18:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggOz-0000000CAzJ-1ZE5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:18:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669pbQA237498
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 10:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YOxRusCSvDS7I6PNHmslnpo+9Tmz+Dk0zTJ
	T/ahx32w=; b=KofZJpnuoLzgMQt1azBgIa8LhaR473v4IzQcssOr1ykYPurgVfO
	IfypWmSjp5QZHM45xSp1ahWdkyb5Kx/SfhnH3AbJLIKxJJo8OQfkoXXXOWXJfLjf
	MW2kFE3+swoDIU7E0w9p+yjjrue2UjOn2LH3SSaZ2sIcYe2vSLDMV3cZz7uCmuO0
	dNus+pAIhbGu/Jpitlr+bXAQ2+gmHrWgrHGsRwZeFDnTOp8zj6uM4dVbTJ7uz+62
	+PnPft3M93YFfO6406SpmBisitSsO15UsyCKYFBCccekyGqNQ0cRN+sEWA6ggyGI
	2Hj9GBe3mq2sd0adXdLECw//i68Oum0H32g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r03ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:18:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e9a2b95b5so439474985a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333092; x=1783937892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YOxRusCSvDS7I6PNHmslnpo+9Tmz+Dk0zTJT/ahx32w=;
        b=eu4IH+kQ2xZs8ZCjvJV3EmyURq9M8DOfQVSjH6o+fexUF5SVboxwApXB11TR6g7BeM
         gewFThQLx2SgrNY0bjRJkebJne38h45WZN0zG+J/seqBJth0WSMbq9LH1E0udI3F0khB
         QuHt/NemOSjT1OTpiLprBR2NgCZjsdnpoCUHKlY9IRV7jnWbPrBI4xV/IzFLHhkZ4aax
         txS5pc4b9gzVbfvlY0fyiSLPPjFF2V28u3YpQrhN6ESuSe8yxlBHF5s3agTMv+JpkCAB
         ic7ruAYENV2wfi+Ly4SYjFDmKvNkjZeVJP1OPc2R+KRt9+IVUwYwE7Vau8Gj2qxdNNu9
         Ss9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333092; x=1783937892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOxRusCSvDS7I6PNHmslnpo+9Tmz+Dk0zTJT/ahx32w=;
        b=LsQrGmr8HJYoK7i1cD2PHf1PYFKQMQS4eEMmgLEp5serSV6M6/rhIXgXJL4FBswTL2
         wRT3LdtzEDwm0KJPLgHLMBKDANvfzZM5l3GyQo91jloJ5Hn049I2bVlJ4k15Ed4mDT+M
         O62PNIjk7mGxOFveFPGOzre839pub/zc7W6agkwOxlTui3h5lLakB0ali+4DRd+Z8v6S
         +IqQoGnogEfX0xF21t/nrVqAydGLvCaXFULg6SqV4PZ9QtV0+KNprv0634YxXXGuWatG
         mA80+DfakeEIC4knbaCTAIWe9ch4am1ee57qTDebiLhs1At36gkjere5CMUvEPSd/WB2
         nR1A==
X-Forwarded-Encrypted: i=1; AHgh+Rp82ZUt2EOWntyaHy3XlVJVj7fI3Q6liot2BIcLvKgtfaGGyE6G48LG8eQqSJna25MiT56ARKlmDFX4DLfd5AiU@lists.infradead.org
X-Gm-Message-State: AOJu0YxC0qqBbt7m5lLsoM35Xn5yQcBgTMwP1OJm7G4O3sas1En0egRw
	ZYKHW0ULBmPZT+yVNBGiMRXREXGUu+JpjnDTwKX/QqYw6dwYBpkbw8aq45v5dgipFSXgjXBbGBC
	9lOe46u5oJIfqFsi8v5sskI9J0PmA7ylXp8TfxyPR1SDfXZu7UAvu0KhSLQzZb8rP6iseGc8OyM
	5EheB8qG7LZg==
X-Gm-Gg: AfdE7cmSOTk+dBbSzrfyTJDuAu1hew8RHebS2xCmPEUNZFy+POlda4x2GeEXLCmO9oB
	6pWwW8e9Sn5cjcxW/R0mO3ngwNkmIQdJ3Onmwwv0UMxQIwkBoFNdyQfhpUzMvULHsOYY1/O66yz
	JgMDIEBQ9ODfXALIHNmnKfx7oyUBeQZu7lF/Nzles9zc5aJnvC1BqiIYDN1+VahpHY0dPCP9I8y
	YgOarYmByW7LG1KM8434nAvYLgCyvrwS5zkT5FBmyzeCAxqQuHE8qrO9Syd7fRNqnUC+Z+gXBH3
	m+B/nbcwSLDWvKXgPFG3pj6PR2LDk0Df500bo0ALfd40Zz/hgXQIGKyn6stDCh1XvlJ0W6ETzLF
	gsaVCfOYLhQHqw/XIcBq2odom81Y=
X-Received: by 2002:a05:620a:28c6:b0:915:cda5:27ff with SMTP id af79cd13be357-92e9a419d02mr1433501885a.45.1783333091629;
        Mon, 06 Jul 2026 03:18:11 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:915:cda5:27ff with SMTP id af79cd13be357-92e9a419d02mr1433498685a.45.1783333091198;
        Mon, 06 Jul 2026 03:18:11 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d910sm22908219f8f.6.2026.07.06.03.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Alexey Charkov <alchark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: vt8500: Correct indentation
Date: Mon,  6 Jul 2026 12:18:06 +0200
Message-ID: <20260706101805.341103-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9358; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=H6KNydM5/kYWRRkSb9JhYDs9KRF2JwdOUGo8ZBhBSdg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4DdWRr618BD6n+v72aPfU7piRnjbUGZ3ff19
 7shAwUCRM+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuA3QAKCRDBN2bmhouD
 1ymbD/44EELK7GM4tuQyf4OS7D/GuIBBPCiMScUvUvyWeVoouoJ7WcFakJcz7E2ccrezGBwPNp0
 EQePwIl9nYrGdZRn89OUSXWXVR6cuos1Keha1zi9pViwB3H3Sw+fXoDCrQp2LlFWbtuzIZfc1D6
 oReVAlhiZFdwejsOCfhCkmeiyZzfVbJH9eY9/we4QqAFJ8UO/LyOidZpHRidmml2SZv29f2usmp
 MJ6LUSsX7UHbCezS8Ff6MBSuQZmyoHyCEoiqWJoVY0J8RbDIXi1nbCK189Y9uMqrLh4aXTpKKtI
 XwkJt8jG6StWZNYBtTRRAH69vXgYxjPIPcRybqF1CWLpEb4RfqAsFaX63B8lKMgaaoAKlRczJZm
 MAdB2Y5qEKZ6AYSdQZdOPWlWQbMTyANOe6tqC+EGhSRzE5whydQRpusC766lfPClj6PLCeHVhsX
 +bXTN9VbEaUkB0mnkYrQs3dhD46NVJMKZxGLHp3hRgU5MILWHttXdgHQ/Gpr0/ovsKojWANpll+
 yqwpq8vmmpIMFlE7pRx5L9ozTacpva3Vd11HthGXpks0TaNYIT6J80sQc+o7tqESRYqW1PTW8VN
 6xoejiorr12JvFS3PB9qiLaqfh9YkfYym3Rsg2f7Viu9HBy3q/wdrStiye4RLQSaoDjqLARCsR1 zx8C8uwbH07CBlg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXz5LfaDQnTlrz
 LJOreTeQVZndjwNVSaP/r23ZcSbGDiJj3LrVjmn0wkbLPpdoXPPdHcaRSPms1757320gGZHc+tb
 HcLfJsca/im19/kJlsOnr6DH/HsgCqn6in/cMS4PfIgxHqQWeaSL73YL4NoId1cfwP4j/nL1Lk3
 W98VfmquEEOICZE4QXdEYqOD24T7sjQ24pN4e0zgKhQM+bPN98ep7pdcXkNACIiPVwuLGk//h83
 8SKNzlCpflqCVBPJSFQ5Hf74ivQdlQLcUGrC4mtAbdvNbR3vOabuhDHA3rXew9jOROGn2jK4dnO
 OV2uwMNKnAXZK3UsOeHfiZuVOBLudM1trGVmomxvIldxYJTRzF9NOm09FwxocCsRCEdw5nE3zvE
 DOH/qkfoR+KlimwiGGMj3BlcAN7q+UBU969Ywh70mw2lSz+Q4NALlgv9cSnFpcQSeCFoSKvGzsV
 HxvDvUeYIQQ99ugj80A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX/aFKhhPxqqAQ
 6V9fsseBniAc83/RMgr3oTsiDMBu5lGTSREHOBK9ttjz9ytcqrwsO5CAbjJt1bi0csLD9hsriaa
 wnuv8AnL8z+Q/Tj6AwLfi4KC/HpqiWM=
X-Proofpoint-GUID: _gz8SAFcMpVBVmmhkkWF8iO0VYl80Cto
X-Proofpoint-ORIG-GUID: _gz8SAFcMpVBVmmhkkWF8iO0VYl80Cto
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4b80e4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=YIy-g2JZa4JrWsc84VAA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031813_543073_F3381BEE 
X-CRM114-Status: GOOD (  14.81  )
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
 arch/arm/boot/dts/vt8500/wm8505.dtsi |   4 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi |   8 +--
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 104 +++++++++++++--------------
 arch/arm/boot/dts/vt8500/wm8850.dtsi |  54 +++++++-------
 4 files changed, 85 insertions(+), 85 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 915adbf6e1e0..40fa00f82fad 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -21,14 +21,14 @@ cpu@0 {
 		};
 	};
 
- 	aliases {
+	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
 		serial3 = &uart3;
 		serial4 = &uart4;
 		serial5 = &uart5;
- 	};
+	};
 
 	soc {
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 82eef7504364..d27a6aac8aa4 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -21,7 +21,7 @@ cpu@0 {
 		};
 	};
 
- 	aliases {
+	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
 	};
@@ -147,12 +147,12 @@ clkddr: ddr {
 				};
 
 				clkuart0: uart0 {
- 					#clock-cells = <0>;
- 					compatible = "via,vt8500-device-clock";
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
 					clocks = <&ref24>;
 					enable-reg = <0x250>;
 					enable-bit = <1>;
- 				};
+				};
 
 				clkuart1: uart1 {
 					#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 5342b7fe4ef8..d8c21097784d 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -168,37 +168,37 @@ clkuart1: uart1 {
 					enable-bit = <25>;
 				};
 
-                                clkuart2: uart2 {
-                                        #clock-cells = <0>;
-                                        compatible = "via,vt8500-device-clock";
-                                        clocks = <&ref24>;
-                                        enable-reg = <0x254>;
-                                        enable-bit = <26>;
-                                };
+				clkuart2: uart2 {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&ref24>;
+					enable-reg = <0x254>;
+					enable-bit = <26>;
+				};
 
-                                clkuart3: uart3 {
-                                        #clock-cells = <0>;
-                                        compatible = "via,vt8500-device-clock";
-                                        clocks = <&ref24>;
-                                        enable-reg = <0x254>;
-                                        enable-bit = <27>;
-                                };
+				clkuart3: uart3 {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&ref24>;
+					enable-reg = <0x254>;
+					enable-bit = <27>;
+				};
 
-                                clkuart4: uart4 {
-                                        #clock-cells = <0>;
-                                        compatible = "via,vt8500-device-clock";
-                                        clocks = <&ref24>;
-                                        enable-reg = <0x254>;
-                                        enable-bit = <28>;
-                                };
+				clkuart4: uart4 {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&ref24>;
+					enable-reg = <0x254>;
+					enable-bit = <28>;
+				};
 
-                                clkuart5: uart5 {
-                                        #clock-cells = <0>;
-                                        compatible = "via,vt8500-device-clock";
-                                        clocks = <&ref24>;
-                                        enable-reg = <0x254>;
-                                        enable-bit = <29>;
-                                };
+				clkuart5: uart5 {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&ref24>;
+					enable-reg = <0x254>;
+					enable-bit = <29>;
+				};
 
 				clkpwm: pwm {
 					#clock-cells = <0>;
@@ -286,37 +286,37 @@ uart1: serial@d82b0000 {
 			status = "disabled";
 		};
 
-                uart2: serial@d8210000 {
-                        compatible = "via,vt8500-uart";
-                        reg = <0xd8210000 0x1040>;
-                        interrupts = <47>;
-                        clocks = <&clkuart2>;
+		uart2: serial@d8210000 {
+			compatible = "via,vt8500-uart";
+			reg = <0xd8210000 0x1040>;
+			interrupts = <47>;
+			clocks = <&clkuart2>;
 			status = "disabled";
-                };
+		};
 
-                uart3: serial@d82c0000 {
-                        compatible = "via,vt8500-uart";
-                        reg = <0xd82c0000 0x1040>;
-                        interrupts = <50>;
-                        clocks = <&clkuart3>;
+		uart3: serial@d82c0000 {
+			compatible = "via,vt8500-uart";
+			reg = <0xd82c0000 0x1040>;
+			interrupts = <50>;
+			clocks = <&clkuart3>;
 			status = "disabled";
-                };
+		};
 
-                uart4: serial@d8370000 {
-                        compatible = "via,vt8500-uart";
-                        reg = <0xd8370000 0x1040>;
-                        interrupts = <30>;
-                        clocks = <&clkuart4>;
+		uart4: serial@d8370000 {
+			compatible = "via,vt8500-uart";
+			reg = <0xd8370000 0x1040>;
+			interrupts = <30>;
+			clocks = <&clkuart4>;
 			status = "disabled";
-                };
+		};
 
-                uart5: serial@d8380000 {
-                        compatible = "via,vt8500-uart";
-                        reg = <0xd8380000 0x1040>;
-                        interrupts = <43>;
-                        clocks = <&clkuart5>;
+		uart5: serial@d8380000 {
+			compatible = "via,vt8500-uart";
+			reg = <0xd8380000 0x1040>;
+			interrupts = <43>;
+			clocks = <&clkuart5>;
 			status = "disabled";
-                };
+		};
 
 		rtc@d8100000 {
 			compatible = "via,vt8500-rtc";
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index 58109aa05f74..a17ac3515985 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -179,21 +179,21 @@ clkuart1: uart1 {
 					enable-bit = <25>;
 				};
 
-                                clkuart2: uart2 {
-                                        #clock-cells = <0>;
-                                        compatible = "via,vt8500-device-clock";
-                                        clocks = <&ref24>;
-                                        enable-reg = <0x254>;
-                                        enable-bit = <26>;
-                                };
+				clkuart2: uart2 {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&ref24>;
+					enable-reg = <0x254>;
+					enable-bit = <26>;
+				};
 
-                                clkuart3: uart3 {
-                                        #clock-cells = <0>;
-                                        compatible = "via,vt8500-device-clock";
-                                        clocks = <&ref24>;
-                                        enable-reg = <0x254>;
-                                        enable-bit = <27>;
-                                };
+				clkuart3: uart3 {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&ref24>;
+					enable-reg = <0x254>;
+					enable-bit = <27>;
+				};
 
 				clkpwm: pwm {
 					#clock-cells = <0>;
@@ -273,21 +273,21 @@ uart1: serial@d82b0000 {
 			status = "disabled";
 		};
 
-                uart2: serial@d8210000 {
-                        compatible = "via,vt8500-uart";
-                        reg = <0xd8210000 0x1040>;
-                        interrupts = <47>;
-                        clocks = <&clkuart2>;
+		uart2: serial@d8210000 {
+			compatible = "via,vt8500-uart";
+			reg = <0xd8210000 0x1040>;
+			interrupts = <47>;
+			clocks = <&clkuart2>;
 			status = "disabled";
-                };
+		};
 
-                uart3: serial@d82c0000 {
-                        compatible = "via,vt8500-uart";
-                        reg = <0xd82c0000 0x1040>;
-                        interrupts = <50>;
-                        clocks = <&clkuart3>;
+		uart3: serial@d82c0000 {
+			compatible = "via,vt8500-uart";
+			reg = <0xd82c0000 0x1040>;
+			interrupts = <50>;
+			clocks = <&clkuart3>;
 			status = "disabled";
-                };
+		};
 
 		rtc@d8100000 {
 			compatible = "via,vt8500-rtc";
@@ -308,7 +308,7 @@ ethernet@d8004000 {
 			compatible = "via,vt8500-rhine";
 			reg = <0xd8004000 0x100>;
 			interrupts = <10>;
-                };
+		};
 
 		l2_cache: cache-controller@d9000000 {
 			compatible = "arm,pl310-cache";
-- 
2.53.0


