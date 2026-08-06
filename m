Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C07C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9hkkjdmafJzS9eEzwPN0UqcbjM6LEHIzsWnMQ++U3M=; b=Hecj6dyjOysaPzmYdjFAt4aV9U
	HS3ObAKWfBBPR10W97y1duq95gQtbGVuvau1/qGK6qJdC/1+VVwacQXDsGqhxSliFt7iTs5x2jP2F
	R1aU8c6XiDtirbxSqxYqRdpBs82XRJrd2jWeW4zj/HbwaG8f01W1tNUKduiAfbrt+Z+kwpK8UzzZL
	AqLSo7tgl+uGpYqmjp1gE0EvPVth3cr1bv8o+SlrTTOuT3XtUkMg7P9xQGmCkj0MaJiCphBMV7HXu
	SHOCQHd8eSDssvG5HyIKeGYYx0AiMK/Frpls3k/4/dtvlw/el5Npe8rqcJMfAntbrcisDwE8pG2mi
	70eRhPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwWN-00000005fms-0jvT;
	Thu, 06 Aug 2026 11:44:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwWK-00000005fll-2Rj1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:44:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nclQ1580573
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 11:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y9hkkjdmafJzS9eEzwPN0UqcbjM6LEHIzsWnMQ++U3M=; b=eorccgjtt4PszYW/
	OxFGWlkJsgqv6n9p+iXDjaJJGAEwSSZCON8IbV5exYyEgoB0+kRNftwYJtMySXbF
	0zEUR3qfa1btC/CoghHf/uz+kKv5UUqMVS5RW2QqjOiluP06R/IuiyE8hqN/YBaj
	bIP7tLnRwpcW3VvpG8WtH/xilClELnUjjvi+hAypJ85J+2sA5OpxDtV2ZCvibKjr
	F8ksiXEyuhAoCUbNKW44AlU1MJMvBH3BwOF4WMHGK5HEFIpR317lzFYaynBnpa1y
	xjfbVdDJiKTKUaosST2lexz+YiGdt/s7eNnEXHzqLxca5j2j9WkVwsChEgRTDWbO
	Pz+XAQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvmrjheyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 11:44:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84885a4fcabso2458895b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 04:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786016659; x=1786621459; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9hkkjdmafJzS9eEzwPN0UqcbjM6LEHIzsWnMQ++U3M=;
        b=dpBiwvU2hft2w0FObp815t5M0peD6iReOhHR5bV4sQVjn0M+jDqe/pP2uZVWNl+c8j
         66FZbP0HcYl07ADl1dXbYXzk5oeQUatXnurcWdjFTzua224oB0b0dFLMtfFjEhUZExS+
         DKRIR0WF96GkGPu+n7rZNYU3oxcRkIZQ0nx7EEPkhyIMJ0qMF6vpq+aspp1nq9/WgGaD
         vJZoLL29pK/FLveAICClMfY2KOfKeoD7+SUnWAJPFe+F/xOMtA+aT+hXV8dFk8N+En0m
         SbD8m4Dx+gnodbJY5an2xQbJCYbNHj2wszlHAHUkuDAcVXV2hFeDjqdaM2en+Y2L2CJf
         dw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016659; x=1786621459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9hkkjdmafJzS9eEzwPN0UqcbjM6LEHIzsWnMQ++U3M=;
        b=dygKoddRVo8xtLZbl4F60S6IcSNiCDls6L4+ZPIFvYGhhZkdFCeifisieivPofHV1s
         1wvBXoVxuJ/g/eDOgodHKANwF0Ev4SsBRB5TxNHIZMh8MmOWJ2cP2FlHDavgbeVqpQGh
         +DGcnjGgrgM5NpjqngIHU0kP9fqbeaJkfeJgAbaWkQejSlc8g7sU1+Xa0nY7wPyki8no
         p4wXCkkRa93ZBwJOtpEyXcl+bbqlRJGmbn3qxqcUPUblz9OfSGer/XRqexcTN1f9yPb4
         ySMz5gt8GYMNUog6TJP2HZQaax824mXzD5N94KZLpYWq1WmCfSREzrFEU8z9ybKScG6b
         sJeA==
