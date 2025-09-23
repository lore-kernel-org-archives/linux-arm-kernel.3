Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADCFCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 04:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbwILMP9S/7uCH7Ly9mb9Ufcp+AGOzkLITV7WrkX2FI=; b=nHsC2E3fxsHrSK807Ea+3tv4Ac
	A1S0xM7cuY6EMc7rRBpKngPvvjaVHo4HxXgLI5LhK8r40fxSNONOz1thITbksuW+DEAZSRlVo9sKx
	IimHFh8wHpjB+8W5Kk7Xa6VTYFUOzWt075wp9OL15HzPMXp4txUhSgaV2rNPLVCToqfXRJ4y60fck
	TZ9eOnjpUIxXBYjDKRrrYomnYq3q71VqwqBLKJ9qz+1Wf9r7KiUDtLdDWKt3HcAsCcUqtsX1ZVdJn
	tV+7OH8PplroVMTimvf6ETyGcRMauBa4AOvYx0D0ipGpxk8FtqJlxJbJblw0AzRzFu4y3q+8PaXko
	Ahg6PxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0uME-0000000CIkh-3MEh;
	Tue, 23 Sep 2025 04:10:26 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0uMC-0000000CIjp-27gD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 04:10:26 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4cW5x869rMzddRl;
	Tue, 23 Sep 2025 12:05:32 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 178EE147E9C;
	Tue, 23 Sep 2025 12:10:11 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.108.232) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 23 Sep 2025 12:10:09 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>, <akpm@linux-foundation.org>, <david@redhat.com>,
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<linmiaohe@huawei.com>, <nao.horiguchi@gmail.com>,
	<rmk+kernel@armlinux.org.uk>, <ardb@kernel.org>, <nathan@kernel.org>,
	<ebiggers@kernel.org>, <arnd@arndb.de>, <rostedt@goodmis.org>,
	<kees@kernel.org>, <dave@vasilevsky.ca>, <peterz@infradead.org>
CC: <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <liaohua4@huawei.com>,
	<lilinjie8@huawei.com>, <xieyuanbin1@huawei.com>
Subject: Re: [RFC PATCH 1/2] ARM: mm: support memory-failure
Date: Tue, 23 Sep 2025 12:10:05 +0800
Message-ID: <20250923041005.9831-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <9c0cd24c-559b-4550-9fc8-5dc4bcc20bf7@app.fastmail.com>
References: <9c0cd24c-559b-4550-9fc8-5dc4bcc20bf7@app.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.108.232]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_211024_860658_E6237808 
X-CRM114-Status: GOOD (  33.59  )
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

Arnd Bergmann wrote:
>>> It would be helpful to be more specific about what you
>>> want to do with this.
>>> 
>>> Are you working on a driver that would actually make use of
>>> the exported interface?
>>
>> Thanks for your reply.
>>
>> Yes, In fact, we have developed a hardware component to detect DDR bit
>> transitions (software does not sense the detection behavior). Once a bit
>> transition is detected, an interrupt is reported to the CPU.
>>
>> On the software side, we have developed a driver module ko to register
>> the interrupt callback to perform soft page offline to the corresponding
>> physical pages.
>>
>> In fact, we will export `soft_offline_page` for ko to use (we can ensure
>> that it is not called in the interrupt context), but I have looked at the
>> code and found that `memory_failure_queue` and `memory_failure` can also
>> be used, which are already exported.
>
> Ok
>
>>> I see only a very small number of
>>> drivers that call memory_failure(), and none of them are
>>> usable on Arm.
>>
>> I think that not all drivers are in the open source kernel code.
>> As far as I know, there should be similar third-party drivers in other
>> architectures that use memory-failure functions, like x86 or arm64.
>> I am not a specialist in drivers, so if I have made any mistakes,
>> please correct me.
>
> I'm not familiar with the memory-failure support, but this sounds
> like something that is usually done with a drivers/edac/ driver.
> There are many SoC specific drivers, including for 32-bit Arm
> SoCs.
>
> Have you considered adding an EDAC driver first? I don't know
> how the other platforms that have EDAC drivers handle failures,
> but I would assume that either that subsystem already contains
> functionality for taking pages offline,

I'm very sorry, I tried my best to do this,
but it seems impossible to achieve.
I am a kernel developer rathder than a driver developer. I have tried to
communicate with driver developers, but open source is very difficult due
to the involvement of proprietary hardware and algorithms.

> or this is something
> that should be done in a way that works for all of them without
> requiring an extra driver.

Yes, I think that the memory-failure feature should not be associated with
specific architectures or drivers.

I have read the memory-failure's doc and code,
and found the following features, which are user useable,
are not associated with specific drivers:

1. `/sys/devices/system/memory/soft_offline_page`:
see https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-memory-page-offline

This interface only exists when CONFIG_MEMORY_HOTPLUG is enabled, but
ARM cannot enable it.
However, I have read the code and believe that it should not require a
lot of effort to decouple these two, allowing the interface to exist
even if mem-hotplug is disabled.

2. The syscall madvise with `MADV_SOFT_OFFLINE/MADV_HWPOISON` flags:

According to the documentation, this interface is currently only used for
testing. However, if the user program can map the specified physical
address, it can actually be used for memory-failure.

3. The CONFIG_HWPOISON_INJECT which depends on CONFIG_MEMORY_FAILURE:
see https://docs.kernel.org/mm/hwpoison.html

It seems to allow input of physical addresses and trigger memory-failure,
but according to the doc, it seems to be used only for testing.


Additionally, I noticed that in the memory-failure doc
https://docs.kernel.org/mm/hwpoison.html, it mentions that
"The main target right now is KVM guests, but it works for all kinds of
applications." This seems to confirm my speculation that the
memory-failure feature should not be associated with specific
architectures or drivers.

Xie Yuanbin

