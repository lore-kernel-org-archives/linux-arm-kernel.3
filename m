Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226BAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7gvfiWDDw2ES6TPPr+xJ5WsqSsdwN2ZrtYiQL2rjqRE=; b=HJBuVFMS3WWXi+
	Y070O7s9nhhKYz6XtGHmlJMDYfKSisOTPXQ2KGYFWUv5+8XS9c+P1OZyc00LmBpzN2DmHoUC2addD
	3Yj9xCvbTmCB90xsUatgIrlayGWMAnQ58ZZYEJ54WDU3qTtvxAaMpfSWMzKRhmD9dZM1P+eIR5+ol
	Xzwu+920ebFf4iHcpH1Zd/TlK3XbDd/yY5uJM2L9xRS+sP0XU2DGY7eJLIre2/b8emWXsA4nhZno9
	BgHz8LpmMxSCQIuk7EioklaZhRyjpKC2UWEWFuAnYT99gsA8xLytnOk50fcPsYj/Nqt1xouf9Wcce
	hA7PSzV62tCbEptJUiXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFH-000000021I0-2JVh;
	Wed, 01 Jul 2026 12:40:51 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFE-000000021HF-3Rky
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:40:50 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4629051c946so454392f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909646; x=1783514446; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7gvfiWDDw2ES6TPPr+xJ5WsqSsdwN2ZrtYiQL2rjqRE=;
        b=XZmgmG9yIlJwO19LARb+5/ZRHwiraFOkeAJMAtLGaIqhrzzfKiyeXxDvXGg2OLO/lh
         XBSS2AMi/8gB7pbIaOChrzOrVSlSHAxDERUMye6tVFAfTJdDTl3Ksa6Vqr6gDNvQFPi6
         EZI2IL6EYbKZH5SeJ1oxuLoyrd/n/Gpb9Qk5enL8l9NX7eTyvOLf1+FfbBOgTyOtr0QT
         YyKNzo2WkG3ERRushIVTvHh9MTG52rJ0IF4i6zVQ1CYqJRtmHfuFbzvieIMaWh2oK7Wc
         jo/y06E/dqZ/ImJgA7gzDDacFCCjK8TFSKJDs+Q8vC+MDH6xzSuJAu+K26qS61GdeyAc
         kaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909646; x=1783514446;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gvfiWDDw2ES6TPPr+xJ5WsqSsdwN2ZrtYiQL2rjqRE=;
        b=Mr85snn76h2vSakCO3HEGjZMXx2InzSwQVh+kEsED6o9Wr68CDjFFywHzSiTsAKUy/
         vjjoJNNFgXcuTGAdlabHt9tThQ3APqFgWgPyU0a5hd2k6R2xrw8T/rhH3b9WczGnn/Ox
         AICv5+WzQVo2thDjGrgViXiHf3JQUYNC2kTPa9bzmSsksnaWa/32v6VspSU0BrJ+SDWj
         7B+3O+o+C803me/pF97yEh6dcR3hslwVMqdG8mFNWmKxDnMkB2iHJkfKUWvaCvjvZ7BV
         P2tHRlDoRHFDFMzg7HWgGBcv/WBM7k3yAYDyGwH+Mny6KQ1atNpuFT0ipPTyvg5S852R
         C2WA==
X-Forwarded-Encrypted: i=1; AHgh+RpYr+HhDW1U3A4ai9m5KTgEYvOK5RXee32pbpHOCykHTXkL59FIsaz6eGBMkyIPUwAzB+xC5Brp09xUHzLX99CU@lists.infradead.org
X-Gm-Message-State: AOJu0YyDa/j2lZZjbImjjkxSVBCQlCI0usO5v6SDxj+eu+kFhRvXjwNj
	uJqpAyguEk9Jg7dsR3lLLsOJ8dCP6WusUPs4/pr6Iy1gAUYzqtbcZHz9Ale6gvoNqtw=
X-Gm-Gg: AfdE7ckZWtcCw2XS/HHkXuxRIQQsY0HCG4ViqooaXN6L5BowxK2wjF5kzAQhAFTw0yn
	pV6+3m7043l9Xj2qosR5lVYkG+1AO88BRNcFTKFJ8Kor9epmuvJAMNLX9GgO7FptjuSk3Vp6v1S
	U+buQbHAZWh4tzNvGwMkxJJ8R+dLAhQ9fXPuGvYEhEu6xaygK0gfjFwVks7TCCQvlJGUthF/mzt
	CBlfcB3cFLoIovbMqhw9+93H5Ds5PbjAO4G7RnaoUrps0kuVNUp4n5mb0AyY0yC7Yfk2Jgh2wp2
	WUuK3+UsPVjM5nidjOslgdJLIhiFKlM4qAjrS//pl0+A5KrP93mRa5TPMwxvdOpdhuAVVCyGvYV
	A7t/79lEjwriFEO5ezCeftbgANdICvs6tWArA6N1YRjKEsrP/fm0oRUbBoLCVITbR9qaYJewUPC
	FVVP9yQmUceMBnFQe/zWct
X-Received: by 2002:a05:6000:4811:b0:473:e954:6abd with SMTP id ffacd0b85a97d-475e005362emr8734001f8f.21.1782909646117;
        Wed, 01 Jul 2026 05:40:46 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475643cd85dsm15966447f8f.15.2026.07.01.05.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:45 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v7 00/11] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Date: Wed, 01 Jul 2026 14:39:12 +0200
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHAKRWoC/33RS27DIBAG4KtErEs1DJhxuuo9qi5ggAapiSNsW
 Y0i3704XcSqLJb/LL553cUYS46jeDvcRYlzHvNwqYFeDoJP7vIVZQ41CwS0gArkNFwzS3e26GQ
 eQigyTHK2Uh0lBEekEHoVSFTgWmLKPw/847PmUx6nodwevWa1Vv9YDbrFzkqCVJgiofcGAr57d
 /vOvsRXHs5ilWfcaAqbGlZNE3viGNl2/Y6mt1rf1HTV2ChDmj1q1juaeWoGj03NVC0xUrCOqdO
 8o3VPzYJqat26ad9ZB6hdSnt3s1utPZtdv2Bd8u5IyUf4py3L8gvTFO/LTQIAAA==
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
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4819; i=msp@baylibre.com;
 h=from:subject:message-id; bh=/QSNh/oJUk3K36diT3vAhwVzwhYSE2dQVz87cYlXnkA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXriLrF8leJpEiuTrS/5YqiSx0XXVpXjOn8Otp4a8+x
 KZum13SUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABNxO8nwh3fq5unzOIvL032b
 J221mBZ4/kSQ6mlXuU2vgoWary9zWsvwPytA7kLNvtXeLsvM17Sw1MayXsz6wfnKitn2f9PUvZI
 N7AA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_054048_925332_B769558B 
X-CRM114-Status: GOOD (  17.44  )
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

---
Markus Schneider-Pargmann (TI) (11):
      arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory region size
      arm64: dts: ti: var-som-am62p: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move wkup reserved memory
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move wkup reserved memory
      arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split r5f memory region
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Split r5f memory region
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Add r5f nodes to pre-ram bootphase

 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 12 ------
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 48 +++++++++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 12 ------
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 17 --------
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 48 +++++++++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 12 ------
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 12 ------
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      | 12 ------
 8 files changed, 92 insertions(+), 81 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
-- 
Markus Schneider-Pargmann (TI) <msp@baylibre.com>


