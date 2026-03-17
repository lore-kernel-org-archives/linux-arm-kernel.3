Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41528FB5EA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 03:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIA5bzRUo/kqjvuSbXtkhZ0/jdS0vsz2MPNHxmrgJFE=; b=Z8JwnXNN7ApG9ahKf/056EuiQK
	YaXPiaHw2HQyl5iqmlYCpXZ7r5MlGXqbP7ldV827nGil0wuci4+sJRhvEi0pvk58GwW8GKGBqNbm1
	Ddg6Oj6ZTG0/B5DZ0Tnmfp5YmsOQYdJDT3DNlGvX+cd41QSBMtUrdAGmhunT3ehUhj4A02QglqHjN
	MUltWS3+IVvY1XqlVGfVXGSuiSqHNORVVe4XW/SKfgHXomlDrU2jPU/KoZPnZARNqqq5fifngcbOp
	sCHdumUPRIlC1jrw/bPcaHJ09//U5UFPtEplCK3YFQppiMJzQOmSP3vKkNHBVf5OWu5KneGPRdqc1
	xZoTAjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Klb-00000005HQQ-1XKc;
	Tue, 17 Mar 2026 03:06:47 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2KlZ-00000005HPX-2Qnh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 03:06:46 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-41729dc7d7aso1940915fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 20:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773716803; x=1774321603; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pIA5bzRUo/kqjvuSbXtkhZ0/jdS0vsz2MPNHxmrgJFE=;
        b=O+ONBUeC2Ydk2uIeTn7HSjsKWlkyQuIfbHTTeOYaTKtbfuwpOe5l0i+5rV1trR0no7
         2WtF7D4fVFhB/ehzkd4vpEe4+KrGEDooqDzVhtwNvjlDNDBX37TS3/pK2k6JlG6Lk/NP
         oIG1Owfu/CadNA6869Cw2fE52RoFVZXv4E3dvfoZ550uJTtSvsijamzt4Ql15Q0fRy/F
         BS5qSI7Ecw13iF165u0AxOQyX3x6bUlxVrV0pGOgWdIfp3oXSzqZ+SnJ2Xe5pZC8ZHMV
         O5z72x1yyp1tpzl5dGyqKAou7nU9YXL2KBR/zncTzBRRC955GUOQEB312GSn9FviRCFO
         l5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773716803; x=1774321603;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIA5bzRUo/kqjvuSbXtkhZ0/jdS0vsz2MPNHxmrgJFE=;
        b=rwdk+Jq4MdiRLle2iiGS/FHLsj/i36N2EsSf25ojPRIU1ZrttidduHWAE3j6zwLHTi
         affL4mLyV+at12gnFQB3aMvKwFK1PUIiSOYugXTiCEFH73wHX+ZurotLIe45q338+rUb
         nrMeqMn1kDNkX1SRbza7RwOd3oIpmhiH2SgbXmvzZwLWRB8hGoOM8h18cKoXayA2BmId
         JyvLpUAohP8PhM2Z9CVc9+tKwCiHmvpQiQw86hx48VI4jP9jL41Ocmayp0z3HvNL1UDA
         wcoT+BMCqHx1GSUzZ28YxgSnreDVLf0uQPBgez+Ljb28QKi6AX+xVheMefWD9pE7E4yc
         BYgg==
X-Forwarded-Encrypted: i=1; AJvYcCVtmqeMUETQz9CF6LauKrQ5farabldbMkeK9vGoQl8O1s3vTRUZZL+riiZKP8STJaBKXMo2jvZrPR+EEp2n/OO5@lists.infradead.org
X-Gm-Message-State: AOJu0YwUwaQzZ20O8nFKDnuYLbCeY362dCGr/cXRwsWPCFcmns5VBXe4
	JhggEZwdbUl/AZGPOn1DXZOtSirwSbEJWyw/pChosni0zPcoP9Keiirdbi6QGjn0OZ4=
X-Gm-Gg: ATEYQzwuJdu/hPHyoYFblosc/CnUCG0osNfS/0/l8LLZY0Kw1DlNnmZBXglYapQ74gO
	C6e+FoNCMNReAkMU/IBm4rypRuiL/dE+EWHZGyjSFNJbv/tV6JPBZY3H6mwcLRg0h3FNE9MGAMF
	MiI/59FTCKA/V5XW3CmepsG2hGGqIVBuSIRcZUX+Nm4iQR5+Nst82DrUaz+x5MLNN00iI44eT3e
	bM8R/Nj9gMIWzQlwFGpNQ1e2uXZ3JLtewFQP+46V65pVHQ6owaUM0rKN5Sl8GXaJ2oMq7ERD315
	SYNGS4n/iw5N3gVcIx1rJHnRMrEUAdHlOLXRKth7pbid2RqOhE5JCf371cUofHq8Mi02JcXzaeL
	X40OiEStWN3nWJhEyxtYcrzFRbp2EBqHT9pP5lxkt9uGbZzaiwG0SMGUpwvNX1EssR//lOdCRt3
	4RAprdoFuIXsu52orTKOiDUEfA0//yTxjAbXzobVxj
X-Received: by 2002:a05:6870:c154:b0:40e:a338:c8a1 with SMTP id 586e51a60fabf-417b9072c62mr8995239fac.11.1773716802857;
        Mon, 16 Mar 2026 20:06:42 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e1f9f86sm18099947fac.2.2026.03.16.20.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 20:06:42 -0700 (PDT)
