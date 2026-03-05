Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24C5F30924
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiE01OmyyEcs6zk7EOhDkZHfhm9tePHQG31k/jipSjo=; b=pk0RMI61ojd93Upu4QFQ0l2B0G
	/twe5Ipq6U3Ci6kI21GIxhxg9yfWEXojSRPxemoDP51Mv1C57Exx9C0Xm5wDffRt3HYDzRztBvdwZ
	HVNrUcqrmX1URBbGY4/pXFtQizSCoO+YAsJHdVAZIO7SRoL5zRzC8YZ227on9WR97nsXNGdKCiJZT
	bAKd6pK7hS2rzbN7Fw0E7ugMvKNalEqMRxNhDnZWFr5FdxFZxbM1bP12+0EzV0Lu7adILCbawQ7oq
	jzZiN0Hq92+OVyTwQroF7/XmR9MXWu1lqwuHNxDtc25y6Ypn4lcQy1w967r+wuprshiyy6JGnCG5K
	LPQCO0Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5KD-00000001RjT-1NBZ;
	Thu, 05 Mar 2026 09:48:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5KB-00000001RiO-021M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:48:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6259FO51628707
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aiE01OmyyEcs6zk7EOhDkZHfhm9tePHQG31k/jipSjo=; b=dmOAzAJ9ZrOjruOE
	sdLdWneq+TWsBayn78t5h4CmBYcmL66WFcTik6lfAhPJ5NJmASDZPDuUeB+U1nV9
	CuSPKA59VK1betskPcR/5Upm/GTJQM6hUEg4ZLH/U7q7WdKPmPr8dC8d4jqaqjcZ
	RbUbjrQ4Na9fvGpFnh+xSxV0zOZJHmgq6uXutykT3oEleTE/wu7agrxA7W/cbA+Q
	25OFLCIB8LQzuBcNhst50BzImrHflSazqK5AZeBohG3FA5c8WXTZYm32RuaDV1ad
	5cK/w0RfnaxIjP8sp2HA4cI3bYfU1dLOnYHqPmiezNBt0iNA5uoXmO9wZkKKbyDp
	4OtYOw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m2t6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:48:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50336ebabe0so849310361cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704130; x=1773308930; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aiE01OmyyEcs6zk7EOhDkZHfhm9tePHQG31k/jipSjo=;
        b=YoUkVRm7nYIA3Kqvkx9avUESGD0yPdZeIU/vXchti+u2zpEqOKFzzzwIvIu0hHf3G3
         1TItE7wzNhV2yKpyAdB+73I8M+1/SQ96IZ0y2RiP0XqiHe0jkZXft3slgcEj8TbZbxD6
         +/asJ/BZJMxHbHzMf7GA6CLI0pku7J14r5VM4n8PDdjsfEU3k/87aZR94zDNj99EwGfn
         gd4WHDbbNqvLFKS5TE+ukT7qKYp9/CWjAxQjgiDNZO2wDmFuBjiTgQjB/eB8jV48yEM0
         q+DvImHnAa4wXzfC8tWKEPFdAqSzKGtp15cLiyk4Y91OGCuBXH6b9xvT/oVMVlloTJCk
         enAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704130; x=1773308930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aiE01OmyyEcs6zk7EOhDkZHfhm9tePHQG31k/jipSjo=;
        b=xM/SWkAl1tNjUho+WvZrndpyWF6G+ZNBxMuDLNlB5uLKQSsObIM8mIVZvFKPgcUZrh
         t3b5lGlYy+zjJH2lfutsuxXsTR7fw05w/9EbEPVZ36a1D1VzfefhUeT6KotoHMiHbzCT
         YO6sogk/f2D8qqYDlIIjdx8MiVAkBjmWb6qhuQPnU9xoZyKmfCetj15HTpvSxUrWO8hA
         nGnruUT+7s6Jas/z5Eew1F8NM2+KJe0f3FesSplslgzppZkPCbdoO/gbk22wXIv+709q
         +BfuwVxS7hm3+xlw8H3Os64QcwPzzAoKCveDkZltRsg0eXU4DYU6y+oaaP+qyDbkewyM
         OW0A==
