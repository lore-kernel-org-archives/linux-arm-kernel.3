Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0CFC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 06:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9GlTDbw/VGq+mpBKGBMYd7sWUnu8ZpsWmTLspYzU0Y=; b=Af1y16cCvvwnuVM+kRLe1psrXo
	BF5eFS+0wO94brtHtgaSud7EMpC5ISoLUVHSOx/wNr2HfceHylxLQsbCz+vy/KKZ0WZQ6+BhcqvBD
	EQJlH2CcHtzbCLBlvoPhkTB7W+Jy7mczhtyDg5H+2TaorKDtsgNKHbMVpyvDa0lBYEbN0NhD92gEv
	NDBrKI8APSZ8D9XpWDi0HREahgBjjMd4/zccuk+J1T204zm/99GQV2ligVBjA5GG4yLlkI18DbUxe
	vlcNlmxgXmIiC/re3X4mOFDYDe1zqwOdyNOBJmwLTUB66qTHMq6pNXpdc2Ii3haxVvZ56Uagd3D4B
	/lUOT9rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty2yX-0000000ChPR-2Fjl;
	Fri, 28 Mar 2025 06:13:53 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty2wn-0000000ChDE-1axO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 06:12:06 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52S6BYoe2633129
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 01:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743142294;
	bh=j9GlTDbw/VGq+mpBKGBMYd7sWUnu8ZpsWmTLspYzU0Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=F96GF6DWBTDVRcJr5ixE81enuTD2bJKxrQu9uNtWNPBV7AgpX9CO3KIUOPMXzEI5L
	 Lc97WzllLq+PDeRMCBOWJA4F2D3iYaPQ+OWgVWlYAJvedPD6iUPcsqsuJHBxncnFev
	 HM6+I7RdJQclCjZdiN6ispcVwO9VFNUYRKGaAhD0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52S6BYt7024519
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Mar 2025 01:11:34 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 01:11:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 01:11:34 -0500
Received: from [10.249.140.156] ([10.249.140.156])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52S6BQTf038705;
	Fri, 28 Mar 2025 01:11:27 -0500
Message-ID: <d1abf39d-c452-4bf1-ab40-2fc1ebca6ff7@ti.com>
Date: Fri, 28 Mar 2025 11:41:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/3] Bug fixes from XDP and perout series
To: Jakub Kicinski <kuba@kernel.org>
CC: <pabeni@redhat.com>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kory.maincent@bootlin.com>,
        <dan.carpenter@linaro.org>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <jacob.e.keller@intel.com>,
        <horms@kernel.org>, <john.fastabend@gmail.com>, <hawk@kernel.org>,
        <daniel@iogearbox.net>, <ast@kernel.org>, <srk@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Roger
 Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250321081313.37112-1-m-malladi@ti.com>
 <20250325104458.3363fb5d@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20250325104458.3363fb5d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_231205_542339_41D8133E 
X-CRM114-Status: GOOD (  11.32  )
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


On 3/25/2025 11:14 PM, Jakub Kicinski wrote:
> On Fri, 21 Mar 2025 13:43:10 +0530 Meghana Malladi wrote:
>> This patch series consists of bug fixes from the features which recently
>> got merged into net-next, and haven't been merged to net tree yet.
>>
>> Patch 2/3 and 3/3 are bug fixes reported by Dan Carpenter
>> <dan.carpenter@linaro.org> using Smatch static checker.
> 
> Could you perhaps add the customary
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> tags, then?
> 
> Please also link to the reports.

Sure, I will add them and post to the v3 to net.

