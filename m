Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C90EEF33A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NSqAxF3r0Iieh2WUFeA3eHT3sx6AFCO5GTCkL4uXVs=; b=ypX2K5i+C+p34jIgFAlCV0WeNw
	Y+ALXkqfbNKMRll5qVYJOqtP5gMrjixRRWVoiOs5xxndTlq0GMbZqbgy9m8CzFNw8P0P6fxYlcr4n
	YaOkVbor5M8S6ic4ENq1q4pyrtyadX/Gtz1obEn2oW8D6YyLfyE0UQkEJPbtYOPSu89hoEOkNQhq1
	zO7tFVujkSiR6GaCpRZzzF3zybuDmsAN5p3f9Lh2tXkpoXYHWlkXYaObTdT4Rl1lRvzJ0Grq693kQ
	uoqKBAEhJDaCtggO9YV4ef/Nb4RD81q07+i3365HtK4jGufXkUoV9xOzAozCTeEU1TTeFaJ38gfEH
	vgVqqc2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4iB-00000001JmH-2oUA;
	Thu, 05 Mar 2026 09:09:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4i9-00000001Jki-0qA5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:09:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253B6uY866516
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3NSqAxF3r0Iieh2WUFeA3eHT3sx6AFCO5GTCkL4uXVs=; b=P9fqzOeHiMFU3pVm
	SS3hs3HuOLA0t9IOKqUyOodq9WYGCZ0z8BZUs0pgEU99MRnGq3j1Si/B1Fzzb02R
	1sjht9ljwLbkW2mpMsB2itIYxkyUvuOi9menhPzPl6Rz31pVJQDo8j2Uyy8YmhWF
	skhJ6HPZa1KnKFLA/B250RlC2Qx9QW1v2F0/aBMc0kOUaZaGmoLxkI4uGlzo8msC
	E4GGaqgRmKaqNv7o4J7Oyq60inL6fEc81kdEFWcYIeuJQCzljCgXctuaeetBLEY5
	hOWxsP2XBneG0+4AwDk1f176UlgUWTt5Q/XiW5bbGMAbh67tVkshWCnikEj9kMMm
	ttiVCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk1309-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:09:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4a241582so4181671285a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701775; x=1773306575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NSqAxF3r0Iieh2WUFeA3eHT3sx6AFCO5GTCkL4uXVs=;
        b=iEPwyBKZeZPi1gz3e8VnBbKyzrjDwxP7rugCQDeFAEgkSTWN3SMSZWGXkFUhf/E/vZ
         FUTuzciCW0GvRrBzUObb6LhF72xDbwzZW2MMoDkcOVKTie9fVJsckqOHT2BiiXw93XbC
         ZiFqY5UD9JjT5L6hvX0fYLfWZf0IAnSthZFIKhp5RdMYXcf6hJeM6nnEkhaMdXqH2oaO
         4okRMlCZYEyKgQBbdeZ1yL2zn7/TCQAFI04JxGkc198AUof50Y2JtpA+C1X1aBkOWMRf
         ubLz3RMTpmSn1yjThH766zcZmcoDmurjg1Q6HGvhbkEvzxmk3iyjzWYn6/mKehNLy9jg
         iB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701775; x=1773306575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3NSqAxF3r0Iieh2WUFeA3eHT3sx6AFCO5GTCkL4uXVs=;
        b=Vz2iYbzvIooZl6/mgZPIsj+V7uDL4SUiQkpgiprlIRVgxpf99bYQg1vBG40SxD8kpL
         vi4UotNRUW/FmHEdB6weypGlQpBaoQ09ocqzvGi+q2y4nwZXDw66TVOXqRpZwYe2FJdb
         XvP7yYb0btDA3DvhtuvjCMEmZXMlGHGI+jyDPEoiARFoMTmuYBlSCIdJjy4xr6R3Kg66
         /CVty0frd8z9ES2IOygGOMwD4+Z/ugXU89Srpl4d09kCdFzJBaKewcDd0QCsE2hF5R/R
         QU6rXzK45qwnLVe6Az8Ov1K7EzcGtsh6lybBlz1obYJxdzouHA/lz40w/D3ZvnQuRbwH
         jp0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVs7M8gSJ6Rc+Wte93t+0PR2/IMevcgEEgmXkSmxUVd6mfFakiMFGV/VX+fSiSQ08rZrwiw7zb9V3S+F7ScfLYE@lists.infradead.org
X-Gm-Message-State: AOJu0YzKz/QqiuLXkT3Q+kRilWx2Z6pCH6cCOE8yZvjoTcKQAQA2EWEZ
	1rst1KwrSnYu+c50cJleVNDbX/XZbTuNwpKF7Aa2eH5te7EgBp+SgK+jHAcn48UsrZtLTnxOdi9
	8herM1p4G58FdkI0HwL0s3uhjJQk9uM0QiCNQkdZLKEcjnGKP6zaRSyqBXuECW/URGI1bA3hOJM
	gMCmVZ8T/siw==
