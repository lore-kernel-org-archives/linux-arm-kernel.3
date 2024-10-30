Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4F9D6B6B3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 17:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G3cY75BHXNmweywFmWSeI4nTOgqt0J0ThjFEmmpT3Pw=; b=BMP+qhZ/R2ZJz3
	OJ2pbOb8v1c6Q2EucuMhHDu2Rr3ymhPj8XGiucfnfcyQ8ybEjPZOBHpZqRhPzOTt/gImT2Hax0rYR
	ACe5tr4OkPnDnLnE/E31uHaSrXOXqqz1r9tu4TDwWZ76MPQjDyCC5U15eecjdElNjG1SuWl4Q23gn
	ovTch5nlzJfAYfxZ9F91NqTLv/OIo96G6376kiQ3vxPOkb6E3ZbzIBWLv9vq6ZPW2XVcvjEQKzNlG
	8dYpEE8rwCmgmZ9HYm9PQ1Bfdx1YOSUVCSakMm4eLZpcC+Er1/zZ4WbdfQ3YxW8e0L2w2saI9Kw1O
	1EjnqUjjb54uoyO9Yuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6C2v-000000019p6-0yv4;
	Wed, 30 Oct 2024 16:59:49 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6C19-000000019Ek-1pmi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 16:58:02 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso93974a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 09:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1730307478; x=1730912278; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G3cY75BHXNmweywFmWSeI4nTOgqt0J0ThjFEmmpT3Pw=;
        b=J0FbKFpuJXLAqZA3QKJ51IKnOLTlA7uM03H5j6wQ6vFGJ3HdgHjssYlmh/RYYR27ia
         xDnB5K1rgXEqYGGFGZ3Avjx08ygflTS7N4nt8lpDMQ5PCj6+gLuHYsIYwUfNppkxPuIW
         42+6yKYrlSKB4BXOmgMp26g0EQJKwrbFRLzqQ6ppJ78jOELbRCvyYJyM63OOwGf53TUU
         UJL7RwiA9dwUIe1UA+k/JjuMwGanO24CrjrETYXoFb6p/vmHiOXsyPUPicVkNeFb710v
         Vq1WgCFe7F3bnMvb45Xf+dyhxM/Blvxjz4V+KwOD/tnsZkp3nlqBZthMd+tB11fpr8IG
         qXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307478; x=1730912278;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3cY75BHXNmweywFmWSeI4nTOgqt0J0ThjFEmmpT3Pw=;
        b=qA51kSuqoYu+RtLDh3UCjBv9eYMZ8CskQZH3wckuSrpEruynUMc/yrvbL45iJQDKIi
         GRMGaVGV3l8UZXN3iZY6abdvRfa1TW2G6BzpMcIqp7betoFppaXKhnFErcmO0Gqb3mYT
         XzrHLyVHdrLr5IUk8lOvhSD0lhUGg7h9X3x0lCYwNq6faWiID88tFuwYUvaNp0lp5DXW
         51wqEwkM1FL/7xLtBVkUcvDA/RmlnyZ6sXnsgQ2qeMfwh9zde+utmE9ZBDMzsnjo41aM
         yaRHfayvydpdSE+41N9J8noaPgMezYytMpnFI7uiBZGHROvYaVVfnnTIUS3FMYeddB83
         K1oA==
X-Forwarded-Encrypted: i=1; AJvYcCVu8RBKax0/MOL1xo/vxrt1+TER0a1TVTOA5Cwek7R9pMvT3Dq8h/i6Ttt5coqTmWZw8nlr01E0cfpf4mXzHMKQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzcs6OKohOtGqp+M9T/58/+PBFgwkiDL3IYmrVvW9txlOxjihd
	31J0xwgiZ/ruHWtzceENKcOI4EP0parnGk9Fap4Vw8KcycMwLvsBwz5hLZXFTWM=
X-Google-Smtp-Source: AGHT+IFPHksQZP6e8UWi8zk4bshtiITtL2PSHAiSSYJzIXWW2rk419GyCPz8eiYwnahJu8NaW3tnRg==
X-Received: by 2002:a05:6a20:d98:b0:1cf:44bb:1cc4 with SMTP id adf61e73a8af0-1d9a851d257mr21593375637.40.1730307477921;
        Wed, 30 Oct 2024 09:57:57 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a1f1ddsm9810776b3a.149.2024.10.30.09.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 09:57:57 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH net-next v6 0/2] Add the dwmac driver support for T-HEAD
 TH1520 SoC
