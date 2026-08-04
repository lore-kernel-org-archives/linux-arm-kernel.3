Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C324CC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgTWTYiZtsLL252jzhK6t/u/NaO+f6tPB+OUfbA/M3w=; b=4pCFvXDzJzfstb6u58QEdkVK2D
	tWYWCXWX1kU9umFRuiXOIpBVmqIq76sZ6P9WYgUfy/kljPEJ0aIDnNnVCsmd9X3vDTxJFqo2nWom2
	3wsstMwtpa0T8yu5K3M8Kqyo47RM3A9+QE7WuSEr+X9+M9r+eYMEnFAV9HP5C7ZU1v2JynarG/kSA
	2Re0rNEfCH95Fno/4cR13FMANI8RsmCZUH4ITwUPdHlMOC0khg4OAf5cvNlzn4rsZwJjbfYg5Nqys
	yj8goxmyVY/ZCmjgMScY3a6lcQfqf1OuZf+vhMysi11YT9DO4QhAJfRQAdkSW/C6Vzp8r8NZFx5T7
	r+cRxF2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFlU-000000020K5-1g4d;
	Tue, 04 Aug 2026 14:05:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFlS-000000020Gm-0WMp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Aug 2026 14:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cgTWTYiZtsLL252jzhK6t/u/NaO+f6tPB+OUfbA/M3w=; b=RHMfKajLrs6qIutuERHZKGSZX1
	tZxs6Tb9qYSVkW0G6alw/bIgcYfgEocNClgZ16uFyD2YX2ZKX5F+wH3XkbhUV8JEGEUarZxr/fR8H
	hK9kr65K1Ir7bsJe9Wir5StiFMnYWaheaP251OBwS9JYqnKa2pmYXJAGhmhzs5ejwBtpHm/9saoGh
	LQZ6P4ivLQ9h0Xzt9fFk8un1EB3HTlcTWuZfjVwAfmzrBukR4RGQ/y5QmFqTJd3bj10ZwqZ4ak+QP
	RRusnOa1t4o1KnHRBTbnZQjF5R+8ihFYIw2Jb/jmQcxuZ16opJGIR5q+6CD9ywO02hnSaNdOYPNBZ
	d85lbuPQ==;
Received: from devianza.investici.org ([2c0f:f930:0:4::108])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrFlN-00000009yNh-0BBX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1785852296;
	bh=cgTWTYiZtsLL252jzhK6t/u/NaO+f6tPB+OUfbA/M3w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=U8+qGnTiM36R/wKp9hHENNY7RxjjBD+F+Qn1f3S5Cyoe6utAd0vYl2bd4Qtl6uBUA
	 7OcT/C0J6gMmFB1UoirkKFrRlssRowjIvaMZC9yZf/4JecO1GoKztLvbJAcsrnpXVP
	 8WlBIg+lgw3g2kcylWtigsaJRfhjNReaZ0VmhlGs=
Received: from mx2.investici.org (unknown [127.0.0.1])
	by devianza.investici.org (Postfix) with ESMTP id 4hDwKN4TSLz6vLQ;
	Tue, 04 Aug 2026 14:04:56 +0000 (UTC)
Received: by mx2.investici.org (Postfix) id 4hDwKN0B46z4y43;
	Tue, 04 Aug 2026 14:04:55 +0000 (UTC)
Date: Tue, 04 Aug 2026 15:04:54 +0100
From: Bradley Morgan <include@grrlz.net>
To: Will Deacon <will@kernel.org>
CC: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_arm64=3A_sleep=3A_factor_sl?=
 =?US-ASCII?Q?eep=5Fsave=5Fstash_slot_lookup_into_a_macro?=
In-Reply-To: <anHmgJgrPbd31Il8@willie-the-truck>
References: <20260717114746.15109-1-include@grrlz.net> <anHmgJgrPbd31Il8@willie-the-truck>
Message-ID: <7381A7B2-1993-4DC9-B09F-069E2D4A0E9C@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_150501_332257_3F3CFC22 
X-CRM114-Status: GOOD (  15.83  )
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

