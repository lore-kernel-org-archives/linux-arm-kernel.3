Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EA3EC1438
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 12:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syLan8LhOxbWhk+33TuSvh9jZMGJJdoc+18Ns/n4+yo=; b=Hl8CxIG2xnAT7v6dqA9fZsafei
	zOoGFdI4ZGnp0YtFxn5AQ4Snk6p3ZhNMXM3msYmk6reG1lRpeG+cc/+FdUWsOy367GgmfXgP06N1I
	MNQAQDjBYLpMpGRcUdNfI7W0RBMYPszz0iVVQcjeHJaaEfqql6NdGBDewpbZ1j1fUlYk5PyeOKrju
	gzF8QN1X8bgcCj6VrkkXXc4A4vmAY/h6fY+wVMP2/tsFRGfQY/BUL1igEOU8msD5/A+plv8JOSbtL
	xjcqwGar8kyqEPxhDt0k0at8/5deTmhaXbykIsyQafVEaTgawzbxKb2t9jHPg2AW6qsst0UEbD0Tf
	sq2QtU5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxP9Q-0000000FAlh-2YUV;
	Tue, 03 Mar 2026 12:47:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxP9O-0000000FAkh-3LUW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 12:47:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23655497;
	Tue,  3 Mar 2026 04:46:51 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B08AA3F7BD;
	Tue,  3 Mar 2026 04:46:53 -0800 (PST)
Date: Tue, 3 Mar 2026 12:46:50 +0000
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
	marek.vasut+renesas@gmail.com
Subject: Re: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate
 operation
Message-ID: <aabYOiZvYYOypV0A@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-2-cristian.marussi@arm.com>
 <CAMuHMdUZjZvhifzh0W2wbMZf2DYgZjO=gXepsS2nQtSG0weCag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUZjZvhifzh0W2wbMZf2DYgZjO=gXepsS2nQtSG0weCag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_044658_957151_4924E0DE 
X-CRM114-Status: GOOD (  25.95  )
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

On Mon, Mar 02, 2026 at 01:37:00PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Add a clock operation to help determining the effective rate, closest to
> > the required one, that a specific clock can support.
> >
> > Calculation is currently performed kernel side and the logic is taken
> > directly from the SCMI Clock driver: embedding the determinate rate logic
> > in the protocol layer enables semplifications in the SCMI Clock protocol
> > interface and  will more easily accommodate further evolutions where such
> > determine_rate logic into is optionally delegated to the platform SCMI
> > server.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Thanks for your patch!

Hi,

thanks for having a look.

> 
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> > @@ -624,6 +625,46 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
> >         return ret;
> >  }
> >
> > +static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
> > +                                    u32 clk_id, unsigned long *rate)
> > +{
> > +       u64 fmin, fmax, ftmp;
> > +       struct scmi_clock_info *clk;
> > +       struct clock_info *ci = ph->get_priv(ph);
> > +
> > +       if (!rate)
> > +               return -EINVAL;
> > +
> > +       clk = scmi_clock_domain_lookup(ci, clk_id);
> > +       if (IS_ERR(clk))
> > +               return PTR_ERR(clk);
> > +
> > +       /*
> > +        * If we can't figure out what rate it will be, so just return the
> > +        * rate back to the caller.
> > +        */
> > +       if (clk->rate_discrete)
> > +               return 0;
> > +
> > +       fmin = clk->range.min_rate;
> > +       fmax = clk->range.max_rate;
> > +       if (*rate <= fmin) {
> > +               *rate = fmin;
> > +               return 0;
> > +       } else if (*rate >= fmax) {
> > +               *rate = fmax;
> > +               return 0;
> > +       }
> > +
> > +       ftmp = *rate - fmin;
> > +       ftmp += clk->range.step_size - 1; /* to round up */
> > +       do_div(ftmp, clk->range.step_size);
> 
> step_size is u64, while do_div() truncates it to 32-bit.

Yes, as pointed out also by other reviewers, there are pre-existent bugs
probably in this rounding...this patch was meant only to move the logic
away from the CLK SCMI driver into the SCMI Clock protocol layer since
it enables a few simplification...

In the next V2, I will fix rounding errors by adding a dedicated Fix on
top of the original code, before this 'relocation', so as to make the
backport easier and move the fixed code.

Thanks,
Cristian