Date: Wed, 30 Oct 2024 09:57:43 -0700
Message-Id: <20241030-th1520-gmac-v6-0-e48176d45116@tenstorrent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIdlImcC/22NQQ6DIBBFr2Jm3WlGKki76j0aFwRHYSE2QIiN8
 e6lrrt8+Xnv75A4ek7waHaIXHzya6igLg1YZ8LM6MfKIEh0LQmJ2bVSEM6Lsdhr0ytj7mSVgGq
 8I09+O2svCJwx8JZhqIvzKa/xc94Uee5/i0Ui4U2PZDrdkZqmZ+bwUyOHfLXrAsNxHF9fjJYKt
 gAAAA==
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Drew Fustini <drew@pdp7.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_095759_672768_E0FA19A3 
X-CRM114-Status: GOOD (  21.70  )
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

This series adds support for dwmac gigabit ethernet in the T-Head TH1520
RISC-V SoC used on boards like BeagleV Ahead and the LicheePi 4A.

The gigabit ethernet on these boards does need pinctrl support to mux
the necessary pads. The pinctrl-th1520 driver, pinctrl binding, and
related dts patches are in linux-next. However, they are not yet in
net-next/main.

Therefore, I am dropping the dts patch for v5 as it will not build on
net-next/main due to the lack of the padctrl0_apsys pin controller node
in next-next/main version th1520.dtsi. It does exist in linux-next [1]
and the two patches in this series allow the ethernet ports to work
correctly on the LPi4A and Ahead when applied to linux-next.

The dwmac-thead driver in this series does not need the pinctrl-th1520
driver to build. Nor does the thead,th1520-gmac.yaml binding need the
pinctrl binding to pass the schema check.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/riscv/boot/dts/thead/th1520.dtsi

Changes in v6:
 - Remove unnecessary semicolon from end of switch() blocks
 - Add Rb from Andrew Lunn on both patches
 - Link to v5: https://lore.kernel.org/r/20241025-th1520-gmac-v5-0-38d0a48406ff@tenstorrent.com

Changes in v5:
 - Rebase on net-next/main
 - Drop the dts patch from this series. It applies to linux-next but
   not net-next/main.
 - Remove repeated properties from required: in binding
 - Add Rb from Krzysztof for binding
 - Link to v4: https://lore.kernel.org/r/20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com

Changes in v4:
 - Rebase on next for pinctrl dependency
 - Add 'net-next' prefix to subject per maintainer-netdev.rst
 - Add clocks, clock-names, interrupts and interrupt-names to binding
 - Simplify driver code by switching from regmap to regualar mmio

Changes in v3:
 - Rebase on v6.12-rc1
 - Remove thead,rx-internal-delay and thead,tx-internal-delay properties
 - Remove unneeded call to thead_dwmac_fix_speed() during probe
 - Fix filename for the yaml file in MAINTAINERS patch
 - Link: https://lore.kernel.org/linux-riscv/20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com/

Changes in v2:
 - Drop the first patch as it is no longer needed due to upstream commit
   d01e0e98de31 ("dt-bindings: net: dwmac: Validate PBL for all IP-cores")
 - Rename compatible from "thead,th1520-dwmac" to "thead,th1520-gmac"
 - Add thead,rx-internal-delay and thead,tx-internal-delay properties
   and check that it does not exceed the maximum value
 - Convert from stmmac_dvr_probe() to devm_stmmac_pltfr_probe() and
   delete the .remove_new hook as it is no longer needed
 - Handle return value of regmap_write() in case it fails
 - Add phy reset delay properties to the BeagleV Ahead device tree
 - Link: https://lore.kernel.org/linux-riscv/20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com/

Changes in v1:
 - remove thead,gmacapb that references syscon for APB registers
 - add a second memory region to gmac nodes for the APB registers
 - Link: https://lore.kernel.org/all/20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com/

---
Jisheng Zhang (2):
      dt-bindings: net: Add T-HEAD dwmac support
      net: stmmac: Add glue layer for T-HEAD TH1520 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml | 110 +++++++++
 MAINTAINERS                                        |   2 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  10 +
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 268 +++++++++++++++++++++
 6 files changed, 392 insertions(+)
---
base-commit: 03fc07a24735e0be8646563913abf5f5cb71ad19
change-id: 20241025-th1520-gmac-78a76aa90c62

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


