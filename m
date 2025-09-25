Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4632CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 02:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+MrvNjbNMU5UdkWxgeYFdNRdUNRe55IPsqP6XzkkQw=; b=BgQ0AeuGpUmOCuskX7RFCX2wOp
	liVPFpl/t9Omk193LLO6Bq8Dlt5/b1yHtk4Fertz+AMmqiTRpOZJS3JRIorAdZA2P3OObifTzJNJs
	Bitb8RIrSpB6TiqWWbG4u69hRCo8yXF7Ry5Ire/pGTlX09urGTRXoVZs0jEBdrZwf7mrFCO1IPFIM
	1fPSQ+YLnT+fAHPBAFwUrLEiD3XseatcbdcaC2OSgu2ECGYp5ELtUnYpJj7U2V5HpDJbLjFg0je1A
	OTxOGRie34/esBXeNlp3WOlb0pimT77UdeA2bkq8RQqcrQJcLmTzF5oPSw4anRquzvIxGlSbjHaQz
	4p5eGSFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bYJ-00000005HOT-1WsP;
	Thu, 25 Sep 2025 02:17:47 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bYF-00000005HNI-107Q;
	Thu, 25 Sep 2025 02:17:45 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cXHLG6dwBzTh3F;
	Thu, 25 Sep 2025 10:12:54 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 7EA3B180B63;
	Thu, 25 Sep 2025 10:17:33 +0800 (CST)
Received: from [10.174.179.35] (10.174.179.35) by
 kwepemr500001.china.huawei.com (7.202.194.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Sep 2025 10:17:31 +0800
Message-ID: <620d202a-6078-4b5d-a42a-8a52543bc14a@huawei.com>
Date: Thu, 25 Sep 2025 10:17:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] mm: add PMD-level huge page support for
 remap_pfn_range()
To: Matthew Wilcox <willy@infradead.org>
CC: <akpm@linux-foundation.org>, <david@redhat.com>,
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>, <ziy@nvidia.com>,
	<baolin.wang@linux.alibaba.com>, <npache@redhat.com>, <ryan.roberts@arm.com>,
	<dev.jain@arm.com>, <baohua@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <anshuman.khandual@arm.com>,
	<yangyicong@hisilicon.com>, <ardb@kernel.org>, <apopple@nvidia.com>,
	<samuel.holland@sifive.com>, <luxu.kernel@bytedance.com>,
	<abrestic@rivosinc.com>, <yongxuan.wang@sifive.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<chenjun102@huawei.com>
References: <20250923133104.926672-1-yintirui@huawei.com>
 <20250923133104.926672-3-yintirui@huawei.com>
 <aNMhiZ4FiEE1Rk_T@casper.infradead.org>
From: Yin Tirui <yintirui@huawei.com>
In-Reply-To: <aNMhiZ4FiEE1Rk_T@casper.infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.35]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_191743_581065_E460308B 
X-CRM114-Status: GOOD (  22.26  )
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



On 9/24/2025 6:39 AM, Matthew Wilcox wrote:
> On Tue, Sep 23, 2025 at 09:31:04PM +0800, Yin Tirui wrote:
>> +			entry = pte_clrhuge(pfn_pte(pmd_pfn(old_pmd), pmd_pgprot(old_pmd)));
> 
> This doesn't make sense.  And I'm not saying you got this wrong; I
> suspect in terms of how things work today it's actually necessary.
> But the way we handle this stuff is so insane.

Thank you for pointing this out and the broader context.

> 
> pte_clrhuge() should not exist.  If we have a PTE, it can't have the
> huge bit set, by definition (don't anybody mention hugetlbfs because
> that is an entirely separate pile of broken horrors).  I understand what
> you're trying to do here.  You want to construct a PTE that points to
> the same address as the first page of the PMD and has the same
> permissions.  But that *should* be written as:
> 
> 	entry = pfn_pte(pmd_pfn(old_pmd), pmd_pgprot(old_pmd)));
> 
> right?  Now, pmd_pgprot() might or might not want to return the huge bit
> set.  I'm not sure.  Perhaps you could have a look through and figure it

I've tested this on arm64, and pmd_pgprot() does return the huge bit 
set, which is exactly why I added pte_clrhuge().

> out.  But pfn_pte() should never return a PTE with the huge bit set.
> So if it is set in the pgorot on entry, it should filter it out.
> 
> There are going to be consequences to this.  Maybe there's code
> somewhere that relies on pfn_pte() returning a PTE with the huge bit
> set.  Perhaps it's hugetlbfs.

I'll try to refactor pfn_pte() and related functions to filter out the 
huge bit set and test its impact on hugetlbfs.

> 
> But we have to start cleaning this garbage up.  I did some work with
> e3981db444a0 and the commits leading up to that.  See
> https://lkml.kernel.org/r/20250402181709.2386022-12-willy@infradead.org
> 
> I'd like pte_clrhuge() to be deleted from x86, not added to arm and
> riscv.
> 
I completely agree with the goal of deleting pte_clrhuge() rather than 
expanding it. I'll study your referenced work and align my approach with 
your efforts.

Would you recommend I address the pfn_pte() and related function 
refactoring as part of this patch series, or should I submit it as a 
separate patch series?

-- 
Best regards,
Yin Tirui


