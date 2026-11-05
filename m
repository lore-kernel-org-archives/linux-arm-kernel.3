Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00FD606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 22:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Auv+b8LV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dbxSNSaX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EWHc/oydTj8yhbFMBudRXnGsr/DhiNLCAm/fJ9rlB9A=; b=Auv+b8LVj8Em+O
	d4b8oQSNvg/N53ThD9g5BfYzNIot7rbbO9lcaZ0tthdhP1qLhb7dytQX1FzlNpEW8zm7w1T99Vj27
	lwxNjolJLu1m+/P6hjZZoczvjlZWxoIlH8C6k1ne5rbBWfk5nf9XJjaDCy/3iCAtKUxhNa7sFlx7B
	3M3OVQKhv0pD9bsg5h14U95RkV3bdaBo9c7sk+EEL+onJ4xjsyndG4pbwHQa8ieDnEbaAno8HPmUC
	7izyVEwrXemLFpA5WPvEl3wrPAhGfPJkVJFE4i/sKn940Z4W1D6gFJ/pWVytL7Aag0ykX2NL/ZD5V
	LSVOQCEH9jt7TJDDG8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP62T-0000000AoOV-2FRJ;
	Thu, 05 Nov 2026 22:34:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP62R-0000000AoMX-1hKp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 22:34:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9227E601BF;
	Thu,  5 Nov 2026 22:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F441F0089F;
	Thu,  5 Nov 2026 22:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918070;
	bh=EWHc/oydTj8yhbFMBudRXnGsr/DhiNLCAm/fJ9rlB9A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dbxSNSaXSSw/Bg5dvuFyWiM828nt7uyplozqV5CAEdIKmhSNRYDnUX1egarR6saq+
	 nnmdkt1YsONwWnZKC96h6LhcxD1Y6rJw/gfuTfv7ZGcb94Fpa9CuDMg2Zwur0xfaT0
	 vtqjU0NYHdm91cR3sMTByPuS/3NVIUuRPw1EXmF8zvbvI6VZk5eXvvtdn4cSOqCtcn
	 Qnmz7mYHbx8U5i1f6textWR9iSl3fB5axzZN3+ZQUXREpLy3ra0LuLfW66hLpbMZHm
	 HhyqOCJmcXjewHg2p0M1TK+IEC2hleRzrx6LqCHH+TZneLeZruOSd4sc/vhF8R0Liq
	 F6eIdpmIdsNoA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 05 Nov 2026 16:34:15 -0600
Subject: [PATCH 2/7] ARM: dts: arm/vexpress: Move "arm,vexpress,config-bus"
 node into sysreg node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-2-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The "arm,vexpress,config-bus" is accessed via the "arm,vexpress-sysreg"
registers, so it is appropriate for it to be located there rather than
in a "simple-bus" node. Under the "simple-bus" is not appropriate given
there is no MMIO space.

Unlike the prior attempt in commit d9258898ad49 ("arm64: dts: arm:
vexpress: Move fixed devices out of bus node") which got partially
reverted, the "arm,vexpress,site" property will be correctly found in a
parent node now.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi | 146 ++++++++++++++--------------
 arch/arm/boot/dts/arm/vexpress-v2m.dtsi     | 146 ++++++++++++++--------------
 2 files changed, 146 insertions(+), 146 deletions(-)

diff --git a/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
index 248b8e492d43..e12d44269a2f 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
+++ b/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
@@ -233,6 +233,79 @@ v2m_flash_gpios: gpio@4c {
 						gpio-controller;
 						#gpio-cells = <2>;
 					};
+
+					mcc {
+						compatible = "arm,vexpress,config-bus";
+						arm,vexpress,config-bridge = <&v2m_sysreg>;
+
+						clock-controller-0 {
+							/* MCC static memory clock */
+							compatible = "arm,vexpress-osc";
+							arm,vexpress-sysreg,func = <1 0>;
+							freq-range = <25000000 60000000>;
+							#clock-cells = <0>;
+							clock-output-names = "v2m:oscclk0";
+						};
+
+						v2m_oscclk1: clock-controller-1 {
+							/* CLCD clock */
+							compatible = "arm,vexpress-osc";
+							arm,vexpress-sysreg,func = <1 1>;
+							freq-range = <23750000 65000000>;
+							#clock-cells = <0>;
+							clock-output-names = "v2m:oscclk1";
+						};
+
+						v2m_oscclk2: clock-controller-2 {
+							/* IO FPGA peripheral clock */
+							compatible = "arm,vexpress-osc";
+							arm,vexpress-sysreg,func = <1 2>;
+							freq-range = <24000000 24000000>;
+							#clock-cells = <0>;
+							clock-output-names = "v2m:oscclk2";
+						};
+
+						regulator-vio {
+							/* Logic level voltage */
+							compatible = "arm,vexpress-volt";
+							arm,vexpress-sysreg,func = <2 0>;
+							regulator-name = "VIO";
+							regulator-always-on;
+							label = "VIO";
+						};
+
+						temp-mcc {
+							/* MCC internal operating temperature */
+							compatible = "arm,vexpress-temp";
+							arm,vexpress-sysreg,func = <4 0>;
+							label = "MCC";
+						};
+
+						reset {
+							compatible = "arm,vexpress-reset";
+							arm,vexpress-sysreg,func = <5 0>;
+						};
+
+						muxfpga {
+							compatible = "arm,vexpress-muxfpga";
+							arm,vexpress-sysreg,func = <7 0>;
+						};
+
+						shutdown {
+							compatible = "arm,vexpress-shutdown";
+							arm,vexpress-sysreg,func = <8 0>;
+						};
+
+						reboot {
+							compatible = "arm,vexpress-reboot";
+							arm,vexpress-sysreg,func = <9 0>;
+						};
+
+						dvimode {
+							compatible = "arm,vexpress-dvimode";
+							arm,vexpress-sysreg,func = <11 0>;
+						};
+					};
 				};
 
 				v2m_sysctl: sysctl@20000 {
@@ -415,79 +488,6 @@ clcd_pads: endpoint {
 						};
 					};
 				};
