Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420C3CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXVCch3h5O4NtbeND/2vo6i4hR0XUpgBJAmZ8skfrzA=; b=WPnR0Fy3Ac1DdBZlUaW0KS6T99
	XHiivT8yDRA5UWjGT80T2TiemTpv6U9RVMZ6URuOK9y2XDT8cAg/s66H8Dxr7Vqdr5qkfmW1jpypq
	c+U6CcZX/EnTWdLoB57GwbSqZQSxRs/hjePgaLNo2FuyaV3ug2mIVizf888bXXdx5gxMKWS86xsdg
	lMkDAUuPdqoF/hvoftelHY6g/YS7Auysl6oCadbuOHAXASPOn49OdmJEV5RjkqDCEgKpftdi8K7Wo
	bi9sZ8XvcHTqyIVDMo1x9UtxGp/O6ost6yNgCwhOutGbmI159BT4gjDXxvFG6VlILAhg8mnAcOXxF
	7gUsMOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvLW-00000002g5S-2nsJ;
	Tue, 26 May 2026 17:13:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvLT-00000002g3b-1lqR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:13:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH18P72164158
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXVCch3h5O4NtbeND/2vo6i4hR0XUpgBJAmZ8skfrzA=; b=Ie5YclooSa+2jjm+
	azDNWrWUux0GlIlJQMFIR2ueQrGqWRhIVaTDWjADBXdx99tdFq7EK5gZlUDT0BJd
	kehYR9JUwXNRi3S79lpV9uG06MSYShkJDdW789uCs4ew8ltvPxf+CK/H47GWR/UD
	gybrQBqbJVJtCGnLlUvA2muzqFi1nzrGAY4zuSrM40cXmqQ1EgkbIrd1y7s0b6a1
	6AkIIq3G+JjnpCT3TD4WEt93mNQsHvzDw5bjovGiAOaBdXvT9rtBFexVWCSXUyKZ
	gg0M+HnEDegjbsDorfS3H1ieWPWjyV7woA45JLja91RCii46p1L5j4JOw2J/vm1z
	8ePCrA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwwcjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:13:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8353b042152so12059093b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815614; x=1780420414; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXVCch3h5O4NtbeND/2vo6i4hR0XUpgBJAmZ8skfrzA=;
        b=BotSKhyRK0SB2nsq/RkYx6zsIDnLHq1aJOy574j/UCiRC+lG7BQUp27G3Ehz3xU+oW
         ZPACZCH8wQ3nl6ADfrtnqq+h0QEa6IctmBs9qL/4bxZbyJeKCfDJVTTmPcT21e6Cp6fl
         9SCXeoDm14jAN40ksH9HrUkoS5za6ryZu0/H/JeKubsCi8lcE2jjyind1fnDn5P4PFiX
         4Pb7IO1+2ByLIujMWPj50KjY2ZbyAhwQRBkxACWBfy4wpgnv1UM+hUUh7OVRlRuNVsNG
         MtS8ULVnzoA+zDRiX7acpKWZKfv5AfFidV5C6JK6Xn21mc2BSklwHax0TsgSJt5XENgm
         KghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815614; x=1780420414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XXVCch3h5O4NtbeND/2vo6i4hR0XUpgBJAmZ8skfrzA=;
        b=nKrT4EPyV5aAwp9RG08cILXocRHIL3SwSAnvoEQ7bYpMHk6xAdhOwEUTAbuAv2DITp
         f05ks2TyiyEvDEC7vhQggcgy9Ln4z21n9kF+IXBLVLIK1qhu1uZeA0hwjcYxtj7VeY64
         nagb1X0wmk0H+y59hohRXfLC6Je5+5RpX/TBFpmYPSBzdU6BipS8oQaJtJP4XNn/XlwN
         FDDRaEAOQHZ+ZZaNlONNvpn/1DeXI2u3CgMeEqYac/lFX8J9j7RhJKgq+K1GZE4mr2PT
         hAoGgK+VAHngmZn4Z96nBux78+gGxPJenTRhbWcb1dyGi3iG/WlUVwKWneZICHinAxhY
         CjYA==
