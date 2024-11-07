Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089A7D43364
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 14:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrwXI6vmrfJw1w0ZuAtqZZwpQ2YVQiSVnr8XYbo34/E=; b=4yv//aMqHYSAia6gLd/qKCLRIU
	zaPPL2cNlxXYX9npQvxyVBPMrVnmjS1cvs+xulvObri4gmHL6OJtdNYX+uq9yNQBn6ovFokO9jnz1
	Vo83cm8DGLKXEB30QmIh0l6WgGKHt1m/wvE7gzMlS8YOneMxaorSqT9Ggt4AKyGEKDY5C2JiNzso9
	UMCYF2gE1kF8iqb3YhcXjoBNaLle04eWTjymRX78RaHhOzGTJuBKBogasAZpguGoVeVgsxNjFkx2T
	bBVllXOCi2OFVc6BjhT5jZT/7FYf2SLQMVzhTkCIHwFavNwCEvq98VBNsC5D1FZyKGo0lIiN9TLTT
	2vsL0JZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t93G0-00000007FdG-2gpF;
	Thu, 07 Nov 2024 14:13:08 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t93EE-00000007FOF-1nJE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 14:11:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XkkTW5kJkz2Fbjl;
	Thu,  7 Nov 2024 22:09:19 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 533D61A0190;
	Thu,  7 Nov 2024 22:11:02 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 7 Nov 2024 22:11:01 +0800
CC: <yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>,
	<mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <wangyushan12@huawei.com>,
	<prime.zeng@hisilicon.com>
Subject: Re: [PATCH v3 2/8] drivers/perf: hisi: Improve the detection of
 associated CPUs
To: Will Deacon <will@kernel.org>
References: <20241026072424.29887-1-yangyicong@huawei.com>
 <20241026072424.29887-3-yangyicong@huawei.com>
 <20241029132826.GB4416@willie-the-truck>
 <5895fd31-04f8-f1ea-0639-12dd1f19069c@huawei.com>
 <9a64ed90-6c9f-a32a-85cf-9d0c41e2fd81@huawei.com>
 <20241106115134.GC13801@willie-the-truck>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <df38a326-bb5c-5a17-9375-f1695cd7d937@huawei.com>
Date: Thu, 7 Nov 2024 22:11:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20241106115134.GC13801@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_061118_665466_D301269E 
X-CRM114-Status: GOOD (  13.86  )
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

On 2024/11/6 19:51, Will Deacon wrote:
> On Wed, Nov 06, 2024 at 04:33:18PM +0800, Yicong Yang wrote:
>> Hi Will,
>>
>> Further comment on this patch?
> 
> You failed to convince me that copying the online mask is safe, but I
> haven't had time to look into that in more depth myself. Saying "It should
> be safe" isn't really enough -- it _must_ be safe!
> 

I assume the "safe" here means we won't have trouble if CPU in the copied cpumask
offlined since we don't synchronize with the cpuhp here. Accessing cpu_online_mask
itself is safe since it's a piece of static memory.

We'll initialize the hisi_pmu::associated_cpus from cpu_online_mask in the below
cases. For other cases the associated CPUs is initalized in the cpuhp callback
and we won't come here.
1) for a PMU does have associated CPUs like L3C PMU, but the associcated CPUs
   not onlined at probe
2) for a PMU has no association like CPA PMU which locates on a SICL. Before this
   patch this kind of PMU'associated CPUs are initliazed in the cpuhp callbacks

For the above 2 cases it is safe since the driver's not using hisi_pmu::assoicated_cpus
directly but combined with cpu_online_masks. PMU indicates the user the preferred CPU
to open events on by "cpumask" sysfs which shows hisi_pmu::on_cpu. It's initialized/updated in:
1) hisi_pmu_init_associated_cpus() by cpumask_local_spread() which tries to
   found a nearest CPU of the node that the device locates
2) cpuhp callbacks we registered where holds the cpumap upate lock.

Actually we allow hisi_pmu::associated_cpus contains offline CPUs which is also
mentioned in the commit.

Based on above it's safe to use the cpu_online_mask here. But I find one case
doesn't covered by this patch - if boot with maxcpus=1, offline CPU X and offline
CPU0 (both are not assocaited CPUs), hisi_pmu::on_cpu will not be updated. Since
hisi_pmu::associated_cpus won't be updated when onlining an unassociated CPU
and hisi_pmu::on_cpu is selected from the intersection of the associated CPUs
and the online CPUs, the intersection will be empty in this case.

I'll see how to handle in this case and update the patch.

Thanks.


