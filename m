Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7905CC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WghKy2QgIFqNw57MRraz0/pbpdCWerjS4CjNHDDJT8Q=; b=dzyvTZIu/PEyFBBa+Ee8rtGCvf
	VlGkZgzNhWPu904qHiigGDfR9F4CRV+pSNaC8DJLaIaWC9ZUpPvFqi71y8G4iSRJtHtgjVm/PsSDR
	vhEBMD5zOAf0uZ8Q+VJAYRTj3t19mNoGliRvi7zTbQYkVtevzT5dkSQUAaa6ME9jeiVBsMdVXJ6zE
	zDL1lvSTtyfmHwzyfBS82SQcXacctkNHvY5EhsxC3/50GERa800MxIvNlZWK6jAJ8mJTX030UxsEQ
	oFKJYuOcv8My9rhrnhWhr5pE5AWqKf3NzYf1LZ4E/AbCwKXgC5TA266UIiGHTZb27Zh7iI43BvDBI
	ZjZ1rMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrc3e-000000041Wq-0aRv;
	Wed, 05 Aug 2026 13:53:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrc3b-000000041Vv-3Irl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 13:53:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675DHES33313592
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Aug 2026 13:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WghKy2QgIFqNw57MRraz0/pbpdCWerjS4CjNHDDJT8Q=; b=D6OQI39Gs72VHY3B
	OUprlOdCdsBJPlPvLVqPnNxYfKGs68oaiT3NvSiusDpDVfBlzoC/hpQ7wcdeDbgQ
	sToq0pu/q2b5o+8xUNGYb4kdkw9A/J14b6xZnnfpUJu2XpWpAiVZrCra0wKWBuHl
	E3agT+ZrPgO7vRlUmqqkPaXFNG0SgRUAhlcKXVMgHfxXktrAjss0Pr/od8CVuD37
	gV+6JFRJsSb8zhkAkp12dvgHZJSBAf5sgiWhHp7kuJn9Y0kepoxjs20Sq7SwBXHC
	JRaYwuA+P5YGFJhLfs1+206qkhrnVkpvSMUvQ2wCaWu+sTZYUXPLu7Gn5mwx+lLk
	B0DRYw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5r589-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 13:53:18 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81cb01c07b2so16990397b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937998; x=1786542798; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WghKy2QgIFqNw57MRraz0/pbpdCWerjS4CjNHDDJT8Q=;
        b=KTt14H0VwO8WOCK1qaHlRgW/kPUDSYrkWemZJ0sAAM/hp/R5vZBr68ww+0fq7GZq+l
         R89+LwU3LESkx7Zj9nVl6RoMNeCTc/H82R5ZMmAfD7Ii59W3BMuAIxPUcYWk0Nz2kkJx
         IH1lPsjNsAWTqr/qidBTyBCVRcshaafEG3mnHCMlQYxtVRxn0k+eF31rly1AnsiPrwq9
         F2AYs3h0iEMvAZs/24Dr6rA74Edcn917wol8roIMlWzyKg233AqYzCgPuIVznzqFMpfm
         W6AnfsD1/yctZtRVclJvqzTlkjkmcvLoTuUOqUCpPtMJLE5Hw0Fat3sb27SKyfZMyxVK
         ePhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937998; x=1786542798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WghKy2QgIFqNw57MRraz0/pbpdCWerjS4CjNHDDJT8Q=;
        b=jgNfiaCL1h0R8RopNL5CvmvcqIJHpzU8Owykgkf7wDMGnh13Hc8xl0Ub+BVSQrlUkp
         waZjTIGJxp3gA6TBLXUnpviJWH6NqE0AVOMCdstR27Kz6xp8aU9T8Z1rITXS3uzy6oDb
         QjCR3D7F9iYx92C3kG9JFNmQIc1lw9SOxFBK2YVb5ZZ5uTh6FWNcS8ZUsJB/jW6TA4Vi
         VGBGScs1DqGHKQQQAsAuoz9dNI+mwd2k/N+TCgD47Cjy+8Hy1C4LEhCRfJOJyK3nOTRE
         6aIwFsHsnKPU/AGUM8qst2zw2PdDHqTw+cS+We0+ML7rHkBCRI7AwCxSTCyTUGixiPvP
         O/rQ==
X-Forwarded-Encrypted: i=1; AHgh+RozvGRZHMqLFmMvs5XxMNJNZsGJqLRx+SLjEinxHiv+l2BAmQ7HBv7B0eBobRUnYnWMq9UVPY0o/oTQI8kH6mVx@lists.infradead.org
X-Gm-Message-State: AOJu0YzYN57ZotW5GMpgMseMjyPh8i21zoIkRvjK/TgaUwAIAaYS6MR6
	ikncBfYP7XVNLE/KjDpWYwx/K4Y120YjHSC3FLgZ0GO7aT/hqwb5jPnC921iq7OqPJc0qriB6pg
	tR4Umv+fkJYgE8tO7YSXtQqM4nW3Bp713SmSm3vJKyvuWWgoNwPt6npdUAZgTFsFi00wE0mCQqf
	vN/w==
