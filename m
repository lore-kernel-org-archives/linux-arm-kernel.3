Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D7EE6E807
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 11:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WnKseKgzuDEwEZ2TxAar2LzO8o7OZlfDBwq/L+OXzI=; b=EIN5i8umAPPEOFb3dOsI63VNTP
	Ssjv1EqwrQMvRed6SpxDqPNmDovA9m3NqP7qnNS+DsIyL0JaSJaNptsSQZSC+yDvg4pLaot9YN9Td
	564fyCsr5b1pky021Xc57XRxxCkRmLySwQ7rbm9T/moYsXSHyNurcZOvWlSwFbMHKwSFWE2+6f45l
	yidHRGEaRNi50NlWhQ9IUPGs8k8onG4Vzq4I9PkkEjTXa0udnLQTRU1tqoMR7/M+6db+tmh5hBhHq
	1lUNAK9DgQCRgkmmtVmq4tEK7wviE5t8mUcV1yrJgKug2y35HY+SlY5EqvSULYt/RlYhC/beW+9mo
	OZZj3Jhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnER3-00000006X6N-3WGc;
	Tue, 03 Feb 2026 11:19:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnER0-00000006X5i-2VEm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 11:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770117544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2WnKseKgzuDEwEZ2TxAar2LzO8o7OZlfDBwq/L+OXzI=;
	b=hqJCF1h2HcyKLhvt/wlUPlYgT5qwRZmIhQscLkYO1LwxPKqKmbIx9e6kD5pV0e2LFGmK4o
	vav0FVKPsT9RZWc5eddpSPijJen+0c/Cz8G26WcCEZweJlV1pFyvhyIGtzvjwJ8JaYZIdB
	Xz/UiqDf+WOa/0jo1qLdj0g0i2Rae0w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-ptDGx86fNMujx6wZh5o8Hw-1; Tue, 03 Feb 2026 06:19:02 -0500
X-MC-Unique: ptDGx86fNMujx6wZh5o8Hw-1
X-Mimecast-MFC-AGG-ID: ptDGx86fNMujx6wZh5o8Hw_1770117541
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43284f60a8aso4627196f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 03:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770117541; x=1770722341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WnKseKgzuDEwEZ2TxAar2LzO8o7OZlfDBwq/L+OXzI=;
        b=NNmx/g7e4MjbYItMc+GW6TUrdEN441TDDSUPsprf1t/kP/dc9TvXJ19luwX3ATRJ3I
         cXBIMqlVsI5MA6OGlsyXrwFDF0L1TQIXAVpffh3qlgOEFrX9DyMOF2Q1RaIPN9OFjRGF
         0p493J6Kvq3mw2/i/fUU8X7oo3xBoNKlbZFdmGqtd/63GaMWCd/AFXOOZXmTdzIe96vo
         qzoMBVIKEIKyB1Wz3/Va5LSRCucuU9i2hJ7fkk2+l3Kca1j+lEx4qsqEIWpjtLwQ3Os8
         9bxHdylwi47CnrMr2gvPs2H+5YY78FOG+7g5f6cOiB5QIwaSHSKPstpTTe565y0rzaBr
         MqTw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8K96eiJnT7m6JCK+q79FX43sRhAD4iZCErqOXKRVTYNE8BSBiMlkqofBQvkMZbGNNDQThttbH3+2VJU3tiMT@lists.infradead.org
X-Gm-Message-State: AOJu0YyZpbhTVEPVyGc/3TbuZv6JydumScycYqDkMa59CR/uTyhxSaMM
	ymEjjvmyjl0xQKAPjc75jUAORMSwP1xcXP3o1hfvOAbHRFdNPkUHJxhFGJzkYXD6SWLDUPAkF1t
	WZo1nMqYK772q3QsuStgk538McVxauM3kKSiL4m1abHN/pTYoo0IGT2kY1NjKGEfFbAn/4RhuHQ
	OO
X-Gm-Gg: AZuq6aJKRaHEneadS4VIaQ+Un7VH0Cmyu9NPLOSKFnR2DPrLFQWD60N9mJnyf5bBXEL
	bzfhcA9Nes+9CzXvM3Sv+yw2Z8dImGE0y64iw+n1TWOJrqtmlomM9WW42QgChI3dGDbQo6yjhNY
	1j7/LCL5JJLixEOeq51LadKiQ0CwoOiba++ODdc5hboJNuTlZSp71ovidQYzvseHCEjBfBNAHax
	nEIJMY8NEC4yDslXDzxLzq6r7LRAu+cDg/w0xJ3m+75g7j4sfnwq9DKCwsDOnxr3r/ClZKFaJTx
	RG1OBLA+OtQN/ZfkiTleP3uV1HfnlcNX5qNAsXnUTUpl2QAgRSX0PEzxf+4lfu8Rq0+ac63kaGG
	QWXw+alUEANY=
X-Received: by 2002:a05:600c:a087:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-482db48f2ccmr209555335e9.30.1770117541299;
        Tue, 03 Feb 2026 03:19:01 -0800 (PST)
X-Received: by 2002:a05:600c:a087:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-482db48f2ccmr209554895e9.30.1770117540850;
        Tue, 03 Feb 2026 03:19:00 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbc7f580sm149384895e9.2.2026.02.03.03.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 03:19:00 -0800 (PST)
