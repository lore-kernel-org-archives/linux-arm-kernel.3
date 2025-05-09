Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4407C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kveNoEqSVKO6OwiY7w1g1XWZieO2QOIr3B/KrpemG+s=; b=XjPTLA9I0WzREMMDBLGG/5+f+V
	K4pkPvCjuSr+Wpm+A8fZxh8k063ZA2/5qpgpLVoNcl2lYqvNtQTzTTfZ1aAzmPtAcZm2ryGwrFp5a
	OPYAmKFmSZc7+zYkuQHwdir5/5Wdq7RjtBS4i1acUzPTKMcuq4CpI2+TnC2l8L8HUp/VILCi89TOi
	YN94jSoQp32uXNqjYWhpCgMFzGcyyzLGoo/bjlbol9CVtp36ak9CdAb7+spkdpt8gu6PYx0urz4Pk
	73fbVLZIH2HvZF7kuNq1x/1tmbk22GF5ZK/dEJUu0Q95aknUUWdxElG93rZ3MCxbKl6IYt0ZioHFR
	2/E3LPDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJqS-000000034Nj-2LsM;
	Fri, 09 May 2025 09:16:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJCf-00000002wLg-2BTl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:35:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E67F36111F;
	Fri,  9 May 2025 08:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2209C4CEE4;
	Fri,  9 May 2025 08:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746779732;
	bh=rT1+07xUMuQWJf5ZXEO//iIf5MgKUtLBdpIGIIMnfmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H9IyVdICYyn1bbIiba3LsykLZ19QH2Nc3A7c6nmeyEB6imPkITNRQWJ6wNCodpWV4
	 tbQc1Gb0dW1zKDJUgcbnmWZZfFRnSNqN+JP9hcxSVSFMXv9EhBWWOF3u6P6FMU/Gy7
	 qDEfjOqvZevc1wE4OiDhwCrriqNNUXjKxsvD066VSg9S+ZdbN+FGi1qfOcXcV78Xar
	 bxvFZARu6c9n5aGD9BMhLYPb9n8Y94eBUp1tPZV7qTJQUi5153MhhQV1F/+B7Hlw1I
	 zroeYbV5E5VYdbMUw48ygAtmozdx8UaoRUg8RyrRvblCUIqYLKtylN/FNX/b03PO5k
	 /Kf/M2xe1qz8w==
Date: Fri, 9 May 2025 10:35:25 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
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
Message-ID: <aB2+TRSiGYL2eTWH@lpieralisi>
References: <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org>
 <87zffpn5rk.ffs@tglx>
 <86a57ohjey.wl-maz@kernel.org>
 <87ecx0mt9p.ffs@tglx>
 <867c2sh6jx.wl-maz@kernel.org>
 <874ixwmpto.ffs@tglx>
 <aBxgceQBRA6vBK7o@lpieralisi>
 <864ixvh4ss.wl-maz@kernel.org>
 <aByLHdktOLUk8HCN@lpieralisi>
 <aB230INCy2h7X1KY@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aB230INCy2h7X1KY@lpieralisi>
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

On Fri, May 09, 2025 at 10:07:44AM +0200, Lorenzo Pieralisi wrote:
> On Thu, May 08, 2025 at 12:44:45PM +0200, Lorenzo Pieralisi wrote:
> 
> [...]
> 
> > I noticed that, if the irq_set_type() function is not implemented,
> > we don't execute (in __irq_set_trigger()):
> > 
> > irq_settings_set_level(desc);
> > irqd_set(&desc->irq_data, IRQD_LEVEL);
> 
> I don't get why the settings above are written only if the irqchip
> has an irq_set_type() method, maybe they should be updated in
> irqdomain code (?) where:
> 
> irqd_set_trigger_type()
> 
> is executed after creating the fwspec mapping ?
> 
> Is it possible we never noticed because we have always had irqchips that
> do implement irq_set_type() ?
> 
> Again, I don't know the history behind the IRQD_LEVEL flag so it is just
> a question, I'd need to get this clarified though please if I remove the
> PPI irq_set_type() callback.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/platforms/52xx/mpc52xx_pic.c?h=v6.15-rc5#n218

There are other examples in powerpc, this does not look right to me.

Lorenzo

> Thanks,
> Lorenzo
> 
> > which in turn means that irqd_is_level_type(&desc->irq_data) is false
> > for PPIs (ie arch timers, despite being level interrupts).
> > 
> > An immediate side effect is that they show as edge in:
> > 
> > /proc/interrupts
> > 
> > but that's just what I could notice.
> > 
> > Should I set them myself in PPI translate/alloc functions ?
> > 
> > Removing the irq_set_type() for PPIs does not seem so innocuous, it is a
> > bit complex to check all ramifications, please let me know if you spot
> > something I have missed.
> > 
> > > > On the other hand, given that on GICv5 PPI handling mode is fixed,
> > > > do you think that in the ppi_irq_domain_ops.translate() callback,
> > > > I should check the type the firmware provided and fail the translation
> > > > if it does not match the HW hardcoded value ?
> > > 
> > > Why? The fact that the firmware is wrong doesn't change the hardware
> > > integration. It just indicates that whoever wrote the firmware didn't
> > > read the documentation.
> > > 
> > > Even more, I wonder what the benefit of having that information in the
> > > firmware tables if the only thing that matters in the immutable HW
> > > view. Yes, having it in the DT/ACPI simplifies the job of the kernel
> > > (only one format to parse). But it is overall useless information.
> > 
> > Yes, that I agree but it would force firmware bindings to special case
> > PPIs to remove the type (#interrupt-cells and co.).
> > 
> > From what I read I understand I must ignore the PPI type provided by
> > firmware.
> > 
> > > > Obviously if firmware exposes the wrong type that's a firmware bug
> > > > but I was wondering whether it is better to fail the firmware-to-Linux
> > > > IRQ translation if the firmware provided type is wrong rather than carry
> > > > on pretending that the type is correct (I was abusing the irq_set_type()
> > > > callback to do just that - namely, check that the type provided by
> > > > firmware matches HW but I think that's the wrong place to put it).
> > > 
> > > I don't think there is anything to do. Worse case, you spit a
> > > pr_warn_once() and carry on.
> > 
> > Thanks,
> > Lorenzo

