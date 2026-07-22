Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F34CC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOd+XZss+YRv1olA4v5j/GA2GS28MPr0U93YAb8IAO0=; b=ClyH0AMTi9wGo1LGQX0/3rL/uL
	X017K+6I8bTKadFTtTqpmVLygSb5pqAk8FG0EuWGgPURqQ9HKxtgPW3GZfYXXcLnPlGdQs9nRer5Q
	S50VQAvpTCidYUr9PylrTwhNwNu9vdjXtsWSK3MBIlSs9MXSJxHVzF+O4bVd7ScVecEnpFj6MDUEZ
	kZXQ8wvtAyPLDdehoNUYQhNOlLb3e8I868uV1CSJVd1+VQ8H6d94rJzInOsfqUbEohfvAVK3Pm3kq
	JO73qfqupqcmzixhK+RHPeFA5MNL3u6iQrVEAC1z1FyBNoi6F5oTOWA5/7XMNWEi/21b4DefCapMW
	MteJ1OVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wme4K-0000000CmBd-16VP;
	Wed, 22 Jul 2026 21:01:32 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wme47-0000000Cm6M-3K0F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:01:21 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47640541585so6890406f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 14:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784754078; x=1785358878; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOd+XZss+YRv1olA4v5j/GA2GS28MPr0U93YAb8IAO0=;
        b=P+OIXZYSnr++2nQA2XN6LHmATxvGBXs0oDCNvPM2iqccaSCEtkw3xjs+pVjg/WIo8W
         Al5hIaRob7R/yDbVzDxXM5UgRJ5Y85lLDSTXe16wzLNfE4vb7JoxVs5mDXHMcVeRMYaD
         nA9JPu1t7HapItnQaFWwBOmmJnLxkif6ytiPK4VK1zBorHluBwjzmYTGmGv2CAT5B7GZ
         E/fiyXD82rkQrZ6IEq5YqvPZuoqjzuZMktE04Lu13teoJ646bPybJ0DNrMTEXsltKwKi
         Gyt6IZ3Rh2woSX/MuWSbdtKFrbQw5zYlHnvWPXj9F9wIS/laKfcaWeEzLXGozV7oevDl
         vnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754078; x=1785358878;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOd+XZss+YRv1olA4v5j/GA2GS28MPr0U93YAb8IAO0=;
        b=LemNoB8PdBTE1zBIbRqeix4gFiGITUmupTrjdilDWhGLWXLPIkVZvdlZ4K0Xsxzv5g
         9UEbzhw6UdYyrobpT0f8wmJCQKWXm8ebEAGucQV23ziv7jLpsb8mBzrEnQ5EKnOmUQ27
         4A42xe1Al2CTiKcnV/4Mf+6Orf4soPuv4hD1YUDo3QuAEEMlN1D/vkYeFlqBmAajqr7m
         McGslbMBbU/CNwSvPooz/+9dk4J6HfhGfrOABSGohDUW2L1wOK5153qIWwndXBMkfJwh
         jr35pOkAYhjuCr2ZtF3RT60A1YZmdeEVmnSscnLWqDS2Ov8j/2l5ouN/3rUjr5okWAM7
         w7BA==
X-Forwarded-Encrypted: i=1; AHgh+Rp894ceeI1u1/xjQVdnuArSiDEznzxYJUrqA6nID4QfMPvjXnMMSVsDhYgjctHZPrkGA4FTe4wdCQErn414Zmpz@lists.infradead.org
X-Gm-Message-State: AOJu0YyRDDcfHVG6yPviondG9Z0OcU08tGNNOj/SvqOOKEQob7G1qqpv
	RKh5NM+jvfqojWETuBgO53tf9Pv77lF77fFbVfSN/Jy+Q+XZ66NU3/Ee
