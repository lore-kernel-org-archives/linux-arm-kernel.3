Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BAACCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/DNHEe+4Z1utUjpUpHGNxyDDFtPWLU0hZo32AwHpNE=; b=oTOnKN579OfuwWFNitxV0tfa71
	CfxN/RcA9xbYrDhL6ONfL6dWBhPW3Tqmz7spmuPla9QSEt5f9Ch8kBtxZRkoZ9cavWg/WHq7MrHr3
	LgYsbJY7nzY9VjapbOwTKq8K9d2jaddQrxmdTEGWg2c5eZPpV5oEybAf4GTdQdN5g/HxbThuA2H6/
	2dOnxKT524emxpw3oTwf7Nzxhwhv9AcCgmhzVYgUn1kaTsBuThCKKPFpvJn4xcnsYRnMsj5ingLxe
	iYDlovxoSGeyWrKUzv5BKfmwGn0ByEdLy/z8xNA5SflnpS0HJp/tWW52+PaF80Bhnam0hW64qs7pK
	LKinoC3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Nl-00000000zON-3YxT;
	Wed, 29 Oct 2025 11:30:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Nh-00000000zMx-0FRx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:30:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v3Ht3755372
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/DNHEe+4Z1utUjpUpHGNxyDDFtPWLU0hZo32AwHpNE=; b=gKlqXNf23iN6rv3J
	DfXd8ubxqExuHilSc+trEufJCGga6aEv1S7wl2TOYEkEHMJuuFcsbjDzfsauDQwc
	9vOAvxjyuRw97GgM6mAPWJgDWcHc5a7WbLKPi7If9wKT2nwoWRHZfKGkyVREwxLg
	QZDQNrFO8+EvsTKgi084pZ3JPAv13QDff3hslBNS0SVm53alNXxxIgvno5VIJSR8
	hb3gmVed3v0SaWwQbf25uS+MQbm0OD9egnHp+1dMrERh76dlOrXNSqo1McTrSnU4
	itZtlfJP/adc12KLmED6HZWOTIKYwZCPZrh6qJ5raGJvntTPmVBRv6naX3XStUZX
	x3Qj9w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0jbhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-294df925293so7066625ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761737419; x=1762342219; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/DNHEe+4Z1utUjpUpHGNxyDDFtPWLU0hZo32AwHpNE=;
        b=RKwMni75wV6I2RTbLyEHXYj8Ru17JGkdhwMHosaoZVWwpq7cqU2k1uVl5wp4YgNKU8
         bFpNw9z45Z5Gj4t9QM66l6w7GryOS3bBeLqC0xs6O6RS16irUGB/mbhjLBIXHt6QTaYJ
         2dlawxgvFHcXVWXbWLoSMBJUP9I7QnEL5bwv8/rgVKULCbv7oleMZPmhJr18W9e/gxhA
         BTOAsK8gaGUZSfWdqBhy5TlilLKNxSyJJNQPlOm87GgRoKPbEvpdDugpdThXZTcGy9Q6
         2GTCDjEC0F148Ps3kYOajSyhrEc0vNHXFpWjDoZXZ2g9R0Qz1fof6i1fFB1fFve6caqL
         LKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737419; x=1762342219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/DNHEe+4Z1utUjpUpHGNxyDDFtPWLU0hZo32AwHpNE=;
        b=kbOIt5h1Q8Qa1PlYihlG6n51DHvzXlQamrnMoQUz+IugmfKvHgHhCuMhlMEXPyEjYd
         NwhdCtx8MitSPvHaQ4utTZ2G14DPiituP6qemOXBeNryEIY4SCPDT86Omxdzh1XvHqNd
         AlTAY6GodiY1SZO8ZtbvWy+4kQpexgDL5a5WHk2CV83zuFMT0bJn4bbSTuknJb+I7c6L
         svY/iSChl+PLQGFLoPfq7gFV1e3CLF/W+Mf5CCe5f3Rsqyt7s3Fwcknxp8JCP1aQ28oS
         xkeKqECEjEdFMfvUORYzBDwzR5b+M7FWIZmYxU5hlE2C/y0jNnFgrcWW3EfiuNT6kMwF
         I2vA==
