Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC989C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiMmHpQ1bB+met8QLJcdnw+SCuV4S6OJO6VsyYvdUS8=; b=dtBO+IRnjgWRrAxNU52kvCYB2y
	tHg2QpPJLtjcKxRZcgvAkO7Wf47d16go7CuPAp5rl1txiuHA7qW3q87R23y/oMPpKqTWGYBfW36Sf
	H3tsxnEaTjgMGNIkpYYE+aU80QXbAct8fbUBevyTUcTnq24RuCs28PohXIWqa1zWovjl+Hj/X1O3w
	jREmp8qfUDsgAP5WHP3UlKrLImn1D12Ylpg5v6bXSMJg/GAftYJH/FLp3xUiyswkiGQsEWY5rr1Jq
	8ND99afCjtxDM0H2VUQsQeV9f+XTH6nAVTadYDIpgnrYgYxkK3dxXzZULsHzjfWjZ/cElesNEIU8g
	rGJkNY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQ57-0000000AR3Z-2twS;
	Thu, 17 Jul 2025 14:59:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucO2E-0000000A9xC-2QVw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 12:48:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H5nPoh008493
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IiMmHpQ1bB+met8QLJcdnw+SCuV4S6OJO6VsyYvdUS8=; b=OleD3QDMSnB0kFR5
	QbrMf4A0Nu6i+xPLTRqU5b5RmVXSxaZ9+rrFo7PY++s6xYefUKFJNwYxZU1AMc/q
	Wd5vTJnnNcoNSdYZLkFZOIEcSv4aeQ753yuY5XjXYfeX0va5UGRrafeSM6GD8wq1
	I/SM2QArHsHlDdIfEoBN/Cg9oKqf7L0FMqVWNhmwhmOfZXkitG4dH4zww7+I31Pw
	1yNtfQ1YzGutK2wNmkolBBbUat4okFLBOmmyHOAzuMQFFcixxjKQBaUmMMwLzx9w
	SZdngh9Ed5PULMd/8BHHum3RlagD27Z2ZXEc3vHxB6aKHSU5LVQ/nj3x4Xk/ix9M
	HgfE3A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb7nyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:48:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31332dc2b59so885365a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 05:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756504; x=1753361304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiMmHpQ1bB+met8QLJcdnw+SCuV4S6OJO6VsyYvdUS8=;
        b=VUJlEbvSbZBGsDT8id+BCOft38WyFoW8im6oBOZ/9Mz78i/bAuB0epKNZ2amkpBSOQ
         T7Jr/3vLqQKKeVIEliMNZEUmIiMMNqYc2+oobZbZmyQpaFva01540UM2Q6tKUPFB0epS
         ZQPhS1JpcX0zlkbN8mnJ4AeRseqI0ojajts5Y+hAgkeqq/d0dy5ghKTRFH0AbMliPKXD
         /AXn1yhh55ZPaEaNRxbeHZEPK1lcgAYts4TXxR/UvnTdvCb5ZdZ3gLczCAs8wGB8NWYB
         dFGdRuQBdnL95sN5RurKKAfKJr+hBAvTNOrVzUD0A454vfDdcWw97QHagUNkzf6JGrJ+
         4Eow==
X-Forwarded-Encrypted: i=1; AJvYcCUqUFxCKh+weWtwzl4/d7Ug1ui8H8JSGRFWMaMN4ldcDNUOIw/FnmiiUFVLEVCxPWH13T33igiM2lwkRyWiJUUy@lists.infradead.org
X-Gm-Message-State: AOJu0YxVDkzLDJbA+IRzz3M55VQCaiaBTKxRh7UilqviId9FdaR/wS/J
	WTaovD9zItS6wh9OgrOaYv4lNBxVzJJyqi47KJRgBO/PmsLI5dpVbF3fB8TBckTT/WSXno3Di/v
	dGTN57ZIU3AbIut8CU1wnIkpXeb6zE17+AV3DUrAHiJRJrfY7GOqC+TXzUWyPJDF7QkjPa1gcct
	Ps5g==
