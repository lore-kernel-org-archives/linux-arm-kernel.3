Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82934FCC9B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9aCjyy9Ivp4IuGzOf68ouXeTqJVl/1CRtfxbUD2mUY=; b=4fVScNDV4cseCZDAs0lm2sYsV9
	NDryRKrplL3WfHbds+4QE0F4Nboyir+slsh9x+WJCz5ybCirdET52ej56QIm24iTT4r45tvdGEvDz
	VBrneq3yQnRMwmR5ngVb4KOmoO3OmWritesrisC5mwWqtVDqH1pgpNN11JH5YZ20uPkaVHKaVZ2N8
	O7tcDRKeshiell9q5rUpUz7gpKi7woinGaSarY+ll5QwuESBG0PXIMdtaTjNQVVFJRAA+2vZdRZms
	4EAeQ5Dr0apqF58bOxMVNM0OvSlFxoWaYWUacCU5puhojQF2fC+IhHD0OxbeLn2AiSCLUDSlopMkK
	ePg3b/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznhE-00000008dqt-477p;
	Tue, 10 Mar 2026 03:23:48 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznhC-00000008dpI-2fhy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:23:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=l9aCjyy9Ivp4IuGzOf68ouXeTqJVl/1CRtfxbUD2mUY=;
	b=KTohcUNo5yPnpBwxWNsiG0U2ABQUIN+6YMbTKUL9F0hOHqWYPe6XTb3uVVGTwpaSdRC9wnNRX
	LoeD4efi4BqwN+J8YRKKo63ISlpCFMYEuPrxVwbDIs6mO5+IgrzSSvmq4bCyo94ZiqWHF66/w91
	SajYWi4QM9z3Z+u8+/ug3ZE=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fVJxY6sKnz1prKR;
	Tue, 10 Mar 2026 11:18:41 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id CEFF720104;
	Tue, 10 Mar 2026 11:23:38 +0800 (CST)
Received: from [10.174.179.248] (10.174.179.248) by
 kwepemr500001.china.huawei.com (7.202.194.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Mar 2026 11:23:36 +0800
Message-ID: <c62b1584-5ce7-44fe-81d6-b3eb2df942b8@huawei.com>
Date: Tue, 10 Mar 2026 11:23:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 1/4] x86/mm: Use proper page table helpers for huge
 page generation
To: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <willy@infradead.org>,
	<david@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <luto@kernel.org>,
	<peterz@infradead.org>, <akpm@linux-foundation.org>,
	<lorenzo.stoakes@oracle.com>, <ziy@nvidia.com>,
	<baolin.wang@linux.alibaba.com>, <Liam.Howlett@oracle.com>,
	<npache@redhat.com>, <ryan.roberts@arm.com>, <dev.jain@arm.com>,
	<baohua@kernel.org>, <lance.yang@linux.dev>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<anshuman.khandual@arm.com>, <rmclure@linux.ibm.com>,
	<kevin.brodsky@arm.com>, <apopple@nvidia.com>, <ajd@linux.ibm.com>,
	<pasha.tatashin@soleen.com>, <bhe@redhat.com>, <thuth@redhat.com>,
	<coxu@redhat.com>, <dan.j.williams@intel.com>, <yu-cheng.yu@intel.com>,
	<yangyicong@hisilicon.com>, <baolu.lu@linux.intel.com>, <jgross@suse.com>,
	<conor.dooley@microchip.com>, <riel@surriel.com>,
	<wangkefeng.wang@huawei.com>, <chenjun102@huawei.com>
References: <20260228070906.1418911-1-yintirui@huawei.com>
 <20260228070906.1418911-2-yintirui@huawei.com>
 <20260306092903.0000268f@huawei.com>
From: Yin Tirui <yintirui@huawei.com>
In-Reply-To: <20260306092903.0000268f@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.248]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_202346_828458_CBEF789B 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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



On 3/6/2026 5:29 PM, Jonathan Cameron wrote:
> Whilst you are here, can we make that a one liner.
> 	entry = pfn_pmd(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL_LARGE);
> 
> Could even do
> 
> 	pmd_t entry = pfn_pmd(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL_LARGE);
> but that's more of a question of taste.
Hi Jonathan,

Thanks for the suggestion, I will fold this one-liner cleanup into the 
next respin.

-- 
Yin Tirui


