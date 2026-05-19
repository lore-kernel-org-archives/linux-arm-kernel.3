Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34A5CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtXi7ksR6za75HHkRrUPh2YRUWd5B3kE8GkjiT7ewOQ=; b=KtCYHWtJRMNR3PSjQ8q0HLBUvt
	E4Ppy+heJ+yZGUFIzPSDFKNGXtGwSyOad/10qNUKSMWMZTdTchEALOKcH6B/4aFX/gt3J+3McRSF3
	sze70LGybjwQcC7SV/10MUyuFxsuALMBamFm5yDLwJvNvcFCcdh8IIQHxZvM6q3JxPjvq2FFwFrHx
	kQiyk5q3LDf2hTlF8G7SZ+lk7cTrLL2k68FYj8VYbmkV7AkLJjOYK/PLlcJxxxHQ29+uKhJs+ZukH
	sq/i6XGbauS+tXCaPqOarBvpZ6HQCEPbPtiSYTG9wwG0oNi0NkpoQds5n3XhvW1zt2b6gGf1ycoUb
	0/g185Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFwi-00000000hNj-1qwH;
	Tue, 19 May 2026 08:37:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFwf-00000000hMw-2ctf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 08:36:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A5C01E5E;
	Tue, 19 May 2026 01:36:49 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 035AE3F85F;
	Tue, 19 May 2026 01:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779179814; bh=cURbMm2okKUDguBxbYSJRZ9JHQhDdBDG/WbOFz3bvQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J49n4wDk9qpghf5622OsChKbMNxP1ppkvk6334034/IMUHveTqtL2Opa/uFTArrvU
	 eh0vDsoxhOPUMW2SMJsfSsuAFyWegJTU0XKRFGWFjxQVOZC8lWGfbG5ifguzIADOHA
	 WMEo+fOedq3HwzCMyRp3aWSj8+SASHbZuXnKDzg0=
Date: Tue, 19 May 2026 09:36:40 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Dan Carpenter <error27@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <agwhGERAdaKepqgT@pluto>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain>
 <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
 <agcHnzzdhV36j9eH@pluto>
 <CAMuHMdVVAioAk_3K4y-7T0MCa7L++sVcWGRfdj_ESHau0ov9eA@mail.gmail.com>
 <agcNULwGvCACUYx2@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agcNULwGvCACUYx2@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_013658_053047_703B4BD3 
X-CRM114-Status: GOOD (  29.00  )
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

On Fri, May 15, 2026 at 01:10:56PM +0100, Cristian Marussi wrote:
> On Fri, May 15, 2026 at 02:00:24PM +0200, Geert Uytterhoeven wrote:
> > Hi Cristian,
> > 
> > On Fri, 15 May 2026 at 13:46, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > On Fri, May 15, 2026 at 01:29:27PM +0200, Geert Uytterhoeven wrote:
> > > > On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> > > > > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > > > > scmi_power_name_get() does not validate the domain number passed by the
> > > > > > external caller, which may lead to an out-of-bounds access.
> > > > >
> > > > > Is an external caller an out of tree caller?  So far as I can see this
> > > >
> > > > I meant a caller outside drivers/firmware/arm_scmi/.
> > > >
> > > > > is only called by scmi_pm_domain_probe().
> > > > >
> > > > >         scmi_pd->name = power_ops->name_get(ph, i);
> > > > >
> > > > > where i < num_domains.
> > > >
> > > > You are right. But this seems to be only API implementation in
> > > > drivers/firmware/arm_scmi/ that does not validate the passed domain
> > > > number.
> > >
> > > Yes we tend to validate protocol operations calls even if apparently
> > > safe from teh caller perspective...indeed I have this fixed locally
> > > since ages in an horrible patch, that does a lot more, and that I
> > > never posted :P
> > >
> > > Usually, if it is worth, we also build an internal domain get helper to
> > > reuse across the protocol unit...but here really there are only 2 call-sites.
> > >
> > > What I am not sure is what to return: "unknown" is safer as of now than NULL
> > > for sure, but really, what happened is NOT that the name was "unknown" (which
> > > by itself would be out-of-spec behaviour) it is more that the whole domain that
> > > was referred to that was invalid and NOT existent...
> > >
> > > ....mmm I suppose we are opening another can of worms here :P
> > 
> > Like scmi_perf_info_get() returning ERR_PTR(-EINVAL) instead of NULL,
> > and scmi_perf_domain_probe() never checking the return value anyway?
> 
> ...oh probably more than that...and related vendor FW that already exploits
> these missing checks here and there to arbitrarily skip domains and return
> out-of-spec non-contigous sets of domains becasue they cannot bother to
> implement properly the spec (or they have simply forked their codebase from
> an old drop and never updated it again...)...so that any kernel-side fix
> you made along the road carries the risk of breaking something and a string
> of possibly needed quirks...

Anyway, it is the safest option on the table until proper checks are in place.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

