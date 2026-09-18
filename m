Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07FDC982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F++R57QYuDvzUJty6cC3PAkfnW/2M4IN8xpJOMy5r64=; b=RppHaA4VxSaGfQ
	5EasUEKExRCReoQnJ1AmsvupzHJzDwCIxN3TGMSson1GaaTHZhaT2W1zV7a8RVg8B4OOIoRRlRGWP
	NFtD8woc7O6p0+LkRFhon+wzQAL/JIhp5tPy6zFWNJKIDEHv9r3FFHoHqrIIWQePgJgP4S1sgkV7E
	9qymJQt/XxzTDMNPiC+2wvk8i3xoXd0UsCfknpqpFb3Q96dNQqk0jlrNJTDETECDPiiaoytGJGJJp
	q0QVjdReU30C+k9ifiQhFlUKhKZIPp3eTSmNneD2gIyhJz64ggcNjeyJL/IIITJcRmxzjgZDqicn/
	G99bM4ajzPuKCTSnzPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uk9-0000000Dv2O-1nQX;
	Fri, 18 Sep 2026 09:18:53 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ujz-0000000Duzb-0AOK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:18:45 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f63546c3so367003f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723121; x=1790327921; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F++R57QYuDvzUJty6cC3PAkfnW/2M4IN8xpJOMy5r64=;
        b=bJVzPQVNv5Tmlx9Al3rctg2xKZRKmpoh4ht6LwCnXuECSxcGUHVMeSsTq+llQEzI6b
         lr2Vf4pRGkCD+hyx7AhC/pn5RzhBUVJndvkg6pPmLHXQ5/YZFegIMJ8SGwQ075OVs1iY
         MKQjgxZV1zwntzpvktB6+ole2uNrT/iVpfMA2bEVIDgv0Ic8pDxCL/qhjOsVz0+5tsst
         vkoxbnN0dKyoM/NjPVAIXGOqBzJ/qzTT9/l4383AAPH0eGcLDESpbFyiG6ZResS0IyHJ
         BvBzwo77iX/LVHkW0eqfXHCfHz2DBXmH7FtdriAWpGE7EXBB8OZpIvHpaoYPM4XaFffS
         8U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723121; x=1790327921;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F++R57QYuDvzUJty6cC3PAkfnW/2M4IN8xpJOMy5r64=;
        b=Fnt/SxnL3UpIXoIb8dhas4lXGdoSRyeq7TqTEWRnzckUibGkEp3hYaNa306P2zWNTS
         Yozw9L/hsMK9N2Q7YqaMlb9BwUtJnGJQ5Z4g2uXTFzHDq7Ek1f77ib/7Am8vaOYauK2T
         DGPyrmUQuQDKUEfTeNmmY9BG9XRfTvqkMfBe2Bu7+Shzq88O/zry1X5DklDLtAJsPiZh
         lZTTjnGtlK+Syu0vYUp3IZJR2FhDWd4JiVgH9F6IppmQnwLV2e2JT4lmLZ6l694KzQXu
         PyzMm+yseYxIxQoyj7xfEIUgzODeOOU0Ya5t/cK5HPuWwcu36LozKNruY/7IT6qkEDo8
         TEmg==
X-Forwarded-Encrypted: i=1; AKwUvBzPlOdRZdIgIVuT66TBWkZgFz/+WmonxuhZ3li0UoSzOy8p7gUBTmKjF78LdrREkCb/Bj8OyzOyBes7+XlJ8Pze@lists.infradead.org
X-Gm-Message-State: AFuF++lYRhD2zPh/7rfJ9qXWFyC/voG0aUqISg75bVSMQmu6hz+YnJzH
	d6aW492zrTy0kHknPkM6PW7RMaLrVpZ6NecgSWgLvw8lF5Qb4XsSp4em1+FK0b/pSR0=
X-Gm-Gg: AYBFou3e8AYkMB/YNyioUYj4on87GfYfZnk+ZTbPVp6QIiw04KK+da1ZwVER+d+GzpE
	UzaQRMkK3TDawHPNGKSH2PRK8tywohq85YJRA0SwgUvsSeS1DE7cB0Q/lJTb+6DVuTFrtRTf+7X
	APRqEBTX0Mx91t+zwEhIjCWwWpFPildBZxBkiBg5c7/3TUsYO2rliYFvioDcQq+MgTkAZMCP6xN
	v/HBZJB3DruVR5NfarQuae5L9ORjj3eLvsEfduMK7gylHmHN6C4QT420DT5nyJZhh1Z80DJNYNa
	nqWoeeid8BM0L+qqWj9JM4Rn2cyVQVTdVhd0hxszVNjPdGs0DF8aRmr444XUvmIQCbWlV502K/r
	OG8iBuRuXw5DYg6V+ceWfc/m9tAbsuBMdnB/N2oYOJZBwH0rywSV2YQQp9hvp68suy6Q3vK9UtX
	s84E0zgRFMS3K5p7G3exLyJOCHAars63lIilsJx5gGieIzRnMnPKk8S/hi0qQQKyUQVrs=
X-Received: by 2002:a05:600c:358c:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49fc56b4ebemr26777785e9.9.1789723120709;
        Fri, 18 Sep 2026 02:18:40 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd22dbf2sm135573225e9.10.2026.09.18.02.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:18:40 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v9 0/9] arm64: dts: ti: Split wkup R5F memory region for
 IO+DDR resume
Date: Fri, 18 Sep 2026 11:17:44 +0200
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALgBrWoC/4XSzW7DIAwH8FepOI8JDMGw095j2oHPFWltKhJFq
 6q8+0h3SDUhevz78LONuZEplhwn8na4kRKXPOXxXIN5ORB/tOevSHOomQADxYAzOo+X7Kk9KbA
 0jyEUGma6KMoNZcEicmCaByQVuJSY8s8d//is+ZineSzXe6+Fb9U/VjDRYxdOGeWQIoJzkgV4d
 /b6nV2Jr348kU1e4EHj0NWgagK9Qx+jV4NuaOJR011NVM1LLlF4B8KLhiZ3TYLparJqyQMGZT0
 Owje0YdcU411t2DbVg7IMhE2p9W7qUevPprYrKJucNZhcZA0Ndw2fzIZViyY47bjSwG1D07tmn
 vwQXTWU9ZospBCt+qet6/oLR+n0OekCAAA=
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
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, 
 Stefano Radaelli <stefano.r@variscite.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6355; i=msp@baylibre.com;
 h=from:subject:message-id; bh=ROvZb4xUz6DU189xV6s7Pm/YrJwcTfi3qs6DKqPM7Kw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jHtXaHV75GfFrZnotvVfZt4xx7/ClZ/+blHfsMwgg
 0GFYeGZjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZhIoAkjw97vYl3ZCv1C97V+
 ifHsviRpozP1YOYyX535h98ZZz7I3sTwP+7BKznNUz3sHYufxoae0w7TcTi316z0cI3x0r32ywJ
 msQAA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_021843_148260_CE608457 
X-CRM114-Status: GOOD (  19.92  )
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
Changes in v9:
- Fix scripts/dtc/dt-check-style issues
- Link to v8: https://patch.msgid.link/20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com

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


