Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6483ED778AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8jNsJjXS8M5t/mEUZRdZlxrFzfCZpFMkBqFJLBshMIk=; b=PDBZBoQm0lhewNnoEmX8KFe4vk
	ho7Elx+8eETYIhdi2iOTH8vPw5mSNKCIquu4/0t/vxBQxXnrFzR1Zx7zfAdFctMG0n14l5TFnt753
	2ETz4JdlnRus4SueegW4vfCMEHfSXEBF8uew87HcHP17GpocUgDmWuF4D4f5z9q87gbG7Yl3UB1P2
	2d+cQ1MhEyCWQBqVQeq+Ae5COtSyycLg5rxHq070iXnG6QHXT7d3IC63c2p9TBrXl78X8ZuqW7e8F
	xQdmfSDOqIDz3HK9WCj/y+g3XPY+HFvy1TrZDNXgavC4aCy2Dd07h5S0ixKDgeIqKf+TyWq3Xkzru
	+fBhw8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNBa-00000009ROe-2uim;
	Fri, 23 Jan 2026 19:51:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNBX-00000009RO8-0Slt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:51:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso29410655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 11:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769197868; x=1769802668; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8jNsJjXS8M5t/mEUZRdZlxrFzfCZpFMkBqFJLBshMIk=;
        b=YfHsBX59Y3sH3MlNmcYySNG5afRI+mb7fwomQgC5AnpiDPADuXLMO4i++9hvqj4XNt
         ZbD+odrrWy23dbJXePL7SZE0Z/I5a8uG60wV3bpqROF4eXh8sb9g6nSbiB7H0xErg6Gv
         mjgGZ/UChBGXIG+XmYZCNjnl9HLhJSFr1yrA3mW+oGxqe3+MvtYyXD4QaF21E844SISl
         cI57ViqMLsXiOdDaIQsIQo94Uh28vz7c22i+SGjh2xIM0lAqgNn90iaMwnzJgN50iykW
         NhAmwvw1T4gqF0wRttW7h7iKoyAPow0G/y9m4+i9PXMIFoIbuB64/YJBcWNbmSKkPNmx
         ptqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769197868; x=1769802668;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jNsJjXS8M5t/mEUZRdZlxrFzfCZpFMkBqFJLBshMIk=;
        b=CGE2w6Yj8teh9z5mDHcUwIrWW4AomNsUt/WxvnBWoHO3Q0vLDY/tWxfR6XABiQgiIn
         d/qr0RdDqpD6lMZpwu/t0vgP5Kdxpgz6HAENGeHTc4vXGan+gdWLfymYs/Ufg6UEIVSn
         RB1Nt7kBwjP70jyNv/E4X7O6v/w+lKsZx9SOqw/yWb1kgjHEV7Ux6stl1BVbpxNmhXLh
         4TzkaDa8Xb9bifMLqQHvVvGb+SiUqr19UCSN+X1vPPQj3HXt89XbGOuSIyfITOjUKrqq
         7HCIprE9w6nlrHKjfS12Rt3vSQpo9c2cvXrvOUOl3eQH8A43VLumasks1Cxqth1iAwoH
         YdMg==
X-Forwarded-Encrypted: i=1; AJvYcCWqkoUpIYusBiDJeX4F9qctTbhjYXWpKvflM87Yr8OWgz8b+OXf0phDChcPuhn9sHeKcPNMExNqSIfH7+MzoCjg@lists.infradead.org
X-Gm-Message-State: AOJu0YwuhsBd8TsNowo8opx5u8QEpXmY1tzi4aF0bDnZHdGLptK0VHI3
	MEPf6LFle/jxQBZIOmofMgh9LvHJMTwBrFHsNy99sXDgNsg9njXm/M3YuiaD6okv/3s=
X-Gm-Gg: AZuq6aLL5SQEqLG6+0ezNduTazFRqszz8KbvOWZhFL1+5LnCl4DUJi4dsMnAlaLYavF
	aZDWXCLN54paX5e1bsK+9lIRGrRAOaeZhufhgy+AW+k8GQB3niVTEp5O6NiSbJN1QL+nGbCUwm7
	3ppx0GksxfZY9puoL5dmJj5un1KEu63zbhpCiX9hKMSkmuvo4oyqAnmsn1Er7XZXyd2tPJeJXM6
	NUvrWUAwu43WZbru12MY1V6eWLkPUTm6gYR8Bercu0rQ3q5UygP14lbc5zHYrG6C5m1gQetRQBh
	lUBJdlnxn0i3VzEnkRjDewlv+2jkRUriYW10nKuoaPNeA+Sc5gh4wa0jcLo0gozzp+z35UWmE7H
	oLSmfHjThmF03BLEPt20fSrJ+Y4dY8dZghAkOyWvBbRZQRfVHBfAb8R590a8DREreUKoXtUMCVe
	GuOSXIMO6uMbouiDwE
X-Received: by 2002:a05:600c:5494:b0:480:1e9e:f9d with SMTP id 5b1f17b1804b1-4804c94810fmr65373435e9.8.1769197868314;
        Fri, 23 Jan 2026 11:51:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8a5c32sm94300895e9.11.2026.01.23.11.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:51:07 -0800 (PST)
