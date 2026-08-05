Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEEAC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 13:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9hkkjdmafJzS9eEzwPN0UqcbjM6LEHIzsWnMQ++U3M=; b=jv7nTa7extnKB+GFSF4O6n0Qv5
	W/nI7+29WfGxEP2FVpsCdQsJQEPUFTIXooK3K92VDHRYHwVHNXqErzhOeJpCNM64lKqxnqJKAPDCU
	Bwt6mL4RWSCkT4M99qbUSvXh4QZPAUL5NZuFskAHfpQIXeCX+F0fNeEd/zK43NuaHYApKmFM15i6N
	V7SOpRWNeu9jHBnF4brw6WiyA2LnCBDsR0zARwPVi42o87Oz4y0IIVLlLlxPfDdPzu1KhDezqgtd1
	APC2Aydq605NR00TRM6UHsXw/kB7nKPIgzxSqfgBl1O1Xc3n513fpRIAZlGRH7kOFaN3JoLult/DN
	+qLVKLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrc44-000000041l2-3D06;
	Wed, 05 Aug 2026 13:53:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrc42-000000041jD-2QMk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 13:53:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvGtR2865663
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Aug 2026 13:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y9hkkjdmafJzS9eEzwPN0UqcbjM6LEHIzsWnMQ++U3M=; b=L9HS3tiWCzeqPSks
	zEc4JN4XqjssiJfGc15ExH8KDLT0NXO+7bDMGr40ct01adEZGRdvuRQGEnPZzYpW
	S2/zah0JTzMM66LIrT9h0fyTqlFi3F6M0xf9URI+1WbmUQWkhB/lrZ8QXmkQJDLf
	m47k3JP9LeJRUgj4aX5B8ItRBSgazv8zVCFrMlS2yP6QTrHmIQMpQT0x5s65R/bI
	fblrag2FPpw8xleeWPimpKvVZZ8Hn7CLTLQoPBt2zgzVNW9y3q9zQy1xub5IfSo8
	0u8VlEQhzsSPy6JQmkqj/4VVDNckmMR43OjsNeGOJS0mHCtDO2qNYA2Sr5iYpZoK
	UdF3Bg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2r6104q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 13:53:45 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81eddfe28b4so27085757b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785938025; x=1786542825; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9hkkjdmafJzS9eEzwPN0UqcbjM6LEHIzsWnMQ++U3M=;
        b=GDd8oHZESxuo6mfyu2E0E/sqNEQNxckTRMvpbGbKEzuRRfHzTEM+a4gGB2dkLA/fzS
         qmpjaJ+D0Ta8WhdxueDx3cLRLODeFWvWgTmKj/YR5dlt9KQ0HSUhbFBuI/Bja6nW+ukK
         X12tk0CKjMaBlQdtkA8+G8tQ1PqTuzvZUG10ThqYZ+myZ5Cs0XFJYTlKCkiS9v0rZoEq
         QJ0bDu1RwMBPQHc8iR5ZQPX2SBNA/p/b/7Ny3Iml0yJZurSXNQxWao9YAycxm+lGvE3t
         NCD3Gv/UT9B/Qh1GeyRZ8MQ+MY9rA/ZUpfmAGWP0IxiXk1pqMTUEZE5p0t73Z+ijV0id
         tixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938025; x=1786542825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9hkkjdmafJzS9eEzwPN0UqcbjM6LEHIzsWnMQ++U3M=;
        b=dJl6w5X9hv7ZByLglNiSfD82zZQZoH7qNa9xbXOePaHT9iNnL3thnczVIDR4ZY0bqa
         LYl1XFGXK1EHpzVBF60LBsmrAkYrWtAOO48z9zZT97pgY/72z75o0dkGRRGA65Aw9RBV
         8sYbIfuSQIqDLiAMk73hmFndo8D+OUIJWlrEO58yNnKnFCwphBgpeYsX1Xgw8JJOVu/V
         NZTWrtpvbgn6v5UMgC2I9ocbP6XEc02w0c6vT3mHrGyBzAIqVbN2bmtXBIGFKHj8euXI
         iG/YLVxLai/dc+hQygfWoSgbR0WxeVYGQEJS7HrbnbwXmkyFDChQNgbckUAEuVnf07eM
         wHCw==
X-Forwarded-Encrypted: i=1; AHgh+RqKBoJSxXAliqEtFiMV/RGSIJaJnhi0i/sMQcJczjQ76g8KW/d3c7C23M5gMtu8SVmFP+i7Yd6no8AXrs/0GSvF@lists.infradead.org
X-Gm-Message-State: AOJu0YzyippHD5dNV3hkIWwPFpXW6F6LkSRp0yFSjMQiIZSq64ZauXhu
	2nXYfEXBjkxQqfgS/46z1vB6hbbwqgE6GynsfyyaSh+9isV6qZyNuHCQRCIuQD1oorGMMhHPrJq
	8vU58x0SM4zEVWgIpyNy9c3ibqAiHJGbxmOOGdVnS9b3EFDfAXr/poGujyL4Mk8nGnUQbZYlGI/
	/MCQ==
