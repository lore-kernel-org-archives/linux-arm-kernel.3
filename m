Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF40DC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 03:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6BmoNo0Rm+l7jB3ysJ71dExwkuryFGpv7yramNe9aE=; b=lJCD3WlMxqLUk68njIu0c/66rk
	lbHU39FBYuPyw44tLJeuXCYF/LsKvvftdsQZK2D9uyzLHP9NdwNb8iduGXc8yfpweFmhwEPXMlnYH
	pfFCjLC4s7hGmvTupBP/gZJsI74wu2KheK3jhIuAW85zOl7quOFEazkaLYOLWHsL+uPi42xvsTSh/
	gtvKnrLZ4jKX7jBSqnmPhZ/PyqQhcThbBH+c6kkNfUAA87KhHknmVWXD1j8NVgV3CpCKjBSrf00g/
	TzPoDpdYlggqRPDX3/fYtu50VocF60GhZzGTbFBy8YRBcQEZQu2yIYYmiqeehuoyqjS2P9cn+C/fl
	i6RVymtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0sY3-00000008OYi-3UA0;
	Mon, 31 Aug 2026 03:19:03 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0sXz-00000008OY2-2hZ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 03:19:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=P6BmoNo0Rm+l7jB3ysJ71dExwkuryFGpv7yramNe9aE=;
	b=ftuH4LUVwe336rRMXuL6pKgvXG2AMhjdewt2FV+0QUzxt/2uZy9D0W+Fb8ZGUgS9FJ/cARaCB
	yedCJvaeS3hqAChP06R3i01+swTjmedOowvO4MtMBEt1NodK9HNciBhFUbcvPNY91jllJVXHPtg
	LFAkyUdCESFklNP/1q0mQgo=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hYDSN6gCFz1T4Fq;
	Mon, 31 Aug 2026 11:07:32 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D1B94057F;
	Mon, 31 Aug 2026 11:18:51 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 31 Aug 2026 11:18:48 +0800
Message-ID: <110d75e9-1580-42d3-b137-89bdad22b80a@huawei.com>
Date: Mon, 31 Aug 2026 11:18:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
To: Will Deacon <will@kernel.org>
CC: <catalin.marinas@arm.com>, <tsbogend@alpha.franken.de>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <peterz@infradead.org>, <kees@kernel.org>,
	<nathan@kernel.org>, <linusw@kernel.org>, <ojeda@kernel.org>,
	<david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<maz@kernel.org>, <timothy.hayes@arm.com>, <lpieralisi@kernel.org>,
	<thuth@redhat.com>, <menglong8.dong@gmail.com>, <oupton@kernel.org>,
	<yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>, <broonie@kernel.org>,
	<kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<sshegde@linux.ibm.com>, <thorsten.blum@linux.dev>,
	<chang.seok.bae@intel.com>, <tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <ajvKkLw5bL-FT5JC@willie-the-truck>
 <32d41a67-cf37-4079-8218-bed2b73bbf14@huawei.com>
 <akvoN5vvQaW3MdmI@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <akvoN5vvQaW3MdmI@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_201900_347867_D55BEDA6 
X-CRM114-Status: GOOD (  16.75  )
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



在 2026/7/7 1:39, Will Deacon 写道:
> Hi Jinjie,
> 
> On Thu, Jun 25, 2026 at 09:34:36AM +0800, Jinjie Ruan wrote:
>> On 6/24/2026 8:16 PM, Will Deacon wrote:
>>> Please just give me the time I asked for. If you want to help out in the
>>> meantime, there are plenty of patches that need reviewing...
>>
>> It was a mistake on my part, and I sincerely apologize for wasting
>> community review resources and disrupting your schedule.
>>
>> I will absolutely back off now and wait for your official series. Lesson
>> learned. Thanks for your patience and for calling me out on this.
> 
> So I've mostly got the old series back on its feet:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug
> 
> but there are still two issues left to resolve:
> 
>   1. The printing that can happen before RCU has started. Although I've
>      reduced this somewhat, there are still error paths in e.g.
>      verify_local_cpu_capabilities() that print a message before dying.
> 
>   2. check_local_cpu_capabilities() can mutate the system capability
>      state via update_cpu_capabilities(), so it's really dodgy running
>      that prior to synchronisation.

Hi Will,

Just a gentle ping on this. I replied to the two remaining issues
earlier — any thoughts on my response? Happy to help test or rebase if
that helps.

Best regards,
Jinjie

> 
> Since you've added patches in this series that try to tackle these
> problems, I'll reply on those two so we can figure out how we would like
> to proceed.
> 
> Cheers,
> 
> Will


