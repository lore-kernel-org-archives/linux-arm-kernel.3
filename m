Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92035C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPvRkZujsqtXddnpwyrF1yTeoNdc8lhCq+8gZGKlmqc=; b=O7WiTiEYfftlNjHTLcxiM05wLF
	om5kAOioDZjVLOCFSS8fPpY9Dd5xDvN6w0XL6hFaLdFVdp9CKK9qFfKJ2bW8kUts2xuJp3YjPpo92
	A+kjPSlKOMViR8N6nTAIyZB2F77IaEWACsoqcP8WiQEeQ7i9mTQXoKTeboi4ai72miP4GxXTlfRjD
	VLKhnxptgaScfYRP6woMPRqf+ba8u0K5nhHDW6TXHQH/peCoTXNRw1ywGCqeEm4at4v/8Ii0cDBtT
	YXer7suw9n8LPwBQSCQ7x6O7wEq1kZnVrw2Wk2KsSOcUvO3eM7V6O+88VkNQRe6q1ldSKs/3GPYGr
	qyrjPSOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DiJ-00000007JAw-34MY;
	Tue, 22 Apr 2025 13:31:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CZv-000000074mA-2XLv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:18:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5DD649D64;
	Tue, 22 Apr 2025 12:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4EFC4CEE9;
	Tue, 22 Apr 2025 12:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745324298;
	bh=+9I6NME4NYHS0z52hLJtD8uXVIRAnOr7BxIMSTaC1vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVVDhBYP+MGSsEAsIBd3rOh40nE6mmk/lhTnIuqZsGG9oVYOPMLP2FqNHlQD8yVqi
	 MECIoxWZ1vBGbUAirsJ0zmTYhpbCm+6yBjmICY+p/lN0m54A/X/uO88RtdwCdCW+3c
	 xiD6x9VPr1xsEerwzK2KjMP0sDX3xlaUNmGWK7Iym3VuXeBt10HTwmHXqpONJKrH+o
	 hQiJ7PfwW8cqIALffxKyQkKyVUugb+GZulzdPdkMGC93fXB0l10A+XZfsaJm2rxSQ8
	 ATmxZgzfIPudOCifJZbgRxfyPMwL3uBu0fJXQ1HUNfUi/4X7QTsxdhSg+JW0zPjYJ0
	 PzxXME8zS7NjQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u7CZr-000000004BV-2UMw;
	Tue, 22 Apr 2025 14:18:16 +0200
Date: Tue, 22 Apr 2025 14:18:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aAeJB4QGjdVPJIoa@hovoldconsulting.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-3-cristian.marussi@arm.com>
 <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
 <Z__cuT5IW0Sbjqpg@pluto>
 <aAC_aPHD4Ik-DW0x@hovoldconsulting.com>
 <aADhoX4Rkx8Eu_er@pluto>
 <20250417-teal-sidewinder-of-courtesy-d0473d@sudeepholla>
 <aAdya5rephGNP_Tw@hovoldconsulting.com>
 <aAd-lIzIGxzxfWXC@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAd-lIzIGxzxfWXC@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_051819_661531_08E8B1C3 
X-CRM114-Status: GOOD (  23.31  )
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

On Tue, Apr 22, 2025 at 12:33:40PM +0100, Cristian Marussi wrote:
> On Tue, Apr 22, 2025 at 12:41:47PM +0200, Johan Hovold wrote:
> > On Thu, Apr 17, 2025 at 03:41:56PM +0100, Sudeep Holla wrote:
> > > On Thu, Apr 17, 2025 at 12:10:25PM +0100, Cristian Marussi wrote:
> > > > On Thu, Apr 17, 2025 at 10:44:24AM +0200, Johan Hovold wrote:

> > > > > of_machine_is_compatible() can be used to match on any compatible
> > > > > string, but not sure if that fits with your current implementation.
> > > 
> > > I was thinking about the same when I looked at the code. Using it is
> > > more elegant IMO.
> > 
> > It would be more flexible, even if you never intend to accept any quirks
> > that matches for an entire SoC.
> 
> I already have a V2 under test that will define a quirk using a
> __VA_ARGS__ so that you can specify a variable number of compats to
> match against the platform running using of_machine_compatible_match()

Sounds good.

> > My understanding is that the version has been bumped now albeit for
> > other reasons than fixing this particular bug. And since enabling FC for
> > these messages should be safe we will probably be able to match on
> > vendor/impl_version here.
> 
> So what is your latest Firmware version read ? no more 0x20000
> 
> [    0.116746] arm-scmi arm-scmi.0.auto: SCMI Protocol ?? 'Qualcom:' Firmware version ???????

It's still 0x20000 for this platform AFAIU, and that probably won't
change even if the fix for this particular bug makes it into the
firmware for the commercial devices.

Johan

