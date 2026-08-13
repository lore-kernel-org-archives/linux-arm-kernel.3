Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF5CC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZdbRmYqK/NrvcZBL3tWkYiVhgLDOnhq5mM4HObQAxw=; b=d+DwMfEiZMqBWrPV9re8lg2I7l
	bQX8vuJDAGl6qYSmC5zPW+80Z7d90m3sRsdNEYZMgZDf90FHbGfWQe4r/+sEK0aHbixLjIkKkNrBi
	nGfD9+zDCTvTVgN7EaTbSpeu3HXB3AIkUhfgqzujMM+j9hpTr8V5QeSloP9zT1ed1fKyFQwOhKpcz
	bP/MHpRIz+gM9yQWv5DMQnYQH28BkFO4WOIp9R1hXB/ivHaG04yNwz4t8F1bY7egBNBrZAncKvVAb
	sgOi8Wyfd1OHN8cwPp4r/N+jpw/hFMzcPy+xFslajsyOUC4LHFYJRnhX0qudpNDxYIpbERkdLoZt+
	A1gE0kag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPiQ-0000000Ha53-3rIR;
	Thu, 13 Aug 2026 07:19:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPiP-0000000Ha3U-0uC8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:19:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 802B2600AF;
	Thu, 13 Aug 2026 07:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6501F000E9;
	Thu, 13 Aug 2026 07:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786605540;
	bh=qZdbRmYqK/NrvcZBL3tWkYiVhgLDOnhq5mM4HObQAxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o1Wn/cbMNYFQmCUsmbGr3DdlRdbtKgTn11O8kaXLF0Qkoo68sKSVSbjTJO9JrBfaP
	 3DwLp62nQGHEuHmTwOSbF47l1Tpp8CzAnCdlm5IN15uXiF9xWUBImjCXSvrPnLcCrX
	 vhNOo1VCg1zYLjOsU+fWnYRTlBY1KBM/QzNTMnK6uHC+NMTeZrm/Ll9NdRsfqM1JG4
	 sH74IfNAwkn3q0yWImbSf/GfOa6Hx0N6PlxOzwmKtiTK3piMnq/2yxsqG2CYeYIpGb
	 O30vYFtBTQoDfeeUyizF0NtaBYNCV45wQhWQfACxDmR6wq3kFIccPz6rwLqIG9en36
	 Hts6eddT+YSZg==
Date: Thu, 13 Aug 2026 08:18:54 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH RFC 01/10] firmware: arm_scmi: Add SCMI QCOM Generic
 Extension Protocol documentation
Message-ID: <20260813-remarkable-handsome-heron-e99e78@sudeepholla>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
 <20260724-rfc_v8_scmi_memlat-v1-1-cb732bcff1f4@oss.qualcomm.com>
 <20260724-crouching-starfish-of-apotheosis-d1cdf8@sudeepholla>
 <f39b2be0-b6d6-43a6-a412-44ff433c51f6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f39b2be0-b6d6-43a6-a412-44ff433c51f6@oss.qualcomm.com>
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

On Tue, Aug 04, 2026 at 02:07:28AM +0530, Sibi Sankar wrote:
> 
> On 7/24/2026 2:43 PM, Sudeep Holla wrote:
> > On Fri, Jul 24, 2026 at 12:48:06PM +0530, Pragnesh Papaniya wrote:
> > > Add System Control Management Interface (SCMI) Qualcomm Generic Extension
> > > Protocol documentation. It consists of a small set of generic SET/GET/
> > > START/STOP commands, which is used to turn on/off and configure Qualcomm
> > > SoC specific algorithms that run on the SCP.
> > > 
> > > It currently only supports MEMLAT (memory latency governor) algorithm.
> > > The immutable pairing of the MEMLAT algorithm string with the supported
> > > param_ids associated with it are documented here.
> > > 
> > > Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > > Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
> > > ---
> > >   .../arm_scmi/vendors/qcom/qcom_generic.rst         | 954 +++++++++++++++++++++
> > >   1 file changed, 954 insertions(+)
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> > > new file mode 100644
> > > index 000000000000..42e327d53841
> > > --- /dev/null
> > > +++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> > > @@ -0,0 +1,954 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +.. include:: <isonum.txt>
> > > +
> > > +==================================================================================
> > > +System Control and Management Interface (SCMI) Qualcomm Generic Extension Protocol
> > > +==================================================================================
> > > +
> > > +:Copyright: |copy| Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > +
> > > +:Authors:
> > > +   - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > > +   - Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
> > > +
> > > +System Control and Management Interface Qualcomm Generic Extension Vendor Protocol
> > > +==================================================================================
> > > +
> > > +System Control Management Interface (SCMI) Qualcomm Generic Extension Protocol
> > > +consists of a small set of generic SET/GET/START/STOP commands, which is used to
> > > +turn on/off and configure Qualcomm SoC specific algorithms that run on the SCP.
> > > +Each algorithm is identified through an algorithm string and has an immutable list
> > > +of param_ids. All supported algorithms (currently just MEMLAT) have their own
> > > +dedicated section and are listed after the generic commands.
> > > +
> 
> Hey Sudeep,
> 
> Will set some context here, this version of the vendor protocol is currently
> running in the wild on 5 SoCs (Hamoa, Purwa, Glymur, Mahua, Kaanapali).

