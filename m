Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD50C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPZHmS6h/AcJRV2idSAJRkkNucwFXp3FnUZZxD2wUGQ=; b=smYzQOOP3l1I7+zETmGnH7TYhB
	kV4eGVPiupr+0bZv07gtQBbjwrcdtjlChCaHqvxh+7llkqOxfNKflplVLnN3Y3a/DH9tqhgBPs6Qj
	+dddW9ywcsuZ7ba2Dl7OGea4ONelSvBzHsKkb97w1J/BaBdXEahjH9562WSTvJan5iFxt+onVEvia
	wFJIE6hsydXBwppcNbGaI3bjklRfDDzjj6RHHNaQPwuLRKTQdwDn1BXSjX/xACzdUlImhgGbKi6Or
	3fQ2urELc0a00zXmeCXXEvtiYECtF7kWsx3DluPDQUbvzB1KeWjQDy7jQ/lzwPrVMXT/H0eZMb+Pc
	cLwakRBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCyP-00000008jHw-2UKD;
	Mon, 13 Jul 2026 09:29:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCyM-00000008jH2-3FDa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:29:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NhEI507024
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPZHmS6h/AcJRV2idSAJRkkNucwFXp3FnUZZxD2wUGQ=; b=eWL33Yg/FdDF8gik
	hh9Q5gFuv1X4L1wriQAXWuu423D5iDCwzwo2LrV4USpyiOLFNLg4MGc2WejsLyIA
	kVBgmZuoWjZGDeSYxUdg7+4bHnZnP52sNzC6amsMXsnp0TjwZbAKNUuBJntb8LZw
	vmJRqq50sDvhtWJzycyUQQfacceKJ1WZOBHMYI9z0L2WM63YMjRsE4ppA5D/OgPD
	ToOKd5heWqm7AEaKAnFl2rc7M6fyZSZqTVYS8GJVTbwNGpAFTJvwl+umFgfYSxts
	jB8Ig5xSVmhb3w5zJ+QXAcS/ECMNo+UITDGtpNt6GR7tf6CHR15H6wsq2Zwt58H6
	Y7CBNQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8gu73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:29:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c892143db7fso2782946a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934950; x=1784539750; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPZHmS6h/AcJRV2idSAJRkkNucwFXp3FnUZZxD2wUGQ=;
        b=KqlHu+rsnkKin1eHqE9ZNbNNV9kwdKCn6mNCYHNninASz5HArUlmLu2xfpZpOc7DNt
         se8+yxEnqOOOEkjyA4o5eIN0vnDDpKFO1MwMkKNycQUxSetozDhSiLy2zwBIvpWDqMLI
         rDIJAoaRBMXGw5YOcv/tQLEGiTUgAM5A7lThXNfAA7k6BVNis0aBbfDRHDegX6p6h0TQ
         yDEI1rpVvTYtYbHNeQUDH71Ti2eM3Opjb4lsUgKqMOKi58bw7nn71SeBP/yAFz+FWtA4
         cScMChtXyV/h7PvQ9QKJahO7Zf8uJzgp1Xbc8+ezuQRPqQgJQgVAnTyEw3uoX2VAIw8S
         jx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934950; x=1784539750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPZHmS6h/AcJRV2idSAJRkkNucwFXp3FnUZZxD2wUGQ=;
        b=ryQwuivqDCGYW3WYACqUXTOYi6XpTyb4xlnbJclvCTYUPE4014lYVUD/sUKZxze6HN
         yIOYh9g1dcv437f2nrMEGjLiFIMXBIX5hUphSAs6qyYy/vPnQgmelsUKAteYtRp6YcR3
         jLkMM6pX0IuZF7WYtYUiDjSA9VuGwmqIs85zgFfjKhinbixW6DQhc9IaM01ok71SAdip
         mSuqo94RkdQxlYe3hn5gwxU87Z7AL5RWERHs2+2JaaArBAUPNF0U9p6SmWSAZjNg+lC6
         uoSZz/5kGJfpcj3KQV+2zn7476nV59Vea3pj9oXcCv6YzIm1nsmRtT1Zpb4AxXjm/uhk
         wnAA==
