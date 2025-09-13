Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888C7CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1pL+OZ1Boa6u+YXgScmmKOffrAx3fdC1TFoaMx+6KU=; b=B4/gWVxWtYgqCCJpVUITX/hi65
	zzTx9h/H/MTV7JF94oGCXo1eopPx1Vv0nx5pAQPevrINCfUONTjlepU0SsCjhmM89NunqdnxpUPX/
	NfunwmbQu2MMf8dpLfb7yAdrkFiHBnjzF+wTGoFeQw2LCgND+P61irynD+T/sLZUQyhz8WY3f3gcN
	8VhbiHY8rguiZzLqIFldk8oCYAJuboLR2VeD2i1mlNql1/fzr9MFZcoXCNMjA5wvNK/18Q8TkZjkB
	JkY5Ias+xe5usIuW2ZdfmYQuhjWir3sKa+OeQOgmTqSt7RKwQ8k7D6zdcZV1WIZdA2o7P95xAn3rx
	8qt3O2yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgk-0000000GJXb-1xHP;
	Sat, 13 Sep 2025 21:21:42 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXge-0000000GJRF-0ldY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:21:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so498135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798494; x=1758403294; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1pL+OZ1Boa6u+YXgScmmKOffrAx3fdC1TFoaMx+6KU=;
        b=CEH1d9W3lZBM+xrvKf4va+WjHejr463yZ8Q6tziEXmtFCmv2N0UdgwqQWUJJtGw+Zv
         fr+ZecFjtl7JtrK3uWxWL/UBRP15N7BumD3yKIJCrVsW0olDWMMd6fyLk99m+sTSkrRj
         pX0ulRqHFAueKwgO2DNp4637b74iRQcWquefKqsb9UYvPhDPGS9wBebjzuJlwNXGBjD+
         O5pG02R1z2f0P8fNbzHDShgakpuupkITf4ASM0XIWgXTiYypJO9jKGByJDpnH+cpOglr
         ma4nUjiwLwe4yj6yZKvjwslk+G975yEDvVArv1+XZ/PUcALxAZusBDSFEg+qb9eR4iP3
         AIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798494; x=1758403294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1pL+OZ1Boa6u+YXgScmmKOffrAx3fdC1TFoaMx+6KU=;
        b=Uinm4DD0iHDm1/8lnaJ5Na+ziIQf0/VMrHZclkUXz1ANfd2XCHF0kGnOy2zOI74au7
         J8C7cj8yiHTarsmdZRx43YDJVeHaE9AA0xwVAdqlkB8M9a2JXYBrFxIZOzt5IP1wVFxF
         I+JMzrex5UTbWojrtsg/eS9hGyo5dYw+s95TfPGxpZFgNncKYApXXjS0tkhbbT9R8STy
         z5ZVGkk6JJ406wWUk40KFwoX2urlqWiCkrb0At1hn0F2ZfyD0L7IBlEL6eKkihDh1IX9
         XtzqX2mNIJciUtjcbD0iMfSQAcSAaQ+Ztm3WXPgkA70u4yPka9D0kviZZE6JgvPg0anx
         Hu9A==
X-Forwarded-Encrypted: i=1; AJvYcCW3hB+UXxLpc+/vQp6BB6a2yexYkIv3AuWeNhVCq2Bn4ueWVQER3JO/G5b7V+ZGG2lYL4WM+Nomw+7Ikt7Ewkaz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8QBuycwnnunfVAoTlt8r7egHmXe0TMLckClBydD2kFm5q92Ni
	hemxH0xT2Uocp4nlbzM0eR+7mALjFXAkwsOK/jAhE3B05LszI9ZgYjxf