-
-				mcc {
-					compatible = "arm,vexpress,config-bus";
-					arm,vexpress,config-bridge = <&v2m_sysreg>;
-
-					clock-controller-0 {
-						/* MCC static memory clock */
-						compatible = "arm,vexpress-osc";
-						arm,vexpress-sysreg,func = <1 0>;
-						freq-range = <25000000 60000000>;
-						#clock-cells = <0>;
-						clock-output-names = "v2m:oscclk0";
-					};
-
-					v2m_oscclk1: clock-controller-1 {
-						/* CLCD clock */
-						compatible = "arm,vexpress-osc";
-						arm,vexpress-sysreg,func = <1 1>;
-						freq-range = <23750000 65000000>;
-						#clock-cells = <0>;
-						clock-output-names = "v2m:oscclk1";
-					};
-
-					v2m_oscclk2: clock-controller-2 {
-						/* IO FPGA peripheral clock */
-						compatible = "arm,vexpress-osc";
-						arm,vexpress-sysreg,func = <1 2>;
-						freq-range = <24000000 24000000>;
-						#clock-cells = <0>;
-						clock-output-names = "v2m:oscclk2";
-					};
-
-					regulator-vio {
-						/* Logic level voltage */
-						compatible = "arm,vexpress-volt";
-						arm,vexpress-sysreg,func = <2 0>;
-						regulator-name = "VIO";
-						regulator-always-on;
-						label = "VIO";
-					};
-
-					temp-mcc {
-						/* MCC internal operating temperature */
-						compatible = "arm,vexpress-temp";
-						arm,vexpress-sysreg,func = <4 0>;
-						label = "MCC";
-					};
-
-					reset {
-						compatible = "arm,vexpress-reset";
-						arm,vexpress-sysreg,func = <5 0>;
-					};
-
-					muxfpga {
-						compatible = "arm,vexpress-muxfpga";
-						arm,vexpress-sysreg,func = <7 0>;
-					};
-
-					shutdown {
-						compatible = "arm,vexpress-shutdown";
-						arm,vexpress-sysreg,func = <8 0>;
-					};
-
-					reboot {
-						compatible = "arm,vexpress-reboot";
-						arm,vexpress-sysreg,func = <9 0>;
-					};
-
-					dvimode {
-						compatible = "arm,vexpress-dvimode";
-						arm,vexpress-sysreg,func = <11 0>;
-					};
-				};
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/arm/vexpress-v2m.dtsi b/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
index be03f2a8a57a..2a8d1d6dfc7e 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
+++ b/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
@@ -153,6 +153,79 @@ v2m_flash_gpios: gpio@4c {
 						gpio-controller;
 						#gpio-cells = <2>;
 					};