X-Gm-Gg: ASbGncu96ToU3SXkfclawpZwReFN+a6ZwQ2nTfqGpaJDThTP8rp1r/8wVlL2yw8NBCm
	rGWg0Q5hvCwEVEGOV/nJvnSeezZjmK3kFBxFcgV0kywI3rcqnEKIyTCs9xnwYwA8PCgtwwtws+8
	TL4Ll7UzzO/aWuGNNIIMLHfiIy5DLMCaHsEjI5VeR2oq3IQIzGRsYzXdynqkOks//KbcE3Yr4CE
	r2fj/O0m/zen2l6P+e+N9R8eoLLZdI/tKHvbsAC4s5UYZkC1URSAjDrWr7fCVCUeZs03evGYYN3
	cz/mhCxjJfnDJ8o+cFfVC7gNsFqt584FIGQnMyrXY9YbuBu1kGn33/GLdipsnVTkPXI56J60Fz/
	e
X-Received: by 2002:a17:90b:3d8c:b0:316:3972:b9d0 with SMTP id 98e67ed59e1d1-31c9e5fcacfmr10321278a91.0.1752756504125;
        Thu, 17 Jul 2025 05:48:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVfbBlxohsXCc2xaE5I67a16rXLDbWY2pLu/jks1PnLsDto+TVjiDWxjRUtHLmCkYlmqeVog==
X-Received: by 2002:a17:90b:3d8c:b0:316:3972:b9d0 with SMTP id 98e67ed59e1d1-31c9e5fcacfmr10321217a91.0.1752756503454;
        Thu, 17 Jul 2025 05:48:23 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf828a0esm1505283a91.42.2025.07.17.05.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:48:23 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:16:51 +0530
Subject: [PATCH v11 5/8] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-arm-psci-system_reset2-vendor-reboots-v11-5-df3e2b2183c3@oss.qualcomm.com>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
In-Reply-To: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752756455; l=1628;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/OISjQAhUBAIE37ASE5b1kssDpdL8gfQSFob68FR4qs=;
 b=XSN/9ti8C5qipL44dj5FAZ2QRrNwANKVYhyqlCyp9SwpFFRbw/wawFmv17T5pBXhvUzvKxmxu
 NFzHvaaVO1rBYtjuTYcep97ASAoayTlgr9TSXw6xEqBBou95yYoBpy3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: EJQxwZyHF2hr8_JxMqIrsoFLg07JedVs
X-Proofpoint-ORIG-GUID: EJQxwZyHF2hr8_JxMqIrsoFLg07JedVs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMiBTYWx0ZWRfXwiSQa+tAZImK
 y5hoIUXO/qT5Bk4EjJm+xNJWGu8KE8LmybceikiRrNiGu/j5vrTCX51EsuPmXUqaZJXMww+p+a1
 BaaMJTQXnOdXQ5OljOjqvjbWBC9OJrI9zoX47TGpA0bGe3u8jDGwoXPUDZousIe91xiaPo2kOkq
 BBNFOXTZS2UOq7reNSdbXkL63r0nQoq6xbv6oDp1PxCn/y6uvVbwVmkXYSxn4VG4wv4/BMu70bS
 ziv+pNSi2JqruTR4d8NBKsWc0WoBnD4+nIW+jszAzl76Fg1WpXW+9oYspoCdy+0s6KgQpS1Mf+z
 OIoRUiDK4aJJS54cLS+I1M9D7KoDsQXlziDcvO720Q4JbUK6G0y87yJxiEQh/Hvnn8U3An2VVE0
 S2cYJwKm9Mgu53gS62CwMT3mQXVUXDg6grD1f/5BFg+ZjrAAclerjOqhY+qc4/FrXtRFnnat
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6878f119 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_054826_738325_01750A41 
X-CRM114-Status: GOOD (  15.26  )
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

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcm6490-idp as reboot-modes.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode. "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 7a155ef6492e176390faa3f2dbe419f5cfa62f0d..d25dbdde7dcee9fa3f1bd48a38baeae0f063023c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -654,6 +654,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64a2abd3010018e94eb50c534a509d6b4cf2473b..e6a99ef50b9b9ade9d2a71a14fcde429f8076dd5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -857,7 +857,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