Date: Fri, 23 Jan 2026 22:51:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.li@nxp.com>,
	linaro-s32@linaro.org
Subject: [PATCH v4 0/3] s32g: Use a syscon for GPR
Message-ID: <cover.1769195864.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_115111_196113_15C451B5 
X-CRM114-Status: GOOD (  16.49  )
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

The s32g devices have a GPR register region which holds a number of
miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
anything from there and we just add a line to the device tree to
access that GMAC_0_CTRL_STS register:

                        reg = <0x4033c000 0x2000>, /* gmac IP */
                              <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */

I have included the whole list of registers below.

We still have to maintain backwards compatibility to this format,
of course, but it would be better to access these registers through a
syscon.  Putting all the registers together is more organized and shows
how the hardware actually is implemented.

Secondly, in some versions of this chipset those registers can only be
accessed via SCMI.  It's relatively straight forward to handle this
by writing a syscon driver and registering it with of_syscon_register_regmap()
but it's complicated to deal with if the registers aren't grouped
together.

Changes since v3:
* Fix the yaml file format
* Add netdev to the CC list on all emails so the CI triggers

Changes since v2:
* Improve the documentation in .../bindings/net/nxp,s32-dwmac.yaml
* "[PATCH v2 2/4] dt-bindings: mfd: syscon: Document the GPR syscon
  for the NXP S32 SoCs" was applied so drop it.

Changes since v1:
* Add imx@lists.linux.dev to the CC list.
* Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/
* Use the correct SoC names nxp,s32g2-gpr and nxp,s32g3-gpr instead of
  nxp,s32g-gpr which is the SoC family.
* Fix the phandle name by adding the vendor prefix
* Fix the documentation for the phandle
* Remove #address-cells and #size-cells from the syscon block

Here is the whole list of registers in the GPR region

Starting from 0x4007C000

0  Software-Triggered Faults (SW_NCF)
4  GMAC Control (GMAC_0_CTRL_STS)
28 CMU Status 1 (CMU_STATUS_REG1)
2C CMUs Status 2 (CMU_STATUS_REG2)
30 FCCU EOUT Override Clear (FCCU_EOUT_OVERRIDE_CLEAR_REG)
38 SRC POR Control (SRC_POR_CTRL_REG)
54 GPR21 (GPR21)
5C GPR23 (GPR23)
60 GPR24 Register (GPR24)
CC Debug Control (DEBUG_CONTROL)
F0 Timestamp Control (TIMESTAMP_CONTROL_REGISTER)
F4 FlexRay OS Tick Input Select (FLEXRAY_OS_TICK_INPUT_SELECT_REG)
FC GPR63 Register (GPR63)

Starting from 0x4007CA00

0  Coherency Enable for PFE Ports (PFE_COH_EN)
4  PFE EMAC Interface Mode (PFE_EMACX_INTF_SEL)
20 PFE EMACX Power Control (PFE_PWR_CTRL)
28 Error Injection on Cortex-M7 AHB and AXI Pipe (CM7_TCM_AHB_SLICE)
2C Error Injection AHBP Gasket Cortex-M7 (ERROR_INJECTION_AHBP_GASKET_CM7)
40 LLCE Subsystem Status (LLCE_STAT)
44 LLCE Power Control (LLCE_CTRL)
48 DDR Urgent Control (DDR_URGENT_CTRL)
4C FTM Global Load Control (FLXTIM_CTRL)
50 FTM LDOK Status (FLXTIM_STAT)
54 Top CMU Status (CMU_STAT)
58 Accelerator NoC No Pending Trans Status (NOC_NOPEND_TRANS)
90 SerDes RD/WD Toggle Control (PCIE_TOGGLE)
94 SerDes Toggle Done Status (PCIE_TOGGLEDONE_STAT)
E0 Generic Control 0 (GENCTRL0)
E4 Generic Control 1 (GENCTRL1)
F0 Generic Status 0 (GENSTAT0)
FC Cortex-M7 AXI Parity Error and AHBP Gasket Error Alarm (CM7_AXI_AHBP_GASKET_ERROR_ALARM)

Starting from 4007C800

4  GPR01 Register (GPR01)
30 GPR12 Register (GPR12)
58 GPR22 Register (GPR22)
70 GPR28 Register (GPR28)
74 GPR29 Register (GPR29)

Starting from 4007CB00

4 WKUP Pad Pullup/Pulldown Select (WKUP_PUS)

Dan Carpenter (3):
  net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
  dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
  dts: s32g: Add GPR syscon region

 .../bindings/net/nxp,s32-dwmac.yaml           | 12 ++++++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  6 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  6 +++++
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 4 files changed, 42 insertions(+), 5 deletions(-)

-- 
2.51.0
*** BLURB HERE ***

Dan Carpenter (3):
  net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
  dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
  dts: s32g: Add GPR syscon region

 .../bindings/net/nxp,s32-dwmac.yaml           | 13 +++++++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  6 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  6 +++++
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 4 files changed, 43 insertions(+), 5 deletions(-)

-- 
2.51.0