Message-ID: <f25ed5b8-e785-414a-b13e-85c1a787665d@sifive.com>
Date: Mon, 16 Mar 2026 22:06:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 7/7] futex: Use runtime constants for
 __futex_hash() hot path
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
 "H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Charles Mirabile <cmirabil@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
References: <20260316052401.18910-1-kprateek.nayak@amd.com>
 <20260316052401.18910-8-kprateek.nayak@amd.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260316052401.18910-8-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_200645_676242_AADFA104 
X-CRM114-Status: GOOD (  24.64  )
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

Hi Prateek,

On 2026-03-16 12:24 AM, K Prateek Nayak wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> Runtime constify the read-only after init data  __futex_shift(shift_32),
> __futex_mask(mask_32), and __futex_queues(ptr) used in __futex_hash()
> hot path to avoid referencing global variable.
> 
> This also allows __futex_queues to be allocated dynamically to
> "nr_node_ids" slots instead of reserving config dependent MAX_NUMNODES
> (1 << CONFIG_NODES_SHIFT) worth of slots upfront.
> 
> No functional chages intended.
> 
>   [ prateek: Dynamically allocate __futex_queues, mark the global data
>     __ro_after_init since they are constified after futex_init(). ]
> 
> Link: https://patch.msgid.link/20260227161841.GH606826@noisy.programming.kicks-ass.net
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de> # MAX_NUMNODES bloat
> Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>  include/asm-generic/vmlinux.lds.h |  5 +++-
>  kernel/futex/core.c               | 42 +++++++++++++++++--------------
>  2 files changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index 1e1580febe4b..86f99fa6ae24 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -975,7 +975,10 @@
>  		RUNTIME_CONST(shift, d_hash_shift)			\
>  		RUNTIME_CONST(ptr, dentry_hashtable)			\
>  		RUNTIME_CONST(ptr, __dentry_cache)			\
> -		RUNTIME_CONST(ptr, __names_cache)
> +		RUNTIME_CONST(ptr, __names_cache)			\
> +		RUNTIME_CONST(shift, __futex_shift)			\
> +		RUNTIME_CONST(mask,  __futex_mask)			\
> +		RUNTIME_CONST(ptr,   __futex_queues)
>  
>  /* Alignment must be consistent with (kunit_suite *) in include/kunit/test.h */
>  #define KUNIT_TABLE()							\
> diff --git a/kernel/futex/core.c b/kernel/futex/core.c
> index cf7e610eac42..6b5c5a1596a5 100644
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -45,23 +45,19 @@
>  #include <linux/mempolicy.h>
>  #include <linux/mmap_lock.h>
>  
> +#include <asm/runtime-const.h>
> +
>  #include "futex.h"
>  #include "../locking/rtmutex_common.h"
>  
> -/*
> - * The base of the bucket array and its size are always used together
> - * (after initialization only in futex_hash()), so ensure that they
> - * reside in the same cacheline.
> - */
> -static struct {
> -	unsigned long            hashmask;
> -	unsigned int		 hashshift;
> -	struct futex_hash_bucket *queues[MAX_NUMNODES];
> -} __futex_data __read_mostly __aligned(2*sizeof(long));
> +static u32 __futex_mask __ro_after_init;
> +static u32 __futex_shift __ro_after_init;
> +static struct futex_hash_bucket **__futex_queues __ro_after_init;
>  
> -#define futex_hashmask	(__futex_data.hashmask)
> -#define futex_hashshift	(__futex_data.hashshift)
> -#define futex_queues	(__futex_data.queues)
> +static __always_inline struct futex_hash_bucket **futex_queues(void)
> +{
> +	return runtime_const_ptr(__futex_queues);
> +}
>  
>  struct futex_private_hash {
>  	int		state;
> @@ -439,14 +435,14 @@ __futex_hash(union futex_key *key, struct futex_private_hash *fph)
>  		 * NOTE: this isn't perfectly uniform, but it is fast and
>  		 * handles sparse node masks.
>  		 */
> -		node = (hash >> futex_hashshift) % nr_node_ids;
> +		node = runtime_const_shift_right_32(hash, __futex_shift) % nr_node_ids;
>  		if (!node_possible(node)) {
>  			node = find_next_bit_wrap(node_possible_map.bits,
>  						  nr_node_ids, node);
>  		}
>  	}
>  
> -	return &futex_queues[node][hash & futex_hashmask];
> +	return &futex_queues()[node][runtime_const_mask_32(hash, __futex_mask)];
>  }
>  
>  /**
> @@ -1913,7 +1909,7 @@ int futex_hash_allocate_default(void)
>  	 *   16 <= threads * 4 <= global hash size
>  	 */
>  	buckets = roundup_pow_of_two(4 * threads);
> -	buckets = clamp(buckets, 16, futex_hashmask + 1);
> +	buckets = clamp(buckets, 16, __futex_mask + 1);
>  
>  	if (current_buckets >= buckets)
>  		return 0;
> @@ -1983,10 +1979,19 @@ static int __init futex_init(void)
>  	hashsize = max(4, hashsize);
>  	hashsize = roundup_pow_of_two(hashsize);
>  #endif
> -	futex_hashshift = ilog2(hashsize);
> +	__futex_mask = hashsize - 1;
> +	__futex_shift = ilog2(hashsize);

__futex_mask is always a power of two minus 1, in other words all low bits set.
Would it be worth using an n-bit zero extension operation instead of an
arbitrary 32-bit mask? This would use fewer instructions on some architectures:
for example a single ubfx on arm64 and slli+srli on riscv.

Regards,
Samuel


