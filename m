Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA25CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdcQq0ODeLvFcyZ8c1y1bdz85c9KQB/TPqgiMZRTnJo=; b=nKoWS2C3szEYDEYX6V8R3MrLx0
	beaJvaSowU4t8j6t/DCV45fILki3HUIuQm9WL7W7YN79vaExuC13k0qsppjju/KDCnw8NvRl4fcXg
	cehTnjBLnOVDj8K47ENdS4qauyRudunUJ9CDrWAez8VhLG7uD3rAZNNK9Wzt2mrjg9QBx+6zN7VMN
	JJZou7T9UCpcdvOkGZFS3jmsM+BUX/fW3+NBfJrBosxySsNpBTcJC0kUycrZ5Qexx80HoYXSQ++0k
	qTlgMEgs94g+v2kHJlkREqhuLBv/Q78hfen6NxL5UxIMdZeP9uGhHY61L2QkFg+R4Aedp9VUa8haR
	hc4s3KLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Ef-0000000HM1C-0rZr;
	Thu, 21 Aug 2025 15:29:53 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2qq-0000000Gewn-33jX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:49:02 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LAmFE23352350;
	Thu, 21 Aug 2025 05:48:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755773295;
	bh=ZdcQq0ODeLvFcyZ8c1y1bdz85c9KQB/TPqgiMZRTnJo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kvtVQWY40B45uP1NmaZBuN+EuM78tEdP7xLQ47B+vp4LKGI78Io5SaBPkCqJ+Z+wV
	 W8nk7I5i+I3rRLA8ddtPkKMkx9rO/yrAOGXKsHUHmjnGXGEX2mXXHw6gFAdzq63b5a
	 +RcjA8x5Rb48WrKrmNNPxDoweF4ily0EFQPOIJTE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LAmFl81899798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 21 Aug 2025 05:48:15 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 05:48:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 05:48:14 -0500
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LAm7OG2038086;
	Thu, 21 Aug 2025 05:48:08 -0500
Message-ID: <d2015724-416b-4222-aa85-88c0c5f9160c@ti.com>
Date: Thu, 21 Aug 2025 16:18:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/6] net: ti: icssg-prueth: Add AF_XDP zero copy
 for RX
To: Jakub Kicinski <kuba@kernel.org>
CC: <namcao@linutronix.de>, <jacob.e.keller@intel.com>,
        <christian.koenig@amd.com>, <sumit.semwal@linaro.org>,
        <sdf@fomichev.me>, <john.fastabend@gmail.com>, <hawk@kernel.org>,
        <daniel@iogearbox.net>, <ast@kernel.org>, <pabeni@redhat.com>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
        <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250818112424.3068643-1-m-malladi@ti.com>
 <20250818112424.3068643-6-m-malladi@ti.com>
 <20250819073558.2c996b6d@kernel.org>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <20250819073558.2c996b6d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_034900_974660_49052055 
X-CRM114-Status: GOOD (  21.07  )
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

Hi Jakub,

On 8/19/25 20:05, Jakub Kicinski wrote:
> On Mon, 18 Aug 2025 16:54:23 +0530 Meghana Malladi wrote:
>> @@ -1332,6 +1350,13 @@ static int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
>>   		}
>>   	}
>>   
>> +	if (flags & XDP_WAKEUP_RX) {
>> +		if (!napi_if_scheduled_mark_missed(&emac->napi_rx)) {
>> +			if (likely(napi_schedule_prep(&emac->napi_rx)))
>> +				__napi_schedule(&emac->napi_rx);
>> +		}
>> +	}
>> +
>>   	return 0;
> 
> I suspect this series is generated against old source or there's
> another conflicting series in flight, because git ends up applying
> this chunk to prueth_xsk_pool_disable() :S
> 

That's interesting. I have directly applied these patches locally on the 
tip of net-next (62a2b3502573 "net: openvswitch: Use for_each_cpu() 
where appropriate") And everything gets applied cleanly and I couldn't 
reproduce the issue you mentioned above. Can you tell me on top of which 
commit you tried applying this series ? Or I wonder if this happened 
because I posted this series from my net tree instead of net-next. Does 
it make sense to re-post the same patches from net-next tree ?

> Before you proceed with AF_XDP could you make this driver build under
> COMPILE_TEST on x86? This is very easy to miss, luckily we got an off
> list report but its pure luck. And obviously much more effort for the
> maintainers to investigate than if it was caught by the CI.

I have tried what you have suggested and these are the logs for the 
same: 
https://gist.github.com/MeghanaMalladiTI/8a3f64773d96e58aec48aca78c1bc98c

ICSSG driver as a module has been compiled without any errors but 
encountered few linking errors due to some missing symbols from another 
module (CONFIG_TI_K3_UDMA). I included this module in the next iteration 
and tried compiling but facing some build failures, logs: 
https://gist.github.com/MeghanaMalladiTI/f7ed3958b5ab2b2be479151254015ff0

I think it is safe to assume ICSSG as a driver build on x86 doesn't have 
build regressions, thoughts ? Also is this something which needs to be 
done by us everytime we are posting some feature upstream or does Kernel 
CI take care of it ?


