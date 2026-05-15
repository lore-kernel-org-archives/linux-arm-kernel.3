Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D39CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 12:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAERdCcAf+ZF5qTmUF+A1Edol+kXjjnymgdDJ5V9/i4=; b=RlhBtMwM/Mx7BVpjC7O3eJSSiT
	4IvLF24LkZl6S2g9/nfB1KXfC9LFgSiBkINip8cjrYKnC3brEMQFVXOYU/8Th6GIBLpqdt6ckduo9
	MuFPiTj/uaXCvwSCOT64kFTxw3lwaQTbujFmRlpmeQFC6zshUmO6jSoUefre/1+KnbgWo/3WbgQux
	LI1OFHeICzuBDa/UUlXxU0Km5Ao/1Aqjif+Jo2j0xDd5gdbjXlbNoU6mEMvbUPmJRxDauvUfPxMg/
	tp3re1tsg0ycandEsFMeF1R+q6gDFeOuHlE6vlmebGCk2HQ0WYVXSsT3s0m0inz4Gkv6uYuXHUxkH
	HgjMHDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrNh-00000008HnV-2Cz4;
	Fri, 15 May 2026 12:11:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrNe-00000008Hmq-289I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 12:11:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03C2E27D3;
	Fri, 15 May 2026 05:10:55 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C975F3F836;
	Fri, 15 May 2026 05:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778847060; bh=9Ggm0xl0Rj1dV1c+fn5OpThB5uFuSG64WFLRSkQ0fUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cWi5ErhPTqtArb43mzcx1iT2vADWKmKqsbY3/lKtpWmZUKlf6UgMs7eRmg154qiTT
	 SFYJIzHQCc1MnGA5vfDWLhg7m0/VVKNkcBSHOGDiYd5Cea0s02YbbIZUiOyWgyIPQ6
	 KFXzaIWMdTwQjx+2R5u/cQSYFWk2pZ1s6NxdnEos=
Date: Fri, 15 May 2026 13:10:56 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Dan Carpenter <error27@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <agcNULwGvCACUYx2@pluto>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain>
 <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
 <agcHnzzdhV36j9eH@pluto>
 <CAMuHMdVVAioAk_3K4y-7T0MCa7L++sVcWGRfdj_ESHau0ov9eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVVAioAk_3K4y-7T0MCa7L++sVcWGRfdj_ESHau0ov9eA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_051102_907258_10CB6E5A 
X-CRM114-Status: GOOD (  25.28  )
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

On Fri, May 15, 2026 at 02:00:24PM +0200, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Fri, 15 May 2026 at 13:46, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Fri, May 15, 2026 at 01:29:27PM +0200, Geert Uytterhoeven wrote:
> > > On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> > > > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > > > scmi_power_name_get() does not validate the domain number passed by the
> > > > > external caller, which may lead to an out-of-bounds access.
> > > >
> > > > Is an external caller an out of tree caller?  So far as I can see this
> > >
> > > I meant a caller outside drivers/firmware/arm_scmi/.
> > >
> > > > is only called by scmi_pm_domain_probe().
> > > >
> > > >         scmi_pd->name = power_ops->name_get(ph, i);
> > > >
> > > > where i < num_domains.
> > >
> > > You are right. But this seems to be only API implementation in
> > > drivers/firmware/arm_scmi/ that does not validate the passed domain
> > > number.
> >
> > Yes we tend to validate protocol operations calls even if apparently
> > safe from teh caller perspective...indeed I have this fixed locally
> > since ages in an horrible patch, that does a lot more, and that I
> > never posted :P
> >
> > Usually, if it is worth, we also build an internal domain get helper to
> > reuse across the protocol unit...but here really there are only 2 call-sites.
> >
> > What I am not sure is what to return: "unknown" is safer as of now than NULL
> > for sure, but really, what happened is NOT that the name was "unknown" (which
> > by itself would be out-of-spec behaviour) it is more that the whole domain that
> > was referred to that was invalid and NOT existent...
> >
> > ....mmm I suppose we are opening another can of worms here :P
> 
> Like scmi_perf_info_get() returning ERR_PTR(-EINVAL) instead of NULL,
> and scmi_perf_domain_probe() never checking the return value anyway?

...oh probably more than that...and related vendor FW that already exploits
these missing checks here and there to arbitrarily skip domains and return
out-of-spec non-contigous sets of domains becasue they cannot bother to
implement properly the spec (or they have simply forked their codebase from
an old drop and never updated it again...)...so that any kernel-side fix
you made along the road carries the risk of breaking something and a string
of possibly needed quirks...

Cheers,
Cristian