Message-ID: <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
Date: Tue, 3 Feb 2026 12:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] s32g: Use a syscon for GPR
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Chester Lin <chester62515@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Matthias Brugger <mbrugger@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linaro-s32@linaro.org
References: <cover.1769764941.git.dan.carpenter@linaro.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <cover.1769764941.git.dan.carpenter@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PPwfrNgHbVu4Mc_jQe7oRh2DnI-pONePxbgtI09C9Tk_1770117541
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_031906_737707_61101AF4 
X-CRM114-Status: GOOD (  28.22  )
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

On 1/30/26 2:19 PM, Dan Carpenter wrote:
> The s32g devices have a GPR register region which holds a number of
> miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
> anything from there and we just add a line to the device tree to
> access that GMAC_0_CTRL_STS register:
> 
>                         reg = <0x4033c000 0x2000>, /* gmac IP */
>                               <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> 
> I have included the whole list of registers below.
> 
> We still have to maintain backwards compatibility to this format,
> of course, but it would be better to access these registers through a
> syscon.  Putting all the registers together is more organized and shows
> how the hardware actually is implemented.
> 
> Secondly, in some versions of this chipset those registers can only be
> accessed via SCMI.  It's relatively straight forward to handle this
> by writing a syscon driver and registering it with of_syscon_register_regmap()
> but it's complicated to deal with if the registers aren't grouped
> together.
> 
> Changes since v5:
> * Fix O vs 0 typo in yaml file
> * Add Jan Petrous's Reviewed-by tag
> 
> Changes since v4:
> * Return an error if regmap_write() fails
> * Add Rob's Reviewed-by tag to the yaml patch
> 
> Changes since v3:
> * Fix the yaml file format
> * Add netdev to the CC list on all emails so the CI triggers
> 
> Changes since v2:
> * Improve the documentation in .../bindings/net/nxp,s32-dwmac.yaml
> * "[PATCH v2 2/4] dt-bindings: mfd: syscon: Document the GPR syscon
>   for the NXP S32 SoCs" was applied so drop it.
> 
> Changes since v1:
> * Add imx@lists.linux.dev to the CC list.
> * Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/
> * Use the correct SoC names nxp,s32g2-gpr and nxp,s32g3-gpr instead of
>   nxp,s32g-gpr which is the SoC family.
> * Fix the phandle name by adding the vendor prefix
> * Fix the documentation for the phandle
> * Remove #address-cells and #size-cells from the syscon block
> 
> Here is the whole list of registers in the GPR region
> 
> Starting from 0x4007C000
> 
> 0  Software-Triggered Faults (SW_NCF)
> 4  GMAC Control (GMAC_0_CTRL_STS)
> 28 CMU Status 1 (CMU_STATUS_REG1)
> 2C CMUs Status 2 (CMU_STATUS_REG2)
> 30 FCCU EOUT Override Clear (FCCU_EOUT_OVERRIDE_CLEAR_REG)
> 38 SRC POR Control (SRC_POR_CTRL_REG)
> 54 GPR21 (GPR21)
> 5C GPR23 (GPR23)
> 60 GPR24 Register (GPR24)
> CC Debug Control (DEBUG_CONTROL)
> F0 Timestamp Control (TIMESTAMP_CONTROL_REGISTER)
> F4 FlexRay OS Tick Input Select (FLEXRAY_OS_TICK_INPUT_SELECT_REG)
> FC GPR63 Register (GPR63)
> 
> Starting from 0x4007CA00
> 
> 0  Coherency Enable for PFE Ports (PFE_COH_EN)
> 4  PFE EMAC Interface Mode (PFE_EMACX_INTF_SEL)
> 20 PFE EMACX Power Control (PFE_PWR_CTRL)
> 28 Error Injection on Cortex-M7 AHB and AXI Pipe (CM7_TCM_AHB_SLICE)
> 2C Error Injection AHBP Gasket Cortex-M7 (ERROR_INJECTION_AHBP_GASKET_CM7)
> 40 LLCE Subsystem Status (LLCE_STAT)
> 44 LLCE Power Control (LLCE_CTRL)
> 48 DDR Urgent Control (DDR_URGENT_CTRL)
> 4C FTM Global Load Control (FLXTIM_CTRL)
> 50 FTM LDOK Status (FLXTIM_STAT)
> 54 Top CMU Status (CMU_STAT)
> 58 Accelerator NoC No Pending Trans Status (NOC_NOPEND_TRANS)
> 90 SerDes RD/WD Toggle Control (PCIE_TOGGLE)
> 94 SerDes Toggle Done Status (PCIE_TOGGLEDONE_STAT)
> E0 Generic Control 0 (GENCTRL0)
> E4 Generic Control 1 (GENCTRL1)
> F0 Generic Status 0 (GENSTAT0)
> FC Cortex-M7 AXI Parity Error and AHBP Gasket Error Alarm (CM7_AXI_AHBP_GASKET_ERROR_ALARM)
> 
> Starting from 4007C800
> 
> 4  GPR01 Register (GPR01)
> 30 GPR12 Register (GPR12)
> 58 GPR22 Register (GPR22)
> 70 GPR28 Register (GPR28)
> 74 GPR29 Register (GPR29)
> 
> Starting from 4007CB00
> 
> 4 WKUP Pad Pullup/Pulldown Select (WKUP_PUS)
> 
> Dan Carpenter (3):
>   net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
>   dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
>   dts: s32g: Add GPR syscon region

It looks like patch 3/3 depends on 1/3 but it should land in a different
tree, as patches 1 && 2 looks suitable for 'net-next' and 3/3 should
probably go via the arm/freescale tree.

We either need explicit ack from freescale maintainers or this should be
split across subtrees, right?

Thanks,

Paolo


