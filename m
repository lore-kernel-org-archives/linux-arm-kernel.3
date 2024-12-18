Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D76E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 07:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G7OyGeVhZnbClojdUY/8BygxbsEIReJurkJRAUyyzPs=; b=fVXw8sEKygq6N5tz3zGu0B5QA3
	pvlCDfLb2alVLehiw17PXpLHPtOeUYyM4Vw4AWt38r6hj+oQPxgwU/GnBKL8aE24bMAETo8Tt19ou
	bkTY9CSj1KN2LRGWhBoGfwil7XrCbqiZwFp5H3yG99KGttw81PrtZYEthDPpFHnOR1LdvZhoN/N+u
	t4HNI1SSbBhKIFpTBfBuH0Bgb3xCzvY1ILRjGvCoUAYxr7cWaqyYGpMAs6FDUhX+udpOhYn8g+OOX
	lg4K0rkFjGT5ef9inrvVypPl0oDeFSzk6Ur88BVYV1RC8uGN9V6QC0fFPtk/VGvbtx/yg+Em7x6bf
	NfrtRvgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNo2R-0000000Fm8z-0rZv;
	Wed, 18 Dec 2024 07:00:07 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNo1K-0000000Fm2r-0mQ3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 06:58:59 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2162c0f6a39so3973195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 22:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734505136; x=1735109936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G7OyGeVhZnbClojdUY/8BygxbsEIReJurkJRAUyyzPs=;
        b=cI2Ze6Ga8DdNVRRKbAlWJovoijgjuBy9wuk+F86kZVThGEyJQsw7V47I+bmNX0QEK8
         f2ZCFMUaMx7OHkAPRGvj+kKfG5D8lvLI2+d4fXNAs3LtY5dlf8uyIky9j8qX5Xr9C8ov
         LBWywVz3+pJzCxIkm1aGqGdujD5l7N/+ty0TiO6BbZ6XrY3maOuaeWIvIhfp/C7iN71W
         Ds7Brihr5Y+lj3wytQdxL3cVTb0bBTEyQ2cmqVSTvqbHvjvX4V8iJmxyrFy0oFjRTZmE
         2wgOo290nTqit4RXK3F1EfgXjCR/bzgyj9DkwNfXLm4g5Jjn6jX+EvwxspDSyIkDpf1e
         Z4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734505136; x=1735109936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7OyGeVhZnbClojdUY/8BygxbsEIReJurkJRAUyyzPs=;
        b=ed0U2E6rKu/3M8KonKlyXL0/Suzc0EZ0Z6gFygQB21Lrppx7myqCmUtI3PxSg4GJ1F
         LziMVtebjfc8qgVhPFKnRrIGLA4z6RkD+ueBJTzpj3rQdcH6WZRv7eZdZPcXxkaJpUeA
         V7j6WxnreZsSOTb9lx2sKcidpGNtI5FNAh/sVP7lJShtHPn3jEIo0Emqg8iU+VQAzOrV
         dVpKp4coVoUrWNR5+XPgWhJuliTrj5RF9yDJSSRYLJ0p/BLTHtnXPAP0CWOtyu3e0iNo
         WxsCPW1ifBFsYSvXek07lNxAuwXbSxNksWHNsz0WLn4n65XR5Gkj/1GA8mAM4XxYLKnp
         NYMA==
X-Gm-Message-State: AOJu0YyJzUKzCx7hFkJ7BG7CuOvzzQCqbTNg8ohFmbbKMpUy5cc+utOB
	YgArQ043OWpf20/ZIFMSjIepzKBJ38yAmuKN1clLvKz3RXWtqEnL85uxsws+
X-Gm-Gg: ASbGncubN2eIsr7EJtQ5m8xI+WIf/H7v+KXy26pLYZm6wMD50mFFes+7doSy4wqZ3fW
	xxa/sc8gSJzGg5xbbFlRlkYPb+oLqrn+GHdNWUp3vxHUEz9q2DRi+246FIa/hw8p92ogIcS4r70
	lHyjwAKKiCo5BA+9oqjvvJ3l9HNhizQEGjLFL40nt9nb0D9Wkkw/bTCWopot6ARUrP9mjMtql1N
	QzKGFdFtWFlEapoFDnUqF8VPWP6XKDE93detoxyAMblsRFFAYP7k8dLgToEtIrNzWejei7Cx2w=
X-Google-Smtp-Source: AGHT+IHunQCrzWf6//mYuxztn8NEiaAD9Ml9awTqJKWllifBwWP+aLkVLEmXDq4OtDZBfs8D/HK9sw==
X-Received: by 2002:a17:902:c942:b0:215:758c:52ea with SMTP id d9443c01a7336-218d729200emr25585305ad.9.1734505136487;
        Tue, 17 Dec 2024 22:58:56 -0800 (PST)
