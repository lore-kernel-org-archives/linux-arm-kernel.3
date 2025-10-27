Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A617CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZIV7DiVBQ9ZGj7Mw+AxaUbETtcLCEViFbmC0IEP6UQ=; b=Y53f8XkcCgbPAZhGQlDUTR/qW4
	HrluOYvRrhUQTh0A4reJOwHs+yp9uxc3/THth2Z01aiBt9zX0bpwDhVMRLiUiVmxVOZKz4zsduwc4
	qkTsxdOgU00bYJGRABDaX+zJuMJiGchrcUqZAmJVCOz/dCoTQ5mgl2yaL1XLMnIDEF7haVf9t22NC
	kWaSy/hQgp38EN5yhSI6PjKQgPLezDl3M6cr3lp1aS1sICtWtGQAmjkaJTSGNHoHQlWRoDuZlDrZZ
	TjbBWVI0ykKxsTgInH2BhLgsblUegzfoYTI6OgbtlTrKWWEkLHE2cWhxulAjHQueprEcNqqZBzSUv
	w0FUrMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNLK-0000000E35b-3wgk;
	Mon, 27 Oct 2025 13:33:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNLF-0000000E32G-3arq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 13:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LZIV7DiVBQ9ZGj7Mw+AxaUbETtcLCEViFbmC0IEP6UQ=; b=SJWuYf7eaOW2c7k+9ryLOq/sLV
	KRVGvdghAQSEbnVNrxvNW+e1FtM1vH9ywYNVQAce24IxHcXxd8GzztV2ij5ONVTZO2qGzyOeUwzes
	YHB1+Kfs88HESnoEVMOhbK+wVWNVz5zWO1dY0mffeobXuquxL097mf5JegBCiBEj83lX5tCPiw/FJ
	5WzZi164EbmG2E6r7zWEYzUUJB0gzGVAze/bdRvQI1wcsgQszgcSbjxYDK85RgeqnZHEiy12RjDJu
	RddSM6u6a0GpEiypKzs3sUuYKMdRrxAm8L/PvZuOSLz06XL1/G8J3BKDYdu0SSA4JZreTxBWbgC57
	OI5ZVQJA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMTS-00000002BgX-2suJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:37:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1A07175D;
	Mon, 27 Oct 2025 06:32:44 -0700 (PDT)
Received: from [10.57.68.196] (unknown [10.57.68.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF5AF3F673;
	Mon, 27 Oct 2025 06:32:45 -0700 (PDT)
Message-ID: <2be0732d-d8fb-424d-bc4e-443cc49d0092@arm.com>
Date: Mon, 27 Oct 2025 14:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: David Hildenbrand <david@redhat.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-12-kevin.brodsky@arm.com>
 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
 <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
 <3ff4aaeb-61ce-4b72-ba90-1b66374b1b95@gmail.com>
 <6c9bd0c6-0968-41ac-b0b4-53c881748cfb@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <6c9bd0c6-0968-41ac-b0b4-53c881748cfb@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_123723_026425_08725490 
X-CRM114-Status: GOOD (  15.37  )
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

On 27/10/2025 13:29, David Hildenbrand wrote:
> On 25.10.25 00:52, Demi Marie Obenour wrote:
>> On 10/24/25 10:51, David Hildenbrand wrote:
>>> On 24.10.25 16:47, David Woodhouse wrote:
>>>> On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
>>>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>>>> We currently set a TIF flag when scheduling out a task that is in
>>>>>> lazy MMU mode, in order to restore it when the task is scheduled
>>>>>> again.
>>>>>>
>>>>>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>>>>>> mode in task_struct::lazy_mmu_state. We can therefore check that
>>>>>> state when switching to the new task, instead of using a separate
>>>>>> TIF flag.
>>>>>>
>>>>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>>>>> ---
>>>>>
>>>>>
>>>>> Looks ok to me, but I hope we get some confirmation from x86 / xen
>>>>> folks.
>>>>
>>>>
>>>> I know tglx has shouted at me in the past for precisely this reminder,
>>>> but you know you can test Xen guests under QEMU/KVM now and don't need
>>>> to actually run Xen? Has this been boot tested?
>>>
>>> And after that, boot-testing sparc as well? :D
>>>
>>> If it's easy, why not. But other people should not suffer for all the
>>> XEN hacks we keep dragging along.
>>
>> Which hacks?  Serious question.  Is this just for Xen PV or is HVM
>> also affected?
>
> In the context of this series, XEN_LAZY_MMU.

FWIW in that particular case it's relatively easy to tell this is
specific to Xen PV (this is only used in mmu_pv.c and enlighten_pv.c).
Knowing what to test is certainly not obvious in general, though.

- Kevin

>
> Your question regarding PV/HVM emphasizes my point: how is a submitter
> supposed to know which XEN combinations to test (and how to test
> them), to not confidentially break something here.
>
> We really need guidance+help from the XEN folks here.

