Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D58EC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 20:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NCzEvvz/4hdaWug5SuXohPUbQgRfC2p1Rd/LU9zrC4Q=; b=oJBkMe10USI/BA
	8y4AcnKqbqP8C9NzwFKeaMhQ1TFvEwEZvYNCSuneNMA622EB5wxH6rCQVtiMaqtWLeaeQHvBmU15x
	b7nYm0osoxIPF59GQwG99+sr/PXW9KpP5NlKE8y+ulfR6JWAJsLfcurifiIQIBjAl7ySrA5giH5Tv
	SlYS0b/VM2Mce1fwvvYRz52VLCPJVh3soiGWTyTathAyFaLB6ljj0wUUOERRgxB4EXKK5Go8ohGMd
	yYd0Osn3k+2+U7KY73lGaJgbglYdMvINCqYPqywFvT2hrxurSF3Rt+5O+SpKQmvYZTxywROeFtGU8
	YMugHJaft9m9Er9EHLXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZj9-00000006oCZ-3UWx;
	Fri, 21 Feb 2025 20:34:27 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZhT-00000006npu-27Gm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 20:32:44 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5ded51d31f1so4350190a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 12:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169962; x=1740774762; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NCzEvvz/4hdaWug5SuXohPUbQgRfC2p1Rd/LU9zrC4Q=;
        b=URa2X7KUkFTAoJG3sd4HNvlg/Pt6uTNLLPFO7ta4LVITQyePxB7rQhHo2ZHY6PWNKj
         4nPVb+t3Wc5QQnM3VJKQrMfiKHHF7wx8jXTbZhcbsE4bdnt+JyaQDzjiOboNcBB62ABm
         bFSaDbZY07S6x4hLqNQ6/rHemeCaHsvapVXef7Jvn+CUTVZvPZbUCYiBNcotlNmwF3S7
         mO9bnhnaMBNkxdfBrgmFOH9O//L9bePMNi+ZcWvClGhDlQX+dN+zTmNouQ9O3dSRPy9J
         XHs0UQLD2pDoGu01u2Be1F9Yu4ao99xEjYU8DlalSLPLPstJVmzRU7PtdaXtmWrfNYbk
         73gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169962; x=1740774762;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCzEvvz/4hdaWug5SuXohPUbQgRfC2p1Rd/LU9zrC4Q=;
        b=mYuv5zD5MyVYBpRDoJ2+T6b2dSZaTv9GshPCxRA5YtmJdGjtQSZ1GoyXvBzFOHOGRx
         e8Hn7v5EnHEMiRvkAsC6AtuyS2lDhuOAtsIvx/0OXliWiHoB35/zlskVKsTMQcUdZ5BS
         AUsnAMRvShLQCBe95SM5MXHl1RcNbzPz49P8spr8qBQ3ywRKoNq0yXlIm02c9/tQZC4R
         uw32zs4EZ2LWzIGFO9jOvvCs6YbnewM6MjhvzxOoRE4WXjjGmGi3J2e8S64HH60m9AGf
         jjr1KLji0iFrI/wXcUY+LwwzbP+2bjqcm9oUg+GQfsRNSBao0nefCCfQMcYvtD7eBXtB
         znwA==
X-Forwarded-Encrypted: i=1; AJvYcCUOWRWWnXQNICNKj7fieG+Yrn5vCd/6FnJrlcYLSd7fCmGA/0Pqw0/8ToTEaSYwQvkJOSgoocrfTwpT5hF82729@lists.infradead.org
X-Gm-Message-State: AOJu0YyrZpJXiVQGt1cjoFnKyQPZ5CanxYL5ZERtXnZQA7ShAzsJd+ON
	rcHDG8HF5xuVJYfEfZG9KjsA0qYbGqywV0Gp9mu1ePCYwSJqyQzV
X-Gm-Gg: ASbGncsOLTrSeJ8ZHjoXx36ixBLo50qUabHIdWUFBPL8OWcQTwHU7si+X49f7cD4xtM
	qUbfwahFG4g0bU3HPCnhBCwFXvPvt9MsvfECTTcqpfjZIHBdi9k/WcgOnc+4sAYpn3ZGvP8PI0a
	sEeY1lwYfsmqWkutApbpBAippsTg1uKgRChCgoQ0rgo4PDWpZlPMM9cGoTjzqOkfnn+cbGQTuNa
	+6hpdbeDveFiDq4jNglZVstwP/oIU3MJZSUMXKWelTIg1n7/zP3w7O2t7BaWHuC3gatBtWOc6Bf
	vRMBimvVUqlzt+goO6MXCHiycJX1JesWkWFiRsVGRbZDZpBZI5jhLjp0UN71P1MIr2pGcjlZ
X-Google-Smtp-Source: AGHT+IFATILXQaMnADswtyDx+DZCyaSTYDChKpredh1QzWDuzwGO7pyJSkCn34wfYE8hgWfEzbMrGw==
X-Received: by 2002:a05:6402:3550:b0:5de:44b1:478 with SMTP id 4fb4d7f45d1cf-5e0b6fd559cmr4824146a12.0.1740169961632;
        Fri, 21 Feb 2025 12:32:41 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c418bsm14653485a12.24.2025.02.21.12.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:32:40 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v2 0/6] pinctrl: bcm281xx: Add support for BCM21664 pinmux
Date: Fri, 21 Feb 2025 21:32:36 +0100
Message-Id: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOTiuGcC/2WNywrCMBBFf6XM2kgemmhX/od00U6SdqAvkhKUk
 n83Fly5PAfuuTtEF8hFqKsdgksUaZkLyFMFOLRz7xjZwiC5vHLJNetwkkLrC1tpxi2MTCi0xip
 vblpDma3BeXodyWdTeKC4LeF9PCTxtb+Y+Y8lwThzBn2L905a1T36qaXxjMsETc75A+j9Z0uwA
 AAA
X-Change-ID: 20250206-bcm21664-pinctrl-13cd7d3f7866
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740169959; l=3255;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=cYMGsql8WUyj71GmqI/5eWDIQK1a45bdPq3S1MYNGcs=;
 b=eiBcGuyMljX0cyESjl05vFGTg4fcFnhWGAXzMqFTfOlr33th/rpYb6lg3VQJT40IsjbtyREtx
 UmJ5PVj32lHBaRU+nmlBf3IkANmRIdEwNkSGhasJnrUQEej31h2EFWR
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_123243_551000_047DBEB7 
X-CRM114-Status: GOOD (  18.44  )
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
Changes in v2:
- Rebase on linux-pinctrl.git for-next branch, drop patch 2 ("pinctrl:
  bcm281xx: Fix incorrect regmap max_registers value") as it has been
  applied separately
- Fix "initializer element is not a compile-time constant" warning
- Fix unused variable warning
- Simplify DT binding
- Link to v1: https://lore.kernel.org/r/20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com

---
Artur Weber (6):
      dt-bindings: pinctrl: Add bindings for BCM21664 pin controller
      pinctrl: bcm281xx: Use "unsigned int" instead of bare "unsigned"
      pinctrl: bcm281xx: Provide pinctrl device info as OF platform data
      pinctrl: bcm281xx: Add support for BCM21664 pinmux
      ARM: dts: bcm2166x-common: Add pinctrl node
      ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI

 .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    | 138 ++++
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi    |   7 +
 arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi   | 297 +++++++
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             | 849 +++++++++++++++++++--
 4 files changed, 1228 insertions(+), 63 deletions(-)
---
base-commit: d01895c5b11849113e70f012d9d142f1d88852f0
change-id: 20250206-bcm21664-pinctrl-13cd7d3f7866

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


