Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03B3CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 06:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uI4CgwvUXCbUc5uPC5+X8729M4tDF2pOP2xKvb9cDI=; b=qB50gI+1xIzm8O6DAu9Yw8nwhf
	aKVwBwlyJlwXokppGwynOUuqez1s+sDEOLXu8Y2+/olWfDt3R2S8M+WPnQEFGXNfAe/TkqEx8Afzy
	c2HHqYvYIVkYP7QVRCKnSJHixbzceHgufbO8mDs4paJ+Yz0FFK4Ya1QAEhfOrFjAuRtV/XgH5fVYD
	PJwQ2Es52I35OtigpnD3udm0rI6RoUZl5CzO0QSBf1yyp0eUD0w4x4QfxT32mHQSJ7goYT8dGe/aO
	NQvPKa3+Sfif2QqxV74ZcNRnWcsAY4UTiW+6SiHNkxRfvDQSTX9MAmvtTJ6wamT4rvg7ND8xKQqHy
	brMs6OpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliGG-0000000A0GE-2MO9;
	Tue, 12 Aug 2025 06:13:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliDd-0000000A02J-0ir2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 06:10:46 +0000
Date: Tue, 12 Aug 2025 08:10:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754979042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6uI4CgwvUXCbUc5uPC5+X8729M4tDF2pOP2xKvb9cDI=;
	b=3ZhGlxdYlv3VJPSpkgTTfl8TU5GIYzCUx7KkQbaNk1LnurpNfZZyhnAJw2Hn0ZRStYkWV2
	PSaQvChg1wFVRbIr/FS+pDoIRvze9scRiaQ32JFbg/3lJzQIn3GOU2x06FGxczNTwDtLxE
	NYM74BFTJmzkum2EZLyZX/tq7WNTbYxb7t5JHqAem58ZMjWVvip7aML8EHj/1318Gx5VPV
	Yfh4ogLkflI307vKSNxC/JLZwThl23nj/u54XAuCyX/oMRXd2Fq7YbZNALSdZCStfnjkMW
	9Waf8SIoShdZyWKQIQ5zOhg/xI48qqsa9Gv+hdVTWVvPcz4gYJS7aY86CS8UYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754979042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6uI4CgwvUXCbUc5uPC5+X8729M4tDF2pOP2xKvb9cDI=;
	b=zdFEHqye4kn8F6Tl5mhCvWy99jUnVPlfXZfrW/w0cudhlLt3EaUr4qtNe+cT3qoSWdHqCh
	Fumfr9ux4Skta8AA==
From: Nam Cao <namcao@linutronix.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Michal Simek <michal.simek@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: xilinx: Fix NULL pointer dereference
Message-ID: <20250812061028.O01CaCXa@linutronix.de>
References: <20250811054144.4049448-1-namcao@linutronix.de>
 <20250811222937.GA167215@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811222937.GA167215@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_231045_352423_95C89F93 
X-CRM114-Status: GOOD (  17.49  )
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

On Mon, Aug 11, 2025 at 05:29:37PM -0500, Bjorn Helgaas wrote:
> On Mon, Aug 11, 2025 at 07:41:44AM +0200, Nam Cao wrote:
> > Commit f29861aa301c5 ("PCI: xilinx: Switch to
> > msi_create_parent_irq_domain()") changed xilinx_pcie::msi_domain from child
> > devices' interrupt domain into Xilinx AXI bridge's interrupt domain.
> > 
> > However, xilinx_pcie_intr_handler() wasn't changed and still reads Xilinx
> > AXI bridge's interrupt domain from xilinx_pcie::msi_domain->parent. This
> > pointer is NULL now.
> > 
> > Update xilinx_pcie_intr_handler() to read the correct interrupt domain
> > pointer.
> > 
> > Fixes: f29861aa301c5 ("PCI: xilinx: Switch to msi_create_parent_irq_domain()")
> 
> Since this appeared in v6.17-rc1, I suppose this should be merged for
> v6.17, right?  I provisionally put this on pci/for-linus for now.

Yes please.

> What does this look like to a user?  I assume a NULL pointer
> dereference in xilinx_pcie_intr_handler()?  Do you have a dmesg
> snippet from hitting it?  It would be nice to include a couple lines
> of that in the commit log to help users find this fix.

Sorry I didn't clarify this, but this has not been tested with hardware.

Claudiu pointed out this problem with another driver [1], so I audited all
the other drivers that I touched and noticed that this one has the same
problem.

Nam

https://lore.kernel.org/linux-pci/20250809144447.3939284-1-claudiu.beznea.uj@bp.renesas.com/ [1]

