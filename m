Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8937D4115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IAiypVbNNKr9va4u59sYj1IRIL4ZDpAjwidA5VMHVU=; b=NmejQY8Eon/Dijx6+GUKQBvpI5
	vVxOwKetMFrUFMjPESRyqz3pZABJg0mKKgfJTlpX7tsdNEqdHCHcIFMXnvITUEqLS4wbaZBvCCCjo
	boG8JOr2IrSh89e7cqgu+4S1Xy6mWMVlPEDRLgntrPuVA8EUM/ur/+qLLZAYTUEC0EeVb98r5eH3y
	nnFzgETTQ+Ite21xSVe9c9JNi4Ra6k5WRk7l9+ZZ7e3meqtIt/a+Bwy7Zl1GeSgz+pPxkZjCoFO4M
	bUuogT6pUuiXGU3uEXcmdCqEiy9ODCqKuzP7mP9JmUkZim3YIiPsu5RbhUjsUdbPb5pvmYfLwLqi/
	buIxLpug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKM9-0000000C8Ff-3vLA;
	Thu, 15 Jan 2026 10:13:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKM7-0000000C8EN-1bha
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 10:13:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6foDr1170721
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+IAiypVbNNKr9va4u59sYj1IRIL4ZDpAjwidA5VMHVU=; b=UJSH0icBZG4JWex9
	IT6fMWUNjjDkVEGAU3dtiD/+ldFsmwWkdcV0JJ9MwrhxGqgH8xWCq2D/cBCeWYM0
	N1JsBfpn3p3WOi1ITzoRHewgHFfDQCXxfSgWDJ3BbLWQpDHfvNy18E1V9+ZXHXkh
	aTKTkHv9PTuX2IUhEdFymJ6fz6ub21towKGOd63vJ2hkaYRMnWj2QsJw/dlDTMHx
	woNEOYYyZKWNpzQrv0cei9oE7d67Kk4sTKqff85V03j/GQciSjfcuH40P4rlAbbD
	C35xArHk0HTX3h/qxI1aRwgDmwHfi/EuKDVIfMQEa2IExqeay3jZOi+TNS0nu2T+
	PT2CIA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg84ah4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:13:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-890586c53e0so18585896d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 02:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472008; x=1769076808; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IAiypVbNNKr9va4u59sYj1IRIL4ZDpAjwidA5VMHVU=;
        b=fS64rhebldYqqs62/VGprnnAi0leW7crgxjVGR9pknEePOs45JktLGcwkPxnbpb7YB
         92/vgACksi4UuVdUDWrM9gkmsy4ggPIN2cSwcfTTjOt413m7hfIrqR1MiU3KRZjBAQAt
         nc+3zyXU2+DPRXO5m7YVSCoAtFSO5HosdYuDsEFEboJKON8ZA/Q7imHYXzJH1NBOIj4P
         d7NJeQWHCrCi6kniAcQwns7QwrcXsWVSn03PSrDANhaTtFQJZzF2Hso46Lb5EbIU6A0J
         80Xl7Vj9hyV/yHdOfa8Dod+DggtK1tv1OuFMzRC+/DCzH2Aw/YXn+F7/IE31m0ULLHUR
         SiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472008; x=1769076808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+IAiypVbNNKr9va4u59sYj1IRIL4ZDpAjwidA5VMHVU=;
        b=TNkjSWioDvGU9v21HCWH3n527gqE8dXg/HlUVsmgNx0hZzwr3z+wsSiYOvKoIPegIm
         NyRyEtGb5GcF9EED3qXJ2jhydtzCgscz+6evURNirU3Ib2wF1+YuObDArM6AY7guhgl5
         QtkA2Oxo8mS9AY1eErilq45VfNkT+fIdZ+nasaiHZmzGKBAjIHsTr9OJlaG81hEIwr2Y
         uSMZzIHZiVVqw3u5Knx+eALjw4Q53skQahtsQhQSdqkRU73+kBOlj2AXXo6+uFMqiBms
         2dWAVFwkor+hVyBY7nG28iEje4uMZDjriklLi5NoVBeGQVbrCUoynxZhF5PVmXdEc1Cb
         yqGg==