Received: from localhost.localdomain ([103.158.43.22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e652bfsm69192275ad.243.2024.12.17.22.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:58:56 -0800 (PST)
From: Poojaa R <poojaamonica94@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Poojaa R <poojaamonica94@gmail.com>
Subject: [PATCH] dtoverlays: Added DT overlay file for MAX98090 and the detailed steps for its usage is included in https://github.com/Poojaa-Rangaiah/DeviceTreeOverlay-for-MAX98090 .
Date: Wed, 18 Dec 2024 12:28:48 +0530
Message-Id: <20241218065848.12254-1-poojaamonica94@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_225858_245218_3C417E0B 
X-CRM114-Status: GOOD (  14.77  )
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

Only the driver files were existing for max98090 audio codec (playback and capture) but now the max98090.dts file is also included in linux/arch/arm/boot/dts/overlays/.
new file:   arch/arm/boot/dts/overlays/max98090.dts

Signed-off-by: Poojaa R <poojaamonica94@gmail.com>
---
 arch/arm/boot/dts/overlays/max98090.dts | 96 +++++++++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 arch/arm/boot/dts/overlays/max98090.dts

diff --git a/arch/arm/boot/dts/overlays/max98090.dts b/arch/arm/boot/dts/overlays/max98090.dts
new file mode 100644
index 000000000000..eaf197384edb
--- /dev/null
+++ b/arch/arm/boot/dts/overlays/max98090.dts
@@ -0,0 +1,96 @@
+/*
+ * Device Tree Overlay for MAX98090, MAX98091 Audio Codec.
+ * https://github.com/Poojaa-Rangaiah/DeviceTreeOverlay-for-MAX98090 => for more details.
+ * MAX98090 audio codec as master and Raspberry Pi as slave.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+    compatible = "brcm,bcm2835", "brcm,bcm2711";
+
+    fragment@0 {
+        target = <&i2s_clk_consumer>;
+        __overlay__ {
+            status = "okay";
+        };
+    };
+
+    fragment@1 {
+        target = <&i2c1>;
+        __overlay__ {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            status = "okay";
+            max98090_codec: max98090@10 {
+                #sound-dai-cells = <0>;
+                compatible = "maxim,max98090","maxim,max98091";
+                reg = <0x10>;
+                interrupt-parent = <&gpio>;
+                interrupts = <27 2>;	/* GPIO 27 as Edge_Falling_IRQ (2) */
+                maxim,micbias = <3>;
+                status = "okay";
+            };
+        };
+    };
+
+    fragment@2 {
+        target-path = "/";
+        __overlay__ {
+            clk_oscillator: oscillator {
+                compatible = "fixed-clock";
+                #clock-cells = <0>;
+                clock-frequency = <12288000>;  /* Frequency of the external oscillator (mclk = 12.288 MHz) but can also be 11.2896 MHz/12 MHz/13 MHz/26 MHz/19.2 MHz. */
+                clock-output-names = "mclk";
+            };
+        };
+    };
+
+    fragment@3 {
+        target = <&sound>;
+        sound_overlay: __overlay__ {
+            compatible = "simple-audio-card";
+            simple-audio-card,format = "i2s";
+            simple-audio-card,name = "MAX98090-Codec";
+            simple-audio-card,bitclock-master = <&dailink0_master>;
+            simple-audio-card,frame-master = <&dailink0_master>;
+
+            simple-audio-card,widgets =
+                "Microphone", "Mic Jack",
+                "Speaker", "Speaker",
+                "Line", "Line In",
+                "Line", "Line Out",
+                "Headphone", "Headphone Jack";
+
+            simple-audio-card,routing =
+                "Headphone Jack", "HPL",
+                "Headphone Jack", "HPR",
+                "Line Out", "RCVL",
+                "Line Out", "RCVR", 
+                /* Uncomment any of these below lines if the Line Input(s) is(are) used else leave it as such. */
+                //"IN5", "Line In",  /* IN1/IN2/IN3/IN4/IN6 (For single ended input) */
+                //"IN56", "Line In", /* IN34 (For differential inputs) */
+                "MIC1", "Mic Jack",
+                "MIC2", "Mic Jack",
+                "Speaker", "SPKL",
+                "Speaker", "SPKR";
+
+            status = "okay";
+
+            simple-audio-card,cpu {
+                sound-dai = <&i2s_clk_consumer>;
+            };
+
+            dailink0_master: simple-audio-card,codec {
+                sound-dai = <&max98090_codec>;
+                clocks = <&clk_oscillator>;
+            };
+        };
+    };
+    
+    __overrides__ {
+        card-name = <&sound_overlay>, "simple-audio-card,name";
+    };
+};
+
-- 
2.34.1


