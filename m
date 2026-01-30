Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEEBE6BF1E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 16:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9R2B8FSLGFMC0OlwEN1WnPoEMECK3FEtwbgv3hWtqSY=; b=yVlsltV03nFjIhRF7Ntf91COkX
	W3NFqqgPqydx9G2iCuWVNxceP7r+DLWaSE/d6FLZepkNvuhPFfV0Na5Adrv3s4lxQVgDbFf+AW+rx
	5DEM/MiISLjKP5TDM+S9zDlY8wsajDc3VaW7S8gIEaGyvYFPQznOt/OCtaxKsBJHhPGkEkH2y+uiu
	WifGyZdy0ejOjSvNUGk97ORARnZ17DaeqjTNxgnvawt7NOHq7g294QdkdC59Q0nhPLK6pUDAGTIjP
	Su6BC16xXAu58PdAnVUaGxglhkVsjWujuoRQNBcS7l+oDolmtDALZ14wTGtwv5R0Fzgm4EoABya8n
	Bpkw87HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrAs-00000001hsX-3mZF;
	Fri, 30 Jan 2026 16:16:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrAq-00000001hs7-1JwM;
	Fri, 30 Jan 2026 16:16:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBCD143965;
	Fri, 30 Jan 2026 16:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D006C4CEF7;
	Fri, 30 Jan 2026 16:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769789802;
	bh=AlNS0o8O55cP7ZrafFrQalBO7KdanY5615Qax8Ig75c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hOS7PmZZrFc5HSN1dVXhZyg9M/cciPSolaQqfWhYDg7HfF1XDoB1HNjJxeiK86UnM
	 t0paeaoxtYjhwYcMLP8ehpw722gawXSmnt1Ff80sY7yEF5L7T7o1KVKgfa1P6xx/Uk
	 S7DHHq636jQuWcXVs9rBcbEQ2QAQvrKFpcJM6bhZnxkVAsJwslEvfWUX4cXWiSjnms
	 hkZcBfTLn6d4cw+9OyK7Jpzkky0ySo8aVXdV/3Vs41kEzOIubFCXlw7rvKNAruk9J0
	 NRQPKWhrHubAf3UrGWI3BkY7UvozmV6Ss4pPyWqiFlF2wY0RZojtLxb1ipESYS24SU
	 AnDTT8wKSbTgQ==
Message-ID: <993fb876-7958-4f1d-ba69-2601976a42d7@kernel.org>
Date: Fri, 30 Jan 2026 17:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] prandom: Add __always_inline version of
 prandom_u32_state()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
 <20260119130122.1283821-3-ryan.roberts@arm.com> <aXpArjZ1QQowshnA@zx2c4.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <aXpArjZ1QQowshnA@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_081644_393243_1850E4DD 
X-CRM114-Status: GOOD (  26.35  )
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



Le 28/01/2026 à 18:00, Jason A. Donenfeld a écrit :
> On Mon, Jan 19, 2026 at 01:01:09PM +0000, Ryan Roberts wrote:
>> We will shortly use prandom_u32_state() to implement kstack offset
>> randomization and some arches need to call it from non-instrumentable
>> context. So let's implement prandom_u32_state() as an out-of-line
>> wrapper around a new __always_inline prandom_u32_state_inline(). kstack
>> offset randomization will use this new version.
>>
>> Acked-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>   include/linux/prandom.h | 20 ++++++++++++++++++++
>>   lib/random32.c          |  8 +-------
>>   2 files changed, 21 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/linux/prandom.h b/include/linux/prandom.h
>> index ff7dcc3fa105..801188680a29 100644
>> --- a/include/linux/prandom.h
>> +++ b/include/linux/prandom.h
>> @@ -17,6 +17,26 @@ struct rnd_state {
>>   	__u32 s1, s2, s3, s4;
>>   };
>>   
>> +/**
>> + * prandom_u32_state_inline - seeded pseudo-random number generator.
>> + * @state: pointer to state structure holding seeded state.
>> + *
>> + * This is used for pseudo-randomness with no outside seeding.
>> + * For more random results, use get_random_u32().
>> + * For use only where the out-of-line version, prandom_u32_state(), cannot be
>> + * used (e.g. noinstr code).
>> + */
>> +static __always_inline u32 prandom_u32_state_inline(struct rnd_state *state)
> 
> This is pretty bikesheddy and I'm not really entirely convinced that my
> intuition is correct here, but I thought I should at least ask. Do you
> think this would be better called __prandom_u32_state(), where the "__"
> is kind of a, "don't use this directly unless you know what you're doing
> because it's sort of internal"? It seems like either we make this inline
> for everybody, or if there's a good reason for having most users use the
> non-inline version, then we should be careful that new users don't use
> the inline version. I was thinking the __ would help with that.

I looked into kernel sources and there are several functions named 
something_something_else_inline() and it doesn't mean those functions 
get inlined, so I would also prefer __prandom_u32_state() which means 
"If you use it you know what you are doing", just like __get_user() for 
instance.

However maybe we could also reconsider making it inline for everyone. We 
have spotted half a dozen of places where the code size increases a lot 
when forcing it inline, but those places deserve a local trampoline to 
avoid code duplication, and then the compiler decides to inline or not.

Because there are also several places that benefit from the inlining 
because it allows GCC to simplify the calculation, for instance when 
some calculation is performed with the result like with 
(prandom_u32_state(rng) % ceil) where ceil is 2 or 4.

That can of course be done as a followup patch but it means at the end 
we will have to rename all __prandom_u32_state() to prandom_u32_state().

Or should we do the other way round ? Make __prandom_u32_state() the 
out-of-line version and just change the few places where the size 
explodes like drm_test_buddy_alloc_range_bias(), loss_gilb_ell(), 
generate_random_testvec_config(), generate_random_sgl_divisions(), 
mutate_buffer(), ... ?

Christophe

