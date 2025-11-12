Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A8CCD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iYFkq8EoSIFdFM4yiltEoa/A9Iy/iMJWrMfuUMJqAY=; b=q9Wqi5tiOjlOpX/fIm/KsvcM9p
	KPsisowRRAN4Z2zSjoIvhJn25Qw7zqR08u+hd6uVGqEijaVCxvKrS2DVz9wMKX5VEr3NiQFYNiy+H
	VCciN0rv+yX/U39MOfCHW6/CSafdoRc715ZDLxJgaEHXyIFIZRt0U10xvXOU5aSBpU18mi3+LBNkR
	v/O5Kcd1CFm8er2hyAyDJvmT0UOStrdGPuyKubZEqdeU5nCTA1+2Eq9maOAHmrqKM0VFUT64m7x6O
	K0jP1zwUuAhV706g6ujv3+abImiSNLky0cV9lUyngAkOeY02Etkm/7aaTReXK7JQodxKOk+Wch+Gs
	OOMV9pDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBM9-00000008tNp-19XX;
	Wed, 12 Nov 2025 13:57:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBM8-00000008tNg-2SMa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:57:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6148D60213;
	Wed, 12 Nov 2025 13:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29847C2BCB4;
	Wed, 12 Nov 2025 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762955871;
	bh=wyYh5JA+N7mRZY7BRonX9hRu7lWf6kG2xADXz4mWKHk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uDdn5b0TMd79Lh5gGh2J4WjGYOU7mL3bVuBbQ/VXgzY4nMQRUASwOOOn1wPdm3Cym
	 W4XE28wEzp5MfEzdP2hqphehcMkmvAS/b8w6wcpUiLZxYE0rCMGLEp+rVCdW9qI4ba
	 ocobM87q4/c0/j7wdbVyzm/yrXe8KetWir7vwxyUiRXtVNS/+8DnZ7OaB4HqMTf7u6
	 36VSYtBbbyHuGEXAGGvXe/GFkuJFAWR+xBF55ycy4xXYzkSJweCr6O/7vY6qeuk4iJ
	 2JAYXvNk5KDLXblAvdwOWYLaBc3JfMXId6w7fnEaMQeOyF/yR5GPTl+Yi8z7SCHe3i
	 /nZPR2FUDupLg==
Message-ID: <ba3cf0c1-174e-4e86-b464-7c5c15a803d8@kernel.org>
Date: Wed, 12 Nov 2025 14:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
To: Kevin Brodsky <kevin.brodsky@arm.com>, Ryan Roberts
 <ryan.roberts@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <999feffa-5d1d-42e3-bd3a-d949f2a9de9d@arm.com>
 <cc9dc398-b9c5-4bb8-94ad-7e7f3ddd5b4f@arm.com>
 <824bf705-e9d6-4eeb-9532-9059fa56427f@arm.com>
 <58fd1a6e-f2c4-421c-9b95-dea4b244a515@arm.com>
 <8f70692c-25a9-4bd0-94ab-43ab435e4b1b@arm.com>
 <cdb4b97a-415b-4dba-877b-0cd570381a6d@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <cdb4b97a-415b-4dba-877b-0cd570381a6d@arm.com>
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


>>>
>>> I don't really mind either way, but I don't see an immediate use for [C]
>>> and [D] - the idea is that the paused section is short and controlled,
>>> not made up of arbitrary calls.
>> If my thinking above is correct, then I've already demonstrated that this is not
>> the case. So I'd be inclined to go with [D] on the basis that it is the most robust.
>>
>> Keeping 2 nesting counts (enable and pause) feels pretty elegant to me and gives
>> the fewest opportunities for surprises.
> 
> Agreed, if we're going to allow enable() within a paused section, then
> we might as well allow paused sections to nest too. The use-case is
> clear, so I'm happy to go ahead and make those changes.
> 
> David, any thoughts?

I don't mind allowing nesting of pause(), so works for me.

-- 
Cheers

David

