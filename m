Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC558CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 01:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZvrpE+UCMWuW/cWov2L5qNAmDeOn4P8WPzJ2s8dPcc=; b=dwEc+zThaD6pa+jdqLnI/wtc8W
	+NrVQuRS1BoNoSobLcWT2Oa+uCrbPOhJn0x90R25XhZM+F3lyNn/RqRDnCUWgoDnVXirnbdzfKEKG
	NkmSI7JQh44z/DctjcdiDNdVI9HS85YnMEJhR92wt7KJcvxxQpcWQjHe5gygMwIigUS8Qwg4GR1HR
	9LU3vRVNeGJB67JQ2AkJ7uE+UhXrQRQVu8W+9QrTqgqeVWElq+AbiiKpGfcOYz2SKiLdWQKwc+di5
	ll1wAaLFdFKI14/iCl6Ou0un9blzlRoWnkwIkQSc+8NPF8ErD69vKCGqcFWy6ZZE0TAiw4+MKx3aF
	D65lkP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDu7P-0000000HT1Y-166M;
	Tue, 06 Oct 2026 01:37:23 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDu7M-0000000HT0m-36oA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 01:37:21 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3a7bf792424so1464713a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 18:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791250638; x=1791855438; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZvrpE+UCMWuW/cWov2L5qNAmDeOn4P8WPzJ2s8dPcc=;
        b=hU0mqpki/iCCw8lrpavRN2VHhREbwoUHAnlxiYxFChgMQABlpMrfPV0BGu7fUMbsOS
         QWixYb3FWmjSWTvuTdonrQeMPcqVc79YoZU+lNhVNAMndYDnOoZNrwv4/ctnqi627x/Y
         ckk6T3EIifXGM6vOMXSOXsa9K1WddrtJXHGyq65D3ddPKKyF/5H6LAKmjTBXzI/DTyMD
         R/BPOgTBveFwufgyTv+j0jp6c5ejC5kAjigb3PqqSl7C/um9OMNjas2jyAaz0SnA1I8M
         O44j7Xzyeva3tSSYSQ6OV/V+ct2J7KC2jstkgN8KGmd9nK8Wpaq2Z3j1tsnClasSOCMN
         2zuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791250638; x=1791855438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZvrpE+UCMWuW/cWov2L5qNAmDeOn4P8WPzJ2s8dPcc=;
        b=iaHsySrnaQTuV+uyMmz9s/PpepZxFHPf5g3Y6B/0Pc/83sfyQQtLM+/6m04nzjHpcw
         +3AYWmlHAxsMW59Uh9m1Pt3NDa0x1ahG4w0YZWEFVDP2qu4Vo/fTw4VlZPcrwK8H2eQV
         Aotwgag/AUEEs9lkcRfSM7thVUOtZ5qssfBkedUwWWR30BIVatGJgm647sIvNWX6rytZ
         vNeWXHwQCzG81EgkLdgIK8ikV2pSbXlMchxMD1qLyKuBWAO+RuTytni0Gos44hgQ0PG+
         ccUdedVVclFRfmnrz5C9k13WB1YWHVhz7jnLkusOBysSfM29tGmlDhxFfQ64z19Y9KF/
         f88Q==
X-Forwarded-Encrypted: i=1; AKwUvBwAfwpxjCb5CLk7Hqp+QG74fgMUM0haGK15d++XoRPlv94CWt20Ib+CGk8nL4nAm0D6SmufOjOq2wkxjuUCCmqN@lists.infradead.org
X-Gm-Message-State: AFq9FYJZZvn210QYpYy5A3IjCiPv1HEXC2mgW0uwuBtdU32YjiQghfeL
	9UEfbrty4JiahzOXmLO9C3MhLbT/r3jXUT7OGR5deqF/jtTv1OMxcHBs
X-Gm-Gg: AYBFou1ts94dSs4j7APsfjJlo6a4r37fjize/zipNylsdtk5TKZTN/Vgys9GAcIHhuR
	/jwjufjsfPgzox52+1RN+aita+HjCpryW1s5vO1iT4l6ivhr5qsQ18lagSMNaUL6im7iKAuB/+4
	pA1xeU2v9fKqYKbqM1plUZ5UiWmXEOdENpykCnw0cbBcAM3pBDDlePWWllLOjyJ9lcac0KzxPv+
	i34MgaAQ3vgiHmMWZrTWDhQaGuGBfzrx4mOifnlKRocUgZ3HBkTHQTNHG4wSNl1KM9fJhOTgsXc
	ReJisFQXO2ecVyNK+gJCvwvp72oLSdexRKllBTmC2yHSxdG9V6Lj2f08I+ZSSdpzYE+K2Hslmme
	7r+ZfGF99Tkh7mrF+b9p7yDBwrZgrQlhfvTd06KJ4K1cRSAykUONWUifV13xq4Pq106sNAeCwEe
	gIjQ+2lBmGLbwF2cipqLbaRgB/D8e9wYLTRThoyoqK9Y0/KL9ntYjZ6oxlPRI2dfD4GhZ/vNQ4W
	iefbxg2NDzDAUBlsNmzYOZRIx6j57WolQeZI63yghCfG8+AxmyLmoE=