X-Forwarded-Encrypted: i=1; AFNElJ/Wt+uWnSw1yhKXgiDh/tC2CArg3iWg1Z71NtFmeodCCXhmn3o7mEPUeUqCC0YzpqPP9PIkx3wdo1GXR4cPcdX9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7cnGJ8bawwmbrATFuuxFb99V4U9L6TuXL/DIeV3OUxxs8mxmW
	h2fCm2oAkYD9hK3lClUTDPL1c6id8FmYESGC4YhrGVW6ePWrPUE6qDBuxHN5utYPabL0PJnGY+i
	YSprsZf6v2/gAj0zMiRYp+T50WNN2DFowFQ7aqoT9VXKgHaC0U4VecuRSuqWCiEEPsYE+ZPZeGd
	VlPA==
X-Gm-Gg: Acq92OFbjad2HtkZUh3I5cxwfvlN2eyeKmUqrGjgoF+/13KFnJwT229UxVqrR631V+5
	T9JvgXB5KOpHW6vU4ci025I5Y6vsbahGVg12yyItbSc/hLJ5tdPGFhmxBqa8sjEMbR4wtyKpWOh
	lOcu5jd4AWTZT5K73KymPvPcu43TKm4SLGanVPi5/z/0xhgNkrqabgya6pV4hlkhIR70jeUnHMA
	vwVuXk987M+wK/Oef129eWJPgGxS3G0zEec8k4CeHQThTaraRGd630C4kiXpfStEJ6uu2QQu7Av
	1pvNl4yD7+68fQZsawLc0iJv/8bQZXDp3oCjNFjQxRZsdxH0OmIOXZWER+y3fyRqzlSIqD+NAdo
	X0V9dv8Hr+xKv17DGj44cNZMflnNEiqDFoJDICEJ2FvIzfaHiK6Mo
X-Received: by 2002:a05:6a00:ac8a:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-8415f158babmr19801926b3a.12.1779815614348;
        Tue, 26 May 2026 10:13:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac8a:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-8415f158babmr19801887b3a.12.1779815613876;
        Tue, 26 May 2026 10:13:33 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:33 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:49 +0530
Subject: [PATCH 5/8] arm64: dts: qcom: shikra: Add CCI definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-5-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: jpvEoNjfeEBhkeznEk4qWfi_Ax9uVUUc
X-Proofpoint-GUID: jpvEoNjfeEBhkeznEk4qWfi_Ax9uVUUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfXwR/i0VW0inZY
 Sc/nTktsP4eO7LaW7+lSdszUVND5C9LfcVuNwXscsoLzp2crKQtm9mRGpRdZC9sxYrWgqEsWPso
 6aAMYqWv6sRT/K6pm7mMUlmJ5JD+nH8I1XfbGkfQKhrBNPGJUHYcWN1x257kgWFH65L63qPVEHD
 GJ/UC1s2dqARKt3aULv6EoJ3Szf4BvWes6qXO3KXPqW/3Tu7DWN3uNSxaUBErb1Za0uQBdYTP/p
 xq+P4K4S7SkbkDXhdmm1qnlpGpTjylfpL41fIarbu/GmL8do3785+kSdXpIzlXGIaD8ODArXgB5
 9KPUFI8KrVTbBTgjPYNTW28Qx8vkXzmnT5T72eW76MIK3WeERz8rY3PD/USONgPIRC1DU6409bf
 JD2AuqTN+88l8HjaAMpdipesic5YZ1LxX3KNbv+mRU2vxswLF4M6FwXIr8IxFxmUzMEQFR2UhmG
 j6PcjfJb/wfV6D5dEOg==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a15d4bf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XuEftVTFR-VjiOTT8WQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_101335_471173_05597138 
X-CRM114-Status: GOOD (  13.57  )
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
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 6c47cf2a7ef26b4bb7d7f642a240b435cf5208d8..46de35971f629ded990827ebd76134e652758ce3 100644
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


