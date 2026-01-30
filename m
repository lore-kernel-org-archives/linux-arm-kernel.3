Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38C2E6BF1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mh3exhkonU1Gf9pge3mRJuPjuTBZP+7nM/nKjCyUulk=; b=mG5ezB3FtSiYfztwyqzSef9e6U
	t1J6eH8+Br3hVkppzatJ0aBtlrqBfqrt2E75ccAllnXaciRJ4vk9+kNu7Wl7nAqxwTa4GtGdRtN0Q
	Do24hwqdb/UZzantaMqKiIpFEcZvHvdxezkF/fzqyifWlJM6el5MYO3xtLEl456QYO6eDeX5HqOSm
	rvpEWnGF5oVaImSMjjURRVPt8ecdPnQ/LU1DtZzq4bqwSPA9j6DNBOzj3A4YcmlIsXzhmHHeorXrl
	Fk2JedLNcHGTBHYzRg49iNEuRhVoBGmKPTHeZHTBLQkXZzjwqXITTK2KLh4nkKuNbxgJxKAD8ZQ4h
	nNxUMisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlq9p-00000001ceq-0jhm;
	Fri, 30 Jan 2026 15:11:37 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlq9m-00000001ceV-16vM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 15:11:35 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1259261f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 07:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769785892; x=1770390692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh3exhkonU1Gf9pge3mRJuPjuTBZP+7nM/nKjCyUulk=;
        b=MfU65r/OH7Bh9rYCv3Y6qT4eWDdIRor8j/tFVqFXGo1UMYFpvlC9sviQoos+lv6WcL
         m2Kgquj8lEpTVrmVT+s3B8GIARpseHrcQkaymy9emlzWBgdZc0JbSPLUOWhMNEKevRYU
         W/WpHwjGJjmEZtZheUTyC4HkNAV97gtHJq0ZcQglrNtUsDPAfWbzEbMhm70cFG7+lyzq
         AdyyUiDo7gcnRbwHbPbP9DpTF8Asa/EcQnXjO9CALyk3b3qbodNPT2qOlB2xRp6/7ICU
         YT9gCyI7WFTbpW2rAKuCN7kDnMF+G1OYUNZigRPNd/UyZWrkSDprxW54jBCa3YOpxuR9
         sPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769785892; x=1770390692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mh3exhkonU1Gf9pge3mRJuPjuTBZP+7nM/nKjCyUulk=;
        b=SpnpHy68C16VODaa/H+S0pe0kBwurR/wPjizbskXk9wddPDbjrBfA1Zk7/eibvSTpX
         UwcDUUxKqiG6mF2VKIuh99H9I8ydo4Jpsyfh6GZdmwxJGDnvaz4STmsLxRKN+MQ7Z1Bq
         5fdCIZel0BSZDtm2Gpqyoskdxpr85+kjR1V3nDvmmYtxoKpXbrXUw4ssfUAsXaSz826K
         Ou+yOTTWZ6HlKkXGgBPwkcWVwIppfOBliUZZf2MLQfln7hZlt+ilBXEY2rRV4MA4oLxc
         EE9KL30M5l6QOcnjhBPPmd+les08WKGblZgUPTaTLlgRyF+tFCgkMzlBuR5Wi1PwKVUx
         7qxg==
X-Forwarded-Encrypted: i=1; AJvYcCW7kA/41Y72fg15uQ2WZMB9LABDpUXOEavCKCCHRlaqtwJ1thquHxXS64LOrNphVibzv9DhucyYnRf0ZmodD2pJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzQkSOfag9Tnoc+u/DBv76ui1tfomzFlpaRUt6BgIqfiNQQrR6c
	gr7jAvl3R0O9DNKeJCrNq1lDKBoUbirv9ZFjfrEUutDDXETmPI7a47ai
X-Gm-Gg: AZuq6aJV/X6+jNuP4ttSZzma/w4pVaYJdf8QnCv2riVT9udji6RikZeqnvsJQClbxct
	47WZD53dBhpb+ccRkiTwm4/GEReag0QesVi0QxVe8m/0A8bwalyNWZ1rpV+mf/ReSbKBN6zEfey
	Dop6LjhPlp5mjUzxNpbuB2KzlBhzK6n1pze82UH4b+1O2BfImO3bJKuxpT9UnUWZG6sOCj962fq
	xfzvmdGXowHx+27CcTP/siuNIPgNHvQQkXSOi+sIe4XcPXE5qBKerBmO2rCJRiiJTtFyxujTGBn
	AjzPplhDNWiSP0gvijn61xGIY52M9+8NRCAmLt3iyZX2D9PcAp5K2waaNzfd6Xdvn+2sULf1ncK
	/QxqPRUBpL3fLoTS25nHjyBfjPDTtoxWZAiLr4LhHHbpljFT1wHY9KUV2Nlrom1HEJvPFQJCcBY
	pChYDzq3Nc7zCZh0pewauR5e7CFXx/XBT3O3Zvz0eCmcs85UDnSIhm
X-Received: by 2002:a05:6000:601:b0:435:9d70:f2a6 with SMTP id ffacd0b85a97d-435f3abc64cmr4554670f8f.63.1769785891782;
        Fri, 30 Jan 2026 07:11:31 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfccsm21939238f8f.17.2026.01.30.07.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:11:31 -0800 (PST)
