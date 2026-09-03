Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A690AC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tHiaQ888icqV4SM1/pHe1jcHxEopUP69dKqnOSBwCIQ=; b=3Nc9Y5/VwwuDEu
	Xi1lW6awpUbAe9onMA1e95wdNR66H6+G5q2HzileCm9f35PJjO56FHBL2EDRIfLOL/f16jsz72WOj
	4zP670ipm/yd5S32tPFGRJ5CqIOBW57W6jomvYZuTTYFZqllDWMmk/oMOsblHl5IP5mfbzvJtfjK9
	o+ThligViW40VuXwusJNOdtSWHkjiRotk1fk3xCMWZvYTAsgZ/KeNzasNEHCO0rIrmWGFEgRWjsiW
	tZRFu9XBpcHA0hQaWJBuFcsMzYHlPBJ68jWHapMnlEAS4mQZoqUR7nAik1GbBW8tSfhvM/rGFyOxv
	uMl2a7fr5cmXD1aDG8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kC-0000000HK4H-3I9f;
	Thu, 03 Sep 2026 12:40:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kA-0000000HK3B-0dni
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:40:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4957eefd361so16420835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439236; x=1789044036; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tHiaQ888icqV4SM1/pHe1jcHxEopUP69dKqnOSBwCIQ=;
        b=GM4JHRRIqf5YsRUr46ynk6a1C18HDMF+PjJbf4fN4gYd3c2s4LBxUsG3ZeXSiz3DrZ
         ybTXkY4vdZbphK9w3LgX41bjlwGX11I4aFy/6pEPVyUIBwdVpnhIkMLHpwlu0iYsqrse
         spoTcA8jIP776xTAsjfCo9nqVP13Uu/iFnRYgGkKMNGGiI527SHH+1t7xHRvo/Y+abza
         0QC+0+LV/tW6rFhz6TFVJLNeOix7rbFqMMMt4M+cgHk0Nf5N0R7MCegjrntX3dUzK33x
         3Kt/H14iqMELyKe1RV+fBBhfR/LZrnzULTbFBBekeW9AXmqcTcOYzFwbAZ8L6/V8mSq0
         DMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439236; x=1789044036;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tHiaQ888icqV4SM1/pHe1jcHxEopUP69dKqnOSBwCIQ=;
        b=Tpi/ZTOXr7sFzvR8a1OyJROg75ieSQEfnchYYi0es42vL6rv7pmU8pLDIlISkWDPOC
         /usrbqCiQ9e+yfSwn4v673Qzj8UFjv8+sbvOfgKVcVDVlON9B5Yf8UWxZwe9aLwh99zB
         vBRD7kEKt/fhi/5ys+SIMtMN5YqsAYKMfGCH9Mex4+7K7U6tVWaKD4xZieNt7/1WCKDE
         lbug5yQckJ2q4pHf+lvqS2ssAzuTKtXpRTdXUsYa4vjZXlJAAjTt8xU0oUsub4LdJlOS
         LahyOJodQ8hfHVKwb6YmJFRpaom+sVoSqT4/Ofw7suyNQrGyiEgaTLG1J8mGkVhlGDDO
         Ivqg==
X-Forwarded-Encrypted: i=1; AKwUvBy5qKuOrDlsr4ECeVaadarMfrXnXRtWjr9iMe4elMUF6bWDxymYIWmy4Wy8xABBCnVX3PnYYTeBrYI180+mKVP4@lists.infradead.org
X-Gm-Message-State: AFuF++kzZjUpk7CaCze1Q4rBA7a/oHA+dgf3+FqApNwFVCyTnJO8VPB3
	lXyfS6bnngmCihredH5wIe/aab0o77SuQgp7832Jn4HZomLUmH1cWPWvujACKcCcYS8=
X-Gm-Gg: AYBFou04LSkhzRVOq2OJp/1YFbW+wyJB8fjJS7hv2KihWA3TFOC3qFQrI4bP+qPEgjF
	oW0eKEBNujG9dZeDshJ6SI4lOA1NgD+kKHvsMXgNfr+HDPRIiTGk4KUfLB7qrjydqybm/6kmLs7
	LzSOvuBH9hRQXR1Fr2VVZ6l9rUISqCyLDvYbPHgAsApC2PvJgDoBZNuzHW8PAxyzw8LGr0xzk9H
	pCBgZxqBosxzpL/G5dYozsnb9SonPheC1uZuEeBlKDsycnRDqCbqCgtGiYklR0r6vFAKVCcX+U+
	4GqVJ4g2J9vADsGlSxQJInHkpEQr1ChbQtz5lAxBj/a/W2c/8j1KMqwTUyxW2aTAG9KWeem/5lO
	9E/zwtJvRIPxupYA744mS5bIQpS9aoKVFBNAcYOs1mIGsjaAiAGkR9+XFn4slPde3zq6lUM/vEH
	fajMWGY0mlLQCWzwpu2Vr5dZ2QSM4hoQ3avaBjyRdMliGg4OZz1UBtU98LSQ==
X-Received: by 2002:a05:600c:8b88:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-49ce581a0a0mr258896585e9.7.1788439235569;
        Thu, 03 Sep 2026 05:40:35 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dec54sm82228145e9.12.2026.09.03.05.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:35 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v8 0/9] arm64: dts: ti: Split wkup R5F memory region for
 IO+DDR resume
