Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A1DC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkAGU6LWX82KhGHMyKQ/4qYY0MyGhtQbf/71Bs2AxE0=; b=sNnNKYMgb9JJipJ/TFETELZKBH
	TdpQDCMtBzbKKSrHo5mFD9cnNzvZwtoi3wCF/xs1rYR5Aw+7HEdtJHqVtQxIntX8JrU4I0IrI9BHq
	eM0HXkU9Tgi4+ifTnq7XfvFnEZp8YhRPYjMQsUs8IYaFaC9z8SwJpTL2wzszDuSv2vIsT7XkBZSEA
	oieDe3k5XKociTSdC6IRumd1Q0uYwgJ99WGUgK5RwiF0XSZmoVtKvPv0eHa9C4yMDk8FZ19nrpZGf
	Cz+9jI8g4yzgn9bd6/2icBAPxWFAo0AelqR8C6Dy4ejbUv29MHxnTJiF54iv32v+e9/bcEm3Z8sB6
	EaDXl+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCcP-0000000FNEk-1UiS;
	Fri, 27 Jun 2025 17:12:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBJS-0000000FA7r-0hna
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:48:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B2CE75C1B07;
	Fri, 27 Jun 2025 15:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D899C4CEED;
	Fri, 27 Jun 2025 15:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039305;
	bh=lGiBIvC2trUP6etUvfTSqfmhfOuUPlsYHYIgHbmmExo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9ULG/e169FS7lTrt228ooz4AEj57mwfiizp13fH1Ng+QwiiGvPFMKDV2wOt6zeXh
	 3jjVab4g42XCcLkc/q3I7YwdsUcuf467P8kG4O56XH2/g/DPh/w9ft81ysIj7xbO9p
	 DUFNhHLl24ZoIKq6UZbYe5QREjv0EcBnGxel8rLyXriANn/EU6Y1sWCeqTIJoYhubs
	 SEd+Z+nLDcErP58FH6mcF0NhfX9Cglgj6by1qCbI8c5VXnEwpxsXXO7fCssa/aHrzh
	 a8KBcy5piunHW3QSdktET/44QU+XXjWzZEGmJQI4najInWXftmneRA0xsIgrivgaFb
	 CmEEgtzgIsoXw==
Date: Fri, 27 Jun 2025 16:48:21 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v4 00/13] arm64: debug: remove hook registration, split
 exception entry
Message-ID: <aF69RR36vD5U2q9z@willie-the-truck>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620211207.773980-1-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084826_250581_D7E8B282 
X-CRM114-Status: GOOD (  12.60  )
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

Hi Ada,

On Fri, Jun 20, 2025 at 10:11:54PM +0100, Ada Couprie Diaz wrote:
> This series simplifies the debug exception entry path by removing handler
> registration mechanisms for the debug exception handlers, a holdover from
> the arm kernel, as well as the break and stepping handlers.
> This moves much of the code related to debug exceptions outside of
> `mm/fault.c` where it didn't make much sense.
> This allows us to split the debug exception entries: going from one common
> path per EL for all debug exceptions to a unique one per exception and EL.
> 
> The result is a much simpler and fully static exception entry path, which
> we tailor to the different exceptions and their constraints.

I think this looks great, thanks. I've left Reviewed-bys on everything
and a minor nit on the last patch. However, the linker is less
enthusiastic than me because it fails with this series and 'allnoconfig':

  ld.lld: error: undefined symbol: do_breakpoint
  >>> referenced by entry-common.c
  >>>               arch/arm64/kernel/entry-common.o:(el1_breakpt) in archive vmlinux.a
  >>> referenced by entry-common.c
  >>>               arch/arm64/kernel/entry-common.o:(el0_breakpt) in archive vmlinux.a

  ld.lld: error: undefined symbol: do_watchpoint
  >>> referenced by entry-common.c
  >>>               arch/arm64/kernel/entry-common.o:(el1_watchpt) in archive vmlinux.a
  >>> referenced by entry-common.c
  >>>               arch/arm64/kernel/entry-common.o:(el0_watchpt) in archive vmlinux.a
  make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1

Please can you take a look?

Will

