Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E5F106703C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 14:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLA5JYoGXJGnQljxY6lPgatook6+qmmFHpbjGJ03qMs=; b=0mSZjGzIwHyac1evg4F/A6KrgR
	fMC/noclzyJCG2EsQgRUTlDzasAWoRB76US8qI0qMsGVDesMj6j1MeXA2CF1iNCKb/bTBZd8IaKUS
	UGqdgl/ETYD+nAv76WRlgYXRURB3f/+I75yLwJWgkriOzH+FCTfMNYFkPW4DN2Ga3YdIUTCfQPlM0
	5DaPhickj3IeiSXEPI9BD3ITVlAZh6cRKjguAQjKwGJwJO6GhHP0fMU4RXs+26HPuCqjbNrhiPdhB
	xTOcIZ8Tug8lMFH9m59EKo0I6IPELOloUGoCxIs+H//sKFaaxX4KIrmk1mD7jbLpiBW7N7DC75Jjj
	cOVh4P0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hQX-0000000EGC9-109M;
	Thu, 12 Mar 2026 14:54:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hQT-0000000EGBl-1qu1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 14:54:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96F68165C;
	Thu, 12 Mar 2026 07:54:05 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AFE73F7BD;
	Thu, 12 Mar 2026 07:54:09 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:54:06 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, will@kernel.org, maz@kernel.org,
	oupton@kernel.org, miko.lenczewski@arm.com, kevin.brodsky@arm.com,
	broonie@kernel.org, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, joey.gouly@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v15 4/8] arm64: futex: refactor futex atomic operation
Message-ID: <abLTji8bbO3b3i3r@arm.com>
References: <20260227151705.1275328-1-yeoreum.yun@arm.com>
 <20260227151705.1275328-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227151705.1275328-5-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_075413_524304_3696BE8B 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
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

On Fri, Feb 27, 2026 at 03:17:01PM +0000, Yeoreum Yun wrote:
> -#define __futex_atomic_op(insn, ret, oldval, uaddr, tmp, oparg)		\
> -do {									\
> +#define LLSC_FUTEX_ATOMIC_OP(op, insn)					\
> +static __always_inline int						\
> +__llsc_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
> +{									\
>  	unsigned int loops = FUTEX_MAX_LOOPS;				\
> +	int ret, oldval, newval;					\
>  									\
>  	uaccess_enable_privileged();					\
> -	asm volatile(							\
> +	asm volatile("// __llsc_futex_atomic_" #op "\n"			\
>  "	prfm	pstl1strm, %2\n"					\
> -"1:	ldxr	%w1, %2\n"						\
> +"1:	ldxr	%w[oldval], %2\n"					\
>  	insn "\n"							\
> -"2:	stlxr	%w0, %w3, %2\n"						\
> +"2:	stlxr	%w0, %w[newval], %2\n"					\

Looking again at this as I originally reviewed the series without the
positional operands.

Can you not use only named operands instead of mixing them? The same
comment for all other asm changes in this file.

-- 
Catalin

