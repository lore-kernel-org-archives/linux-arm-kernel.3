Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE413D35173
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IW0PASnMVAjlBLEguxjOPUC3IAQErNlq4jA16yKJ0mU=; b=qBe13P427Vsq1BUZyPafWVnQo1
	OSq2qTAQhJIBTj3EfMdMvmLNip7+7l4bOqZDFQD3PCOOnzY8/wV3UghKWd7XfDN0QILUfe0Tlm1Ec
	FMWZqBIe2LHqoWtANk5zVh3KreArJQXzWRcRqhaZyxNQ9dKYt+13KRhu0M4egZHqCqjUDLGOvu4vS
	vHXaHL24Abce5C9vhDHwWCks7oyL7hMBrQ7pt2c7MfJ37t9erx9+V4CRIJnPNygA9wL1mJSrM8x4U
	MNpYi+bKs3+DHumwiaRQUoeBMpCAEF4OiJxZvvJ9YNl3e6tlxVFMKrG/VPEhFL9GWJVMbZT3HfxoJ
	OuEszCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tER-0000000EZ8M-2wDo;
	Wed, 01 Apr 2026 10:55:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tEO-0000000EZ69-3gmZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:55:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43486288E;
	Wed,  1 Apr 2026 03:55:22 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B90D3F915;
	Wed,  1 Apr 2026 03:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775040928; bh=2UQIkCCHHnYMJL08xGfBrcE6awkfKjIUqvN58fjiAvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TRSFkRwVSzNZv1EfCfPXSKYVmxX06QSVIiXB2oC0ctF9sgb4BPVkTz4/bL14wnBvP
	 tl/+mjzRctRS3PPkAAMR8vWfJH17iSvGYZ9S6iCow39/5NMpdbDUSVX7JsWwj0Vlqi
	 NDVqY+hrLmqDreFqsDGT4UNSUnA0+gRm1bAfF/Nk=
Date: Wed, 1 Apr 2026 11:55:20 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, oleg@redhat.com,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, arnd@arndb.de,
	shuah@kernel.org, kevin.brodsky@arm.com, yeoreum.yun@arm.com,
	anshuman.khandual@arm.com, thuth@redhat.com, ryan.roberts@arm.com,
	mark.rutland@arm.com, song@kernel.org, ziyao@disroot.org,
	linusw@kernel.org, schuster.simon@siemens-energy.com,
	jremus@linux.ibm.com, akpm@linux-foundation.org,
	mathieu.desnoyers@efficios.com, kmal@cock.li, dvyukov@google.com,
	reddybalavignesh9979@gmail.com, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v14 3/4] arm64: Use generic TIF bits for common thread
 flags
Message-ID: <acz5mOrm6_E1UBwV@arm.com>
References: <20260320104222.1381274-1-ruanjinjie@huawei.com>
 <20260320104222.1381274-4-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320104222.1381274-4-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_035528_966692_40B56DCE 
X-CRM114-Status: GOOD (  10.73  )
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

On Fri, Mar 20, 2026 at 06:42:21PM +0800, Jinjie Ruan wrote:
> Use the generic TIF bits defined in <asm-generic/thread_info_tif.h> for
> standard thread flags (TIF_SIGPENDING, TIF_NEED_RESCHED, TIF_NOTIFY_RESUME,
> TIF_RESTORE_SIGMASK, TIF_SINGLESTEP, etc.) instead of defining
> them locally.
> 
> Arm64-specific bits (TIF_FOREIGN_FPSTATE, TIF_MTE_ASYNC_FAULT, TIF_SVE,
> TIF_SSBD, etc.) are renumbered to start at bit 16 to avoid conflicts.
> 
> This enables RSEQ optimizations which require CONFIG_HAVE_GENERIC_TIF_BITS
> combined with the generic entry infrastructure (already used by arm64).
> 
> By the way, remove TIF_FREEZE because this flag became unused since
> commit d88e4cb67197 ("freezer: remove now unused TIF_FREEZE").
> 
> Cc: Thomas Gleixner <tglx@kernel.org>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Given that it's touching multiple trees, I guess it's a series for
Andrew?

-- 
Catalin

