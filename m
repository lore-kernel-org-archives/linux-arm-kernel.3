Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE9EFF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 23:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUcM5EpsAK6Kqp8W2K1nvAMuyQjaRWemKyoNzQP4r8g=; b=pbFHIFC3ymtV8DuSyefwrkaxcv
	rmywlMkJ8izWN0dps+ENiJijEfH4cByjgsbVybXf4Gl5fBzO3Q7iBNiAvPAiG39rpqqFcdy9cxnWe
	QtjqsjAuQHdPgqHnXdAX9ZBilv71/MZFE993DS6+k3qUTvNMvRJG7vJ8jpwers+7GZAJ3s6AS7H7K
	aaShijXwI7QMN0iB5CZWZGRWYNv/sPHJYDEestpyxTYBvvULmhQABXRN1SEreIJlMlVS9bTplKJL2
	5FE0U4Iq1M+R6d/XbeUR/QV0M7fx4tzMc1911wB3dMHVkBIPoPJCkcklc64X+sMgZRtrZZuK1fo4Y
	qvBi0yAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH8cv-0000000FuuU-14fx;
	Sun, 26 Apr 2026 23:11:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH8cs-0000000Fuu7-43Kb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 23:11:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 815121F02;
	Sun, 26 Apr 2026 16:10:51 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2440A3F763;
	Sun, 26 Apr 2026 16:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777245057; bh=a/aJYD6pRvMxLS87Yj3RcGUYhcRUIAX2XSq4KMBsQQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qNPJZs6+vgMSeAnGjNou/szz7erkEx2r0b/jVAFVKxomqucUko7deq+yVJfoEwiJG
	 ggRKCCt9/wSae87dDwayalhIbqUpyAsN1LZ0OG3OXf3lNxskhdQGD7tgLFnB/ZlaLi
	 sLCex6afDiGYaXlHstiEwyxomHUg/JkEDxMbYIAI=
Date: Mon, 27 Apr 2026 00:10:47 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, dan.carpenter@linaro.org,
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
Message-ID: <ae6bdwhHoft3p0lv@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
 <WNCeTzosRbKm_zGsbSPx8w@collabora.com>
 <aetw1WcSCDxk11AV@pluto>
 <CAMuHMdXYGRzq2j3z1io=kHj_QsWtJBirPhbZPa5bFBD7U9e0sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXYGRzq2j3z1io=kHj_QsWtJBirPhbZPa5bFBD7U9e0sw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_161059_089269_C62DCA40 
X-CRM114-Status: GOOD (  39.91  )
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

On Fri, Apr 24, 2026 at 03:55:08PM +0200, Geert Uytterhoeven wrote:
> Hi Cristian,

Hi,

> 
> On Fri, 24 Apr 2026 at 15:32, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Fri, Apr 24, 2026 at 02:07:59PM +0200, Nicolas Frattaroli wrote:
> > > On Tuesday, 10 March 2026 19:40:25 Central European Summer Time Cristian Marussi wrote:
> > > > Add proper error handling on failure to enumerate clocks features or
> > > > rates.
> 
> > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > > > ---
> > > >  drivers/firmware/arm_scmi/clock.c | 22 ++++++++++++++++------
> > > >  1 file changed, 16 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> > > > index c9b62edce4fd..bf956305a8fe 100644
> > > > --- a/drivers/firmware/arm_scmi/clock.c
> > > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > > @@ -402,10 +402,16 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
> > > >                 SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
> > > >                     clk->rate_change_requested_notifications = true;
> > > >             if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> > > > -                   if (SUPPORTS_PARENT_CLOCK(attributes))
> > > > -                           scmi_clock_possible_parents(ph, clk_id, cinfo);
> > > > -                   if (SUPPORTS_GET_PERMISSIONS(attributes))
> > > > -                           scmi_clock_get_permissions(ph, clk_id, clk);
> > > > +                   if (SUPPORTS_PARENT_CLOCK(attributes)) {
> > > > +                           ret = scmi_clock_possible_parents(ph, clk_id, cinfo);
> > > > +                           if (ret)
> > > > +                                   return ret;
> > > > +                   }
> > > > +                   if (SUPPORTS_GET_PERMISSIONS(attributes)) {
> > > > +                           ret = scmi_clock_get_permissions(ph, clk_id, clk);
> > > > +                           if (ret)
> > > > +                                   return ret;
> > > > +                   }
> > > >                     if (SUPPORTS_EXTENDED_CONFIG(attributes))
> > > >                             clk->extended_config = true;
> > > >             }
> > > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > > >     for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > > >             cinfo->clkds[clkid].id = clkid;
> > > >             ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > > -           if (!ret)
> > > > -                   scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > +           if (ret)
> > > > +                   return ret;
> > > > +
> > > > +           ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > +           if (ret)
> > > > +                   return ret;
> > > >     }
> > > >
> > > >     if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> > > >
> > >
> > > I see that a quirk is being added for this, but I thought I should chime
> > > in with my opinion for future approaches in this direction.
> > >
> > > I don't see how this hardens anything. All this does is break platforms
> > > that were previously working by returning early. At most, this should
> >
> > Certainly the naming in the subject was chosen badly (by me!)...indeed it
> > should be more something like "Enforce strict protocol compliance",
> > because at the end all of the broken platforms really run a slighly odd
> > out of spec SCMI firmware that does NOT implement one or more of the SCMI
> > mandatory command...
> >
> > > be a warning (as in not WARN but pr_warn/dev_warn/...). If firmware
> > > returns nonsense, a clock driver should imho try its best to work
> > > around the nonsense in a safe way, because the alternative is that
> > > a major part of the system (and thus likely the entire system) no
> >
> > ..well yes we definitely dont want to break deployed platforms BUT also
> > we dont want to legalize this kind of out of spec behaviour in future
> > firmwares...hence (a number ?) of quirks an FW_BUG warns probably to
> > let already broken deployed platforms survive while discouraging such
> > implementation in future fw implementations...
> >
> > These firmware most certainly wont pass the SCMI compliance test suite [1],
> > which indeed we do not mandate, but the reason these bugs happened is
> > exactly because the kernel SCMI stack was buggy and left that door open...
> >
> > More specifically these kind of out-of-spec behaviours are not really just
> > a matter being 'picky', the problem is that any resource set in any
> > SCMI protocol is defined by the spec such as to be described by a
> > contiguos set of IDs and the drivers are designed anyway under that
> > assumption from the allocation point of view, so allowing a clock ID to
> > just fail one of the mandatory commands and skip a domain would jeopardize
> > all of this and, even if clearly is NOT a problem here, seems a fragile
> > assumption.
> 
> How can you have all of:
>   1. a contiguous list of IDs,
>   2. implement all mandatory commands,
>   2. restrict the use of some clocks to a subset of the agents in the system?
> Use a different list of IDs for each agent?

Yes, the SCMI server can provide a per-agent view of the world to each
agent, and ideally it should not even expose resources that are not
needed at all to an agent...and by that I mean that the server SHOULD
not enumerate that resources when queried, by dropping them from the
list of resources that return to that agent WHILE maintaining the set of
IDs contigous...

...the SCMI server provides an illusion ideally where the agent is in
control and can access whatever it wants, while the reality is that the
agent can only issue commands that are deemed safe and sensible by the server,
which is the ultimate arbiter on the system, to the extent that can hide
resources or simply silently ignore requests...

> What if a mistake was made, and a clock was exposed to an agent by
> accident?

Quirk ! 

More detail on all of this in my babbling on the other thread...sorry
for the flood of words :P

Thanks,
Cristian

