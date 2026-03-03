Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F90AEC1430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vBZ5PJkHESyCV5e9xRXiXDPbMqR05XBHLWI721cqeg=; b=gnSU9Aa6f7tJQtJpC1vLQMAA48
	gYH7vww/OYT3BFJGOEVLNwFJuqVblINsGbOOIURMbuQ1cpOuaij7jr+8xo1Rqq0eS3Gd765K9iKI0
	98TKgE6vmODcQPUDHvcHAoHvemt6I8xYRAuFn+TiE9/JR6kcDFv/kjem6+7EMw/R6GjAltI4rls9V
	nOtEatPLXg9PKbbbJZmGDWsbtrUB8RO1jG+abxQdXSC98kM8ETdJG8uZE6fPe79PjqPuBjkc0hl1U
	aDPZCjeCt3ivtCoGZL/JZJf002TEReLxxU1PsZC4h4/QmaPH/htBvsEkwacQ3c1M2946eF8LUBpvn
	baSMcBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPUf-0000000FC7G-0zjI;
	Tue, 03 Mar 2026 13:08:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPUc-0000000FC6m-1cAk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:08:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02975497;
	Tue,  3 Mar 2026 05:08:47 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA2673F73B;
	Tue,  3 Mar 2026 05:08:49 -0800 (PST)
Date: Tue, 3 Mar 2026 13:08:46 +0000
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
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH 00/11] SCMI Clock rates discovery rework
Message-ID: <aabdXvaSlu1EDgG4@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <CAMuHMdW9dtAnT2E103kp1zK=LJrER7k1ib8_WPk5aorPRw80uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW9dtAnT2E103kp1zK=LJrER7k1ib8_WPk5aorPRw80uQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_050854_473712_A0F89C8A 
X-CRM114-Status: GOOD (  26.97  )
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

On Mon, Mar 02, 2026 at 02:25:00PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> Thanks for your series!
> 
> On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > it was a known limitation, in the SCMI Clock protocol support, the lack of
> > dynamic allocation around per-clock rates discovery: fixed size statically
> > per-clock rates arrays did not scale and was increasingly a waste of memory
> > (see [1]).
> >
> > This series aim at solving this in successive steps:
> >
> >  - simplify and reduce to the minimum possible the rates data info exposed
> >    to the SCMI driver by scmi_clock_info
> >  - move away from static fixed allocation of per-clock rates arrays in
> >    favour of a completely dynamic runtime allocation: just allocate what
> >    is needed based on the effectively discovered
> >
> > This is done in patches 1-6.
> >
> > A further bigger optimization suggested in a past series [1] by Etienne
> 
> s/[1]/[2]/
> 
> > would be, whenever allowed by the spec, to limit upfront the number of
> > queries in order to simply retrieve min and max rate, that are indeed the
> > only rates needed by the CLK SCMI driver.
> >
> > The approach proposed in [1] was open coding and duplicating some of the
> 
> What does [1] refer to?

I messed up the refs..of course...it was just a reference to your thread
where the number of rates where staticallty raised to 64.

> 
> > functionalities already provided by SCMI iterators, though.
> >
> > Patch 7-10 implement such optimization instead by:
> >
> >  - reworking core SCMI iterators to support bound enumerations
> >  - use such new bound iterators to perform the minimum number of queries
> >    in order to ony retrieve min an max rate
> >
> > As a final result now the rates enumeration triggered by the CLK SCMI
> > driver, while still allocating for all the existent rates, miminize the
> > number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.
> >
> > Finally, patch 11 introduces a new clock protocol operation to be able to
> > trigger anytime on demand a full enumeration and obtain the full list of
> > rates when needed, not only min/max: this latter method is really only used
> > currently by some dowstream SCMI Test driver of mine.
> >
> > Based on v7.0-rc1.
> >
> > Tested on JUNO and an emulated environment.
> 
> Thank you, this removes the need for increasing SCMI_MAX_NUM_RATES on
> R-Car X5H, while decreasing memory usage.
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 

Thanks for testing in the real world !
Cristian

