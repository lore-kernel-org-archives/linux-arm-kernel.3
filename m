Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67B1C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSaY8hFogQ8XMCarbwj5OucKl8VFySrfC7cRQOJejcs=; b=qizIuNXN5uQLMLvDju24Hb3cRw
	TsjZt3o15DAmmjfKSnLt7WKSWaeffmAyD63aXhj1tWGGlJ8kGS33NSJelJawFz2CgVnHeYA9GR59q
	C04QYKKlNneCJSmPk4RAU7cewas1hOAtcudQngvPcOy+jSBl4yOvP3l+fVAklcZ2fphTJXOTqoxx9
	/mQ+UcZg6+yJE2XnBiZbJ/NyXSXHKFPhghQ5z1M7XiBu7AOiq0CB6PlIFMMcqAuNRTMlJ6CPz3pJx
	CJ2BMlpPinmGAYQJ+gm/gsj0k0Uj+yo/CQAH5PbBC9hWOxhysYGoRlaO3ew3/WfIHqcXiqas46Tmm
	RPWNF9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3a7O-000000071O3-3lF2;
	Mon, 07 Sep 2026 14:14:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3a7N-000000071Mn-1ug6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:14:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 385AD410B5;
	Mon,  7 Sep 2026 14:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13F91F00A3A;
	Mon,  7 Sep 2026 14:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788790481;
	bh=vSaY8hFogQ8XMCarbwj5OucKl8VFySrfC7cRQOJejcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NhoyMxVXLvulJLaKclIWhey+zgZ3IDzhbkoezViwyf/Uj/o2j2rj5/DAnppDI556c
	 RtNPIYDrUsFyY/9uH3cimmT0KElBGmbB8AVwypDnqQLonLQu+mwlhnZ3a3NAECgOfg
	 1D39BRQRZ5XQofKPUoAIjIYrdWjbf1QPtmef6KMEZplUV0meDYbA5jOnhye1HgAcwl
	 N/xK+z16UrOabUYhTrqi6r3KofzuzKLqLrymAtOrPvYv9IWjaKTXgA0Qt7ue4q3uip
	 KoW8J315Vdl/a36GJCkPTqpZhN6ByI5J+3N7Yyux3QEeRuy62GRcVZclr4dnLoo09w
	 zlF9rtE5IBO6w==
Date: Mon, 7 Sep 2026 15:14:34 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 03/14] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <ap7GPxGs3nhT70sS@gremlin>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
 <20260901-arm64-gcs-v20-3-f31750bdfadb@kernel.org>
 <apmfx08vccSd2MXw@gremlin>
 <d2659ac3-2f00-4fc4-8f9e-0585691a4ba2@sirena.org.uk>
 <apqA_SuoA6-TyHsS@gremlin>
 <apszJZ17KUvd6BJ7@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apszJZ17KUvd6BJ7@sirena.co.uk>
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

On Fri, Sep 04, 2026 at 10:07:49PM +0100, Mark Brown wrote:
> On Fri, Sep 04, 2026 at 09:54:51AM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Sep 03, 2026 at 09:41:26PM +0100, Mark Brown wrote:
>
> > > originally written the code without expressing this dependency but on a
> > > previous version Marc asked for this nesting as an optimisation.  Since
> > > it's about optimisastion adding checks that don't otherwise exist on the
> > > restore path would doubtless get the similar complaints.  Exactly the
> > > same concerns were raised on v19.
>
> > Could you implement the nesting the same in the cases where there is a bare
> > ctx_has_gcs() as an alternative?
>
> > So then it'd always be tcrx -> s1pie -> gcs everywhere and that'd resolve things
> > also and make things symmetric.
>
> > You could also I think express the dependency if it makes sense to.
>
> Clearly we *can*, it's a question of what'd be acceptable - it'd result
> in the compiler emitting a bunch of extra alternatives and conditionals
> in the context switch path.

Right. And that's presumably a rather _sensitive_ bit of code.

>
> > > We could do checking of the ID registers at vCPU creation so we could
> > > avoid worrying about them in the fast path but there was also feedback
> > > about not doing that.  One idea I had was to generate feature
>
> > Could you possibly check in sanitise_id_aa64pfr1_el1(), something like:
>
> Sanitising the writes is a bit tricky since multiple ID registers are
> involved, TCRX and S1PIE are in ID_AA64MMFR3_EL1 while GCS is in
> ID_AA64PFR1_EL1 so you'd create an ordering constraint for userspace,
> and you'd also have to handle the case where TCR2 or S1PIE are turned
> off with GCS already enabled.  It feels like a bunch of complication,
> especially if you start applying the same approach with other features.

Yeah, you're right, it is a bit of a nightmare and feels like it could get
a bit combinatorial.

>
> If we're going to validate the ID registers it feels safer to check at
> the point where we finalise the ID registers and refuse to start the
> vCPU if there's an unsupportable configuration, that would mean the
> check would only need to be done in one place and userspace wouldn't
> trip over any ordering requirements with how it updates registers.  Only
> userspaces that set architecturally invalid configurations should see an
> error.  We could also handle things by fixing up the configuration at
> the same point, disabling features that are missing their dependencies,
> that's a bit more friendly in the short term but could lead to trouble
> later on as it means we hide issues in userspace.
>
> I think the best thing overall would be to leave the runtime paths as
> they are and refuse to run with an architecturally invalid setup, that
> would avoid bloating the fast path.

Ack, it'd be nice to not have to worry about that.

Presumably we definitely want an oops on a GCS violation in general?

--
Cheers, Lorenzo

