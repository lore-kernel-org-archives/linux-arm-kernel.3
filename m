Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CF1C3ABCA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMF7ZXpviEjAOz/hYTLS98ispG4rOTh92fLcSQOqrJg=; b=3nqzNDSxPzhkRApL8SU+7C3L/B
	w6VGyaPvq5m0jByTzV+A+exoyJrp/zhRKaW+YOQ12jpANRiBpXmMM8+LP5H87WsI8hxQ9ihTMuRZ/
	xWGJZR7I50dwA3tatArhP9Co5lrtTA63WvpNo3Lyk8IsNavWMReoDIF7t6Am/rlE+DVQVsxvfB8Zw
	s0DLByFXZtXbb1LuU7uspGTsW8NFtxpNqmYPsqm3eTiyl2cjQkb/JHsf45875C9fVcSGQhcDT1I+I
	bonzLakmucio10aucHDzUiHfOtVhNT/L0/n6SE6mPhFnejH0vxFUSNjMMKRnYVq6aEmOvLPBNbSnH
	ydcNeo3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWj-0000000GI91-3Vo5;
	Wed, 07 May 2025 17:25:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh0U-0000000G2A7-2hih
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:48:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC2A8629D7;
	Wed,  7 May 2025 15:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818E0C4CEE2;
	Wed,  7 May 2025 15:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746632905;
	bh=+nifJ1mcgdFZ8EQHTT9wprTRUK74+bCGpuEhl19I9hQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KumkK6FP8mLHEoo+i2rNeZK2niwKQ3cSDNcDqMHEZgZGTc1+czCzAhv4mix2mxK73
	 L2JB582kCNCrSo6M32QqIwkLZVlZLqTBxzoed3Tt/cgCmL9Cn5VQWwi143b9fbeCFq
	 65bfbrfyNwV+UcvlrqDgxaSYEVy0mDdgiT9+bqxg4VDq37rbGQPCtR5mVDLpM16Y3L
	 9LQ5tHZCfI4mAypRnWjG8JHkOmCZJAfbbonq4ormQC3n+uJyLJT7QFRGILaf8yvNfJ
	 /HaRCWKY40P97VWOlE4B7trwZtQztaGKaKsL7C69Ly2kOZnjEV1kBwiBeQH0acca4L
	 3/kOMWSn6cyBQ==
Date: Wed, 7 May 2025 17:48:18 +0200
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
Message-ID: <aBuAwjiSJ+01vJL+@lpieralisi>
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

GICv5 PPIs handling mode is fixed (ie ICC_PPI_HMR<n>_EL1 is RO), can't be
programmed, I removed the irq_set_type() function (for the PPI irqchip).

Lorenzo

