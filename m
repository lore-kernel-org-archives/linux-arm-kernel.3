Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E532EC3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W42cyLUdol+oUsgXG96Kh1xhxA3DvcRncFoVbahX4AI=; b=Ye/1jaoVMLhLc8dPGrrZa0Z5YP
	zU8m4u+DwrJaPl7s32TIwnandA7L9JO8EQKT9qeZOA/U6WKg13YHch6SKHDlW2BPbDFTvO0mibWbo
	vpiElerEMtIv/twQAuveopLpiQLLskq6RU5BjGOr1u9aDeM7qOSj7vkM6VlR/OYyVgzZgNa2/+xhy
	Wmo54K+5if44F/ERhD/dgg/DahsMK4fxEt67hMqECedz7MzRS9g+wld8yCTEuowszPqC9p0EZpcKu
	ZkIy774Y88tq2F3nBHKx5GsB50AIlpAzj3memku3O3eEwm8MKVzuiqS4IDuThYOrNOJGdinK44nrk
	kOCHG1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUaY-0000000DuWU-0cpY;
	Wed, 07 May 2025 02:32:50 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOUZ-0000000DIlw-1Miy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:02:17 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546K1g5v609667
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 15:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746561702;
	bh=W42cyLUdol+oUsgXG96Kh1xhxA3DvcRncFoVbahX4AI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Q0M2fJwzd5R5U8NnigZDb+vyIv7sTySh9pvRo9zOOPOrY+RD2VCW+uYI7OhS/cLfN
	 mgonkL2aoWgrOu14yE5+uitN7t+6zFK1TrMJy01vLJgCSLngNSuSgJkfUQIeQ2TjbI
	 7NdvDzYzQw+bvbmE7FZP8yLrToeByKM9ZT30el2o=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546K1gpr110583
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 15:01:42 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 15:01:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 15:01:41 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546K1fPh040642;
	Tue, 6 May 2025 15:01:41 -0500
Message-ID: <4e014361-65ec-4b6e-839d-bfeb995262c6@ti.com>
Date: Tue, 6 May 2025 15:01:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] PM: TI: AM335x: PM STANDBY fixes
To: Sukrut Bellary <sbellary@baylibre.com>,
        Kevin Hilman
	<khilman@baylibre.com>, Nishanth Menon <nm@ti.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>
CC: Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade
	<andreas@kemnade.info>,
        Roger Quadros <rogerq@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Bajjuri
 Praneeth <praneeth@ti.com>,
        Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu
	<b-liu@ti.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, Russell King
	<linux@armlinux.org.uk>,
        Rob Herring <robh@kernel.org>, Tony Lindgren
	<tony@atomide.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250318230042.3138542-1-sbellary@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_130215_526487_954F5B17 
X-CRM114-Status: GOOD (  15.58  )
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

Hello Sukrut, Keven, Ulf,

On 3/18/25 6:00 PM, Sukrut Bellary wrote:
> This patch series fixes the Power management issues on TI's am335x soc.
> 
> on AM335x, the wakeup doesn't work in the case of STANDBY.
> 
> 1. Since CM3 PM FW [1](ti-v4.1.y) doesn't enable l4ls clockdomain upon
> wakeup, it fails to wakeup the MPU.
> To fix this, don't turn off the l4ls clk domain in the STANDBY transition
> in MPU.
> 
> 2. Also Per AM335x TRM [2](section 8.1.4.3 Power mode), in case of STANDBY,
> PER domain should be ON. So fix PER power domain handling for
> standby. l4ls is a part of the PER domain.
> 
> Since we are not turning off the l4ls clockdomain on STANDBY in MPU,
> PER power domain would remain ON. But still, explicitly handle this
> to be in sync with the STANDBY requirement.
> 
> 3. On am335x evm[1], UART0 - (UART1-HW) has a wakeup capability.
> Set the wakeup-source property in DT for AM335x.
> 
> 4. Enable PM configs for AM335x.
> 
> [1] https://git.ti.com/cgit/processor-firmware/ti-amx3-cm3-pm-firmware/
> [2] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
> [3] https://www.ti.com/tool/TMDXEVM3358
> 
> Test log:
> https://gist.github.com/sukrutb/bdbfd1220fe8578a9decf87d0bac6796
> 

Thanks for the patches, Sukrut.

I was able to test this series on am335x EVM, baseline being rc5 next
branch: https://gist.github.com/jmenti/cda1675b5fc5844b6f065376e98026f5

Tested-by: Judith Mendez <jm@ti.com>

regards,
~ Judith