X-Gm-Gg: AR+sD10goPP/Kr1wzOzQDCz/NsEDg5uECdwZGEqsTRt0mogqrKq6MB2mRjclHWRqe5L
	suYl3/Hvvp3U/uk8aI3wT7X/KvtdD13mNEbM7UwhZs0WuRHQeYU8W0Yz6+/HM13FsitUUar58uy
	p54E0uFfSQE/uUBf4VQMUjg+fdo/K8mt8V7GCV/yAs/BG6wc6mHeqkAAU8dvtgWUKujZmxGaIpP
	j6gTLgWHrEvGhSafaCO89Jjk+bmm7Ri+3yMQ+BS4sC2WVJb0B3kdMgsEYd0KVzAF5Mawfy7xQOH
	QcF/vOAVD9Qrgl0K7wVXz1Y6qA2XxFtSuK1f3yqjfeHwF8ZBu4hEuMQoXEGjXr6Wv53UsAeqPVk
	C4rD8p97lA0+cC1hiXUfWLTs5m9l8c21ebCG+nAgRT71OepWK2Cw/G8T/O4AynOOdu3qaJfoyXo
	YPZZkWpLOAH9DllTlUwYn2Q1Nv
X-Received: by 2002:a05:6000:2387:b0:47f:6fbd:89eb with SMTP id ffacd0b85a97d-47f8dc936b1mr487157f8f.57.1784754077794;
        Wed, 22 Jul 2026 14:01:17 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm8610812f8f.29.2026.07.22.14.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:01:17 -0700 (PDT)
From: "=?UTF-8?q?S=C3=B6ren=20Hantel?=" <fugininsane@gmail.com>
X-Google-Original-From: =?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
To: linux-pm@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Rossak <embed3d@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>,
	=?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
Subject: [PATCH v2 3/3] ARM: dts: sun9i-a80: Add thermal sensor and thermal zones
Date: Wed, 22 Jul 2026 23:00:46 +0200
Message-ID: <20260722210046.2932498-4-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722210046.2932498-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
 <20260722210046.2932498-1-fugininsane@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_140119_842964_BFC5317F 
X-CRM114-Status: GOOD (  14.25  )
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

From: Philipp Rossak <embed3d@gmail.com>

Now that the A80 thermal sensor is supported, add its device node and
the thermal zones to the device tree.

The clocks and the resets are shared between the GPADC and the THS
sensor. Sensor 0 is located beside the big CPU cluster, sensor 1
beside the DRAM controller, sensor 2 beside the GPU and sensor 3
beside the little CPU cluster.

Signed-off-by: Philipp Rossak <embed3d@gmail.com>
[soeren: rebased from the 2018 series, fixed the interrupt number
(SPI 115 as in the vendor BSP; verified on hardware - SPI 31 stays
silent), added critical trip points matching the driver's emergency
shutdown threshold]
Co-authored-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Sören Hantel <fugininsane@googlemail.com>
---
 arch/arm/boot/dts/allwinner/sun9i-a80.dtsi | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi b/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi
index a1ae092..8e7f8cd 100644
--- a/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi
@@ -941,6 +941,16 @@
 			#reset-cells = <1>;
 		};
 
+		ths: thermal-sensor@6004c00 {
+			compatible = "allwinner,sun9i-a80-ths";
+			reg = <0x06004c00 0x100>;
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_GPADC>, <&ccu CLK_GPADC>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_GPADC>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		timer@6000c00 {
 			compatible = "allwinner,sun4i-a10-timer";
 			reg = <0x06000c00 0xa0>;
@@ -1250,4 +1260,62 @@
 			#size-cells = <0>;
 		};
 	};
+
+	thermal-zones {
+		cpu0_thermal: cpu0-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 0>;
+
+			trips {
+				cpu0_crit: cpu0-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		dram_thermal: dram-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 1>;
+
+			trips {
+				dram_crit: dram-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu_thermal: gpu-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 2>;
+
+			trips {
+				gpu_crit: gpu-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2_thermal: cpu2-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 3>;
+
+			trips {
+				cpu2_crit: cpu2-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
 };
-- 
2.43.0


