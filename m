Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26ADC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvMir0HSM/4SkaDumxYF7tViaxXS6r3B0JB6L76Vg2I=; b=QWbZhY2AeXFVVB+RC2U3dv0NvY
	mK4tPcq8tmDI9UzYN/VemiN/pXHx9yAvImm20x3jtHnUYCGIWhUptlcUJ2d5cYQKsw+21GQFae/p3
	48UmJDRZrZIGw6CpIWVpVguD+JUolxRR8uJy2TjQdcJsU6Ji8Yhwi/oGEaMtta+ymH47fEwpLjeMv
	MNSwxrp4xk7Iwj7pCr1HXQs/knoS+vFd8Vfa+YHJE4fUHr3z0hJnSBsum9sGpgOOvjp+NfXZX5Vm2
	0u7KdTQOisluE3eEZkj4LCCTn3kUme74JF0tSQw68S86awcjdZvKcK1+5qyVi/qWz37Er2tcuPny1
	cmuIispQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yM9-0000000GM4F-0Rqg;
	Fri, 11 Sep 2026 10:19:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yM6-0000000GM39-3HCu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:19:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kfHA3686805
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NvMir0HSM/4SkaDumxYF7tViaxXS6r3B0JB6L76Vg2I=; b=UevedRYTR3m51NBp
	NfZJ9/4aS/is5FV4kJvCGsIAnYFxteqX8Egzc2TJ1lu6anXBwCFtpIV1AQN5SpSk
	dtkJMAN69L7hyFdPZaSr8BTXiYSEkwXVYXt3qeHaGix9ZfgxcN5huXfpRUMeEzE3
	/FefuDbQWk6MTOXw0qZjmtu92A5klZJLBuZv3v4pVt7vxITDnkuQwKSntGqVaz6W
	f0ohWaK9EzJo0XQi+5gucVWmsxdnndlnuF/MQQ5Fg/rbaHIBae5C74T+Y1ZvIPPo
	t0dEemMLoOH5R8JaYH96pIvZZ7oHOAaAHEOIP4yo2FoMDGfW09glm6mx4wGJGKVa
	9ZY44Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg1aet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so127568685a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121977; x=1789726777; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvMir0HSM/4SkaDumxYF7tViaxXS6r3B0JB6L76Vg2I=;
        b=cWFhQA+aoqu4yUGgVBS6K96MGl/LkblMBTP6q1Nx3T0Evku7oGbCbwTWHIWOILkyep
         u9rwanQKH/gQjAugltzar5oAYBFWjnTNxZHKv/WyJEYBCHq48VyqFbJS8TparF8FTZhq
         ll5Tzl0opl8ebKWCeEDrwdwN1EXo/w+bVVngzUfiJA4xJLwi/6TNfvdj8yyaVeLpbckd
         JBljQAAHRLBXybvlXh/4qi/g/uJJN/3VAl3DNuUFYJ4yHuogbIMwfXalN+DByFb5eTTu
         dXRXuJkhInkMjEKWx1Ys7VNcwWYS0LKjKS5Yq7qMdfsYTqTmH/Kt8AzS2jsovn2snH+i
         tUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121977; x=1789726777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NvMir0HSM/4SkaDumxYF7tViaxXS6r3B0JB6L76Vg2I=;
        b=GdYUUb5CLWqm6ZSbnZaT2pvxiXx9Q3J8IYyEqE9kEfS8GbK6E1p6+s2ohTJdCSWNxd
         ajnLe3n6ogFFfgbJBBVjeggZdtiNZkHMHYAl/JbhVifvjN3HSOrYAz4Dht+c6x7ucKLr
         d8J5lTq3QOBdUcRb0Mjd63QBNAjyg6CRTGaxZozuco4VnYHnwS0ptx3dAao9NmqIP2/s
         tui8qW9nLx1JEqz1Y2N50SIfLdoWEmLrgnQ2aZ7fHEHAG2iweq7S5B3INiJhv719rSxk
         cDyDaHVtMx9shGba92LAnFHcbYvdobZIZQzAlQyJSyx/Bfwx3B3aewcJHCQnHIZbD+pR
         zpog==
