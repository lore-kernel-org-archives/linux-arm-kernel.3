Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE67C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 20:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cOJMi2ml2Dp8lrtNuYE1nMsJo8SReHGLhNAZZYs7mA=; b=NMskJTe3VKGqJlG3gPpf2PTZnf
	VsZlE7wqjJfEZDzXOsbq4dDm2a99E5kLp+A8ksmfFePj/K/hNLIwrwJwylQndKSPggoMJE1VqGZ+7
	w/Hpr8BOA6P2O8vrVRJzRyMGBW0JBdkPrZ7V4uOs8glFje7HJ7VOGAeT3ZcKIWMfJ1nS4CUBN2wuz
	fknlcYD8UyLismk95LSToC/qd9uN0LfzhIRogNd/KIaPFhj98FMLtxLj6dvJw0txFRF9i9g13hNK8
	EoIO5kMDN9KYZ9CNPW9ctFjhS3HUWRhq8ob+KqxG58+sSEtylzwfdyZcoXc8QLx2u614h97wTfNdn
	hNQCtpyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGNii-00000006Dqm-1r4M;
	Sat, 17 May 2025 20:01:20 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGNgi-00000006DjI-0cGV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 May 2025 19:59:17 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747511951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/cOJMi2ml2Dp8lrtNuYE1nMsJo8SReHGLhNAZZYs7mA=;
	b=BvzHe/Is/iUohMKl4tjyZLLBxYfCPG4fsE2hUs7sNxxB/71P5mSsJCWVXZJ7UYj5rliT0Y
	o9cj9gZRSQxuYv37Gx81jUw1DL1W86Jif4rsjcO9XBjfXPscv8fjERO1uGlAYnzLZggN6y
	yD9RXdQhwYAiX3b7wLPOYGb964rfXY6JTwpqB8GrdFu7tUvGnbMBM7Rv7WHsneHHbWfqx4
	W7tUgWGijs3hCci0eFpKor22Kb2FAqXu2kaXRkT2XYIfDXSesbRXZ4a1iAIT0P5x5pju/H
	j8bmkPt2w39KNxtr056gA6yeS/9RNgUyjEZ6+NZQ+tUE95vvLSZCn8hVlBIeqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747511951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/cOJMi2ml2Dp8lrtNuYE1nMsJo8SReHGLhNAZZYs7mA=;
	b=Q+y/llOjEkB2TiNhdwBI655KmbK0Cs4EuOmVpDDGx4mdz/3dHT06/oY46OZ4rzZ/I6jOyH
	/kQer4hUoksDHSDA==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] irqchip/msi-lib: Honor the MSI_FLAG_PCI_MSI_MASK_PARENT
 flag
In-Reply-To: <20250517103011.2573288-1-maz@kernel.org>
References: <20250517103011.2573288-1-maz@kernel.org>
Date: Sat, 17 May 2025 21:59:10 +0200
Message-ID: <875xhzhuup.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_125916_324164_0D00338A 
X-CRM114-Status: GOOD (  12.96  )
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

On Sat, May 17 2025 at 11:30, Marc Zyngier wrote:
> +	/*
> +	 * If the parent domain insists on being in charge of masking, obey
> +	 * blindly. The default mask/unmask become the shutdown/enable
> +	 * callbacks, ensuring that we correctly start/stop the interrupt.
> + 	 * We make a point in not using the irq_disable() in order to
> +	 * preserve the "lazy disable" behaviour.
> +	 */
> +	if (info->flags & MSI_FLAG_PCI_MSI_MASK_PARENT) {
> +		chip->irq_shutdown	= chip->irq_mask;
> +		chip->irq_enable	= chip->irq_unmask;

This is only correct, when the chip does not have dedicated
irq_shutdown/enable callbacks. And I really hate the asymmetry of this.

> +		chip->irq_mask		= irq_chip_mask_parent;
> +		chip->irq_unmask	= irq_chip_unmask_parent;
> +	}

I'm still trying to understand, what's the actual problem is you are
trying to solve.

MSIs are edge type interrupts, so the interrupt handling hotpath usually
does not mask at all. The only time masking happens is when it's lazy
disabled or during affinity changes, which is not the end of the world.

Thanks,

        tglx

