Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3E5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 02:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXbpC2OUq6EykTPfMwxZgL6CFOSmfWb76gLbauM1BGs=; b=Q5ITiaAidSfkrbYov95rfBNq2b
	74qZD8o8LM/+oZPB+4ZQJKHHhPoO/TtW13kOdHn8qI1aD9uv8Nr6lTvuOg/0URi7oQTUNuZ+TaWfo
	PlIgx3B46iQGK86BX0/8NW0AIB21WHQ57z4niLuCXClNIB61iYBjT7OiD7qbwiAp8mixMJnYsm01M
	rv859sZYbfB8EkKLEEVt3ZmE6Z1Fte4D7mx48r3EepfZTDKxRISqojvJvjm/jvRy4ekG8OVMZCwE3
	gBAXU/DasjIGXylG5fOk3p/OY/lVpi+nV/YOMhJccm0HovSFuTsK0YTZC36+Vcx/H131vKAzKInGp
	2Pd7dSXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubVit-00000003og7-2bzV;
	Tue, 15 Jul 2025 02:48:51 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubVgR-00000003oVo-46fZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 02:46:21 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bh3Qr2ddqz29drF;
	Tue, 15 Jul 2025 10:43:32 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 24EF31400CB;
	Tue, 15 Jul 2025 10:46:09 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 15 Jul 2025 10:46:06 +0800
Subject: Re: [RESEND PATCH v18 1/2] ACPI: APEI: send SIGBUS to current task if
 synchronous memory error not recovered
To: "Rafael J. Wysocki" <rafael@kernel.org>, Shuai Xue
	<xueshuai@linux.alibaba.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	"Luck, Tony" <tony.luck@intel.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <akpm@linux-foundation.org>,
	<linux-edac@vger.kernel.org>, <x86@kernel.org>, <justin.he@arm.com>,
	<ardb@kernel.org>, <ying.huang@linux.alibaba.com>, <ashish.kalra@amd.com>,
	<baolin.wang@linux.alibaba.com>, <tglx@linutronix.de>,
	<dave.hansen@linux.intel.com>, <lenb@kernel.org>, <hpa@zytor.com>,
	<robert.moore@intel.com>, <lvying6@huawei.com>, <xiexiuqi@huawei.com>,
	<zhuo.song@linux.alibaba.com>, <sudeep.holla@arm.com>,
	<lpieralisi@kernel.org>, <linux-acpi@vger.kernel.org>,
	<yazen.ghannam@amd.com>, <mark.rutland@arm.com>, <mingo@redhat.com>,
	<robin.murphy@arm.com>, <Jonathan.Cameron@huawei.com>, <bp@alien8.de>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<tanxiaofei@huawei.com>, <mawupeng1@huawei.com>, <linmiaohe@huawei.com>,
	<naoya.horiguchi@nec.com>, <james.morse@arm.com>, <tongtiangen@huawei.com>,
	<gregkh@linuxfoundation.org>, <jarkko@kernel.org>
References: <20250404112050.42040-1-xueshuai@linux.alibaba.com>
 <20250404112050.42040-2-xueshuai@linux.alibaba.com>
 <0c0bc332-0323-4e43-a96b-dd5f5957ecc9@huawei.com>
 <709ee8d2-8969-424c-b32b-101c6a8220fb@linux.alibaba.com>
 <353809e7-5373-0d54-6ddb-767bc5af9e5f@huawei.com>
 <653abdd4-46d2-4956-b49c-8f9c309af34d@linux.alibaba.com>
 <de5d2417-dc92-b276-1125-4feb5151de7f@huawei.com>
 <f60f1128-0d42-48e5-9a06-6ed7ca10767f@linux.alibaba.com>
 <20250428152350.GA23615@willie-the-truck>
 <6671c3cc-5119-4544-bcb5-17e8cc2d7057@linux.alibaba.com>
 <CAJZ5v0j3NC2ki1XPXfznxZRBLaReDBJ+nzHFgvqMx5+MgERL-A@mail.gmail.com>
 <3a465782-a8ff-4be8-9c15-e46f39196757@linux.alibaba.com>
 <CAJZ5v0gfFHCvE2Uu8=GRb9=ueK51s1-0BDBkJbbDG0tQvD5pLA@mail.gmail.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <9457d09d-20da-e645-3f3a-2be0c0101c71@huawei.com>
Date: Tue, 15 Jul 2025 10:46:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gfFHCvE2Uu8=GRb9=ueK51s1-0BDBkJbbDG0tQvD5pLA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_194620_380142_5D09D37D 
X-CRM114-Status: GOOD (  11.41  )
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

On 2025/7/15 1:30, Rafael J. Wysocki wrote:
>>> For APEI changes, you need an ACK from one of the reviewers listed in
>>> the MAINTAINERS entry for APEI.
>>>
>>> Thanks!
>> Hi, Rafael
>>
>> Sorry, I missed your email which goes in span (:
>>
>> ARM maintain @Catalin points that:
>>
>>   > James Morse is listed as reviewer of the ACPI APEI code but he's busy
>>   > with resctrl/MPAM. Adding Lorenzo, Sudeep and Hanjun as arm64 ACPI
>>   > maintainers, hopefully they can help.
>>
>> And Hanjun explictly gived his Reviewed-by tag in this thread, is that
>> happy for you for merge?
> Not really.
> 
> I need an ACK or R-by from a reviewer listed in the APEI entry in MAINTAINERS.
> 
> If James Morse is not able to fill that role (and AFAICS he's not been
> for quite some time now), I'd expect someone else to step up.

Please count me in. I have been working in ACPI for years, and RAS 
feature development for both x86 and arm64 architectures.

I'm pretty familiar with ACPI spec including APEI, it will help me
to do the review work.

Thanks
Hanjun

