Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FBFCD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=; b=Yg5ZvDVnFwTwmfakDKAXqSDQvC
	Y6mjWtNpiPVMEo92WvadiEIcRXfTWDST02Oaf493WhdvX846dkEF7t4Y8vPuKZFIO0WVedh81hx72
	PLGuqUwQin9mbIj+0j1SQBx/wa78OrqNqqrd8c12z5dhXCGaqfR/U39zmXPhjFKdJ3LwmNJm8vdRV
	1g59ULaasMOJr1wUInfJba7su81e6BeNCWBsa4JMBdBHvCyU7jOtSI1zhSXN+3zjrxidC97D/fUeB
	p6TqLhsC7Vj/A1VvKQGJDxNzEisFNXfw4CKshqkVJt/4RIbtAmUq8yAVsB07weW7H5hvXzQuIetXx
	hKsDKjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJaW-00000006N5V-2v8y;
	Fri, 08 May 2026 11:41:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJaS-00000006N2i-1zni
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 11:41:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648A5XnW2182882
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 May 2026 11:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=; b=GdAfwAgffubA/UlP
	7ento7RCBt/jJNAUgbQYKFTwZ6YgH+zZeJbdKQt4o2LRJa5ZbjSanxgDjVo5p3ho
	O3Fibcf8v91Twa9Fi5YrAom1Z2MSQ+CJNYGKIMHkcgzeDOL01lbatcVZjGZ2k1lV
	5n29ZDDnahfpx65AOFv3OEtzAF7kf17ELITdUP3nzaR7VwEjxA0cr5hYOEfTQ+lJ
	MRdJdSSG7Ivj5CcoQO8/xsSPxjJYF3wKAwR7Pbn7Kw2JTSV4RDx10oQ29dS5h30r
	HwwmwXuB+qlZa3Bs+cv+z8AgPam7PM3FYAH4y4yzQbmufu0ItcY221RP2EKO2Oet
	JtmxCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyb6hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 11:41:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ee9a11aa75so429512685a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 04:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240503; x=1778845303; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=;
        b=FvmAfe52473V0D6hNvldeWLfcYydXiSxv6X33ybE3830DMF5bWz5fNHlV33wVbwNXC
         MvfwAXo3salfIxh7cdsYA2EL6Us+Y6Dd/0kqNj6vDiKlNdqEVPWhKucGf+L/kOQwv8N7
         PqaATMthX/l6y+IEUNouXDb236fTuw2SzOwCFMQ+C7dRVv0sw5bZpgfRny1lEQ9RY0a0
         MJ32/USqqU2QAMM2vT2m73ye6M55LbTKNej6PFZk1sDvs6xhkjSIU1GGrzJ0F3tWVGfI
         Ty7yNAHvuDCzPfhZo7CJpseAjYBkTNG+VJbgk7t/ifv7kLSf84kr1BipcJPAuo7hQesr
         PEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240503; x=1778845303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=;
        b=aAZzxjcKYZ5fV3yZ9OXY/2QXxYzfhW940o1TctxH/WZLjkMF5B5ALXgiqjb2hCTMlS
         ixkx5fMN79TSN5+x+fFtV+DAThtr4mEwyDUyZssKB6LkGuSL+F48BPwY8Fx87degEDEk
         tSVyM78S4XcIhs2Xnjq640ZEmRcG1f7Y2vT0EjSC2rT1ruE9zX/DSODg4jp82Qycaxb3
         3L/6SfBPTAuz+Z3OPTxVBMsZQqHk3hCesOfpCsmw+FW1A6qVkDcnH4g79hoEZbAjetvk
         oLEqC/KXI3in74hTz5oNSRCk5feX0puUnk/99k/mL0ZePcUjzmHetlYLYw+DVAcoMefl
         F9YA==
X-Forwarded-Encrypted: i=1; AFNElJ/noxyKK4EW7HYc5itRNAqvj4aonuUW5twGZPIhtSterHL1tV1va+THGmAwdUV1juKl38wKoMfoeLrvHY9+rr7T@lists.infradead.org
X-Gm-Message-State: AOJu0YxkZT5sJv2PdGR/UeR28IfUZsNAVgkfsIW8Y9okldYQc9Zos2TF
	rjA+L8ilK9vYayN4SNK/z2WYgWdYyMGyTREMnvRCFcNrKvgOfS/ZH/cT4PXPEoXJ7LuRslKh/BH
	b5pUOEYJh+lHyPfgsNIi46tjZMqEcdKfhNEO4hUUKu+ZY1/LbHZ/+3MRhv8U8QRQaWDK13nXzWK
	M0Sg==
