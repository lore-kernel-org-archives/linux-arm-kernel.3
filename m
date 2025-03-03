Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6CCC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 20:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fQhzWt7YqEgE2rzFMAAkDAkDqzJUmTO0QBEUSSYff7c=; b=aO45ZO+XwHZ7Dn
	BlQaTuLpTtOW3TbF4l48Bb/QjhDTngcY21cE9maBCvT8ejtgvHQ6X2O5QNuaapE0T8UUSlBMKAOEj
	P+mgk80wmTZpH5D0SwurHWb88BEFBJ8XBUmFEw3CGYs+93/v+3Db0yjbQEcZYjHry5AQxFFVL6Af3
	i5lRDt9hWmh8RN+18EU68Xz3TqESWJekxsDG4+m60Y6T3pOWbbovuqvwMVuItmgu6H9t3ofd8O8FN
	3rg8qTogBIYJREacEjO9a8XJjcecLQfz3syNQ3fFcS/RCAGYtr3svaJk0ybu5AAxlvcaSgye55tED
	dB8bS6UTWbTWuMD2saJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCpy-00000002IWm-1C9F;
	Mon, 03 Mar 2025 20:56:30 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCoO-00000002Ht5-2Aq9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 20:54:53 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-abf64aa2a80so372405366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 12:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741035291; x=1741640091; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQhzWt7YqEgE2rzFMAAkDAkDqzJUmTO0QBEUSSYff7c=;
        b=i3j6+awgHXpV0ImJPSaGkXLQSkPxnqjHjlZxE3ybrcOs+vGMqHWx/GC/6q27Dh4w2S
         Ty/CeoGp5YgdXRrgPvkmaJ837JqRfhKUdLRswafySnfdgHGuzxbhlH5kgi12AxtwPi+g
         O5MYZg4kEPdTEsJ+HbtTyqqeRPEXF430a2S2z97l13O3kSQGQo2ZrilvMaptzBi4Gcnc
         ylVrR1bh32VGsKmDAdg714/JwK/CmL4rtxaph+RZ5Soq219CjWC2H27llhItz5h3i+s/
         IiV9m1PnSxMWmPuVHeiBHVOnqMi3LQas4ngxEpqCej8Il1oLoPIE0aGPExmLYAo5IGwX
         0QvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035291; x=1741640091;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQhzWt7YqEgE2rzFMAAkDAkDqzJUmTO0QBEUSSYff7c=;
        b=u6z7iHHU/gCQ87r7DT/FoZRgCTkpZ0P81xgxGM5EiS+2p2TwJMTuHz7CzIo3LmqO9f
         DzWVIAvahmfzq3/Vg1UhjHjRDaOzfr64hgY12cWW6Rh0IiqPPITDjjf7k1Dbyd2fTL0w
         8FvkP9sivRHZP92dUpaqn/VFKLlLRG4knp4xc2Fm849+4CwW+xBiD8KBK+VtwtuIf7X3
         GHjdKim/0N9SpSJJ8Um1uWnfrXxyZmLW/fSlpUIQnjmFiFyMlmSlFl3yTL0W6efrnmer
         UW50rsk+OXFOFMHyJKgl8yWQp0O4lqTD/Et5l1GerM58rBzEDyKDVfdbjqeII1BbR0h3
         /oWA==
X-Forwarded-Encrypted: i=1; AJvYcCUj5sLTarmVyaSnY/TNr40vnVg8ie6AaI/FN/WaHAIZMmml/TJQeeduHZF0TN9RKtWydUZUR7zCWGeFv7JYRNLC@lists.infradead.org
X-Gm-Message-State: AOJu0YyHUdZivZHoAxTKUnpPosMABwgZqTtLgQibBhcfZLesbFDM58Om
	6ldSUrRRatC31to24jQyFdRIZS3ounoi/c1AxxXB04/vv+OBAJKk
X-Gm-Gg: ASbGncsNYsMVv5O+Phhgl/B8QBtqZBAyC6iXoJ9wPNm/vQHDHt8TK6Nls36M5YbFtPM
	ZqTdVDROFeC7IpOIlTrVE5hdzuP5EufyAF0WYsha0qadgjX+xz3q/zCbBA1dyujIMQf/zPC/884
	8RHgFaLRqBFAF2N7dRvlBNhcazjJhkEaBpOqbcwVQ+2qv/bbYdPMGGKnvco7SGxpZ41RPnZcDnl
	Mr/E46mqWUtJhxzGo91CC1qYQgh3Ysy/s2vooPBNXJrE94piUe3KPl/Rk74SK3lp+u/y1//esFP
	/1rYCYq/NqNs4GN1FjOxHt5zrEouN0pYuqQl6xS2P8sOZUC3apvuUlNLkAdyfmX1SpUJ6E3Fxhk
	m/jAcs6vWK/438TA=
X-Google-Smtp-Source: AGHT+IGjsLpBcJ4huPnLK9kNshjLmzCr3cNTlyU/iMrHPVTnl0eG1OpQl1Ob0qh8cGft9hFa7R01SQ==
X-Received: by 2002:a17:907:3f9a:b0:ab7:8079:78ae with SMTP id a640c23a62f3a-abf265e9bcfmr1729909866b.44.1741035290437;
        Mon, 03 Mar 2025 12:54:50 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf76063ab8sm266955566b.73.2025.03.03.12.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:54:50 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v3 0/6] pinctrl: bcm281xx: Add support for BCM21664 pinmux
Date: Mon, 03 Mar 2025 21:54:45 +0100
Message-Id: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABUXxmcC/23NTQrCMBCG4atI1kaSiSbWlfcQF20yaQf6R1KCU
 np304JQ0OX7wTwzs4iBMLLbYWYBE0Ua+hzqeGC2KfsaObncDARcBAjNK9uB1PrMR+rtFFoulXX
 GKW+uWrN8Ngb09NrIxzN3Q3Eawnv7kOS6fjHziyXJBUdjfWmLCpyq7nVXUnuyQ8dWLMEOAPkHg
 AwYJ70AU3iUeg8sy/IBncSBSPEAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741035289; l=3492;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=xVCVyhzR3znyQ+Dlc6TH1lqIzrAr9sb7OwnE/9udCog=;
 b=o44mWwlPUdj/Bs+98rpZroni8KRsbLqO0CiFsLgQf4GmNufT1fNciaLL9kcUepaxRJom2cryS
 t1d1JLnE+uvBopdTdZvrp9A/GiuMXTayWWjstLeS/CzL5DMmde9PFv0
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_125452_561985_82C544E8 
X-CRM114-Status: GOOD (  18.50  )
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
Changes in v3:
- Rebase on latest linux-pinctrl.git for-next branch
- Fix DT binding example for I2C pins
- Make DT binding more strict
- Link to v2: https://lore.kernel.org/r/20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com

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

 .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    | 152 ++++
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi    |   7 +
 arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi   | 297 +++++++
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             | 849 +++++++++++++++++++--
 4 files changed, 1242 insertions(+), 63 deletions(-)
---
base-commit: 920d1159328017ef0d57cb3172160ad7d33a9709
change-id: 20250206-bcm21664-pinctrl-13cd7d3f7866

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


