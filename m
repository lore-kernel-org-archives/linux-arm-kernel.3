Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CF0C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 16:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0yUPfDA913yUVRaqKPVtmx0KUuO0P4569cCqcSbHUU=; b=CYYL6f2myPmmyUSqiF67/0Kqnv
	c4QWBkDSnP5V2y5tqPU+b16dixQTbg6l9zgEdzJZv5yU2Z5EQVYbCyI3iT6NDGY2jmF1AQymy082U
	mX0uAeUjtkj1McU6xDE6q6gQASG/cfD4EYzLdSlJPjaZXDFO98H8lqIcsOD5Ij2rNMsfzGZXPKA5h
	bX9LPJZ1IhUswxMze9u2F/y99KCqU2Pe5gN/uAPtwninl/MWrxVSPTpA4ysaQeX3QZzxQQA7cQqvn
	fr0EMhnxIRDbpT1TerAwrxBBoJ73ajmX6QDXFqEZBzi7c7nHWq2kJza0I+vPn3R1m/PsHQJVdaXzS
	5Oa5OCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMr7c-0000000Dnpu-48Ef;
	Wed, 04 Jun 2025 16:37:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMr5W-0000000DnaM-3ESv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 16:35:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D93D0614BC;
	Wed,  4 Jun 2025 16:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4B8C4CEE4;
	Wed,  4 Jun 2025 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749054937;
	bh=bvurVI1LpPnY3JIRxy7/BJjVKXElOxjO6xxlddeu1CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=scI70OW08HFi5o6W890W7Xetgm51jFGoRvAoyEflLYSXv+VQ1O9lNMBkXQg7lxYXX
	 wh+7cLfW5d0l6zyyM4qgVCV8tg2Kxv0t+yFa5rj2PwHlXUApQvsnR094N1fzvveMDG
	 GH2kwyvLqrF3jFffdFDiVh7zRdHIb9YV8CyW0wcgZUIkOFR6FpStap15X4vDLufD+v
	 /AWrul29FnQbuy41U467dT4+53KeuNzGqw90T+h1pA8Lm+w3Q9A8KZ54BDMaYqJ6su
	 fAZSBbVmOckDm4vnEZOzZRlrm6D+FJPBeTj1jeIiwUShd4zzC5bQyIW7wNuugFXzHI
	 l24x4Ijc1RLGA==
Date: Wed, 4 Jun 2025 18:35:28 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, andre.przywara@arm.com,
	Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, suzuki.poulose@arm.com
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
Message-ID: <aEB10JC1bwwOJfWh@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
 <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi>
 <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
 <CAFEAcA-JrS0BiT66iin-pRVFadrY-pnJZ8TkDNxcjErknSCnUA@mail.gmail.com>
 <CAL_JsqL7x53an2-MaLHP5tfVXb4JxT8ORUMaA8pL-gMsWLJqkA@mail.gmail.com>
 <aD/0tuak7Hja8k4g@lpieralisi>
 <878qm7ec19.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878qm7ec19.wl-maz@kernel.org>
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

On Wed, Jun 04, 2025 at 04:56:02PM +0100, Marc Zyngier wrote:
> On Wed, 04 Jun 2025 08:24:38 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > On Tue, Jun 03, 2025 at 02:11:34PM -0500, Rob Herring wrote:
> > > On Tue, Jun 3, 2025 at 10:37 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > >
> > > > On Tue, 3 Jun 2025 at 16:15, Rob Herring <robh@kernel.org> wrote:
> > > > >
> > > > > On Tue, Jun 3, 2025 at 2:48 AM Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > > > > >
> > > > > > On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > > > > > > secure.txt says:
> > > > > > > # The general principle of the naming scheme for Secure world bindings
> > > > > > > # is that any property that needs a different value in the Secure world
> > > > > > > # can be supported by prefixing the property name with "secure-". So for
> > > > > > > # instance "secure-foo" would override "foo".
> > > > >
> > > > > Today I would say a 'secure-' prefix is a mistake. To my knowledge,
> > > > > it's never been used anyways. But I don't have much visibility into
> > > > > what secure world firmware is doing.
> > > >
> > > > QEMU uses it for communicating with the secure firmware if
> > > > you run secure firmware on the virt board. It's done that
> > > > since we introduced that binding. Indeed that use case is *why*
> > > > the binding is there. It works fine for the intended purpose,
> > > > which is "most devices are visible in both S and NS, but a few
> > > > things are S only (UART, a bit of RAM, secure-only flash").
> > > 
> > > I meant "secure-" as a prefix allowed on *any* property, not
> > > "secure-status" specifically, which is the only thing QEMU uses
> > > AFAICT. IOW, I don't think we should be creating secure-reg,
> > > secure-interrupts, secure-clocks, etc.
> > 
> > Reading secure.txt, what does it mean "device present and usable in
> > the secure world" ?
> > 
> > So:
> > 
> > status = "disabled"
> > secure-status = "okay"
> > 
> > basically means that the device in question allows secure-only MMIO
> > access, is that what it says ?
> > 
> > If that's the case and we really want to have all config frames
> > in a single DT, would it be reasonable to have an IRS/ITS DT node
> > per-frame ?
> > 
> > Then yes, the secure- tag is not enough any longer (because we have to
> > cope with 4 interrupt domains) but that's a separate problem - again,
> > this would leave the current reviewed bindings unchanged.
> 
> No, this is the same problem, and we need a way to address it.
> "secure-*" doesn't cut it in a system with FEAT_RME, where resources
> are only available to a single Physical Address Space (PAS). So we
> need a way to qualify these resources with a PAS.

Can I ask again what:

status = "disabled"
secure-status = "okay"

for a device means in practice in the current bindings ?

When I said "a separate problem", I meant that, extending secure- tag
(that applies to the "status" property only) to cover other PASes is
independent from the GICv5 binding *if* we define, for a single DT an eg
IRS device per-PAS (with realm-status, root-status, describing what the
reg property represents. Is that what secure-status does today ? Does
it say "this device MMIO space is secure-only" ?).

It does not look like there is much appetite for tagging the reg
property either and making it GICv5 specific is a shortcut IMO.

> Either that, or we have to restrict DT to describe the view of a
> single PAS. Which Peter will understandably be unhappy about.

Well, I listed a couple of options in this thread, let's try
to converge.

Thanks,
Lorenzo

