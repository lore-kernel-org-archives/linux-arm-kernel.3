Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AB1E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEDAbaOt7g6WeLBENFVnG/KXVfGSTAbCAHZK9utoSas=; b=KSXEmxUYAynC0BYeMd8szhuQHp
	Mqw9dqZiytafqTK4ezr1O9eVj7VuI3drImfQ9b7tL+vOoHNuzrE2h46wJuOJzweh2Hg1YofdOK6z0
	xSrwgd8LmU42Q3oQGgH0wkl78ZNUM0bVgWOwCy2aMELItUVU/SrehILAMQKjSoZS+8m7UqPl58Gbi
	NoeqiEVR6O+yuxSe5eC1kFLHlk/pacMGWkVZm9a5RmzIyBy4bDKHO5P4nFIfsAJGpFJ8qBTdlaz4p
	mJZ8cFTvZNEmoLkYICKL8K1BlIEYp9y83qWr0eTpCen/VaVwx82R/vAwYQrdjNwa6QPKAl4p5kMH0
	oADXlRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKazT-00000007HeN-0Vcg;
	Mon, 09 Dec 2024 10:27:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKac7-00000007CcR-0cnu
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Dec 2024 10:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aEDAbaOt7g6WeLBENFVnG/KXVfGSTAbCAHZK9utoSas=; b=I300jKpfjZCcYr326Pjm86HuTv
	KuoDBL+tDkBePOb6odylz3aBVO7IhJsRH2CX0CFu9icNySnEcf+wIWCRKRAOeJhi2eSoR0+zCyG3D
	k/rYzH0qtLZ1I8mHWquXBdvlzQ4RF3/3anbme9zzpydGFcO6PFsRLiyDOaHGnu7pTqmkiPbDKxVh/
	L9PCZqlZXj0PeFwMSF7JYdgPNNf88oZr2trbJIkRroe8TwR5jHsvp8HJOqcsFsggTHgak2Q882WPU
	X1YEcC0ESgH+b9p04on7prgL/s/Yvc5yJO7tAu7v+0US+TiiYU35ii/N/a0CycnTOOv//qMaPDTkE
	oMCrCFfQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tKac4-00000003WXn-0Pr8;
	Mon, 09 Dec 2024 10:03:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 72A683003FF; Mon,  9 Dec 2024 11:03:35 +0100 (CET)
Date: Mon, 9 Dec 2024 11:03:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	aruna.ramakrishna@oracle.com, broonie@kernel.org,
	catalin.marinas@arm.com, dave.hansen@linux.intel.com,
	jannh@google.com, jeffxu@chromium.org, joey.gouly@arm.com,
	kees@kernel.org, maz@kernel.org, pierre.langlois@arm.com,
	qperret@google.com, ryan.roberts@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [RFC PATCH 08/16] mm: Introduce kernel_pgtables_set_pkey()
Message-ID: <20241209100335.GH21636@noisy.programming.kicks-ass.net>
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
 <20241206101110.1646108-9-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101110.1646108-9-kevin.brodsky@arm.com>
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

On Fri, Dec 06, 2024 at 10:11:02AM +0000, Kevin Brodsky wrote:
> kernel_pgtables_set_pkey() allows setting the pkey of all page table
> pages in swapper_pg_dir, recursively. This will be needed by
> kpkeys_hardened_pgtables, as it relies on all PTPs being mapped with
> a non-default pkey. Those initial kernel page tables cannot
> practically be assigned a non-default pkey right when they are
> allocated, so mutating them during (early) boot is required.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
> 
> It feels that some sort of locking is called for in
> kernel_pgtables_set_pkey(), but I couldn't figure out what would be
> appropriate.

init_mm.page_table_lock is typically the one used to serialize kernel
page tables IIRC.

