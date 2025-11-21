Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2AACFC294
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zGlnkOToO1jf+8pr/raDuQYhOEXUPTfBya9U9ZeDpYs=; b=T8eaCo3Lo6ts/YgjZzHx5eQtdJ
	RHK5yP7FStqckIDWHQgKqqEgRM8gpGYeM7rfAzvOXpPdOLwFg0ENMiFsuI/PN1iDwk8R0OqUW2C7A
	bC+ycZ4407kY7HXqjPWtheMZwZF58mL4yFTdtkFVcYt9pBi63zKEyhpI+AbbQ1iwJHPqGpy43ly1C
	FIcbLvBuJPGs64u2+fCMaIiq7aJp7lsQ5yvQEeaXWvNGu264k0ejAVlctbeG++gKWs45fO8DgbBBW
	toMEVDXFKnogwT19KLSd3knPKB5waze1cwL5VKIsFE2eGBtOKYTIlweD0+lJsa/T1OUiE9gHavQFq
	iAR/dXXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUK6-00000008kUp-0JRR;
	Fri, 21 Nov 2025 16:49:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUK3-00000008kU1-49dL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:49:25 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so1228246f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763743762; x=1764348562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zGlnkOToO1jf+8pr/raDuQYhOEXUPTfBya9U9ZeDpYs=;
        b=vHQGVQxGrYueVUPLWWnf4QzhCGG4s3FZtHoESlzAN8F3sMLAT6KPChmoIfdpwI3qyk
         tF80Uu8GemZyxZsM7MJPkDPShB3oC03Xtj2et6DUdmqNymw/6Vq6iuLfth+M9ZnfXZLm
         ASIHCdDpOVeZbod4vR+XrVYti3JA/w0Q5EHhIDrxvIIP4WC/dF4UjNsiyFxzSCK9u9gp
         UXK/8Byoe4anu/wmsWsVsZBkh9x2dpF6y0YcDGf+OcRQjpJRp5Krt4rzfZVMGlJB4uar
         /wuXhduHD1mZdpsMC3YyyeLVGK1yMX08Sei5rkkPREg176FnYGDFjfUWpRNNFM8L21fF
         GxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763743762; x=1764348562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGlnkOToO1jf+8pr/raDuQYhOEXUPTfBya9U9ZeDpYs=;
        b=JtblcCvlIL8jDytfCU0cgeR9U6IBQTaRtQKmVlpDfNtNJvKuLtZ65/wON1dB98u64p
         j0cISULkgb4DPqQ3vPqPKDQtLKRL35Ma9W65HlohrN11IySIFcW6RkdzVu/1HDZTd8VT
         1NY7XZD/E4cuzbSYt+c6c6/dWq57ERN3SEfsX8c/a3L12mVClkgpou3SYIo3nojp9d6e
         B1BrVgMpdXD0liICW7ZVYv8HxB0kjyCcvU6MPCrWXOaduODcVDG9SKp8EoxdlpAnObd/
         mHJvPwkdZsd8BqLytRCP4/uhPj8SjxcDN8XXR777D83BF2oB/EEFaClNzpPjJWm7zMIx
         YjlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdeh9vY6eL/8uLmdv32sAikqdNQXo4aOIGlK3zTClbrvX1TfKhwecjGQFQ7QDaLvY1ZJ0n4BygcdJgl6CfEJS3@lists.infradead.org
X-Gm-Message-State: AOJu0YwIXYJeVf1c8X+zjQ5WEhHP7njeswcBjUnJ1gJmN+TYi9goTSpp
	8d3raYZpds+U6xMqzvqFvJh2b1B60Dsw7/ulXuyMB/WbRZF9349hBsvj6IjnfNgKXro=
X-Gm-Gg: ASbGncu/7PmMZHa4LlXCoTGiRVp5EqpNct129g67vcH5faiyW23NmRbwUf+OlS11wqZ
	8yalEKaKwlPXQy9NNua1k5+i5UzXOv5YSnWcZYnU3aIad1T4rETLv8GiO48hPmqqzsJMyd0kZlX
	NSrz3O6HtTxenFWyGkqgVcvVCP+MqXm2aguICvYknwqMeMnzv6jpD/UjPXBpkwgGnwWwFzTR3Z2
	efn/EuG6LpeZHaEA9z8N8DwwOoQUH02VYFqC+fi0kgaQLbIVzH9Uwk4MmLrSIg3FvVvvP7y4Q1k
	GXj15alvKSyu6vE1asu6OrXjmH2Y/krUuoTPlrWrLXNe7EZcTPN1Tc39l5fn69MCLatphiLfHX8
	krUYvmNjBPbq/zae5nTtu2N+ba4+CfqInFY7sn2ymM/wreJ+YLT3nYbDoNLsJL0i0NWsC6hgM0h
	HKC9X6TwJoYtiC/guBS/k=
X-Google-Smtp-Source: AGHT+IH9fgh+0AmyQ3I7+I9o5tgoOvXp7ga4hErs7KJ7tdVH3mP2gYsIWXJJszHZqn2a9PoLYchupw==
X-Received: by 2002:a5d:5d0e:0:b0:42b:48bc:498f with SMTP id ffacd0b85a97d-42cc135db65mr3645210f8f.14.1763743761548;
        Fri, 21 Nov 2025 08:49:21 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:803a:ae25:6381:a6fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8ff3sm12938478f8f.29.2025.11.21.08.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:49:21 -0800 (PST)
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
Subject: [PATCH 0/4 v6] PCI: s32g: Add support for PCIe controller
Date: Fri, 21 Nov 2025 17:49:16 +0100
Message-ID: <20251121164920.2008569-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_084924_064312_FB2E63B6 
X-CRM114-Status: GOOD (  14.21  )
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

Change since v5:

- Removed relocatable bit in yaml
- Dropped pcie-nxp-s32g-regs.h and moved reg definition in pcie-nxp-s32g.c
- Removed a useless ret
- Change kconfig from tri to bool because of memblock_start_of_DRAM()

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
 drivers/pci/controller/dwc/pcie-nxp-s32g.c    | 404 ++++++++++++++++++
 6 files changed, 562 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g.c

-- 
2.43.0


