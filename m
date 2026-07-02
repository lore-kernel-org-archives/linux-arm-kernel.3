Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F53C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 12:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KryUFmj5I4UTpBrd1Jc9vm0K78lMv0P8zEVp5e0wB44=; b=o6sIzwChSzB3UJgNhRG32vGxmb
	ZssE7vOoSFQ/Epe293XpsASrriWIuQyDMMVcFWxFwkPBB4hDTfr7OIZwe3Ae/zC6Zo2r86uSZ3TU/
	UXnnWbotW8AXW0fHs/Genq1+yPOmDwUiCmxlnM98ukWklbC7tIQG0Zn4N65a1c8vLMFyD+kflypYR
	uoDxF/t3RwhSTG0VU1HHx2VtnHyzBp0yExVQQ6PZt8OmuiYDhPYkuQ1azu8gfUAVcYAVFLPJ4Vy5X
	FPC/Al93IXPjHxT01UOZUUqllPN/DJTbiUZPXV+v4ecSzVlrwzhQLJWEhEv7z3872aSNyRqAgliOd
	VSGLannw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGct-00000004RcY-3kdI;
	Thu, 02 Jul 2026 12:34:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGct-00000004RcR-0VqB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 12:34:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7394843AB7;
	Thu,  2 Jul 2026 12:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7E91F000E9;
	Thu,  2 Jul 2026 12:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782995682;
	bh=KryUFmj5I4UTpBrd1Jc9vm0K78lMv0P8zEVp5e0wB44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OEdDe1hjvjem6WZCZF6PTZ2wdbFz90ZpDZGX4Pa92WUUAKl5LbCnNGpym2dcCVkBU
	 m9UUMNF/VSaXugW2HqPRInbs9ZbYLcWjnsuCkhvv+Zi/KdRGOZ/U1WSMrbGY+EfjIS
	 b8s5mRoqUa5gtWN5pVTJCnLhgHTI1pxJIOLjeZv8AMWOptrWR1sr4scTWf+vpzNANY
	 gXuk2De3q5BvLKMeFgXtEY4ALWTwaJ5h57nznFYBhGD9FLkY/DJXsWktiKTwcfbMzj
	 fn8KoKoOsWQ3EyOfF+NCwoCgZDTATEEbttsnMC0FAc6hTcnhD1TYG932riS6/kz0N7
	 yxpNiJq3JnvCw==
Date: Thu, 2 Jul 2026 13:34:34 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
	oleg@redhat.com, tglx@kernel.org, peterz@infradead.org,
	luto@kernel.org, kees@kernel.org, wad@chromium.org,
	mark.rutland@arm.com, yeoreum.yun@arm.com, linusw@kernel.org,
	kevin.brodsky@arm.com, ldv@strace.io, thuth@redhat.com,
	james.morse@arm.com, song@kernel.org, anshuman.khandual@arm.com,
	broonie@kernel.org, ryan.roberts@arm.com, pengcan@kylinos.cn,
	liqiang01@kylinos.cn, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 10/11] arm64: entry: Convert to generic entry
Message-ID: <akZa2tE0Gpsyi_TV@willie-the-truck>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-11-ruanjinjie@huawei.com>
 <cfa07466-225b-476f-adf9-346bd1377a4d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfa07466-225b-476f-adf9-346bd1377a4d@arm.com>
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

On Wed, Jun 24, 2026 at 04:32:17PM +0100, Ada Couprie Diaz wrote:
> On 11/05/2026 10:21, Jinjie Ruan wrote:
> > 3. Architecture-Specific Hooks (asm/entry-common.h):
> > - Implement arch_ptrace_report_syscall_entry() and _exit() by
> >    porting the existing arm64 logic to the generic interface.
> > 
> > - Add arch_syscall_is_vdso_sigreturn() to asm/syscall.h to
> >    support Syscall User Dispatch (SUD).
> Related to the above : I feel this is missing an important information.
> Given that SUD is only controlled by `CONFIG_GENERIC_ENTRY`,
> converting to generic entry _requires_ supporting SUD, so we do it here.
> I think this would be important to mention, as I otherwise felt like this
> change did not belong in this patch.
> 
> General question that follows : does it make sense to require an arch
> to support Syscall User Dispatch to be able to convert to generic entry ?
> (I assume not really, given that only `arch_syscall_is_vdso_sigreturn()` is
> required on the arch side, but I am curious)

I think SUD should be separated from generic entry. I'm certainly keen
on the latter for arm64 and far less interested in the former. See this
series from Gregory:

https://lore.kernel.org/all/20260627205551.769684-1-gourry@gourry.net/

Will

