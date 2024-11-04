Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8998D132B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lCZg7hiaSBMwhl2ZVyK4acZDVshxBaN2CgueTXDG1A=; b=WDzUQnUDlsBzXvIHdILC6+nE2r
	fz6ZgTDwZd5IRS3n514hjxCCD7RkqjA4G9eoU0v6pcN1AOi8oZ1uklUjtKNvOnugrmbJ93UO1CXGz
	4GE/e/LuBHfSH6z80igvuu1TXaxCTdTARCn+Rx+NC+bEltJWAP8aE6OTCoyCzx5AkjC+BIF7fLpbN
	708C9A2VcNjKC1YOblrcCzkZCMrWtqH3/FDbqqWeCe/gnKAhD5RERTj1LILZBlNlZkqoim5ThbxTZ
	ps8afP/znz7e38ZfvZv9vZj9SOLesIzWUKqE+i+KqxJgjv7JrIUQd8chYTexKBdc8Sp6BEpn9lYUz
	oceQmXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vMq-0000000DYGE-0abj;
	Mon, 04 Nov 2024 11:35:32 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vDk-0000000DVdM-3qc6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 11:26:10 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A4BPq8f093248;
	Mon, 4 Nov 2024 05:25:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730719553;
	bh=8lCZg7hiaSBMwhl2ZVyK4acZDVshxBaN2CgueTXDG1A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OOQDsTLKapMaRRAeD7RUmMELnmCCHYSMumW68hUPhZxX2zSeSjccYHOZQPUATj8Rf
	 HIZjveUwV4hCmk5WA6iGLvqSb9MHWLrAdE7yByiAfsg5dojK0cHMNsXznECXV2SqxF
	 mquhJziAPs1Sph8dmPnV0I/ivn06gjT04wz92nGU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A4BPq8K020829;
	Mon, 4 Nov 2024 05:25:52 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Nov 2024 05:25:52 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Nov 2024 05:25:52 -0600
Received: from [10.249.139.24] ([10.249.139.24])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A4BPk51046583;
	Mon, 4 Nov 2024 05:25:47 -0600
Message-ID: <7c3318f4-a2d4-4cbf-8a93-33c6a8afd6c4@ti.com>
Date: Mon, 4 Nov 2024 16:55:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: ti: icssg-prueth: Fix 1 PPS sync
To: Jakub Kicinski <kuba@kernel.org>
CC: <vigneshr@ti.com>, <grygorii.strashko@ti.com>, <horms@kernel.org>,
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
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20241031185905.610c982f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_032609_080269_D80FFD06 
X-CRM114-Status: GOOD (  13.50  )
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



On 11/1/2024 7:29 AM, Jakub Kicinski wrote:
> On Mon, 28 Oct 2024 16:40:52 +0530 Meghana Malladi wrote:
>> The first PPS latch time needs to be calculated by the driver
>> (in rounded off seconds) and configured as the start time
>> offset for the cycle. After synchronizing two PTP clocks
>> running as master/slave, missing this would cause master
>> and slave to start immediately with some milliseconds
>> drift which causes the PPS signal to never synchronize with
>> the PTP master.
> 
> You're reading a 64b value in chunks, is it not possible that it'd wrap
> in between reads? This can be usually detected by reading high twice and
> making sure it didn't change.
> 
> Please fix or explain in the commit message why this is not a problem..
Yes I agree that there might be a wrap if the read isn't atomic. As 
suggested by Andrew I am currently not using custom read where I can 
implement the logic you suggested (reading high twice and making sure if 
didn't change). Can you share me some references where this logic is 
implemented in the kernel, so I can directly use that instead of writing 
custom functions.

Regards,
Meghana.


