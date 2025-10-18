Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6407FCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 01:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tRE9NauPV9+JqmVAp8lGgr9I5NvMyPT67l7BbNAZFA=; b=o/HVBop/sqZBFKkeWJB8vhEYUl
	ymu5WcuAPe8QN7INmD+NsKeYw1W+CiggG+pzgpJhaNFgRr4hUvLuIn3cG71/J4v6ajexrsWqw7SYn
	Q1am7gpEOi8Yy0BrJwifq2DuMNbPorChmmpnbQgzPau7oYdB8HqoUB3K0RDK92GRTe1OT6T6x8zG1
	7qSfPwmIVWVChAP/bYtAsRUFJdDKS6DMIIMM3YAeRTM5WP7bVLQ0I1dGqPkulSCM9jcWHYYFRpA1b
	uPK89klVMZucY6hqiqFBxL8vLFiw0A07n2DA1RrCL/507V/qLYE3Vw8uAr/ho8Okr/E/GJdD8Qyy4
	sIk3QKYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9vfv-00000009Ji9-316p;
	Sat, 18 Oct 2025 01:24:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9vfu-00000009Ji1-0INj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 01:24:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06513604C6;
	Sat, 18 Oct 2025 01:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EB2C4CEFE;
	Sat, 18 Oct 2025 01:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760750640;
	bh=VZ+0PK7Xowje368lQGozH1qMIaGZqErCNscmB4ue3mY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SuH8G0SFf8tnTa5DujFZD38xFGUFaxQuFoKV51uK4JH1z7LFyPmflJHVuSnJ8FrWC
	 AO3b/oG0nZu8YZG2uxVcRtARPIAN0jBNn7tZOoeymv06i36LKIxB3Lfpcfoss8KqxN
	 erm/41d9xXprtVZePAzU9m8ygIk8Xi/qlI3JJqYBa4Xg0JTip9jUrADT/srN4SlXZ9
	 qMv4A+Py4QrSFDUBy436rj9bXzEpBOfm87/3JqL9mg0vhOhXePQuc0QXAADLQMSZQH
	 HHg5++uP8wvG24Ume/bZ3TaZyHvVVc0lIGSNyVLq656h5A28f+S46Y9g1Mdy/SYcrH
	 Kbztuc1thO0qg==
Date: Fri, 17 Oct 2025 18:23:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Richard
 Cochran <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Alexis
 =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: stmmac: Allow supporting coarse
 adjustment mode
Message-ID: <20251017182358.42f76387@kernel.org>
In-Reply-To: <20251015102725.1297985-3-maxime.chevallier@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
	<20251015102725.1297985-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 15 Oct 2025 12:27:22 +0200 Maxime Chevallier wrote:
> The DWMAC1000 supports 2 timestamping configurations to configure how
> frequency adjustments are made to the ptp_clock, as well as the reported
> timestamp values.
> 
> There was a previous attempt at upstreaming support for configuring this
> mode by Olivier Dautricourt and Julien Beraud a few years back [1]
> 
> In a nutshell, the timestamping can be either set in fine mode or in
> coarse mode.
> 
> In fine mode, which is the default, we use the overflow of an accumulator to
> trigger frequency adjustments, but by doing so we lose precision on the
> timetamps that are produced by the timestamping unit. The main drawback
> is that the sub-second increment value, used to generate timestamps, can't be
> set to lower than (2 / ptp_clock_freq).
> 
> The "fine" qualification comes from the frequent frequency adjustments we are
> able to do, which is perfect for a PTP follower usecase.
> 
> In Coarse mode, we don't do frequency adjustments based on an
> accumulator overflow. We can therefore have very fine subsecond
> increment values, allowing for better timestamping precision. However
> this mode works best when the ptp clock frequency is adjusted based on
> an external signal, such as a PPS input produced by a GPS clock. This
> mode is therefore perfect for a Grand-master usecase.
> 
> We therefore attempt to map these 2 modes with the newly introduced
> hwtimestamp qualifiers (precise and approx).
> 
> Precise mode is mapped to stmmac fine mode, and is the expected default,
> suitable for all cases and perfect for follower mode
> 
> Approx mode is mapped to coarse mode, suitable for Grand-master.

I failed to understand what this device does and what the problem is :(

What is your ptp_clock_freq? Isn't it around 50MHz typically? 
So 2 / ptp_freq is 40nsec (?), not too bad?

My recollection of the idea behind that timestamping providers
was that you can configure different filters for different providers.
IOW that you'd be able to say:
 - [precise] Rx stamp PTP packets 
 -  [approx] Rx stamp all packets
not that you'd configure precision of one piece of HW..

If the HW really needs it, just lob a devlink param at it?

