Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEB5C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZsYXdUJxDqqAruGjKI1G6QK33eagQBI2kBAS/U2H9E=; b=0tGFM1NWeiJoVlljCPeKZnfwR4
	NefkVRPLGsZivIY6Iqx4ELTQc+FE/TNZCK+TBOfh/pwPBcnXAwQJi4CEStYGq0GJs/WdO3ScmCden
	ezXimeQnmEKHRwkYSXg9rQclBZ53ZsN+QfLg82sk7+bZ3t2IgYFh4lk/HXfSZdC9s/7IgDtalRraf
	N7dJy14HtNpNexvjICC8H7i3spX9yOA1oVwjma3f2gjfj6NC/9+2PjnsJJ0yj+vhr9sxdIp/VNrq3
	2x5ozGh845lnsT8lB012MksekDQNhnKlYChH9DN9p/tWUgNy1xWUqjcv6oG38HlIUIa02xR8/iCYS
	4PQ7byIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnmw-0000000EDhu-2JiB;
	Thu, 12 Jun 2025 19:40:38 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhht-0000000DKz0-2bL1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:11:03 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55CDA0Z32925702;
	Thu, 12 Jun 2025 08:10:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749733800;
	bh=SZsYXdUJxDqqAruGjKI1G6QK33eagQBI2kBAS/U2H9E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=R49oWCXaLeCfto2fyhcX2Jk6U0KZNdPtDpKrvGWbubbskG+aLLBqLbREwF7QbmKcd
	 7OYm7RcUMzTCdwG00Bsk6z945Ucq/sEKFUXc0NzL6jS8KN0MCl2uGmQYws+UoISeqp
	 Dz5eCdTo+xIsSS7Ve7zKvmFGNXi+y3yACikjK5pk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55CDA0Q91974279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 08:10:00 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 08:09:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 08:09:59 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55CD9xgi2202130;
	Thu, 12 Jun 2025 08:09:59 -0500
Message-ID: <ef6d6315-6517-4c8b-bf76-e41bb72bae8d@ti.com>
Date: Thu, 12 Jun 2025 08:09:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm: omap2plus_defconfig: Enable TPS65219
 regulator
To: Andreas Kemnade <andreas@kemnade.info>
CC: Kory Maincent <kory.maincent@bootlin.com>,
        Tony Lindgren
	<tony@atomide.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen
	<aaro.koskinen@iki.fi>,
        Kevin Hilman <khilman@baylibre.com>,
        Roger Quadros
	<rogerq@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Bajjuri Praneeth
	<praneeth@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-5-5278026b7498@bootlin.com>
 <1d87fa3b-c3b9-44fd-9e61-7f1ffadcfb0c@ti.com> <20250612081255.255be21e@akair>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250612081255.255be21e@akair>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061101_804201_5D6BE75F 
X-CRM114-Status: GOOD (  20.06  )
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

On 6/12/25 1:12 AM, Andreas Kemnade wrote:
> Am Wed, 11 Jun 2025 16:13:05 -0500
> schrieb Andrew Davis <afd@ti.com>:
> 
>> On 6/9/25 10:43 AM, Kory Maincent wrote:
>>> Enable the TPS65219 regulator in the defconfig, as the TPS65214
>>> variant is used by the newly introduced BeagleBoard Green Eco board.
>>>
>>> Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
>>> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
>>> ---
>>>    arch/arm/configs/omap2plus_defconfig | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
>>> index 9f9780c8e62a..2ad669f7b202 100644
>>> --- a/arch/arm/configs/omap2plus_defconfig
>>> +++ b/arch/arm/configs/omap2plus_defconfig
>>
>> Why omap2plus_defconfig? OMAP3 and newer are all ARMv7 and
>> boards with those can/should use multi_v7_defconfig.
>>
> if there are enough drivers enabled there, it would work, but it is not.
> So there need to be a bunch of patches to add the missing stuff.
> omap2plus_defconfig is there and support for boards are added.
> 

Yes multi_v7 is still missing stuff for some boards we want to
support, and we are working on adding those needed modules now.

We won't get feature parity in multi_v7 if we keep adding new
boards to the old omap2plus_defconfig. For this patch series
how about we add support to both defconfigs?

> So I think until multi_v7_defconfig is really usable for OMAP3+, we
> should stick with the name omap2plus_defconfig and add stuff.
> If we rename omap2plus_defconfig to omap2_defconfig, we should imho
> disable OMAP3/4/5 there to avoid confusion.
> 

Yes, that was part of the plan, right now these SoCs are enabled
in both configs, so new boards often get enabled in one or the other
but rarely both.

Andrew

> Regards,
> Andreas

