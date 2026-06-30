Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25104C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3mOfrJH916cwXqr+ZvwGijVGpltGH97Y0po0aXz5kQ=; b=QK64CQuBHgjjo1fAtk35gKH4Vc
	GFfLFZs6nLnLHlQSIb0q0MR324Xh4j1uRZuzWPRHOLUExbn1BM/deq/TiH2UrXgOxUc+I5Kd0kKLO
	JDJ2BkBD2yhjDNnWXcg/zz0dk3L3PhmHLBIrZR+5GzVtM0rmAjb98+S/CI0XnEAXRaf8Kmji/EUQ+
	PWr/qSYNqM9y2AwDfdQj/N8UuWvreVRCOUHyDdAxMvwwZwj3OozJUQ+yL3EbjtSMzYArSGst3TkK5
	+JJUMb3+9zbPkUkie0LbM0/NIBDDb6ezyD27Jobn8kG0BD1NjNBpy3ArlrA4qCxtfaVw7t9hB7K9C
	xrj5+V1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUVM-0000000GMSi-37wV;
	Tue, 30 Jun 2026 09:11:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUVJ-0000000GMRo-2Ens
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:11:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDF6F2C1C;
	Tue, 30 Jun 2026 02:11:33 -0700 (PDT)
Received: from [10.57.81.132] (unknown [10.57.81.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B07BD3FAFB;
	Tue, 30 Jun 2026 02:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782810698; bh=Fp0iKtIQ8WSu99tEd8oJ9ZJXm1jtTIlwqw7RjhGDc+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hAZ/XGAW6u+JKDyTjbV6aaMnWKHnBmN3C6nhJhtMaxQUv8mY4WutOy1CIUH1h5PaP
	 P/y6MGDQDKu+Z19IQ0YpQlt8bdC9TQbsdY9hXxRS0fUKaQ9OtMPJ/oObIJO74x36xf
	 UBWKMVwAmj18UEiY9Kpxmydd0hlAYSLfzTocchLg=
Message-ID: <94cadab5-41c9-4127-aef3-14cb25415363@arm.com>
Date: Tue, 30 Jun 2026 11:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v8 01/24] mm: Introduce kpkeys
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Linus Walleij <linusw@kernel.org>
Cc: linux-hardening@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
 Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
References: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com>
 <20260526-kpkeys-v8-1-eaaacdacc67c@arm.com>
 <70f4dcdf-c45f-47d3-91df-a7897bd86ff4@kernel.org>
 <CAD++jL=km9hqTuTMFUhyx_QPuMEwWqmnUVQtPtMXnp8paHH1_A@mail.gmail.com>
 <9b11b0c0-dfc7-45ba-934e-19cd053e5635@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <9b11b0c0-dfc7-45ba-934e-19cd053e5635@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_021141_645943_40310136 
X-CRM114-Status: GOOD (  14.22  )
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

On 22/06/2026 20:38, David Hildenbrand (Arm) wrote:
> On 6/18/26 15:22, Linus Walleij wrote:
>> On Tue, Jun 16, 2026 at 5:19 PM David Hildenbrand (Arm)
>> <david@kernel.org> wrote:
>>
>>> Looking at this, and wondering about "why do we get registers involved in this
>>> API" I would probably have an interface like:
>>>
>>>         arch_kpkeys_enter_context()
>>>         arch_kpkeys_leave_context()
>>>
>>> Whereby you return a "struct kpkeys_state" or sth like that.
>> This is close to what I was looking for as well.
> Cool :)

That's probably what I was looking for too, without knowing it!

>> enter/leave makes the code look more like generic entry.
>>
>> Passing some kind of state cookie around is inevitable in
>> this design and IIUC Kevin argued that it would be inefficient
>> (another level of abstraction) as opposed to just hammering
>> in the context we want, where we want it.

I must have misunderstood what you meant in your previous comments, I
don't have a concern with performance here.

>>
>> But I think the compiler will optimize that out by constant
>> propagation if the backing architecture implementation is
>> simple.
> Yes, it should be wrapped somehow. I don't think this will be a problem
> performance-wise that cannot be solved differently.
>
> Returning an u64 ("register") here is really arm64-sepcific and should be
> abstracted.

Agreed. All this looks very much like the new lazy MMU API, and doing
something along the same lines seems perfectly reasonable.

- Kevin