X-Gm-Gg: AeBDieuEXJh5svPgpmLrfnUet2gdwGHwN8WluxNk9iiltgIiPaSWGY4MbMZdxYzKSYv
	qpaDSMcTnqmZXHLXSbhnWlM24nehsD6jAmV3FhLL1ggPNl3O7Yug1I8LX/4LQrxOpY0IzyzUyOl
	iVpTDURNpdNoze7yyf51lYZZVUsvbXXEHd6dv5YTRsYj56tHwpMOB14t0AMelOiDakrN+3SUk9Q
	UMWdH00wGcY9Bb87P/9ujkwlmRsqjYHFBxW/CTNXf1Df+LlpAxPapTJXNdmn6YIijiSbp/ycXok
	Wv6whHy0oXz1OHbTa0XNUQujtX4rBx+8VFQS7j93UwmLVJiYj7ofj0twwkiKoKMYjKguOEVw7uO
	3aeOJeggfjhkJdCqIBFANy3ytkcwDOgWIAwf+odvcSeSjYRQijs7Jt0krMQjzMbBFHXTZmqHrP1
	OXxPm5ONc6RGjfXzjNsYmzqmY=
X-Received: by 2002:a05:620a:408d:b0:8ee:30e:cb97 with SMTP id af79cd13be357-907b9674f78mr285703085a.21.1778240503039;
        Fri, 08 May 2026 04:41:43 -0700 (PDT)
X-Received: by 2002:a05:620a:408d:b0:8ee:30e:cb97 with SMTP id af79cd13be357-907b9674f78mr285698485a.21.1778240502612;
        Fri, 08 May 2026 04:41:42 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:42 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:02 +0800
Subject: [PATCH v2 6/7] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=1119;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TIwiNaPtfGEt7M6lhlfidGbwYXL1gLP4Ebpm5LfFo1U=;
 b=j2xXh8saEgkacjWqHlWFnlm8eiG2Fo8yBQdInRz8Wor/E59qm4wk9Uu4mQ+9JxOMgl1DUPP3s
 +hAxpV2N4eyBKU1apy7polO2QWDqEgYhPEOF3Lao/DsaUEnCMw0WvTm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fdcbf7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Qfmkza9QUpqA5zW9Gk0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 3B5SgpEuoKxsdmhO1FX2XrBcZAb5w8EU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX7c6gWW46WjFr
 YosWBawGixzyMqdO5bwWJhe7h/FxT/pfDU2n8BTU/NluASk/d1cnaAv1PS+QgaxWejQNFTCJOU9
 CZdXmqJiYYQIJPx6aI4MWdU+mNRzy9Yj2ror7GOZ+gxKfJQB5RqDtnzkieAXpP2uvwOvEk6P1bY
 euvh+9mokWtAWzd86FmtRGWRvXHAvFcoCC5ZXDQvBTRJhVVFdP+h3Rjf21Njmx6GAWeR5W0QKcm
 Paz02BRtGjDHZqFosBlXQwqTBkHlfhXxKH2mODcvp4CyENIcDaIDiuRCbB8JgufAYseh3FqKTjq
 ZRldoxc90gecVYD9xsw2x2DZfI2Uhlq/0eVemfmZRd3CEtb7GNYMOJQquwSNbkKx3nTtyVMtl3i
 p8IjXGAn+jWMiNcJQ7wSAOmbpb9CQDRUUKEgP8SRLm4Dbbe6Jj2SbXDyfIhatNzffCvuy58faeH
 VI5r2LySYHgW5UwLXUw==
X-Proofpoint-ORIG-GUID: 3B5SgpEuoKxsdmhO1FX2XrBcZAb5w8EU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_044144_696402_BDC9425E 
X-CRM114-Status: GOOD (  12.58  )
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

From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>

Add pm8010 L4M regulator which is used by Camera I2C pull-up.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index 9c5e77df0054763c8a1bc8de72e296f4efdf9c58..5c9fc0315f7dc125e3176dc4038ec655b7fc4018 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -376,6 +376,21 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	/* PM8010_M */
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &iris {

-- 
2.34.1