X-Forwarded-Encrypted: i=1; AJvYcCV9DNUqDhBUG2DWB5lsRZmygv5pijF8H6jjd+6wXX4cjuYqRWz7isgXsVqPO05o4TlwCDuYwJMKNyjrYbIP3aa6@lists.infradead.org
X-Gm-Message-State: AOJu0YwODsCr1X0NE4pM3UFj7LwfGZGNG07GRfRajr+kPXmSWsADHVaO
	vAI7Ryoir4Kjl6O1rpx0MWC5XSOQBIax/d0TTjAiDMggWBWAaTuKiN2VXxudgeaLNRBkrV/aNfJ
	oWgnHvv95Vsj+41643yM1pLqBEPn7viRttc8GPg6mEHDZfyNr1tMAG9z97VLw5/N/a9PIcrBUPR
	heuw==
X-Gm-Gg: ASbGncttMsXw6NYKLlvSLFSWcZ+hD29AyD3GChUFI3HnklrwRxk1fQXKauyPtu6hgm9
	z6eheDBu2dKOQ0QAuBp9zDFEHYo6UVnBkFzuwjgJCvjynHdGLVDGCPdnhqAjAuTp1DgrUyhCk3z
	5oxtsdJJHR2wzgxZh9EFNOB2OHWVck/NFs8VPmOKhtdxQ28buAFFiCXUApEoZwb3BCmt6UBtg28
	nba9JdjPQnlQt7GPMEUq3w0sIhLnu0xIk9s5yW3riclci+XUkWnBlL03c/PV5uMOXO6LquqKRa0
	rEIkpaKv5EuAw+Ahf4dCwhGdvx0nvG+4jlXHgKVcz6yZUNT4BTPiltCmgWSB9wzpazQjQD06irW
	I8NV4GjUVtqSBrG53HBNxHF6LI5t5ZteW/A==
X-Received: by 2002:a17:902:cec7:b0:290:ac36:2ece with SMTP id d9443c01a7336-294dedfb651mr40425465ad.18.1761737418808;
        Wed, 29 Oct 2025 04:30:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4j3okFkfV91nMkxAanoxMqQ3b60canzISSr6RYrYCKlojn0pZCA+621Wqputq2RMc/sjnAA==
X-Received: by 2002:a17:902:cec7:b0:290:ac36:2ece with SMTP id d9443c01a7336-294dedfb651mr40424835ad.18.1761737418130;
        Wed, 29 Oct 2025 04:30:18 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d429c6sm152154935ad.85.2025.10.29.04.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:30:17 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:59:55 +0530
Subject: [PATCH v7 2/8] arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe
 switch node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qps615_v4_1-v7-2-68426de5844a@oss.qualcomm.com>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
In-Reply-To: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761737398; l=4927;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=HTP7hwkQqboLVMLasC3ig1AuOdloM19T6/dneNwv2QY=;
 b=9TMq7HUBjr7g+iLM4lYpgTANAk/M3I8+KOC+2Hx5NNMsHIf2bYRwidDpz7x0ncOXOSicHPkfO
 CImySy/oR6gCQturz5Dn6Rk/+5j+Mt/DJhdD/lfMEjtNK2K0iXYBYl4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=6901facc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=UN7QK-OhvXrGNVVRcS8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FTjpi5DrNOK2a1TM3ui1A9sb-msxZP-3