X-Gm-Gg: ATEYQzxyqDlzbMKrCIkRpHtc4jcA4t7x7LVr+S96zQs8DY1RHiH3W9020xq8ZYmJ1IQ
	5zRFp7M6FRRbpSFVPV4m3I4WTKMpKGlH81rGrDWH/+ErhAIeCJ2ToG0KNFTCM4LB67PMOtbFglj
	RCAGiNlSyBB69VdyoFL/odQNwy/vQFnN+KDAcapOKvzoRZixAeNSszdTCaZeB+TIKaSayAeLESO
	emmbjxlzTZGGAxLfzWDz9APoCjqCfxcSPa/47SQ8FxM5iQgbi4bdYFX7sIZqcIXy6j5merPrlVT
	SbONZt66Jb6mE3A7UB1sfn+c3jHoxw9lj5/ZrrS7IwnI6lmXC/l87d+wzoTbmkS+3mwkestjmVG
	cC8YnwEf8l3HGVLf+61LaVciBVbPXFz9OXAPtnRtobC+e
X-Received: by 2002:a05:620a:c4b:b0:8cb:4543:c5cc with SMTP id af79cd13be357-8cd5aeea4e4mr678426385a.20.1772701775323;
        Thu, 05 Mar 2026 01:09:35 -0800 (PST)
X-Received: by 2002:a05:620a:c4b:b0:8cb:4543:c5cc with SMTP id af79cd13be357-8cd5aeea4e4mr678423485a.20.1772701774882;
        Thu, 05 Mar 2026 01:09:34 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm38817703f8f.6.2026.03.05.01.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:09:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:09:25 +0100
Subject: [PATCH 2/5] arm64: dts: exynos8895: Move I2C address/size-cells to
 DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dts-exynos-i2c-v1-2-2c8d3df3b9ca@oss.qualcomm.com>
References: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
In-Reply-To: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9622;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qkwvOBIjVKY+jX5sOdQlNLj1HsD1JTAivWXbCCNysDg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqUhGeownSnEhVD4uNo77/EysGV8haRBVi6gue
 04tpfN5TCqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaalIRgAKCRDBN2bmhouD
 12lvD/oCHl5sKqK+y1S4uef9jsHOvxti/Z1DN9Z4wtTICWqMV2ih3tCF5bvXNUh5cfUEyPJNDk+
 e539pPAyz54mX3ORNAtjMxdnE0PhwSwsM6SDF6c9rIneLS4kxiS8ILfUZBtx1zlTiWdpapIY3AJ
 sb8rZBu0hSgQcNHVSS1scWw/E6mCp9wStDYD+Y1m/QL8/7nJcUw+bkA6BWXNV1QYR6jnK2wzxWi
 NGOiC16v7fqgNYE478C8RBXhv5jvwbULCsc0sQldl3EyxoH29rMpmfe7cjXD3x5VUXWb4zfrIBf
 EYQUZgeqC/BFaDRBE7uEzhhpqGl6Qyx5lH+xhejTgwXHfSQMTKTX72DImtHE3ZP3J+NRIt8yC7M
 AEKNLxlIceZ3kr8y2Z4m/cKYfu2RCsBWPxozhblthmpOr/gZ8mva+7h2RkHiKsuc1IrMca0Nxtx
 hLcejm8j0g++1KEoVH9gXR2RF+2e4mUDXNqVzPZf+hjivESBXwny2yw0fcqMQIAitCpJ/l2Nvtj
 EKaL8XQ6cWWmiJYTCzLfZbJb/AlIqasgH+mNg7MQKv1Xq9Ria+B5J4EKsJ7//dS5bG49qbRkFQq
 rZ9bM5D8w0C72eK2Pwf+9Ls/F9OFkcfZzuA9vHjIBmytu5zcnWuA/71SxZ8gJHOTMepmTm7GXFP
 g4p3Oi4IJa+mYeQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 1nq1xhzQWeoBgZEQJLIfftjhtpYJE0iu
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a94850 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DzUSkR2MQIpuhHpr3ioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 1nq1xhzQWeoBgZEQJLIfftjhtpYJE0iu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MyBTYWx0ZWRfX5h1XLtVlfYBR
 bJc0te9wUFc7xRC8VMH0l95LxSdYRN0J9EfYDgRulGTpdI0BNomadbQqhhQIZXGWN0gO3SInL5Y
 KMKVeRS//FoFkj0U4+N5hLbdcBKvm4qzIjO5Mi2qFISBbCPyi9uNSBbpCOz8VPStfRzCkxZx+GW
 jrXVHoCTq/rKrvQoNXuWMENsnv97qrh7h27gPNC0v3Q3idEAS6NyGsIqDXVlTmrili9vt7PSdD2
 mO9fZJyl7pewYZXjobgozuGzXhbm5QG+OxidvVK7wI4hTEVW93Zqyl9uc8XFU2BYE6WZT/0ADmK
 JUneqBGQgUdYocnv+2J+IfLgbq5ipze83ZcI30vkwQjh6JGCRE1OgNhXr0MQcLf4FqFudTI//Ye
 Ax5ciFN9E6rUD+jBiKx3Boq27dnRAWP1Rz2qKUUOm3vVXyGzxYz+n1C9Myuu76G2MeLVKstvHik
 a3yrTt/PRzMf82RExvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_010937_375270_52A84CDD 
