Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971EECD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=; b=EkGtgSbXAMHlObIs3IdtI1IbmU
	0VAagWkP/KhPBZ83ew6GRhQ0LDbXCJ2TFky+T2hoXDoed2mX6LnfGsR8Vda8BAlYqPcep1KOMcNd+
	rH0Gle1ek6edzLL4vLOL2x/ddNifXKUbxSM296OVzitCkVRtc0gpcioavgajbsC9XPd+9JHpVSczq
	PJxRTrTMLVSY5CeREr8ZCxzfwxf7xlthuDJojNjbj2Ut74/g0jgzk4l1S3pB1K3hRe3d8tbWTqZt5
	yl11BbaTbh+S1Efz9kpukV+6LopPm9VjVN4YbCT3vap12AlBayRoj38XwfdqJ60FxjtothXfBMPsm
	6L/X8LtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1VJ-0000000DkLO-0eeD;
	Mon, 15 Jun 2026 07:13:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1VH-0000000DkJy-1FQL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:13:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KvMk3828173
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=; b=gV3FlwnS+mMU1ZWv
	NefsMOoZi0YvbHjNcmXp1y00j8ErfHcA+NDQ/FbqApJ0LQpSJjVRzVh8e1HDPquL
	OZHwWJ9/E6J31dvmgifx76e2BDyOtAwm+C9AWjujwPNfpN5+bZqgGId7JDZFfQao
	VYg3bDcoktnId+//Lc6vusY6XTiIkAc/6LB+bzry3tClfHU5Rawmg99XCIDrrAP4
	Rn6Swe0so34bQzfsMMvuIQWGFi5H2ND2gkZAFmpR5aDkSetiw9lBlNf1PpcLc7oV
	a0PT1JAKz+3Rs/2lOBPmzN3XN/Pk+pAnJf7Vse+killgJ54VQpl8ikNMwtqoTVmH
	C2pTfg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u64dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:13:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d6389bbf4so3302228a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 00:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507581; x=1782112381; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=;
        b=YJcWkYB0dJp9zEtlAISLzE9jbStjkiQ57JWWwGMWsZ1wPn9QWexl4yxuRZM9+LajQV
         KHqWJaOX8rLDVdpKRKFCfTrm7lWSmeD3Sm30EYUFavz8zs67Vvgx5MixjlNrQVNIQs1c
         hkrBPfh7/4IINoHvCekV3sZPtRy7KsmIt9O6BkbUmx4KuUd070zbi3SM1LSN6M3AaBLr
         mgtgESUe0p3jyOwy6tV8ZZwIVNX921BbmLy/IwMcej9ZgF/irHBVuryaNxz/mPVJkOQ9
         6st1ZSCLlNfTbyppiR3w8e4ovNtqSUVe9rzOw9k2yWIZxT06Wj509FIhLuW6l7qqJBe3
         V0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507581; x=1782112381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=;
        b=cqOFyWQPwVzym7GXuYJncoORufTCGSNUOw0M+Vtdq/h48pOW0fFclFnuT8JAwJQktz
         Kh9HryqyS48aGzvoYLame1OZN1mmQKjKK1qt0vLpzw1exPmai4bLQwmw8SOU5lnzUJm4
         66Jhqs2zzyNZJBIFND7Z4KSqCuT69BOQxubGjqxBe369OtLNLFk2YQpn52ljwlqkHK2p
         nan7EShDojrx11Iowjk0SupI4Buz8fm6E6r5XDTMzN6OlF1ouhBcBQPxH7Xq9/YEzTBj
         twvadIq04uJC4jalLXZS1c1OOrRVIkIDqPhXI5v9XAPfp7quz8d1ianDBlAcMpVXhs0a
         zWqg==
X-Forwarded-Encrypted: i=1; AFNElJ+7t7VSI5r3FLfuToEWr0wMbfzMxmGg2aqwQl9TZq7o2MxVMixLJdmxj56TTK2pjq6U6ztRSbdMNkrO952TRkLQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7LsgADGK1RM+504yPUiU2ObIjbvr8crpLnb9MFuvllSnZouFU
	oyTAYGJxyTTqEricZqTyGHFc/F0rznaNKrKDde8xBvbDhDA1tqlPi/eyKksooWQ1tXXhYaF5pLq
	w/3gUW9fn4vnaHYR1qLbDxXqXeafhBdDHUniOlseG0VVGZRE9YMmzVunnZWvOGXlvJMQ5ENlkwt
	CA4g==
