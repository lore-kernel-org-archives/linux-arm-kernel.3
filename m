Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A088FCC9B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ot5C4phsn/D5HCjzZ0Ig3HqX6b1yZe2wL22xhQfLHmg=; b=rwlZ7DEw36hvU96P8pU5OfDyZt
	+RzA9kWe6qTSSfP5Iwqvl5Sh5fqEwgBpXqBZXdwePBT6H9YN07N/11t/vc0PSx8fiuuRlXdvfnOoB
	qfGvm+U7feBK6L8uul1pWNbsC05blWioD/zMG9jaIbILV1puQ97jdcisty3HXzE1f1wLQe0o32b/Y
	QZfvv4FgSzwKdLwMj3mtSetU3jHTEkeX6NqRCpEYIFEhfo1kcvAfiZIfzZcYnw9r6Wp4tdPSY9mOh
	5S/vpPNrVx3te5pVbOmo2COqO/2RVTn5PGN6/XYhBaMs+fD2gwNTI98t2TnlpNKXWeRyvLOvuRnrl
	cXpSZLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznth-00000008fdN-152h;
	Tue, 10 Mar 2026 03:36:41 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznte-00000008fd2-1qdU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:36:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ot5C4phsn/D5HCjzZ0Ig3HqX6b1yZe2wL22xhQfLHmg=;
	b=u/Y5l5+N4i469pymJs6TizNMRhaXRY3XQYDkxsFl8M0qt2iPo/czlg6L4roHgwf6Ip1oXoqm1
	ascKg5gs8YVj2fROA1QIFoKpqalvRjzL7LS7HXslvZjro8o1K1ud6Vkerhap9qLy7VjeW+0w97x
	UGB+091hZnHHBRVLz06b+qk=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fVKCg5mZDz12LCw;
	Tue, 10 Mar 2026 11:30:55 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id F058D40538;
	Tue, 10 Mar 2026 11:36:31 +0800 (CST)
Received: from [10.174.179.248] (10.174.179.248) by
 kwepemr500001.china.huawei.com (7.202.194.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Mar 2026 11:36:29 +0800
Message-ID: <0dc36f64-3e6c-4e4b-bdd1-6e364babb0bc@huawei.com>
Date: Tue, 10 Mar 2026 11:36:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 2/4] mm/pgtable: Make pfn_pte() filter out huge
 page attributes
To: Matthew Wilcox <willy@infradead.org>
CC: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <x86@kernel.org>,
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
 <aapXRN4KjWtUUJ0g@casper.infradead.org>
From: Yin Tirui <yintirui@huawei.com>
In-Reply-To: <aapXRN4KjWtUUJ0g@casper.infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.248]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_203638_664213_C135BDEC 
X-CRM114-Status: UNSURE (   7.79  )
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



On 3/6/2026 12:25 PM, Matthew Wilcox wrote:
> 
> I don't think we should have pgprot_large_2_4k().  Or rather, I think it
> should be embedded in pmd_pgprot() / pud_pgprot().  That is, we should
> have an 'ideal' pgprot which, on x86, perhaps matches that used by the
> 4k level.  pfn_pmd() should be converting from the ideal pgprot to
> that actually used by PMDs (and setting _PAGE_PSE?)
> 

Hi Willy,

I will take this route and implement the embedded approach for the v4 
respin.

-- 
Yin Tirui


