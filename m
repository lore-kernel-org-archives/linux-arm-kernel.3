Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8C7CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1qr/cFnfW8NLplO047lZkMdrYxmX1NQnYYSVJUNuS8=; b=v5BT5MynicZv8/UgDc9ODBlb3F
	JpHxVATTVOXXCEl1Gi1mea/CJcHwJm/3d2OTW029zt/B73b/EAf/xn13wDoWpZabGaba6hBVwN4dh
	RZHdtqJVE+LfXIR3qlsQbpKO90jFWKogvx6BXNfIYnuh95uCr/otG2JXx12vCMKgvoRPMPQ0zwdH+
	5LbnqmEG/NmqGPSWtIbqFXdz5duMCwhcyDPNM6wtcG6rYGtSh2SQaH4y/MAbWjeDIMlHBLPM+PMBE
	02n8GJI27KzU+VQ4E7ZROiGmZeT5p89pf1fVRzkeTw7l9sY9WlTqiEdGIF+qJRwF6YvqapMo3JYTz
	sB7RJLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWadU-00000003hBw-0Yse;
	Mon, 08 Jun 2026 14:07:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWadS-00000003hB5-2VfO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:07:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR6k13300426
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 14:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z1qr/cFnfW8NLplO047lZkMdrYxmX1NQnYYSVJUNuS8=; b=U1ITahX43xJI2zRs
	knCa6eHfuHe2RTrvmKI5svU2mVVOTq8CTExtI+5GtW7OjY7i4a7A0Bf7fALIK9k8
	9LtBPmJPFJOEKiE3lYOKtZSDWy65diZcRLSulWLFu4HAoieJnm2uxzowdUqTWR4V
	1fQea++iqKcGbPGsOxWoHVG3x0JY04uJM4V/aMnnft2Po2KdAuZjroasKDSD6Sb/
	SR1QtTpB3G7nQrW0ThAHdhS7/+K/oa8nYRVDPV90uwxHJWCFD/cwalpCI5bDST1n
	KENpfIZKMjmgd9cr/lRthRduDp+6raOBnBhm/L4c+KmQvK5odTWjPJfu9aU9agMu
	g3qzEQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna9243-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:07:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0a99db8dfso52087775ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927645; x=1781532445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1qr/cFnfW8NLplO047lZkMdrYxmX1NQnYYSVJUNuS8=;
        b=FGBx0JmOuW6qI5SOzmnh4Cn5FJ4uHIoyXXojlxFzogkq50nqMzWrWkpuo5NI572JS2
         8UQlxrym0uUxUsWIdwVMZtqMRsb6bj4MdQBIt6e9yF81zZIXvcjuOiI60ftJuB7dUu/Y
         KSWaPiFis/AuokydbKN7DimvCcpaGSIChcME0Z0mP33uq5nIy4tTd9xd5XtQMLft5VcU
         CWwuJTrRNFX5xJKnw2jsgqVRjU8aheV3WtFAxGFL5OnqYyg69N6s2ksJZGI7EqMEf3He
         E455rfTe1F4Pa1ThW9Xk2KQ4bQwT+3x7Ppgz5vf0CxycRFfp/Rh0xWt1pfMBXeGk5lzr
         HpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927645; x=1781532445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z1qr/cFnfW8NLplO047lZkMdrYxmX1NQnYYSVJUNuS8=;
        b=PMmKCiKJ0RfFZBmgw/doUGmcndQ3EP6dgv0KTnTCH0dWLl0f7wvuhVmExwDyT/d+aB
         2IrYjC68BPhvzugYRcB+GFe1Zsv0Nbw/aFO9iykBFlGz1Qgxl2oapbPAcyFAlIktbGDA
         mewTLK1tFLWOfOD1fxJgk0fBnw4GBBtzz1EpibZc0e1c1G9VsTJeFWZrsKdpy0KqYs30
         rgBt1ClnuzdN8l47wkoxNlqs211gOJSRp5L6ThC6dkHFHwi80832oXJNgDma26I0HAfC
         e6KJlSw436bOQcHGmAitSAC7VZWjVL7/1blIPzldU/9Ivhc5jJltDIyWtNta5VQo8lqF
         HbjQ==
