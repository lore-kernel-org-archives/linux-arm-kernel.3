Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D80CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgM1c7vlOggNf08/JKOAMKYrGpPoODLSmiqgWyLbCjs=; b=S7wV+GFqpGWHw8wkw/+ZKqHf4u
	1A786f8VRWiJpW52NEk64fvOQ33fRlx5LjcROSKSnLveDjGN/yqMtf5NxoUJq2sgGNJsrVS4vB8CQ
	CWVrxxnrk0KtWBLlYw85SN0ryXUENKtodd/zEaXc2PujAFYQcDtQYG7kaLxE1Xdxxgr3Omzm3rbA1
	yNXlWngjeCJ6TC//pVpvK4eEXQBc3SvI517v2BqeHGg2sGeFWnA3nrI52gFQf+h259RgC6TsqMCeo
	Dq40fFpkdEMCEUg7K94VmO5ipa0+M2VuZg1gRndRW5xj4PjrCdwdCWxmcqC9qvCAMxDGUG2mPkKeo
	/M/gj0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNr0H-00000008Eig-41ka;
	Fri, 15 May 2026 11:46:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNr0F-00000008Ehf-31yY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:46:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44FC91BF7;
	Fri, 15 May 2026 04:46:43 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D66303F85F;
	Fri, 15 May 2026 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778845608; bh=woFbGz4cqB9LZc4NQu0SGqfw+B2Gzyz0AHx09mb7Jgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ezykeqOHq74gbBxfBmz1XAgHhH985DTAdkwCTexwYxokU+8qcTvpCPpQxVm5EgPZt
	 bbtwWb06+BrXKixBoEh7LsfGjWt/vChmEOL0+/6jISYZSR2EihEUqVrSvrHm6GHt76
	 yc7TOTcfH6GO1D2XEQd12TaiPi9YxPYucbm+jufo=
Date: Fri, 15 May 2026 12:46:39 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <agcHnzzdhV36j9eH@pluto>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain>
 <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_044651_889561_FC9E8518 
X-CRM114-Status: GOOD (  19.13  )
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

On Fri, May 15, 2026 at 01:29:27PM +0200, Geert Uytterhoeven wrote:
> Hi Dan,
> 

Hi all,

> On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > scmi_power_name_get() does not validate the domain number passed by the
> > > external caller, which may lead to an out-of-bounds access.
> >
> > Is an external caller an out of tree caller?  So far as I can see this
> 
> I meant a caller outside drivers/firmware/arm_scmi/.
> 
> > is only called by scmi_pm_domain_probe().
> >
> >         scmi_pd->name = power_ops->name_get(ph, i);
> >
> > where i < num_domains.
> 
> You are right. But this seems to be only API implementation in
> drivers/firmware/arm_scmi/ that does not validate the passed domain
> number.
>

Yes we tend to validate protocol operations calls even if apparently
safe from teh caller perspective...indeed I have this fixed locally
since ages in an horrible patch, that does a lot more, and that I
never posted :P

Usually, if it is worth, we also build an internal domain get helper to
reuse across the protocol unit...but here really there are only 2 call-sites.

What I am not sure is what to return: "unknown" is safer as of now than NULL
for sure, but really, what happened is NOT that the name was "unknown" (which
by itself would be out-of-spec behaviour) it is more that the whole domain that
was referred to that was invalid and NOT existent...

....mmm I suppose we are opening another can of worms here :P

Thanks,
Cristian

