Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DD8C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 10:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VN9UPNNdCnSQLYCBghtlT63w+V581kVwQCE/FtNhyo=; b=eB8fji0Lj4G+MA+b7xOfpgWH7e
	uuctB5WcYTf1FhMLDJWWe1+aqOQV+WAmKH+v/TO3Y6R0Gcje4Gh3ybDFe7WqiQ2ENz2C+sAQECRJY
	DPRXjhABgj+/Xc2PVQx3P7GZyQsOoSkx1oTG6MaO3hqIM9KwL8mztGEkylfczI4fgUOciidm40sdX
	QTELNgjw0Nq84j5oXa6wAitdNE4rexXHGYH5Fr7vOwEGCYUKP3/Bfo+8ZFvHRzsNg4HocOs8Fm+ZO
	bL/XFzxC7jeRjmSRJXjkBcwAqNDWFzKkyhQ58wQ2fAufnF9jrQsj2ovN3/GV8nIYQ7yc4zInV6gcV
	7PkiqqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3TK-00000000QB6-3JFo;
	Mon, 03 Mar 2025 10:56:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3Qu-00000000Pap-3oBp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 10:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B2C05C584A;
	Mon,  3 Mar 2025 10:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B62C4CED6;
	Mon,  3 Mar 2025 10:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740999237;
	bh=x9DafxnZjhibXkXWWLnjj9HDJzQbEq4SqW+dqvT9BE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bsZj4rsmU/F1Q2BWq6kCpwkZDU8bVlA5ZeliPJWlRLGcHiBIqoXbE5TfGDzBOhBwc
	 p8JrexXMSUL9Npt1IJkXoFZIXS/Xzpca/ZXIXmIcbJbBjLhIY9eqJdnAty/xT6cdJS
	 ZXZR6JMTUGw1nGuLhCJT7vdxC66+OnAhbhg/rABx3SxOc5PrPYPP5wpEcCBFXoetOT
	 GfiJcw2UwoDGJgYm0Z+rlVUwrAfT+oAzbbx8mxcsmqtjUirh9c+An1ud6YpVTgwgW6
	 4F6WSjW8PBqOYFoOo7R3wf7ms0edgoSoPZJ5B7pucS4y2HSYxT13CeyYeHDnWlEyjQ
	 6GzZwpJ/dD7Cw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tp3Qm-000000004Ws-0yFQ;
	Mon, 03 Mar 2025 11:53:52 +0100
Date: Mon, 3 Mar 2025 11:53:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z8WKQJcPTQDIXaKD@hovoldconsulting.com>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
 <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
 <Z77l1NflYXTnRyg0@hovoldconsulting.com>
 <Z8AjhHsVT9ZQTtZX@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8AjhHsVT9ZQTtZX@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_025401_041404_116D0AD7 
X-CRM114-Status: GOOD (  34.44  )
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

On Thu, Feb 27, 2025 at 08:34:44AM +0000, Cristian Marussi wrote:
> On Wed, Feb 26, 2025 at 10:58:44AM +0100, Johan Hovold wrote:

> > Something like that, yes. :) I didn't try to implement it, but it seems
> > like it should be possible implement this is a way that keeps the quirk
> > handling isolated.
> 
> I hope next week to have a better look at this, in tne meantime just a
> few considerations....
> 
> Sooner or later we should have introduced some sort of quirk framework
> in SCMI to deal systematically with potentially out-of-spec FW, but as
> in the name, it should be some sort of framework where you have a table of
> quirks, related activation conditions and a few very well isolated points
> where the quirks are placed and take action if enabled...this does not
> seem the case here where instead an ad-hoc param is added to the function
> that needs to be quirked...this does not scale and will make the codebase
> a mess IMHO...

Sounds good. At least we have a good understanding now of how this
particular firmware is broken so it would be great if you could use
this as a test case for the implementation.

In summary, we need to force the use of a fast channel for
PERF_LEVEL_GET on these machines, or possibly fall back to the current
behaviour of only using the domain attribute to determine whether the
fast channels should be initialised.

The latter may allow for a less intrusive implementation even if we'd
still see:

	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.

when not supported for all messages (e.g. with the current firmware).

> Last but not least, these quirks 'activations' in the SCMI world should
> be driven mainly by the VENDOR/SUB-VENDOR/IMPLEMENTATION_VERS triple and
> only as a last resort by a platform compatible match...because the
> IMPLEMENTATION_VERSION, exposed by the FW and gathered via SCMI Base
> protocol, is completely under the vendor control so it can, and should, be
> used to identify broken FW-versions...indeed all the distinct SCMI protocols
> are anyway versioned elsewhere according to the spec, so there is no need to
> repeat SCMI protocol version here..I mean it is an IMPLEMENTATION version
> 
> As an example on a JUNO the SCP reference FW reports:
> 
> arm-scmi arm-scmi.1.auto: SCMI Protocol v2.0 'arm:arm' Firmware version 0x20f0000
> 
> where the FW version represent something like the FW release tag, I think...not
> really sure about the menaing our FW gys give to it, BUT definitely it is not
> a bare copy of the SCMI protocol version...
> 
> So...
> ...does the platfom-to-be-quirked at hand properly use the IMPLEMENTATION_VERSION
> flag in a sensible way ?
> IOW does that change between a bad and good (or less bad :D) version ?

I guess only Sibi and Qualcomm can answer that. Both machines I have
that suffer from this report:

	arm-scmi arm-scmi.0.auto: SCMI Protocol v2.0 'Qualcomm:' Firmware version 0x20000

and I'm not sure if any fixed firmware has made it out to the vendors
yet or if the version was bumped when this was fixed.

On the other hand, perhaps forcing fast channel initialisation for
PERF_LEVEL_GET on all 'Qualcomm' firmware would work (i.e. only based on
VENDOR).

> Because shooting with the platform 'compatible-gun' should be the last resort
> if all of the above does NOT happen in this beloved fw...
> 
> Anyway, after all of this babbling, I know, talk is cheap :D...so now I will shut
> up and see if I can prototype something generic to deal with quirks, possibly
> next week...

Much appreciated, thanks.

Johan