X-Forwarded-Encrypted: i=1; AFNElJ89qLUWAxBdwGeAG8cmMYDTmooM3wW+dhqRkfsxh7+zdMxELzvtBhBo8XRqmOg6Z0H0x2uD6pcHoW4E8X/Gsw1e@lists.infradead.org
X-Gm-Message-State: AOJu0YwDjTb6tHXDKzr2DM5/ALmDlbIVWMimoxUgAkrDgvISQxlo/Gr9
	ee0NyHF26QA4TwbTtaUsL4HvGproWkCYVGrOsmAp0vKmAGWa1a2NZlHOMTbCeNPOl4Bj2vYopw5
	49ALJU6QzSrTcce2NzhZd8qBjgGjLhyuLbd/a0DQjlTPXAzHiVszmPRXlMuvWC596RU5qXNuOFJ
	pM4rjkduFHEfWn
X-Gm-Gg: Acq92OH6wPoqeZFHkq3I1CmpuQCCjR76RpYVtDV6YOsbMqTGJ4y/O2w2Sqc2zjCmOfq
	jsvTg8n7J4zEgvhRHFM8dheK9FussvedQ50xrR3htenNCuQ1XcBMYnAsUzIZ1dDjrsv/s/eBoTz
	mij4Ltwm11sZBmX2eJ76J2O1canm3gLoE6b7wLGI3vric4g4EcnvWW+1Rg03i1ozxkWHaPPWZ2N
	r/FIDnMXe4V0Pel4j1p8qNs+H9yCcmQwVq6fyqnBfuRFM3RmfbJnsQguefPJxxQf4CvkSiLck3V
	w2zAx3w+sYPYmoavo3mqCKMmFOQM9V3yIyL9UQKqhr1aAa/COEpK4oOnZsh4/xE285UTFiQRi74
	WX6wJ6rjYkSuXHQVGE0dEpSdzz40u8NLJ3RjoRhyUGWQEaNwWpHLeQlkryTOnpF8=
X-Received: by 2002:a17:903:8ce:b0:2c0:cb0e:ac3a with SMTP id d9443c01a7336-2c1e7f91985mr175034765ad.23.1780927644952;
        Mon, 08 Jun 2026 07:07:24 -0700 (PDT)
X-Received: by 2002:a17:903:8ce:b0:2c0:cb0e:ac3a with SMTP id d9443c01a7336-2c1e7f91985mr175034185ad.23.1780927644353;
        Mon, 08 Jun 2026 07:07:24 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:24 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:41 +0530
Subject: [PATCH v2 4/7] arm64: dts: qcom: shikra: Add CCI definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-4-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=2602;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=nnNj0bPf4Tyt7UYYDgU1GYFk9/w1Us7QvO4PuiTMSA8=;
 b=GkKVdIkUath/EME51kNESPjACacVq1UXhwANX5S9tPyhbsD/owBuVfNn8TH4OgLNMENiKNnqS
 2DYOfqWUXPTCvifXMUIYSzyhpRC6ya1Falw/4liQ3P/FpHBJF4mUXYk
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX2yPG/G3XreCa
 T9DAH/tqzF/Y97Dcv4oSmtYH619K3dJSuXLWycPe1EjpjAAbw3VipH0fgz3SXJdu2ByZksEIGIS
 dM6Ob80ZxR/22xl5iHiTRy0pyhp1nKqCL1KYP1dEuEgR5EGUxGWVZI2JohpN725ahl39n8hqf70
 TI7wSdH4S+j1Rlq5uKZZ9V/8ouGsFXicLLOCYGtR/ThIiiynHgYswehzEGHlDG4vpd9mxJ1tCoc
 8cKF/xTtAUZ5NXdHWSDkKmmrm0YfC/oUbUJ8XqOuc+eMu+OLO9yKfIVCJHA3nkoF3Yi8vuqZ21t
 Q8OmZW8MKZHp4RtU9RdRUm+4Ok90mJPzfEw9SR1fKI9g2lLKPXQ6tUvVvk2VTh/kBAuzMesNmBK
 OkZEqDJNyF6mWrs/BRrIMhD4D0HjAEnZrq5GOtYyJKw2AGLh7tcEb7OcVfotv+IXsu9WuOpV6oS
 SbGwgdLMyQFcRq6HJLw==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26cc9d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XuEftVTFR-VjiOTT8WQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: twqRoP-6KPW54NeqHwRwPVMpMfSWMrAo
X-Proofpoint-GUID: twqRoP-6KPW54NeqHwRwPVMpMfSWMrAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_070726_647987_C27C664E 
X-CRM114-Status: GOOD (  12.55  )
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

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index b93ce4a92a998ea5d9d4268d2fd46030fafc4084..fed71131491ebf6e261bfcd14b5d4a2624837878 100644
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
@@ -701,6 +733,44 @@ port@1 {
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


