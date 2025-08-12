Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E95CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 03:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kaRIdv5rGzBCPQQ+bL7573cXNcAHftK9x8IVzI6njbM=; b=Bw/1C+dHnrpo59bCxoU0brGDha
	WyxTt/J4klLy0s+bSPr8rsyCznfx9QAQ2DMbAvw8C1o+WPN1oPdrVr3I8/YXu0j0szwh0hbEg+E3X
	M+ru8u9+GeNXv308STPOwYu2sbSuYqd5BFi0l7jZfR636c/sxY+qS6wN7kPYA8spTGGiiGynthg3W
	dKvwTrnz2aI7QHau4Xpsb+T+GAo5jgnzVfmAc94KZLD0aEuoJeRuOGDzvkZGZSYOOJJJrVteDzkSS
	Mlr78D69FWq7ctBiWnvyMjjviXazGmRI2JvX4fZDmkCacIT6vwtbDWbhUarNjmjMscLi4SzxUJNkh
	9oGUx9zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfK8-00000009fjc-064S;
	Tue, 12 Aug 2025 03:05:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfEj-00000009el6-0pdb;
	Tue, 12 Aug 2025 02:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=kaRIdv5rGzBCPQQ+bL7573cXNcAHftK9x8IVzI6njbM=; b=Cyfqzi7sA62XZVsMmLEr6Tb8b+
	5rpmqqc7Cfba8D2ZGovxE6gpjmK3GTjRJJ/tep4k68f3TQdbMXBoFmbYIXDMGsWJqp0gU3Ar+Sk4v
	/LFObHg4oTZwqx/aGycSm5ICHUF2fdLiNpHZPdrx0UuhyGAgMFQlFIIOMUTF2xym5MJl8U9j+LfwC
	1NY30rXm4dM5O1rYSThKd+HAEMPnfHydsgsAfJsEBw5+jRCFdwjOvq0VUzGHOuqxe1QW5HLnxvqFL
	8eoBt639S+1LYUGJaRzu8JHJIKVr7zYPSLAbbZjNSYSRC6sb3YNvEo8S+zT8seZJBrtb/+V9L6HTW
	cSzCQJPg==;
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfEf-0000000FeqK-2HAQ;
	Tue, 12 Aug 2025 02:59:39 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2ea6dd628a7so4573868fac.1;
        Mon, 11 Aug 2025 19:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754967575; x=1755572375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kaRIdv5rGzBCPQQ+bL7573cXNcAHftK9x8IVzI6njbM=;
        b=QzHzn/FvZtTWawfDcdfGv8UzSJgvEUpruxegtrBvoGy29mXXiqM57Vhp7PfVeye976
         jmyUwMUeAVDMDFVP2/TB1w8BzusmuTDRq0LC4FE8CNTc0jWMdic3fFxmbpz9ilT2ZrZe
         NUh98ea60CDubwBmeJO2ryjULuK0xJQ/uFv8uEFU4y3f/ZffaFdzjg57Kq7Ea5rg8R8E
         16YJQ2og2FrvnsEml44kUW39lF4zYdx2FDftyyg2PSvAfDVC0btzB81KzW2J+JVC66DU
         pEtHczJ+Qg5ARfEoV99iLkCP81ftMNR9Bctj97BrfS8jvBh1LfXW+nlIBlhN3cooM+DQ
         KHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754967575; x=1755572375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaRIdv5rGzBCPQQ+bL7573cXNcAHftK9x8IVzI6njbM=;
        b=gUigGlLsQ/OpWeTBwDdkBiyKSLU72Vdypg8iY8qv02mOiU/AWkNamqpIr7ixZpaRSw
         wTZ7W3bxc03/K1t6oL8YwqS60NcH4FfgKNqP+KvSYAUnxIEap/EN0o2+XYt5H/lP7xq5
         Qkx1iokoZD13sKsi7WhbK+EYqItXzVht3h3TaQtyjxrOICQsZX97xK6n8O9bK8bhr/Tr
         r3+FZU1EQsC3/vAzPT4N+hQjwbtJn3zWGBN8b+DPz8SwFjOpUyk6ywj332w4v3nIJHGL
         df+cghIT0ilkT2YizuNECyuJCoSE1nP6fw+EQamjf/GIFuvVkH+iHfcSXW+PSPaknVbE
         +SjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5TPES5FVvKFwzR7se/1lDvmtWpieuqYcAkusj4a1UDi20exLIk+rxl+rfx9rPtrZvUY0ANGVHIRZhtpp98/2s@lists.infradead.org, AJvYcCXUpV10rH3cX7jPVsS+KSeKTuEfm8sxRZl0Jtn9Z/H7kZDSdLA5y4s1DuhZYw+pC8uGSJaofhfKBSl/oLhoPIs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQiodz5+SDBTgGoxhIh5aUXT8aZgXkAh8sviqyKfQmCW+Lw6+8
	RMfrIDHHr/vH3NeFy3goVt/CUXu4PqIjKDByxcejJMI3H5nfZfTihckh
X-Gm-Gg: ASbGncsUnviyDMJmRWkxtGE/jOjhGkN79DRPE8ZG4YtIXkt06j/sU/FR53054mju+Mz
	5h0iO10UByj6IGTYTf9GfXAc63hUdDYHPCShTd3KPb2EdTXEme4Xy/eZghopCrMH59GsgMsJznX
	QDW1Olz2UD0qcehmUkP5Gg9fXz/N0lDYrHWI4G1IitGMZkEmcf+lbu0F/BoEf1zYPDao87onR3M
	80yax7Imwilbm2vBj5Oktc70Z0km0WCOrgs7pmYNHYdCxGAvTZgB+NG/bTsOMLTSLzmjfJSk1nd
	IdD8Le++tKV2YHj+NMPsrU4bPY2alf0mR0ZKALukYKijZrOUX64J5bY7w4er9FlPLT0xf9kpf3w
	pRX+8R8TiMS/kQAOKfD2sCFkaLq6FyA==
X-Google-Smtp-Source: AGHT+IEh1gJeqBqbfClfA33RQF4KKCM6q6/kcFkjflR5pnTF3aCML/jEQkLxhXQPP2zA5JJR+viv/Q==
X-Received: by 2002:a05:6870:3c10:b0:307:b28:48e3 with SMTP id 586e51a60fabf-30c9505bbe0mr1175520fac.18.1754967574830;
        Mon, 11 Aug 2025 19:59:34 -0700 (PDT)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:36c5:be5:e9bb:c0f0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-30c3a9d052asm2726690fac.14.2025.08.11.19.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 19:59:33 -0700 (PDT)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Johannes Erdfelt <johannes@erdfelt.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: enable NPU on OPI5 Plus/Max/Ultra
Date: Mon, 11 Aug 2025 21:57:54 -0500
Message-ID: <20250812025755.2078-1-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_035937_870019_9DCB8ABD 
X-CRM114-Status: GOOD (  10.76  )
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

The NPU on the Orange Pi 5 uses the same regulator for both the
sram-supply and the npu's supply. Add this regulator, and enable all
the NPU bits. Also add the regulator as a domain-supply to the pd_npu
power domain.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 .../boot/dts/rockchip/rk3588-orangepi-5.dtsi  | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
index 91d56c34a1e4..ac1df223d6a2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
@@ -258,6 +258,28 @@ regulator-state-mem {
 	};
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m2_xfer>;
+	status = "okay";
+
+	vdd_npu_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_npu_s0";
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <950000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
 &i2c6 {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -352,6 +374,40 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
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
 &saradc {
 	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";
-- 
2.50.1


