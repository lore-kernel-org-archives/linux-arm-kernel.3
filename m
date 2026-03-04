Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B0FEFCE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdU7H+Ufp7jUqtoufnsWZsR/aNT10n8aiLapu1wjI9k=; b=cB3v7Tq6Wy3GppHGBzJF/wNYRn
	dUCm+3MJG1GMSuGGOUdUQiBjgNgk8AaGmFXbi67/1v3GtzFMlc2NIe/lJTXY0w06zuVLPSCOtSRaR
	+j7bHi9IMWO1TLGf6Lx+r9GmcbuvfBhlbXlFCgwwQyO1yAiFDFkVChZJlA5XkXfP0XtUd3AajsXzz
	L7vpGNwPm6UOKtcWNPynZVK/+VSP64r0yMrAS2Oiex4Jwzy9K1JY+uNV9w0G0h14N9yKKgpIOJPPc
	IkIqt0ZoBlMZ6DfKfA9bee8kZ4D7mSsHH+jI8Z8su9mpbpTNlSKEzOixYee/ZGGr9r/mxwLDHZSUv
	TochPrzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqaI-00000000IJT-1qil;
	Wed, 04 Mar 2026 18:04:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqaG-00000000IHu-2oaX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 18:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rdU7H+Ufp7jUqtoufnsWZsR/aNT10n8aiLapu1wjI9k=; b=bn7/e4mDpEiV2OBy8HCMadHa0N
	Q1eS7RY0qoO0SegJhdPdPoLaPDTl1QzRHaSeD4nCHhg673/Zog48m07U1jeYaAHmcjrEBSQWFt9Oy
	WmtnFwjA8CV/2db3ATZYvgLnanrPFeEj6yUVIQkVSv0lCHC8pclHg9ICTT64Uk22wxVJR7nwd/baT
	RdUygTrpINZ7UM9BpIVf7ncN3j5VyLEfDt2ufZesV9zZxDf5Acr1Mk8Pe6xjDpEHCK29JZdTLvUr4
	vWcRqrf0liLc2rn6mReW5JtQeIv82q4ZmgIo53Hm81IrHcrxv988SFjVT3dSaElHqYu4g8THKRYGc
	Gdf9nt8A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqaC-00000005I9r-3KPQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:04:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624E0ZB7029349
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 18:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rdU7H+Ufp7jUqtoufnsWZsR/aNT10n8aiLapu1wjI9k=; b=JVeeyV7A4bR5mH6U
	WI4ug+RaEtYXuDq5K1HEv/LKxrppZpkKx6x/Rp6A05ma9lINah7T7s2Ih9HjY/WC
	w2pxuaA5G5O1Qa7F47ngjkedSO0uTmRBljU9My/5zmXId7Xc/t5g6TXT43Mg0+sX
	DXcfjSZuEKju8EeJr15SOF29xPuQrnZEEjFGM/49FFfxzTB2biHMrjbThxlSShDv
	FtzzH8bmJQFkY6h2fJQxIAR8Zws9RaZ/QenpiLzeCc2k9Kn40bUedEFEtZZOkMZ1
	R1s2Fikom6HN01ELnR2oNiMy0fUcOn3HQWAvp26JDBeWo2EanqGtaxJmOv8OIIvN
	TPUMCQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpp4fgv40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 18:04:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso33116670a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 10:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772647466; x=1773252266; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdU7H+Ufp7jUqtoufnsWZsR/aNT10n8aiLapu1wjI9k=;
        b=N+6trFqM7yoc2p2XvdvW1UXQZtOJCCY1t+95owKXehZZDjPuo5ZgFAa2/Y/8iBLR0T
         anAlea4im6ktk7UqYkiP25jInx9+mKktCxFohx1NaA751swwcV9WwhdK8PmXiXvnyZ+d
         TIv3JN5I9HWszRJmX38jo/H+VsKeGnqXxa8Tjcbv8PV/VOS6afZ8LdGfI/sgd9ElFfxm
         +5/A0H9U6aFN1f3UnbqEPFmEZbLK8+j7JIvi8h+ZDRsJU+/54y+SdIK3xODMEBjLrTnv
         vwU9/kne1BLPB8P/E4+BOCg+9VzgVrflL2mwT/j2X8JwRp5xV5ShA5ROXu/RqQj8v+XI
         Be8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647466; x=1773252266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rdU7H+Ufp7jUqtoufnsWZsR/aNT10n8aiLapu1wjI9k=;
        b=T7W59skCngbdC/3lX21Mp43e4jBxKz5GyUDytiPhGwJ4fwG+AyESAY7ZMfUaOSuFhH
         VPMKUeHY2DwCG8WL85s3P/KOCrZHF4d3MltS9uYfct2hqznER4iMfDT6KcJkTNnbz4wj
         UdXrN3Es5WBVCYw+VvBAjYofHwliyOdI9oov9MNQnAjlnWgFnM6Yf3CmQf6G93RQbSIH
         V3VtfaAx9MkeHylg6QRnxTsawuESX6y2YGaYXKAwOK72/QHItBlO3KC1lzLrWXGCCTNG
         AIcOmhyTLryccqfDM5WD31fDxsuranKKb6Oqw2YoWIjRvCzUGBUWlFgRS+53C/GUwYRd
         BZDg==