X-Gm-Gg: AR+sD11IuhiJGfmv/XJzhBY+2rTeZQDMzmbOKoFA5JT2pSC6TurBg/njA3hGxXL8iU8
	ZOMZqA0K7km3yGc+ztm1go0W0uEoUtIR0NFYH2x5PK6G+cZxVyL5X+IG0TL2oDgC9Y2WKaq9ov/
	YaHur3AwFklhPj+h3RcgygUHM54ALXtBewQFAr54ikZ8jTt/JEEtx9ho9KpUAw6wVffkaNc7tTF
	tNIKSG2suLfwv++KSJFvhbp9a1MbPLTLnq4RRGl74a5kFakY3lBROU50OnU84xzsbSJSen/Q7XF
	aUK3f2BhfdwTS8mJdUYI2pGZ2+MlqTvAoQsLfRj8ns/Xe6eaKjTmArul50LZcOGj3Le/YUlXuIw
	TW3G2wedp3kp3C49DhxxK+taXaNUmXmE=
X-Received: by 2002:a05:690c:23c1:b0:81f:b410:b214 with SMTP id 00721157ae682-820224e0f36mr36672517b3.27.1785937997980;
        Wed, 05 Aug 2026 06:53:17 -0700 (PDT)
X-Received: by 2002:a05:690c:23c1:b0:81f:b410:b214 with SMTP id 00721157ae682-820224e0f36mr36671977b3.27.1785937997363;
        Wed, 05 Aug 2026 06:53:17 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201320ec71sm20892517b3.12.2026.08.05.06.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:53:17 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 19:22:47 +0530
Subject: [PATCH RESEND v6 2/5] arm64: dts: qcom: shikra: Add CCI
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-shikra-camss-review-v6-2-a8dbc66f0d87@oss.qualcomm.com>
References: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
In-Reply-To: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785937970; l=2668;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=AQmvJX6Nuci3e5n5qvrcudWGnYySqxNcGkS/kJegtyo=;
 b=a/wikjRFPxGG3nl4SJTiUqzc0Ku7M1qEAnrloJHSLS5eLVpA+ur2kXi9sKevQB5LgmLo3IcQk
 IEKoapUU/R+Cwo/07PwujCGvGWLTLFulI1t2tV2DnYjF7zRfvsilRUD
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Xea5Co55 c=1 sm=1 tr=0 ts=6a73404e cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZbC1Des45MQyGPwI-hwA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fvObRNK6y3u1098HmQ18hjEwYa2H8Iua
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX6n0WtYodoPQO
 JdVulsF/ZBf33Ch4rTLJX1fhHbu88NNYauKjrrf0sYXqTB2yJpHV7BV6MQfKNqBVn/FeNV+Qp6T
 3EApbCzSBoaLHKuxW4l4GSjNKImmOrpPoNIK4c7Y28acWcpkMim1j88/CMb2i/o/4WzXk06Ue1G
 U/BVx7odtsErLuY/N9W7n+Fyb0Yr4TcVc1nrlGifYRA0crENnG1duHkphvEbStNY/giLTxytiLj
 Hc8oDoBX3muuCx+xMMIInbxG4p87xSu6z2G85M2ofQv7Mv4JFxOL/7SmAD3RiEHhDFyUEA7gk7I
 8gERiBWhwGx7zKA65QYzlf3tk9tIOAOAOUH2nUc4cVnDIdYLAENWgKA+mXCHnSwP0qiYvTsMl0k
 r/a4sFJMxtTJBs91m5xWfAHm9xXHRuGb6FGTjbRlkVIRmduOGFti8ngoJ4WEsXebYBJpudEBymx
 p8TCBhebV88t5y4dKCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfXyugmybWrhJ2D
 Yba35iBdJdiD68j7qhMZCvW6J4g01FSaJ3t1mME54O46PyV+Qf94gwteUslSwaBieyFZ8xmNGhv
 3i2EelYsabmPqeS57WkhTppTk/jMuUQ=
X-Proofpoint-ORIG-GUID: fvObRNK6y3u1098HmQ18hjEwYa2H8Iua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_065319_947730_EAED0D4A 
X-CRM114-Status: GOOD (  13.35  )
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
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2e5976861253f4402c75509f52301c21e3864d1e..ddfcfb137bb29439ce20ba6ebf3a76693792b56c 100644
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
@@ -738,6 +770,44 @@ port@1 {
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
 
 		sram@c11e000 {

-- 
2.34.1


