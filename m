Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34131CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=; b=SRy25Gb6+zEAZi+ipWZ/LZiJAS
	cd2r3MMNs3sabKTuUgOH8++yfaEDNa9S3Kq5Q2UYwiRyUG+HK08j+SArB+PphTMJUvAIItY/0nd0n
	I/AEZJXQkRGsuVZs4U9LG63ir3PeTs3dsWLTPk5rlRXjer7tBxrsIoc9ifYUuz2qgoCp821FwKX01
	M7q5qlAJ58McRtdp3IgMtsyIcd8HplSmYI0FDjTKhps3v/Ty6cTO4hFvsZZRuJtTtQf4U9kXi4KdQ
	9Wu2YfjSCB8VJ3A3iiC2bGV267W/nfhPPJ/VwV3KE/q3aQBOf8E/c8jtRiukSISYifu5KwkTZI95P
	fRbg/fIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2m9-0000000DslV-3RHR;
	Mon, 15 Jun 2026 08:34:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2m7-0000000Dsjs-3jK1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 08:34:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6K9xv3692495
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=; b=lv4pIceeNxd5cu48
	UH8gJsf0WLoHM/FTmuj3jRY6xgDwa5DBOTmyukYf3a+eEBOMxwOePZsLFP/suSht
	jSSbgUKDZ8W77L3wahFrUb5CN0bJ/Ws4+cu8CIvvbJTwrIMqn2AOn42x/AEm5+Xr
	RcQmsxVHUy3iI87JvBlCvksPeJBFrcnnEwLpYmRFF+tE+2dJVuf2RyPu/18GjuFS
	XYJpkvcQW8Kv6Jq6dagOiPxAGBMw2gHLNtIhuHG65YfLoR9rCkKzIFvyc3DdprW9
	peGfGV45/U9qJM0oOIABgggJ2lhhBlYaXkRSPwVOaSSRS6onX4YZxeJyclubHUlZ
	TTZCNA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6ec36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:34:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0bf6904a6so53112595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 01:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512470; x=1782117270; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=;
        b=NoO6KJbc/VEPGuHsxlUKcmLykb/gi7/+jSgljlJuFqm2sOUSpCdoq/41kHSv7jqsYK
         XrzodtNo3OtR6UMZkjFGS/td311nbBSTBdNB12nTJ0o6TtPY+QN2rkCRrnNeNwUHTVlh
         hwTAkMenOxAyquQLoeusUmNtXrKZgFkE96QPym9xW1+P/rnMVbjc+svZL5bI3RN4GC/b
         WLQhDt4r94RyF2a1ZvqW2oYXELQxKRaU3uRb+P3/IPfq1QCcfQkQQRpG4UF4hVJtXGgE
         PTJLnfMh5jOI8Rx0tUjlalSxzpzQ3QcksaMQelU6ETB0C3q9UukNLcD0KHSwYMlbgXot
         NBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512470; x=1782117270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=;
        b=HCIPiP3t171HZPeSqwb4ij1W89OkvCsbvfLhtqGLPt8WV6T52ufE13GKFexjliXs+V
         INeTFKOhAUt3s1aYubGFeRAK+F6DNJYcu/YTbO6x3opCGs9co5nUMZUM6u/vlkOsL3zm
         GotLah0RHGzB8Sbgm1AzaeTzCaFsHtnbqS8SLUMhfEpUJqRMJ7xN6BoY806QeeMGGs4d
         igxIAPiQP2wiQ2xb3DR/Wsms2H06uU03GnRKc4AAAiIP7hqw8zIaGZ/pHH14mmIB03gO
         SXx5+iTjwXvgrPIrLSYQOYSlgjfQGDMfmUsqyt6cQhr4AJguwgtILV/RGtCpQKWn6qd4
         gY7A==
X-Forwarded-Encrypted: i=1; AFNElJ9cHVXXp5gK9Mvb59BPrV3DlmAyOSDcys7qhESdsw3Is1b2X1uzpb6OdDe5uzuhhjg61LWe8Aeesnc+PTjeFCEp@lists.infradead.org
X-Gm-Message-State: AOJu0YxE3NbvyBGE0YcOw+h7CCbStpsUicTrnu31JI6ui+4yJGWDWUdj
	8nm2JjZe2nkWDMLFyBS5b8JSEo5NtzvbrfDlYkCMVfl4xL65KBaS4SoGiacbDty/AItgTI56bdv
	5sui8789sSdA2tUf7ot3a5VRcG5VjQiXe6H+Z/50Sx/90lqvIU6iHi0z9yDL0IIFQFfDH3Ka7hs
	iZ9g==