X-Forwarded-Encrypted: i=1; AJvYcCUiITfgim3jBfYuCsX4b1v+vYiOr/0z1zZcZr78vPUXz0QCPz7FsfMfYeBuKkjSxRVnZcdufkmOajHgJxtfveBH@lists.infradead.org
X-Gm-Message-State: AOJu0YxBv38i2Yvw3/o/sgtMeRd60/CqKiK06QHFcFzkjf+x8Jo8Q03o
	cuLS490JZU8cIn2X2svrOyEQz4UUG2e1GJo223BL0X3lKLZZoNj3OJma4f8pqkZM1w9DAnhd/Na
	bhMwiHoHL4T+OHD+wb67MzkQPX3LzNbhOVJ1nh4pHvODjWefxuSyni3AYUN2Nc7gjGMWiOiY5OE
	c6SQ==
X-Gm-Gg: ATEYQzzzAXygP3+2a6JaUitP6DdXAvdCYjrgB3S/qQ4fYNiOocHgo4i++jF680biojZ
	uTCp8x+ZGqSjqbdRqQthrskSATclv/IeZ1nj2DbwJVRztx6psWl/UehUr1rWczegL6hcb/AoQjD
	ZRVlbYNiqCJmEkSJZPKN78Rupt/6jLwIRCjG99/22lsDVUX/WjcpWWS13eK/S9CQNEcCeHKCIvN
	2o5gK+7SrzrkqqJ1u/TFcdE0HhLmfmAZHqAItNIVVcO/mDEG8p2PY8qepMNSfQKTveNtgsge4KZ
	zmNXaGUt0ah+qwNTCuoY3oQAU9dSkJILcT8yVwK6w2wDpXHAKN7q0HyZ39/EcFTieoGtoV5+Z34
	ZD9NYGk3Bs1V08C+mPweWHyn9kUpprZbwhB28WHxWSUxd7nDoDIydf9B3sg==
X-Received: by 2002:a17:90b:2e85:b0:359:7ae5:89eb with SMTP id 98e67ed59e1d1-359a69c796bmr2658570a91.11.1772647466220;
        Wed, 04 Mar 2026 10:04:26 -0800 (PST)
X-Received: by 2002:a17:90b:2e85:b0:359:7ae5:89eb with SMTP id 98e67ed59e1d1-359a69c796bmr2658530a91.11.1772647465645;
        Wed, 04 Mar 2026 10:04:25 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359a8f22062sm1080606a91.1.2026.03.04.10.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:04:25 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:33:07 +0530
Subject: [PATCH v20 07/10] arm64: dts: qcom: qcm6490: Add psci reboot-modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-arm-psci-system_reset2-vendor-reboots-v20-7-cf7d346b8372@oss.qualcomm.com>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772647398; l=2240;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=5Re4Fcu614uHWQ7uwIVALFVPUqCLosVU7TPLzsP+VBc=;
 b=5o65AVsItHdOKBx5+J9aZ+vWyhKmaBgKRSV+ow+UzhDZhopfM4hoZbNUWmmtA54/gbX574Wk0
 jNFiJGqo78hCznF2kzQcdMNiuiEFY62XUNoOcP3KH7Nq9bsl6r+yh+V
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: Frj5yzryhg7H0GZ0QkF2tsitjdC01Ddu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NyBTYWx0ZWRfX5WVJE5K1C1h3
 cMMjmRTn81s4c8cDn+uyJF0THQ0c2eoSWrPNHP0/6AMkeptK46sKddvuSAUvPbium9ZAMw7qpT7
 4CvwPJp9bD9VPEdaf60F2JuXdB+C3H576HKyu0ZylC9GPxl11uPT83nqwqfIHUSXJwB9oBy1t6I
 VZRxJfvEv477XH6NsdMQ/OzYQX/58w8HFLNDXWsuK+mMcYSbRfAftGRGpyfAZhvcIcwgQd9Q/iU
 T4zMHVeWeW5h7BJre43Cnv4EMiuIS+61PyjQvcIHkuVF7j8d7YzgH6BPNnXoy07z/mJ9BaNpM1y
 IA5a1p3oFnAuUcbk20tGU6oo047xmzJviFAACuc0McA0Rq3Pd4hFQUP7CEDV5/a+AP7popeoE+J
 zlJn5wZ4qX6D1XrTalELnZRtu2XaBZ/ze+Ndx77VVZ1/L5gEx0cSM4qk0RlE7E5FFWhrDvhVAYF
 QlZNcCbKsV3d1qb1ksA==
X-Authority-Analysis: v=2.4 cv=CdMFJbrl c=1 sm=1 tr=0 ts=69a8742a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Frj5yzryhg7H0GZ0QkF2tsitjdC01Ddu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_180430_153312_56E7ECDD 
X-CRM114-Status: GOOD (  17.52  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci_reboot_mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all sc7280 based boards.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829b5233bb87fdcb37d8a05d30fb87b..44dc8eb55a213f81205584650382b6b7f79f6e88 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -863,7 +863,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index b2f00e107643dcc79da89e40206f86a834da9e33..5792cd75b61a53f321d3348eb66945f17c84153c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -695,6 +695,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e3d2f01881ae05f17796f9c97f10b53cea50daff..bc7814ad62b824bef148bec4cffcf10f89a21c96 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1031,6 +1031,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


