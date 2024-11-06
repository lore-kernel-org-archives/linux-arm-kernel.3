Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBC8D29F9D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 06:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCQZXkAS/Gp8UlJvk930Ptx2GDYmSbYH65zsCKiP7/U=; b=z3CvLXmHxUQgVmpQATvMlw8A8Q
	0svUVdIO/zILfrVu1hk55YP2HCAtPLmtMWc9g8H2zVMZTOYfCTXAkliI0xU1ut2pqVTgYDKPOfAf3
	e52wsAJ6qUCmEYLJQviUbE5EZPA04LfcjctlzuZtwDnuO0x8bexUt793OC4mjFx6jJfyjl/TeFMjk
	B5iMXUnOIAnjs/qBWAMTGAFypuNSdshdunyTC2DoYUi3DC1uJBH4WLukuuMojNsPYgpaY/Wu5Oqiu
	3AlEVmD5Nx7ka+SEZIQqmwVbm6vbtYGgokGWdjvqbpWqLhwOhQXX4uLOS/T52JiBJDnlzWXGwa1kg
	MZHox/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ZrR-000000022Tm-0lv8;
	Wed, 06 Nov 2024 06:49:49 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Zpj-000000022EW-0hOR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 06:48:04 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A66ljZA101137;
	Wed, 6 Nov 2024 00:47:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730875665;
	bh=fCQZXkAS/Gp8UlJvk930Ptx2GDYmSbYH65zsCKiP7/U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jgCf8X+KbnVPwoZYkCrJjbKjU7lomcVTTxf66Yr7vRmkCGENNVfycSCxXT1yUc+ST
	 NvZt+GCYgIMGxG47fxRCplj3xaMuZsiZiSPofc59ArWpEBr9pHVK3ESw+yvYAEJFBT
	 se28DcGXWZbxfaf/1gm1+9pTwptvKmDAaE7c+LLc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A66ljlM023491
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 00:47:45 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 00:47:45 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 00:47:45 -0600
Received: from [10.249.139.24] ([10.249.139.24])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A66lcBN008344;
	Wed, 6 Nov 2024 00:47:39 -0600
Message-ID: <8ccae9bb-8582-4c08-9dc3-f5608bb69aee@ti.com>
Date: Wed, 6 Nov 2024 12:17:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: ti: icssg-prueth: Fix 1 PPS sync
To: Andrew Lunn <andrew@lunn.ch>
CC: Jakub Kicinski <kuba@kernel.org>, <vigneshr@ti.com>, <horms@kernel.org>,
        <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <pabeni@redhat.com>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>,
        Vadim Fedorenko
	<vadim.fedorenko@linux.dev>
References: <20241028111051.1546143-1-m-malladi@ti.com>
 <20241031185905.610c982f@kernel.org>
 <7c3318f4-a2d4-4cbf-8a93-33c6a8afd6c4@ti.com>
 <20241104185031.0c843951@kernel.org>
 <e5c5c9ba-fca1-4fa3-a416-1fc972ebd258@ti.com>
 <6a230b28-9298-410b-b873-21000af4c0f3@lunn.ch>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <6a230b28-9298-410b-b873-21000af4c0f3@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_224803_305249_6255D25A 
X-CRM114-Status: GOOD (  10.62  )
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



On 11/6/2024 2:30 AM, Andrew Lunn wrote:
>>> I think you need to write a custom one. Example:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/ethernet/meta/fbnic/fbnic_time.c#n40
>> Ok thank you. I will add custom function for this and update the patch.
> 
> Maybe look around and see if they could be reused by other drivers. If
> so, they should be put somewhere central.
> 
> 	Andrew
I have looked into it, and seems like wherever this is getting used it 
is written as a custom function for that driver. Seems like writing our 
own is inevitable.

- Meghana.