X-Gm-Gg: ASbGncsJpzSjiSxCTFQQr1NGviNx+HxNMy6UQ26nZvL6JwjrNNEKkQgRvc1/055fecK
	Co/KLrUyrX+6OxiE6/ZM44tkru4sZccOva1GiNmJ9B/umX+l3KvMmCoIhEeli6hXFyQIkVkSu4Z
	/E/q82H2bL7H8mRaKPxsQmzdn6dDpIy7z9FcQSLOsLIVUxgmN040ZIJzy84bPOl8XeeEMYy/6jq
	CazpXARfMncWOsTgzi43iIrywkYVW7jjH3nNq8zC1o96yvn8elpZR3+EBmUBuOPkBMcbWEt9VkB
	thu6WbYAT7L7+EUoCtJQtdaiLZbPm8JFQ3J2Ej/zWOV/TH4HtghoFvM5sj36KnfgpgzJ5bmCXbT
	d1+5lKwthBSVDMnNAeo5Jk7DGL4q7L4zMcbndf5QBtCfepNEMd1GQ
X-Google-Smtp-Source: AGHT+IEUygTfQFxD0Xjd1YPk8jG2g29zmtJi+7jJLe6De4WxzayNW1WWv1CJtbsKPSYW8CMC/jCaBg==
X-Received: by 2002:a05:600d:f:b0:45d:e531:99df with SMTP id 5b1f17b1804b1-45dfd5ab3bamr97128825e9.3.1757798494216;
        Sat, 13 Sep 2025 14:21:34 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:33 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:21:07 +0200
Subject: [PATCH RESEND 5/9] arm64: dts: marvell: samsung,coreprimevelte:
 Add vibrator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-dts-v1-5-8120cdc969b8@dujemihanovic.xyz>
References: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=jyb7dMVKfzm+pC9ukuRfnyNGN4DBhDuznQcq0ZsICNA=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/j37juY9Cokv79Ivex67/u52+yiz786v2NtQu+Kn
 W9sVvlId5SyMIhxMciKKbLk/ne8xvtZZOv27GUGMHNYmUCGMHBxCsBE+lMZ/se8UnkwxUnpNgP7
 C83rcy38H4a8W2+xQN79ernL5Qu6boqMDKt1+L48Ov2+rGaZ52PZPb8kBU7dail6FLLr4sG8yZz
 LLzMCAA==
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_142136_252771_F808D58D 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

The board has a vibrator hooked up to PWM3. Add a node for it and its
associated pinctrl configuration.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 78b7bccfc5f299889d1b9a8fd2c08554f17eb147..c28c2eadc42cc538fc5491ecdfcfbe0191004794 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -121,6 +121,15 @@ backlight {
 		ctrl-gpios = <&gpio 97 GPIO_ACTIVE_HIGH>;
 		max-brightness = <210>;
 	};
+
+	vibrator {
+		compatible = "pwm-vibrator";
+		pwm-names = "enable";
+		pwms = <&pwm3 100000>;
+		enable-gpios = <&gpio 20 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vibrator_pin>;
+	};
 };
 
 &smmu {
@@ -365,6 +374,16 @@ sdh2_fast_pins_2: sdh2-fast-pins-2 {
 		pinctrl-single,bias-pulldown = <0x8000 0xa000 0x8000 0xa000>;
 		pinctrl-single,low-power-mode = <0x288 0x388>;
 	};
+
+	vibrator_pin: vibrator-pin {
+		pinctrl-single,pins = <0x12c 0>;
+		pinctrl-single,drive-strength = <0x1000 0x1800>;
+		pinctrl-single,bias-pullup = <0x8000 0xc000 0x8000 0xc000>;
+		pinctrl-single,bias-pulldown = <0xa000 0xa000 0 0xa000>;
+		pinctrl-single,input-schmitt = <0 0x30>;
+		pinctrl-single,input-schmitt-enable = <0x40 0 0x40 0x40>;
+		pinctrl-single,low-power-mode = <0 0x388>;
+	};
 };
 
 &uart0 {
@@ -409,3 +428,7 @@ &sdh0 {
 	bus-width = <4>;
 	wp-inverted;
 };
+
+&pwm3 {
+	status = "okay";
+};

-- 
2.51.0


