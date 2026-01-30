Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15779E6BF0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 13:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HM7frh05im77oZIDqVclBmpgKOAVmImS7J83MO9Bgs0=; b=a3lmtw9KoH11dA1ru/4L6/q8Fe
	HDu6Q1k61xqpvrwg/I5YNRt7xfj0aOt0Ir13x+AOIFa5rRCqbHIhXnbKlXAPuaR3GWgHB7/9kftzC
	CG5TQSQrSYh/Mu7vBKReRIdmV8aquWcQTSWkWTdggGsPUwKleSbCgCANLHw626tQMvmrt2ZMxK3ea
	EKdBudwPbJ7+i2JQYRilnL2H8SAyTVJmippOTPUnZdyOZP2b63+LqSPjCEUlKiJzI0mejG7RSCsAA
	Pl0z2oEIJOlVe+sgJWzDb7Xz/+C34GqSFFArKG0QwpGdIoUz9dVPYyAvNjFwpycpr8+mpQcccgZHZ
	Kf8r92Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloPY-00000001WHo-1XKX;
	Fri, 30 Jan 2026 13:19:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloPW-00000001WHT-2JUH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 13:19:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47ee0291921so19535415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 05:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769779180; x=1770383980; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HM7frh05im77oZIDqVclBmpgKOAVmImS7J83MO9Bgs0=;
        b=PMVwSuyJ9FCwfism0CMbXht8ggW8SOgm/HB/c+S9ea7+Te7tW9gffqc14ugK6VWCsn
         DjrVWfG7iRzRC69FA0JKmq+mbKKTNS6hTgI4Cg14uNiGdXYqN7KOd4eEU12OoNgohBjE
         RgbHGjqubgJI7ISB1lM2Ocu00LFOp6P1olQihWRAbWbOG5/nnnq/EoaNTMbKW+VKVE3U
         hR+YFBXGBVZsWRykLMtXS/Nxte4U/JvvzABEPTCfaA/hmQ1qmjuP2Ig1yGWW/Vj29kxT
         LssMgIdBfyB0DpXgHn3i0c+21kgdtj+Mbh7HxkJFKZuafP0P5yNvIYQ7Yd/xFtmYVwv/
         kTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779180; x=1770383980;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HM7frh05im77oZIDqVclBmpgKOAVmImS7J83MO9Bgs0=;
        b=xLgFZTZUpJxC6u8K29cXM3f3zRTfNb9wxr4qKelHFzxwM5srmhYgdnx7NzDREIQNdf
         l7V4bfgyOFG+SiVI43a8CaRX2wLepIAEg0ssc5kEjNTSjINI/ix6YFzHY1TkLgofMciW
         eTKphOqFGY4XxJ77bQX96RUb9InL96/Uowj8l3py9Vr9m3mi+wZu6vRGjMLR4Hd/cQdM
         QA/slbkDDah82wYor82fhc2jKBtJYzhNyWbPUyu4oHTaQ7AVi+2nTs9H7SplA4Z5r1+i
         6G5a9oyt99bJnXHLneRvEle4Wcmm54aI4MLs1ocgJv98yWEUvime6ALfkntRtJVOlErh
         Tl3g==
X-Forwarded-Encrypted: i=1; AJvYcCWGDjxBxh9xDYuZ1us249n9ZAiu3tzWid9MGoF3GVzOq4v6fJOFLIXzehUItVlAAH7YE+ny734AVxp3NVPWj+jl@lists.infradead.org
X-Gm-Message-State: AOJu0YyzTlmLHGV5QQwI+DVlZpvhXRt0G/6tJvn6qSZlT7uTbRRzt7dF
	yYSYa4WCUgqVOxw/Pr+Z4SiMWCm0Jm3viDL593bgnAXaEpC0nMf9JKqw3mNl7L6bqXo=
X-Gm-Gg: AZuq6aL6GuxFBSur414FXvUr/u3rtnVN5qao4SrJ7iSUOu5ItsNbQJlJy4gr54aiuLK
	xTVVRuMpHA/QddnNGNBNEW3MwwH/0cLqgIie7IZJ1FKxA55ZXXPy84PxlzSkLWpv324rqwYOKxb
	718zpMWC5+jeaZ8Ze+RI9/Mr7Qc2NPpu2XvuSGzMfM9/4D50tVhti9l1mJJXS/oQY7Fv4q0gqEB
	8Dierj62DdgrWandweQbF7q7DsNcPeUYti6d/uckpIt9HR/f92BBYsvVeuEkBRzkJHnSSyDu3XQ
	YXaavspUwZAzbTK6OzV2G86r/AuzTIqCUWQACTJOOwMMvm4+pWQLerE51zVhS440PrSaT8STJuk
	yDG+O1I0sa60+ZToqi8jsEu35e+dpqxqeZwpLJH6vsd2Oc3gLqwCMfj7ZVh/MqMbk8sOk8dVmbe
	xQ0nvdvXp0GqfuP9hl
X-Received: by 2002:a05:600c:870c:b0:47f:1a8d:4f30 with SMTP id 5b1f17b1804b1-482db4e2501mr31706135e9.26.1769779179560;
        Fri, 30 Jan 2026 05:19:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd78d3sm203603435e9.1.2026.01.30.05.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:19:39 -0800 (PST)
Date: Fri, 30 Jan 2026 16:19:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
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
	Sascha Hauer <s.hauer@pengutronix.de>, linaro-s32@linaro.org
Subject: [PATCH v6 0/3] s32g: Use a syscon for GPR
Message-ID: <cover.1769764941.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_051942_632134_BC8FA836 
X-CRM114-Status: GOOD (  17.71  )
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

Changes since v5:
* Fix O vs 0 typo in yaml file
* Add Jan Petrous's Reviewed-by tag

Changes since v4:
* Return an error if regmap_write() fails
* Add Rob's Reviewed-by tag to the yaml patch

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

 .../bindings/net/nxp,s32-dwmac.yaml           | 13 +++++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  6 ++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  6 ++++
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 28 +++++++++++++++----
 4 files changed, 47 insertions(+), 6 deletions(-)

-- 
2.51.0


