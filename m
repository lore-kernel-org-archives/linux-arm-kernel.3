Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C190CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Sxwd7UYd9K4V6bzFAhkWPQePqIF9ZWmAZi0vTH3CQI=; b=Q1ieVjN/hbnwAA2mAe0AaoVhix
	C7AkMsikgF3qydN3t6uMD8l++YWdS6wWuN9yw6D5/bc5kra2ACVBcWgrmlXGQvrAx1OhQVMKfRW70
	lzdIU1qB/n9+QlmpEFc0DVvxzcvwl6VMF0yMwKWnppQcWF92e5boyjqaNCsdOWmVWm05nOV0sfKXo
	ePtgt8Yc6L1IOoC0BUD3tNd751ZHrkmr/eRkqBfqwgFjFS5e4sU4y+GzPiyVMc6qmzS6OQqzVUtxO
	Cpa0+KtX1RkVhfyYmyZA3iPKSRu1OxC0CwAguH7lNb9YxhGXq0YMrHT2ynofev/ZQF4HQQuEgP3Ay
	W+yoAioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGsi-0000000GWsZ-08gi;
	Tue, 05 May 2026 14:36:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGsf-0000000GWs4-2NCC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:36:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E304C293B;
	Tue,  5 May 2026 07:36:05 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B30BB3F763;
	Tue,  5 May 2026 07:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777991771; bh=0T3MKaQLW28GaOTl2D9yp1TlQr7cPQv8Jr8lznjVrUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RVWDs8OtvKs83ItvR0uvQRZRFHjQgeKCGanXHI1nFmSP2G72mJ7/PVKzpR4BbavsE
	 i3cYIfnOy35P9b1FxKO9dC6VhkpJXReXScZQrbAAWh8pSBemE6fDVkfFW0xjzarhSJ
	 rSs7G8mZ1nlDQlh4Ll3AJ0HMRaz5TcZNhaHVy4NE=
Date: Tue, 5 May 2026 15:36:00 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, sudeep.holla@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 04/15] firmware: arm_scmi: Simplify clock rates
 exposed interface
Message-ID: <afoAUOTg2rQ8NUPr@pluto>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
 <20260428201522.903875-5-cristian.marussi@arm.com>
 <CAMuHMdUF1dW0hR-UZMVVqTnpWbMcv1D41jfL_4rEj6Vzj9wGSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUF1dW0hR-UZMVVqTnpWbMcv1D41jfL_4rEj6Vzj9wGSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_073613_660867_E6279595 
X-CRM114-Status: GOOD (  18.68  )
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

On Tue, May 05, 2026 at 02:17:45PM +0200, Geert Uytterhoeven wrote:
> Hi Cristian, Sudeep,

Hi Geert,

Thanks for having a look.

> 
> On Tue, 28 Apr 2026 at 22:16, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Introduce a new internal struct scmi_clock_desc so as to be able to hide,
> > in the future, some of the needlessly public fields currently kept inside
> > scmi_clock_info, while keeping exposed only the two new min_rate and
> > max_rate fields for each clock.
> >
> > No functional change.
> >
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Thanks for your patch, which is now commit 83fd9d34b6b75be5 ("firmware:
> arm_scmi: Simplify clock rates exposed interface") in scmi/for-linux-next.
> 
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> 
> > @@ -457,14 +466,14 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
> >         flags = le32_to_cpu(r->num_rates_flags);
> >         st->num_remaining = NUM_REMAINING(flags);
> >         st->num_returned = NUM_RETURNED(flags);
> > -       p->clk->rate_discrete = RATE_DISCRETE(flags);
> 
> This removes the last setter of scmi_clock_info.rate_discrete.
> However, it is still used until the next commit cd73d1bfaa8d34bb
> ("clk: scmi: Use new simplified per-clock rate properties").
> V2 did now have this issue, as the patches were ordered differently
> in that series.
> 
> After both commits, there are no more users of
> scmi_clock_info.rate_discrete, so it can be removed.

Indeed.... good catch, rate_discerte has been moved to scmi_clock_rates
so the old public scmi_clock_info.rate_discrete is stale and no more
updated...I will remove it.

Thanks,
Cristian

