Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED36C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lAci6YYo4wGi9eI2t8/aF7PeHt+p49zUiPkIZSyvdo=; b=3QoL/NNaMyCk7hLQW+hK5pjaCU
	N+ZhvuBHeR/JqZu9/EIT55Sb1quGpqmuBEq3+ldYOvXmPViqXeD1G4owX52/Ce1c2aiB0swN1tAmq
	m/OB9xkrADAH6tHu7+2ePsehqBYCV/qGadbz0xeaGFKR4zuFP4rcWB2l2dZ3cz6v7u5Qcyw1RlroC
	g2U+FLUn33RUFIuO+5QAvsUqjXPfDz4VHwO3203E8sx/HRSe3Rsx6zwbBNjHNJvPVnL8v8tdGe/mY
	1U7cDsptnD37wl3BdIYZDGmmyAmZX0BRvZNDACAOdslZWoTOcNuJ/JzoHRfrLGvhGxLX/lwv7EtQk
	UOQ23bDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7IE-00000005HBX-2Zm5;
	Tue, 08 Jul 2025 12:19:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ7FF-00000005Gqw-1Exb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 12:16:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4411EA53C53;
	Tue,  8 Jul 2025 12:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52E2C4CEED;
	Tue,  8 Jul 2025 12:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751976979;
	bh=D2kOiIafrwm8B/OwS0bK9P/YxwFoTqlIKUepSIvdTeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgGrUgJSCWOGzAzARvxqodsXXYfvysHhi7/aqCqcq+C2lWHYMheQP0itDrI8nJW2v
	 6lU6xZQOe3SepLwNgfE05orJGlxfYKwGVZIMd6FRRvH6PqbCp0lOyIQUqwd1nBup+P
	 kCfgXQRHluWkDMCcLpOrxKDddo6pcmBmdJIzw+9NbD46HttGeIiKwVztP42Ek/YQtM
	 uIKv0STMt/Cg+EWoQFgdG2lhutxTN/y96O7gvYDWECDZpHM+/oJLaZYixr3ib2pxNQ
	 vx/hNEcpbnXAl86EduOP2h13X5Uh52MrBkpT7vC2JTOH4YBlRZYVGvT5FHdfqsNs6a
	 zk0VXyIUimM+g==
Date: Tue, 8 Jul 2025 13:16:15 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v5 10/13] arm64: debug: split hardware watchpoint
 exception entry
Message-ID: <aG0MD62jRtZk8D7i@willie-the-truck>
References: <20250627172038.633423-1-ada.coupriediaz@arm.com>
 <20250627172038.633423-11-ada.coupriediaz@arm.com>
 <aGgQI4c7MFmQ48tI@willie-the-truck>
 <aGsY6c4syByZQ8cr@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGsY6c4syByZQ8cr@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_051621_400559_85213F54 
X-CRM114-Status: GOOD (  18.50  )
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

On Sun, Jul 06, 2025 at 07:46:33PM -0500, Catalin Marinas wrote:
> On Fri, Jul 04, 2025 at 06:32:19PM +0100, Will Deacon wrote:
> > On Fri, Jun 27, 2025 at 06:20:35PM +0100, Ada Couprie Diaz wrote:
> > > +static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
> > > +{
> > >  	arm64_enter_el1_dbg(regs);
> > >  	if (!cortex_a76_erratum_1463225_debug_handler(regs))
> > >  		do_debug_exception(far, esr, regs);
> > 
> > This leads to:
> > 
> > Failed to build patch #10: 0d0a8f024a19 arm64: debug: split hardware watchpoint exception entry
> > arch/arm64/kernel/entry-common.c: In function ‘el1_dbg’:
> > arch/arm64/kernel/entry-common.c:572:36: error: ‘far’ undeclared (first use in this function)
> >   572 |                 do_debug_exception(far, esr, regs);
> >       |                                    ^~~
> > 
> > 
> > Catalin -- do you reckon we should fix this? It's only this series
> > sitting on for-next/debug-entry, nobody has pulled it afaik and we still
> > have plenty of time before the merge window so a rebase probably won't
> > hurt anybody.
> 
> Works for me, no-one pulled this branch and rely on it being stable. If
> Ada sends a fixup, I can fold it into this patch or merge a new series
> altogether if more patches are affected (or you can do it I don't get to
> a reasonable wifi location in the next few days).

I'll replace the branch with the new patches today.

Will