On 4 August 2026 14:17:52 BST, Will Deacon <will@kernel.org> wrote:
>On Fri, Jul 17, 2026 at 11:47:46AM +0000, Bradley Morgan wrote:
>> Both __cpu_suspend_enter() and _cpu_resume() open code the same
>> MPIDR_EL1 hash lookup to find the current CPU's slot in
>> sleep_save_stash. Factor it into a get_sleep_stash_slot
>> macro.
>> 
>> Since that macro would be the only remaining user of
>> compute_mpidr_hash, inline the hash computation into
>> get_sleep_stash_slot and just remove compute_mpidr_hash
>> altogether.
>> 
>> No functional change intended.
>> 
>> Signed-off-by: Bradley Morgan <include@grrlz.net>
>> ---
>> Changes since V1:
>> - Inline the macro, there only is one user. (Will)
>> - Also change the C psuedocode to be correct
>> 
>>  arch/arm64/kernel/sleep.S | 103 +++++++++++++++-----------------------
>>  1 file changed, 41 insertions(+), 62 deletions(-)
>> 
>> diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
>> index f093cdf71be1..dcf00a4d6233 100644
>> --- a/arch/arm64/kernel/sleep.S
>> +++ b/arch/arm64/kernel/sleep.S
>> @@ -7,48 +7,48 @@
>>  
>>  	.text
>>  /*
>> - * Implementation of MPIDR_EL1 hash algorithm through shifting
>> + * Compute the address of the current CPU's entry in sleep_save_stash,
>> + * i.e. &sleep_save_stash[hash(MPIDR_EL1)], where the hash is an
>> + * implementation of the MPIDR_EL1 hash algorithm through shifting
>>   * and OR'ing.
>>   *
>> - * @dst: register containing hash result
>> - * @rs0: register containing affinity level 0 bit shift
>> - * @rs1: register containing affinity level 1 bit shift
>> - * @rs2: register containing affinity level 2 bit shift
>> - * @rs3: register containing affinity level 3 bit shift
>> - * @mpidr: register containing MPIDR_EL1 value
>> - * @mask: register containing MPIDR mask
>> - *
>>   * Pseudo C-code:
>>   *
>> - *u32 dst;
>> + *	u64 mpidr = MPIDR_EL1 & mpidr_hash.mask;
>> + *	u32 hash = ((mpidr & 0xff) >> mpidr_hash.shift_aff[0]) |
>> + *		   ((mpidr & 0xff00) >> mpidr_hash.shift_aff[1]) |
>> + *		   ((mpidr & 0xff0000) >> mpidr_hash.shift_aff[2]) |
>> + *		   ((mpidr & 0xff00000000) >> mpidr_hash.shift_aff[3]);
>> + *	slot = &sleep_save_stash[hash];
>> + *
>> + * @slot: output register
>>   *
>> - *compute_mpidr_hash(u32 rs0, u32 rs1, u32 rs2, u32 rs3, u64 mpidr, u64
>mask) {
>> - *	u32 aff0, aff1, aff2, aff3;
>> - *	u64 mpidr_masked = mpidr & mask;
>> - *	aff0 = mpidr_masked & 0xff;
>> - *	aff1 = mpidr_masked & 0xff00;
>> - *	aff2 = mpidr_masked & 0xff0000;
>> - *	aff3 = mpidr_masked & 0xff00000000;
>> - *	dst = (aff0 >> rs0 | aff1 >> rs1 | aff2 >> rs2 | aff3 >> rs3);
>> - *}
>> - * Input registers: rs0, rs1, rs2, rs3, mpidr, mask
>> - * Output register: dst
>> - * Note: input and output registers must be disjoint register sets
>> -         (eg: a macro instance with mpidr = x1 and dst = x1 is invalid)
>> + * Clobbers: x2 - x8
>>   */
>> -	.macro compute_mpidr_hash dst, rs0, rs1, rs2, rs3, mpidr, mask
>> -	and	\mpidr, \mpidr, \mask		// mask out MPIDR bits
>> -	and	\dst, \mpidr, #0xff		// mask=aff0
>> -	lsr	\dst ,\dst, \rs0		// dst=aff0>>rs0
>> -	and	\mask, \mpidr, #0xff00		// mask = aff1
>> -	lsr	\mask ,\mask, \rs1
>> -	orr	\dst, \dst, \mask		// dst|=(aff1>>rs1)
>> -	and	\mask, \mpidr, #0xff0000	// mask = aff2
>> -	lsr	\mask ,\mask, \rs2
>> -	orr	\dst, \dst, \mask		// dst|=(aff2>>rs2)
>> -	and	\mask, \mpidr, #0xff00000000	// mask = aff3
>> -	lsr	\mask ,\mask, \rs3
>> -	orr	\dst, \dst, \mask		// dst|=(aff3>>rs3)
>> +	.macro get_sleep_stash_slot slot
>> +	mrs	x3, mpidr_el1
>> +	adr_l	x2, mpidr_hash
>> +	ldr	x8, [x2, #MPIDR_HASH_MASK]
>> +	/*
>> +	 * Following code relies on the struct mpidr_hash
>> +	 * members size.
>> +	 */
>> +	ldp	w4, w5, [x2, #MPIDR_HASH_SHIFTS]
>> +	ldp	w6, w7, [x2, #(MPIDR_HASH_SHIFTS + 8)]
>> +	and	x3, x3, x8			// mask out MPIDR bits
>> +	and	x2, x3, #0xff			// aff0
>> +	lsr	x2, x2, x4			// hash = aff0 >> rs0
>> +	and	x8, x3, #0xff00			// aff1
>> +	lsr	x8, x8, x5
>> +	orr	x2, x2, x8			// hash |= aff1 >> rs1
>> +	and	x8, x3, #0xff0000		// aff2
>> +	lsr	x8, x8, x6
>> +	orr	x2, x2, x8			// hash |= aff2 >> rs2
>> +	and	x8, x3, #0xff00000000		// aff3
>> +	lsr	x8, x8, x7
>> +	orr	x2, x2, x8			// hash |= aff3 >> rs3
>> +	ldr_l	\slot, sleep_save_stash
>> +	add	\slot, \slot, x2, lsl #3	// slot = &sleep_save_stash[hash]
>
>nit: In the old code, rs0-rs3 were arguments to the macro. Now that you've
>removed those, the comments are stale.
>
>Will
>

fair enough, gimme 5 or 10 and I'll fix that real quick because I have
time.. thanks for the review!

Thanks!