X-Forwarded-Encrypted: i=1; AJvYcCW0hYR/4cIfU2REayRTrO8tKKAkS/SOS2A6HYnbseoMO66vXC+iMsUFRUoyMF1PuDQVrCx/9WMpmGNcNDUs05U3@lists.infradead.org
X-Gm-Message-State: AOJu0YzLFWZ8uvO6epGudtAU5re4d13aLdT4P3C1rp49ad5cDUrtsleg
	1nLMhliGQ4ACg6uh+gFpV/isVh0XeKQi7LpNjcDmSMiOtSHaX7SNuffO0141JNiLuaWI62fOLdZ
	dQofwPZIjSi33gdlq2OnMqtgTVBp4k7KEt9iybh8bzz3T/PpljhBZ7Sv1+lbDGNooc7eyn4NH6S
	nzVw==
X-Gm-Gg: AY/fxX4dinZI3KbppKPY1hDvNpyflyHzYNJZ+EJpULYMcloQQkLLRip0gIiU79ODd/6
	kSZmuSvH/gQ3jgSpyqXp5VavU/9hEf2IkSK6Fz5cmrqbt94w4VYkj96Bm62CCETvHV6OVja6nj0
	UPfCC8wDaXvAICNZ+/IXJ9yF8QowYi+ACnfVzBImwRCzRxxXh7F8BHhiYgFyGvCFgy1hAPrVVZG
	T+glur/0UBAICkaT1CT6qEYAeXPZNeSy8/XoJiPJN3ssZEpUj7t+507uDWyNiq/CD1W/x6rf7/5
	Wfwg57QYbdk+XvISLvWEsWIHt2aLx5lrowKvV0jzDcEfOdJS+0Xq3S8NiSKNCj8rcrsF3P3oL2S
	ApYYDtNkJbNmzuCYF/M9XuLmWjJvQQi2Pz9AYs1OFEMh54N9/ieRZ+uKze00KfXpOgsLnY6fZ3l
	ZE
X-Received: by 2002:a05:6214:2b09:b0:882:3781:e29d with SMTP id 6a1803df08f44-89274362a8fmr76524606d6.10.1768472007796;
        Thu, 15 Jan 2026 02:13:27 -0800 (PST)
X-Received: by 2002:a05:6214:2b09:b0:882:3781:e29d with SMTP id 6a1803df08f44-89274362a8fmr76524156d6.10.1768472007315;
        Thu, 15 Jan 2026 02:13:27 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:26 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:39 +0800
Subject: [PATCH v3 3/5] arm64: dts: qcom: talos: Add CCI definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-3-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=2240;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=IAlQ9wjSqjHi2sXh9LPkom3twHwIndc2QkvvmikUsaw=;
 b=BRX2gKz6e8V0TWE0Qdo7jEe8nKdfVoDB1q0PAiVCcYJ53QlRwT4om8ubdmD3nmrj8eDbHrTdy
 Ui6NFJL5ESiBpewiWXg88g6rQbTsH0wl+pzV2SHQuyQA4lBIYCzWsTl
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX6eLoh9e9YZfw
 x7EpKVes5voTeGpjiIrvWcib3+tbSSQp6hrv3Wqp7RGp9nPfVeA9IcGVaNtPIRG6fVkLD47eOcZ
 PgLQsy7hBWGqBKjZIV7NkBXJllmTLMInMJRiX8J2wPudaOvIVptrcoJXTQhYBdwEVzetEcERae4
 26rypaOSe07P/uycMTYT7A1H72JRhD209oBvjWi03wk0/KIC4qN5Z8VCMBxqfU5YWvEjs0MxI4c
 zF0JX9PWtfMNvCEIXVY2gTvQI58RXcWDkDneHrCxF0pLaoeI1eyCF/cwsxCGMcc8tgxp9duY4GM
 snHnr5jUMUuFsZlpNElDMyL2QRndcYTsERzPuVPzfQO8CdR2awd4NBdunRyyKDz/VvkEGckF1yJ
 9iOrzWpE4PgwDRkpcbBd4K9/a0ctdPoVfJqElu6d97nbpYmSoPV41BC/OTOJo1OFExpi3PyhD6E
 GPIN+YojTk5Jduod4NQ==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6968bdca cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=RMWakvN5gFyazINGlFsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zDV1K8KKo5Stkdhxx8tVnYaK2NWaVhYW
X-Proofpoint-ORIG-GUID: zDV1K8KKo5Stkdhxx8tVnYaK2NWaVhYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_021331_433000_31B4CFF7 
X-CRM114-Status: GOOD (  12.93  )
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

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fe59975d56d6e65163dc7fcce8e08c50fadc3786..162bbe353b62342478885f22972a816f1b60d820 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1554,6 +1554,22 @@ tlmm: pinctrl@3100000 {
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
@@ -3790,6 +3806,41 @@ videocc: clock-controller@ab00000 {
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
+			clock-names = "bus",
+				      "iface",
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


