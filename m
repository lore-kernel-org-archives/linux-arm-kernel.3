Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2635CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 15:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wLR5ceLyn2LWx78PSXIyJ/Cdj4UA0nZ2YxlclNxvI8g=; b=W2jzyUWmY1KPzM
	Rkca/4tsP9xdImCkN+/vjcKsKm+RkTqCRawS21O6NJ5/7LBQBY9pN1IvWUcu13A/5cpq0e08o7j2a
	h19heOx39+b0fdy47p1w8W78NNJWQk3/kC3G7cRJvZLjP0T2m/wa22i4sggeeSge3c6ExIKFYGxRX
	GJ088/GLdHHiPaIw8YQovl/SdhdYq/FA+xCT9+DbyDz2CSrW3vnt2UYXV93GSLLs4bl2XnJwRzML1
	MtrK23T8syMzP6HqdGmpOrFpSodyZRSwUDcPrhGOalNz3Q1NvP66eMSgZ84ipzWwHPz3wbNYIWyym
	MYCi6eCWncVJ7RWe/Jig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3tu-0000000B9lP-0dVt;
	Fri, 12 Jun 2026 15:34:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3tq-0000000B9kF-43DW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 15:34:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1385172f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 08:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1781278464; x=1781883264; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wLR5ceLyn2LWx78PSXIyJ/Cdj4UA0nZ2YxlclNxvI8g=;
        b=v0ti/JPuDIayfIR4Whh+FQ2ipaK/D0L+5eVnwkmUY0BrZ/yXQmyl9332QuhImaqh2V
         4Oq3rYgLk/iNxKCVIlxrXqYlo0XMhHToKmVqqwQxypyChSuBiBp9gDOdlBhrs+lieTNP
         /vmxW8EZDLrYi2G58ydlG63qwIK+2EMBd8FkFUySJlC5a80JvK5JOYt85dmn5Y7KAMn7
         cknwGeBTuOwAYSlLw7G8GuXyAkM8c9iMIkoIb5hBr9TqamDxSMjVmW3dKbm7+3YJhV3C
         XFEjniGiR3h5U7ckLP1gn36wI7nM41c+NSjm9SlGa8lG2PZ7tuII8S/EtyaDkG8kK259
         XzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278464; x=1781883264;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLR5ceLyn2LWx78PSXIyJ/Cdj4UA0nZ2YxlclNxvI8g=;
        b=FVXYbZiHM6N51wwz3mgLZrWZQDugSakKdaFlZevFo4ilWkX1giKirqANb9ywS93ZOl
         n1l1tq+VXZYc0LraXGgGns0KoqAbbp8j/Gzbnw/27euN+VUthT++5s6FkKcgae+Ddddz
         pgcvTI2Ig8AEYFxMm8POX5GkGCBim+I4xt023wnRHjkxpNmdiAQzACBgDJfFZ1BFAh+Q
         gCkE82Bg8zQZxepyBkxnpH3oSm6lM4bmjmLK7CKu5Sq7712pyLjEs9OeWySNyyu83wcL
         ErEgVyAGHgreaqhtuuHAh7mvOflxOotQV7B9f8dUlvZ6NaIgFN7I76TyEWK3pQTiu68N
         03eQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sfYS6L8k/Jb84OftFR4DxsX5wLo70jJH72sH1QayHkqG4rdp1TbWHweoMpDKvKGz8aVbshxse9XO8YiwXpi0k@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq1bHJG1/bgSYUKyY8rDILcH2CZj1sOfgKmdVnbr8sGelugxPU
	Sz7f1L0Jwftm5da/z6nQdz76687jSSv0JGO7nlwIrn0ThKNzBIcFOP9RC1jnZY+ekpM=
