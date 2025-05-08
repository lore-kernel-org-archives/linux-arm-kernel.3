Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23FDC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=749LEvvvcQKWUxXjFdM+0rHrGbSEewnoyWUORHg2MJw=; b=Hi6wM5weCFGNdsgt7iUE+0ZRTw
	EOuEnD2PLwut533/ej5/kwOtaSpB1GPpEB2WF7JAC2QYPPWNiM3p32Xwst0BPLl3WSdkiVHhQKiA3
	e9oly3s1lOg+xAVAgxYXp3TYRZCD9zw/mh3GxAhyuGdB8v5IOrToAUNG03YTEk7oleISjSo6jHQm4
	KrD8VHWKi7T1knV1w3B+2+sXDlxqi88gxZys7HYX516MKhlFJFCxAPgOwwwnwC51FDGWtJ5adYx0R
	VQXqSfxPxxQmfwTRJDPx6rSOei20tJ+JHor0jbNd+cmh+UwQZRt+wm/H7n4lzb6/9CmY3MyAGMyG6
	pbvI+kmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCw0H-000000002To-3d6W;
	Thu, 08 May 2025 07:49:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvu7-000000001ql-0uCs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 07:42:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E83485C5BB8;
	Thu,  8 May 2025 07:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720A0C4CEEB;
	Thu,  8 May 2025 07:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746690169;
	bh=5JMW7/uRAihyo83RPf09AucXsTK0nvq44mkKuP7GWpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8hPxqEH6ko1pwYYxlSgw8PARLL/d5vHuliC9BGD997xaeYyfSHrLXXJfwjBmXvDc
	 ssW/+poQ0zBzDp3vRfCvzOIcTY6pg/6yEUnCg42I4WUgLvYK8KO5rf/1JtAmVV2Yoc
	 PTdBfMpb8oK81Zetk/SScGnLu8clsvtGNxrqnWrWQgbw1VxrEOT5+KvK7I961hS/xM
	 XluLolxDnLwEJO7LfF81kFo99a7G1pzTRqWNf7bBYhT6fqyhRnQJ0fbNGvEkin1mTp
	 uIJd6O9Ot9GCjVwEGWSwLwbdKjhfwlAs9GNI1CeXYwX0qAyhTjHiPlNEHTczbyALJx
	 pA7INs3gg9RbA==
Date: Thu, 8 May 2025 09:42:41 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 20/25] irqchip/gic-v5: Add GICv5 PPI support
Message-ID: <aBxgceQBRA6vBK7o@lpieralisi>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org>
 <87zffpn5rk.ffs@tglx>
 <86a57ohjey.wl-maz@kernel.org>
 <87ecx0mt9p.ffs@tglx>
 <867c2sh6jx.wl-maz@kernel.org>
 <874ixwmpto.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874ixwmpto.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_004251_369714_09BF79C7 
X-CRM114-Status: GOOD (  29.64  )
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

On Wed, May 07, 2025 at 04:57:07PM +0200, Thomas Gleixner wrote:
> On Wed, May 07 2025 at 14:52, Marc Zyngier wrote:
> > On Wed, 07 May 2025 14:42:42 +0100,
> > Thomas Gleixner <tglx@linutronix.de> wrote:
> >> 
> >> On Wed, May 07 2025 at 10:14, Marc Zyngier wrote:
> >> > On Tue, 06 May 2025 16:00:31 +0100,
> >> > Thomas Gleixner <tglx@linutronix.de> wrote:
> >> >> 
> >> >> How does this test distinguish between LEVEL_LOW and LEVEL_HIGH? It only
> >> >> tests for level, no? So the test is interesting at best ...
> >> >
> >> > There is no distinction between HIGH and LOW, RISING and FALLING, in
> >> > any revision of the GIC architecture.
> >> 
> >> Then pretending that there is a set_type() functionality is pretty daft
> >
> > You still need to distinguish between level and edge when this is
> > programmable (which is the case for a subset of the PPIs).
> 
> Fair enough, but can we please add a comment to this function which
> explains this oddity.

Getting back to this, I would need your/Marc's input on this.

I think it is fair to remove the irq_set_type() irqchip callback for
GICv5 PPIs because there is nothing to set, as I said handling mode
for these IRQs is fixed. I don't think this can cause any trouble
(IIUC a value within the IRQF_TRIGGER_MASK should be set on requesting
an IRQ to "force" the trigger to be programmed and even then core code
would not fail if the irq_set_type() irqchip callback is not
implemented).

I am thinking about *existing* drivers that request GICv3 PPIs with
values in IRQF_TRIGGER_MASK set (are there any ? Don't think so but you
know better than I do), when we switch over to GICv5 we would have no
irq_set_type() callback for PPIs but I think we are still fine, not
implementing irqchip.irq_set_type() is correct IMO.

On the other hand, given that on GICv5 PPI handling mode is fixed,
do you think that in the ppi_irq_domain_ops.translate() callback,
I should check the type the firmware provided and fail the translation
if it does not match the HW hardcoded value ?

Obviously if firmware exposes the wrong type that's a firmware bug
but I was wondering whether it is better to fail the firmware-to-Linux
IRQ translation if the firmware provided type is wrong rather than carry
on pretending that the type is correct (I was abusing the irq_set_type()
callback to do just that - namely, check that the type provided by
firmware matches HW but I think that's the wrong place to put it).

Thanks !
Lorenzo