Date: Thu, 03 Sep 2026 14:39:21 +0200
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHlqmWoC/4XRS27DIBAG4KtErEsFA2ZwVr1H1QUM0CA1cYQtq
 1HkuxenC0eVRZf/LL553dkYS44jOx7urMQ5j3m41GBfDoxO7vIZeQ41MxBgBEjBp+GaibuzAcf
 zEELhYeKz4bLnIjhECcLKgKwC1xJT/n7g7x81n/I4DeX26DXLtfrLKqFa7Cy54BJSRPBeiwBv3
 t2+si/xlYYzW+UZnjQJTQ2qppA8UoxkOrujqWfNNjVVNdJSoyIPitSOpjdNQ9/UdNUSAQbjCDt
 FO1q3aUbIptatm9rOOAHKpbR3N/OstWcz6xeMS971mHwUOxpuGv4zG1Yt9sFbL40F6f5oy7L8A
 M7ah1ibAgAA
X-Change-ID: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6189; i=msp@baylibre.com;
 h=from:subject:message-id; bh=yN8gGAydvF8dMrF0qIa8h7tvCnuX+gk98CcSM8AfETw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWY3Kci+qj9679NHk+UkWru+3zl5vjdi/rmGB3bLd0
 1SKFZ1vdZSyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBEjgcz/FMIFw89r2CvL2Tv
 KLnRVLK66iDvPzXFyzHN78wefbHsOMvIsFnKg3eq8o7LH55f0XyRd42lqEpoQtjrlfNz2OrKJty
 wZwcA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_054038_232843_BEDBF3CB 
X-CRM114-Status: GOOD (  20.21  )
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

Hi,

Split the firmware memory region in more specific parts so it is better
described where which information is stored. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data and resume from RAM.

The bindings are already applied. The remaining patches use the new
layout for the platforms that are capable to support IO+DDR. For IO+DDR
the new layout is necessary as it defines the location of the LPM
metadata.

Additionally the two important devicetree nodes for resuming from IO+DDR
have the bootph-pre-ram flag added as this data needs to be read before
the RAM is in use.

The changes in this series were suggested as part of the IO+DDR u-boot series:
  https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com

Note that concerns about uboot fixup of memory region fixups were
discussed here:
  https://lore.kernel.org/r/DJD1Y3G9S1SP.2GHOZ5X4RYJFA@baylibre.com

Best
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
Changes in v8:
- Rebase to v7.3-rc1
- Increase the AM62A wkup R5F memory region to end at 0x9e700000 to
  also fit the edgeai DM firmware as requested by Paresh
- Move the memory region definitions back into the base board dts files
  of all AM62A and AM62P boards
- Added bootph-pre-ram to the memory regions are merged into the
  bootph-pre-ram at the end of the series
- Link to v7: https://lore.kernel.org/r/20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com

Changes in v7:
- Rebase to v7.1-rc1
- Fix commit messages
- Link to v6: https://lore.kernel.org/r/20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com

Changes in v6:
- Added fixes for the length of the wkup_r5fss0_core0_memory_region.
  Thanks Francesco for pointing that out. am62a firmware is shorter than
  am62p firmware. I calculated both and fixed all devicetrees using
  them. All patches have different Fixes tags so I kept them separate.
- Fixed the length of the split memory layout as well.
- Removed the double definition of memory regions for the var-som board.
- Link to v5: https://lore.kernel.org/r/20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com

Changes in v5:
- Move all changes into k3-am62a/p-ti-ipc-firmware.dtsi
- Dropped the patch that adds bootph-pre-ram to k3-am62a stuff as it is
  already present in k3-am62d2-evm.dts and got moved into the
  firmware.dtsi file which covers am62a as well then.
- Link to v4: https://lore.kernel.org/r/20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com

Changes in v4:
- Rebased to v7.1-rc1
- Dropped all already applied patches that are the bindings and the
  initial introduction of memory-region-names
- Link to v3: https://lore.kernel.org/r/20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com

Changes in v3:
- Squash the enforcement of the memory-region-names requirement in the
  patch adding the memory-region-names, as suggested.
- Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com

Changes in v2:
- Make memory-region-names required if memory-region is present
- Fixup memory-region and memory-region-names conditions. Require either
  2 or 6 regions for memory-region and memory-region-names
- Reword and restructure the binding documentation for memory-region and
  memory-region-names
- Add memory-region-names to all uses of memory-region
- Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com

To: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Tero Kristo <kristo@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
To: Andrew Davis <afd@ti.com>
To: Judith Mendez <jm@ti.com>
To: Daniel Schultz <d.schultz@phytec.de>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
To: Devarsh Thakkar <devarsht@ti.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
To: Beleswar Padhi <b-padhi@ti.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev
Cc: Hari Nagalla <hnagalla@ti.com>

---
Markus Schneider-Pargmann (TI) (9):
      arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory region size
      arm64: dts: ti: var-som-am62p: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a: Split r5f memory region
      arm64: dts: ti: k3-am62p: Split r5f memory region
      arm64: dts: ti: Add wkup R5F nodes to pre-ram bootphase

 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 29 ++++++++++++++++++--
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 11 ++++++--
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 29 ++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 32 ++++++++++++++++++----
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 11 ++++++--
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 29 ++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 29 ++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      | 29 ++++++++++++++++++--
 8 files changed, 179 insertions(+), 20 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
--  
Markus Schneider-Pargmann (TI) <msp@baylibre.com>


