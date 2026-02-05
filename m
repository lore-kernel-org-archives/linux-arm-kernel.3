Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94BEEC1EA0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 11:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtBNeFmth+hB0BG4YYb6qWCV78JJBEFBO6LnaUUXrtg=; b=d5DqiOKYbs0fy4GVqRI0IY/lgu
	jCsbtxDzEsdy4F3OIxrbaZX3qjX8iShMv0pWnklLjQKEYm1ootk8B+JHNHCzB8K0VwyQC3w1vhp0b
	/TjPtUqSszFMRkEzBlzPpDaQ9FEiksKB8MSdGHCQRfMzrRtba07hPFMK8Z5578MkrGC7iTL59Qg+K
	IyOIpjyKErpE8EOhm0T3eLNZ7j3sl2mQlU7HKg8uuK7/wj8DSViOkel4Li2K+Sbd1XfU2kvoBVQ2q
	iFWYzklG4zOqaSbtv8izVFtUs3NADdXO2zXepdrPPtHqA66zJTgIu7HbhJjjBd//hgP/i3P2W7DX8
	ICgbF08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnxOY-00000009pDb-1Gdy;
	Thu, 05 Feb 2026 11:19:34 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnxOU-00000009pDG-3EeW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 11:19:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gtBNeFmth+hB0BG4YYb6qWCV78JJBEFBO6LnaUUXrtg=;
	b=wezTHypdGHmKi7XbrrQSKmKK4c5Y+Ns8Vkyz2hYgRuGyiPRWe/UdG9Qe6iBEdLegFHMigvfQN
	qMojRzjjc2POrUkSGn4XxrQYf0WlzjGhViRXe+ZPOq2auItgmTxFerdgiX0xOBipiScZyzB1je6
	lC5ta9UXYBRMTczjK696UHk=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4f6F4D4nY6zcZym;
	Thu,  5 Feb 2026 19:14:52 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 3044B40569;
	Thu,  5 Feb 2026 19:19:17 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 5 Feb 2026 19:19:17 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 5 Feb 2026 19:19:16 +0800
Message-ID: <1d7abd11-2064-4437-8ad7-7cfe1b2e75c0@huawei.com>
Date: Thu, 5 Feb 2026 19:19:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, Linus Walleij
	<linus.walleij@linaro.org>, Will Deacon <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, Wei Xu
	<xuwei5@hisilicon.com>, Yushan Wang <wangyushan12@huawei.com>
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com>
 <a8ba1c0b-e7c8-44c5-b785-42752f7f5d8f@app.fastmail.com>
 <e59c7556-d001-4a34-8db3-127dc25f3897@kernel.org>
Content-Language: en-US
From: wangyushan <wangyushan12@huawei.com>
In-Reply-To: <e59c7556-d001-4a34-8db3-127dc25f3897@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_031931_427665_47189686 
X-CRM114-Status: GOOD (  18.17  )
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


On 2/5/2026 5:37 PM, Krzysztof Kozlowski wrote:
> On 03/02/2026 18:19, Arnd Bergmann wrote:
>> On Tue, Feb 3, 2026, at 17:18, Yushan Wang wrote:
>>> The driver will create a file of `/dev/hisi_l3c` on init, mmap
>>> operations to it will allocate a memory region that is guaranteed to be
>>> placed in L3 cache.
>>>
>>> The driver also provides unmap() to deallocated the locked memory.
>>>
>>> The driver also provides an ioctl interface for user to get cache lock
>>> information, such as lock restrictions and locked sizes.
>>>
>>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
>>
>> Hi Yushan,
>>
>> Thanks for your submission. Since we are in the last week of
>> the merge window, this is not going to be linux-7.0 material,
>> but I'll have a quick look for now.
>
>
> To be clear - this is a v3 but with removed previous history...
>
> Previous version:
> https://lore.kernel.org/all/20251217102357.1730573-2-wangyushan12@huawei.com/
>
> Or even v4?
>
> https://lore.kernel.org/all/20250122065803.3363926-2-wangyushan12@huawei.com/
>
> Yushan, please start versioning your patches correctly. Use b4 or git
> format-patch -vx

Hi Krzysztof,

Sorry about the confusing versions, the complete history is as below:

Link to v1: https://lore.kernel.org/all/20250107132907.3521574-1-wangyushan12@huawei.com

Link to v2: https://lore.kernel.org/all/20250122065803.3363926-1-wangyushan12@huawei.com/

Link to RFC v1: https://lore.kernel.org/all/20251125080542.3721829-1-wangyushan12@huawei.com/

Link to RFC v2: https://lore.kernel.org/all/20251217102357.1730573-1-wangyushan12@huawei.com/

Link to v1 again (this message): https://lore.kernel.org/all/20260203161843.649417-1-wangyushan12@huawei.com/

>
> Otherwise, please explain us how can we compare it with `b4 diff` with
> previous version?
>
> Sending something AGAIN as v1 ignoring entire previous submission is
> clear no go. Like you are trying till it succeeds. Negative review?
> Let's try from v1 this time...
>
> This is not correct and it should not be my task to find your previous
> discussions and decipher this v1.

I did spin 2 versions to mainline as the actual v1, the thread was quiet.
Then I made a major refactor to it and sent it as RFC, the thread went
quiet again but some compile check issues popped up. I spinned 2
versions of RFC for the compile issues and removed RFC in this version
since no strong objection showed up.

Apologize that I broke the rules and any inconvenience caused by it.
As there's little discussion in previous patches, is it OK that we start
here as v1?

Anyway I will include the whole history in the coverletter to prevent
more confusion.

>
>
> Best regards,
> Krzysztof
>

Thanks,
Yushan



