Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BEEEC1438
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 12:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AG0+Lt9MpUpi2D8c6oPsdwA3dikbVgdNbMqMfjrP04U=; b=nNlE17f9Q+4QQ48l0FwXqHS/Ol
	RIZJLdW/13qPYuQwEOHLwhxsaSe68rGBCN0T58PnFA/ak+O0jK8L1EiOZUOYUnp7/cPdeDpEs4i9p
	0SzLuc+8Uf9N0V4wiTfUzVLK+FF5WY4fD0hPrjJbuQQiOeks2wpSATluycuTiSrCVZ2bh5ARE/QHo
	JC+A8Jh6sI1VblEH31yGhwJ4oE2Ktzru5CQ44GC7+sODRxjQD6Evz0ZsVlBr+lBJGh6Y6TDUF0mK5
	Ispx/zMBYq4ld6sCgDu/SjhjRtStjdmQOA2fJD5G1eICkh19T+O+hqITDQs9ZVq56I1xlEiGQiIXs
	1Nx7Tx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxP4o-0000000FADh-14iK;
	Tue, 03 Mar 2026 12:42:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxP4l-0000000FACM-1hWi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 12:42:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B90FA497;
	Tue,  3 Mar 2026 04:42:03 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 548D83F7BD;
	Tue,  3 Mar 2026 04:42:06 -0800 (PST)
Date: Tue, 3 Mar 2026 12:42:03 +0000
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
Subject: Re: [PATCH 03/11] firmware: arm_scmi: Simplify clock rates exposed
 interface
Message-ID: <aabXG1klJr7Qkpic@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-4-cristian.marussi@arm.com>
 <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
 <CAMuHMdVwVsYxsQj+du-uEN77H6UHDVFO4T6-_7VJ0E4Pfa=sSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVwVsYxsQj+du-uEN77H6UHDVFO4T6-_7VJ0E4Pfa=sSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_044211_499588_97E4E265 
X-CRM114-Status: GOOD (  19.14  )
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

On Mon, Mar 02, 2026 at 02:09:14PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Mon, 2 Mar 2026 at 13:48, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > Move needlessly exposed fields away from scmi_clock_info into the new
> > > internal struct scmi_clock_desc while keeping exposed only the two new
> > > min_rate and max_rate fields for each clock.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >
> > > --- a/drivers/firmware/arm_scmi/clock.c
> > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > @@ -157,13 +157,27 @@ struct scmi_clock_rate_notify_payld {
> > >         __le32 rate_high;
> > >  };
> > >
> > > +struct scmi_clock_desc {
> > > +       u32 id;
> > > +       bool rate_discrete;
> > > +       unsigned int num_rates;
> > > +       u64 rates[SCMI_MAX_NUM_RATES];
> > > +#define        RATE_MIN        0
> > > +#define        RATE_MAX        1
> > > +#define        RATE_STEP       2
> >
> > Any specific reason you are not using a union here, like in
> > scmi_clock_info?
> 
> Ah, "[PATCH 06/11] firmware: arm_scmi: Make clock rates allocation
> dynamic" answers that.
> 
> >
> > > +       struct scmi_clock_info info;
> > > +};
> >
> > > --- a/include/linux/scmi_protocol.h
> > > +++ b/include/linux/scmi_protocol.h
> > > @@ -51,6 +51,8 @@ struct scmi_clock_info {
> > >         bool rate_ctrl_forbidden;
> > >         bool parent_ctrl_forbidden;
> > >         bool extended_config;
> > > +       u64 min_rate;
> > > +       u64 max_rate;
> > >         union {
> > >                 struct {
> > >                         int num_rates;
> >
> > You patch description read like the actual rates would be moved
> > from scmi_clock_info to scmi_clock_desc, i.e. _removed_ here?
> 
> And these members are actually removed in "[PATCH 05/11] firmware:
> arm_scmi: Drop unused clock rate interfaces".  Please reflect that in
> this patch description.
> 

Ok I will better explain.

Thanks,
Cristian

