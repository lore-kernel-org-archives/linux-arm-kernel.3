Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FF3C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MAoqGjsKjKYAcfl1FF0omT/hBVvR9f1Og52o3S2J4zg=; b=UWKQrx+PdJSATf
	Sy1EAc0TfCxgcINIR7GOL7eyUh/MCbtcWlNuFkWvWgBAHv2tTfL3nVP/tlXJsvgRpf2ySqhWNBBLl
	U9EMV58EZIxtrL/H/oH+zd9FBf9s0tF6RMQeAmVTd7NmZr1g12srIyxvokHEO+jWksgoCcmvgEOdN
	nUd9Mfrtjn3xsxx+b8dLt/Z2X+nz520+F0cdRgSn+WtZt7hFNwwBRr2e6C/Q6KdWPSBubZU9o8gq5
	xoOVoEpeotXzgGRC9iCRiPVfGg0uh8PtYXNZJjBn/ORAbVNeTHCB0WteA21N9ea+KNNPpHuUj/uKy
	hMdzqZgiq0liwKH92YAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUzD-0000000B4in-2tSH;
	Fri, 07 Feb 2025 20:30:03 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUYo-0000000B0Le-0HzV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 20:02:47 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab7800d3939so306499866b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 12:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958564; x=1739563364; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MAoqGjsKjKYAcfl1FF0omT/hBVvR9f1Og52o3S2J4zg=;
        b=G3fHELw8OMm0qHd02oN2GVAMYBTG1q+d/qC1dxHG9fqVp1cyipBgY39xap7XhxKKDB
         /tyMQ2PttqDDSVVvLWI8MJtnRUsVtWXCEacHfUhan/+PMYNM69Anb+jkC7yG7CLaB6eH
         Dprqcq/m+6xK99pMNsHixC/Ta9JYYcI7Q+OaQ46iaOVXTKkmTtjku4+fXnarTnrHlkBV
         5XurTAOXJA+lWpxUimPzQmEaJGZRN5ttS0itWZMp0p6oWpu4WqY0+D6z6gQE7W2hJKbo
         UeMMhIG/OCnF6N1JbVuXvPLq+oFdMcKi3OZplPOQuxdUMSTEXBE+l+RBjtAeZev9Cw4A
         YKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958564; x=1739563364;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MAoqGjsKjKYAcfl1FF0omT/hBVvR9f1Og52o3S2J4zg=;
        b=Vb5+QDVkx6ka9PUSMehL37YsTHKK7+XWSVwE98dEUkj3Ti9r8cUM3A66ldspNx3SLa
         BAFZWMNqDsEfIFz5Rr4L6/L+JZ9zkG/zi/qKN9EsT6fmRS9Hn15ORdiIHV/Y5gIfJa7q
         vjjxuqV6WZDTYebeuTs78QV1aKjygO+CnU83AhRvgNwWtzgZRpKqBe6+pwuwkQ20YU99
         RtiHHky4SBuxXSJ/MVgKrPBIzmUNieHq23cZMNnSbHW0qxq+SIM1ZZJMxTu6FxCK+Blw
         9R4cogGvqkajefqM8vQC9UukQLZq/arqCJ5j5qrFwnv3qC4rE8C0+nMSQoZLlmwx4uD7
         /Tnw==
X-Forwarded-Encrypted: i=1; AJvYcCWsY75/4h2GWjxEnEQ/uWJw8RS+yrsk/4gbqpTXr4XvtCrq+0VgVa/Rh/71hXkGnScOiBqf8lDJqz22TpsWmXI1@lists.infradead.org
X-Gm-Message-State: AOJu0YxPmPyxBEG88EWROJy/Zod3+71yHQi+evg7Tz86qULyT5Hv7jTw
	miEt9T/c1n1eKU2D5De1MgWo/3xh7piM2zSiJbc/ElS3AF7vzwIb
X-Gm-Gg: ASbGncuP7s5w94kihaMIaSfuimD8NldDR4hK2Pw8NePuT4d1sSZszLJS1TwFKxUhLX6
	voz5S6YmzyE1LbeejNoHOsmsd99PWjtCulem/6gF5l/FhvpLH5TMmpY5ZSbCqku3cW53wCRHZNC
	JRBmEqXZxdvTzbhxsU69QgRv23/iKhusqcsoREzHzq76iFOMpI+mFqxLHO4ksOk/1hzBDy1rudh
	BsBpFFacG1eqbHcZhiF6Gj0cZUmlNAdPxTLl+yQiUdGNGzNobdeXe4WBiU+zNmbehIDVQmlOntu
	fpUb9sJCGDB1WIwiObIBfwnp7GOG1xk5UFAaBy/NSGzcjOYDQjjcbivC
