Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90519E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 21:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bV2jOmYn5a+rvkj3ca8BtbAiM3DuOi3JaOZ8RhmC+kw=; b=3zj9jfLICtSZk+SKExtRcXX4px
	Z2aZ0vV9+NRNRQi7CsAmyeua4LzFws2EGnGMBoE18F88nwqZvuLfyu8YlkhSlrJY2P3tCqHgvxZLn
	ZXp8md6nS/T5Nw0/+lbPlgT0EZLecmSE+gGC95iUjIu1aMj42kHS5JVGamIlilc/0ZWaxQteO/ZQ3
	BHzl7O48ksUE3IOwtc/U38PJKFfZHEswfyqDH/YMSjhiq7DxVgUnGi9n3W2Ju6jBEy5YxwfJ8LDKz
	uHjUIOWlD6GjoVJFxeXnw2HAs0mppC56Rjn37gZMpAJFnfajUSPwBG+3fGlxIHLuDXKaG1KfL22Lh
	UwhbODag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUiL-0000000GF9j-3dZI;
	Wed, 11 Dec 2024 21:57:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUhI-0000000GF1L-0kGP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 21:56:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E126E5C63ED;
	Wed, 11 Dec 2024 21:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B33C4CED2;
	Wed, 11 Dec 2024 21:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733954203;
	bh=Lwqg+ADrB6ItLkQKdR+JgXfWXKYnf/XKcjMI3AS8BFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NJq9im5MPQBMqanlONUmrBV/FxkCDcsFQN8GMNVgPSqxAKUDwN4C8YBiQhyV09qGq
	 GKlk53gHao79q6y8c9DGmswlgUvyNHzeG4F2fzOAih76Z7CHKhOsOj5EcBykUnaQl2
	 7dMS1UbuGGYs2rVKnI2CbmCzehNdmIifn5E0MpK4M254AVcvp1LGX/cTBKgeqRrLPu
	 yDlgITovbyw1Taj+fdlJnZTS6XdhR5YJoylFXEbgXzhGx4ZC0PDjvC6reIt2eml73V
	 MxwcGILhO3Xheya/GL86JY9TmhZeU8llnruyRaSOCB/AUcWHKb3DHkvBoUOiqq/gH+
	 tygsFq8PD+ztA==
Date: Wed, 11 Dec 2024 21:56:38 +0000
From: Will Deacon <will@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.li@nxp.com, mark.rutland@arm.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] perf: imx9_perf: Introduce AXI filter version to
 refactor the driver and better extension
Message-ID: <20241211215637.GF17486@willie-the-truck>
References: <20241125104338.2433339-1-xu.yang_2@nxp.com>
 <20241209154419.GB12428@willie-the-truck>
 <20241210020212.yz3xowvdk27zmgsl@hippo>
 <20241210133732.GA15607@willie-the-truck>
 <20241211053455.z5zzawfacpyv2dlt@hippo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211053455.z5zzawfacpyv2dlt@hippo>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_135644_300302_1EEB8E1B 
X-CRM114-Status: GOOD (  38.22  )
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

On Wed, Dec 11, 2024 at 01:35:16PM +0800, Xu Yang wrote:
> On Tue, Dec 10, 2024 at 01:37:32PM +0000, Will Deacon wrote:
> > On Tue, Dec 10, 2024 at 10:02:12AM +0800, Xu Yang wrote:
> > > On Mon, Dec 09, 2024 at 03:44:20PM +0000, Will Deacon wrote:
> > > > On Mon, Nov 25, 2024 at 06:43:38PM +0800, Xu Yang wrote:
> > > > > The imx93 is the first supported DDR PMU that supports read transaction,
> > > > > write transaction and read beats events which corresponding respecitively
> > > > > to counter 2, 3 and 4.
> > > > > 
> > > > > However, transaction-based AXI match has low accuracy when get total bits
> > > > > compared to beats-based. And imx93 doesn't assign AXI_ID to each master.
> > > > > So axi filter is not used widely on imx93. This could be regards as AXI
> > > > > filter version 1.
> > > > > 
> > > > > To improve the AXI filter capability, imx95 supports 1 read beats and 3
> > > > > write beats event which corresponding respecitively to counter 2-5. imx95
> > > > > also detailed AXI_ID allocation so that most of the master could be count
> > > > > individually. This could be regards as AXI filter version 2.
> > > > > 
> > > > > This will introduce AXI filter version to refactor the driver and support
> > > > > better extension, such as coming imx943.
> > > > > 
> > > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > > 
> > > > > ---
> > > > > Changes in v2:
> > > > >  - modify subject
> > > > >  - add comments for AXI_FILTER version
> > > > >  - type -> filter_ver
> > > > > ---
> > > > >  drivers/perf/fsl_imx9_ddr_perf.c | 33 ++++++++++++++++++++++++--------
> > > > >  1 file changed, 25 insertions(+), 8 deletions(-)
> > 
> > [...]
> > 
> > > > > @@ -624,11 +641,11 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
> > > > >  	hwc->idx = counter;
> > > > >  	hwc->state |= PERF_HES_STOPPED;
> > > > >  
> > > > > -	if (is_imx93(pmu))
> > > > > +	if (axi_filter_v1(pmu))
> > > > >  		/* read trans, write trans, read beat */
> > > > >  		imx93_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
> > > > 
> > > > Hmm, doesn't this change mean we now enable this for imx91 as well? My
> > > > reading of the commit message is that imx93 was the first chip which
> > > > supports this.
> > > 
> > > Yes, it's enabled for imx91 too. In fact, imx91 is compatible with imx93.
> > > They use same configuration for axi filter.
> > 
> > Ok, but my worry is that the above code looks like userspace now _must_
> > provide valid values for the config1 (axi_id) and config2 (axi_mask)
> > fields on imx91, whereas before I think they were ignored by the driver.
> > 
> > In fact, without this change, how were the PMCFGn registers configured
> > on imx91? It looks to me like they were left uninitialised...
> 
> Before this change, PMCFGn registers are indeed not configured on imx91.
> However, they should be configured as imx93. I notice this thing when
> make this patch. First thing I tried is to add is_imx91(), then check it
> and is_imx93() by "||" operator. However, this way seems not scalable as
> more imx9x Soc comes out. Basically, AXI filter version will keep at V2
> unless big changes due to new features. However, perf tool need export
> correct MetricName via identifier in sysfs. So I made this patch, then
> PMCFGn will be configured based on axi filter version rather than pmu
> name.

Gotcha. But that means this is a fix, right? The commit message doesn't
really indicate that and we probably want a Fixes: tag to indicate how
far it should be backported.

Please can you send a v3 with that so I can apply it?

Thanks,

Will

