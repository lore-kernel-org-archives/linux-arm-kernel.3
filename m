Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F7ACD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 07:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ti3aO8Zn2qwqlJrE/LtPSs6G2aaVeGfvnqG893sDUic=; b=AguW75SXdOQXXA52XsRNITWLks
	YO0OZbpsbVWtqRaBLZMqUszk9fC36hzDi9/hGDVJlQv/hlxR2eHdxNpMHhIf4oOWanqVKiACB0CpL
	WaMOnrWfferbPHC/Ax/7/Weezgfh/y90rRF4lmjpHjge4q48H9TDX5010M7RuYWBlNY+HOdSWwGbS
	PS5uOwPiWkG8TyKqfEcpQiJwzT8E2HVlaAcV8iZTiGJwR7gfNnCe1MQ+1hdBnhU1ktgs7XKXJQONb
	jn9DNO44Z68muGv+p9dX8LmWuSpaHV+xuM+Z2+u/FPBIztKCQ2EQ8IeZM/AffjPP/c8JzQeIKfYys
	JkQNqP+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgz-00000000Cx7-0M6z;
	Fri, 05 Jun 2026 07:10:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgv-00000000CtN-23Md
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 07:10:06 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45eedc94d37so784585f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 00:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643404; x=1781248204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ti3aO8Zn2qwqlJrE/LtPSs6G2aaVeGfvnqG893sDUic=;
        b=sUmBv0CkhRtQiZcQxdOySgT/q2zAPPsdmbdYK6n57eAzve6a1Z9bqwj9fXTj1han1U
         pl5XhcDLtrIUyJ9p1UiQRVd7H9ZtgEPnb0Yifk4DsdQSZUxe4bPE8gSw3askMveMexDG
         y9ZuxejEERQYiJwPu9ttpYbjKj+KJK797KDmkp7OvTeZ4eOznDX5xMlyZXVOmuaRlOAh
         sLmp4q3ZgsVdQF5De4cbOIqXDQgXXodvABQHwlB4WEzldXHaHuZi6IWdV/I5ms6SKAvB
         Wimyc4nt5ocMKVz5R4fX1eIjjwy3aSn+KBMRxOOpLRjrgdxsW2Ly9D4NVAS5zGSFiG2E
         UFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643404; x=1781248204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ti3aO8Zn2qwqlJrE/LtPSs6G2aaVeGfvnqG893sDUic=;
        b=Q/2V1LCEXccWg/zFVlzRszIPOF+AS3AJIBGaCQ6R2AfH+LDjs1TjvY4XCzeCHWq77G
         Qk4AwIxu75g0Y3v3VmDjSvOIPldAa4xk4zukPtL6Qx6RbDujVDeChk6M2ATuCc9bDXKI
         n4ztpDLLRXc43/RVsgweWmeZGYhnrCIP0rlmxy2vKUF3CWI4K/LSfCNxE5Ik++edx+yY
         3J0hhU6tVjx20FCAlxuAyJ+L/pBCoSS2LHct2n6c6uZJ892ngDshtk86npO5z/JQ4Kfj
         APeKYKM6AfBwDUEaoF82twBp3ejA9qv1qQtUPgYHqGJ1feOp/sWwVi2cnjeHlZokVCIv
         +4TQ==
X-Gm-Message-State: AOJu0YwLW85rjCB6440r0uyBZvcjNv0/GVDXj8my8o0uX8hDWhvs9GfT
	qC2E0I5ojjDoM2KavyFe3fMqqnUAgohYenB19VxYDY76M9Wq+LcKq4vHnnjmnxQ91SU=
X-Gm-Gg: Acq92OGmoPvJYzwi6FP8TS60I9CDmWjGcGtnNycG5+LgXTDYNtIsie7uEPqysvXG/kS
	US6DSVCAsHIqVkOJ7m2DZ9LfQM2qeKAl5tzaOssHurNOQHcwf4aO//Kg63ogr9UEyrzsz41bQDp
	F+D3Nknu8Xq6QHFIoe3SiJEZvJoSivyMZZl2+K1FJKX7Ai/Vy3Yfnurzl3KeABluol6y9EC5LYN
	awSxbwT6vcdI2/xUAj4+1yOaZVbKhwli2YxVMqOWl2ghl//zwU2Igg/UNRrwaeEFs1533K272Xr
	TtTIHqKen5xZhaMjzml4POUGOAyymBU/wSj+kQNgtw4enCWmrYWBGxXR2NrU/onC5JxN9Qw4gox
	rczSq7EFosc6ldUT0DV9zA0y8wSME+W/dIao63DcXHdQGWAw+DzjLeW4xuJDDYN6VvZPXO7mYBG
	bCWI1JipZoid6KUJ4bmMUhFmICy7TB+gT1IlYi+/BLP2EwkAfxss3AUe83ToMtlUhO5IlGISTYv
	ijWyRH1DUWSeEM12BoK4A==
X-Received: by 2002:adf:fe01:0:b0:43d:775b:c9bd with SMTP id ffacd0b85a97d-460304fadf5mr2671883f8f.10.1780643403511;
        Fri, 05 Jun 2026 00:10:03 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:10:03 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 5/7] arm64: dts: allwinner: a100: Add LRADC node
Date: Fri,  5 Jun 2026 09:09:19 +0200
Message-ID: <20260605070923.3045073-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_001005_547288_705C62E5 
X-CRM114-Status: GOOD (  11.43  )
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

A100/A133 SoCs feature a Low Rate ADC (LRADC) for Key application.

Specs:
- Power supply voltage: 1.8 V
- Reference voltage: 1.35 V
- Interrupt support
- Support Hold Key and General Key
- Support normal, continue and single work mode
- 6-bits resolution, sample rate up to 2 kHz
- Voltage input range between 0 and 1.35 V

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- added allwinner,sun50i-a100-lradc compatible
v3:
- new patch

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index b3fb1e0ee796..7cb06b19b5a5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -466,6 +466,15 @@ ths: thermal-sensor@5070400 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		lradc: lradc@5070800 {
+			compatible = "allwinner,sun50i-a100-lradc", "allwinner,sun50i-r329-lradc";
+			reg = <0x05070800 0x400>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_LRADC>;
+			resets = <&ccu RST_BUS_LRADC>;
+			status = "disabled";
+		};
+
 		usb_otg: usb@5100000 {
 			compatible = "allwinner,sun50i-a100-musb",
 				     "allwinner,sun8i-a33-musb";
-- 
2.54.0