X-Forwarded-Encrypted: i=1; AHgh+RrTGHiBtLcc5AGSEpB5HwcHd8zm2skl3XXLVex8utZIwNykSm0NOXC5YJYaMp5R6O/nO7Fd1PPKVvdIYkgJnlXk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5FasPu+szhQHJqS9PUParPhCoaouTCd7gUNA3zcZFipadKPED
	cK7P53vcyIMaD+t4bflitlb1UDWM/OQx9Ygtt6GUx6gFuXTpmkO1+/S2zUIgn9BZ6pzIA2RjE1G
	c+DPgdfFqOlJX87Be7lyX+1GYMffk4pSJg8gz/U60BRQ6qL+ZQ1b6qhYF0LMCSOzShKrMzI7uVt
	Nj+g==
X-Gm-Gg: AR+sD101ozZ2ZMZskKsldQEvfSEpjgPzGMjKTwZ1icdkjRPCJf7zU6b0GQYSc4d8Tlg
	f25gE3NcnSb0W0l62A0of7SRfty7pSGZsGzQJCBLlRi5sQqtMpw5FuWX7YaBfVyVVPR0Md3zogz
	OEWKunbYVZ97y87JTg3YgVN/GSjlybvzTZJOSl4UQuHEiC8t2wRKyC6qtuLb4OqDq6bSB/NUtuK
	ctR82CcltvSDtcfi2zdcc7gixcDx8d/6JbAl7Edov5Weh8lAlj/qrRNN7pFKEfK8gW9QaddClEc
	NTFsAufkPTgF+ZdhJNDcmh2ceLBJGQhMAMZaOg9FdKTptV1+apNToSarHnec3ozdPg368J/EYbn
	o2LGEM1rb9XsKoFcanK8lP0QKpp0nQVU=
X-Received: by 2002:a05:6a00:2d9a:b0:848:70dd:f5a9 with SMTP id d2e1a72fcca58-84f4fee2fd9mr848439b3a.38.1786016658566;
        Thu, 06 Aug 2026 04:44:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9a:b0:848:70dd:f5a9 with SMTP id d2e1a72fcca58-84f4fee2fd9mr848375b3a.38.1786016658134;
        Thu, 06 Aug 2026 04:44:18 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b75dcsm1234756b3a.34.2026.08.06.04.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:44:17 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 17:13:30 +0530
Subject: [PATCH v7 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-shikra-camss-review-v7-5-c7360fd6a5ac@oss.qualcomm.com>
References: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
In-Reply-To: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786016613; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=lTjpGa9aw9j7oo/7K2Uo54+/x9/nRwS5LnIyxeuI31I=;
 b=M4WZ5wbtQEHHIBZRtFCPejEyXMqucWUSJqw8OGFzbZFuJ1wAOVw4NW2PLkZDh0Q+S0XDKXuwH
 8YUrXBLKavFDW2oGQN+ahKIUWwUU4mEfa77Y5RNoHXBkqHyud4LxdGb
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=VNPtWdPX c=1 sm=1 tr=0 ts=6a747393 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: m4TyKCNtZECGCk7iKx2fk48Tbxc4VS_n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX6Rkc0LgOlBX9
 oEH4q8ryR4ejTrA/b3Iq6stNAWIS7LByKQrGrykpbr5wRNK8dHkpQ9nSKoRf7ALHwpXX62qf2d/
 qVOkxrubVDvpmUQ8m+QU+uvrPDn/ZE4=
X-Proofpoint-GUID: m4TyKCNtZECGCk7iKx2fk48Tbxc4VS_n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX5nxJ5RLqQd3i
 7ME0CBjlOx7gJXwUuTCCrjY6zDgaA2zmH8zj1QzFwRdnBGlzuOWH43ZSn+AValAh3IYiNckngXv
 bvM7oqwMNXas36XKJx1oUDH5pWjflzXbaoJftqBRvuS4XI3HuDHDSn8YXO09pJIMnsG5gsiB54O
 VxueZbOpGLNXx/Ce5xpAWfgICYJQLHh+5LC7dWhtmTE254rgsEdUW13hNR7fXN3vY5cnpd+rpOy
 RE9tnya7cun/Tb0FOkJn/XABqPzvlubIVO07EIRsJq+kcmpkeZ3nSHmYhbjfMqrhO/kBhZO8eEQ
 xyL0CPvkwHmbrAKtCt3qKumtbcREh1dmbRJFQjrX0iS+4kSJN9Om0fkTfSuDCdS9BHBcIsolLP9
 YEIDsbP6i3oQ1SWp1o1PFcHK4V7xMbhDls9dD2k8qUToSbv/uAcX8XU2aYRwhhwxyzWIje0btEX
 QO6BW1Vk5Pbz7L4BsLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_044420_921131_151A65B6 
X-CRM114-Status: GOOD (  17.40  )
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


