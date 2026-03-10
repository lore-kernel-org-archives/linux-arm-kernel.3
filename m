Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CD7FCC9AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukfr+AuSSjalhcEuGd775EwrTPxyhTtDQGkfF9cnnoI=; b=pS1qo81fArhf8XcY3G4WVBIlrk
	V6jnopYwbS6uajFTajnZ+0v6JovjQTgGiON6bUB51nJXBsGwnXvczPGTlhbMWrLBW5AOxw6Q45cKC
	lGNNsRyiW3xRzEzZQDsyuLWkZOI0NxlyBdnu28GfMGAd7fXGY1cCV46ZYada0D9yBE577myGShNth
	qUXttt4o8frTwvj3v58Ff+4oLnTskt7qQD34S6cayOvpEBRkupcMNwiByE4UX6K4/hibIqqEuzHVa
	QF9m7aEe6Jk5QAn+SGtmiubKC4lEJCELCuyXFRYr3wrZL8omUV8rAe6i3OAIfKhz0xcIGVlklcpF4
	5Dvfj49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznrE-00000008fTB-1GZn;
	Tue, 10 Mar 2026 03:34:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznrD-00000008fT3-2lWk
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Mar 2026 03:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ukfr+AuSSjalhcEuGd775EwrTPxyhTtDQGkfF9cnnoI=; b=WMogFKSqCSKUdR+O6S5o+sP6+U
	F8AunVCzUZ5oYgGu8SuwI4veviCt1f+ty4cxictiBN5kNO5ipay9jDyzS4Miq0Bat73MVmUxonMiC
	v3JtXA5iwuGDwmE79QLUlBVGyjLChCkNhBoW0NAeaRqtO42prco7QOJjYQgxfA6A8lexledIPSc/a
	f8N67FaSH34Gycv3pwIAqJu5nuxCffmDRXjR4Bd3zMJWW5pwMPjR38RHR+CZjNIqvz2gDaAvsSpLq
	WlgxY9UKK/GHtoQNRMNf4N+g4FpxxQupkdrFlq753rqkF7dWUDlrPsNyqtOfTKVBeru499V/FT5F7
	52Finsrg==;
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznr9-000000075LG-0cIO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:34:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ukfr+AuSSjalhcEuGd775EwrTPxyhTtDQGkfF9cnnoI=;
	b=25WpgtJUdMU4EPFULH4K6br31HYc+68SzizJgcjOO0/WwTWrFm0I23gaAhtwXnemVVXog/D/6
	BKz/296PrNYryXCSs7MiOe69iLEyRVgoaq5Khg5lETGv3V86EtVXKGw/JnmgCWQ0KZKoJSPlifM
	iFUEDnQb9cUjb9lEiLhCOWk=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fVK7D71ZgzcbS0;
	Tue, 10 Mar 2026 11:27:04 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 0A90840569;
	Tue, 10 Mar 2026 11:32:29 +0800 (CST)
Received: from [10.174.179.248] (10.174.179.248) by
 kwepemr500001.china.huawei.com (7.202.194.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Mar 2026 11:32:26 +0800
Message-ID: <875a5d1b-4bed-4f70-a122-acd625265bfa@huawei.com>
Date: Tue, 10 Mar 2026 11:32:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 2/4] mm/pgtable: Make pfn_pte() filter out huge
 page attributes
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Matthew Wilcox
	<willy@infradead.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <david@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <luto@kernel.org>, <peterz@infradead.org>,
	<akpm@linux-foundation.org>, <lorenzo.stoakes@oracle.com>, <ziy@nvidia.com>,
	<baolin.wang@linux.alibaba.com>, <Liam.Howlett@oracle.com>,
	<npache@redhat.com>, <ryan.roberts@arm.com>, <dev.jain@arm.com>,
	<baohua@kernel.org>, <lance.yang@linux.dev>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<anshuman.khandual@arm.com>, <rmclure@linux.ibm.com>,
	<kevin.brodsky@arm.com>, <apopple@nvidia.com>, <ajd@linux.ibm.com>,
	<pasha.tatashin@soleen.com>, <bhe@redhat.com>, <thuth@redhat.com>,
	<coxu@redhat.com>, <dan.j.williams@intel.com>, <yu-cheng.yu@intel.com>,
	<baolu.lu@linux.intel.com>, <conor.dooley@microchip.com>,
	<Jonathan.Cameron@huawei.com>, <riel@surriel.com>, Kefeng Wang
	<wangkefeng.wang@huawei.com>, <chenjun102@huawei.com>
References: <20260228070906.1418911-1-yintirui@huawei.com>
 <20260228070906.1418911-3-yintirui@huawei.com>
 <5eaf3846-01db-471e-9903-b0b239d7838d@suse.com>
 <e8d5ba16-3071-4b4a-b6a1-d492cc46e8c2@huawei.com>
 <4d7c396a-6a48-4e56-b8d1-3ac7bd5d10fb@suse.com>
From: Yin Tirui <yintirui@huawei.com>
In-Reply-To: <4d7c396a-6a48-4e56-b8d1-3ac7bd5d10fb@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.248]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_033403_704635_143DBFC5 
X-CRM114-Status: GOOD (  12.00  )
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



On 3/5/2026 6:05 PM, Jürgen Groß wrote:
>> Hi Willy and Jürgen,
>>
>> Following up on the x86 _PAGE_PSE and _PAGE_PAT aliasing issue.
>>
>> To achieve the goal of keeping pfn_pte() pure and completely 
>> eradicating the pte_clrhuge() anti-pattern, we need a way to ensure 
>> pfn_pte() never receives a pgprot with the huge bit set.
>>
>> @Jürgen:
>> Just to be absolutely certain: is there any safe way to filter out the 
>> huge page attributes directly inside x86's pfn_pte() without breaking 
>> PAT? Or does the hardware bit-aliasing make this strictly impossible 
>> at the pfn_pte() level?
> 
> There is no huge bit at the PTE level. It is existing only at the PMD 
> and the
> PUD level.
> 
> So: yes, it is absolutely impossible to filter it out, as the bit has a
> different meaning in "real" PTEs (with "PTE" having the meaning: a 
> translation
> entry in a page referenced by a PMD entry not having the PSE bit set).
> 
Hi Jürgen,

Thank you for your confirmation.

>>
>> @Willy @Jürgen:
>> Assuming it is impossible to filter this safely inside pfn_pte() on 
>> x86, we must translate the pgprot before passing it down. To maintain 
>> strict type-safety and still drop pte_clrhuge(), I plan to introduce 
>> two arch-neutral wrappers:
>>
>> x86:
>> /* Translates large prot to 4K. Shifts PAT back to bit 7, inherently 
>> clearing _PAGE_PSE */
>> #define pgprot_huge_to_pte(prot)    pgprot_large_2_4k(prot)
>> /* Translates 4K prot to large. Shifts PAT to bit 12, strictly sets 
>> _PAGE_PSE */
>> #define pgprot_pte_to_huge(prot) 
>> __pgprot(pgprot_val(pgprot_4k_2_large(prot)) | _PAGE_PSE)
> 
> Seems to be okay.
While the wrapper approach handles the aliasing, Willy recently 
suggested taking it a step further by embedding this translation 
directly into `pfn_pmd()` and `pmd_pgprot()`.

I am going to explore this embedded approach for the v4 respin.

-- 
Yin Tirui


