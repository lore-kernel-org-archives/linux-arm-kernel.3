Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFF01125863
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 18:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSM1MEc++GeIP5TlNWQTEgbLqZAD/sQbEBwiEzNtIpM=; b=bFF9qjY1ulX/c0Db92htez1coX
	VURUijJLlFc0NYORmnSXUEH5E2zhC8hixbfeVW6cDEqTnyIytjHoPg4vw7Jc77xnUxzeuZuhJmv9z
	KAGzkPtxpG+Q6l4e5WTjnS+fmIA05DhcPvYdIO7uzyBBl9lonyGHz5sDfFSozrwqB1v2l9daNbadj
	n9JdaBC6nV4FW5VJ/ca7yCPp/VY4euGi8zqkrbxCn+DOMaK0NJYgW5v7t5QvQV27xVJt32Jn3/cnw
	vUIUflL1gbuhF4XcB13+P9ZRUgR8SitVgN57Nokx9zU1hnTEm7GtXQqeqg+gZkFy51zJLLcZWlWey
	72gtrwZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ONA-0000000CC0T-0TtM;
	Wed, 11 Mar 2026 18:33:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ON7-0000000CBzF-1Xyx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 18:33:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF3BC1682;
	Wed, 11 Mar 2026 11:33:20 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25BA43F73B;
	Wed, 11 Mar 2026 11:33:22 -0700 (PDT)
Date: Wed, 11 Mar 2026 18:33:15 +0000
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
	marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 01/13] clk: scmi: Fix clock rate rounding
Message-ID: <abG1a_E_7gBmc3ec@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-2-cristian.marussi@arm.com>
 <CAMuHMdX5T-7ERcjEK_=z7joEftC2cMLqDkyy8iO65U21S-umng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX5T-7ERcjEK_=z7joEftC2cMLqDkyy8iO65U21S-umng@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_113329_445755_7A3F9936 
X-CRM114-Status: GOOD (  22.84  )
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

On Wed, Mar 11, 2026 at 12:30:34PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Tue, 10 Mar 2026 at 19:40, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > While the do_div() helper used for rounding expects its divisor argument
> > to be a 32bits quantity, the currently provided divisor parameter is a
> > 64bit value that, as a consequence, is silently truncated and a possible
> > source of bugs.
> >
> > Fix by using the proper div64_ul helper.
> >
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: linux-clk@vger.kernel.org
> > Fixes: 7a8655e19bdb ("clk: scmi: Fix the rounding of clock rate")
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/clk-scmi.c
> > +++ b/drivers/clk/clk-scmi.c
> 
> > @@ -83,7 +83,7 @@ static int scmi_clk_determine_rate(struct clk_hw *hw,
> >
> >         ftmp = req->rate - fmin;
> >         ftmp += clk->info->range.step_size - 1; /* to round up */
> > -       do_div(ftmp, clk->info->range.step_size);
> > +       ftmp = div64_ul(ftmp, clk->info->range.step_size);
> 
> include/linux/math64.h has:
> 
>     #if BITS_PER_LONG == 64
>     #define div64_ul(x, y)   div64_u64((x), (y))
>     #elif BITS_PER_LONG == 32
>     #define div64_ul(x, y)   div_u64((x), (y))
>     #endif
> 
> I.e. div64_ul() is meant for the case where the divisor is unsigned
> long.  Hence div64_ul() may still truncate step_size on 32-bit
> platforms, and thus should use div64_u64() unconditionally.
> 

Ah...my bad, I missed that...

> I am aware clock rates are "unsigned long" on 32-bit platforms, and
> thus cannot support rates that do not fit in a 32-bit value.
> If that is the reason you are using div64_ul(), it should be documented
> properly.  And probably the SCMI core code should reject any rate values
> (incl. min, max, step) that do not fit in unsigned long, as such clocks
> cannot be used on 32-bit platforms.

As per the SCMI spec Clock rates are reported as 64bit, so I suppose
that, yes I will have to add the checks you mentioned to avoid trying to
fit a reported clock rate where the upper 32bits are not zero into an
unsigned long on a 32bit machine...

Seems like there will be a V3 (together with your other reports..)

Thanks for your reviews !

Cristian

