Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB309C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQOBEpOmo/uOaXGxG+Mjsq1EExMqwVoc7fNvsKF+UVE=; b=y4xgJ+oeaBnkAwqiO3G874yq6L
	bWIscAcEAy7yYePoqWnozL2BlvupjkX5BC/T0RikraKuUole6SUTAjiAXgvvbTjWHPKgDPlEKzepr
	iPpetbj6FAR2/ka1AgBKQwGoKABkzxymjAsiM02/VE8gxPZsi8A0i46WaXGM225BmZAnILxUS7BBS
	z2cmhRL7U2iPYRk+odVNqEIiEWvAnG+m/1Gagyz5lZha3eKH2gdgL+sKp+eczM0xpFeLQKtxH0iWx
	1AxVWP56OpD8wZhmqN1Wox7kT2kuhbiDLNIfErmN8Is2k+zyeZaBU/3fqrW5ojBuVDZXFm1maERnB
	1nm+vUSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrmo-0000000Gk22-1osL;
	Tue, 25 Feb 2025 10:03:34 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrSc-0000000Gew7-3jH5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:42:45 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51P9gZKL1191019
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 03:42:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740476555;
	bh=DQOBEpOmo/uOaXGxG+Mjsq1EExMqwVoc7fNvsKF+UVE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cQaedq5Urlpaa5FzI3jSwV2H49PpiFpi3LaPuCVh6wmWEqNborRzJwzmA7VVEUPr5
	 LXxy33DvSVxw2asWsHoxaAxxP2/i6uKtKY7dK6so5SeNIgn/wE7Xy8MKN9QQ8vyliC
	 ZB/JsJFn2yoSqdSfzzdsyqLWWOLrwvO1y1lvyOnQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51P9gZ3r013415
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Feb 2025 03:42:35 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Feb 2025 03:42:34 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Feb 2025 03:42:34 -0600
Received: from [172.24.26.121] (lt9560gk3.dhcp.ti.com [172.24.26.121])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51P9gTA9106909;
	Tue, 25 Feb 2025 03:42:30 -0600
Message-ID: <85a366e8-5136-4b0f-914f-95d36658840e@ti.com>
Date: Tue, 25 Feb 2025 15:12:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] Fixes for perout configuration in IEP driver
To: Jakub Kicinski <kuba@kernel.org>
CC: Jacob Keller <jacob.e.keller@intel.com>, <lokeshvutla@ti.com>,
        <vigneshr@ti.com>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <horms@kernel.org>, <pabeni@redhat.com>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250219062701.995955-1-m-malladi@ti.com>
 <415f755d-18a6-4c81-a1a7-b75d54a5886a@intel.com>
 <20250220172410.025b96d6@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20250220172410.025b96d6@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_014243_136474_827A24E9 
X-CRM114-Status: GOOD (  15.29  )
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



On 2/21/2025 6:54 AM, Jakub Kicinski wrote:
> On Wed, 19 Feb 2025 15:37:16 -0800 Jacob Keller wrote:
>> On 2/18/2025 10:26 PM, Meghana Malladi wrote:
>>> IEP driver supports both pps and perout signal generation using testptp
>>> application. Currently the driver is missing to incorporate the perout
>>> signal configuration. This series introduces fixes in the driver to
>>> configure perout signal based on the arguments passed by the perout
>>> request.
>>>    
>>
>> This could be interpreted as a feature implementation rather than a fix.
>>
>> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> 
> Agreed, ideally we should get a patch for net which rejects
> all currently (as in - in Linus's tree) unsupported settings.
> That would be a fix.
> 
> Then once that's merged add support for the new settings in net-next.
> 
> Hope that makes sense?

I do agree that this can be interpreted as a feature implementation (as 
the bug here is: missing perout driver implementation for which the 
driver claims it supports). I will post the updated patch series as 
suggested by Jakub.

Thanks,
Meghana Malladi.


