Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9F3F531DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 21:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AOXMNTIIXoqpY3VFkb3PMLMzullDNaoQaiXPYXq2Yho=; b=43i8dGAqr4yenSIAUaUru72B/Y
	9eYduI6NUvV36QjfyT4640VrSf7QFYuuLufHsFHuTdLkV17GEw1o/BmY5UB6V9cRvZlHH+Ic4E8Sx
	fmiH2hVypsLiMeQ8xLz/g2+yhBql78V1TZWZDwi0D/KK9R6Z6JilVS6PlxnzA43HEg66x8hEmCORV
	dijZCZrKWrR3ek0nB/Oyx0wTirwwkGomO6eFqamQkfEvfFF7mI+EJKwZS8vUSgAcbxB/tYHuDi7fB
	skRp52M7Mn5KGEK0fSYXJysKhqawyK8C+6oJ8eVpMePXVrgUrgCcPclDbZwCmzEsuVRCBen/H2oas
	xEv0hL6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPEH-0000000GPhY-0m1D;
	Mon, 13 Apr 2026 21:54:01 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPED-0000000GPgh-2aHq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 21:53:59 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso5251908e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 14:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776117235; x=1776722035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AOXMNTIIXoqpY3VFkb3PMLMzullDNaoQaiXPYXq2Yho=;
        b=OPeCbT7h24Z3BSBrr5eAXjmHtIZhBvJoZxF9frsrQyHPJ5Wn8be0JR2PT8DJouaZl6
         d94kcWhf/Qo4akKEVWdqsKggQ8Hlsv+WTdN+v/8Nq5/pQDBKpk9adW1ZoKFuHJkXpJmE
         Sns+2uJ93aDDwiJmxI3p7F7bs0Vc46DArh7FfuPk+ggnXUNt4slfMgxM8s8a+XnKvc9k
         x4oJ4ZtRCuGvGJ/Z5+Az69OfLFoU1bOk0Hah5FOqvZetUJUfa1o2n/M+BoOwbuWp4KEp
         ueYzB+vb5/qz9Zqn7hUQ0ycbrvZKWcBhrRiQx75D4zmKUs6uUhFJ9jQ1q0S2UR/twVq+
         dZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776117235; x=1776722035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOXMNTIIXoqpY3VFkb3PMLMzullDNaoQaiXPYXq2Yho=;
        b=cfbTg/Gvg7voXEevaa9khcyu9RvDsF2B2pWefj/dNH1nCdK43Hleyc/V1PWCt5j1BE
         tDgpxnaX8zcKUhWoDmU0cMFX4+bM1rJRC/uzIG+cg8JT/xNJS6ztmEUZ60nGyFNX5Ds6
         oNBaFSuKMQ1vHIE/TVK3v9vIyYZASRDJwInCbNXr1fRsD3TQhII7r3wT2OxeLLXIC+OH
         +H6fVtnQOdrC3eK7UGB46cqV+OGuQaQm69ElTCmBSnxCo3Arv2nYohTsNwUKncgpV4FF
         ER5CW8EKhskDnkbamK0ae4r04Ev4A2kC3EgdarpyPJlI7sCSkVWMkG5gUe52elKlKj0q
         CCig==
X-Forwarded-Encrypted: i=1; AFNElJ/SU0E+rI80OiSSKA9lxJSj/ynnkS1LLEDctiiru1H9HuqzzOmp7tDxjG3BWjnlZyLgDCihJajZN21gGu/nWK0l@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx2vxRZQhRXiheLdFj99hAGwwZPYrj1GVInfjng+CV7OYktbeK
	NrWQrzOZQOkV8KBeePXz/FJF9WdwHC5gbVe7d+fT1Bq7wdSPWV6vHItF
X-Gm-Gg: AeBDievyZNTxNWo/Rue5B1MwMKGk3UfiCnk9EzdhS3QuTn3jFrKZMk7XEYrX/hvl+2W
	P9SVC/408RR+NqVcMDf6zOdjtPJNTn1Ib781CHu1ifKE7A+wUysJ4z/2km2ZSj8HhQIp3A8b0tc
	GV+G39VGOcpN24Rlo6X1yCUznQN1k36xjyEx4pjAADuUBIynb3gwf6NYF3oWmT+0XEAWS47FM2i
	lxFwvzFSTyqYf/Yx5KYUch1ealuvD4ffQ2eKE/pT6z8xZJ6qz7Xpgy5cjmqyR98h/FuHSSXWl0R
	hr9ishj//phdoFf1yuYXXkeSjeciS7xsrjlloYVMDQh7jIR0Xz8AP+cMuqLjIGOgI3iZ0Yu2rLH
	6kU24zqNHu1BmtBxmRWuskc2umLJUi8366Q053mY9SERRvs9FTM15Z3BdU2KK+HGD3DKKo3rAhC
	OWKppTn2T/ZmcgffdmU6D/xlGLTgIHOJOPLz0IUvxKGaB/Srprx9tuwphu1OQy2SkeiL1364/jV
	uOV70bPnXqYWlQkaKx4tG7QpYQC1A==
X-Received: by 2002:a05:6512:108d:b0:5a4:d4:5c5e with SMTP id 2adb3069b0e04-5a400d45e20mr1006936e87.22.1776117234891;
        Mon, 13 Apr 2026 14:53:54 -0700 (PDT)
Received: from rocky.so.lan (9091-40f8-8d6a-8ea6-6a01-841a-07d0-2001.dyn.estpak.ee. [2001:7d0:841a:6a01:8ea6:8d6a:40f8:9091])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3fe65214fsm806370e87.49.2026.04.13.14.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 14:53:53 -0700 (PDT)
From: Sten-Silver Ots <stensilver@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Sten-Silver Ots <stensilver@gmail.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Torsten Duwe <duwe@lst.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Enable the NPU on rk3588-rock-5-itx
Date: Tue, 14 Apr 2026 00:52:49 +0300
Message-ID: <20260413215301.4656-1-stensilver@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_145357_677302_26687B0C 
X-CRM114-Status: GOOD (  11.77  )
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

This commit enables the NPU on Radxa Rock 5 ITX board.
The regulator vdd_npu_s0 was already in place and since the NPUs
power domain supply is now described remove the always-on property
from the regulator.

Signed-off-by: Sten-Silver Ots <stensilver@gmail.com>
---
 .../boot/dts/rockchip/rk3588-rock-5-itx.dts   | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index de154adb1497..d3ab6c68a60b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -421,7 +421,6 @@ vdd_npu_s0: regulator@42 {
 		reg = <0x42>;
 		fcs,suspend-voltage-selector = <1>;
 		regulator-name = "vdd_npu_s0";
-		regulator-always-on;
 		regulator-boot-on;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
@@ -683,6 +682,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hym8563 {
 		rtc_int: rtc-int {
@@ -802,6 +805,36 @@ dp1_hpd: dp1-hpd {
 	};
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &pwm14 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm14m1_pins>;
-- 
2.53.0


