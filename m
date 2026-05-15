Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC67CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCI3MNXSgN8EqftdIbv5mkwDxt9ritBP6tWBFGh9yLY=; b=QD7AZgDWWLGCj3XWrshNSpWREQ
	96b1PX/tjSFH8+vGHmmlL2YPlRrwTYntGhAG+dc26QLRscDj1Tm1JN2Jioixdx6Ra6Td2kVb3q+mW
	wUidhOnpbMv5Nvot1EcgsRkS9ARbtk7lq72HKbifx+Zv3hpJ0nHeYaAcEoLqXAeiLcKDeT8ip8uFV
	SdzfEXV/EyCSjduf5ZmSXIYhtFen78lRqiXR8oJE2z0EI/3/a0HX+5blYpcsFiCNHOeBkAXoTKZaw
	akDjfAI45AVJPrhlFmtfZsTlNJZPcHs7vLv6jf+aZim+76pClxbJFfcgOIXCkva2sZ3KrEDln7msa
	xVo5yOFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpqB-000000083Yz-2p5s;
	Fri, 15 May 2026 10:32:23 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpq8-000000083Vj-1yje
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:32:22 +0000
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gH3Gy3LLqz12LpG;
	Fri, 15 May 2026 18:24:58 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A0D040538;
	Fri, 15 May 2026 18:32:02 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 15 May
 2026 18:32:01 +0800
Message-ID: <93cbb609-9b90-4551-8bf9-19e9ca657baf@hisilicon.com>
Date: Fri, 15 May 2026 18:32:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] devfreq: Factor out devfreq_set_governor()
To: Yaxiong Tian <tianyaxiong@kylinos.cn>, <cwchoi00@gmail.com>,
	<cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <zhenglifeng1@huawei.com>,
	<zhangpengjie2@huawei.com>, <lihuisong@huawei.com>,
	<prime.zeng@hisilicon.com>
References: <20260513093832.1645890-1-zhanjie9@hisilicon.com>
 <20260513093832.1645890-4-zhanjie9@hisilicon.com>
 <418993e5-ae44-48a4-98d7-250d0f359b0a@kylinos.cn>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <418993e5-ae44-48a4-98d7-250d0f359b0a@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_033220_706479_AE9F1820 
X-CRM114-Status: GOOD (  10.96  )
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



On 5/14/2026 2:09 PM, Yaxiong Tian wrote:
> 
> 在 2026/5/13 17:38, Jie Zhan 写道:
>> Factor out common governor setting logic into devfreq_set_governor() so as
>> to consolidate the code in governor_store() and devfreq_add_device().
>>
>> The caller is expected to hold 'devfreq_list_lock', enforced via
>> lockdep_assert_held().  This is required because devfreq_add_device() must
>> hold the lock from setting governor until the device is added to
>> 'devfreq_list', so that a concurrent devfreq_remove_governor() cannot free
>> the governor in between.
>>
>> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
> 
> I'm a bit unclear about the purpose of this commit, or the problem it solves. Can you explain it more clearly?
> 
> 
`governor_store()` and `devfreq_add_device()` share the similar governor
setting code when `devfreq->governor` can be NULL, so unifying and
factoring out the common governor setting logic with two main purposes:
1. Reduce code duplication.
2. Prepare for the next few patches which add refcounting for the governor
modules -- There would be less `try_module_get()` and `module_put()` by
factoring out `devfreq_set_governor()`.

I'll explain this more in the commit log.

Thanks,
Jie
>> ---
>>   drivers/devfreq/devfreq.c | 117 ++++++++++++++++++--------------------
>>   1 file changed, 56 insertions(+), 61 deletions(-)
[ ... ]

