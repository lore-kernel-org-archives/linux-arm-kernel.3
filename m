Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB395C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 08:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTAihOTfDMTWEObvctykX1psjJ0qBzH6lkafX4xD6XY=; b=1+pWujBoWebSrurKA5mfYHFm8z
	+J6AagHPVlNkWe+a2MYHRWje4USCsuJfbajkaC8/Q0feKrN+LVnI3Ac+vZs8Uesu87dT+nYzi85eW
	bFn/BSejESoJuOig1jggXKt22oRKbUI1+sFVh9VsEFLwnHJkqkWhDYqfEoSImPAjNASf4vtrigouD
	131tz+69RcXqejHTTEpJ6tqVJ97h5yepVWUtkpFZNyB7EJa04MTZTBEoQTxXH7MbWIa+uhVxumJnP
	WDukPEx3uvOBX2F/QsNKlTf3qp2dA0RJYZKcKgZlecyXeuZtXpkulApRloTU5PTs2G0QwqePWDjek
	kbFEXUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuS9Y-0000000594L-3XrB;
	Tue, 18 Mar 2025 08:18:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuS7q-000000058iJ-0l2j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 08:16:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B770EA48B24;
	Tue, 18 Mar 2025 08:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCB1C4CEDD;
	Tue, 18 Mar 2025 08:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742285797;
	bh=ctxArK0RpxAFnJgXHJlRkE8b4/gTvieT1jUwQ07e0jM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M8Y7XW7hzpfItFHELZ/8j1dQL2eDtHW9hAeFsBoh+Pp3wmMaT1DpgSeWP+diyzkWp
	 fedNDoTih7mCcRUmSh4fzwGcE0k5SRvpSZnjhZjbNRNgWrCTur5r9SvoWobN/GJstl
	 yLgWUrpvNiEd7f5CxKHWhWF/UgUvwaBRCZcJAx3ogxnnAjeQWuZS4WhjzgWl7EDmpR
	 bH9fKGn/GeUtG8ov/l0oKt8Ku0lV2ES5MUbthZWiAts6zV3BTL/2sRz6Tu2MGsEZHS
	 FI8VRl4eKBdgoDad70jALtXRXJCvE8XYcQVyDqLDSy1WzKoVJEiRLwY59iTxVIKzzk
	 720J+HyDVPj8w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tuS7o-000000004IM-0Crf;
	Tue, 18 Mar 2025 09:16:36 +0100
Date: Tue, 18 Mar 2025 09:16:36 +0100
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z9kr5ABbqO27_BM-@hovoldconsulting.com>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
 <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
 <Z77l1NflYXTnRyg0@hovoldconsulting.com>
 <Z8AjhHsVT9ZQTtZX@pluto>
 <Z8WKQJcPTQDIXaKD@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8WKQJcPTQDIXaKD@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_011638_355765_43875806 
X-CRM114-Status: GOOD (  31.82  )
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

Hi Cristian,

On Mon, Mar 03, 2025 at 11:53:52AM +0100, Johan Hovold wrote:
> On Thu, Feb 27, 2025 at 08:34:44AM +0000, Cristian Marussi wrote:
> > On Wed, Feb 26, 2025 at 10:58:44AM +0100, Johan Hovold wrote:
> 
> > > Something like that, yes. :) I didn't try to implement it, but it seems
> > > like it should be possible implement this is a way that keeps the quirk
> > > handling isolated.
> > 
> > I hope next week to have a better look at this, in tne meantime just a
> > few considerations....
> > 
> > Sooner or later we should have introduced some sort of quirk framework
> > in SCMI to deal systematically with potentially out-of-spec FW, but as
> > in the name, it should be some sort of framework where you have a table of
> > quirks, related activation conditions and a few very well isolated points
> > where the quirks are placed and take action if enabled...this does not
> > seem the case here where instead an ad-hoc param is added to the function
> > that needs to be quirked...this does not scale and will make the codebase
> > a mess IMHO...
> 
> Sounds good. At least we have a good understanding now of how this
> particular firmware is broken so it would be great if you could use
> this as a test case for the implementation.
> 
> In summary, we need to force the use of a fast channel for
> PERF_LEVEL_GET on these machines, or possibly fall back to the current
> behaviour of only using the domain attribute to determine whether the
> fast channels should be initialised.
> 
> The latter may allow for a less intrusive implementation even if we'd
> still see:
> 
> 	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
> 	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
> 	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.
> 
> when not supported for all messages (e.g. with the current firmware).

> > Anyway, after all of this babbling, I know, talk is cheap :D...so now I will shut
> > up and see if I can prototype something generic to deal with quirks, possibly
> > next week...

Have you made any progress on the quirk framework prototyping?

Do you need any input from Sibi on the protocol versioning for that?

We'd really like to enable cpufreq on this platform and ideally in 6.15.
I think that should be possible given that we now understand in what
ways the firmware is broken and what is needed to handle it even if we
still need to decide on how best to implement this.

Johan

