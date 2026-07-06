Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74939C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3+K/vFavTTgVURrz24yh3mhOKcc5piZfDi1R4x7Glus=; b=LABlReVk5ZvC+V4hn+eawz+Y/S
	2QQf6dYd898R+ON295Qp4aU5QR5JJYnrmgvm5Lv26SB4AaFyJRiYwUuCyrYAr8YfJEV813yGw9G5s
	ez0LI6zcclbMEQcVeYiP1e+esJHj1igk/DbZmdI7cwknXVjuW1uQF/HCcTuP8SYslr4VwCTQT/XEu
	SxgIHPu3TvD5d5SjtHYmgGYZOaSKfl4zAXa2TG1Vyki47gAHKHyIvFwKG75NQO8BWEVUg182OyAYj
	LwldleSvkR1Mi6WwDeroGu4eK/EHKoRC44hvFthrGDD94BNKc4bq4YDIswMkczaBNmYMQubtPWHSj
	TPdRAqig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjw-0000000C48Y-0Jq4;
	Mon, 06 Jul 2026 09:35:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjP-0000000C3SL-02Mj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666943ct4151687
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 09:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3+K/vFavTTgVURrz24yh3mhOKcc5piZfDi1
	R4x7Glus=; b=E3zin6vjI/qF1wrEgjKYtk5Xcpdl9QR3qkGdXi/m75QgOHaK8WL
	uyRytPtZM8tW3ee/GRXbFFgEsliFNODctKVxWaYIrOKOMjYKo1Vc/c7LRSJ33y3C
	+RcsplFJluO4DQWeVtJEDCmwUWJo+nZlDrvTGGO/zbqeDuEZNkvzlVVIFWmSueoN
	VBLfnnQyvesTmronBkFm39yBrmzRWVB5Dgt1m0D9vrb2Qa8gOcWEmexD8YDGFPIZ
	HTVf/aCzechXGOTlixQ8KwFT552d4E8UxUcjstBTtiDheKBC425EUhRhekBFSzaa
	ewpquNfpHR4PT75T2o2a5OGUUoOUkKzoIkA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs8cd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:35:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so31998696d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330513; x=1783935313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3+K/vFavTTgVURrz24yh3mhOKcc5piZfDi1R4x7Glus=;
        b=anx7rQgk7WS4Jhp7bzqkab9csMf+5VgLcsHt6QaEig2HJHLpNJh4wZhTsA21q9SHza
         GGHQ/gWFgB5/VqSAAGoU/iOLSwvY0gVHF36VHyQsYNP160SJzwNhJGrSZFvf1byc+f4j
         LcAWa+ojD+mIwmgZm5xuX9Z1snl/UjHx//SvLRjx/1FgNIVdTSM/V8IsPXBJTYZ51+yT
         LsbL6MG00zSqO3FabUVwZB6gNMhvRYLqw86rXEXV9yepHNTV27Uny1NhF5FEK/QSsKCl
         H2aU/n2uiC5cIeevJCH5FhbzZAaGsodV4Da0rUbnTKyYPVkVR4eEJWiTi6Kd6B+m7H4V
         xqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330513; x=1783935313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+K/vFavTTgVURrz24yh3mhOKcc5piZfDi1R4x7Glus=;
        b=r6xNX6PRrVsbt2sGpFasmCVtj06uA9NdYiUNdIJapYpoZ0RqqcEgLwXbXQhXUyyT9Z
         CrYAxHBOnJ2GRCEqEyJ30i2KTcmxzK/lPwFpjASyUWFkF4DPB7KT5p/txfTF7I2n3u4B
         VfFo//dQbGwrqVb8nCCm0GBcpHhxSq25OOIameUBDzP3UV1Xh5fPfPIPAsMbeedkj+PA
         +Ga+7kroUUmd3sVDSW5HKNmffkrTtXGigBRYdPw2Uz7/4d/7V7jadcK2nj/Q0xcMC4MI
         BoZDWfr96Q1JnCtNuLghrncUOQUNhljEIKMpefYRLD5OOAOFLPW4SI/J04/v9TJ2wKjd
         nxFg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0dUu17YBgK+QffpKb3yXd9K9J+RB2FcI7bsc2HweSv3aSXLfgYsEmgdA1lXkqQBL/cv1mfWLY6CRGdyfYmheZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzrM8DeVDqJWoKM4of44pAESPeo1x46zYV7tAIDpQh06ITGOYpK
	GdEV0do8iL37kyHuBV+6+LiNApTq9JZhMZsFnWOh6dtZqSngI8UMttEzjCATujzN80uDoEbGpFw
	tofORUMoE4CTcshdBSI84xgF3AMh0LjtHdjGVIP1L6gKITQEaQlce+R8rLp4SPP6jhJmuUZtgsq
	z15Q==