X-Gm-Gg: Acq92OEUuCtqPWH+l0MHcdb26lhsCV1sfAg/XuC+0k6ct5g9RA16LhAJup844Yzg+Ey
	pMyoj0oy5zHKlJptesydxduraY5WI/JlyBPDDzPEm4Gc1yOMups5J5dXKMU9fD/QJqigiAoLtAY
	dOEMK0Ug2Z2QTrvsI/MLtpSOjh+VMXZfJZvb/xgZjElIgwwD1qoUzU8veJgHSpsJXdgVjmgCKoj
	u+GBWWx245wUpH58eP+wFqbcq1cP1DjeZhvmoko//ef2dhLLCzT+AgyxlmP+kUQfZQV6s0lvRdF
	R2mLTzTsx3PHDd5N+0xD3/f/kRQKUVtKO9k6BZvNKodJ5aUgGfHGpyRTTGup3kaLkZoNi+M6BdQ
	WLPP23DG0cXEKVDDFsf7Y5hwJD9bAjJ9HBsR8mjWbYxsHP4Yv99U3NtKkLp30xtbfHuNMGAvcXj
	gLDXCqMkWSZrhpOxCxtPoC7/CEREzpIyGZK8B5IEi7
X-Received: by 2002:a05:6000:41f7:b0:45e:dc0a:bcb with SMTP id ffacd0b85a97d-4606d024020mr4921301f8f.22.1781278464037;
        Fri, 12 Jun 2026 08:34:24 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm6916641f8f.20.2026.06.12.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:23 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/4] mfd: Add support for the MCU in the UGREEN DH2300 NAS
Date: Fri, 12 Jun 2026 19:34:13 +0400
Message-Id: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDXplFq4iljQThmJn7SIpHF3x
 fJbvBchkGcKUGcRPJ0ceF0SMM/AjN0ykGCbDEqqSlaohB1VIaWYzSF0oUuLTjvEDlKweXJ8fbO
 m/R2OfiKzvwe47wfcjLZGbgAAAA==
X-Change-ID: 20260612-dh2300-mcu-5354d1f5f11a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017; i=alchark@flipper.net;
 h=from:subject:message-id; bh=gtvNi33VQsDNDkHYG9DuFjrER9YXOntZMxm2KOrjFjs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTpqP1lYhRlET4n1B2UyM+qz36ft0rIVjyhOk/10c72j
 q9t9sUdE1kYxLgYLMUUWeZ+W2I71Yhv1i4Pj68wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPXEW4wMr47Msg37u+90m55mcYB3d6rIttuMb+3yjqww4XnvoP57IyNDr/8CzVv
 Cqxs1BQ4HV8f9+9lcvWBNYj7nh07+Pw+ttCfwAgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_083427_064732_F7E469FD 
X-CRM114-Status: GOOD (  13.12  )
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

UGREEN DH2300 is a 2-bay SATA NAS based on the Rockchip RK3576 SoC. It
includes an embedded controller connected over I2C which won't let the
drives power up without its register being poked first, which precludes
the use of the device for its main purpose.

There is no public documentation or source code available, but apparently
the MCU is also responsible for a hardware watchdog function and some type
of wake functionality, so this series implements an MFD-regulator
separation right away to allow for adding these functions properly later
on.

For now though a single-bit write to the MCU seems to be sufficient to get
the drives to work with only a board DTS addition [1] - to be submitted
separately.

[1] https://github.com/flipperdevices/flipper-linux-kernel/blob/2c1c5ee609f6ed4c77e9e5428df91e98b3f50cce/arch/arm64/boot/dts/rockchip/rk3576-nasync-dh2300.dts

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (4):
      dt-bindings: vendor-prefixes: Add Ugreen Group Limited
      dt-bindings: mfd: Add UGREEN NASync DH2300 MCU
      mfd: Add support for UGREEN NASync DH2300 MCU
      regulator: Add support for UGREEN NASync DH2300 MCU SATA power gate

 .../devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml | 62 +++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 MAINTAINERS                                        |  7 ++
 drivers/mfd/Kconfig                                | 16 +++++
 drivers/mfd/Makefile                               |  1 +
 drivers/mfd/ugreen-dh2300-mcu.c                    | 60 ++++++++++++++++
 drivers/regulator/Kconfig                          | 12 ++++
 drivers/regulator/Makefile                         |  1 +
 drivers/regulator/ugreen-dh2300-mcu-regulator.c    | 80 ++++++++++++++++++++++
 9 files changed, 241 insertions(+)
---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260612-dh2300-mcu-5354d1f5f11a

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


