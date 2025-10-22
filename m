Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E78CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EEGDYb1h2mzgB0PmHyauQaDh/tQllsTXIY8VSU+TUKM=; b=4XLUbw1tO5rWlibsKXizS8vYL+
	TerT7yriDUZkVmrzEtwtASyS1dN/WMYVCEgWJAE/ge2wTUOvEOftlEh5Y4A8Btb0SCcYlwpwLfJtH
	5Ln91PPtRsN6ZjdVW+LQl2kKkLh/Dp2Tmdac8lpooWIs55ETx7uveva0VfAqAOo9+qhEuhLrg+cMA
	lSMm8w8EqmJTxnbCJNcOttA1TFyX3b/UCsrptNlijszCMRzTJpmzXTuGIyRqL28xf+2BznUmN/AAj
	/z9zXo7aBNBNtD+iH0KnkdU98zlGNTC3qPQfzq2Sk+HZuTCiYs8gPtOZ9X8R1JuWytSNA0N5LAysS
	eoHT4xLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcri-00000003pnP-2kNL;
	Wed, 22 Oct 2025 17:43:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcrg-00000003pmH-2Tpg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 17:43:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4710ff3ae81so26715465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761154991; x=1761759791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EEGDYb1h2mzgB0PmHyauQaDh/tQllsTXIY8VSU+TUKM=;
        b=BiYYJb9qUZvWyONdLERT0iKh4NCqx+xkX3dGl5a4xHF/2XuK0uJk3nLu4HuT600XPF
         ng7PrACLJtTcAf3p1LtKB3CgzJ/Qr8z9HXqLc8M5svuNpinXES7bVZMrCoZlVPMeRkFB
         PKVxc3m2rt7iNDLk8L2e+FN2D2bI9qwrToAvdK4U74NrKItu1BX9boKHYKTZzm/rp98M
         yAZO1hNLkJ1qV6aPdg+/A7Pox5YsvIlDOUncbI96BtWkCBnyCcE1GpJIT5jTYXYwy785
         2A9ZArMEoNDFzbEP4JA3kJeDhYSqjI62dOXRmR/eK7AIO0e+JkGhvrKXSfkNk/F9HC9X
         95gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154991; x=1761759791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEGDYb1h2mzgB0PmHyauQaDh/tQllsTXIY8VSU+TUKM=;
        b=LEdNyqPID/260Eb6YHnmizSMqpt8zP1ZAJTdFC0XsYY7hkwecq5bLgRvu2MwaUD/Ta
         neGjwaLbqIAdOYGlt97SSWPu079Ku4KgbcTM5Jq7737k/GOwbgoRFcD2SJJVkY53MOcL
         E4UKU6+f/Sj05fhczf5ofdnu19sjZs17TmRgpDQfiIu5wmJJrl2MDrLt/lKZs9Qx81Aj
         gtSYvZ1uns0tEdGPvDn0g14rPBg7Qw/wkn8I1JJI4QS03MzB5BVoSBbZQ1AGOFsWdK3B
         x50KvN787HVSp0gq0hkg6xCMUPWzTEjmvFfCBIRK5rtS8JJwHC6NIehnlMZz5CUVl+hQ
         uFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcZ/smtK/OKqcrF4AhH7jMuygVNzWHWTh5KQHXGwYNSQsL4FLzEN2lRl8296/E3GBQuy3/rX2gJHdlWiVurWDb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8j+icrMUjkzdokaY8f9AY8adeQQB6fpxU2YUkjA571VsK5isR
	c3QRmgE6yiNVw1s3gCuh/hXLUbzKbl+GynEqMFlCxy387aAuzK7BVXc6LauQuSUBXjA=
X-Gm-Gg: ASbGncszSutwzfWw21e5yjzoRnW4cbCc2hXO9WVTeftUxbW6GISMk+wddwjAnLod3v6
	dcGMTYC/YGbkzQrx9UVAJx+MNlYvTSRqhO5r515Crq1NrJmAa100h7hUQSVhonR3i6EThNu2aAU
	G/k5lLeU2DEUhH0ntxpl+vtjyrxwckUvLE7D9G0K4FRhguOB1wop9s23PmHVlwpBxX3GRBGj/Jh
	X7ay77UleFM3drrqEYIOTyFP6hdae1HohGmezuBgigDKsfezSzG2qcVG3MsWmPbk6kuhZCXZ+WX
	81GtNXNeFR2MJJPa/luGOtHQthpyxm8UPOpbIdUAKKDieOVIJmnDNES1i2fcTMurJUhrY+puiC/
	DTUY82UsHVgkwpzmEITr+sT0L1ausg9BZV8+emQhXwLLPCMMMyKleyJgjpE3JnhBXDffDUQSuM+
	0U3D1ZW3TcTEOM+cJSXAs=
X-Google-Smtp-Source: AGHT+IEMDLmd+T9rXjtLSXLZLP4aZjdA4r3I2RlDm4L8/0x4vSRk561EjNsJMCQhfMdzzPOvzd0FsA==
X-Received: by 2002:a05:600c:3b05:b0:471:d13:5762 with SMTP id 5b1f17b1804b1-471178761bemr151131135e9.4.1761154990718;
        Wed, 22 Oct 2025 10:43:10 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:edfc:89e3:4805:d8de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494aad668sm43434755e9.2.2025.10.22.10.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:43:10 -0700 (PDT)
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
Subject: [PATCH 0/4 v3] PCI: s32g: Add support for PCIe controller
Date: Wed, 22 Oct 2025 19:43:05 +0200
Message-ID: <20251022174309.1180931-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_104312_663309_2FA6D9DC 
X-CRM114-Status: GOOD (  14.12  )
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

 .../bindings/pci/nxp,s32g-pcie.yaml           | 102 ++++
 MAINTAINERS                                   |   9 +
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-designware.h  |   8 +
 .../pci/controller/dwc/pcie-nxp-s32g-regs.h   |  37 ++
 drivers/pci/controller/dwc/pcie-nxp-s32g.c    | 439 ++++++++++++++++++
 7 files changed, 606 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
 create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g.c

-- 
2.43.0