X-Gm-Message-State: AFuF++m73975ZpPC4XRagKBomvdXfuF59ykPZI8HAazBYitS7T+U1gHx
	CYysQWMuc0E6gO1rt1GhqG06ZIKWZ/bOBsoIIRToHUM2wGg2qk/vk+wz30l5aVnb+GVJV6PLJPX
	9QitvYDE0pv2GMOEm2L1wjZhisr8g24IpcfF0nfll0aoY2huL+5GZmI1bm+kRWtAcoC8KKFz8IN
	dTnbpoBlfjhA==
X-Gm-Gg: AYBFou0yqrJqQzonfxnlsFMZq5VpzE1YMnxIPI5fPBU72avABGUpbombnAY5UAGrW2E
	hTbt+Wv9UgUaSUjeg9ucdO00tycR8a1rqjcIli9ZoHUSq3gZFGGX/T3jOd9Q0ib7aGZdukaqwT9
	fkD2VwnN/QEJAywuOTVp/+q0ASomCY6D8xPOhUnJ6RPyDfq7Cu7oYFPQ2z9a8V5DDWDsUKl6Cwc
	4hzhFc4pbO+senwjTVNobVv36Sb1DAwDzhThObt2FjtBm+AKk5Uis4u1NBr1obtY3rz4jYhLf8C
	QewI3aZR9dc3Wf/7rWUEQMbxPx1AjVVR5Jr1gu3A15+VtBFaSRYtECtLXILOdXqCphveVOIKjEZ
	0Cl0j5zHHJbGDYQW2huqezj8=
X-Received: by 2002:a05:620a:1a24:b0:939:40d1:2d6d with SMTP id af79cd13be357-939ea27718bmr402639285a.37.1789121977080;
        Fri, 11 Sep 2026 03:19:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:939:40d1:2d6d with SMTP id af79cd13be357-939ea27718bmr402636085a.37.1789121976660;
        Fri, 11 Sep 2026 03:19:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:10 +0200
Subject: [PATCH 02/10] arm64: dts: exynos: axis: Re-order properties to
 match coding style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-2-9aa55051c42b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2407;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SGOPpDLV0gqqGkCZ/XViYuJN/Hf5A/89ZjmszRVaOS8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WoW8AvN3mfb6v2sGGOz6k+bsyijF5GZzKPn
 DrtdDWiXYeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVqAAKCRDBN2bmhouD
 1/9gD/48S2bYyx3rvAW9sH9Km4rmU3/qOggmjCVor1qk2G7B2A7+pg0Lp9582LQ7IeWkfMgyECm
 XEnTfDHIM5cAswj2SKh8UiniNSH/2TJoOVWVJbFhXWOQZS+AyYIichZ6GjBsdHvWXVsTxVhrdWC
 2c3PRujmTskmUfu3APj9QPtwixFeJEFluZUNkYc3L4zpQtOrkmwa4LRotvTE7a7hbCKJiNeKZf8
 MlFWbj5lYC0r1ROTwHUp/Um6n36eTeZedhllOyslchrRAjxgrO0vqPmKtpQYXvsIH5gz9GIYtj1
 3b6RSwy2cMdAbRIB0sqBbat65J8rO/dtHbHSObXgWSb3rPAxkH1uQbUvnpi+PMBhk/+gKaNfQPA
 w4jJ4m7VNsHKO5ynmLwfVYQK0PrekiLjAHMD63ySSZq0f0G9A7vUMMaaE/rwT1p0bXo3u1wkaXv
 al6vIb3fT/Hc01N2bbZWk2W/IY7vdRstHbNl9AgyGoj4TA0PdBTVx2Li/ZLqmMxPAk7WPHsvIt3
 n4/2y06Mh+TCPMQhgNZbbmluKpG4oKTXMR3whDbwWpqg7nwIqcRbfXQWGFZG+UdVeLT4LV/ZXeC
 kB20Hc6og1AvmKrLQgVophZV/cKCeGkbXUT0IdMh8qmGiPWuuVH5wP2/6U/+mG7Suurdw9wF4r5
 BSbiFjALniUbK6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: MC3ukBRUKIN04C80xPSDnMSqLTLTqfqM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX+jNXs+OEGIwD
 /QOGICeIWpDzPrwVPgrP3tFEOUtnwwYmAJWjIRTIWXFP+d4gCKXh/5HEK+M1/D5L5+wD23eAgGv
 dlxuwuxXsLJ9nEvsqn+qrovHyZjv2pg=