X-Forwarded-Encrypted: i=1; AJvYcCXpDxV5YoTLjLjOCnEigs/EdyaAkLitANvUfUUNHN4kTjVYZEQeZIjdoqL5PB8XC/EjRBpkSvlh66ylVefXbgHF@lists.infradead.org
X-Gm-Message-State: AOJu0YyTxWuuBOEtw+zcafpKYQDIQfcVbIwPQunydZFAvh3i72kN6z02
	4PN2Rzmo20Y/JB6lGNUdqsNwPStnEEuG+IAAmEbT2H6haYD2qnI4bqtauG8dAN5gswrifhKuw3Z
	7bgKj7OZLjReLVV3iYtWCzNz8tBNxYiL9VdCOdqgx2kE0KyNzagvQy6N3dpU64By8MtwNB0POkw
	4tow==
X-Gm-Gg: ATEYQzx8ACrrDfEjJS+XDSxsX4oZuP2b5hX1zMY+mpEP7UpnKc/TQkE16qy9fq98wXM
	gI7NubNcFajfkD6oXi+z4re0u56H32WuE46s4S6TD0b/8A3syx2v3l1AzQdBknOTbTlld9GlbU7
	4fYgnCikAhSadkvgoZOgiXo/JhSlvwDlBUC798v1+DuNDHf1pteLBGPIT/T3oL5WVrkek+9gw3c
	zBVE6O6j7fYhUqItk+6N+3inm6VvgJE9uzZj9ySbX+m1yxOy0SwII8FJGSHmQug1OAjrx99BmEL
	U9jjcYFiSMdD51Ru+XoPIRhJ8e+q3Y3KRdNJXogLZW1rbn0iozPoG4BBaFRrrqBKv9nBALLqrlm
	U7ivq/N4/NZ3htl+PYTaD7MyELr/FACfptMPjLhA3VnR6nU2gzK0XdAiH8xZwT2PGPLwl4CVrsK
	ss9lh4uQQAiA3s
X-Received: by 2002:a05:622a:164a:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-508e6946118mr19329551cf.21.1772704130396;
        Thu, 05 Mar 2026 01:48:50 -0800 (PST)
X-Received: by 2002:a05:622a:164a:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-508e6946118mr19329321cf.21.1772704129986;
        Thu, 05 Mar 2026 01:48:49 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:49 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:14 +0800
Subject: [PATCH v6 3/5] arm64: dts: qcom: talos: Add CCI definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-3-38ce4360d5e0@oss.qualcomm.com>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=2250;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=UHkKZRKX+Z5mrmHc9PqOylVQatIA9vArdG8H4u12kKg=;
 b=JXkhUvtpWwcXpsiIO4GJCvO2jqVyJnJtvoaiDr78rNtQppEPMG0cyzhxpNpFzgjtrNVT6NBAN
 vP4TBSQjCTJBSEg3SgjuQHxLSvbTDJZF12Hfbd48KYEHcVEgdryAtuf
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a95186 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=szutk0iRDVHniUSXDBIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xNzn0Y7EN_75p_UqU2xuUFQ6s_NDznV0
X-Proofpoint-GUID: xNzn0Y7EN_75p_UqU2xuUFQ6s_NDznV0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfXxdUjqKHB++C9
 a8mk961lwdEbFxJvNC6di2Y0O0/yHzgRuhWEx/mo5FM+x7jMP1xMEfpBbA7QTsQIHHOHDrVOyRJ
 LHmFHykN6d5qth3eEI/K1Dan/cyDJ43a5R2LOzMXTgbXyAV2IEdH8GhCC3UCTsm/5bV6FaLuRQN
 qZNOPlXqJmaQourpkn7kFatd20GCtzDHAGZDvw5N1SeiPwLgHR9VGD+zLkka8ilcGZgJGspe5Lh
 OcfoFjzN5QZrjL+CuuTAaupi+DH/V1GgTxD26sfG45NLPir3+vNTHenwas5uzjXNnWVm1aaVzTd
 qbeFEgEOCRrBRn71g7dUsu/qV8Mu1angd2CqNwFnBbA/ASRyWUf7ySNgtwAj8UYZD9A8BIAT1Of
 75Vp+lMpP1nGhVkB0m2QG8L9pq2NHsn/ow5/qiItbv7h7yKnnCys+6n9cR2hmWMrjfbUzNJS1vO
 9xYqt+gG+ftfsAODwGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_014855_061177_CBF9BC2D 
X-CRM114-Status: GOOD (  12.95  )
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

Qualcomm Talos SoC contains single controller,
containing 2 I2C hosts.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 054255a65c7fbb51e6c411d10252270bd7ef1522..ace2b2a0bf2b7e574b0d43f98ae4624df03b477c 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,22 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio32", "gpio33";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio34", "gpio35";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3789,6 +3805,41 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
+
+			reg = <0x0 0x0ac4a000 0x0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sm6150-camss";
 

-- 
2.34.1


