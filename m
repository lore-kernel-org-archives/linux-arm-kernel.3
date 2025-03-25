Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6491CC3600D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zkh//Nwn4vd5K3+FMDGZ31kXukMuY4E++vVHngzAac=; b=ysefeC7ueOV8ZM1ujcT61Hrnjq
	8SPTV2Z5rL3Is5r5vnt39GsFSc2tlAsudbyW+PGhaZEAx8Q9Kafg4E1MO72v7uDrUpu/BG6MCpczB
	J7VOSIpN0/RzVfjaMaKgeHvaXQaAET8i1dgQUqbXomQq4afKR4CU4gSE8sxpPn/1bm5QLBeGtQPXD
	cJzsaRRWgwOeBVD3kv12GkJPO8hoKVSSGVCzjgJzWqrCbmU9H2Dl4GXfcUvq0CpVTIAqgFtvm6ZpO
	yEdhbnI9MdijRs3XqStmPKokzoYuZR8inHr4baGn2rLnsRNFr6jyKwmOyryzZZzcdtTHDJWSdhcgB
	GvbWEFIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7X6-00000006Xol-1mh5;
	Tue, 25 Mar 2025 16:53:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6Nb-00000006MPr-0Z3N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:39:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1FBB43BCF;
	Tue, 25 Mar 2025 15:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E156EC4CEE4;
	Tue, 25 Mar 2025 15:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742917190;
	bh=vbJwrqZRlJ74yogkRhKOYB2AhjYmqZbq1qqH2mnl4vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/iyYhXJHtI1EiPtbVWpFTkfC1/gBAwzT5OTItcTlucLTfPQI7S23BxqJaiwPerSj
	 BQkgLqrfmW6GvEbej75iPlFyc32sbvlKP25eIowICGvBtkr/Z8+CElfgid9niU9fLr
	 yRRLMmQpEu/A0fJ0GkMLAQJfzmhxfut/P5fgUTZhxmDGZN1vCzHo+/RFH2VQkn587l
	 AomP9jB+y1UWrF8fA8pdd1lak34q7JunD4afC7jxJVi8n//nwtfI4wh9sd5tgVZfr4
	 7enM1GVKm7+C0jUsczIE4aq4k9tFia6HC6gESqYKSu8pkSZ0x3de5w4qGIKPdd6SRA
	 OhEebe4ETMbYQ==
Date: Tue, 25 Mar 2025 08:39:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
	Ard Biesheuvel <ardb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] ARM: Disallow kernel mode NEON when IRQs are disabled
Message-ID: <20250325153948.GB1661@sol.localdomain>
References: <20250324185927.1024543-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324185927.1024543-2-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_083951_192206_BBDAAAC5 
X-CRM114-Status: GOOD (  20.39  )
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

On Mon, Mar 24, 2025 at 07:59:28PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Commit
> 
>   c79f81631142 ("ARM: 9283/1: permit non-nested kernel mode NEON in softirq context")
> 
> relaxed the rules around the use of SIMD instructions in kernel mode on
> ARM, to allow such use when serving a softirq. To avoid having to
> preserve/restore kernel mode NEON state when such a softirq is taken,
> softirqs are now disabled when using the NEON from task context.
> 
> However, the fact that the softirq API does not allow unmasking of
> softirqs with interrupts disabled was overlooked, resulting in a WARN()
> in some cases, as reported by Guenter:
> 
>   WARNING: CPU: 0 PID: 1145 at kernel/softirq.c:369 __local_bh_enable_ip+0x118/0x194
>   Call trace:
>    unwind_backtrace from show_stack+0x10/0x14
>    show_stack from dump_stack_lvl+0x7c/0xac
>    dump_stack_lvl from __warn+0x7c/0x1b8
>    __warn from warn_slowpath_fmt+0x19c/0x1a4
>    warn_slowpath_fmt from __local_bh_enable_ip+0x118/0x194
>    __local_bh_enable_ip from crc_t10dif_arch+0xd4/0xe8
>    crc_t10dif_arch from crc_t10dif_wrapper+0x14/0x1c
>    crc_t10dif_wrapper from crc_main_test+0x178/0x360
>    crc_main_test from kunit_try_run_case+0x78/0x1e0
>    kunit_try_run_case from kunit_generic_run_threadfn_adapter+0x1c/0x34
>    kunit_generic_run_threadfn_adapter from kthread+0x118/0x254
>    kthread from ret_from_fork+0x14/0x28
> 
> While disabling softirqs is not really needed when running with IRQs
> disabled (given that the only way a softirq can be delivered
> asynchrously is over the back of an IRQ), let's not complicate this
> logic more than needed, and simply disallow use of the NEON in kernel
> mode when IRQs are disabled.
> 
> Another approach might be to only disable and re-enable softirqs if IRQs
> are enabled, but other than the test case above, there are no clear use
> cases for doing non-trivial arithmetic processing (hence using an
> accelerated SIMD implementation) with IRQs disabled.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/all/389b899f-893c-4855-9e30-d8920a5d6f91@roeck-us.net
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm/include/asm/simd.h | 3 ++-
>  arch/arm/vfp/vfpmodule.c    | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

- Eric

