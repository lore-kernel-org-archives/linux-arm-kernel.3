Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C838D5B175
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MOcUNs+T7w7UnOFVcqXvYSgg4w1o3SYRSucYGzT5NG4=; b=axwE19BuZUubFAn1GwPxz9wtiX
	RUmN9d7jMWXpaExP+ibDZnh1wyDSjYOVUc29ec9FxThzZ/hFearw1tu3jBo6jzQ254Z0WK7u+eT+a
	QU+sDZB0LCO36C0Ef+wCMGsR1LPiw/LGSoNG8d4GOEgn5zmy0pXS+4lbFoH7komlzZ3MOIN87sO8L
	tf5nVfay2zpf3Ol22gRJqlwip6WCKZJRJX67TguuE64ZvpjxbXdQcli/Cu1TT7KwZLprMxJ0twMUH
	fhpoYlbbKQD4rbUvG3HBS8vRySnC9BwPi1sS3lKc6PEy4kkG0axKFFcFWVSQ4WeDcXNVYwrIptFgG
	Y/l2hoPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9lp-00000003oo9-2nRH;
	Mon, 15 Dec 2025 14:41:53 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9lm-00000003ong-2vJx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 14:41:51 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-430f57cd471so819416f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 06:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765809707; x=1766414507; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MOcUNs+T7w7UnOFVcqXvYSgg4w1o3SYRSucYGzT5NG4=;
        b=JaQZgRQV6GCDIjFqXV8WNm+UwKUSxO5qWsBjB4XzSfu3ks2zCSAD/ZNG/1CHrbVGQC
         SWpEEjCK+s+zy4KkLOjS2kls9JK0DNXJ0Pco+UENhfRpKq9UoYyivJsfc/3QMVrjQyQ2
         qVYaZJAUm1R/AcRU4n1S+nmvUw6Dh4sltH7f9uKvxb1f9cY3kTHO5JPgH0hS619wlB/i
         t97TE5OpXks1dw7uLCrJgUlq53gbvqFZ3FP3G3It+0yr6+SZSFKWKj0xsv0NwR5TwsG8
         xODwkVa3YxfxhTlPfF1KIjokhIby33/6rrK/hwsWQiBs1ksMOACmGFP3W2yqfzw6kU0+
         AzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765809707; x=1766414507;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOcUNs+T7w7UnOFVcqXvYSgg4w1o3SYRSucYGzT5NG4=;
        b=GM87ZnMakU1CHOSTgYfWqYADN3J6A6Spv68jJLdyxZy5FRHHWqFmePkDabNsEQiIel
         m4KI8IlJ6QFPzJtZXSN41KEZUx5IC9PoSRJBig07udrOBktSPubY6aCPj4eZwP40KO5X
         xRyrKnTW5uA+Mgw84JxoE1kFhG1XAexLQSIBID1sNd54+RaVmglnRdP+W1NaCfFrAHES
         TJaJ2NErJf6wCcLEE5eYHJaVCrQarKPXWs8/Eh2Fp85SEuEeT+VaEhTjmSEJeSxj+YYi
         D2PgU6809qHxL91R9rlXPvqHqH0P+/A6/Pvh90WQMAvY8qAxraH4Mjt6TIzgQIQ0p568
         GwXw==
X-Forwarded-Encrypted: i=1; AJvYcCW64crEr6WeBmpGOskwdCypRwduaHfnbXvKmTeeYj/PN4YewRLgLZb5UCZVZ+/59WDJxTs9RvYvYgK1fM/VlKDw@lists.infradead.org
X-Gm-Message-State: AOJu0YzmIihRjPRLS+CcfGfOW8sFVVhaf76nLz2H7jJCn0q3izf4h+sG
	HsbPnx9zJ26sUdcMfMe9EDj+WgEnWq7f7WvOdfC5k3/SqFcDKqgVTakMozAR/qrHcG0=
X-Gm-Gg: AY/fxX6icQ/CL9+zNBIi6dbMURkjDrsUUzyziKQTywSQdqJIKHZoNsb0y1IIkyaE9ao
	3YJV093CXn8ZdP9RPibrcnskO2ZgwZhTtotMJhIiAHYYpwqVWx4a1spV1agciSSosO7zLBihCaZ
	CHo/Gt9QHeFOXQHThRsSvxNrtce3zUbmtnCEuy9MfWhp9WsRKHRXtI0SsqXw7pTW45J35Fkh3Ph
	fPMJjQ/fY62iijL9Qiha2ClLEmk5DOho2Byi3+13uXywjMwoPJfq8Psr8hji0+Tdj7uo5LNeIqy
	AiOjYKyTak82fQrcnKMh4uL0pWHoZBXpl7uz5lX8M2FVrniLiwhYGsC9BsPCr6IM+in7iQajK5u
	z2+vQLcJI9GJhWrxrJPKOSyf/Rg4NYvUfv4osPn4gG5AoC3Pkfq5/IynYohZbaFrAfq6KFnKDww
	3u0OQp6jrzOYqIlOfy
X-Google-Smtp-Source: AGHT+IH7tV1xCOROP2jvu0xV490eqBk9+v5Ntm6XR34UvABXmZ0b23HM/6I4IQoJkUDLysFdkLNqfw==
X-Received: by 2002:a5d:64c7:0:b0:431:327:5dc8 with SMTP id ffacd0b85a97d-43103275eb4mr709797f8f.46.1765809707367;
        Mon, 15 Dec 2025 06:41:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ff626b591sm17343328f8f.15.2025.12.15.06.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:41:46 -0800 (PST)
Date: Mon, 15 Dec 2025 17:41:43 +0300
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
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linaro-s32@linaro.org
Subject: [PATCH v2 0/4] s32g: Use a syscon for GPR
Message-ID: <cover.1765806521.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_064150_794885_C9DC2D64 
X-CRM114-Status: GOOD (  19.93  )
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

We still have to maintain backwards compatibility to this format,
of course, but it would be better to access these through a syscon.
First of all, putting all the registers together is more organized
and shows how the hardware actually is implemented.  Secondly, in
some versions of this chipset those registers can only be accessed
via SCMI, if the registers aren't grouped together each driver will
have to create a whole lot of if then statements to access it via
IOMEM or via SCMI, where if we use a syscon interface we can write
a driver to handle that quite transparently without modifying each
individual driver which reads or writes to one of these registers.
That code is out of tree for now, but eventually we'll want to
support this.

Changed since v1:
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

Dan Carpenter (4):
  net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
  dt-bindings: mfd: syscon: Document the GPR syscon for the NXP S32 SoCs
  dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
  dts: s32g: Add GPR syscon region

 .../devicetree/bindings/mfd/syscon.yaml       |  4 ++++
 .../bindings/net/nxp,s32-dwmac.yaml           | 10 ++++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  6 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  6 +++++
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 5 files changed, 44 insertions(+), 5 deletions(-)

-- 
2.51.0


