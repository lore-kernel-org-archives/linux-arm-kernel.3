Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FE3CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OF8+BNFL4niPqRVyKe1lX6yisr96vvFu6A5/iDrFJwc=; b=xeD4blOAsOZ5WswfMktktXKhOy
	Eu71BvIratEDY8XjJx/p1t/9flt/oWbAjKtg/etrd+64wEjQtbpJvizFR3vRz1PaTlXq7/P60/IPj
	ARCjzHxgLJ2xZe8eStJLxT2kMDhr/lGhQBvag6SUsftgcM4bQ/XG0XToVvZ3B+VRqyCUw8t/T2eUM
	CXr5wBYYhAuChHR3vl/GjR30+dolJiOfG3DyMUvwFzPSeTY679y2z6uoRj5FALWOIOqHgWZOihnmg
	u5RV0w6OtldRtLsDA6kSUUnT5KiLQDJZh6usmtp5xRK0eHNtGob+WgxKB7Qj6K5M3mzn/TyZZ6WM5
	2aMfnM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVlr-00000005uWx-3O05;
	Mon, 10 Nov 2025 17:33:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVlp-00000005uW2-2yNZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:33:39 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47777000dadso13689065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 09:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762796016; x=1763400816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OF8+BNFL4niPqRVyKe1lX6yisr96vvFu6A5/iDrFJwc=;
        b=uFN3INmDigBZX1mwlYiJwf7F9E561jURGUlXu/b5qvZ6wGmHindKLBjOUO9Gf+iWR6
         3HqIf7OzkrRjsLL9nliUUTyQLTqxFJXQ7wpxBHNZQ94hEku19AGg8hkDxc6j40yBQogN
         tGvOAS+GgevtUmYBhIFKk3F+LF1VxCX/v6cqEwMVlr/xKMLmoA4EAVUfQxeZ81xQ6CzO
         ABYKNZs/L0a2GDpvby7W6ePVKXZJcCPMOZGIhmlkuYylsd/W93MStb5eJ4jNkb3nkLAf
         Ek7DP814x2ze/hzJwCzK9didGuTDs72Ae543OIw1kxl7GFh0KcraPH3COOhVuaf0DjK0
         KQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796016; x=1763400816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF8+BNFL4niPqRVyKe1lX6yisr96vvFu6A5/iDrFJwc=;
        b=Oda4MVAt1zfmWIL/X2yXj/MNaVMUfeMH3IAvcVXOGiAWyv8HDg3PlG3eLqVPYHpIbE
         PzOcKWrM4quk/L5vzecvwJXUxinwrDHgV3leORyiUvr1yMWpxraKV9s/cizEimOuv7fz
         387bI1i7SaWPeq6VqW+Wne+uwvHkZO4vHBSCZa8r9PgoTXalHwV2Q687xNB6ysIUOES2
         qZnOPzNscwA30DxTU0LLkvMqajvg8UBF13RnWLOUwQEwo5EW9DCs9RPGTwRui8pY+wyy
         iH+ZlZArkKN722pdKDLMEY0+iAHjcGruUsX0+PMg9H2enBJ8zM2id07KaUk+5EhROirm
         fEmA==
X-Forwarded-Encrypted: i=1; AJvYcCWwRNlCKkv/lyJO+LmZKcQWCVsLig6xUL+6W2dU3C+0LtMErnhvF+QuHI+rmb68arWJVZk3ZvOJqcFcAz0p74DA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy81ZgKp2Yc18/jfU6eMWSrJLwFo9TZLcEkjvuXnx7AGw09rq4U
	Iclxoz9GS6IOZYhLYMOIHyiEDU+bVoFJPNpsI5fkl4y8xEcTgs5Y9pSqD8AM2A76ibk=
X-Gm-Gg: ASbGncvjwnOyAcUE+u6BERW3kZpBoc8X6MNBVN1u/nSMQ63fkFSzK50DJEo4O6z/4oX
	3f304395paiE3Tkj0/GFa1CGsQfL+8INTUkPjIstykMbJgK0Y3Ry/dRZW3Cy6tlb9ci3sAwVmyz
	K8NkTbnzjRTyVRriKGKD2oNMKOBXq5fLS1cWmItbHE2/U9+cCdl5P/0PqwODNCOW3ejddd+hBE5
	OoKCi0AgP4gctjvxpnLoEwjbonQ+KtCVM17ep0/LEkt4npinS09ZIEjjl18h2JC/dTGEFx/qPCy
	rSbdZd56zcBKBrN4jffy8+7w48lMXtQzL0hGoTAwq2ECvlMoDyaj6YHo8W1cIyQbFzpfEgmhOCC
	vk7AyUaQqlEYxFwWtI5P8PHcodYzNqTVEgr7eaSu0n9ZYfu6gnukDW44jcaxwLoEHtKtUjrIAWk
	+GqcBuos2D