X-Gm-Gg: AfdE7cnfuhK/NMJofBkCkezgUznTV22XCOc0IKgfQIfv2mDD2YelkZzGOn0WkfhNWBi
	95DwPi5Di0oiHPtNzk6oqcudTGtJLeWqjoksCy7u2+cFK7WxdnIa+qrd6pO8HWZgnhTrfrCWzgH
	t/I8iJjfT7nZpZLzBLHodrQFK85KAAgRRwelUFhmzDsflPiuIm3RQOPgjorJjgxvNeJxrKrkQwc
	IcsMmbj2wuVf3GHcpGfj7AaVNVpUtPIXBwsyEA0bmC5EpATTYI+/wLxZylJQ8sig0jaMgmgofLH
	zQpgHST45O5DNINglWL+aYqGaALmXXcu88oUk8d75fpFkj0dmTowEaRwU6ewUPj0zR0sNRmA5pm
	E99jCzOem5lSMI+LpmdiRRIC7U/I=
X-Received: by 2002:a05:620a:170d:b0:914:7e9a:2716 with SMTP id af79cd13be357-92e9a4a39damr1416533885a.38.1783330513422;
        Mon, 06 Jul 2026 02:35:13 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:914:7e9a:2716 with SMTP id af79cd13be357-92e9a4a39damr1416529785a.38.1783330512961;
        Mon, 06 Jul 2026 02:35:12 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bc21sm643831465e9.7.2026.07.06.02.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: amlogic: Correct indentation and whitespace
