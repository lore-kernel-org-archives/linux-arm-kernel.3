Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6546EFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbPQdWSvpV1A9Kh3jDfv9xIG/RX44VAlr59SkR3C6Vo=; b=oRYjRo792VBkW11EO8m+rM4gZd
	OqAY8Gi5J/yJM5MOhevJi2JHNfGC1cvOp6FvkD8Ya1Fd7sV3EJQ5OOpc/xVKgWX56T8PpJyABztZ1
	ei4b9EPns2I1qz7QC06lOd+74XrrpQA7pJeY2wNmFwCZX5dRcBKeVYoLsF8GFvlcD63ZHPVjH0nBy
	EEylezhJb73cvL0p6s4yVH8dvBG80zQV1lya8MX7621961LeZn6D83HD1HcL2WK9RBi8TGJiFXTM+
	wDuT7shyQXUTFvdpMHDqoN5mWD/QBippW6WhkQiAaI2un7ac6VAcgPjDsW4yO29bFREQd754S/2iP
	eq9W6ogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPtX-0000000HUZ4-2qKq;
	Mon, 27 Apr 2026 17:37:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPtU-0000000HUWF-1xGM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:37:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RHNePr662935
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbPQdWSvpV1A9Kh3jDfv9xIG/RX44VAlr59SkR3C6Vo=; b=pa1kiRR99pQd0rw/
	3Io4uUb5Ect4M7AQha7O+U9rTWTepqY+VdZPBtStrlH8sbijExxwtHilnTjbion3
	y/RhL1XNQJYxFOnOqA3AQFwgx+ts5LWckyghw/wvDcu5TJuYftDfbsZs2cNBsa4h
	GN9s0xbyjUc8n3onvZqYi9uJQbkA79yS0e5xHCauGBO4CZNPQKM/T8HNqycel9nT
	CHa+zHfJgmLp6gGhfEXfdo9NxZioFXUz6WZvzCGsrhys9sgyIqPDrgZ6qEUx3Zvl
	enYQjfLRNHStjulukiCgLJS++Le/1r7kW+dvriqHmb6gy3UD+CS+5YxCI0jQZMYk
	5Oal8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n025g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:37:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so12329085a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311434; x=1777916234; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbPQdWSvpV1A9Kh3jDfv9xIG/RX44VAlr59SkR3C6Vo=;
        b=JuhYV26g2i2HgOjM2DYAGmgraTvcD+idIdcbhiC9u7AVEUjyunsT40R6GpQXYosHnW
         DWq4CYPLhfi9ZM9Gz+9VZThc4SVPMgcFWs/dRNTmGiVqU5Hjh8rt8IC33N5mHrz8GZDh
         e+mHekX/Vu68xG0xPzDQ53mSqoU3fa1I8MfAgCcBSOaoaJDqkkuGPNvwHSsmO0jcdJ2N
         XnPFoZRnOBynZ2n/kolPajLchp/VLLNo+qqHMfzBc97NoaJAZEU/kZ+XcDWQR82DumKU
         WBFxcxHkODy311KCdSEzxArOu+apsdQ2DKQJWDR3Fc3gNBqS5i2vbQSFS66yQ9QjpQtw
         bipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311434; x=1777916234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xbPQdWSvpV1A9Kh3jDfv9xIG/RX44VAlr59SkR3C6Vo=;
        b=pbQ48DBnhYmHNBqYTZcYOfWU1V97NunDl9XBa1BQvmCZNNISUE9Ra+jzT1/pXH/MaS
         tIAAAp5JgvF8Wwux0Z13mDdsDjWhJF/s8P1RupkX0mgJwAC6UelN/qcz1thUvBXNQbtm
         XKYuv5o4OUhhFYTx+ioPx5MwSAwNah7wv1KISqPUo6W20LycyIx3XHDanHg9g3XxH4C1
         WjutFZKSJLaRo7qjDHj6lnHsy40NpeX5A02NxNNK4OnLpNf4tJy31ODyNi8L6dvBdOQZ
         8zNZR/cOjYFh41dhX6GojRaXGe2PzWjMxS84sz6sxQpccDfydIJ2nKhdPWJSG1k3LqOV
         B9uQ==
