Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FC1CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4inpxhFhkgmpXIFh1LelZOuPMG5UZrs9ttHlFixPB0=; b=pYefi+6EXEH8FwOSBDCi3/F2ks
	9LSa+zxdPwjODQmqa7PsieVShDGh5MV//lY8BZWMdpTzqnI+Mps4cRoF8WXbB9YNdakorxMpw332O
	+c9zqKgqb4iWFma0t47x3SfhrMrAEdNvTqlPVYtmBPRLqySDG+5A7Um9zGg1Nn8epg1uFmYTvDGKH
	Dl+zSVRs6FrDPDoxaoXKejI6mXECWzJ0NiEqQK8u9V40x6o1cUCoWeYhbonkABN7Tjvjc3kigRPbr
	AQ7eNVb/HGB4ZWqs81Vfz/GmelrBNC6TRbkrHcoWJAjt8gLu6U9MKX+4SkjAno29bGT67/EakVfLK
	GbA4ytmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xET5U-00000002f88-0QY2;
	Wed, 07 Oct 2026 14:57:44 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xET5R-00000002f79-1x7a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791385054; bh=+4inpxhFhkgmpXIFh1LelZO
	uPMG5UZrs9ttHlFixPB0=; b=g2Rpcp2yg41zUSvrMMGpOtJD82qbH2OEfihycvkJjNQqyQSfvY
	2MJ6o5/hawBjFS86TmhuVxzo7VrPknxpP3vsd+SkRaOEgYsC+x5E9jJF37c3juoSWjtPnzSw/Dj
	LaHXfahhKJWssz/1NYCzB1EzUbVBJNW7aevPDBc4RosWR45vdNrQKLXXfMDGhv0WBKaJKzD1rjn
	lckUz/QmMv42J4iAxFlI7M4P0JjwKlrQmTZGqJOmtqAV2efBwmEjOuUjXtoa3PtFmMaaHsMStCr
	29+d4AmGA8eDUi2wxTPJYTnQXLK3T8tSGkEj3pRppftvkAZOwqU8uP1OkiiL8Ezitlw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791385054; bh=+4inpxhFhkgmpXIFh1LelZO
	uPMG5UZrs9ttHlFixPB0=; b=kP4Z3kqBWRCZnblKOPlNnCggOqUfnDNPmWSehAklZdkTvzRsUz
	7o0B1dM9bWKlYJj3jy3DxO/niMsvLsWYR4Dw==;
Date: Wed, 07 Oct 2026 15:57:35 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
CC: "Paul E. McKenney" <paulmck@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 leo.bras@arm.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RESEND=5D_arm64=3A_sleep=3A_factor_?=
 =?US-ASCII?Q?sleep=5Fsave=5Fstash_slot_lookup_into_a_macro?=
In-Reply-To: <6376e301-c6ef-4094-83de-83ea9d17791a@arm.com>
References: <20260919121044.13883-1-brads@mainlining.org> <29F5ED22-7DB5-4AF9-B999-CB3BAAB9A9E2@mainlining.org> <6376e301-c6ef-4094-83de-83ea9d17791a@arm.com>
Message-ID: <2442108F-EE55-40AB-A33C-DEFE0364F704@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_075741_661509_6B6A5AAF 
X-CRM114-Status: GOOD (  18.25  )
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

On 7 October 2026 07:45:18 BST, Vladimir Murzin <vladimir.murzin@arm.com>
wrote:
>On 10/4/26 14:05, Bradley Morgan wrote:
>> On 19 September 2026 13:10:44 BST, Bradley Morgan <brads@mainlining.org>
>> wrote:
>>> Both __cpu_suspend_enter() and _cpu_resume() open code the same
>>> MPIDR_EL1 hash lookup to find the current CPU's slot in
>>> sleep_save_stash. Factor it into a get_sleep_stash_slot
>>> macro.
>>>
>>> Since that macro would be the only remaining user of
>>> compute_mpidr_hash, inline the hash computation into
>>> get_sleep_stash_slot and just remove compute_mpidr_hash
>>> altogether.
>> +CC more people, polite ping on this patch guys! :)
>> 
>
>I'm not sure it makes the code clearer:
>
>- I see that Will suggested inlining compute_mpidr_hash, but to
>  my taste, a dedicated helper is easier to comprehend.

Hmm... It's a bit 50/50 to me.

>
>- The new get_sleep_stash_slot uses a mix of fixed and
>  parameterised registers, which forces the reader to look at how
>  the registers are used. Also using fixed registers shifts the
>  burden of making them available to the user of the macro.

