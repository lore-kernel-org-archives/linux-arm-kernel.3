Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFC1C3601B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JeqvOReHWh/bsTIrcVRAGVDKWqZxvYEbZDt95bTYXk=; b=A5eCeJscI2MFVFU3PKHPu7cjAa
	Non3vMIR5WM1Mgl05I2FBm7Y0o7vBShp7WNixJY4R2GaQzVQzeB4DfA74CT+8d2mxZE0moiOw5B3f
	mbtSlvOuUiWV15TwnoBp5936P14HMl8uZ1SyCfE/gRS6GW4Ii2wzOqU9hLlTv4vgp27F0cC0M/Mmv
	Wgt+DByyHr9CU+nWkJnwBXOM1Rzdmplf2/gsu5VChONSLncWGBJiPBxkCL5/lHAlVmue1J5P6Oge+
	LcAis0ofhFadP+k6SFjOJrxBqyH+MmWaTcb9/pBXPzZGb6UCAnqkkbBUMEh2aO4JIiyA9hEz9+yUy
	v9J78+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0bxB-0000000B590-0zq3;
	Fri, 04 Apr 2025 07:59:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0bvN-0000000B51W-1QRL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 07:57:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77F131063;
	Fri,  4 Apr 2025 00:57:12 -0700 (PDT)