X-Proofpoint-ORIG-GUID: FTjpi5DrNOK2a1TM3ui1A9sb-msxZP-3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA4NSBTYWx0ZWRfX0iDlqFObEY1A
 8X7ZwQHfyldJKdwOxs0qCHzNjvAHPWNWvDEfJ3labbYAk9xsIz0/InDXyi+SW/c5kRDhIac8VdY
 Ttfu/06YZO4CwzAqbtj175Om3KdfFlaYS/2FK7LRt+2RQxwm1arEnaeaBHnJz8cht/fVB0XYWM7
 sR7ejj6pqHunhoQu1gl+VrvVXJoYe4SUd2CW1sOsQkbT2oNdL3yXbOWdQ7jKlb847fkdJJg08Tn
 +Wx62MFEsQibppcczbCw7eU3OCICUvoYn8KGpGq3UzxveK9USAk4ymY6GejWew3P8e4YauLh36A
 VfehDlynMozfManQiiv6k78gSxDvjWDKsYlApwnpxA4NCSMSM4hfFjfyH3Bs4VwXNTs1/2T9uTe
 9/BqvLDX7hQUCMYc1fxEvBUbrDsdrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_043021_221366_439FF695 
X-CRM114-Status: GOOD (  15.60  )
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

Add a node for the TC9563 PCIe switch, which has three downstream ports.
Two embedded Ethernet devices are present on one of the downstream ports.
As all these ports are present in the node represent the downstream
ports and embedded endpoints.

Power to the TC9563 is supplied through two LDO regulators, controlled by
two GPIOs, which are added as fixed regulators. Configure the TC9563
through I2C.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 128 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi         |   2 +-
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 18cea8812001421456dc85547c3c711e2c42182a..c8308de1116e07f83f345faca0f29b9da3c4f474 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -262,6 +262,30 @@ vph_pwr: vph-pwr-regulator {
 		regulator-max-microvolt = <3700000>;
 	};
 
+	vdd_ntn_0p9: regulator-vdd-ntn-0p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_NTN_0P9";
+		gpio = <&pm8350c_gpios 2 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <899400>;
+		regulator-max-microvolt = <899400>;
+		enable-active-high;
+		pinctrl-0 = <&ntn_0p9_en>;
+		pinctrl-names = "default";
+		regulator-enable-ramp-delay = <4300>;
+	};
+
+	vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_NTN_1P8";
+		gpio = <&pm8350c_gpios 3 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		pinctrl-0 = <&ntn_1p8_en>;
+		pinctrl-names = "default";
+		regulator-enable-ramp-delay = <10000>;
+	};
+
 	wcn6750-pmu {
 		compatible = "qcom,wcn6750-pmu";
 		pinctrl-0 = <&bt_en>;
@@ -843,6 +867,78 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vdd_ntn_0p9>;
+		vdd18-supply = <&vdd_ntn_1p8>;
+		vdd09-supply = <&vdd_ntn_0p9>;
+		vddio1-supply = <&vdd_ntn_1p8>;
+		vddio2-supply = <&vdd_ntn_1p8>;
+		vddio18-supply = <&vdd_ntn_1p8>;
+
+		i2c-parent = <&i2c0 0x77>;
+
+		reset-gpios = <&pm8350c_gpios 1 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&tc9563_rsex_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pci@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pci@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
 &pm7325_gpios {
 	kypd_vol_up_n: kypd-vol-up-n-state {
 		pins = "gpio6";
@@ -1119,6 +1215,38 @@ right_spkr: speaker@0,2 {
 	};
 };
 
+&pm8350c_gpios {
+	ntn_0p9_en: ntn-0p9-en-state {
+		pins = "gpio2";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+
+	ntn_1p8_en: ntn-1p8-en-state {
+		pins = "gpio3";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+
+	tc9563_rsex_n: tc9563-resx-state {
+		pins = "gpio1";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <32 2>, /* ADSP */
 			       <48 4>; /* NFC */
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 4b04dea57ec8cc652e37f1d93c410404adaadd5d..23cf2c8c72b0bab67467e4b60cd57a3e658efa68 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2424,7 +2424,7 @@ pcie1: pcie@1c08000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1


