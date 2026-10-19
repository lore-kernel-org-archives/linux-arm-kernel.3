Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF37760AF7B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 15:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ChexoILq;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IyKOB0u4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5w6n7C93rznRx0B8aTof4n/gsiFepIY/4SkbXWOOz4=; b=ChexoILqbNoCn0
	Eqo2QyaD90VCoOQbCn1sNtN2DEr8NqDZHsFOLysL5Jsg1SQREdWXaUpWienZYHzX+AR38gGMQQInq
	Sn21kGmubGiEB261tMd13aRE1fhjPx6iVYUl454wh7GJhDkDkgERwCK+ZAkXYwc2Tt8VZurAxme2p
	9+x7SVjkJsaKL3o5ICHdViypsJcPoX11zdhIBU/SLOzledH3Tb/9kDKnUyWy3NtbicuR1CyVXAGaG
	7ZdN0Yg1SKzbadask2J3Ewuk80l8HVruBu4lMg0pq3q+3VhIl2TZn2hbn4CGzYHZrtIR0hraLn9MH
	1BPG7SaAqIcEkQVwpTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIpEP-00000007qIu-3yi0;
	Mon, 19 Oct 2026 15:24:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIpEM-00000007qI0-2Mbk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 15:24:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C28B71682;
	Mon, 19 Oct 2026 08:24:47 -0700 (PDT)
Received: from [10.57.14.104] (unknown [10.57.14.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82B123F7D8;
	Mon, 19 Oct 2026 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792423491; bh=fUJq4x7W8uUmWcrxqlX9gFs0/3XiMrcu6X7imKdvcd8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IyKOB0u41pReAFM+KNxrtQpCnOPpm6zmMR9jaUOVR8a7u+v3LxdkED8RqS5yjXCQ+
	 H6v7ek6j7sdOohjNX8si7CO7b1f+WEbT+Cf9zXICPLTn6iv5IdvfNMWDDBMqPPurPt
	 TyRFVYF6QVOgpRoHTxMnKmo8eEfu2Hoit5eu2Ik8=
Message-ID: <ab3a7145-b658-4dbd-b8ac-cb0fd1af4276@arm.com>
Date: Mon, 19 Oct 2026 16:24:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: insn: make `aarch64_insn_gen_d{m,s}b()`
 alternative-safe
To: Vladimir Murzin <vladimir.murzin@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20261016165140.254791-1-ada.coupriediaz@arm.com>
 <20261016165140.254791-3-ada.coupriediaz@arm.com>
 <5f1c9d90-2269-4e46-9a20-e8152153384c@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <5f1c9d90-2269-4e46-9a20-e8152153384c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_082454_695243_99469CC2 
X-CRM114-Status: GOOD (  32.65  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Barry Song <baohua@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, Lucas Wei <lucaswei@google.com>, Andre Przywara <andre.przywara@arm.com>, Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Tejun Heo <tj@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vladimir,

On 19/10/2026 11:49, Vladimir Murzin wrote:
> Hi Ada,
>
> On 10/16/26 17:51, Ada Couprie Diaz wrote:
>> Move `aarch64_insn_gen_d{m,s}b()` and `__get_barrier_crm_val()`
> __get_barrier_crm_val()/__is_valid_barrier_type() has gone, so
> reference to it confuses.
Ah, my bad indeed, I forgot to take it out when reworking this part.
>> to `insn.h` and mark them `__always_inline`.
>> Replace the error print by an inline build-time check
>> now that the compiler can verify all call sites.
> My understanding is that error printing is not alternative-safe,
> so we replace it with a build-time check. The latter requires the
> barrier type to be visible to the compiler, hence moving the
> helper to a header and marking it __always_inline (with the side
> effect that the code may be inlined into noinstr functions).
That is correct !
> However, is it safe to assume that the barrier type will always
> be visible to the compiler? This is true today, but I can imagine
> a scenario where the barrier type is passed through a helper
> defined in a separate translation units, making it impossible for
> the compiler to observe its value at build time. I'm not sure
> whether this is something we should worry about right now.
You are right that an indirect call with variable barrier types would
lead to a build failure, even for "valid" code.
The current helpers in BPF are defines and have fixed barrier types,
which works great with this.

I think that being able to statically verify the validity of instruction
generation is a strongly desired characteristic, so I would be happy
prohibiting other uses that would prevent this.
However, I understand that there is a tradeoff here and that
not everyone might find the benefit worth it.

As it stands, it doesn't impact users of the `aarch64_insn_...`
functions, so now might be the time to think about what we
want here, rather than later when there would be other constraints.
> Another thing I'm wondering about is how we plan to make other
> helpers alternative-safe. Do we eventually intend to move all of
> them into header?
>
> I also noticed that we're not entirely consistent with error
> reporting across helpers. In several cases, we simply return
> AARCH64_BREAK_FAULT without printing anything to the log. Perhaps
> a better approach to making these helpers alternative-safe would
> be to remove error printing altogether, mark them noinstr, and
> return AARCH64_BREAK_FAULT whenever we cannot construct a valid
> opcode?
There's indeed a lot of inconsistency and other helpers not
covered here. Originally[1], I did try to make all the helpers used
in alternative patching safe and this already required to touch
many different helpers which were not really consistent.

As the goal was to make alternative patching safe, I did indeed
move as many helper functions to be `__always_inline` and thus
to the header, as I wanted to benefit from the static validation
that provided.

Trying to phrase my thinking process : to me, it feels like
generating instructions is something that, as much as possible,
should never be able to fail at runtime. Because then, what do
we do if we tried to generate an instruction, and fail ?
For alternative patching, that might be an immediate `BUG()`,
but there might be little to work around the issue
until a fix is made upstream, which could have otherwise been
detected during building...
All of that to say that we /could/ standardize on returning
`AARCH64_BREAK_FAULT` when failing to generate an instruction,
but to me it feels more like a liability that we should try to remove.

Very interested by other's thoughts on this question !

>> As BPF is the only caller, with static arguments, only accept
>> non-deprecated types for each barrier, as per Arm ARM DDI 0487
>> version M.c[0], and update `A64_DMB_ISH` accordingly.
>>
>> As all functions are now inlined and do not call any instrumentable
>> function, they are now safe to call in alternative callbacks.
>>
>> [0]: https://support.arm.com/documentation/ddi0487/mc/
>>           (See C6.2.150, C6.2.152)
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> ---
>> [...]
>> diff --git a/arch/arm64/net/bpf_jit.h b/arch/arm64/net/bpf_jit.h
>> index b2fe6e6dcf44..08d514b40a5b 100644
>> --- a/arch/arm64/net/bpf_jit.h
>> +++ b/arch/arm64/net/bpf_jit.h
>> @@ -324,7 +324,7 @@
>>   #define A64_NOP    A64_HINT(AARCH64_INSN_HINT_NOP)
>>   
>>   /* DMB */
>> -#define A64_DMB_ISH aarch64_insn_gen_dmb(AARCH64_INSN_MB_ISH)
>> +#define A64_DMB_ISH aarch64_insn_gen_dmb(AARCH64_INSN_MB_SY)
>>   
> ISH - This option has the same behavior as SY and is deprecated.
>
> so conversion is valid.
>
> Cheers
> Vladimir
>
Thanks for the review !
Kind regards,
Ada

[1]: 
https://lore.kernel.org/r/20250923174903.76283-1-ada.coupriediaz@arm.com

