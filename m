Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44937C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDGBGxMLY2f3fvwCi3z4JyjX5BZvDlkMXPcR3ZxGc6s=; b=4B116yb8uq7nDT3GtueOsc2T1w
	RKsMEhhxGvP+xGwSji8M0M6j83K0rcYLF4lzpgrf0+JeAJ8rP59xkNoJYsRojjC9j5prOf/PaQzBo
	pQTV9l5Jp7uXbTyXmLMQwwYel8fu1qAzwtK3UKgnK26h8/E28nm4Cmi7b2J38Cv7LmIaNs8/pSewf
	ntibXyqRxwSIgjj1dXmxlDSmF95pK7VG0yGX3x2Y8XMzhQ9hUkb3JeNNCw5IPaEmvKcQIHly8yzt/
	4lTKkoCLzfPK60s9slzACFpYx1K3pHqWHPYmpV6Nsp1MQ3AimjZTnED6I6RHJuujHbUuAUpBy5Hsc
	f8cAbzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYd0-0000000BKB0-0fMg;
	Tue, 14 Jul 2026 08:36:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYcu-0000000BK8k-2nyD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:36:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C13E51476;
	Tue, 14 Jul 2026 01:36:22 -0700 (PDT)
Received: from [10.174.43.51] (unknown [10.174.43.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F4743F7B4;
	Tue, 14 Jul 2026 01:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784018186; bh=AGh5lIWu+Wfrmi++dxD+3aI9DBae6CwPDFEGYSFnVIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rw7b4Ah+uga3FnevhlB/g0Y+OhmjMpx14GqulYuXCa//NJplqDatQszbIzym3ESTS
	 sW9yHfsriNZHqLPswLscBCKXftbr0qmWcmhocrkKU1NYPwT6nfnJwbTcrPXFtiUE7A
	 rtngZO/Fhzaxh7c0pZgrcQhTQJrcs+OabQ3b3I0E=
Message-ID: <929dedc2-eea3-4153-be6d-d2dd727fed89@arm.com>
Date: Tue, 14 Jul 2026 14:06:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Wen Jiang <jiangwenxiaomi@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
 david@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, rppt@kernel.org, ryan.roberts@arm.com,
 dev.jain@arm.com, Wen Jiang <jiangwen6@xiaomi.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
 <20260709160805.26e63bae89dd03cf2951104e@linux-foundation.org>
 <CAHKocdH5kp5kTtZht+v5j-4-Thh40TGvif3=kRMgErRXr+Q+RQ@mail.gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAHKocdH5kp5kTtZht+v5j-4-Thh40TGvif3=kRMgErRXr+Q+RQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_013628_845112_2D4508D8 
X-CRM114-Status: GOOD (  12.06  )
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



On 10/07/26 2:24 PM, Wen Jiang wrote:
> On Fri, 10 Jul 2026 at 07:08, Andrew Morton <akpm@linux-foundation.org> wrote:
>>
>> On Thu,  9 Jul 2026 15:38:17 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>>
>>> This patchset accelerates ioremap, vmalloc, and vmap when the memory
>>> is physically fully or partially contiguous.
>>
>> Thanks, I added this to mm.git's mm-new branch for wider testing.
>>
>> AI review asked some questions, and some of them are new since the v5
>> series:
>>         https://sashiko.dev/#/patchset/20260709073823.6643-1-jiangwen6@xiaomi.com
> 
> Hi Andrew,
> 
> I've gone through the Sashiko findings:
> 
> - Patch 1 (find_num_contig): Over-interpretation. No new hugetlbfs hstate
>   is added. The extra sizes are only used by init_mm kernel mappings via.

But not sure if that is a right approach. If these multi CONT_PTE
sized mappings need to be supported in vmalloc() but without adding
corresponding HugeTLB sizes, probably these required helpers could
just be factored outside HugeTLB.
> 
> - Patch 5/6 (NULL page): Invalid input. vmap() expects a fully populated
>     array of valid struct page pointers.
> 
> - Patch 6 (32-bit count << PAGE_SHIFT overflow): Pre-existing. This was
>     already discussed in the V3 thread, and a separate fix was proposed
>     there.
> 
> Thanks,
> Wen