While noted, this does not impact the code quality or review process for an
entirely new feature. That context would be relevant for a localized fix or
system quirk, but it is not applicable here.

> The ABI/Specification that this vendor protocol uses can't be changed in
> any way since other Os'es like Windows/Android expect it to behave as
> described in this document and will break userspace.

The current rationale isn't entirely clear to me. Windows historically favors
ACPI over native SCMI, meaning that supporting a proprietary vendor protocol
would require non-native workarounds potentially hidden within interfaces like
PEP. I am skeptical of this architectural direction. Since Android leverages
the Linux kernel and already manages this through vendor modules, maintaining
those as modules seems like the optimal path until we agree on the interface
that can be merged.

> series is meant for the devfreq portion (since it introduces a new devfreq
> governor) and is not for the vendor protocol. We certainly can take design
> improvements for future revisions but making changes to this major/minor
> version of the firmware isn't possible.
>

Given that this patch series has been under discussion for nearly two years,
please provide a summary of the feedback that has already been incorporated
to address these concerns just for sake of argument and in your defence.

To clarify, the vendor protocol space is strictly intended for
platform-specific functionalities that cannot be standardized; it should not
be used to bypass standardization for convenience. It appears no evaluation
was done to determine if or why the standard performance protocol was
insufficient. Had that assessment occurred, I would expect the proposed
interface to align much more closely with the standard definitions as I
previously mentioned.

> Plenty of folks running linux on these SoCs would benefit a great deal from
> this series landing, so please have a bit of patience, take a look at the
> documentation/series as a whole. I still feel we should be able to land this
> series in a form that is acceptable to you. However, if you still feel you
> have
> to NAK this series regardless of its usefulness to the users, please do list
> the
> reasons and we'll try our best to convince you otherwise.
> 

The core issue here is that the proposed vendor protocol interface has been
presented as a finished product without open discussion or a willingness to
iterate based on upstream feedback. This approach bypasses standard
development processes.

IMO these vendor protocol interfaces must be debated on the mailing list prior
to finalization, similar to the 'code-first' prototyping model used for new
ACPI specifications or SCMI early prototyping. If an interface is developed
in isolation and then submitted with an expectation of immediate acceptance
without modification, we cannot approve it. I recommend we pivot to an open
review of the interface design itself.

> > This multiplexer 'N' random algorithn into one single custom SCMI protocol ID
> > (0x80) seems to go against the general SCMI design principle and this seems
> 
> Only the strings documented are allowed by the vendor protocol while the
> rest are filtered out, so we clearly don't have to worry about this. Also
> grouping a class of devfreq algorithms into a single vendor protocol should
> be treated as a SoC vendor design choice.
> 

This is precisely why I previously suggested defining MEMLAT as its own
distinct protocol. Doing so maintains architectural consistency and adheres to
core SCMI principles.

> > like a deliberated attempt to circumvent the standard SCMI protocol template.
> > Standard SCMI expects distinct features to occupy their own vendor protocol
> > IDs and utilize standard protocol discovery.
> > 

^^^ as mentioned above

-- 
Regards,
Sudeep