Date: Fri, 30 Jan 2026 15:11:30 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260130151130.6026999b@pumpkin>
In-Reply-To: <20260130132951.2714396-3-elver@google.com>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-3-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_071134_360350_D383B380 
X-CRM114-Status: GOOD (  33.79  )
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

On Fri, 30 Jan 2026 14:28:25 +0100
Marco Elver <elver@google.com> wrote:

> Rework arm64 LTO __READ_ONCE() to improve code generation as follows:
> 
> 1. Replace _Generic-based __unqual_scalar_typeof() with more complete
>    __rwonce_typeof_unqual(). This strips qualifiers from all types, not
>    just integer types, which is required to be able to assign (must be
>    non-const) to __u.__val in the non-atomic case (required for #2).
> 
> Once our minimum compiler versions are bumped, this just becomes
> TYPEOF_UNQUAL() (or typeof_unqual() should we decide to adopt C23
> naming).  Sadly the fallback version of __rwonce_typeof_unqual() cannot
> be used as a general TYPEOF_UNQUAL() fallback (see code comments).
> 
> One subtle point here is that non-integer types of __val could be const
> or volatile within the union with the old __unqual_scalar_typeof(), if
> the passed variable is const or volatile. This would then result in a
> forced load from the stack if __u.__val is volatile; in the case of
> const, it does look odd if the underlying storage changes, but the
> compiler is told said member is "const" -- it smells like UB.
> 
> 2. Eliminate the atomic flag and ternary conditional expression. Move
>    the fallback volatile load into the default case of the switch,
>    ensuring __u is unconditionally initialized across all paths.
>    The statement expression now unconditionally returns __u.__val.
> 
> This refactoring appears to help the compiler improve (or fix) code
> generation.
> 
> With a defconfig + LTO + debug options builds, we observe different
> codegen for the following functions:
> 
> 	btrfs_reclaim_sweep (708 -> 1032 bytes)
> 	btrfs_sinfo_bg_reclaim_threshold_store (200 -> 204 bytes)
> 	check_mem_access (3652 -> 3692 bytes) [inlined bpf_map_is_rdonly]
> 	console_flush_all (1268 -> 1264 bytes)
> 	console_lock_spinning_disable_and_check (180 -> 176 bytes)
> 	igb_add_filter (640 -> 636 bytes)
> 	igb_config_tx_modes (2404 -> 2400 bytes)
> 	kvm_vcpu_on_spin (480 -> 476 bytes)
> 	map_freeze (376 -> 380 bytes)
> 	netlink_bind (1664 -> 1656 bytes)
> 	nmi_cpu_backtrace (404 -> 400 bytes)
> 	set_rps_cpu (516 -> 520 bytes)
> 	swap_cluster_readahead (944 -> 932 bytes)
> 	tcp_accecn_third_ack (328 -> 336 bytes)
> 	tcp_create_openreq_child (1764 -> 1772 bytes)
> 	tcp_data_queue (5784 -> 5892 bytes)
> 	tcp_ecn_rcv_synack (620 -> 628 bytes)
> 	xen_manage_runstate_time (944 -> 896 bytes)
> 	xen_steal_clock (340 -> 296 bytes)
> 
> Increase of some functions are due to more aggressive inlining due to
> better codegen (in this build, e.g. bpf_map_is_rdonly is no longer
> present due to being inlined completely).
> 
> Signed-off-by: Marco Elver <elver@google.com>

Having most of the comment in the commit message and a short one in the
code look good.

I think it will also fix a 'bleat' from min() about a signed v unsigned compare.
The ?: causes 'u8' to be promoted to 'int' with the expected outcome.

Reviewed-by: David Laight <david.laight.linux>@gmail.com

> ---
> v3:
> * Comment.
> 
> v2:
> * Add __rwonce_typeof_unqual() as fallback for old compilers.
> ---
>  arch/arm64/include/asm/rwonce.h | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index fc0fb42b0b64..42c9e8429274 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -19,6 +19,20 @@
>  		"ldapr"	#sfx "\t" #regs,				\
>  	ARM64_HAS_LDAPR)
>  
> +#ifdef USE_TYPEOF_UNQUAL
> +#define __rwonce_typeof_unqual(x) TYPEOF_UNQUAL(x)
> +#else
> +/*
> + * Fallback for older compilers (Clang < 19).
> + *
> + * Uses the fact that, for all supported Clang versions, 'auto' correctly drops
> + * qualifiers. Unlike typeof_unqual(), the type must be completely defined, i.e.
> + * no forward-declared struct pointer dereferences.  The array-to-pointer decay
> + * case does not matter for usage in READ_ONCE() either.
> + */
> +#define __rwonce_typeof_unqual(x) typeof(({ auto ____t = (x); ____t; }))
> +#endif
> +
>  /*
>   * When building with LTO, there is an increased risk of the compiler
>   * converting an address dependency headed by a READ_ONCE() invocation
> @@ -32,8 +46,7 @@
>  #define __READ_ONCE(x)							\
>  ({									\
>  	typeof(&(x)) __x = &(x);					\
> -	int atomic = 1;							\
> -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> +	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> @@ -56,9 +69,9 @@
>  			: "Q" (*__x) : "memory");			\
>  		break;							\
>  	default:							\
> -		atomic = 0;						\
> +		__u.__val = *(volatile typeof(*__x) *)__x;		\
>  	}								\
> -	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(*__x) *)__x);\
> +	__u.__val;							\
>  })
>  
>  #endif	/* !BUILD_VDSO */