X-Proofpoint-GUID: MC3ukBRUKIN04C80xPSDnMSqLTLTqfqM
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3d5b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VbjUSUq1SxbRpkAW0NMA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX8TnPXEHyJEag
 JFAsJqlP9a8eQFj7Pdng/71Uqb9DO0/fy3Ghu8yo9GH63c4nP3IShS8H+sbJcpNO4G52agHekEV
 pnySHBREgNrW9THxwZ07h0UZGlDjBaOQrGYEPsNGtuXXx1l0CjPJa8dBcOKVMCExtU4vA0Vpsw8
 bz8T/LIAWzBrT1baEX/hLEasT7ShakYYg+qjWHV+z0G7M1IyD4p2gU4+Z24nCZ/jxGhUY5ilNTH
 Nas6yc4BagGJa9BEfEDu1E8lK84YyoQvE4lOq2n56W/YQ0i1l7LUmSvO+qZDukWTqpvJOmyeABC
 qxfnRmsjZIbkqlsNAVxea1RQNlWyVpWWv7jWFnXtS5Lh5gY3fJLarMXREGRdaobUNsBC8fh+9ly
 ClLRCpon/srr/49lCoND+aQbC05JVHC2Ge+K0f9WmGYAiaPEE3/PqpUaDIoWreizHMWwvF5ASyY
 U/776bXLu/ggbW1Kywg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_031938_944768_06604919 
X-CRM114-Status: GOOD (  14.44  )
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

Re-order a few properties to match coding style, as pointed out by
dt-check-style, e.g.:

  artpec8.dtsi:69: [property-order] property 'local-timer-stop' out of canonical order (should sort before 'arm,psci-suspend-param')
  artpec8.dtsi:232: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi | 4 ++--
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
index 853b2fafc8d1..9cfaf4935dd4 100644
--- a/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
+++ b/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
@@ -81,11 +81,11 @@ idle-states {
 
 			cpu_sleep: cpu-sleep {
 				compatible = "arm,idle-state";
-				arm,psci-suspend-param = <0x0010000>;
 				local-timer-stop;
 				entry-latency-us = <300>;
 				exit-latency-us = <1200>;
 				min-residency-us = <2000>;
+				arm,psci-suspend-param = <0x0010000>;
 			};
 		};
 	};
@@ -229,8 +229,8 @@ serial_0: serial@16cc0000 {
 				 <&cmu_fsys CLK_GOUT_FSYS_UART0_SCLK_UART>;
 			clock-names = "uart", "clk_uart_baud0";
 			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&serial0_bus>;
+			pinctrl-names = "default";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
index 310cafa14f5c..a92af2ed13f9 100644
--- a/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
+++ b/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
@@ -98,11 +98,11 @@ idle-states {
 
 			cpu_sleep: cpu-sleep {
 				compatible = "arm,idle-state";
-				arm,psci-suspend-param = <0x0010000>;
 				local-timer-stop;
 				entry-latency-us = <300>;
 				exit-latency-us = <1200>;
 				min-residency-us = <2000>;
+				arm,psci-suspend-param = <0x0010000>;
 			};
 		};
 	};
@@ -261,8 +261,8 @@ serial_0: serial@14c70000 {
 				 <&cmu_fsys1 CLK_GOUT_FSYS1_UART0_SCLK_UART>;
 			clock-names = "uart", "clk_uart_baud0";
 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&serial0_bus>;
+			pinctrl-names = "default";
 			samsung,uart-fifosize = <64>;
 		};
 	};

-- 
2.53.0


