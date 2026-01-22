Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B71C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=; b=d8R2AcSjLihPp9BfuAMu98ZRSc
	ZiKkxHq/fW6tP2NS9WZ84/bgZerKAuRzgVRXT8YX0vFuWPaemdF+OPISx7+h3LRTnatnh3DrYwXhW
	M4WVvhk2brtbMM8VWLNwdLEcWdEXlDbz6Y8lSHGMtUjNODTUt7IugiJyjh0V/P2y/HPIUFLdtmY1v
	EOeaugSfT2pqqdzUKYsKc24f6D3Df5NhAUIO9rberv2P/wc2Y+izpzbFIvj1F77Hab0ofBGzrUgse
	7V+Scp8czhaKsxdS+FaGbi+EMuVW1IxREgAw4G8zNIJAJ30LdCWdxKloaa/dBJFt/dyfZHDEhPlp5
	KGoWclzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visGN-00000006ukV-1pUH;
	Thu, 22 Jan 2026 10:50:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visGL-00000006ujV-0Tug
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:50:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M6opWg484050
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=; b=Zv2rITlzggNvS3KE
	HJ6wXwDfRMydyGn8W0+KaJ75ZV1lf2lijfbO7WT8i+TcxiG+w5v4jOaLRSZ0M9PN
	+gV4dk2kX7hPQzc7cL9iU/+Cao7nQ8mMQ9fwgrvT6r6SCY+fz3Fz17hDCdemFgyN
	zB97T0tb4p8HYKMgfXJyAWKl/zcgV4Q8dp4JCfXpLyhSKYu+gJixBDsg/j9VyRWa
	VWT0iIwCMtkvPw8pGtfeyWNBJZg8NoLoqDTNibLq0v9hyO1Tn1QMc5r7/kNHICV4
	AGQTbW+pLaKAZIxKkKfjtVVXh1bGGg8TU8sUfdPVg8WUhIdQ4cq4CoMQPnHLZO7/
	Ymlz1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pj25ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:50:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5014e9d9114so21441991cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769079001; x=1769683801; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=;
        b=coj0usqLizHc4grwsw4IswJV24dJQrR278kADL47Cvoy4/4XzAlIr4EHIIW2c9DQQf
         5CiDbVAHM/V2o+6X0EplapmA3jgKnB11tXL7WIAvAU3b0Ult7kphNj/iBAf9RBXQtfwl
         xaqRWtBDm+JIEt5dCZmuR9lNpA6qJHiY71an0aqp+zLjUY0eK7t0QAabuwkleek/Av1K
         wTtNt4PeC3dmifm/E+ZhQ6aKxcpKXUm7Yl7JVPOZn0B7EZTrZb1sV6dEtszZbmT19WRu
         ux8ppupyMoA8gykfyKFEIQj1mGUhi8ygPH8IcqrAag6hu5+ZHVD4OA9AgE7mMH4epntC
         JlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079001; x=1769683801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=;
        b=COk7AOBnDti2vwUkqW1dYl+8rtpVUPa/tuuIiUIlQKaKiFp+GSYGeiXW746+Bw/9dp
         uKmjoR2wmgD5EiVVPDZngRAQQucaYgmLuEMtKJ9EPPxC20K15mFCxZmMISZMg7iMakhb
         /wVonoUxwrMWdsSXiBv9E1eowYRtBc9bv1dd94HTZ2v77E5md0G+oV1YycZue5fZmxYw
         2D6pvOPmcUBfmEi49KryWzwQNH2zO+EB0Z8FlZ17w4wxtBXU+moYGnRCXwZYRd2Xyatz
         /+6R9PQRAzvL4vRo+qFEerTrjy2QxkTCs/WsiwxjCa9gxx2eGku4EX3+OEf3InbRyogT
         /ZGA==
X-Forwarded-Encrypted: i=1; AJvYcCU8/k3AE70RZWx7cgh5dt2fhid7Jqe342Vvytm+T4lPwbETXpgpDB0OCOIGq+K3W43F+vMD7aT+dKL5LnTTy8ka@lists.infradead.org
X-Gm-Message-State: AOJu0YxU78DETRDmbskyQMFxZgEZmQN8U7RqsPp2Arp++F0umlgqZ6i7
	FYRkW9uF2CgrxWBpnM5LbdrMNyLaeXSFkgZ1VLoQR/SeQ5ZcsYDrE0mkjmkb1E6U4KN/L5ya2Pr
	Fls+s7wtD+5vKx+WYCKP2Gw0yp/LSczC7doJ/bP9Kf+uDttjssG6e4ZMod2nni7hx34QKzVsC24
	ynZw==
