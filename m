Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E889E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7E98PLjvtValAIhCC6t9i3sNgBhgUG69h6ykKXMQmU0=; b=wk0UoXQmTW0/cXfeMJ1gnLPmtl
	aukFT2ThaRGgst0t96J8rdwXv59GG3QHwqKbDo9ZZzju4ZgCeZEluJBPL5tvo1RDVUNuoG7ukYc+m
	Zm8fMrpWN28/43vGDGn4Lr1R6fbiP3tex7JS2Lj/ZyaId1fsmort5bXzM6FGKxgF7M3FtAZfYsZcw
	XYo7w5oh1yHWo4sW2mjnF3TW27rO6PGdNgXz9vM5bH6F/P8EhkpeiYDKvgzYPk/2wbcnyz8uX6CSW
	eSX5thU4RPacO4zQg3xz200QTJQSy0EigAP3nJIatwDAgUDVlhcq6T22Aqu2JbrRssjnS6nGPjDXk
	eQjqdzmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0Rm-0000000BbAd-3E4W;
	Tue, 10 Dec 2024 13:38:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0Qk-0000000Bb4t-3ddp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 13:37:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8ECC15C4642;
	Tue, 10 Dec 2024 13:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C95BC4CED6;
	Tue, 10 Dec 2024 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733837857;
	bh=Rd2iPljEDfNNqaWr5g+QzbTeRqU58jXTJYCQVyr6iNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sz9QD4FMreEsZWo9DqmPgDiHLGQ7RzyFypZCrcrxheiWeD+O6w8o9wgTuHvYltUuQ
	 PvuBG2R241TKY1LCZMKXzyz2o95mAfEktbO5m7d+poNpyBeogMqvkvR0n9/jciwlBA
	 1xhJWz5PcE7oy2smg9zZ6G7XwrGHBbeAm1AjhjH47vjH9X5/9uAxw6f6A5JyyL75lH
	 +tT7FUJF8Bn6SdNzc5W/aFLNxvyku9LLfyiITUtJVGQq96tu9eOcM4TIRn1ug0NX28
	 V7jHQZb9G3Y6RcrNrOK85q3qQj06R8s6zDAcKsP54j2DbW//25GaAHmyjQSKYFdPie
	 t2L1qIjedtWIg==
Date: Tue, 10 Dec 2024 13:37:32 +0000
From: Will Deacon <will@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.li@nxp.com, mark.rutland@arm.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] perf: imx9_perf: Introduce AXI filter version to
 refactor the driver and better extension
Message-ID: <20241210133732.GA15607@willie-the-truck>
References: <20241125104338.2433339-1-xu.yang_2@nxp.com>
 <20241209154419.GB12428@willie-the-truck>
 <20241210020212.yz3xowvdk27zmgsl@hippo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210020212.yz3xowvdk27zmgsl@hippo>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_053738_988992_FC151559 
X-CRM114-Status: GOOD (  29.38  )
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

On Tue, Dec 10, 2024 at 10:02:12AM +0800, Xu Yang wrote:
> On Mon, Dec 09, 2024 at 03:44:20PM +0000, Will Deacon wrote:
> > On Mon, Nov 25, 2024 at 06:43:38PM +0800, Xu Yang wrote:
> > > The imx93 is the first supported DDR PMU that supports read transaction,
> > > write transaction and read beats events which corresponding respecitively
> > > to counter 2, 3 and 4.
> > > 
> > > However, transaction-based AXI match has low accuracy when get total bits
> > > compared to beats-based. And imx93 doesn't assign AXI_ID to each master.
> > > So axi filter is not used widely on imx93. This could be regards as AXI
> > > filter version 1.
> > > 
> > > To improve the AXI filter capability, imx95 supports 1 read beats and 3
> > > write beats event which corresponding respecitively to counter 2-5. imx95
> > > also detailed AXI_ID allocation so that most of the master could be count
> > > individually. This could be regards as AXI filter version 2.
> > > 
> > > This will introduce AXI filter version to refactor the driver and support
> > > better extension, such as coming imx943.
> > > 
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > 
> > > ---
> > > Changes in v2:
> > >  - modify subject
> > >  - add comments for AXI_FILTER version
> > >  - type -> filter_ver
> > > ---
> > >  drivers/perf/fsl_imx9_ddr_perf.c | 33 ++++++++++++++++++++++++--------
> > >  1 file changed, 25 insertions(+), 8 deletions(-)

[...]

> > > @@ -624,11 +641,11 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
> > >  	hwc->idx = counter;
> > >  	hwc->state |= PERF_HES_STOPPED;
> > >  
> > > -	if (is_imx93(pmu))
> > > +	if (axi_filter_v1(pmu))
> > >  		/* read trans, write trans, read beat */
> > >  		imx93_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
> > 
> > Hmm, doesn't this change mean we now enable this for imx91 as well? My
> > reading of the commit message is that imx93 was the first chip which
> > supports this.
> 
> Yes, it's enabled for imx91 too. In fact, imx91 is compatible with imx93.
> They use same configuration for axi filter.

Ok, but my worry is that the above code looks like userspace now _must_
provide valid values for the config1 (axi_id) and config2 (axi_mask)
fields on imx91, whereas before I think they were ignored by the driver.

In fact, without this change, how were the PMCFGn registers configured
on imx91? It looks to me like they were left uninitialised...

Will