X-Forwarded-Encrypted: i=1; AHgh+RrzKC6Ta/4gf2asyDJaYiuWq0RZ13n8+HMl7LGZ6HDVRF8oeH0Pqn5w1mK7tqpw7J0Ud3WPIW4C5TISg44c44+d@lists.infradead.org
X-Gm-Message-State: AOJu0YzxHQ00AhCA0qf0warODhrPKf9bhd2jomvbblwzi3vsJYVqblDv
	rBSnp54fbKcQwL1jWDllbjimxT3BcH7OdKIsMAjWArLqjg+xElmq15sJvbD5j1jmkVr82g453eM
	6RVfub56FZNXolf3w9ID0zu8INjWwQvcEJg5deenBJHHY/qQALsQGye8lqzGMkBuEmLu3DuT2mA
	arhw==
X-Gm-Gg: AfdE7clUn4tvPqorw4cpGWq38s/trZtxufD9q/0FnqfNiNo1w5Ty3tM+sMvgNbS4gKl
	0iQCxF2SjAaUf8xjX0KW/S2Z/GDBdW9jLgmC4AcYXqsHsa8ui/+oCJUHAzPl7vPZ/mqDMuYN4vh
	qe+b1+3GOOJkHmedpajGxPFQzh9kGa1dIG5Tl5e7wDRCRFC1gwrmd2rjGsY00Ss697Hs10JP9g2
	0Tgt+Xp/YdLdVKV1fwScfxZ3WTaSh/I4McMuX94N5H8pnkhOO68e0tmA/Uwha9HKMyx0RyZcbav
	PjxWU3w+kL/f31kmvCSax2xGLhS/S/vCyiGsvO9yB6z/tH2YgHeuJ+H4AIwKVvBsfasjGv0wex2
	bjmrNO+WUl5jXm1z1uN/riw9ZZsUmmaXNMWjI5Bm13Q==
X-Received: by 2002:a05:6a21:7010:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3c110a73f8fmr8546314637.35.1783934949631;
        Mon, 13 Jul 2026 02:29:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:7010:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3c110a73f8fmr8546286637.35.1783934949195;
        Mon, 13 Jul 2026 02:29:09 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:29:08 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:34 +0530
Subject: [PATCH v5 3/6] arm64: dts: qcom: shikra: Add CCI definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-3-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=2621;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=3DT6QRDlnKNLdhYLJ0aWsJwYiHRrU9kcv1vYTABy68U=;
 b=G28wrDzWu2NzTARFJ54PJ3XxhPcMa5sc5Ppjqr2j6H7OiEQ6JhJ7NsLaMX5AT2fjmUeLDnYUz
 kaenrXUlaSFCGevPMgLBSABMYZai/+myb/fnRfHumo/yKYXSWY6FdhW
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: WlVl_kUS_ISt3IubXTTVOY3EItM023oI
X-Proofpoint-ORIG-GUID: WlVl_kUS_ISt3IubXTTVOY3EItM023oI
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54afe6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=s9wsCz4ZXjtKvCKk99UA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX2kBgYEwTGvW0
 Ni22rtaP1xyp0S8bOXA2c83nOT80C1W1XDD3oideSMa/72ezPYPh16czJ7yeQe5aOVkmOYsZKca
 OrZ+cNlFdn0fDT564xW8bp/MLSv4WKk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX1UYLvhm+oh0y
 eKNpw60bzfiJz56Ui7G0P11numsJgGrKtFus+mRBq2lYGb2u1nGSFypZmPCOhQ90iYxx1ycTZ1p
 /1eopcAfV/iHk3oTMIlQbb875U/GzZc814ENtTho4qPs2c2fPjUbJDAxyd7rG4acvgrH4gVzUgY
 upSHFda+GjiRaH4zZgBbuN8vhopntfguRvK5i5Dfe6irAziIWHwmmiLtAGcycnTkWBCQ/lu2h6A
 tLn5zMh8UIP1hVCRuuM3abdCEPvymcCzGHKClb7Ia7yFw2tkQOWDvu/6/0axxbki8SlFHDReQiw
 EtzT7h7MM/8XgS7KVDhpzRY/y924gU8kRqjuRVZ3wdoQ5gP9iJtRaL2TXyyq1YhjXu/c3ET7sWK
 jt6z8FmS+hrqk8Ij3BalCeS8+qIcO5h9mZni4qqAErtEJ3JjQelJj6CBgai08kmu1XTU0TPZi6n
 K3Tt+n6cnEuJMKRyeHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_022910_821629_9026CF83 
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

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 6335caca329808ee04d9067f1f95e8075e2fc3ed..18da1380e52acdd8813625eaceac796e342efd16 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -355,6 +355,38 @@ qup_uart0_default: qup-uart0-default-state {
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


