Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EDCCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 21:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQKbERiB0ntPOS/R2wMXRwGJAn2HHwIq3s8Tu7uVMO4=; b=aqIkIsgjswp7nwHQ8UYQqkfBbZ
	ttuGg9KnXZmYWB6XergPzhDIraLRTp63IXsn7j1KiVs1czBMOx4pvrMTLY24/5MqvGmDJvKINhHrc
	1qI9ZZL2zjZAxzugvhuL5sgVVBRXHonvCRiCKNAYFWiZfxt10ODjqdV6/MG6+96IwicNtlcZhCaVz
	nP8oPsc/FoHqPknHRUL/KH4HYh3vp6SidIWLJ/GkZlr3mfjCw/n5UChSTWdcY/8bS2uhP4n7Vs/CZ
	C97+4R8+dIgrla2DjObfweU+LEKaqLdb8EQsrolf1IrasWk+hsNPOTeT3o9zJ/hqKOoP6DVBgDYAn
	t4rkGXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX43F-00000006OfY-2hBG;
	Tue, 09 Jun 2026 21:32:01 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX43D-00000006Oeu-2s8X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 21:32:00 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-486621f0adbso4353585b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 14:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781040718; x=1781645518; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQKbERiB0ntPOS/R2wMXRwGJAn2HHwIq3s8Tu7uVMO4=;
        b=zK1iNoMgwSD65V2RIJtDhSoHoV3jTTsi8pZIj0AaFcV2r0mKZYLnR+8VvbmZl8AJvM
         6PBC/uqqH3uvHcoXJ4sqW+3QcTOHuFxne29ifS4+jsFgaP1k5jgNNnFXfcolvik5GZWv
         w2tXzgiZDA5ao7X0UOHimHWaloZHFc9bYsyf6jVDe7YMy08Tya4/GPEznw1Vyy5D5a8L
         tFJ8tHF5Zbypubfmz1A3xf1sHzMJqjLJIPiY1WogNJPtQBDvPSGd0ORkmFNBoy3BzH5+
         IGw4x9iR/+IOnJiBPgoinceitS4VkwRHGAXT9p5W10EITvcRUJRGbVv6NHB5TqgZlkmJ
         EEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781040718; x=1781645518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQKbERiB0ntPOS/R2wMXRwGJAn2HHwIq3s8Tu7uVMO4=;
        b=ez13raxP7NKIp4sOZLLqkVSAwb50WWcplA/vTjJZrL1Qj+so82jATigV3Cd7JxZYrJ
         tBtoRQXK8zlgve8klxKpt9e3bia57ThfQgWaWO+QjRLbh4m2mAA+rh9UJKmIjOJeBYTy
         ydYeIPA2uFyTXN3tzx5BQJsn4ieBNebH7V8zRbBkLMwz4BJGbR7C/oHRpl87ZFpMwNhx
         vawqQr6iogik4/Ra+LSvqMPf0WwlgbgMwdItb5qzJOiqhAmtL9CDAvYwFgyK+PAEXry0
         9gfHfvqrRA7yJWTeGVRYGgPnC2KS7STYo6AtghYNJdkfGJDZTGi9+hs6+OYre00RGAjB
         5O7A==
X-Forwarded-Encrypted: i=1; AFNElJ++RkE/FzJcZUSr0bbNvhsOvZfa3At/E8grmmdp0Sgnj4AKDWnKb3aqNuLApVkPWo1JzMukBHPSSmGj1UXb5V8E@lists.infradead.org
X-Gm-Message-State: AOJu0YyG5RLqtXQGqskAToptEyie8Eej6gDSogvnhf+jvplC9KPYDCmw
	L7kUgJkl2eROCdvOp2D/7R9ooxXSRlBTLuSRDE/0R94iJiKZNyppg20LqHkRco00kPA=
X-Gm-Gg: Acq92OHVXdFL1vt6+iajxidV5VWZ1ff0V6C+TyaRY2/TzR4CMl790TVGLmKdVQXY8XD
	DQKSZXSZoUZ+0jAHFK10mj4of+E1MsGsI+TuGsqfETBd5ClTaiWMPt4j54Y9W6fMX6u3H1Jo5mQ
	2mqnLaBqL3cosD4lzXNbBksrCoUv4BRWLcP+YD1uwLriVqfAxNaoMGfyl6aFQGThu4UbZl1rrfX
	lwrPudnfYe9ZsGHgqojhzBjzRsSatsYhpz8v8iwWEnAaonr4HoZjSvHCz+mMxwmNpQh4iB0H62z
	6ZnK8k4mUmWx2euZu8RkcPylVKqS3O3QQoEO4PUnZ+3Q+WqvYddlfFj6er4hW+EfoFXkJXAHrsE
	AxdfJTMvIppppVatKVq0RdqWmnlVm4E7/mgZx6bERVnQwoAMk1EIcb1OFfIz0C1JJ0EgPtiAJIq
	mgDhx4rO17qP3EGDP6fvd/vrnVofrtCnCEeXVm1ZOJ5Ecz
