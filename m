Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DD7C5AE5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4nGvXPsWJuwyBMIlf3XtK/H52w5DG4jgy1kwvSaw5g=; b=ac3Tfhb+ttIqaUFwwlZwRnhw6+
	Aqb+LYAuvx5JkGf63Kzf0wZwidBqaPlqKBc8c8b8UVCfkrR0imaN+I3wq0uamHtqO58K4pk/nkANR
	lmahsXt+f0cFEVxKTxeWvXTU9AQ++fX4XVX+4UgTzhXJYIluDav4QfDXm6kPDxU+zuMkzpp1VTJOJ
	47k56PSTT9+5PPeVAN9lLbAfPDrQY999CF3GGD+lnGJ3lUcCti/fWKso9JdIfzrUPKQgNn+8TaPHc
	5kNf0UmyBMvS/uQWAZayhB+PqMKWSkFIberNlmpjncMbQNRACkqb2ZQ6Ah8rtvRm4+wnVHNXGPeCA
	TUYd4kfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNxJ-0000000BZss-0R6P;
	Mon, 10 Aug 2026 11:14:09 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNxG-0000000BZsJ-10Er;
	Mon, 10 Aug 2026 11:14:07 +0000
Date: Mon, 10 Aug 2026 13:13:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786360440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r4nGvXPsWJuwyBMIlf3XtK/H52w5DG4jgy1kwvSaw5g=;
	b=sBoJIbFHEDak6cyv8L6XEGtm5J6FbBrRbDYLM71gW0uy8R4+lHAe2NZN3TAB+Jme/1k045
	3nNVfPqOcg6JHLmx9gEqUoWlIpJ8499kozHpf13rjGiZVjqYF4neK0oDvsLWnuAXJlF7q0
	ic9YNDle9sWL5iVn8kWe74nMTXyKJAJNPVf1zHj9r+gTrqPE/agiTi0GdAVkpIl8NXos5l
	wU2dqEXFN5NB8Sw25dJEU4qaPiJeaIgJlcwiS9CZ4IH8kiRoXrWJH5qLzD8xjf48BeL1Gu
	KZg4GLuPCyCzbmrfF+69to9yRJ2Ns3bvbh0fHr5kPy6iuRuZ33rrpZA1YwdZzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786360440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r4nGvXPsWJuwyBMIlf3XtK/H52w5DG4jgy1kwvSaw5g=;
	b=8M9UZhHJ8PpbLcPxMvofNRwhipNdROgHHMFzMv5I+mwIh++jg1nLW0g/b7h7WTT0wQlfaJ
	Aj9xL8mQ6okS+WDQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Message-ID: <urrsc6dippljgmlochdnetolkhqqj25bbyosgcrw5hy6jpbpao@cgf332hhgdjv>
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
 <20260804-bcm2712-d-stepping-compatible-v3-2-1860094486eb@linutronix.de>
 <6ed9b2e5-b700-477a-8f6f-cb48c597a111@gmx.net>
 <vv6ufnanks27moditlav2ebaub6m5te5tag3m6qv5l65cm25iw@i7m54od3wz4k>
 <ddcb0d9a-2dd4-4808-84db-caf6ea64b48e@gmx.net>
 <pwdgjsfwdnkce4lkkda2hlopajuwuit6jkx2wztoeu4jzzv5ay@yoo4ofvwgrnu>
 <20260810-mustard-sloth-of-enterprise-84b68d@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-mustard-sloth-of-enterprise-84b68d@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_041406_421004_F86AE964 
X-CRM114-Status: GOOD (  33.05  )
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

On Mon, Aug 10, 2026 at 09:19:35AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Aug 05, 2026 at 02:52:44PM +0200, Gregor Herburger wrote:
> > Hi Stefan,
> > On Wed, Aug 05, 2026 at 01:55:50PM +0200, Stefan Wahren wrote:
> > > Hi Gregor,
> > > 
> > > drop Eric and add Peter.
> > > 
> > > Am 05.08.26 um 09:27 schrieb Gregor Herburger:
> > > > On Tue, Aug 04, 2026 at 04:57:09PM +0200, Stefan Wahren wrote:
> > > > > Hi Gregor,
> > > > > 
> > > > > sorry for my late reply.
> > > > > 
> > > > > Am 04.08.26 um 15:13 schrieb Gregor Herburger:
> > > > > > The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> > > > > > and in a c Stepping. There are two separate dts files. The
> > > > > > bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> > > > > > the d Stepping. The d stepping does not set its own compatible/model
> > > > > > string but uses "raspberrypi,5-model-b".
> > > > > In case the SoC and not the board has a D stepping, why do just change the
> > > > > board compatible without the SoC compatible like "brcm,bcm2712-d0"?
> > > > You mean changing both compatible strings? Like this:
> > > > 	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712-d0";
> > > I just want to mention that your explanation doesn't match to your changes.
> > > The first compatible represent the whole board (RPi 5) and the second one
> > > represent only the SoC (BCM2712). Since the SoC is different according your
> > > explanation, i would expect the SoC compatible needs to be changed. And in
> > > case the SoC changes, also the board won't be compatible anymore, correct?
> > Yes the SoC differs in these two versions and the board is maybe the same (but
> 
> Different SoC means different SoC-compatible. If the soc is soldered to
> the board, then it also means board is different. Otherwise how can it
> be the same board if it comes with different elements?
That makes perfect sense. Thanks for the explanation. I will add a board
compatible and a SoC compatible.
> 
> Of course boards can share schematics and everything except some
> component so you could have common compatible.
> 
> 1. Rpi 5b d0
> 2. Rpi 5b
> 3. bcm2712-d0
> 

But I don't think that should be done here. As you explained in the previous
iteration [0] we shouldn't add a non-compatible fallback.

> > not compatible). Compatible strings should go from most specific to most general
> > [0]. If we would have the same first string for both steppings it wouldn't be
> > distinguishable. So at least the first string must be unique.
> > 
> > E.g systemd-boot only matches the first compatible string [1].
> 
> 
> If systemd-boot is not following established for 10 years DT practices
> that systemd-boot's fault, not something to be fixed in DT.

I don't think systemd-boot isn't following these practices. I just wanted to
explain what was the problem for me, and why I wanted to solve it.
> 
> But anyway I did not hear anyone adding/using wrong or fake compatibles
> to satisfy systemd-boot for other hardware.
> 
> Best regards,
> Krzysztof
> 
Best regards,
Gregor

[0] https://lore.kernel.org/all/20260804-unbeatable-fluffy-galago-bfe282@quoll/

