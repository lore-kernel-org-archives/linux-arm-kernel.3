Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4937CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzZf6timOZbmq+Z0o1JDkwGiU+XOCHK24EsBgbAKHnA=; b=iLmN3d9ZEaLISb89D8UPzY71FP
	bBurGIezuNvo/AnGjeICNVrY28sIsG9taDSwnnhaCUWUUgHbT0w1RQbdTLsk93wJ7eecB20SOlQ7n
	oFqU52HeqMivEX4GqpDeJE6cI0+CvBixK86+CzkeIceg80mi/DcrtXLfg8GhOFBIuhImTYzWid5v6
	10jUmCkWRxUydDL+LPcJ6NNQPbSzPlTjNii4nQUV0+j++2KdA2t83F1qBJr0PWy7FsqNuU78KTJVY
	s3JdHQhE4cFa8QTVvZLj6Ez1kqj/YR86urnnJkNbgOYUQQX4CaZ+pd0BjkvuRY8TfH71lzj+7+Oi5
	uci/oBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGOD-00000000qht-0UhH;
	Tue, 19 May 2026 09:05:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGO9-00000000qhN-46M4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:05:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C92BE34FC;
	Tue, 19 May 2026 02:05:15 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B0533F632;
	Tue, 19 May 2026 02:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779181520; bh=vF7j9naEMvUEYe6tmHkEEIkCe/QLdr7yqU621pmB1sI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXVaR63tor9HZjirL/2SHo20ht2u0MYFJjTfOcdb+45QRGtH7MdMYOK4q+BrOwfOL
	 9UsK2zU1RbOAdsSSkjKSWOpXRCRkGOVgCGOTH53koHHP25AANyUfp2R85jAsN9wCrG
	 W1aJBJRhUFZezWM/zzuJTI2nQvMFRenCeLXt0yqk=
Date: Tue, 19 May 2026 10:05:16 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <agwnzGf5jq6gepiU@pluto>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain>
 <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
 <agcHnzzdhV36j9eH@pluto>
 <CAMuHMdVVAioAk_3K4y-7T0MCa7L++sVcWGRfdj_ESHau0ov9eA@mail.gmail.com>
 <agcNULwGvCACUYx2@pluto>
 <agwhGERAdaKepqgT@pluto>
 <agwjfyMykDJTlrBd@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agwjfyMykDJTlrBd@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020522_131361_50A04CB2 
X-CRM114-Status: GOOD (  37.35  )
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

On Tue, May 19, 2026 at 11:46:55AM +0300, Dan Carpenter wrote:
> On Tue, May 19, 2026 at 09:36:40AM +0100, Cristian Marussi wrote:
> > On Fri, May 15, 2026 at 01:10:56PM +0100, Cristian Marussi wrote:
> > > On Fri, May 15, 2026 at 02:00:24PM +0200, Geert Uytterhoeven wrote:
> > > > Hi Cristian,
> > > > 
> > > > On Fri, 15 May 2026 at 13:46, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > On Fri, May 15, 2026 at 01:29:27PM +0200, Geert Uytterhoeven wrote:
> > > > > > On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> > > > > > > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > > > > > > scmi_power_name_get() does not validate the domain number passed by the
> > > > > > > > external caller, which may lead to an out-of-bounds access.
> > > > > > >
> > > > > > > Is an external caller an out of tree caller?  So far as I can see this
> > > > > >
> > > > > > I meant a caller outside drivers/firmware/arm_scmi/.
> > > > > >
> > > > > > > is only called by scmi_pm_domain_probe().
> > > > > > >
> > > > > > >         scmi_pd->name = power_ops->name_get(ph, i);
> > > > > > >
> > > > > > > where i < num_domains.
> > > > > >
> > > > > > You are right. But this seems to be only API implementation in
> > > > > > drivers/firmware/arm_scmi/ that does not validate the passed domain
> > > > > > number.
> > > > >
> > > > > Yes we tend to validate protocol operations calls even if apparently
> > > > > safe from teh caller perspective...indeed I have this fixed locally
> > > > > since ages in an horrible patch, that does a lot more, and that I
> > > > > never posted :P
> > > > >
> > > > > Usually, if it is worth, we also build an internal domain get helper to
> > > > > reuse across the protocol unit...but here really there are only 2 call-sites.
> > > > >
> > > > > What I am not sure is what to return: "unknown" is safer as of now than NULL
> > > > > for sure, but really, what happened is NOT that the name was "unknown" (which
> > > > > by itself would be out-of-spec behaviour) it is more that the whole domain that
> > > > > was referred to that was invalid and NOT existent...
> > > > >
> > > > > ....mmm I suppose we are opening another can of worms here :P
> > > > 
> > > > Like scmi_perf_info_get() returning ERR_PTR(-EINVAL) instead of NULL,
> > > > and scmi_perf_domain_probe() never checking the return value anyway?
> > > 
> > > ...oh probably more than that...and related vendor FW that already exploits
> > > these missing checks here and there to arbitrarily skip domains and return
> > > out-of-spec non-contigous sets of domains becasue they cannot bother to
> > > implement properly the spec (or they have simply forked their codebase from
> > > an old drop and never updated it again...)...so that any kernel-side fix
> > > you made along the road carries the risk of breaking something and a string
> > > of possibly needed quirks...
> > 
> > Anyway, it is the safest option on the table until proper checks are in place.
> > 
> > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> If it has a description like this then it's absolutely going to get a CVE
> assigned.  We're used to hundreds of CVEs and all but I really feel like
> this is a bad habit.

Indeed, I think already happened to get a CVE on this internal improved
checks despite the fix was more a defensive thing since it had no chance
to be exposed by the current code.

I could be wrong but I think that this is one of the reason I started using
(and maybe abusing) for similar patches the "Harden protocol...." commmit-msg
because it really does not qualify as Fixes for backporting as specified in [1]

[1]: https://www.kernel.org/doc/Documentation/process/stable-kernel-rules.rst

...so at the end probably worth to drop Fixes as you said earlier...

Thanks,
Cristian

