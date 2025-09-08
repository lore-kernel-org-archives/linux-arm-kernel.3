Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30D5CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MXJVs4sRjIzs/FqbYFU50YGWM5NgmUAUp6zmg3Kby4=; b=Lz02fCBmFg4IyqwntVHLZcHME+
	efTHeDp3f9T7i+CUzB4b9A3XJ6e+3VFVRH1fssd9ydCDK/7eDU/pRiGxr13iVSDi66SR2yKel3kKP
	ybZnAbobXTK8qlC4V5VavBS2E9xX/fnTVXzBKT65kvI9GCTURVhbfMSCR4KRBfyJxLlUUROlC1HP2
	Ixdt/i4U5fCQ3qyPEf3gZTVF5GoiMzVF8OgdPS+hNcwOjm0lGnObweIfhGSEWLMZc3KDJdGyuMQ+W
	lp+P6llMuwBujFU2xiZPwKysQ5Br5OFUIIHLWOsI6G6CoPpGfw1DHTLyhiXT0ujZsFvrgh71L+UD8
	ezIbuO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWeb-0000000FSES-1BFO;
	Mon, 08 Sep 2025 07:51:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWMj-0000000FJwg-1qPx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:32:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88AA2169C;
	Mon,  8 Sep 2025 00:32:32 -0700 (PDT)
Received: from [10.57.58.69] (unknown [10.57.58.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFA563F63F;
	Mon,  8 Sep 2025 00:32:34 -0700 (PDT)
Message-ID: <1f822d8b-eb46-4998-b1c1-9996d70e1958@arm.com>
Date: Mon, 8 Sep 2025 09:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] powerpc/mm: support nested lazy_mmu sections
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-6-kevin.brodsky@arm.com>
 <074ff6ab-5868-4fde-b5bb-9e17632ad817-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <074ff6ab-5868-4fde-b5bb-9e17632ad817-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_003241_519424_3B51352E 
X-CRM114-Status: GOOD (  12.17  )
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

On 05/09/2025 17:52, Alexander Gordeev wrote:
> On Thu, Sep 04, 2025 at 01:57:34PM +0100, Kevin Brodsky wrote:
> ...
>>  static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>>  {
>>  	struct ppc64_tlb_batch *batch;
>> +	int lazy_mmu_nested;
>>  
>>  	if (radix_enabled())
>>  		return LAZY_MMU_DEFAULT;
>> @@ -39,9 +40,14 @@ static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>>  	 */
>>  	preempt_disable();
>>  	batch = this_cpu_ptr(&ppc64_tlb_batch);
>> -	batch->active = 1;
>> +	lazy_mmu_nested = batch->active;
>>  
>> -	return LAZY_MMU_DEFAULT;
>> +	if (!lazy_mmu_nested) {
> Why not just?
>
> 	if (!batch->active) {

Very fair question! I think the extra variable made sense in an earlier
version of that patch, but now it's used only once and doesn't really
improve readability either. Will remove it in v2, also in patch 6
(basically the same code). Thanks!

- Kevin