X-Gm-Gg: AR+sD12k255Ko4PxnmT1buseGpym39VGRQjO4++1M0f2pJzzbDwEPo4O1HIhqiqCVQ9
	7A1vOti+pUH1PVTIJFORt6XgAduSxzRlR3phsCtbYBAAOHmO7wqDfX16tChtXeh9mHq3MQefWO6
	hZ/abOgpbGKO+Fov9+HZHZKir+FlPBMJ27ifgsGJQB3r1qO9JUB74pI2aY8bixubtqsjlp+Lb1j
	dJ0Zr9tZVEt67W49kSsp5R5IPSOArb30pQIhS5HydyCFvys52mNTnjWxt0Chh0N5abdflTHk1+3
	Cg+1Fsg0pc4o3UwasfKWvoaSC1Ir/DrnZ/X7x7I93ptwct9Ney9NmbunkqZqemdfsubEgwzXAhP
	i4fzoivF2lH0lhjV2h5ttlZd1dCPnMb8=
X-Received: by 2002:a05:690c:6f12:b0:81d:3018:6eca with SMTP id 00721157ae682-8201c491d4cmr43939797b3.12.1785938024866;
        Wed, 05 Aug 2026 06:53:44 -0700 (PDT)
X-Received: by 2002:a05:690c:6f12:b0:81d:3018:6eca with SMTP id 00721157ae682-8201c491d4cmr43939387b3.12.1785938024330;
        Wed, 05 Aug 2026 06:53:44 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201320ec71sm20892517b3.12.2026.08.05.06.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:53:44 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 19:22:50 +0530
Subject: [PATCH RESEND v6 5/5] arm64: dts: qcom:
 shikra-iqs-evk-imx577-camera: Add DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-shikra-camss-review-v6-5-a8dbc66f0d87@oss.qualcomm.com>
References: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
In-Reply-To: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785937970; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=lTjpGa9aw9j7oo/7K2Uo54+/x9/nRwS5LnIyxeuI31I=;
 b=DVdk7tPHrxiR9a0X3yL4sAFZRnMhvSJDw5eUqZ1EMTNhSORE2OvZxD59JcHMpgqYI+XLBUYIC
 zlWbfOPbH9UBXiR06J5SL9aLD7spPeInAFOoGCQ7KTQmOCaKaq9QvD1
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=WrIb99fv c=1 sm=1 tr=0 ts=6a734069 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tWPU1kIw_zK8z7i1XM_w2FPrdP_IRRPC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX1wDbgW0YIHKL
 K+jdZ9IksLIVjxSJiA5EyHes+0QWJxUPyWkB3jKu0jjx+flXw7Ifq3DhL/BSO436qpg84R5T8Wg
 i3jeKftsAl3hVVBy0IQ6cO+ZluVDLhc=
X-Proofpoint-ORIG-GUID: tWPU1kIw_zK8z7i1XM_w2FPrdP_IRRPC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX0UYcfOn/mn9M
 2/G6CXNcZsC9UlYblt4j0wOt6t6XBOsJPUztwGRMhqcLSmzzorcA7e96CwW6KQIzLO+nkTE19bM
 y6r3IwSWXWOhZyq6+6Dv9vZeBo6R0r7DJWDgJaOWSdxl3Wkp6PZjpIt/YhufeyHJg35svdAVUB2
 jE7Y7aE6W1bh4qCJgZLlOEga4MtWLaVv0pNkvI01cmwAcZSL6rRdBjT6N+BatGZ7tE2Vww5NBaC
 jGjXmsMtVLMieHxPfH2uppnER5b0MpQBsrw4BjCeRER58A1jWWaglwX7Djn4gWGgju8M6WOBZyE
 9gehj8XQ/2GDDav2js0pbd/Tl6qaPwag3FRXfaNhrj/e1ezvvgklvGQ3yYBKK1ebarToJwfsT42
 8F82KsmlY/7K1C6dne+tXr4eFOaEQ1o2rMmSdVXbWx+W7gxJnNtlq5iua236mdnORVnEazekU4q
 RrG6E874+skNKZAxoLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_065346_735689_54507E47 
X-CRM114-Status: GOOD (  18.36  )
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

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 79 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 03ed24afad5795b49848a2548c0facdc9f3e7115..5884ff14ad4552249b029d4aad569ccde5768647 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -342,9 +342,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..d8c968a918c67cdebc0e7c6fc14ef820c97ecb75
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm8150_l11>;
+	vdd-csiphy-1p8-supply = <&pm8150_l12>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		/*
+		 * avdd and dvdd are supplied by on-board regulators on the
+		 * IMX577 module from the connector's 3.3 V rail; they are
+		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
+		 * level-shifter that translates CCI I2C and reset lines
+		 * between the SoC and the connector.
+		 */
+		dovdd-supply = <&pm8150_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1