X-Forwarded-Encrypted: i=1; AFNElJ8m+sLJInTQajJLUfB8dvhA9wrrER6M62om0Oz1+g/OfoxtknEzoWlwCLby5aFK0M7NYR7eypPoTrNueq43Me65@lists.infradead.org
X-Gm-Message-State: AOJu0YwiBbjhkIBkZxicLCL1q90HNNAqfM9Bz+dK9b4gzG4HStlIDs67
	cgZ58qCixKjopFc1tCpx9G99DW0eUrMYF514ySzqdZBt5hHwAn+siEgyoGPRGlot1PhM3Ib8R51
	w8RJcMRAbn2bu6ClGa2hsfU1uO25/qXri773Chj43zU0IK3TCNN4Lg48b8Q/P5sp/1orl+rvEUq
	zWqw==
X-Gm-Gg: AeBDietFJsrauCzjAmQ0RBq89nGw3RZuMbPu6FxFkLPdpISiYPIcXMzl+/JgTzL892+
	MsikzInFLEqzJu4rniuNDYZwxKEfJfClbwuiYa2vo99lgUo6EB4NP6dCLueMDAYcVXD0ZQ+qYDm
	PZpUJ+KCZJBNg8sk281UH5aqr/CIFmHjd1lua4wt1iHrCrJY/gDPw/mBZwDmXxslqFiPTnVG1Kx
	hM/CTKwNoPEAcfwP5JGJ5hkAGCzW7QayBBEtyVno3cjoQUTcnGm2YPynaAwDe6E6VUXiLIxM86Q
	pYThe1iNqFZle5ftVr6670I8kPz+/Qpvzwh6XxmwAPlC75cJe1f7u9D0vBUxWFO2PckuCif5XCv
	9FUOk0nriupdsHjCtnSwAQk6WOPUiOLGEqsiGXS8kkpT1lL++8VYwDoNVw2UMau9Dlua/
X-Received: by 2002:a17:90b:2747:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-36490caeaa9mr35338a91.21.1777311434385;
        Mon, 27 Apr 2026 10:37:14 -0700 (PDT)
X-Received: by 2002:a17:90b:2747:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-36490caeaa9mr35301a91.21.1777311433790;
        Mon, 27 Apr 2026 10:37:13 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:37:13 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:52 +0530
Subject: [PATCH v21 12/13] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-12-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2171;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=5QIzxz7gWGxheo3NhPJy7cnaOZvXTFo2HH4ZUk+68mM=;
 b=325D48bjWTKLlbPLVqjl4k3qXSzuj715BcxjqaXLOtBtLhOIIX41XNRMTpsTte806BXO9r4FM
 h4AC48/o5MuBi+c5QrFZhPxIMh+5eaRSzd3aPipb6c/EUTlGKfAshkt
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX6nGQd0/JD56h
 3JqfCxCcCGRpw/B38rdxkHKvSfgW+xWiHUZz498xJ1qWHHKtcF/Q0bAQKIInGMXn62ygmObunXp
 ruMy4YYXWmFyuTp7OuSHjPMz4A7GUojqiKKMTlXF6zwPo19gJy7Aae1tA35j9e1UKQ04Yncp/79
 0YbTPTZmIbmUeaV9K1hoq6X3EOeAnuQTRlFwOhgTN5kvFpS883Kye6XmdfndN7XZ+sf1SPerRHK
 sAlj9GgCOqI11Ut74mKvzI3YWuONXn01XEDT3jYPnaPs/G+wS4zf1mKsQgWHHBd97B7+Rjx2h1P
 lUFJdPTEPlupMUCIvvBs5cLE77TC77ldDro9gGFZdILhgjYuRGeqkZjJ3uIjFukx5ncidKwrBPS
 RXYd9ZcPPebmE2Bz/nXwOlQskFiaFPfkNmGrcP2Goflvq3UhcsL5mS2VNh2e11wtwe6HHihArES
 vAmgUEwm2OE6wgCuT/Q==
X-Proofpoint-GUID: ddwi59r9a13xHrdUwqrJiSzzYEZu_SUb
X-Proofpoint-ORIG-GUID: ddwi59r9a13xHrdUwqrJiSzzYEZu_SUb
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69ef9ecb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_103716_629415_335C2FBE 
X-CRM114-Status: GOOD (  15.81  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf130564efc2d0159ac0de39126e80..df668dbf2bc60175c36cabfa310aff625647899e 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -661,6 +661,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e6953acc7fa06d22a1f83ab24edb0..da675f7a8f2d83f3598a6a7ad71a99206213d03c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -674,7 +674,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d821ca88a38ac59a78625707850bb5d..3ab5ae3124ed5314f04202b6b247fbbbef665053 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
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

-- 
2.34.1