X-Gm-Gg: AZuq6aIJahgKbuIwHytJ1ZmC9NxJnuGqRcx1bRkCnDr5CiKNTp6nbATlGYaCKjWL0by
	l7GO3I7Ua7aPaLXP+CDGqh/er8Z39XcOKogjXA3m2ZEHjVK7H83KgEQ8CJRkvPPRiK9JqwV+Oy1
	OS6/a+K9roSw+pYFHUzjKww7BO3PlxKMLsiK55fzAL/McfV1nnJ+fM0tPbeXkgeo1oI2pxVdIhM
	nN9wPN5rxIDE7K27N3dKoFzME/R8lTe4RhdJOgOyl1faZlT0B2ISw4AteR+JAqqiKeBcsaQNGSd
	w4B+oBmvMiyGBUiE36nl6Vr0HQ2oBt22G7vBa0dGDonQo41dCahBUBTraIhi3I2BfLJCuMqpz2/
	2gl6hTxBGQ5fh0e11IYUV6KH1MfpFCXEbZ3RNhOEcu8zcnefWPaDJQVnHqDgiVD9MAcNZDvmYfg
	3T
X-Received: by 2002:ac8:5a08:0:b0:4ee:1aab:fd6 with SMTP id d75a77b69052e-502a15e4660mr293697561cf.3.1769079000817;
        Thu, 22 Jan 2026 02:50:00 -0800 (PST)
X-Received: by 2002:ac8:5a08:0:b0:4ee:1aab:fd6 with SMTP id d75a77b69052e-502a15e4660mr293697361cf.3.1769079000440;
        Thu, 22 Jan 2026 02:50:00 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:49:59 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:48:54 +0800
Subject: [PATCH v5 3/5] arm64: dts: qcom: talos: Add CCI definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v5-3-039b170450a3@oss.qualcomm.com>
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=2250;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=2WG5aoisKJwerkvnpytr8xGIA19LajXbCLZsav5MoQ0=;
 b=D4j93r8djlEVFvPHXUNxrEEMUPi8V2DnJbU02J3SwFN91DYAirb6S8cKc2/TO4Wi8hzF3ZLYt
 j71PwYeIltuBT7izRRMtbrZ8CkPgnc4JNgREU7urfXhndWGqqpfwO1U
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=D8pK6/Rj c=1 sm=1 tr=0 ts=697200dc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=szutk0iRDVHniUSXDBIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfX0p6NDRNMxtd3
 gyQuytzOLpI/AY7j8qN75IF9TdQnqw7ApA5KBbKqE99htwLgcimyAL005O3LeaBG6XHmPsU6mxg
 hCqfyNXlARVz/kIxc2bjQ1BfEvPNTLdHeTs8EHV20Ujn/eXu/5ujfELYxohVko0LQI94wvbsSD5
 Tk2/F8N/linKl7saRWTNW80q0woLdN1aHkQiXiybqpXXjy45vBX6zlA7dyX7EuFoexcXfPcpUtV
 eXzPcZhE/rAkunO+l8INxsjlcZhoEgBas2UMChfAdltdNcMh7UJpQ3rP/cgfVvF2xti8cHZQbsO
 iUoKVMpg7HxTQxxPYYiQiJVonp89G1IYbpsgliCpla+6mr4E9Eh1jGDydDCF+t9Vd/UihEn4RAf
 M4jEtyXlxtzCbp2pAWfuECpIVqNnhjHt1ktjcA7AMB8H/cZzjxx43k8e52jHycjuyp9blaBJnIc
 azGWmLQKtiQqpc+H72w==
X-Proofpoint-ORIG-GUID: V5l9-_WsCgpL6NfMr4Gp8ZNItocEaCzf
X-Proofpoint-GUID: V5l9-_WsCgpL6NfMr4Gp8ZNItocEaCzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_025005_167395_FFC807FD 
X-CRM114-Status: GOOD (  13.21  )
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
index 3e1d85b6eacb90b48496ddfee2db27c586f3331e..6d28096e50546855bd762e479b66ed6214ec5d65 100644
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


