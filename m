Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670F4C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 00:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGAtk9JTVXzwT7zGpYwbnDXANl+IUmEobODkVzGw9lA=; b=GdG6DCBmLVEfCS0zn9Mw80N7ot
	oAmdbaofzVzvffxLJLqe8XAA0XoojHPkcncgPn52WNLn0CmGRS3EW9okR+ZP45ocFwY/AYl2RQ3kg
	qe/vx+0ilEiK3CBx5n/M2OccpH5OrRdcAMols4kQOq84pUvxbE1FYC7q+jtJI4j3nHFQz/DTN5vhM
	CJp1ImFJjqzoOOsDvdmSLKfHTaSC8Odtk3XsZUtgJ2GTURfBwVWgAn3eTwJLnjmoj1e69NLsYqzi4
	GDYJPG3SOx/HLSuqG4vqdsUhu33G8Oo7YTSWNtOHeeA8M86E9WBUAOZlHqlefEs3kc551VYT3+cMe
	lHNPB/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYa5F-000000013Ad-2NuE;
	Mon, 07 Jul 2025 00:51:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYa0H-000000012dx-2srm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 00:46:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF4215C5530;
	Mon,  7 Jul 2025 00:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28CFC4CEED;
	Mon,  7 Jul 2025 00:46:34 +0000 (UTC)
Date: Sun, 6 Jul 2025 19:46:33 -0500
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 10/13] arm64: debug: split hardware watchpoint
 exception entry
Message-ID: <aGsY6c4syByZQ8cr@arm.com>
References: <20250627172038.633423-1-ada.coupriediaz@arm.com>
 <20250627172038.633423-11-ada.coupriediaz@arm.com>
 <aGgQI4c7MFmQ48tI@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGgQI4c7MFmQ48tI@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_174641_769068_FA2AB8BA 
X-CRM114-Status: GOOD (  15.04  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Luis Claudio R . Goncalves" <lgoncalv@redhat.com>, linux-arm-kernel@lists.infradead.org, Anshuman Khandual <anshuman.khandual@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jul 04, 2025 at 06:32:19PM +0100, Will Deacon wrote:
> On Fri, Jun 27, 2025 at 06:20:35PM +0100, Ada Couprie Diaz wrote:
> > +static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
> > +{
> >  	arm64_enter_el1_dbg(regs);
> >  	if (!cortex_a76_erratum_1463225_debug_handler(regs))
> >  		do_debug_exception(far, esr, regs);
> 
> This leads to:
> 
> Failed to build patch #10: 0d0a8f024a19 arm64: debug: split hardware watchpoint exception entry
> arch/arm64/kernel/entry-common.c: In function ‘el1_dbg’:
> arch/arm64/kernel/entry-common.c:572:36: error: ‘far’ undeclared (first use in this function)
>   572 |                 do_debug_exception(far, esr, regs);
>       |                                    ^~~
> 
> 
> Catalin -- do you reckon we should fix this? It's only this series
> sitting on for-next/debug-entry, nobody has pulled it afaik and we still
> have plenty of time before the merge window so a rebase probably won't
> hurt anybody.

Works for me, no-one pulled this branch and rely on it being stable. If
Ada sends a fixup, I can fold it into this patch or merge a new series
altogether if more patches are affected (or you can do it I don't get to
a reasonable wifi location in the next few days).

Thanks.

-- 
Catalin

