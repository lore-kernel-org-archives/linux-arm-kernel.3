Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199EAC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 12:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mH428cQbEp9V64qNJHarjakmcyTJ6O4neC9iS/l8ECA=; b=XOyKTKfPTpEGMQEKnxv7/3q/aR
	xYVjHM9m1kFzSEmxFmoPaP0QuUlYWvw+JDg+flsJr8Z2GrbDEBJPQttcyOI5iVWwX1waMjxkwJ1d0
	EkXefaDqlUB+zmMasOxlRfa2gUmsNkF8zP9trY5fEL7gJewgCoZkrx4xFrCaz3wo9y/XDWX6CYA3P
	bzvd5iR2zZgEurq6WEksXVOJq5nPqeHdV4Ig+H7Kt8CrWM2mUcgeUvdJSBU8YPPTNQ9SeUnH0RO82
	HcFlR4ozPZ4I1NxRalY8nwVKcJOfLdH0pAZIgbeKqTD4J3wap9p/y8q058dHPRNq8SOtfoFKx323e
	zdgyfi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNWKY-00000000Fqh-3Mvi;
	Fri, 06 Jun 2025 12:37:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNWFN-00000000FHG-3TGs;
	Fri, 06 Jun 2025 12:32:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E4495C4BC9;
	Fri,  6 Jun 2025 12:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C81C4CEEB;
	Fri,  6 Jun 2025 12:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749213152;
	bh=PNTM9e0vJhXMOaOlrgN0eJ6RCfLv95PaA3skUkIbaLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVqrVVfCo5lRiWF/yTc2KkGAnzUBdKUnY/E0/uW2KsVM1DKeNmhvjEqjiqkxGW9EO
	 Ay99FjxewkAYgK40NjjTR5n2+evtmC7r+Pd/HGxRYLe1j34CKxqjlsr7ypagSdgG3X
	 TLw2f454o9jv4gkToaKATOa2HaHruKzwwRiF2x4uxXTq7VBC4xILTzMVaSrINchezR
	 DO1C0g018cudAnGU3QMQBArJAG3zT7hXVsBSSL/gNpDBA65d+UfTB5eupOvXFVkuJV
	 ge6Qr5dEnHDgyl3lWRpRKKr93No5GNHpwXn11OeOcebCrxQB1dbOEMd1qf+z+oPMl1
	 /dAdq5qYRMKfQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uNWFJ-0000000071Z-0Iw3;
	Fri, 06 Jun 2025 14:32:29 +0200
Date: Fri, 6 Jun 2025 14:32:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: Re: [PATCH AUTOSEL 6.15 092/110] genirq: Retain disable depth for
 managed interrupts across CPU hotplug
Message-ID: <aELf3QmuEJOlR7Dv@hovoldconsulting.com>
References: <20250601232435.3507697-1-sashal@kernel.org>
 <20250601232435.3507697-92-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250601232435.3507697-92-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_053233_908445_8D508C76 
X-CRM114-Status: GOOD (  17.75  )
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

On Sun, Jun 01, 2025 at 07:24:14PM -0400, Sasha Levin wrote:
> From: Brian Norris <briannorris@chromium.org>
> 
> [ Upstream commit 788019eb559fd0b365f501467ceafce540e377cc ]
> 
> Affinity-managed interrupts can be shut down and restarted during CPU
> hotunplug/plug. Thereby the interrupt may be left in an unexpected state.
> Specifically:
> 
>  1. Interrupt is affine to CPU N
>  2. disable_irq() -> depth is 1
>  3. CPU N goes offline
>  4. irq_shutdown() -> depth is set to 1 (again)
>  5. CPU N goes online
>  6. irq_startup() -> depth is set to 0 (BUG! driver expects that the interrupt
>     		     	      	        still disabled)
>  7. enable_irq() -> depth underflow / unbalanced enable_irq() warning
> 
> This is only a problem for managed interrupts and CPU hotplug, all other
> cases like request()/free()/request() truly needs to reset a possibly stale
> disable depth value.
> 
> Provide a startup function, which takes the disable depth into account, and
> invoked it for the managed interrupts in the CPU hotplug path.
> 
> This requires to change irq_shutdown() to do a depth increment instead of
> setting it to 1, which allows to retain the disable depth, but is harmless
> for the other code paths using irq_startup(), which will still reset the
> disable depth unconditionally to keep the original correct behaviour.
> 
> A kunit tests will be added separately to cover some of these aspects.
> 
> [ tglx: Massaged changelog ]
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Link: https://lore.kernel.org/all/20250514201353.3481400-2-briannorris@chromium.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This one breaks suspend of laptops like the Lenovo ThinkPad T14s. Issue
was just reported here by Alex:

	https://lore.kernel.org/lkml/24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com/

Please drop from all stable queues for now.

Johan

