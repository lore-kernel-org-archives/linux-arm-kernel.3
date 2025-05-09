Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D35C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxWG6kmie/x+Gg/dyvGEuwxWMHIy2dluPodpo1dH2kg=; b=fMhMBwhk0BeVSomq950tqv59mZ
	3yKjbru788s5fX7Y/04FYxMgG8bOujlybLQPYb+fr92E/uHf+JT9wDweqGxn2O+CQ8GgSdH/hHljR
	eTL/9I8rGgooZxKoNUbmzoXK8YA6zlEkb2/70gi6dSB8mL79wWYcV/3qBGbulMkqc58ZVHZEcauvI
	t+wamGr6P464hqVdF10OHw21tW2C1knpK/jmEbuSLulzkkF07SHPj58w4n23YPjpBTIFu7V4n7DCe
	wH6TcUw6PxqusSNTlY4ifBflCnTYkx1U7oXc3UgEV+ByYXjMj+UZWTn5CVFWpBcFWd//GDUNWQz1C
	KqMelyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKBp-000000038B3-3yM3;
	Fri, 09 May 2025 09:38:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIls-00000002ruh-28IE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:07:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FC28A4C53E;
	Fri,  9 May 2025 08:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191EEC4CEE4;
	Fri,  9 May 2025 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746778071;
	bh=G+2xW4f4im1ZGvz/fL91IZspYYNNNbveNgpD+exM6VQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PSwbqDGHnH/Ce03Zkp0UtJvHSDZBjCj92DxlbpzMIcYwXitlGXVv36ko7XZ76KD93
	 uENkmmzWQv6EdtCeNdy9NDTn5upRmaX9sYqj2E17WWHwQSTk6EWwlDQbIRVsgLCbMX
	 ff8M0p82GkwB9Sveef05u57tY6/goSV+w/Hm/Dq9JsVEHkbz46xv1jrEd31WQXsnG7
	 Q5otO3uHFswBtbaKWREpsBb3yNR61frsfm0jxM8H5lg/+DObSFzBeNKpn+uEiCc67G
	 n2DvNZbHbCL+RL3R42ex8xvcwcROW36A+jbTzYKdjsgpG0TFeBFkHrqVOLlVTDgUKO
	 NUabyvv/2AxDg==
Date: Fri, 9 May 2025 10:07:44 +0200
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
Message-ID: <aB230INCy2h7X1KY@lpieralisi>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org>
 <87zffpn5rk.ffs@tglx>
 <86a57ohjey.wl-maz@kernel.org>
 <87ecx0mt9p.ffs@tglx>
 <867c2sh6jx.wl-maz@kernel.org>
 <874ixwmpto.ffs@tglx>
 <aBxgceQBRA6vBK7o@lpieralisi>
 <864ixvh4ss.wl-maz@kernel.org>
 <aByLHdktOLUk8HCN@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aByLHdktOLUk8HCN@lpieralisi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_010752_682219_5170D145 
X-CRM114-Status: GOOD (  37.53  )
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

On Thu, May 08, 2025 at 12:44:45PM +0200, Lorenzo Pieralisi wrote:

[...]

> I noticed that, if the irq_set_type() function is not implemented,
> we don't execute (in __irq_set_trigger()):
> 
> irq_settings_set_level(desc);
> irqd_set(&desc->irq_data, IRQD_LEVEL);

I don't get why the settings above are written only if the irqchip
has an irq_set_type() method, maybe they should be updated in
irqdomain code (?) where:

irqd_set_trigger_type()

is executed after creating the fwspec mapping ?

Is it possible we never noticed because we have always had irqchips that
do implement irq_set_type() ?

Again, I don't know the history behind the IRQD_LEVEL flag so it is just
a question, I'd need to get this clarified though please if I remove the
PPI irq_set_type() callback.

Thanks,
Lorenzo

> which in turn means that irqd_is_level_type(&desc->irq_data) is false
> for PPIs (ie arch timers, despite being level interrupts).
> 
> An immediate side effect is that they show as edge in:
> 
> /proc/interrupts
> 
> but that's just what I could notice.
> 
> Should I set them myself in PPI translate/alloc functions ?
> 
> Removing the irq_set_type() for PPIs does not seem so innocuous, it is a
> bit complex to check all ramifications, please let me know if you spot
> something I have missed.
> 
> > > On the other hand, given that on GICv5 PPI handling mode is fixed,
> > > do you think that in the ppi_irq_domain_ops.translate() callback,
> > > I should check the type the firmware provided and fail the translation
> > > if it does not match the HW hardcoded value ?
> > 
> > Why? The fact that the firmware is wrong doesn't change the hardware
> > integration. It just indicates that whoever wrote the firmware didn't
> > read the documentation.
> > 
> > Even more, I wonder what the benefit of having that information in the
> > firmware tables if the only thing that matters in the immutable HW
> > view. Yes, having it in the DT/ACPI simplifies the job of the kernel
> > (only one format to parse). But it is overall useless information.
> 
> Yes, that I agree but it would force firmware bindings to special case
> PPIs to remove the type (#interrupt-cells and co.).
> 
> From what I read I understand I must ignore the PPI type provided by
> firmware.
> 
> > > Obviously if firmware exposes the wrong type that's a firmware bug
> > > but I was wondering whether it is better to fail the firmware-to-Linux
> > > IRQ translation if the firmware provided type is wrong rather than carry
> > > on pretending that the type is correct (I was abusing the irq_set_type()
> > > callback to do just that - namely, check that the type provided by
> > > firmware matches HW but I think that's the wrong place to put it).
> > 
> > I don't think there is anything to do. Worse case, you spit a
> > pr_warn_once() and carry on.
> 
> Thanks,
> Lorenzo