+
+					mcc {
+						compatible = "arm,vexpress,config-bus";
+						arm,vexpress,config-bridge = <&v2m_sysreg>;
+
+						clock-controller-0 {
+							/* MCC static memory clock */
+							compatible = "arm,vexpress-osc";
+							arm,vexpress-sysreg,func = <1 0>;
+							freq-range = <25000000 60000000>;
+							#clock-cells = <0>;
+							clock-output-names = "v2m:oscclk0";
+						};
+
+						v2m_oscclk1: clock-controller-1 {
+							/* CLCD clock */
+							compatible = "arm,vexpress-osc";
+							arm,vexpress-sysreg,func = <1 1>;
+							freq-range = <23750000 65000000>;
+							#clock-cells = <0>;
+							clock-output-names = "v2m:oscclk1";
+						};
+
+						v2m_oscclk2: clock-controller-2 {
+							/* IO FPGA peripheral clock */
+							compatible = "arm,vexpress-osc";
+							arm,vexpress-sysreg,func = <1 2>;
+							freq-range = <24000000 24000000>;
+							#clock-cells = <0>;
+							clock-output-names = "v2m:oscclk2";
+						};
+
+						regulator-vio {
+							/* Logic level voltage */
+							compatible = "arm,vexpress-volt";
+							arm,vexpress-sysreg,func = <2 0>;
+							regulator-name = "VIO";
+							regulator-always-on;
+							label = "VIO";
+						};
+
+						temp-mcc {
+							/* MCC internal operating temperature */
+							compatible = "arm,vexpress-temp";
+							arm,vexpress-sysreg,func = <4 0>;
+							label = "MCC";
+						};
+
+						reset {
+							compatible = "arm,vexpress-reset";
+							arm,vexpress-sysreg,func = <5 0>;
+						};
+
+						muxfpga {
+							compatible = "arm,vexpress-muxfpga";
+							arm,vexpress-sysreg,func = <7 0>;
+						};
+
+						shutdown {
+							compatible = "arm,vexpress-shutdown";
+							arm,vexpress-sysreg,func = <8 0>;
+						};
+
+						reboot {
+							compatible = "arm,vexpress-reboot";
+							arm,vexpress-sysreg,func = <9 0>;
+						};
+
+						dvimode {
+							compatible = "arm,vexpress-dvimode";
+							arm,vexpress-sysreg,func = <11 0>;
+						};
+					};
 				};
 
 				v2m_sysctl: sysctl@1000 {
@@ -431,79 +504,6 @@ led-user8 {
 					linux,default-trigger = "cpu5";
 				};
 			};
-
-			mcc {
-				compatible = "arm,vexpress,config-bus";
-				arm,vexpress,config-bridge = <&v2m_sysreg>;
-
-				clock-controller-0 {
-					/* MCC static memory clock */
-					compatible = "arm,vexpress-osc";
-					arm,vexpress-sysreg,func = <1 0>;
-					freq-range = <25000000 60000000>;
-					#clock-cells = <0>;
-					clock-output-names = "v2m:oscclk0";
-				};
-
-				v2m_oscclk1: clock-controller-1 {
-					/* CLCD clock */
-					compatible = "arm,vexpress-osc";
-					arm,vexpress-sysreg,func = <1 1>;
-					freq-range = <23750000 65000000>;
-					#clock-cells = <0>;
-					clock-output-names = "v2m:oscclk1";
-				};
-
-				v2m_oscclk2: clock-controller-2 {
-					/* IO FPGA peripheral clock */
-					compatible = "arm,vexpress-osc";
-					arm,vexpress-sysreg,func = <1 2>;
-					freq-range = <24000000 24000000>;
-					#clock-cells = <0>;
-					clock-output-names = "v2m:oscclk2";
-				};
-
-				regulator-vio {
-					/* Logic level voltage */
-					compatible = "arm,vexpress-volt";
-					arm,vexpress-sysreg,func = <2 0>;
-					regulator-name = "VIO";
-					regulator-always-on;
-					label = "VIO";
-				};
-
-				temp-mcc {
-					/* MCC internal operating temperature */
-					compatible = "arm,vexpress-temp";
-					arm,vexpress-sysreg,func = <4 0>;
-					label = "MCC";
-				};
-
-				reset {
-					compatible = "arm,vexpress-reset";
-					arm,vexpress-sysreg,func = <5 0>;
-				};
-
-				muxfpga {
-					compatible = "arm,vexpress-muxfpga";
-					arm,vexpress-sysreg,func = <7 0>;
-				};
-
-				shutdown {
-					compatible = "arm,vexpress-shutdown";
-					arm,vexpress-sysreg,func = <8 0>;
-				};
-
-				reboot {
-					compatible = "arm,vexpress-reboot";
-					arm,vexpress-sysreg,func = <9 0>;
-				};
-
-				dvimode {
-					compatible = "arm,vexpress-dvimode";
-					arm,vexpress-sysreg,func = <11 0>;
-				};
-			};
 		};
 	};
 };

-- 
2.53.0


