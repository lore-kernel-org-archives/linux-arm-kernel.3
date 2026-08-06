Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA44C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XBnMsGWKjNGQOFIdwFdqcIu0m+wHOCKXu4Zohj4qGU=; b=iQbx9xLMYcmRhAj2z+n5cW6v7A
	Rg9u02TC9a+6+AVtdKzny/aos7S7dpCK6BCektosSFtsZQK2fqThma03pYT1ieZYo7wIZD6mceCCk
	VJea2AXCCSFzvAaeAn23M2K8acQ0dcLcL1W37sWU+1rBucvV+19qzZucghTzNS/LBnKA8IqqeM6uu
	pLJUc6fJ8QP/A2AvT8XOppAcMN4mt4Khq+U4vd07P1ofxqZo4Bx33bMQg77cWx2Gde6yNBBaQsret
	OFHYEYOS73zeeJG4povNOwUZH/LXZPnxkwPMLWSD1CoZU56Uu2Fqj72EORbnb5Ys5rE5wjsPP4m5m
	TWbQyxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwVz-00000005ffd-33FL;
	Thu, 06 Aug 2026 11:43:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwVx-00000005ffB-1mb4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:43:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ne1I1277819
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 11:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1XBnMsGWKjNGQOFIdwFdqcIu0m+wHOCKXu4Zohj4qGU=; b=EYhwgQa3fefpSj30
	QJkcSd8c8fPjPfHp58opoMiN1ydp+V/Bcu/bZOFcsbv8kLRzXZzVAmJj1uD8mv/4
	e8TeWtAaQP71Xpo0ssqmAmAnW3sAMrrMS0mZrXDK11+tlulPOpb6lSHdMRWHXoLF
	FwEmO8JoY5kq0bMLedoCfkeO+wl4S7dmB2EyctJKicfyqCI78mke+FZyf/4BL2ra
	2HOv6O2XWmm6JoP3zh81TWaCEC1XEkmZxfVfXf0zI5MC12Om4zwS80QSgqPwbUD8
	TtXowvkEUDCKEZe9x927nnBMdZXU05L60fLE3JO0TIruXudMLaDTsVju/vfoKO+5
	FwSIIA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuehx26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 11:43:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8488ac68185so5198170b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 04:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786016636; x=1786621436; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XBnMsGWKjNGQOFIdwFdqcIu0m+wHOCKXu4Zohj4qGU=;
        b=ZThD0LauPNS0dvUYrlfcZ2dX8uLGTSoAhGwhDUv06X+zeLsW3R5LT4g104XekJQ8Wm
         3466TOH/1sUDlS/OB62dGgjN3qgkmf0NX6Pja/Qtxur5V6qkUmke8hiMrsdE8/GWgdjE
         PQvWbWKhlJNettTkDcVx+xlyTN0eyWQIBiXximN81HcyBgEeBK7F7WO+6alv+PROt25O
         rCac+FLtzW27W9X0XKV2nQ5J3TpAcsts1x9OVEUPTJGjdlN098797bFa5v6bQoK6FjQC
         RMsC8gUUBQA5fm+iB8ZwIGedNxXI0kCzFXvGYZKPdz/9+2y966pQOR41aQAY3OH+dRc8
         8lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016636; x=1786621436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1XBnMsGWKjNGQOFIdwFdqcIu0m+wHOCKXu4Zohj4qGU=;
        b=MfwIH7n06v6w9ikmArdWqg7TJn/6N8slx1l/CXdkLkY7IJWwAq59DWhB3PHK/0YS7a
         E/tIav5u474fVDWKEtWfz3yGhIvAVEX/2kneiTVWcagBV88EzlPcwAc/TVKzGnkCJno9
         ROdH93KVCrexwrOddW3vaN4MukOkvYQnIq1RccBxVC4B1nIauvshvmY+jYpEBgsTv9qk
         DSBbaVLMoS+Hyvwcrqvx4pr7Y3R5oMK9tE8ZXZz0j8yZSSp1OTcmMjfmy314SRHyvrTA
         tO7dGbKhdRX3mYgwfxGRSmD50yNVb4YRAc9U2yhqcU/3xnuG4ZzC571V9SKCrsOIvhqO
         XGvg==
X-Forwarded-Encrypted: i=1; AHgh+RqXK/nT/JnkF7EHiVFTuNWwVuW5KYtvAqxuDXjf1WjireJ8NZ1Zg1yuLqBkW4/XYbxgezB+6Za1da0xEeVddJB5@lists.infradead.org
X-Gm-Message-State: AOJu0YxAHmBPVjGByo41FQF9iZKrdu6VpDS5VwxqsG092uVA1sxupp+H
	ZJCAoeS9VzN/ImhuNNc7ZCfZBm4o+NTNpO5lqldX5Iyy/ru45kXnBo6ae4G3eYo9s+ENEKyfwmz
	tzKbfi2J10Io79+wdNsu4lybi7PPuoZJo+ysGxFhHcgQS6uz/biz2OxejnFXu7EsEVKzHkfDKTX
	AJFw==
