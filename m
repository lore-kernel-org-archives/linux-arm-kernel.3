Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DCCCEE331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZolYxKyR2TKNDHC7G73SjkM6m/AelgK287SOoaUodeI=; b=KyJh+uMtI22kQ4V+uJFsUMy20u
	gtaqkU5I+Lx7DbJbewtioFRBvjXvuwB5unjoUK/cv9ZnjN3IsiuBk20cr8mpUQiWxyNpKgu5It5D6
	j/QBa3Q5NSxI8FaxNnHnB0Se6l3m1/+UOENMoaUH7Hb9NTY5EQw1KWBXdnrh60M7yM1Uv/z9uDXOp
	ijaFSj+YbEw+c1tLvK/J/2ZHvimIQNKmedlsdxABf5Mb/UnOfwV0/hqjR/E41/bpFI59PZsTJHacD
	wh/pAIwOTpZexbkgnPKEwi5PN/9kiAjAMiZcgTX4mwazx+Gpt9hoMIcKpsusdludj0Mng4uMwjrfJ
	E99vJWdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOAP-00000000g4d-1swc;
	Tue, 18 Nov 2025 16:02:53 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOAM-00000000g4A-2t3N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:02:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso36924345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763481768; x=1764086568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZolYxKyR2TKNDHC7G73SjkM6m/AelgK287SOoaUodeI=;
        b=mt+ga9JFrm8U3s5QsdlQEeHjtEbnzPUrwpeKzdGMS7X/35oNBgV+gkhPIQua84nqjc
         Zp5t3MV+ju3sMg5p0c3JmmGKW40JCQvjyLTBMP4hFeWoRroNUwdIGuh5b4QxO81QuMEC
         6Off0C/LZNUtepid/RPQjv184cPX6B7GqsBhWgih1aclJTSTXtYTh3ikm4tI52ySaJIZ
         RryfaryI2EJDwhYrpdMp+S/nmLdnyqMaTvZELHbUgqsBfTV6E5elO/wCLdRyGFkV9qng
         RdzWUkINi94Emo0GnG/iwCAYqXfcGk/G83xSgR4RcM0L1/bhNoInW00QTFc3gjSGLl21
         UUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481768; x=1764086568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZolYxKyR2TKNDHC7G73SjkM6m/AelgK287SOoaUodeI=;
        b=Brlw2DHhPDRLZup3II+yTRP09sQKFxCH86wKZ++/0Pd52yLFU5yBu0cowiP7nvg77B
         gvV6CoooVTqE8cN4Cxpqo/cWErnphOOKLY3DAzmZOynyODnlvWkaUhSbe/zHHk1JKAVY
         +3oOSqkUMLRCbqYcn4D8iPhq9wB65PYzLZecBQVpuKi7Kjaeg1iYCW7hk/cIGL51Rggs
         Rl2HzrpPMTaGuLouSNjnVCxzOBBTbX7gTqpPvtaooZOXyK8UPyLbJuzEXHT2KWgz0DHZ
         qz4zteTNuBTmZ4RQdljpDxx+YbVYVqkDH7HzTvMlXygs830ZqFTWdRkoHkGbCPdxPghe
         oXCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5Gsv+6p5DN0IqQ/DEhNhVZH7bzDYWXCair1GiFhEL1Th9hJRoYbWPIxU101p7ZiKJd+xS6JHdx0vKHwTzbUfa@lists.infradead.org
X-Gm-Message-State: AOJu0YzmHpCUq2r9AqtzIrYstE3zQU9x7uU/LVb6b8XPdPMPixduWJ0i
	d/QT4H0oPWlG1lUWXuy7ppMDYTli6N36Mm6QOkPV15cvFPb2z0+deQGy6FTTxjbDArM=
X-Gm-Gg: ASbGnctkT9/cNaHIl4c7rKydh+fheWCIOA7G8CW/wMAU0pSVHKA2TeYk1itupZyRD1h
	ztekv0VOLXrNjxiLD5Tdd6uUYdhoRfJiyffrrxz1wUFWVRw98fgStXdm1p2qSXXAUPWurOFsBoQ
	l9G1gi6QOhy8vbIdseUQglYVllRnH/e0g3lhQSFL17h3msq0TqNJa+pyd3ABtSJ1q9+8W43l5Wq
	N3FBswVy23EEgGSpAibcFCzXyNDSEIYt5woHg/y+/5uNgVCSreFy87xilleLItgCtQeOn4N2pqz
	+P4la4KHN+PrUn4ojTYsWouZGVWJw2c/fQuHz5/X3T0XFG6uDm3v536mFU4YKLxv+cSHODXpShj
	W6QmAx1n3HUOZDj1kc3IkwXRiX9AlQt9XqTbSG2d7432Mf7B42eUeY9W00t6gbpVrNtYfxTKziy
	5Sk+LAKlu1imlmrHmADwE=
X-Google-Smtp-Source: AGHT+IHU3f+2VnZb17HyfN3q7vH0maabvSkwzyf6Chngf7ZnCh4C8B1MIKZ3LBGCUAyWOLacnrXL3g==
X-Received: by 2002:a05:600c:4505:b0:477:7a87:48d1 with SMTP id 5b1f17b1804b1-4778fea8810mr178621825e9.30.1763481768019;
        Tue, 18 Nov 2025 08:02:48 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:76db:cf5c:2806:ec0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779fc42f25sm171954575e9.6.2025.11.18.08.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:02:45 -0800 (PST)
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
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 0/4 v5] PCI: s32g: Add support for PCIe controller
Date: Tue, 18 Nov 2025 17:02:34 +0100
Message-ID: <20251118160238.26265-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_080250_764505_75A5DC53 
X-CRM114-Status: GOOD (  15.07  )
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

Change since v4:

- Moved allof position and added interrupt-names' restriction in yaml file
- Removed PCIE_S32G_PE0_LINK_DBG_2 and instead use PCIE_PORT_DEBUG0|1
  after receiving confirmation that they are the same.

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
 .../pci/controller/dwc/pcie-nxp-s32g-regs.h   |  21 +
 drivers/pci/controller/dwc/pcie-nxp-s32g.c    | 391 ++++++++++++++++++
 7 files changed, 570 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
 create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g.c

-- 
2.43.0


