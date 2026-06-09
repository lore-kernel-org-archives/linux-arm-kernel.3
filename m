Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F551CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ABTUwnN0/ycP6fItMWPZ2F954r03QSe0mQoNAie8qWs=; b=dvmxWgsEUnwN3d
	BpA5dM7+3eyoa50MaTnt2+yqMPpcx9DvzgfJ1vyPa3obsLoZWEr7Q1AKVBZdJ3It9HDAz4cnsOdm2
	aHuXtxMx6elH5TAhcdriuBpGJpDkQXFniXPV/d1QYWzK5KfQS4+l9x0pRQyUP/gTfr9ziU4nyl1oN
	NW0G+R+8KBkFkO35lHPsYAuTbhAYZZRSgmov+LjCUcDyX4KVTtUOEgaTvhuYHsQlrbxhpCFo7EpMm
	5O9V7NrmgkUgOp/zxk00zfYzKDka8P36uiRy29N4OdLQEz3SGnT5ytV158eV8hxVhtGUWrPA4r9XK
	m7T/itZ3g3IhCY+V5zxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1e3-00000006EJ2-3S0o;
	Tue, 09 Jun 2026 18:57:51 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1dz-00000006EI1-4AQO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:57:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490afc47455so31391905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031465; x=1781636265; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ABTUwnN0/ycP6fItMWPZ2F954r03QSe0mQoNAie8qWs=;
        b=KFy1m4kGhQG0LSDsxgXKQmfIe0MbKYrUry1mUuVYvw+AkjF2g1F7HBvLayI122e/tw
         tvG5MRXRo8iilf1QjV/AjjT5bjS2yE+m/QzlZMZpbi2uPu0wck1REj7tqYgSxoPNhVIT
         Dcy9qW8sBpy8Vof8a0rM2uEnxJ4brvz/fXC3fwtr8Frv9jMuY61k5Xzb45jpTT/2qA3k
         4Bx9dXLXk8TF0XhqYUtH8BG33uC+pG/UiSvy/+wWAPP6NHZQHRbGGgV/ZbKHgjpijwSp
         5bUxoPtMgKKakZl2lQtMEsxoBaaSQ0lrhp94xS9DSTuGXOt5b7Kab0CFa6I+anv84Ilj
         hekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031465; x=1781636265;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABTUwnN0/ycP6fItMWPZ2F954r03QSe0mQoNAie8qWs=;
        b=q1wSiY+asQ3anp6eJHO6z6hSwsRYrwJ4bK5poC+p6L8BBceDNdygJ87G+u6G7z1wea
         gvMIwCe2ZvG3A/P7jpARUyWPgphXEWD39TkR5g9rK+WDOaq3P5cAkHXbgT791hZ2khkS
         f6mZo49yV0lZgL8/U0JGE3cHqIkcuyGtJHVifPjkbfqq1/wyehvnVsz1QifUJnrpFfF9
         JKthblcGV+HFMA1nmLSjg/28LKdZMsu/8ffS2odL2VB3/TwqLWeqhZDCFvtzSB90EQVy
         lT//tyK0gCTsWbb8MmHCUqOTxY5alrhRDQo/5FPdAe0w/DgausCXQs06KjGD1NyVQkUI
         2Gww==
X-Forwarded-Encrypted: i=1; AFNElJ/vJJVwN+wl6QlVI/XXIlVnS1NdxM6Bykj/Rt18M4680hMo3aCHLMFpULvE3ETpczJiPBVyOU9WgFQBZPWDohTr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5EXNIHwj7P0eJytI9nYHORIzuNsLukaFSeGbAyORidyva6uJm
	yyJxAjpc3Kg30V5ao3uocvm7/0+YPo9uDW0YDnY5yALMWInvPtezUEjvWtr4g3VtVqg=
X-Gm-Gg: Acq92OHF5Rs6+bgCqfuDWu82SgaXrupDBcUacp83LZsPJ2hZmwBtJxp7h61vhDCM0Sw
	xFQ/o+mixkrRh0Fs2jzAHE3RXDL3UQB46qWz+vyNnL22SK/33zXzPcFIft17QsSYbJjS/KfSHpt
	owF32bA6WEwG2u+AkP0cUZpL3y13sKzPiQPIX2bEVudjbFTNBTcwWHyqhJX3FFTTT+/7iWk3k6l
	wHK5Z6xNJfCaOgtxuK0NYPQq2y8wWSTrm7OeB+M3r/bYpncL2PO8+kdeUuk3vQkdu1n5zLLQyPd
	4HCOAwORkBp08nuYyknFHzA6SylzIXTLsjKNdpJQ7QqIeHxRs16Oq+SVHJ7KGiyk6bhjMz6izQc
	AjC7drpbvrgv60733K/vxeNO+qbqooMKLQ/NUVrlKS6jvBmeUEKvTH6nSo4AYjnS743afWd5TW3
	VPSbZpB7047iizePMzfAxBdpOFoqcZEp7poHTxM1frBQ==
X-Received: by 2002:a05:600c:3111:b0:490:b55c:cec3 with SMTP id 5b1f17b1804b1-490d720129emr52607395e9.12.1781031465471;
        Tue, 09 Jun 2026 11:57:45 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c15cesm489548355e9.5.2026.06.09.11.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:44 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v6 00/11] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Date: Tue, 09 Jun 2026 20:56:12 +0200
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMxhKGoC/33QzW7DIAzA8VepOI/JmK90p73H1AMYsiKtpSIRW
 lXl3Uu6Q6sp4vj34WfZNzbFkuLEPnY3VmJNU8rnFuZtx+jozt+Rp9CaIaABFMDnfEnE3cmg4ym
 HUHiYeTVc7DkEZ61AGESwrAGXEsf0+8C/Dq2PaZpzuT52VbFO/1gJssdWwYELHKNF7xUE/PTu+
 pN8ie+UT2yVK75oArsaNk1a8pZiJKOHDU2+akNXk00jJZSV5FGS3NDUU1O472qqaSOhDcaR1ZI
 2NP3UDIiuptdLB20coHTj+P9vy7LcATQU6k3/AQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4493; i=msp@baylibre.com;
 h=from:subject:message-id; bh=x6dOPsmrjAZCqEhHcumkEhnK6rNm9ylZ2ifhx4Wqulk=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxHMGV8Tyn+lJ3p/PonN47a8nIcq//Kc1vonau1j4o
 /WP87c0O0pZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAiXc8YGY60lmcsbSs4wHnt
 07dMnp4nV/tX9s49Pi/gWZb1i7cNQtMZfrPslNpzwPzOk0O23my92znbbNrdlBb9NQz/oPWZMSt
 cihkA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_115748_077743_A63F8B41 
X-CRM114-Status: GOOD (  16.86  )
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

Best
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
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
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
-- 
Markus Schneider-Pargmann (TI) <msp@baylibre.com>


