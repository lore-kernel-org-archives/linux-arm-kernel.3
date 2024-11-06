Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B2DD44D57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRu3U7TUo0Hx7e9QqYQ6NdG3rIvTztattNfWqBF7hKU=; b=GAX+cJzBpsdiyK/TJU7lypRok9
	FEiQhSHjS0b7ws9S2754aPBO3HVumYkRtiN31Js5PoV2TXtKewVD1ZDff/9iblxfX6ejkiqp3yqGi
	SMdOU0PTIyn3x21OagknlWFSTYCW7BwuqdRcfT2DNEFGQWYcS3Q7m7fN4Dv/xrCwYXroraXpwn2Js
	lGnpNv2CQ6odTwNk82pEEJn3ezIGObiMOo3y9DCzsgn6Nwa31yaFMxXRL3wHgxnuR9bzgSUuciy66
	Q6hMGA8381irADxL9v/ZFnkf83lodsoCs10Z2RbL0XBbYAFh0pfgmwXw3laWbXcTEu9bLlPoU0Ck8
	puij6ewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fFq-00000003D9R-2eE3;
	Wed, 06 Nov 2024 12:35:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eRN-00000002xxS-0sYd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:43:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 608FEA435E7;
	Wed,  6 Nov 2024 11:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46F5C4CECD;
	Wed,  6 Nov 2024 11:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730893392;
	bh=CZlxUMF7h6qY7n2j8niZdY+BvTgqh4tqKKQndIQgF1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f55ksqmW4WB2ytuUuaXqtOk6lZw8OU1h4fp86og9ZiCOIrMBrE56cTF38d2+5GMu7
	 RSx7v4nNpm3AYPjXHPDyHlzDP0hBlB8hOk/HMZ5ZmqQpWIcJEonVGFgVvOASKI2Xyd
	 YtJwHV7PoP5fIKWwwT0r4zCG0pKoLDeB7lP16WpRXeL1XJKtcY/m3vFTDPBeAoy47/
	 MbtHn3oXogSwreZvOTbEJFIQlcWBw6/KsIsmU+PRtStWAvMUjrci7TvZxitmIHLKCk
	 wvEs4Os+qFnvW6z1kAdtHpan1tvKOx5EZYKz3it1Arl35EeafMmG9mpb/Y0m9S5Ib5
	 1Bq/ZfwniUT7g==
Date: Wed, 6 Nov 2024 11:43:03 +0000
From: Will Deacon <will@kernel.org>
To: Haris Okanovic <harisokn@amazon.com>
Cc: ankur.a.arora@oracle.com, catalin.marinas@arm.com,
	linux-pm@vger.kernel.org, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	pbonzini@redhat.com, wanpengli@tencent.com, vkuznets@redhat.com,
	rafael@kernel.org, daniel.lezcano@linaro.org, peterz@infradead.org,
	arnd@arndb.de, lenb@kernel.org, mark.rutland@arm.com,
	mtosatti@redhat.com, sudeep.holla@arm.com, cl@gentwo.org,
	misono.tomohiro@fujitsu.com, maobibo@loongson.cn,
	joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH 2/5] arm64: add __READ_ONCE_EX()
Message-ID: <20241106114302.GB13801@willie-the-truck>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com>
 <20241105183041.1531976-1-harisokn@amazon.com>
 <20241105183041.1531976-3-harisokn@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105183041.1531976-3-harisokn@amazon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_034313_405803_DC36CDB7 
X-CRM114-Status: GOOD (  19.12  )
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

On Tue, Nov 05, 2024 at 12:30:38PM -0600, Haris Okanovic wrote:
> Perform an exclusive load, which atomically loads a word and arms the
> exclusive monitor to enable wfet()/wfe() accelerated polling.
> 
> https://developer.arm.com/documentation/dht0008/a/arm-synchronization-primitives/exclusive-accesses/exclusive-monitors
> 
> Signed-off-by: Haris Okanovic <harisokn@amazon.com>
> ---
>  arch/arm64/include/asm/readex.h | 46 +++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 arch/arm64/include/asm/readex.h
> 
> diff --git a/arch/arm64/include/asm/readex.h b/arch/arm64/include/asm/readex.h
> new file mode 100644
> index 000000000000..51963c3107e1
> --- /dev/null
> +++ b/arch/arm64/include/asm/readex.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Based on arch/arm64/include/asm/rwonce.h
> + *
> + * Copyright (C) 2020 Google LLC.
> + * Copyright (C) 2024 Amazon.com, Inc. or its affiliates.
> + */
> +
> +#ifndef __ASM_READEX_H
> +#define __ASM_READEX_H
> +
> +#define __LOAD_EX(sfx, regs...) "ldaxr" #sfx "\t" #regs
> +
> +#define __READ_ONCE_EX(x)						\
> +({									\
> +	typeof(&(x)) __x = &(x);					\
> +	int atomic = 1;							\
> +	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> +	switch (sizeof(x)) {						\
> +	case 1:								\
> +		asm volatile(__LOAD_EX(b, %w0, %1)			\
> +			: "=r" (*(__u8 *)__u.__c)			\
> +			: "Q" (*__x) : "memory");			\
> +		break;							\
> +	case 2:								\
> +		asm volatile(__LOAD_EX(h, %w0, %1)			\
> +			: "=r" (*(__u16 *)__u.__c)			\
> +			: "Q" (*__x) : "memory");			\
> +		break;							\
> +	case 4:								\
> +		asm volatile(__LOAD_EX(, %w0, %1)			\
> +			: "=r" (*(__u32 *)__u.__c)			\
> +			: "Q" (*__x) : "memory");			\
> +		break;							\
> +	case 8:								\
> +		asm volatile(__LOAD_EX(, %0, %1)			\
> +			: "=r" (*(__u64 *)__u.__c)			\
> +			: "Q" (*__x) : "memory");			\
> +		break;							\
> +	default:							\
> +		atomic = 0;						\
> +	}								\
> +	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
> +})

I think this is a bad idea. Load-exclusive needs to be used very carefully,
preferably when you're able to see exactly what instructions it's
interacting with. By making this into a macro, we're at the mercy of the
compiler and we give the wrong impression that you could e.g. build atomic
critical sections out of this macro.

So I'm fairly strongly against this interface.

Will

