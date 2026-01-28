Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6ACD35698
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bvsllvRxaSRJovqhkHtFHrVWBKQNv1To0hacwlFk6IM=; b=KA78hUZAIUOkhkM37xVYGkPEjH
	/7edxbGJihM9ixW3dWlthNWbxxdDk+6UUdPKF7JWigtQZw6i2n6aVKWu4jzdGIwVir+QwwFRa91EE
	Qt7ppyiVbDWGCInDr2dFbYAqY3x2e5qrxu6hxC06a09NZhcqZE+0A+MjzUe1D7c5XUBPtVIbkvmta
	ZhFHPjiKO1L+LK7JKHzyZ14mAmdtcbdSDd0kgdzaTZIdU1+grlxtUzgUlEPG7aZ/aAJElTv/Ay0ZB
	xQtQgfgjtHxXXK8O3mN1ZEShZ05addzPlmSDbl/SDQ/5tMsLElzjXBPgtyGNS1ILkUvhVH//8F9l8
	GB88t54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2FR-0000000FmMz-2sqR;
	Wed, 28 Jan 2026 09:54:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2FN-0000000FmMI-3FvH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:54:03 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47ee07570deso50892995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769594039; x=1770198839; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bvsllvRxaSRJovqhkHtFHrVWBKQNv1To0hacwlFk6IM=;
        b=c5ll1rX0rzAfs8QrIXuzj69ypKlJCxaFQuFO13EpsRBuFcaFosTyAtJIr/qPN8fpmj
         bhRNn8JQckFfFKd2XUpyB95xdizZ5w9aLVRWg9DEadGKuzADnZLX/UQZD5xN/0x9QoTr
         LtJNVZtYuVynHXbcpMTxDb/okPtVxbqbtaqUBSg0mGvBgHXjHHZxmRRWEB3R0lXSSGwE
         CSJa8wSguZXnKHkqzLnjxCA5CIlSbRTDlvqmTr9BWYbN9/tYMERnW8BK/00+d1R4SmGK
         aHfzritxewSjkdEbnI+TMKN2trE1nnS0f8KiX/5/0tPOzJgGwUy7DWJh4irw0vqp5/JK
         cVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594039; x=1770198839;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvsllvRxaSRJovqhkHtFHrVWBKQNv1To0hacwlFk6IM=;
        b=rlhXUG85HPl/DYRwlOC0HcjnSSgAFGW7/0hkdePJUu4UFv0gwBmVMdAgaBDM+1Oxca
         dSmqXRWLEfGDoZfSCxGfmVAMa0e1LhzQc+2GOhCVL3FERt4AM6h6gEwxVOBiAdJuNJPx
         J5LOKAZAkgG5XF5/POcaJzenCvseABg7Bsvg/A2skuK5VUNteM3SNoVPngXOkn37EMps
         swVlQNLAJV0jS71/ud+2KVwExUNZIT7VGKGT2URnSLrlvqtY1S+vrjVQAREcuhEVfaWT
         7S0XMm38CrIeaLw5GWckwu4F1po2/4y3BStpPwuyi8QU28SOYrOnVcTY/7tLVO8UJ4gw
         6Wfg==
X-Forwarded-Encrypted: i=1; AJvYcCV14gSJ92lLjfagVe8cxa556WEqezFZ5tcEmNFtXu2h1TUU3sryLFk8RYMjcmjZPzkZFIXFuT3w6hv99m2R7zjn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf6KBsYnBqX+EAcXzsUnkKiiJ6Rxk44daSF6oHqSuyf+CKB5kb
	V6JkN3YiM00UEW12cXIoRc07miiIoe6vfZea6XAIPis4nJQ9XCt/j59B9uODDk98lO4=
X-Gm-Gg: AZuq6aI2e3HeEvBbk1mSSni1yoIBjDL8pe5csMjXyffdC4DVE6ke5XMnAvDpT5uQzIF
	b5xryLfmvLSdws6KrqX3BGrHJp8BahIGw/0TUBSj+0Fjppk7p8YqjgsVbuwWc3nzvfCb8F7NDB1
	7Hs4jOM5MYlZhKf54Juvchh32C8PoIZDyCiISnd5KO+LfmTK29+YDC4cih1wN2SEzLYfRNRqJ7q
	LiOgz72U7PemAu3yBRmo7FEVQTRKEo2HzH7KOdPUqA14+qGDqZHtGkrTNl22iwH8aR/GyrM8/VL
	iu0Z4OnIVDMalaOcs0FXchr5kExeG/CpbwqVrPikBpRpFIbsaVkKFrSuR9OaD4jemnI18uUPB3j
	6cT71KOkwx2zWuQ3gUpAW4pek2H+zYG61qy4pOeUKwnmQmzUqmPjoqoiwUiYTGGd9DeYihExq85
	DKYBUT+Truov7uBQiq
X-Received: by 2002:a05:600c:83c4:b0:47e:e946:3a57 with SMTP id 5b1f17b1804b1-48069ca552amr51714835e9.36.1769594039364;
        Wed, 28 Jan 2026 01:53:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm5836437f8f.41.2026.01.28.01.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:53:58 -0800 (PST)
Date: Wed, 28 Jan 2026 12:53:55 +0300
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
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v5 0/3] s32g: Use a syscon for GPR
Message-ID: <cover.1769592679.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_015401_845158_AEF96189 
X-CRM114-Status: GOOD (  16.72  )
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

Changes since v4:
* Return an error if regmap_write() fails
* Add Rob's Reviewed-by tag to the yaml patch.

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


