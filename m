Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F83EC1438
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 12:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ik//tW56W3IL3/s+tMNJ9RRe9tIy+8OWI78Pt3r+SgM=; b=3RSZcnEW2LkBoBYI6Ys92VIPiu
	FYM0nwPAFdm7spd5rZFhh4L9+amasgfArFKDFIMNgKyRfkIhCA1O6x9RQyiXrH36vXaaMjOjg/JFb
	W16Sirizje9u21BdWtypKO90XO/bbhCFwqJZImsoy2l8DOiK+XmG91FtBruC6Z9nywWCguvE17gRD
	BmwKqn9g+9D3GNLAWZ6kasdkbVSDW4A4ySEf6d9KkWb1LEVdm+kwytgmki8eJbJcLFaW2WYTJMZ8c
	dbTfqmwNtKsUR7E02OGOsDvIxe+tea0uyaG03Vgpv61qOTe/FSOtKiJZedO3Z4s/9Ni1kkF4j3jig
	4HE7QHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPBm-0000000FB9R-3wtw;
	Tue, 03 Mar 2026 12:49:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPBk-0000000FB8v-1zDG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 12:49:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5279B497;
	Tue,  3 Mar 2026 04:49:16 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2EE73F7BD;
	Tue,  3 Mar 2026 04:49:17 -0800 (PST)
Date: Tue, 3 Mar 2026 12:49:14 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, dan.carpenter@linaro.org,
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com, Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Message-ID: <aabYyj5Xh-kFWBzw@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-3-cristian.marussi@arm.com>
 <CAMuHMdVCgq4Wbm8g_O9e1sPhJ4PyY-nWTt9RW1f3=G3a0PvdKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVCgq4Wbm8g_O9e1sPhJ4PyY-nWTt9RW1f3=G3a0PvdKA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_044924_559224_77381004 
X-CRM114-Status: GOOD (  22.26  )
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

On Mon, Mar 02, 2026 at 01:39:51PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Use the Clock protocol layer determine_rate logic to calculate the closest
> > rate that can be supported by a specific clock.
> >
> > No functional change.
> >
> > Cc: Brian Masney <bmasney@redhat.com>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: linux-clk@vger.kernel.org
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> > --- a/drivers/clk/clk-scmi.c
> > +++ b/drivers/clk/clk-scmi.c
> > @@ -57,35 +56,17 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
> >  static int scmi_clk_determine_rate(struct clk_hw *hw,
> >                                    struct clk_rate_request *req)
> >  {
> > -       u64 fmin, fmax, ftmp;
> > +       int ret;
> >         struct scmi_clk *clk = to_scmi_clk(hw);
> >
> >         /*
> > -        * We can't figure out what rate it will be, so just return the
> > -        * rate back to the caller. scmi_clk_recalc_rate() will be called
> > -        * after the rate is set and we'll know what rate the clock is
> > +        * If we could not get a better rate scmi_clk_recalc_rate() will be
> > +        * called after the rate is set and we'll know what rate the clock is
> >          * running at then.
> >          */
> > -       if (clk->info->rate_discrete)
> > -               return 0;
> > -
> > -       fmin = clk->info->range.min_rate;
> > -       fmax = clk->info->range.max_rate;
> > -       if (req->rate <= fmin) {
> > -               req->rate = fmin;
> > -
> > -               return 0;
> > -       } else if (req->rate >= fmax) {
> > -               req->rate = fmax;
> > -
> > -               return 0;
> > -       }
> > -
> > -       ftmp = req->rate - fmin;
> > -       ftmp += clk->info->range.step_size - 1; /* to round up */
> > -       do_div(ftmp, clk->info->range.step_size);
> 
> Oh, so the truncation bug exists in the original code, too.

Yep...as said I will fix the original code and then move the fixed
code.

Thanks,
Cristian

