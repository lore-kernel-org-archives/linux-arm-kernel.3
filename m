Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CD5C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OG8+oO3MiJQxvgBRkaozqPUNA+zVrcsAibLs9HogF8=; b=lMXP8X4mqnzsySNYlTxZfFgHdh
	BRjLCwnilDRCQrA8hzhEBl06cRqnAH7fSk1O9SzoE8pBdc2/pYKOIaJaCVnXFboLtcwzZ+YglXoHH
	8IRNuP80LFKroLo7ZEVzjzbraJAKPJfrJ1vh58UBNhTvxYGuHpMh625TmcOw49+AWErc9D/DKS215
	hcnf9Hp0ZBj6Y9gCxbJZ2hK6HhPy2Uiw6JpZCM/ffBj1IOc9jnwAWI4rQ9VED1ojgTOntAbjJML6A
	hyr4LWiEt2rqBFgtmImbe7lvyB1IuwldVecbJA/HwG3J9URqWsAZHitVJmxfJxx4Z0q8AHHkeZTiG
	MusTjjkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAlPo-00000001AfM-1v9N;
	Fri, 02 May 2025 08:06:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAlNr-00000001AKR-3ky2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 08:04:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F3915C571C;
	Fri,  2 May 2025 08:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D417C4CEE4;
	Fri,  2 May 2025 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746173075;
	bh=ArvrCl6LeK7SKJMaqMa0YkfqbqIqXzNihw4OxLI2rLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HS9tIkpO8zMLCggb8vl44ZNDuQBxzvUdWXU1jVpSVWelUTA8pwi6EqPs/1oRly8nR
	 rkz1ou8EDkUVpYt6FyMUMjcR6aH+aCKwXVgujJ2dymSaYyYkCbjelG3DpKILRLLJxc
	 OktdShWNq6CAoztHBMKNjZBgXfvUJXPxRvJugeLm8wtt0fQhvTTRR4roM3uw7b8d1T
	 WkN1+2Fa01CA69Y3UGXWwNdQV3UZwg3EDmP9XPhoJBGWWQLZRFvUbdkf8PBSb3frks
	 yHmxRBiP5BbJj2kRub8CFz+ubXNo6ygf1WPpCZKCLVCXoqS2/VDJY4buA3NtpRiLhI
	 0qb6/lxJ0+gCg==
Date: Fri, 2 May 2025 10:04:27 +0200
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 21/22] irqchip/gic-v5: Add GICv5 IWB support
Message-ID: <aBR8i56xO6uNCt/G@lpieralisi>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
 <20250424-gicv5-host-v2-21-545edcaf012b@kernel.org>
 <867c31j20i.wl-maz@kernel.org>
 <aBJO9GEyb+0t6W6u@lpieralisi>
 <86tt64h0x9.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86tt64h0x9.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_010435_974562_394F5CC6 
X-CRM114-Status: GOOD (  27.91  )
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

On Thu, May 01, 2025 at 03:15:46PM +0100, Marc Zyngier wrote:

[...]

> > If we are, we use the msi_alloc_info_t->hwirq to define the LPI eventid,
> > basically the IWB wire, if not we just allocate an eventid available from
> > the device bitmap.
> > 
> > Other than that (and being forced to provide an IWB irqchip.irq_write_msi_msg()
> > pointer even if the IWB can't write anything otherwise we dereference
> > NULL) this works.
> 
> Not even MBIGEN allows you to change the event. If you really want to
> ensure things are even tighter, invent a MSI_FLAG_HARDCODED_MSG flag,
> and pass that down the prepare path.

I tried to set a new alloc flag in the IWB msi_domain_template.ops.set_desc()
callback and it works.

It can be set in the IWB driver (and does not change anything else),
it works so happy days.

> > Is there a better way to implement this ? I would post this code with
> > v3 but instead of waiting I thought I could inline it here, feel free
> > to ignore it (or flame me if it is a solved problem I failed to spot,
> > we need to find a way for the IWB driver to pass the "fixed event" info
> > to the ITS - IWB eventIDs are hardwired it is not like the MBIgen where
> > the irq_write_msi_msg() callback programs the wire-to-eventid
> > translation in HW).
> 
> It's *exactly* the same. And see above for a potential explicit
> solution. The empty irq_write_msi_msg() is not a problem. It's
> actually pretty clean, given how the whole thing works.
> 
> Please fold this into your v3, and we'll take it from there.

I will with the new alloc flag above, thanks.

Lorenzo