X-Gm-Gg: Acq92OHtvC8bwB8RwgdxLN2GeUYMqGOkivdK8J5J2BHxg7Zo/M3CD2OkTcbYo8D3r0G
	z5wBDRepfVv6GhhDC+kycx4C0WfZH5tMYdzbNIFosgwmdXkP7+zlMJovN9jFLzkKH3zCCsLAiVy
	TFC2kkO0MuF0FP2fHZu9Lpx0eQ09omwI3/i0EEsT9Tkxgo3Q38Hn7Zcc7B9SrhV30IiEPxUpLdL
	4e47Vkd5Ha51CtG0x42wJmDu855D8Dy69IG0v76s3Q76DYwTCTDd5SgHqo+iq2X7q4cCXlFb8WB
	cUb4tPBjO14O9OnLuvYcSEH8IcayrZeyky/9K02I+ogm1mab802Jbxhey3vxFSZn4wn3lVNHrbl
	Vyz91mwbZsUogO5k8E/gjBfSviohXHdkasC/lmFQC49n8tPCrhHUN
X-Received: by 2002:a17:902:cf0b:b0:2c0:c262:b917 with SMTP id d9443c01a7336-2c4109ed1b4mr154920995ad.5.1781512469875;
        Mon, 15 Jun 2026 01:34:29 -0700 (PDT)
X-Received: by 2002:a17:902:cf0b:b0:2c0:c262:b917 with SMTP id d9443c01a7336-2c4109ed1b4mr154920495ad.5.1781512469458;
        Mon, 15 Jun 2026 01:34:29 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:29 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:56 +0530
Subject: [PATCH v4 3/6] arm64: dts: qcom: shikra: Add CCI definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-3-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=2667;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dD0P2j8Nr28ZbmLTZrfr3Iys+tRkC7smVwGCVx5OZpM=;
 b=Cniw94I/IeuLlJ+GNuZeIQ0xTcT3NSx88I3wNJU/KukWnT79nHfA3XKcm0P6UDN9oZD8m0CuH
 UxBW8/qf050ANTXNPa8VDLV6JEP4odbMobSTjgfvNB8SJRoaZWqpIQ2
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX3wQ8m1CQstog
 DOKWFQdJu5N8CrL/PKpPDzATYjPgjyWPHPd7Lqddxgafpr/L4GQB3BMBzg54Jwsy6speNBHT8Gd
 AefaefUjJnNZ62w3XOfA5tR+Qa0j9v4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX5Y1yxQXR4ou8
 sR79P1tbD3nLJjmc5lnaq82xsjAVKjluP/w0z/mYf/S0gnd7RgiGioVaRH3Gr5yjWyIo+UW5YZH
 x2DEgweiIH+pp2GiWEWWSqRhlDnVZBiq2KccYrgWaiSA2iZZRwdzTmYKNJzWwVcx0Bby2v5cbCw
 lEJlEZUW9M9JVn6ll96dMRu1Fx0T3SX5+pIZNeQR8MQX0yJfO/D+bYEssYWpWIYAYWMeHfrSc1t
 Hxv1QwNsudpTu+ASfmTFePCHxNnx+s5C+t4jZCQ5UdevOgAcvwj9jeZbUI1yHicVgQszHggMSNX
 lWs7rOABISDaIQ28URfbLPoW1CutEUts9qCCu9jZiRYIQcn+ajFjQn06QnG+5SZ/LJzu5hUuP3J
 8HXaaBkDZgjZjUTne0ASXhMUDU/gjYSm7pFfaEJ51R4s1q7W1AGJ7hQauFkatF9GpdsXLigR+Vm
 jNbuofy8DGI2pWnh1Dw==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2fb916 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=s9wsCz4ZXjtKvCKk99UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: m0gQPKJas2RuQ8mUW5oO6hsUFZ7r0Doh
X-Proofpoint-ORIG-GUID: m0gQPKJas2RuQ8mUW5oO6hsUFZ7r0Doh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_013432_072072_337CD6D6 
X-CRM114-Status: GOOD (  12.83  )
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
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index f0e827996609dab2c09834857a1bffd9560155a6..57732804a6c6a114a407a4a541a1cc7af7635ea2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
 			gpio-ranges = <&tlmm 0 0 165>;
 			wakeup-parent = <&mpm>;
 
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
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";
@@ -702,6 +734,44 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+		};
+
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
 		};
 
 		qupv3_0: geniqup@4ac0000 {

-- 
2.34.1