X-Received: by 2002:a17:90b:4d0d:b0:3a7:ecab:c4d3 with SMTP id 98e67ed59e1d1-3a7ecabcdc5mr4934553a91.23.1791250638290;
        Mon, 05 Oct 2026 18:37:18 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm2081598a91.13.2026.10.05.18.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 18:37:17 -0700 (PDT)
Message-ID: <ab91b558-e7e6-4758-b4e3-66e5db75b790@gmail.com>
Date: Tue, 6 Oct 2026 09:37:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port
 with OTG support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-4-a0987203069@gmail.com> <asN29Gi71MIA-2fq@parshuram>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <asN29Gi71MIA-2fq@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_183720_816119_DDEF8AFF 
X-CRM114-Status: GOOD (  20.46  )
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


Vinod Koul 於 2026/10/5 下午 06:07 寫道:
> On 29-09-26, 10:08, Joey Lu wrote:
>> PHY0 and PHY1 use the same power-on/reset sequence in USBPMISCR, with
>> PHY1 control bits shifted 16 positions relative to PHY0.  A separate
>> driver for PHY1 would duplicate this logic, so the existing driver is
>> extended to manage both ports.
>>
>> The original driver polled only DEVCKSTB after releasing PHY0 from
>> reset.  When USB0 operates in host mode (USB ID pin floating or tied
>> high) only HSTCKSTB and CK12MSTB assert; DEVCKSTB never sets.  Polling
>> exclusively for DEVCKSTB in host mode causes a 1 ms timeout on every
>> phy_init() call from the EHCI driver.  The init callback is changed to
>> accept either host-mode or device-mode clock stability, whichever
>> asserts first.
>>
>> The power_on and power_off callbacks are replaced by a single init
>> callback that handles PHY reset and clock-stable polling, because
>> there is no PHY-specific clock gate on MA35D1; the PHY analog block
>> derives its reference from the HXT crystal.
>>
>> A read-only USB role switch is registered for PHY0 to expose the USB0
>> role to userspace via the standard role-switch sysfs interface.  The
>> .set callback returns -EOPNOTSUPP because the hardware mux is fully
>> automatic with no software override path.  When CONFIG_USB_ROLE_SWITCH
>> is not enabled, the registration returns -ENODEV and the driver skips
>> the role switch gracefully without failing probe.
>>
>> Two new optional device-tree properties are implemented:
>>    - nuvoton,rcalcode: writes per-port 4-bit resistor calibration trim
>>      codes to the RCALCODE field in USBPMISCR.
>>    - nuvoton,oc-active-high: sets the UHOVRCURH bit in MISCFCR0 to treat
>>      the over-current detect input as active-high.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/phy/nuvoton/phy-ma35d1-usb2.c | 286 +++++++++++++++++++-------
>>   1 file changed, 211 insertions(+), 75 deletions(-)
>>
>> diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> index 9a459b700ed4..547c7d55d8ff 100644
>> --- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> +++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> @@ -1,11 +1,16 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   /*
>> - * Copyright (C) 2024 Nuvoton Technology Corp.
>> + * Nuvoton MA35D1 USB 2.0 PHY driver
>> + *
>> + * Supports PHY0 (USB0 OTG port, shared between DWC2 gadget and EHCI0/OHCI0)
>> + * and PHY1 (USB1 host-only port, used by EHCI1/OHCI1). The hardware mux on
>> + * PHY0 switches automatically via the USB ID pin.
>> + *
>> + * Copyright (C) 2026 Nuvoton Technology Corp.
> Not correct, this should be updated to 2024-2026, you dont drop the
> copyright notices, you update them!
Agreed, will fix in v7 to preserve the original 2024 date and reflect 
this series' changes.
>>    */
>>   #include <linux/bitfield.h>
>>   #include <linux/clk.h>
>>   #include <linux/delay.h>
>> -#include <linux/io.h>
> why is this dropped?
This driver never did direct MMIO access (no readl()/writel()/ioremap()/
__iomem), even before this series - all register access goes through
regmap via syscon_regmap_lookup_by_phandle(). So linux/io.h was an
unused include already, and it's dropped here as part of the broader
rewrite touching this include block. Happy to keep it if you'd prefer
not to bundle unrelated include cleanup into this series.

Thanks for the review.

BR,
Joey