Date: Mon,  6 Jul 2026 11:35:09 +0200
Message-ID: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2784; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=68yixvkGqxm+DcPwltEo2KU4Gf2PeCpLBOvJ/E4rAKc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3bMNz+1+uTeX1yXmY4k6X6lVztcBi4LMoWE9
 W+lhtRViBCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt2zAAKCRDBN2bmhouD
 14WnD/0bf8oMP6p237PTTdeoToQZaShE30T9JA47Q+inYKAop4cuLzZjG+hHf4YzX8ChmgFrTzt
 g55iuaDFA1s+FeOZyjDJsHol8bjBUek+Myxdn+bWHlmLszr+0JksGN0Bg1EXgrR0qhNQq2kejBP
 jHiKvDF62sUDrfHDrpBHPqWzutswYzIgOK0OngJWZFvegW2B/SuF3z4l22GBYLC/bkxC9jiDwII
 D8M6pbLzBiwB9Uh2AF0b7Qg1o/bJtyUMgOTgaE6FoxFnQcyDg5hX5PvJsb6yZ0OCr1S69ei1qYx
 bDeTAc9tuo/bavKbIXf+3XRiPIxGOy0LH3oBVmd0IWPbACb78ldVwykmwnbPyoqd1q9ieSbB27v
 wKGPOfJ6En0C1h9D8z/dXow6iywPUFr3+DheCAgMnzgo6a/V0tlTxm/nGto0tRXdvcGNtPoD7Ts
 YWGcql1wGMJWOT/HHV/ZyAZ7TqDiQoGyCK5dJvFdL965QvMyfhQAB+UrK+oMexTLvioECNW2Xd1
 DBfm+8lKGJA9Fh3sYik9J3PjWNDK26zTkLgK0Kbit00xyaoncoizTuuf7N0+bvy96Kl4BP9NWtM
 ToX1h+s7os++R+LdeCO0TtXVECEbMrjjdK5JXtncSnq0K/rrzrzJ7DVeDZxj3Z2mPRwsAR9l7Kj 5cIh31U+QdaEOiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: C6t_B4llNSwEjxybbw2g5fJO23NwgnYC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfXyTpoaNL4uZuj
 iv0FFrFzaxc2lsqTbSLzjf/ZQwcze26sprfT0NXJN6aXLf0eBSFbbCnrhtImtazJzIKH+R1S/dO
 RoDVYfqMov1/CLYJlKRuUSCAEz9oqbU80WhjvquI1VA/+IyUBS8xK9SrBP5cODImR8mPTK6Ju+m
 zzLli7+uzGOAX3ctC+YCs4XrRXuSId+l5G/P5sAmb/CvesMit/1TjNuSOmokgsjAvpmD3HE1Di/
 IbZyIe1XNw/0J+lQQGOxzZJS0R5u7lm6y+fCKhIvU8VWWo7s7/3EhMAg7yv/GuRXkl+TZBPFAFB
 okkp/QAtOCVrV6U/yGMpUs0VNoG1aGkaF67NAgpY+f0xqlX3RtA1b/YJITLpnxtVr0uaBzGciC3
 2aHUAH6qIruf4rcSyL8lo5hswPfOjmwvlqmbLwGOSBe2uR/DFOtCnWOK+v+BvNuI0l5ZdO5BxOk
 kAGnNxXA0f2JMX1eyEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX4wSMj+mgntbM
 NzW7kCQQnoFttGIDFpAMG0Oncgk0T8d8m4Y+uvZIVy8UHwYiFSEMAsAE21FAT5LNVk5GEpW3Rdg
 MyI2QgjlaSfNJ4v79kVMXylrKrA1tmk=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b76d2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VfHiFvvmM37wtYbmGesA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: C6t_B4llNSwEjxybbw2g5fJO23NwgnYC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023515_384181_781271C9 
X-CRM114-Status: GOOD (  14.13  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines and
remove other whitespace violations.  No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/amlogic/meson-g12b-a311d.dtsi    | 32 +++++++++----------
 .../dts/amlogic/meson-gxl-s905d-sml5442tw.dts |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  2 +-
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
index f15baa708b36..8254e51d5e27 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
@@ -88,25 +88,25 @@ opp-1800000000 {
 			opp-microvolt = <831000>;
 		};
 
-                opp-1908000000 {
-                        opp-hz = /bits/ 64 <1908000000>;
-                        opp-microvolt = <861000>;
-                };
+		opp-1908000000 {
+			opp-hz = /bits/ 64 <1908000000>;
+			opp-microvolt = <861000>;
+		};
 
-                opp-2016000000 {
-                        opp-hz = /bits/ 64 <2016000000>;
-                        opp-microvolt = <911000>;
-                };
+		opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			opp-microvolt = <911000>;
+		};
 
-                opp-2108000000 {
-                        opp-hz = /bits/ 64 <2108000000>;
-                        opp-microvolt = <951000>;
-                };
+		opp-2108000000 {
+			opp-hz = /bits/ 64 <2108000000>;
+			opp-microvolt = <951000>;
+		};
 
-                opp-2208000000 {
-                        opp-hz = /bits/ 64 <2208000000>;
-                        opp-microvolt = <1011000>;
-                };
+		opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			opp-microvolt = <1011000>;
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
index c490dbbf063b..5913e59ff294 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
@@ -64,7 +64,7 @@ &internal_phy {
 };
 
 &ir {
-        linux,rc-map-name = "rc-khamsin";
+	linux,rc-map-name = "rc-khamsin";
 };
 
 /* This is connected to the Bluetooth module: */
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index e202d84f0672..d5e0f72892f8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -642,7 +642,7 @@ mux {
 				function = "eth_led";
 			};
 		};
-		
+
 		pwm_a_pins: pwm_a {
 			mux {
 				groups = "pwm_a";
-- 
2.53.0


