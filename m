Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77799C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 09:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msBDo3RKkzh9kUVKIsKS1iryY63ObW3VpHZgfONQGFQ=; b=p5l/tDwOGDTGhvEPeya+SxiwlX
	Z9jBdQpGKJogVFDE3yBo0PptNreFp7yQtuG3pRNwDc7UTad9cMT8Ii1IPcs+kzaI9LcRpdA/4OBF0
	Rl/A76E2z7vd80N8NJsJCp20pRMJRued8r08hyB742pvikEsPXudfDo2FUj205IYpYcPzPOYrDZX+
	CiWa6xndqFEJpl3XQxoVvzAddviVJO468dVk1Mn2rrCwUNYjy64s/yBzLE+/GwpdlaKzMDjDIPXcP
	9SjYNiK7gtEuKuJPABvNQMFX1xBcbRkm6GDSnbgR4jH6XVenPLXlzG+lRS7Tolpt7Jy1ci4A8pCsF
	ZmRYl0fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujE5l-0000000CO2t-1k5j;
	Tue, 05 Aug 2025 09:36:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujDt0-0000000CLKG-01Tt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 09:23:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 828525C652C;
	Tue,  5 Aug 2025 09:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73950C4CEF0;
	Tue,  5 Aug 2025 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754385789;
	bh=diPRIjS2UisxtCV44eJA8sTBgLf6GjYIu+377zJcDLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYvsLKGa8hd0nieMnDjx8d5/pmCW6rf8G7JlrVCyAB2VEYJicS5NMdpiGRTDkgWL7
	 ozceh0KHlUlOlMldpGmGb6/e6FQHKs69ioqqGoWn5UF91zn7/1bVjw/4wAAPeS5Chp
	 sZFn9ijyHZ/rz3/VdOIRse2dswl7t29XBWQDEaRJ9apN0PXe0j407+RhCZypuzsaHI
	 fSC3rmWDUQB+hOpn6JsV9xTDNtYGNq5qS1CHgbx6B5tsCB6T32zha23CzwQCmx948r
	 ncPVoloIYMQLoLX25lsKGWa9hekkKrCHIUdo2vAswMz4pC3HbN09f0QL400aOKnPzQ
	 X1v2guQg84mNQ==
Date: Tue, 5 Aug 2025 11:23:04 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] irqchip/msi-lib: Fix fwnode refcount in
 msi_lib_irq_domain_select()
Message-ID: <aJHNeP2E76liHqUr@lpieralisi>
References: <20250804145553.795065-1-lpieralisi@kernel.org>
 <87y0ryf9uj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0ryf9uj.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_022310_083467_645CA9E0 
X-CRM114-Status: GOOD (  18.49  )
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

On Tue, Aug 05, 2025 at 10:31:32AM +0200, Thomas Gleixner wrote:
> On Mon, Aug 04 2025 at 16:55, Lorenzo Pieralisi wrote:
> >
> > msi_lib_irq_domain_select() is used in other arches, I could not
> > test on those (don't know if they have non-[DT/irqchip/acpi] specific
> > fwnodes) - from a fwnode interface perspective I think that this patch
> > does the right thing, it should not add any issue to existing code
> > to the best of my knowledge but it has to be verified.
> 
> fwnode handles are architecture and firmware agnostic.

Yep, though to make sure this does not trigger regressions I started
checking (ie I am adding an additional fwnode_handle_get/put() in there),
some fwnode helpers (eg fwnode_find_reference()) returns an error
pointer rather than NULL on error, it looks like calling
fwnode_handle_put() on that value when OF is in use is not a good idea
(ie of_node_put() checks for NULL and dereference).

There is code out there that implicitly assumes what fwnode types
are used behind the fwnode_* interface or I am missing something.

It is not arch dependent but it looks like it depends on what fwnodes
arches use - that's where my caution stems from, nothing else.

Thanks,
Lorenzo

