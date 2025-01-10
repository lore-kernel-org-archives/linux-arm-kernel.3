Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED96E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 00:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C56b3IQcC5vI8MuTvfhM8hU0Tb2A6/OLbyWwfxXHIqk=; b=XRLTXK48kh41S0DITocNUj+/Ct
	HquGgDBsDABHxS8jUqpkWwfl2meYY7RreYnBTINkhN+pR86r1ewauNBHe8xYsZMwGOcQXchFyC/U2
	+jAgI+TBOVjlJr0ezP3n393bcMh5k4Amm6EEOWvJaCjfYTvTjsa9cvdXBExmno4fp2T2oQo4Rhng5
	llbcXuBJf85O5FIcOkNeTNXciYS/bH6Zg4wxZ06W+wEOLGpD9vlRbvTw/KxIBf04B74QKuu09rA61
	ol0vKVhW5ApoVGUg10z272+l8dzTjZMuesFIi8ro3v6a0cXqB5tj2gomGyAfgJTDqjb7cAm0bM+Y/
	DrjWCOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW32k-0000000Df9t-1WTp;
	Fri, 10 Jan 2025 00:38:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW31T-0000000DesG-07F6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 00:37:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97EB41480;
	Thu,  9 Jan 2025 16:37:34 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F74A3F673;
	Thu,  9 Jan 2025 16:37:05 -0800 (PST)
Date: Fri, 10 Jan 2025 00:35:52 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Philippe Simons <simons.philippe@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] irqchip/sunxi-nmi: add missing flag
Message-ID: <20250110003552.0ff180c6@minigeek.lan>
In-Reply-To: <20250109153936.1908044-1-simons.philippe@gmail.com>
References: <20250109153936.1908044-1-simons.philippe@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_163711_117751_ED13A729 
X-CRM114-Status: GOOD (  21.57  )
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

On Thu,  9 Jan 2025 16:39:35 +0100
Philippe Simons <simons.philippe@gmail.com> wrote:

Hi Philippe,

thanks for sending that patch (and not just keeping it in your repo)!

> AXP717 has a PEK to wake up the device from sleep
> AXP717 is on the NMI irq pin
> add IRQCHIP_SKIP_SET_WAKE flag is required to enable wakeup from the suspend

That commit message might leave some people a bit puzzled, what about:
(with my embarrassingly little understanding of irqchip):
=================
Some boards with Allwinner SoCs connect the PMIC's IRQ pin to the SoC's
NMI pin instead of a normal GPIO. Since the power key is connected
to the PMIC, and people expect to wake up a suspended system via
this key, the NMI IRQ controller must stay alive when the
system goes into suspend.

Add the flag to prevent the sunxi NMI controller from going to sleep,
so that the power key can wake up those systems.
=================

Needs also your Signed-off-by:!

> ---
>  drivers/irqchip/irq-sunxi-nmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
> index bb92fd85e..3e87ca724 100644
> --- a/drivers/irqchip/irq-sunxi-nmi.c
> +++ b/drivers/irqchip/irq-sunxi-nmi.c
> @@ -186,7 +186,8 @@ static int __init sunxi_sc_nmi_irq_init(struct device_node *node,
>  	gc->chip_types[0].chip.irq_unmask	= irq_gc_mask_set_bit;
>  	gc->chip_types[0].chip.irq_eoi		= irq_gc_ack_set_bit;
>  	gc->chip_types[0].chip.irq_set_type	= sunxi_sc_nmi_set_type;
> -	gc->chip_types[0].chip.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED;
> +	gc->chip_types[0].chip.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED
> +		| IRQCHIP_SKIP_SET_WAKE;

I think it's customary to put the operators last on the line, to make
it more obvious that this statement continues on the next line. I'd
recommend to put each flag on a line of its own here, and align them
vertically:
	flags	= IRQCHIP_... |
		  IRQCHIP_... |
		  IRQCHIP_...;

Cheers,
Andre

>  	gc->chip_types[0].regs.ack		= reg_offs->pend;
>  	gc->chip_types[0].regs.mask		= reg_offs->enable;
>  	gc->chip_types[0].regs.type		= reg_offs->ctrl;


