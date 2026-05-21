Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C28CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 16:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksaTnf0cqRZNXRWIsXImk13kcKMosFx8tMXi881IeTg=; b=uhiEBCAjIrzBmmjn53qTvq3Hff
	ngTb5OShGkItzlSMpZgMJuzgBcwsjbu6M8hAD3v2s6Pe5zW15ObCCIeWq7/dwIFwhadIlmfZSDxA1
	ylq8eykuNdp/81dHyteKpM8o2EHtg4v00Z9xFUnsrxVhpItDmwffSaF1IRpWwwaWAX6DNPnS6cNyo
	9YD6YeuBrRiFUV7EnvClWHITibQYoJ7EC44SQsUS5m49aQDJ8ZOKG8KABUbnjzBPkiwPNhmmMADg7
	5x3Ozkm5RAOhmhvX7cVvlkyMHj4n222kf8iPgKbSRew5IC/HjqOl/FCB2hJDIno7H79XNfSKcUmFL
	CWGhu3Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6CR-00000008Tdp-3heS;
	Thu, 21 May 2026 16:24:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6CP-00000008Tcb-3v7R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 16:24:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 29C6B41570;
	Thu, 21 May 2026 16:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988511F000E9;
	Thu, 21 May 2026 16:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779380681;
	bh=ksaTnf0cqRZNXRWIsXImk13kcKMosFx8tMXi881IeTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oTuUMrLMrINhZ0HC8rI2RyPAEwsTZARy4XoUfq2JHYVySSBMhIlOSBZ70vjw6UJMD
	 3KEYhdncefsrE+EtmGcUmb+JCP9bZkYXbZdS6raEeDsuXBNTqa07PdlUpyIicOIQ8/
	 j40I2zrLvJMeXnw++vObStveSjzhIMYpR9q1c2PVHxD5xtoOio4HqvdhSUzAQCjLd8
	 qO4ExBq7TQC9yMS832pBSMFV68NCm3ZA5XLoGo8YUoQrcBGEyP1W8voUJgxoF+wS+V
	 wQJm21t/4ap+4bVdMJ5UX7L6LUy3JWspBAgUY4m7NhfMt5J8aHwbQMB3fORk7wUog1
	 w4zKSNzlJTFaQ==
Date: Thu, 21 May 2026 17:24:36 +0100
From: Lee Jones <lee@kernel.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] power: sys-off: fix Pixel C shutdown via
 MAX77620
Message-ID: <20260521162436.GG3591266@google.com>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <177929432727.2891971.15568098895295536822.b4-ty@b4>
 <31ef61bd-6672-440a-a52e-eedb950d3d03@tecnico.ulisboa.pt>
 <20260521104136.GA2921053@google.com>
 <f98bcd81-29c6-4df2-8040-d17686b28f45@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f98bcd81-29c6-4df2-8040-d17686b28f45@tecnico.ulisboa.pt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_092442_015033_6E42F573 
X-CRM114-Status: GOOD (  30.99  )
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

On Thu, 21 May 2026, Diogo Ivo wrote:

> 
> 
> On 5/21/26 12:41, Lee Jones wrote:
> > On Thu, 21 May 2026, Diogo Ivo wrote:
> > 
> > > Hi Lee,
> > > 
> > > On 5/20/26 18:25, Lee Jones wrote:
> > > > On Thu, 14 May 2026 16:47:18 +0200, Diogo Ivo wrote:
> > > > > This series migrates PSCI and MAX77620 poweroff handling to the
> > > > > sys-off framework and fixes shutdown on the Pixel C (Smaug).
> > > > > 
> > > > > The first two patches replace legacy pm_power_off usage in the PSCI
> > > > > and MAX77620 drivers with sys-off handlers. Besides aligning both
> > > > > drivers with the modern poweroff infrastructure, this removes the
> > > > > global callback dependency and allows multiple handlers to coexist
> > > > > with explicit priorities.
> > > > > 
> > > > > [...]
> > > > 
> > > > Applied, thanks!
> > > 
> > > Thanks for applying the patches! Just a question and an observation:
> > > 
> > >   - I'm assuming you were ok with merging [2/4] despite the possible
> > >     deadlock since this risk is already present in mainline in the same
> > >     form so we're not actually making things worse, is that so?
> > 
> > Did you see the text below?
> 
> Yes, but patch 3 is not addressing the possible deadlock hence my
> question.
> 
> > Both patches 2 and 3 are applied.
> > 
> > >   - The observation is that the comment about overriding PSCI is only
> > >     true after (and if) a reworked [1/4] is actually merged.
> > >     If it isn't then patch [3/4] is actually working around another handler
> > >     in soc/tegra/pmc.c where a handler that only does work for the Nexus
> > >     7 is actually registered at FIRMWARE level for all platforms that
> > >     probe that driver (I will send out a patch shortly to only register
> > >     the handler on the Nexus 7).
> > 
> > I assume the other patches will be applied soon.
> > 
> > If this causes some kind of issue - let me know later on in the cycle
> > and I'll remove whatever patches you ask me to.
> 
> The PSCI patch [1/4] has a fundamental issue and needs a respin to be
> applied.
> 
> In connection with this it might then become easier to quirk the PSCI
> driver rather than the PMIC driver, so for the moment I'll ask you to
> drop [3/4] until I propose the changes to the PSCI maintainers and see
> the feedback and at that point we can either completely drop [3/4] or
> reapply it; sorry for the noise.

Done.

-- 
Lee Jones