X-Google-Smtp-Source: AGHT+IFCIU/WMo5fR5DhFgQY023VWnV7TO15nPnUoYJLvw70AT6oyrtEhwvHFV1d+unGDpOvscUwtg==
X-Received: by 2002:a05:6402:34c7:b0:5d1:22c2:6c56 with SMTP id 4fb4d7f45d1cf-5de45022b39mr5550778a12.17.1738958563980;
        Fri, 07 Feb 2025 12:02:43 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm256797a12.45.2025.02.07.12.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:02:43 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH 0/7] pinctrl: bcm281xx: Add support for BCM21664 pinmux
Date: Fri, 07 Feb 2025 21:02:39 +0100
Message-Id: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN9mpmcC/x3MTQ5AMBBA4avIrDXpD0NcRSxop0xCSSsiEXfXW
 H6L9x5IFJkSdMUDkS5OvIcMVRZglzHMJNhlg5a6llqimOymFWIlDg72jKtQxrrGGd+0iJCzI5L
 n+1/2w/t+2nif9WIAAAA=
X-Change-ID: 20250206-bcm21664-pinctrl-13cd7d3f7866
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Christian Daudt <bcm@fixthebug.org>, Sherman Yin <syin@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738958562; l=2917;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=PVJ6I93uY0R9A7EkGpZMTr75rFuHDwRPliUXmsFjesA=;
 b=GlcJmGxxUMO6rkikwfKoNX9DJ6exqY44G8qXnStLQrxv8D6P9NvNfia+15DlyTlJVBlV0l3uD
 xRR6NEXcgm/CqVEWlCsz0pMwab9OOhP6NvLYGEUnl4DDinuphrEk67C
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_120246_114064_D1CFB4C7 
X-CRM114-Status: GOOD (  16.91  )
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

BCM21664 is another chip from the Kona line of Broadcom SoCs, and
its pinmux shares a lot of similarities with the BCM281xx pinmux.

Add support for the BCM21664 pinmux controller to the BCM281xx driver.

This also enables pinmux support for the BCM23550, which has an
identical pinmux config to the BCM21664 (hence they can share a
single compatible, brcm,bcm21664-pinctrl).

While we're at it - fix a bug that affected higher registers in the
BCM281XX driver and replace bare "unsigned" with "unsigned int" to
comply with checkpatch requirements.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
By the way - while working on this patch, I noticed two things that
are not implemented in mainline, but seem to be present in the pin
controller regs according to the RDB[1][2]:

- On both BCM21664 and BCM281XX, TRACE* pins only have two bits for
  DRV_STR and no HYST bit. That seems like it deserves its own pin
  type; however, since I don't know how to translate the reduced
  DRV_STR value to a drive strength in mA, I did not implement it.
  For now, I kept the same type for BCM21664 as for BCM281XX for these
  pins (standard).

- On both BCM21664 and BCM281XX, two SIM-related pins (SIM and SIM2
  on BCM281XX, SIMDAT and SSPDO on BCM21664) have extra PUPM0 and PUPM1
  offsets (bits 11 and 12 respectively). Vendor kernel does not do
  anything with these bits, so I don't know what they do.

If any Broadcom engineers could shed some light on these, I'd be
grateful. Otherwise, neither of these are pressing issues, and this
patchset is complete without them (they can be fixed in another
patchset).

[1] https://github.com/knuxdroid/android_kernel_samsung_baffinlite/blob/cm-12.1/arch/arm/mach-hawaii/include/mach/rdb/brcm_rdb_padctrlreg.h
[2] https://github.com/s2plus/android_kernel_samsung_galaxys2plus/blob/cm-10.1_base-4.2/arch/arm/mach-capri/include/mach/rdb/brcm_rdb_padctrlreg.h

---
Artur Weber (7):
      dt-bindings: pinctrl: Add bindings for BCM21664 pin controller
      pinctrl: bcm281xx: Fix incorrect regmap max_registers value
      pinctrl: bcm281xx: Use "unsigned int" instead of bare "unsigned"
      pinctrl: bcm281xx: Provide pinctrl device info as OF platform data
      pinctrl: bcm281xx: Add support for BCM21664 pinmux
      ARM: dts: bcm2166x-common: Add pinctrl node
      ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI

 .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    | 169 ++++
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi    |   7 +
 arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi   | 297 +++++++
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             | 849 +++++++++++++++++++--
 4 files changed, 1259 insertions(+), 63 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250206-bcm21664-pinctrl-13cd7d3f7866

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


