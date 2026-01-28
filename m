Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13499D46BE2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ygJA/z8hSL5aorTjtSi2FNVBOEwpYfcofUZ6rF/wUA=; b=cKUKPRmpz+obsOMEuLuSHf8MwG
	1iK7qLqkkKo7ObHcj2nYeHwAbWFySwwZE26WV4h46C0EBQYFWu9AEzSxWxs1Rosj6d9eXOLYcaAvb
	7HdMuC/d6LAJMzTe/pfW0RkdAihdk/Jo4b5SN1FwjiY+1kYWSaog1J2Xp58McIYc/mA+/FzcSdnUK
	5IZrdbVHZ6ei77bhke9OoN2C7nqHBC9tbXdBXU8QAH8fQGRvm8yliT6OFGZvRGGLGCwiyfdInowDR
	n1pLTXzMnKYIeUa6mlecUvIBfsPDljUgKuqBtXAv9lUnLJpo021J9sZEljI0r8BLnP4kTcQWWneEj
	869OvNhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Q2-0000000GV9B-2AOX;
	Wed, 28 Jan 2026 17:33:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Q0-0000000GV7b-26IM;
	Wed, 28 Jan 2026 17:33:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64D841516;
	Wed, 28 Jan 2026 09:33:17 -0800 (PST)
Received: from [10.1.36.159] (unknown [10.1.36.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 800BC3F632;
	Wed, 28 Jan 2026 09:33:20 -0800 (PST)
Message-ID: <670c2b78-02e2-4617-80d9-3c896077f02a@arm.com>
Date: Wed, 28 Jan 2026 17:33:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] prandom: Add __always_inline version of
 prandom_u32_state()
Content-Language: en-GB
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aXpArjZ1QQowshnA@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_093328_675956_ACF69431 
X-CRM114-Status: GOOD (  21.70  )
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

On 28/01/2026 17:00, Jason A. Donenfeld wrote:
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
>>  include/linux/prandom.h | 20 ++++++++++++++++++++
>>  lib/random32.c          |  8 +-------
>>  2 files changed, 21 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/linux/prandom.h b/include/linux/prandom.h
>> index ff7dcc3fa105..801188680a29 100644
>> --- a/include/linux/prandom.h
>> +++ b/include/linux/prandom.h
>> @@ -17,6 +17,26 @@ struct rnd_state {
>>  	__u32 s1, s2, s3, s4;
>>  };
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

I'm certainly happy to do that, if that's your preference. I have to respin this
anyway, given the noinstr issue.

> 
> Jason


