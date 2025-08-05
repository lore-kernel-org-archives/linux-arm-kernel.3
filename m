Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858E4C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1stRv39LmYECfg0MkI3MpUaBOujoCH1DlyITtkzFTnk=; b=jYF3pJ/qidomNaSxiLzxwuXtOF
	Uqw2yxB6UzBgxiwqkictmrZLLBZYGAIibuRan2ZthoeDKxbQJKH2ao1rmLChxr5Aodc20Wu1p1tW7
	VD8H8DXJu7Hu0lPbPBm2Km+wxwU2Fsggfa82CX11RRl9fFlr76WLL/167YA6EPEie0039vx8QPe9R
	rCrD/LyUZFib5quJ8zUEW5nKdHxSZeUdDc+e9tQ24WZYoTp9nz8a+NQmWw9mw1+QHAenTOY9yAbPH
	Qg2BGKOUXykhzZ1NgLW/Qh5UH0l+NHTnWxYQMyIiMou/RFSOFFLKIIzaY0cyETzRrflugIK4VCLjK
	DP7ojfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujL0q-0000000DMQt-2JaN;
	Tue, 05 Aug 2025 16:59:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujIyY-0000000D441-0ke9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 14:49:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AD65601D1;
	Tue,  5 Aug 2025 14:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8177C4CEF0;
	Tue,  5 Aug 2025 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754405353;
	bh=g7knE9ug0EmLDYjRKXiNJuFaF+Il11QTq54rtre3QTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upqPGit0HxC6HEwZVDb3Jwfamg/tWADYMK0T14l0IR9HlXFGJpNC2chDD/mhZDOkR
	 HlFXfopKreQpfgX8X6nWJchIqjBu34biQCrNW8JdVBPOWLhoMPkK5ruHkVlDOWDxAT
	 soY3A4nMlhLEzZhEPAHgH9dnFasI4ICkNLEocDubp9zeCZP1tWE3e7mvivP6d2Da8M
	 +C98jjOQ6ijGd1CgTXx/9Ku8iw+w9yKXeg9f3zMpm4UmtA4IkGUEvTQ/ll9ZLEQhtf
	 EQUYapC684MPbPXqeNlNy++nANFWsk+a/XaYoRZjYottBvy129CEIQq1wPphQRh6cR
	 CzLEqHlqqskLg==
Date: Tue, 5 Aug 2025 15:49:06 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: perlarsen@google.com, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, ahomescu@google.com,
	armellel@google.com, arve@android.com, ayrton@google.com,
	qperret@google.com, sebastianene@google.com, qwandor@google.com
Subject: Re: [PATCH v7 4/5] KVM: arm64: Bump the supported version of FF-A to
 1.2
Message-ID: <aJIZ4v0X74zox1xZ@willie-the-truck>
References: <20250701-virtio-msg-ffa-v7-0-995afc3d385e@google.com>
 <20250701-virtio-msg-ffa-v7-4-995afc3d385e@google.com>
 <aHpP7fntDQ7SMPAC@willie-the-truck>
 <86zfck7pys.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zfck7pys.wl-maz@kernel.org>
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

Hey Marc,

(we discussed this very briefly offline but I wanted to reply for the
benefit of everybody else and also because I don't recall quite where we
ended up)

On Thu, Jul 31, 2025 at 08:56:59AM +0100, Marc Zyngier wrote:
> On Fri, 18 Jul 2025 14:45:17 +0100,
> Will Deacon <will@kernel.org> wrote:
> > On Tue, Jul 01, 2025 at 10:06:37PM +0000, Per Larsen via B4 Relay wrote:
> > > From: Per Larsen <perlarsen@google.com>
> > > @@ -734,7 +741,10 @@ static int hyp_ffa_post_init(void)
> > >  	if (res.a0 != FFA_SUCCESS)
> > >  		return -EOPNOTSUPP;
> > >  
> > > -	switch (res.a2) {
> > > +	if ((res.a2 & GENMASK(15, 2)) != 0 || res.a3 != 0)
> > > +		return -EINVAL;
> > 
> > Why are you checking bits a2[15:2] and a3? The spec says they MBZ,
> > so we shouldn't care about enforcing that. In fact, adding the check
> > probably means we'll fail if those bits get allocated in future.
> 
> I have the exact opposite approach. If we don't check that they are 0
> for v1.2 and previous versions, we won't be able to tell what they
> mean when they are finally allocated to mean something in version
> 1.337.
> 
> Until we support such version, MBZ should be enforced, because we
> otherwise don't understand what the "client" is trying to say. And we
> don't understand, we're guaranteed to do the wrong thing.

We've lost a bunch of context in the diff here, but there are two
important things to keep in mind at this point:

  1. We've negotiated a known version of FF-A, so it won't be v1.337 and
     we _should_ be able rely on the spec authors not breaking stuff
     retrospectively (famous last words...)

  2. The response we're parsing here is something that has come back
     from TZ after we (the hypervisor) have called FFA_FEATURES. If
     those MBZ bits are non-zero, I think should just ignore them.

Cheers,

Will