X-Gm-Gg: AR+sD10DTOBeMkyhuAaImut6YY2+ThM1epT+wyubdOvWoXxErWFKUk+fjDE6r33tB4J
	60mBEc3wcR/+B3kWWyMfKK01JoYsMHAD0zGZIazyHlDRiuEn38sByzRjyP9V6Cim/ZpirA2NE6h
	yRHIASTARHEoS8DH6hHqThq3JZoVv2L3Mi0o99ucnvB+Y9eaQ6fM5aJ+1tNUdL21PquIguM8flx
	kZU1HB2lHY+QrdBR7AV0zuyub9Q3Cp5+Wp2yf50a8SNX8r5j5sTDJrqgTzxc+iyChH/4YokjMxf
	Ec4fztFQW1+gU3OagBo2CC9AIbvksJhhoeY+tvZD5uBq16zJcocDyNgiJaBj1UvTJHmyaCGv5q/
	s3+qyWPgcsN6HqNuoXO+DHiPAR1BJtAg=
X-Received: by 2002:a05:6a00:3d54:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-84f2e014151mr15403717b3a.3.1786016636254;
        Thu, 06 Aug 2026 04:43:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d54:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-84f2e014151mr15403666b3a.3.1786016635829;
        Thu, 06 Aug 2026 04:43:55 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b75dcsm1234756b3a.34.2026.08.06.04.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:43:55 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 17:13:27 +0530
Subject: [PATCH v7 2/5] arm64: dts: qcom: shikra: Add CCI definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-shikra-camss-review-v7-2-c7360fd6a5ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786016613; l=2744;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=t1GOytGlrjx46BpmKSPUCNe+9RXHzC4jFU/9ZCxL4vA=;
 b=e8CnOHS8QWYKfDGWYu/qcr4Wz+fMXb2gqJFFkrVdOi69ttdNf9MJhz2poqVYwooeMrsnRHH25
 rAI74hXEW4aBEtX+Q7ad0s5uv7WzLklzwRuftad3bNpYSLlF1920qbL
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a74737c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZbC1Des45MQyGPwI-hwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: K8Aau0p1QqKWD2Gw3atw4WBVTXrp7KmI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX58XCpqMhGkQc
 m1AtcJ6ZjqZGFFCxjiymInqWx8eexYri7vbuRqKSEjDDWTVCDTvdu2Cq28tY6PCJngTj7hh3w69
 17N/fds4rHINcnstvS8fQpmw4yf4h6KjrwT1PGz0UX3sqQyVtd/INnECdViBqSs8pnwLHUOz6SO
 Gb/KmXXX4XyVvJqmFBoTTkxuorYB37TjWkJtcIizM653/OjP77UYTm+jiW0PunVqXA8G6A3zswa
 +WPSjIyW4pq4h84RyuRJufi22t8N0bU5aRyLLVfxCn6D2XKlwiCq/8hsXW7HSaJ1bt5zHJ/sZ0x
 WUMAMAGjcmtWLD97rN+Of9RqvmL12sNlnAsSzsr4FmObtuq8UQ8e+fnFb4QgUiSBQC9Dq3Mp+1e
 3p9OUkfUwlSOYjKSyhx7Swh7Hv/EMrbyGRMhOdAN54uRef/wknVRpzU/zHdBVNSX5434RsmXt0/
 9B3avjBGVqomqY7QCqQ==
X-Proofpoint-ORIG-GUID: K8Aau0p1QqKWD2Gw3atw4WBVTXrp7KmI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX3hHq43UE1RGq
 SBp6yRAg/PtsyhWDdpZT2YhYNOoDIEZsDUdP/NH/JVv6NfEbSS7oXMmLXaz2t5JVAXkRhDZYrQG
 xPo3xG/vjRdJvvBn5s7xlQX85/eDAJM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_044357_495313_8839C501 
X-CRM114-Status: GOOD (  12.70  )
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

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 44e1a333e97f1c88a672c77579fbe987d4285693..ce5887b9b1d4a186fe967779b9615ab4e4727ff8 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -795,6 +795,38 @@ qup_uart9_default: qup-uart9-default-state {
 				bias-disable;
 			};
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -1928,6 +1960,43 @@ port@1 {
 			};
 		};
 
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1