Received: from [10.57.71.100] (unknown [10.57.71.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26D223F59E;
	Fri,  4 Apr 2025 00:57:05 -0700 (PDT)
Message-ID: <107650bf-a8c1-4a71-a302-2e80abd5d062@arm.com>
Date: Fri, 4 Apr 2025 09:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 00/15] pkeys-based page table hardening
To: Maxwell Bland <mbland@motorola.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Andy Lutomirski <luto@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org
References: <20250203101839.1223008-1-kevin.brodsky@arm.com>
 <a32cjyekuecoowzbitc2xykilvpu6l3jjtityp7x5hw7xbiysp@5l2lptwmqiug>
 <802963a0-32bd-49e8-82b1-34443acdd5ae@arm.com>
 <epnxrdkidbrjyjzapms7dfsvjcc7ewewjue7khbuxhresy5x5n@hyhokacdi2yg>
 <bcaa98c0-4218-470d-981d-9ab0894d3b1b@arm.com>
 <rzmxyxnufxrti7nxw3i25dil4bcqjzwqty4alwikm7bgbpjbju@dx5leafgss5l>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <rzmxyxnufxrti7nxw3i25dil4bcqjzwqty4alwikm7bgbpjbju@dx5leafgss5l>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_005713_474478_AC2E7ECD 
X-CRM114-Status: GOOD (  46.43  )
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

On 28/03/2025 17:15, Maxwell Bland wrote:
> [...]
>
> However, the "real" idea here is:
>
> (1) "splitting up" each RW data structure ($X$) into mutable and non-mutable
> parts would be difficult and difficult to maintain, so I was looking for
> a solution outside of that.
> (2) The primitive we do have, thanks to POE and this patch, is
> the ability to make a page of memory writable only from a specific
> context, and read only otherwise.
> (3) The well-trodden solution is to allocate a field on a second,
> independent page $p$ when allocating $X$, with some field/hash/magic to
> guarantee the integrity of writes to the immutable fields of $X$
> (sometimes called shadow memory).
>
> Valid, CFI-guaranteed functions would have access to $p$, and would
> be instrumented to update $p$ with a new hash of the fields of $X$
> when updating $X$, but likely something more performance-friendly.
> When readig from $X$, the data is pulled from $p$ to ensure the
> field being read from $X$ is valid and has not been modified. It is
> not possible to modify $p$ outside of the valid contexts in which
> we can modify the read-mostly or constant fields of $X$.
>
> Importantly, this does not rely on the confidentiality of $p$, which I
> think was an issue with trying an approach like this with ARM MTE
> previously, or at least the version of ARM MTE that Juhee Kim et al. at
> Georgia Tech broke with speculative exectuion, iirc.
>
> I think performance is difficult here, but that's more of a development
> concern, I hope, than a concern in theory.

Thank you for elaborating, this is much clearer now. I suppose this
requires that all read-mostly fields are accessed via helpers that will
check/update $p$. Painful when those fields are directly accessed today,
as in the case of task_struct, but the required changes are hopefully
easy to automate (using Coccinelle for instance). And as you point out
further down, this could be done via a compiler attribute instead. The
performance impact on reads is clearly a concern, but it is not an
all-or-nothing scheme - we can choose which members are protected,
meaning we can make trade-offs.

Overall this seems worth investigating. I wonder, have you considered
how accessors would find the shadow memory? It could of course be linked
directly from task_struct, but then nothing prevents that pointer from
being corrupted. I can't think of another cheap way to link $p$ though.
This is not a full-blown shadow memory approach, so I'm not sure we can
reserve a whole chunk of the address space for that purpose.

>> [...]
>>
>> A different angle would be use an attribute to mark struct members,
>> rather than functions. That would instruct the compiler to switch kpkeys
>> level whenever that member is written (and only then). You would
>> probably want to forbid taking the address of the member too, as the
>> compiler can't easily track that. That said this doesn't solve the
>> bigger issue of existing code expecting to be able to write to other
>> members in the struct. It most likely works only if the kpkeys switch is
>> done when writing to any member of the struct (which may get very
>> expensive).
> We agree. Doing something like this doesn't crash stuff, but it makes
> the phone sluggish and terrible to use. (-: Hence, I may try the above:
> keep the struct read-write, but when reading from "critical fields"
> (pointers to function pointers), require the compiler to inject a check
> for an integrity value stored on a mostly-read-only page. That integrity
> value can only be updated by code that is resonsible for writing said
> critical fields.
>
> Since the supposition is things like f_ops don't really need to change
> much ($p$ does not need to be accessed much), and otherwise the data
> structure is fully writable, the performance impact seems like it would
> not be significant.

Agreed, it doesn't have to be very expensive if used sparingly.

> That said, and if I am not mistaken, the downside is it'd require
> Clang/GCC support, same as CFI.

Indeed. For experimenting a Coccinelle script to convert direct access
to certain members to a function call is probably easier :)

>
>>> [...]
>>> Noticed as well, just now, the reliance on the static_key for branch
>>> unlikely ... the following data structure (at the end of this email) may
>>> be of interest as an FYI ... it can be used to track whether the kernel
>>> self patching API is only being used to patch expected locations.
>>>
>>> I use this right now with additional checks that the instruction being
>>> written for the indirect branch matches the expected offset.
>> Are there exploits out there corrupting the address of a static branch?
>> This seems difficult to me in practice because the __jump_table section
>> where the addresses of instructions to be patched are stored is marked
>> __ro_after_init.
> There are a couple of different ways. You can do the attack this patch
> is intended to prevent, change the page tables unwillingly to give
> yourself permissions to write to the static key struct as part of a
> larger chain, there's the ability to inject code into a kernel
> module to call the patch text API and use it as a write gadget for the
> rest of the kernel, etc..

Right. I'd argue that static keys are not your biggest worry if the
attacker can control page tables or call arbitrary functions - and in
fact kpkeys are easily defeated if the attacker is able to modify the
control flow (one could simply call kpkeys_set_level()).

> There were a lot of claims back in the day that kernel code would be
> marked strictly read-only by the EL2 secure monitor or kernel proection
> systems, but there's self-modifying code built right into it under many
> KConfigs. To have a guarantee of CFI you kind of have to ensure the
> kernel can't patch itself.

Self-patching is used extensively on boot (on arm64 at least) to support
optional extensions such as POE. I suppose this kind of patching isn't
really a concern as it occurs very early. Static keys can be used at any
point and are therefore more dangerous, but the performance uplift is
likely significant in many cases.

- Kevin

