Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B44C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tfx8AHr/yIS8tp/7G1Y7pM5wDQkLVkrc9vIVDSWIJkA=; b=y0JWs78bSp/l4XwYDlP8mRcJs+
	stOOil8xuIzy9CC0XgYQhlPgIbNHOPxZKGQ/CNLushcHAmRe/FEvKEXQl08h/GYsjrWej+zXOY3YE
	0vNwz4OAlFduiZUAm83VvG75kZzUxLIQtJqfklzFK+wBRam+RS4/eOSFZXjjzp7A++x22lYn1oaTX
	Jz4ltLuxd/2g6LJH3vx3ubXpYu6U7cUyxdJ9SkjOhHJLqX3YZV3JG16YhZMY6fAxFAmIqJjRR9Yw1
	JxrseF8FlcTGtAPBF3QieEzh8QwNPek+rtUGxPlGiqz5G5EmXf4Ht+Lg/i5KzxHFwTahhVCvLeVFL
	lK7LYFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xWk-00000003CLj-3C0f;
	Sun, 27 Apr 2025 08:38:18 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xLL-00000003AyI-0eTE;
	Sun, 27 Apr 2025 08:26:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7369ce5d323so2974873b3a.1;
        Sun, 27 Apr 2025 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745742390; x=1746347190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tfx8AHr/yIS8tp/7G1Y7pM5wDQkLVkrc9vIVDSWIJkA=;
        b=lLewq1z9Qka1OuKQU+PFIz4mLCgyLp8IDtotG5WxUkerpcZysU61bSNHVkQsArekry
         88OwHgI2mdPcr+nu8hxAxvfzuwvyfCgYhHkjyGEbWZyRIkod+xLUMSwpcF4rXM/AfBd9
         3tNfODtUUgZETvqRUG/4dwKP+slWzdXkdqgiL+SlGaNTG9mJ2ZZvrSaVu7C+NWSm3xr+
         cWpizo2fwHPqRHwtm0YX1uZFwSxaFrND6QhuCZ+ZGysi4oD88fGqT+gET4AiqMgS8o38
         07x15WRa+cw5MxvQXp0oa7inkM5wgpYZBQLsMIMkiCxNEYAYyz0Nb8uli3D4ovAK+FFg
         Lx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745742390; x=1746347190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tfx8AHr/yIS8tp/7G1Y7pM5wDQkLVkrc9vIVDSWIJkA=;
        b=r5BqrH5FjiAAbTCjceL+otiasBIysmgFvWfkboxacdwvFFcE5O72u1ZxnCvLIdI8JH
         unihpCKZB0bF2b3k1KSXrjSGLRjNOQaH9zqErF0Cewre3cBCfVzGaYrU5lHauJW90Vmk
         0zk5MOIlAEd3SeUFdGU7XZXukn/V4UwazXV7t40+OtQIq9fnH0YoSgM1Qiq1F6DKu+2q
         PkXFksrHEeKT9r+2VV8xjaslrnmSWW7YqaHYX+nOiJlQ7yYHk9nuWTGf60hJc8ell0Gl
         7bjr4ZxAVDifywHPJQDidVTGw+8lPxfkaA+BunmWFQjPQ4/6kkeSNNSySgRS+mW4fsB1
         tQlA==
X-Forwarded-Encrypted: i=1; AJvYcCWfaV7yOY2J56WusDoHhAYW+iQfT/J9lTINwMazbaIpHGFrQOuuM1rC1pt2iB4rAMb6ocX7ONb4z/VMRy1qLGv1@lists.infradead.org, AJvYcCXeWDfJKEp0jxXpiDQVJfxXKODidHgLHjiY9OJDQqEFGHi/AgV1QbqY+og9N5Bqnf4UnLxAVWNi19TmR/KJPlxq0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Jc3tJ6U4PJs5Dxai/FgZqB5WUfRHS5kJAv/vTWhHrXsUxZkp
	PekrHdYsxEmpNCpwALcTgaGrBtH6JKnGIXUY/ct1Ny5S043cS3Vd
X-Gm-Gg: ASbGncsGNRdfYKT5EsD5Fo7CHftrzgLO24PB+5QrrZU0izQYnqufBHbuhy+rewWYrBn
	SRu6aN3J6hx0vQ21O1CzkC8sODritY4Bdk5Pv/aR4exiqys7ksSYbFiLVzMe8PWgJtIK8BZl0qc
	+ud+JQWDyuQZebxY1g4e0AxVD8Iwevhy0UNXSGuPXN1VS3LG+Hi9FAHQ0SvF4/b2ITsGCNRf6EW
	z0aKIipyaCgEgHlpx4B3p/Uft6Ut3d5rM8WK4OR2X7BacRjg0FHmZz7ptPPMPR08qwdrQHfH168
	A7fR+tzw0zBNKnLVRmoR2TaCzgAFYRarHNHDiqVH5vGFgCiw/pllgQ==
X-Google-Smtp-Source: AGHT+IEzt7O6nxfbxNZZfuE1bP+CHD3uFhriBll+5j0uMVFN7BYF4H32/W9H2w3LsDhK6SwCjKCA3w==
X-Received: by 2002:a05:6a00:114b:b0:732:2923:b70f with SMTP id d2e1a72fcca58-73fd74c5d0amr10293019b3a.11.1745742390591;
        Sun, 27 Apr 2025 01:26:30 -0700 (PDT)
Received: from localhost.localdomain ([14.171.43.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2549f570sm5900852b3a.0.2025.04.27.01.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:26:30 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: andy@kernel.org
Cc: geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v8 5/5] arm64: dts: Add LP5812 node for Raspberry Pi 4 Model B
Date: Sun, 27 Apr 2025 15:24:47 +0700
Message-Id: <20250427082447.138359-6-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427082447.138359-1-trannamatk@gmail.com>
References: <20250427082447.138359-1-trannamatk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_012631_196448_B8A07B94 
X-CRM114-Status: UNSURE (   9.23  )
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

Add the LP5812 LED driver node to the Device Tree for Raspberry Pi 4 B.
This enables the LED connected to the LP5812 to be controlled via I2C.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
index 353bb50ce542..2f058cf5d76e 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
@@ -152,6 +152,16 @@ &hdmi1 {
 	status = "okay";
 };
 
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	led-controller@1b {
+		compatible = "ti,lp5812";
+		reg = <0x1b>;
+	};
+};
+
 &led_act {
 	gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
 };
-- 
2.25.1


