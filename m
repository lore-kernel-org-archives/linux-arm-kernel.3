Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C38C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DFwpqeriIJovXeTA5M0evm4u8gZ+MY9ntOIH6DK7B0=; b=lnVPCmSKMna21acxUuvDgoZX7V
	BB4ZHDl7wFidCVjmapKU6134h8ss9yCM+kvFinl3RaLO1uyh76ztfVGM/j+2bskeQZpsgZLkfbWa4
	cc7BPDj5GBR4/A2vHfj2m73XbsO7lPBWrZm9t/z7FzposCFaheKpxmtChRymI+iqidEOvkSNMnCsO
	IigMMkBEjq81fAucvguXxyvQhjyfb1JrE6CbqB/mKxSQYa2Cnblbq2rGqMdrV7JOlAnJA1Yhvbgnl
	DChB+JAoxMjw03RZFSQ124jt4GfTVHUHgC/a0uSP3zjGcKQm02C77HLKb+wazeP4AIsKs9oqLrxBo
	MK/Lo2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hqj-00000008Zng-1pEc;
	Thu, 03 Apr 2025 10:31:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HRu-00000008U0C-1rYT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 10:05:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D310F68424;
	Thu,  3 Apr 2025 10:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E361C4CEE3;
	Thu,  3 Apr 2025 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743674725;
	bh=VZJ6WOI/SuQ08FQpls6TmDhOFgJH3ksO9l4DB+vGrAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fA/pQvnlYR5k7TApr2skxozgAc4nIZwluPOEp9LbXP5aYaORp55ZlrSbC3e4OEHW0
	 eTTMRGXdOOSJ+vbOAwGjpDLJY628FUmxzWibffIv2OxW9KbW8DNJ8f/j2f6Cqf38H3
	 FwuP+YMOnNxYdFkDijgH7K4pKKskaigCHwN0evcvLPUFBBzhKRtMvnFYDnjlIbv3/8
	 8Yu4/tM+6kSeT0D7BjHN1x6it/KqXwdS4nPuVH6pnLWXsKKUCCUVs0nZpHxaz+H/ge
	 r3YGR0/wVcPo/dQtj1iLanajdYXtJY6nEGwEwZ6O7DyrFekjXSpOu4CqXgPGvNdLLx
	 /JrjbijUFJzEA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u0HRy-000000000iG-1BL8;
	Thu, 03 Apr 2025 12:05:30 +0200
Date: Thu, 3 Apr 2025 12:05:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [RFC PATCH 3/3] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk:
 Ignore FC bit in attributes
Message-ID: <Z-5daoJn22XTprwk@hovoldconsulting.com>
References: <20250401122545.1941755-1-cristian.marussi@arm.com>
 <20250401122545.1941755-4-cristian.marussi@arm.com>
 <Z-5F8eTaZB2gLTNs@hovoldconsulting.com>
 <Z-5QGXj0wXMvtasf@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-5QGXj0wXMvtasf@pluto>
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

On Thu, Apr 03, 2025 at 10:08:41AM +0100, Cristian Marussi wrote:
> On Thu, Apr 03, 2025 at 10:25:21AM +0200, Johan Hovold wrote:
> > On Tue, Apr 01, 2025 at 01:25:45PM +0100, Cristian Marussi wrote:
 
> > > +#define QUIRK_PERF_FC_FORCE						\
> > > +	({								\
> > > +		if (pi->proto->id == SCMI_PROTOCOL_PERF ||		\
> > > +		    message_id == 0x5 /* PERF_LEVEL_GET */)		\
> > 
> > This should be logical AND and PERF_LEVEL_GET is 0x8 (currently
> > fastchannel is enabled for all PERF messages).
> 
> ...right...not sure how I botched this condition completely...my bad...
> (even the comment is wrong :P...)

The PERF_LEVEL_GET comment? That one is correct, right? :)

> > > +			attributes |= BIT(0);				\
> > > +	})
> > > +
> > >  static void
> > >  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> > >  			     u8 describe_id, u32 message_id, u32 valid_size,
> > > @@ -1924,6 +1931,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> > >  
> > >  	/* Check if the MSG_ID supports fastchannel */
> > >  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> > > +	SCMI_QUIRK(perf_level_get_fc_force, QUIRK_PERF_FC_FORCE);
> > 
> > This is cool and I assume can be used to minimise overhead in hot paths.
> > Perhaps you can have concerns about readability and remembering to
> > update the quirk implementation if the code here changes.
> 
> My main aim here was to be able to define the quirk code as much as
> possible in the proximity of where it is used...so that is clear what it
> does and dont get lost in some general common table....and the macro was
> a way to uniform the treatment of the static keys...
> 
> ...but I am still not sure if all of these macros just degrade visibility
> and we could get rid of them...would be really cool to somehow break the
> build if the code "sorrounding" the SCMI_QUIRK changes and you dont update
> (somehow) the quirk too...so as to be sure that the quirk is taking care of
> and maintained...but I doubt that is feasible, because, really, how do you
> even deternine which code changes are in proximity enough to the quirk to
> justify a break...same block ? same functions ? you cannot really know
> semantically where some changes can impact this part of the code...
> ..I supppose reviews and testing is the key and the only possible answer
> to this..

Yeah, it goes both ways. Getting the quirk implementation out of the way
makes it easier to follow the normal flow, but also makes it a bit
harder to review the quirk. Your implementation may be a good trade-off.

> > Does it even get compile tested if SCMI_QUIRKS is disabled?
> 
> It evaluates to nothing when CONFIG_ARM_SCMI_QUIRKS is disabled...
> ...so maybe I could add a Kconfig dep on COMPILE_TEST ....if this is what
> you mean..

Perhaps there's some way to get the quirk code always compiled but
discarded when CONFIG_ARM_SCMI_QUIRKS is disabled (e.g. by using
IS_ENABLED() in the macro)?

CONFIG_ARM_SCMI_QUIRKS may also need to be enabled by default as it can
be hard to track down random crashes to a missing quirk.

> > >  /* Global Quirks Definitions */
> > > +DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
> > > +		  "your-bad-compatible", NULL, NULL, 0x0);
> > 
> > At first I tried matching on the SoC (fallback) compatible without
> > success until I noticed you need to put the primary machine compatible
> > here. For the SoC at hand, that would mean adding 10 or so entries since
> > all current commercial devices would be affected by this.
> > 
> 
> Ah right...I tested on a number of combinations BUT assumed only one
> compatible was to be found...you can potentially add dozens of this
> definitions for a number of platforms associating the same quirk to all
> of them and let the match logic enabling only the proper on...BUT this
> clearly does NOT scale indeed and you will have to endlessly add new
> platform if fw does NOT get fixed ever...
> 
> > Matching on vendor and protocol works.
> > 
> 
> That is abosutely the preferred way, BUT the match should be on
> Vendor/SubVendor/ImplVersion ... if the platform properly uses
> ImplementationVersion to differentiate between firmware builds...

We don't seem to have a subvendor here and if IIUC the version has not
been bumped (yet) after fixing the FC issue.

> ...if not you will end up applying the quirk on ANY current and future
> FW from this Vendor...maybe not an issue in this case...BUT they should
> seriously thinking about using ImplementationVersion properly in their
> future FW releases...especially if, as of now, no new fixed FW release
> has ever been released...

Right, in this case it would probably be OK.

But what if the version is bumped for some other reason (e.g. before a
bug has been identified)? Then you'd currently need an entry for each
affected revision or does the implementation assume it applies to
anything <= ImplVersion? Do we want to add support for version ranges?

Johan

