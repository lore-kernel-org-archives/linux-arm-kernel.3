Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F20D1F9C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 11:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVCBV6gKtnQy2rEAfBDSKKvn4qBqj1x+UGLpOf8yJyo=; b=svtG/+xVEMME6TGig44UJsF04b
	Y6LkKvB8MIS8SAHrpWnXmmnFShCrF0DaAJRUhFCridgQ4/6s+AyreM2bdF3+jELz1XQI/Ssj4loBa
	+P2vKvg0i6pyX+ef3z1RUzJD1siNxEmpgJrX2MB1WM/R7JugIUwhD807QsKaA74Epr+jkslOaX4Sb
	C81sBAGYluXp/Iys+TUfjCZWJfdtUbUfBb3A9QnFlMBfxrO3+YhQC3Yin1/FmEtGqvSqGzJvtHlaZ
	ezJ+9rFDD661db53bPlc/+RqE790wqJkoJjl1NdNG6vel9p3hvDK3wZmOvRJM+BHq5hZvlnBZIUOZ
	fM848O6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR7ts-00000007wSR-3y7N;
	Thu, 04 Dec 2025 11:53:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR7ts-00000007wSB-0z1R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 11:53:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35ECD601E6;
	Thu,  4 Dec 2025 11:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8423DC4CEFB;
	Thu,  4 Dec 2025 11:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764849210;
	bh=Zpl414Y6vefFz+0mGA9CipSOvbTehPYA0WM0ZAZ5yEc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l8F43iGu2V8NDUl3DIh/2+X2bfiJU3z4ZM3VULx8KpRVQtoH+xW7CH2tkww5ZTCxo
	 Z732odFWqfzHNQy5SzNM5XixZWclVhNfUhvGgJiGbPutM3AwRHmsLfNCAboCSPDTP/
	 mQ1qAy91zph5RvCXiIten7mneAop/GvZWqVrT+sRJH1n488UuXQMywvv0E8xZPYpO8
	 hem4mPeZ8WDhirZ3INCR8Hs8TJNiMUf1+2/EkXzuyFkWiHk2/yA/ki9bTau+qinvtl
	 uLvGed0JMtDUZ3H/ydu3YrDfOdvy/uR+aG5ySHHt6+QmCrIk7eopnc2uqCD/LCtR4b
	 NGvDZU/gQZlqA==
Message-ID: <0f08e893-6097-4ab1-8231-ac3304c51ee9@kernel.org>
Date: Thu, 4 Dec 2025 12:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-9-kevin.brodsky@arm.com>
 <23dcf752-0b75-45a7-84f8-25bddf97af08-agordeev@linux.ibm.com>
 <703cbee6-a813-4970-9232-34ee91ed8961@arm.com>
 <2c2b3382-7bdb-41a9-b48e-4fa9a44312ba@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <2c2b3382-7bdb-41a9-b48e-4fa9a44312ba@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 12/4/25 06:25, Anshuman Khandual wrote:
> 
> 
> On 03/12/25 1:50 PM, Kevin Brodsky wrote:
>> On 28/11/2025 14:55, Alexander Gordeev wrote:
>>>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>>>> + * currently enabled.
>>> The in_lazy_mmu_mode() name looks ambiguous to me. When the lazy MMU mode
>>> is paused are we still in lazy MMU mode? The __task_lazy_mmu_mode_active()
>>> implementation suggests we are not, while one could still assume we are,
>>> just paused.
>>>
>>> Should in_lazy_mmu_mode() be named e.g. as in_active_lazy_mmu_mode() such
>>> a confusion would not occur in the first place.
>>
>> I see your point, how about is_lazy_mmu_mode_active()?
> 
> Agreed - is_lazy_mmu_mode_active() seems better.

+1, I was scratching my head over this in previous revisions as well.

-- 
Cheers

David