X-Google-Smtp-Source: AGHT+IFsBQQnkCxj/ZdeAOfnyhkqLUTn/qNT58RuOTuk9hbm4fBeIAtaCNjX2ecmWX+ye2/aVLU4cA==
X-Received: by 2002:a05:600c:3493:b0:475:f16b:bcbf with SMTP id 5b1f17b1804b1-47773237269mr64531415e9.14.1762796015765;
        Mon, 10 Nov 2025 09:33:35 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:d5ec:666a:8d59:87fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47774df2d80sm140111375e9.14.2025.11.10.09.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:33:35 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 0/4 v4] PCI: s32g: Add support for PCIe controller
Date: Mon, 10 Nov 2025 18:33:30 +0100
Message-ID: <20251110173334.234303-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_093337_793528_EA23E2BC 
X-CRM114-Status: GOOD (  15.14  )
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

The S32G SoC family has 2 PCIe controllers based on Designware IP.

Add the support for Host mode.

Change since v3:

- Added Root Port node and reorder irq in binding
- Added Root Port management in driver 
- Fix Kconfig PCIE_NXP_S32G position
- Use default pme_turn_off method
- Use ops->init() to simplify init and suspend/resume sequence
- Fix some typos.
- Removed MPS and ERROR config. Let core code configs them.
- Removed s32g_pcie_disable_equalization() from internal team request
- Removed dw_pcie_link_up() from suspend/resume functions with [1]

- I'm still waiting feedback from internal team before removing
.get_ltssm() and .link_up() functions.

[1] https://lore.kernel.org/all/20251107044319.8356-1-manivannan.sadhasivam@oss.qualcomm.com/

Change since v2:

- More cleanup on DT binding to comply with schemas/pci/snps,dw-pcie.yaml
- Added new reg and bit fields in pcie-designware.h 
- Rename Kconfig PCIE_NXP_S32G and files to use pcie-nxp-s32g prefix
- Prefixed s32G registers with PCIE_S32G_ and use generic regs otherwise
- Use memblock_start_of_DRAM to set coherency boundary and add comments
- Fixed suspend/resume sequence by adding missing pme_turn_off function
- Added .probe_type = PROBE_PREFER_ASYNCHRONOUS to speedup probe
- Added pm_runtime_no_callbacks() as device doesn't have runtime ops
- Use writel/readl in ctrl function instead of dw_pcie_write/read
- Move Maintainer section in a dedicated entry

Change since v1:

- Cleanup DT binding
  - Removed useless description and fixed typo, naming and indentation.
  - Removed nxp,phy-mode binding until we agreed on a generic binding.
    Default (crnss) mode is used for now. Generic binding wil be discussed
    in a separate patch.
  - Removed max-link-speed and num-lanes which are coming from
    snps,dw-pcie-common.yaml. They are needed only if to restrict from the
    the default hw config.
  - Added unevaluatedProperties: false
  - Keep Phys in host node until dw support Root Port node.

- Removed nxp-s32g-pcie-phy-submode.h until there is a generic clock and
  spectrum binding.

- Rename files to start with pcie-s32g instead of pci-s32g

- Cleanup pcie-s32-reg.h and use dw_pcie_find_capability()

- cleanup and rename in s32g-pcie.c in addtion to remove useless check or
  duplicate code.

- dw_pcie_suspend/resume_noirq() doesn't woork, need to set child device
  to reach lowest state.

- Added L: imx@lists.linux.dev in MAINTAINERS


Vincent Guittot (4):
  dt-bindings: PCI: s32g: Add NXP PCIe controller
  PCI: dw: Add more registers and bitfield definition
  PCI: s32g: Add initial PCIe support (RC)
  MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver

 .../bindings/pci/nxp,s32g-pcie.yaml           | 130 ++++++
 MAINTAINERS                                   |   9 +
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-designware.h  |   8 +
 .../pci/controller/dwc/pcie-nxp-s32g-regs.h   |  27 ++
 drivers/pci/controller/dwc/pcie-nxp-s32g.c    | 435 ++++++++++++++++++
 7 files changed, 620 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
 create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g.c

-- 
2.43.0