X-Received: by 2002:a05:6808:4fe2:b0:485:a9b2:5457 with SMTP id 5614622812f47-4868df63ae3mr15052790b6e.35.1781040718541;
        Tue, 09 Jun 2026 14:31:58 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a5a64sm17024127b6e.4.2026.06.09.14.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 14:31:58 -0700 (PDT)
Message-ID: <b89fe088-496f-4281-9d27-7f8b0b3f38cb@riscstar.com>
Date: Tue, 9 Jun 2026 16:31:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 13/14] net: stmmac: tc956x: add TC956x/QPS615
 support
To: Rob Herring <robh@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-14-elder@riscstar.com>
 <20260605144758.GB3659201-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260605144758.GB3659201-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_143159_764572_FC2FE295 
X-CRM114-Status: GOOD (  26.47  )
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

On 6/5/26 9:47 AM, Rob Herring wrote:
> On Thu, Jun 04, 2026 at 08:00:20PM -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> Toshiba TC956x is an Ethernet AVB/TSN bridge and is essentially a
>> small and highly-specialized SoC. TC956x includes an "eMAC" subsystem
>> that can be accessed, along with several other peripherals, via two
>> PCIe endpoint functions. There is a main driver for the endpoint that
>> decomposes things and creates auxiliary bus devices to model the SoC.
>>
>> The eMAC consists of a Designware XGMAC, XPCS and PMA. Each eMAC is
>> supported by an MSIGEN that bridges TC956x level interrupts to PCIe
>> MSIs.
>>
>> Add a driver for the eMAC/MSIGEN combination.
>>
>> Co-developed-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> 
> The order is wrong here unless you worked on it and then Daniel took
> over. Tags should be chronological order.

I think this was a dumb reorder I did to address a complaint
from checkpatch, but in any case I'll fix this.  Yes, my
signoff should "wrap" the others.

>> ---
>>   MAINTAINERS                                   |   2 +
>>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  14 +
>>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
>>   .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 818 ++++++++++++++++++
>>   4 files changed, 836 insertions(+)
>>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0439607d1155f..418537cbefbbb 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -27059,6 +27059,8 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>>   F:	drivers/gpio/gpio-tc956x.c
>>   F:	drivers/misc/tc956x_pci.c
>> +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>> +F:	include/soc/toshiba/tc956x-dwmac.h
>>   
>>   TOSHIBA WMI HOTKEYS DRIVER
>>   M:	Azael Avalos <coproscefalo@gmail.com>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> index e3dd5adda5aca..8d247e033e356 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> @@ -404,6 +404,20 @@ config DWMAC_MOTORCOMM
>>   	  This enables glue driver for Motorcomm DWMAC-based PCI Ethernet
>>   	  controllers. Currently only YT6801 is supported.
>>   
>> +config DWMAC_TC956X
>> +	tristate "Toshiba TC956X DWMAC support"
>> +	depends on PCI
>> +	depends on COMMON_CLK
>> +	depends on TOSHIBA_TC956X_PCI
>> +	default TOSHIBA_TC956X_PCI
>> +	select GENERIC_IRQ_CHIP
>> +	help
>> +	  This selects the Toshiba TC956X (and Qualcomm QPS615) support in the
>> +	  stmmac driver.
>> +
>> +	  This provides support for the ethernet controllers found on these
>> +	  devices.
>> +
>>   config STMMAC_PCI
>>   	tristate "STMMAC PCI bus support"
>>   	depends on PCI
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
>> index a1cea2f57252e..e8e7f95dbe3e8 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
>> @@ -51,4 +51,6 @@ obj-$(CONFIG_STMMAC_PCI)	+= stmmac-pci.o
>>   obj-$(CONFIG_DWMAC_INTEL)	+= dwmac-intel.o
>>   obj-$(CONFIG_DWMAC_LOONGSON)	+= dwmac-loongson.o
>>   obj-$(CONFIG_DWMAC_MOTORCOMM)	+= dwmac-motorcomm.o
>> +obj-$(CONFIG_TC956X_PCI)	+= tc956x-pci.o
>> +obj-$(CONFIG_DWMAC_TC956X)	+= dwmac-tc956x.o
>>   stmmac-pci-objs:= stmmac_pci.o
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>> new file mode 100644
>> index 0000000000000..c77585e4a50e6
>> --- /dev/null
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>> @@ -0,0 +1,818 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>> + *
>> + * Derived from code having the following copyrights:
>> + * Copyright (C) 2011-2012  Vayavya Labs Pvt Ltd
>> + * Copyright (C) 2025 Toshiba Electronic Devices & Storage Corporation
>> + */
>> +
>> +#include <linux/auxiliary_bus.h>
> 
> Based on the block diagram, these are PCI devices. Auxiliary bus is the
> wrong thing to use here.

As I said in the other message, I'm going to rearrange this
to use pci-ep-bus and platform drivers.  Most of the core
code should be stay the same but the overall structure will
change.

Thanks for your suggestions.

					-Alex

> 
> Rob