Well, will, any justification?

The macro at the moment only has one user, so it's pointless to account
forusers at the moment..

>
>Just my 2p.
>
>Cheers
>Vladimir
>
>>> No functional change intended.
>>>
>>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>>> ---
>>> Resending from my new address.
>>>
>>> arch/arm64/kernel/sleep.S | 103 +++++++++++++++-----------------------
>>> 1 file changed, 41 insertions(+), 62 deletions(-)
>>>
>>> diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
>>> index f093cdf71be1..c1bec489ea76 100644
>>> --- a/arch/arm64/kernel/sleep.S
>>> +++ b/arch/arm64/kernel/sleep.S
>>> @@ -7,48 +7,48 @@
>>>
>>> 	.text
>>> /*
>>> - * Implementation of MPIDR_EL1 hash algorithm through shifting
>>> + * Compute the address of the current CPU's entry in sleep_save_stash,
>>> + * i.e. &sleep_save_stash[hash(MPIDR_EL1)], where the hash is an
>>> + * implementation of the MPIDR_EL1 hash algorithm through shifting
>>>  * and OR'ing.
>>>  *
>>> - * @dst: register containing hash result
>>> - * @rs0: register containing affinity level 0 bit shift
>>> - * @rs1: register containing affinity level 1 bit shift
>>> - * @rs2: register containing affinity level 2 bit shift
>>> - * @rs3: register containing affinity level 3 bit shift
>>> - * @mpidr: register containing MPIDR_EL1 value
>>> - * @mask: register containing MPIDR mask
>>> - *
>>>  * Pseudo C-code:
>>>  *
>>> - *u32 dst;
>>> + *	u64 mpidr = MPIDR_EL1 & mpidr_hash.mask;
>>> + *	u32 hash = ((mpidr & 0xff) >> mpidr_hash.shift_aff[0]) |
>>> + *		   ((mpidr & 0xff00) >> mpidr_hash.shift_aff[1]) |
>>> + *		   ((mpidr & 0xff0000) >> mpidr_hash.shift_aff[2]) |
>>> + *		   ((mpidr & 0xff00000000) >> mpidr_hash.shift_aff[3]);
>>> + *	slot = &sleep_save_stash[hash];
>>> + *
>>> + * @slot: output register
>>>  *
>>> - *compute_mpidr_hash(u32 rs0, u32 rs1, u32 rs2, u32 rs3, u64 mpidr,
>u64 mask) {
>>> - *	u32 aff0, aff1, aff2, aff3;
>>> - *	u64 mpidr_masked = mpidr & mask;
>>> - *	aff0 = mpidr_masked & 0xff;
>>> - *	aff1 = mpidr_masked & 0xff00;
>>> - *	aff2 = mpidr_masked & 0xff0000;
>>> - *	aff3 = mpidr_masked & 0xff00000000;
>>> - *	dst = (aff0 >> rs0 | aff1 >> rs1 | aff2 >> rs2 | aff3 >> rs3);
>>> - *}
>>> - * Input registers: rs0, rs1, rs2, rs3, mpidr, mask
>>> - * Output register: dst
>>> - * Note: input and output registers must be disjoint register sets
>>> -         (eg: a macro instance with mpidr = x1 and dst = x1 is
>invalid)
>>> + * Clobbers: x2 - x8
>>>  */
>>> -	.macro compute_mpidr_hash dst, rs0, rs1, rs2, rs3, mpidr, mask
>>> -	and	\mpidr, \mpidr, \mask		// mask out MPIDR bits
>>> -	and	\dst, \mpidr, #0xff		// mask=aff0
>>> -	lsr	\dst ,\dst, \rs0		// dst=aff0>>rs0
>>> -	and	\mask, \mpidr, #0xff00		// mask = aff1
>>> -	lsr	\mask ,\mask, \rs1
>>> -	orr	\dst, \dst, \mask		// dst|=(aff1>>rs1)
>>> -	and	\mask, \mpidr, #0xff0000	// mask = aff2
>>> -	lsr	\mask ,\mask, \rs2
>>> -	orr	\dst, \dst, \mask		// dst|=(aff2>>rs2)
>>> -	and	\mask, \mpidr, #0xff00000000	// mask = aff3
>>> -	lsr	\mask ,\mask, \rs3
>>> -	orr	\dst, \dst, \mask		// dst|=(aff3>>rs3)
>>> +	.macro get_sleep_stash_slot slot
>>> +	mrs	x3, mpidr_el1
>>> +	adr_l	x2, mpidr_hash
>>> +	ldr	x8, [x2, #MPIDR_HASH_MASK]
>>> +	/*
>>> +	 * Following code relies on the struct mpidr_hash
>>> +	 * members size.
>>> +	 */
>>> +	ldp	w4, w5, [x2, #MPIDR_HASH_SHIFTS]
>>> +	ldp	w6, w7, [x2, #(MPIDR_HASH_SHIFTS + 8)]
>>> +	and	x3, x3, x8			// mask out MPIDR bits
>>> +	and	x2, x3, #0xff			// aff0
>>> +	lsr	x2, x2, x4			// hash = aff0 >> shift_aff[0]
>>> +	and	x8, x3, #0xff00			// aff1
>>> +	lsr	x8, x8, x5
>>> +	orr	x2, x2, x8			// hash |= aff1 >> shift_aff[1]
>>> +	and	x8, x3, #0xff0000		// aff2
>>> +	lsr	x8, x8, x6
>>> +	orr	x2, x2, x8			// hash |= aff2 >> shift_aff[2]
>>> +	and	x8, x3, #0xff00000000		// aff3
>>> +	lsr	x8, x8, x7
>>> +	orr	x2, x2, x8			// hash |= aff3 >> shift_aff[3]
>>> +	ldr_l	\slot, sleep_save_stash
>>> +	add	\slot, \slot, x2, lsl #3	// slot = &sleep_save_stash[hash]
>>> 	.endm
>>> /*
>>>  * Save CPU state in the provided sleep_stack_data area, and publish
>its
>>> @@ -74,20 +74,8 @@ SYM_FUNC_START(__cpu_suspend_enter)
>>> 	mov	x2, sp
>>> 	str	x2, [x0, #SLEEP_STACK_DATA_SYSTEM_REGS + CPU_CTX_SP]
>>>
>>> -	/* find the mpidr_hash */
>>> -	ldr_l	x1, sleep_save_stash
>>> -	mrs	x7, mpidr_el1
>>> -	adr_l	x9, mpidr_hash
>>> -	ldr	x10, [x9, #MPIDR_HASH_MASK]
>>> -	/*
>>> -	 * Following code relies on the struct mpidr_hash
>>> -	 * members size.
>>> -	 */
>>> -	ldp	w3, w4, [x9, #MPIDR_HASH_SHIFTS]
>>> -	ldp	w5, w6, [x9, #(MPIDR_HASH_SHIFTS + 8)]
>>> -	compute_mpidr_hash x8, x3, x4, x5, x6, x7, x10
>>> -	add	x1, x1, x8, lsl #3
>>> -
>>> +	/* publish this CPU's sleep_stack_data area in its stash slot */
>>> +	get_sleep_stash_slot x1
>>> 	str	x0, [x1]
>>> 	add	x0, x0, #SLEEP_STACK_DATA_SYSTEM_REGS
>>> 	stp	x29, lr, [sp, #-16]!
>>> @@ -117,18 +105,9 @@ SYM_FUNC_START(_cpu_resume)
>>> 	mov	x0, x19
>>> 	bl	finalise_el2
>>>
>>> -	mrs	x1, mpidr_el1
>>> -	adr_l	x8, mpidr_hash		// x8 = struct mpidr_hash virt address
>>> -
>>> -	/* retrieve mpidr_hash members to compute the hash */
>>> -	ldr	x2, [x8, #MPIDR_HASH_MASK]
>>> -	ldp	w3, w4, [x8, #MPIDR_HASH_SHIFTS]
>>> -	ldp	w5, w6, [x8, #(MPIDR_HASH_SHIFTS + 8)]
>>> -	compute_mpidr_hash x7, x3, x4, x5, x6, x1, x2
>>> -
>>> -	/* x7 contains hash index, let's use it to grab context pointer */
>>> -	ldr_l	x0, sleep_save_stash
>>> -	ldr	x0, [x0, x7, lsl #3]
>>> +	/* retrieve this CPU's context pointer from its stash slot */
>>> +	get_sleep_stash_slot x1
>>> +	ldr	x0, [x1]
>>> 	add	x29, x0, #SLEEP_STACK_DATA_CALLEE_REGS
>>> 	add	x0, x0, #SLEEP_STACK_DATA_SYSTEM_REGS
>>> 	/* load sp from context */
>>>
>> --- Thanks!
>> "I'm not a very positive person" - Linus torvalds
>> 
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds

