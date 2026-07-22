Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA5DC4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOd+XZss+YRv1olA4v5j/GA2GS28MPr0U93YAb8IAO0=; b=MVC8ev7RDjVOH1MF5RXma97xdD
	EzoEAwts2IeTFTDgW30wJCfz5MGcRVL9slnxUE9RdBrJh0TfRPsjX81p0wzcecv1uX/s7gns8BotY
	1mlOMwfrLgPCrQS0UD3uLlIY31QqcaPCRrc7NY//1AylN0IKlh43v68Wm2EH+vZrvBeqtvBV0axvS
	sGG2+bH3au3FJelej6R/ZTJWBwbFQ2D6TuHZVQCNyXyN8ruBQ1avgcSrRFCVQDIROpgtHZR4N4Fx7
	6F7W7Gaj8+LvLoSLYajKCALkE3ebcIHUIU3FsDHm0+5aJ5R+sjMMGghziFmK5GDrWQ57EFYXfgSVh
	Q/hvIghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmddp-0000000Cjrx-0DOc;
	Wed, 22 Jul 2026 20:34:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmddk-0000000Cjpl-1u1S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:34:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso49883335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752442; x=1785357242; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOd+XZss+YRv1olA4v5j/GA2GS28MPr0U93YAb8IAO0=;
        b=R+j8gIqwyM/tSYpmBQL5YRTM4OpDRO7EMvaZz0Ukj5JCXH5AEZx7OYD0DJF/BtPUpE
         jjQplB+CWfKim7+hmDjhBiQot+4Z1LFpkIsxxxyQ4IioEeoPn6wzoWIZZmOhSTBhkMcF
         tAME3oZt749JzeiD3ACK3u1seBSyZGx1Yuh9BSl6NAWq3aUQAu+OdHL1Di0yUgcA1kop
         W8qsbxDtBqlBwXmmw58eILlPC0ecldRTwc8VWmexk4mQsOy+vgEI5m9h5gHu5A7mFrPs
         H0fUWYfbyvTLV0iYqjM+UV5tqWhC4dn7Q2aP8t7yzrJadELAseEBWRmombQbYslLTNmO
         wj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752442; x=1785357242;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOd+XZss+YRv1olA4v5j/GA2GS28MPr0U93YAb8IAO0=;
        b=qbxuhce+xhFf0akRErH3fOg+slyj8E/fnq3FJ2SrOOrBlTBFlrLsGsGmtBuWUD3+Qx
         PjEk0Sg/15vCBpV/cjhyWEjjwXCLOnIMoQ1uoKXPXiQX0rr9J5LJUPouu1QUIstOCVdX
         FFXB8uXk3ybqOJUH5832sY//h6fhKWiZMiDLU/0J1sbfgUnA+UL6S5z7L6ulZ4xYjTIB
         jUzGBru9p+ELfDi7fExG0T/RoFdBfAKlkFwVTh0jZBrXV7CtRhaPYvHzUBXpCi3QnNdy
         sw6zGKEpJFCtN0VkSDEP5MBbCpooR/lLe9h6o+IKcK8IfGvj+Ot3paj+PGb/p+Z/VTBe
         7jzg==
X-Forwarded-Encrypted: i=1; AHgh+RohVZyPmDVBwXVDWO7fwAezj2zgilsPiIKtYr2vI5WRVUZBgZTlvQU1oo8QbU5F050Ewj19tqRJ2J7Fs8CR558g@lists.infradead.org
X-Gm-Message-State: AOJu0YzKLY1t4rNZL5oMSUSycR1SBHmqQS+CbXnuY7l8pypuP/cWGkbg
	S3ZDtfqwztOQj6W7eh/x7wk1hUBwAE6qFs9Ocqxazwo5zX3trYB/WrMO
X-Gm-Gg: AR+sD12YjiWTI+p17D/DFKYVKodNzQBMaipH3tQFm4VN0/u1Wq3YeYTfdMDif+vtpQp
	jjZJdeBceFCr5l0Cv0JhWDE3qGgpwJR5d+3rQGaLC6I9Ap8RZts9ZR8f+p6DBF9id2GklKUYVSh
	Mr85zWf5xayA0CrwarQeEdMmIsrS/zT5AcNUPZ63jy51wJm0zwn/2/atBrM62IA99+rvpj6N2qc
	4XqdR6wMKZBVfv7JpYyfaaa7D8R1RK+xDGLwSgD5dvsARaP57RtAfcsxagjap5oaoyxTfkiRUfO
	qjd0Ji09pvJiNaV1RfBcEvQdgoRgOY4klUXrVZiEJnMM9dRgGWWOZGLVJeGWpLJ3vjSwuoinphE
	KqGVwFXE5wPY/d8Ewcy3/v1hG2ecLjxQ4vHQ/h43c6Kb3KKrqfu8MuhSFi0mpcFVuPkkbg2wP2g
	rvF1MwFFVD4p0EgbUmn04A2hwlBBSeaWpWFLQ=
X-Received: by 2002:a05:600c:1390:b0:495:5a0e:6d8c with SMTP id 5b1f17b1804b1-49573ce8e74mr3160235e9.27.1784752442311;
        Wed, 22 Jul 2026 13:34:02 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956ab2f0a2sm63134945e9.1.2026.07.22.13.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:34:00 -0700 (PDT)
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
Subject: [PATCH 3/3] ARM: dts: sun9i-a80: Add thermal sensor and thermal zones
Date: Wed, 22 Jul 2026 22:33:41 +0200
Message-ID: <20260722203341.2917852-4-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722203341.2917852-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_133404_532405_577E6445 
X-CRM114-Status: GOOD (  14.26  )
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


