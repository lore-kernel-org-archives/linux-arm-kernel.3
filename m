Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60A9C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTtqvNyWbJ9IkMyX4xULbw3Uvip/5Jol5LjztPeHMjM=; b=QMl2cIhDRf6gRBWD4RVgn++L4O
	gCNQz3mpCXZMSM3wHTbIFRmp+9w0ROHNZ2uCy0udh02dh6mliNyDYZsjOiq5k3eLZBqXvGuZbTIjj
	39ltQpOD3NeTkw2oohLVqv2hq9dlSdVOTSsDw6HIGIKnSKA85mXAWcA225dTCaPgsfRPTvK+j1edP
	mczntRM5b2NWhQccYoBFgizSsoPgr2XeKqTIV29Q1GUTRxVBc2HHzftF1t5Fcs+DlTzLwdIrNA5Wt
	cA74tG+X4LuKQeKbvzJRZOHpSsK5BNmy0yButu2wJIyrJOF/in65FpdxHix6//t4R4e2u9duMVkHC
	Xr/zGSWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujE0W-0000000CMJK-3TJy;
	Tue, 05 Aug 2025 09:30:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujD55-0000000CBGu-23iU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 08:31:36 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754382694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTtqvNyWbJ9IkMyX4xULbw3Uvip/5Jol5LjztPeHMjM=;
	b=LPCVLBLRclUBvupbBbj1ydmGE+YnS7ZiprkW2S+3jmCFxRTi9l5wmf5xCGsfNukGB/kOtk
	VRLP02xDDn5NQp+OzgeEPgdZebeZQuB5+JAlv6JgxoDt95n3YTX1rXSiVB3VZGVFGi7xjW
	c2BKn6V224zxyop/X2DJisJffiqDvycQhcU9xXx8OG928Q6ffubi+IaukO/vjQaz6KuRy5
	QK6KPQ9sohhBRjdZhYWs9jAaKUPPD963QeVz+jFDiUX1zGLdC6bf8hIhY8hwnJWq2x7MER
	AkU4NZe8OkrswGWcPmMO+9qby6nG00E3HtHZkRs6jrIWrjf71+PmW2G080fuSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754382694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTtqvNyWbJ9IkMyX4xULbw3Uvip/5Jol5LjztPeHMjM=;
	b=7vbjx/ODHtPVdqQPn+aZ5es1lKK0A/i2hqELrRoPrVzo1T7KNht3mPgcbL0G9M4BD3Voyp
	x+2TkIvX2yHIKWCA==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] irqchip/msi-lib: Fix fwnode refcount in
 msi_lib_irq_domain_select()
In-Reply-To: <20250804145553.795065-1-lpieralisi@kernel.org>
References: <20250804145553.795065-1-lpieralisi@kernel.org>
Date: Tue, 05 Aug 2025 10:31:32 +0200
Message-ID: <87y0ryf9uj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_013135_679123_EC3D65EE 
X-CRM114-Status: UNSURE (   9.49  )
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

On Mon, Aug 04 2025 at 16:55, Lorenzo Pieralisi wrote:
>
> msi_lib_irq_domain_select() is used in other arches, I could not
> test on those (don't know if they have non-[DT/irqchip/acpi] specific
> fwnodes) - from a fwnode interface perspective I think that this patch
> does the right thing, it should not add any issue to existing code
> to the best of my knowledge but it has to be verified.

fwnode handles are architecture and firmware agnostic.