X-CRM114-Status: GOOD (  15.43  )
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

Convention followed in all other DTSI files is to define I2C controller
address/size-cells in the DTSI thus reducing code needed in each DTS.
It's also logical, since I2C is a bus and needs definition of addressing
children, even if the bus is enabled without the nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |   2 -
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         | 128 +++++++++++++++++++++
 2 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
index 61e064af3337..305dc72f93d8 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
@@ -103,8 +103,6 @@ reg_placeholder: regulator-0 {
 };
 
 &hsi2c_23 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	status = "okay";
 
 	touchscreen@48 {
diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index f92d2a8a20a2..ff114cd6c9ea 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -266,6 +266,10 @@ hsi2c_5: i2c@0 {
 				interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c5_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -305,6 +309,10 @@ hsi2c_6: i2c@10000 {
 				interrupts = <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c6_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -328,6 +336,10 @@ hsi2c_7: i2c@0 {
 				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c5_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -367,6 +379,10 @@ hsi2c_8: i2c@10000 {
 				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c8_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -390,6 +406,10 @@ hsi2c_9: i2c@0 {
 				interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c9_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -429,6 +449,10 @@ hsi2c_10: i2c@10000 {
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c10_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -452,6 +476,10 @@ hsi2c_11: i2c@0 {
 				interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c11_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -491,6 +519,10 @@ hsi2c_12: i2c@10000 {
 				interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c12_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -565,6 +597,10 @@ hsi2c_13: i2c@0 {
 				interrupts = <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c13_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -604,6 +640,10 @@ hsi2c_14: i2c@10000 {
 				interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c14_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -627,6 +667,10 @@ hsi2c_15: i2c@0 {
 				interrupts = <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c15_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -666,6 +710,10 @@ hsi2c_16: i2c@10000 {
 				interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c16_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -689,6 +737,10 @@ hsi2c_17: i2c@0 {
 				interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c17_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -728,6 +780,10 @@ hsi2c_18: i2c@10000 {
 				interrupts = <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c18_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -751,6 +807,10 @@ hsi2c_19: i2c@0 {
 				interrupts = <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c19_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -790,6 +850,10 @@ hsi2c_20: i2c@10000 {
 				interrupts = <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c20_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -813,6 +877,10 @@ hsi2c_21: i2c@0 {
 				interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c21_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -852,6 +920,10 @@ hsi2c_22: i2c@10000 {
 				interrupts = <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c22_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -875,6 +947,10 @@ hsi2c_23: i2c@0 {
 				interrupts = <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c23_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -914,6 +990,10 @@ hsi2c_24: i2c@10000 {
 				interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c24_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -937,6 +1017,10 @@ hsi2c_25: i2c@0 {
 				interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c25_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -976,6 +1060,10 @@ hsi2c_26: i2c@10000 {
 				interrupts = <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c26_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -999,6 +1087,10 @@ hsi2c_27: i2c@0 {
 				interrupts = <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c27_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -1038,6 +1130,10 @@ hsi2c_28: i2c@10000 {
 				interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c28_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1061,6 +1157,10 @@ hsi2c_29: i2c@0 {
 				interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c29_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -1100,6 +1200,10 @@ hsi2c_30: i2c@10000 {
 				interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c30_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1123,6 +1227,10 @@ hsi2c_31: i2c@0 {
 				interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c31_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -1162,6 +1270,10 @@ hsi2c_32: i2c@10000 {
 				interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c32_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1180,6 +1292,10 @@ hsi2c_1: i2c@10990000 {
 			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&hsi2c1_bus>;
 			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1191,6 +1307,10 @@ hsi2c_2: i2c@109a0000 {
 			interrupts = <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&hsi2c2_bus>;
 			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1202,6 +1322,10 @@ hsi2c_3: i2c@109b0000 {
 			interrupts = <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&hsi2c3_bus>;
 			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1213,6 +1337,10 @@ hsi2c_4: i2c@109c0000 {
 			interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&hsi2c4_bus>;
 			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 

-- 
2.51.0