X-Gm-Gg: Acq92OEuC9vI/BtQh+qUEyR1XZYzTv0lplrFJ8CN80yZiYtkTNZpFUmYi6QDr4rmW4S
	jIwjRzKzTg+nJgzlOcDVElcfOTmuK/PwicFpCP+C/jl3ZwwAN2Pz/hxGBe/NmgIQPny2+KHkXYN
	TstpwNZ0d9BYYS1FaqCLwNNNHs+CHpLGmbVTe2ZaPGczZG+4tY6XRZQax1cJGS0XO9C1EnBQ/4x
	j020S7IZOkjCWF7sXQNQPkF/iXLAxUUdrCMAkEGjRqXEaR8vy4i14asMKghkr87SqufSCazIQ42
	+KEpr1ya8zi5yo054Q6Bp2smPmWlXvxLBtFHvUOIkGRaUrYZ/ZbflfzbI6KKBIutctoAAIAoO3O
	HyfZKgfLv8qiXTGaVeNVJmOgIyfA9/R0GDDQUSDjpcDSmu0jQgZj1
X-Received: by 2002:a17:90b:3fcd:b0:36b:91a3:6af3 with SMTP id 98e67ed59e1d1-37c2bc6534fmr9768858a91.7.1781507581231;
        Mon, 15 Jun 2026 00:13:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcd:b0:36b:91a3:6af3 with SMTP id 98e67ed59e1d1-37c2bc6534fmr9768837a91.7.1781507580798;
        Mon, 15 Jun 2026 00:13:00 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:13:00 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:14 +0530
Subject: [PATCH v3 3/6] arm64: dts: qcom: shikra: Add CCI definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-3-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=2667;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dD0P2j8Nr28ZbmLTZrfr3Iys+tRkC7smVwGCVx5OZpM=;
 b=MiksEv4dAsytiqn9yWeQj/J3Y6aswxj9dbZTN7SqEhZdVeiE76C0aTVUL4+2Glq3iaO6ojOUy
 YlvQyqQKU1MD6aGx2ZSjsRezHKfmluPRHuZvZS53PBxBi78BTr66Oqw
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2fa5fe cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=s9wsCz4ZXjtKvCKk99UA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 5ptJPgc-IWmk87BRWnjv49BfQDOx0Tyn
X-Proofpoint-ORIG-GUID: 5ptJPgc-IWmk87BRWnjv49BfQDOx0Tyn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX14g6lZFRlJfb
 e2EYCtAV9gPs5OibdlWY9uo7dtMRtdUoF6iwU4Du6/DTf0q8+ZsQpnA+912BbjX0tuiFDv2Ubg+
 MKk8Ps6xPnExEUD9Ut1QA5D2X01srwV6ZNJ2Eg+i3pCGu0lqfjWLAoxC78B8KbYwMshguDJu7+F
 U0yz0h0+v+WukB5slBdpihhwGALegBZ515E7WN+/VQvi2caL7ZLtxXDjlJTh9QF7hyF8C3sPlND
 6nCyn0BBoU1ZhAbUWj8PEP2MBTx+7ZxZGAxVDIEruushIGyIsPslOgN0Y2TEug+Gkmky/yKOiIJ
 Y18JFc3J/f8ziq+r/yXMT/o7j2BEVl/7TKO/S+pG02ZtlAPdGPReKezDMgnJVSS84U8nrNn3MhV
 8ps4eidkBwFBQhT5qw5v74GfwKWC4LBLKc8huX9FhjCT9OIS60gyxmC4UThpZULaglyf0umKSzS
 Yj29YyXoqXEl1LAUI2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX8OnPbAjHyMwU
 szaGiq1ojxb5uKk1t6GOAFCnIad6y+g+9+iB2vL/rmSMiR0bUOkzu0OXEkOFbSkjObuyZ3yF7CH
 QKT/vdY8cziCcOOhS//BUh97us3KYJ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_001303_464306_3669D2CB 
X-CRM114-Status: GOOD (  13.52  )
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


