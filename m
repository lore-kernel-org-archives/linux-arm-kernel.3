Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B54C54754
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0ZiU/DcoSa/seEPcSuNMjaWR2VHG04R0HPlpttYXqM=; b=VRIWQHsdO0pj+KAacagP/s4+EF
	cJmyeRhJ8cMm/un25NuG9/88M0lEXbIyLL8Ikpoe9A3eS5mJWgvk/ZKCCFbetqmb/lTqU+wrafpNv
	+DPrKxNLCRaVPrBm859BIkGmI+QLCufZokjLobxhjrdmiSv6VPUMutD/ebRFo7g93szxAOMMbnn0c
	ZcMlWra8iR18fPHla1Ug4S7fCJbi6/t6JNdEA5wy6OTZgLsAX6KjD7Y9jltImGx7R39WHdDxclqbC
	cLP/OtRWqpbvMIgds7ZipwTWrry58tvLTAk2Al4ecfDWptCxdPimZ2Af5B+3oMTs6JUZddutFgOv2
	NTmAw8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxi6-00000003z9k-27JR;
	Fri, 16 May 2025 16:14:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxIi-00000003uNI-29Xj;
	Fri, 16 May 2025 15:48:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 202CC4A8B1;
	Fri, 16 May 2025 15:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513B8C4CEE4;
	Fri, 16 May 2025 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747410524;
	bh=YwkrdAsWoKSTg4VyvIMwADPTVOl64Ko9498w1w+F5+o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KY1DIJmdEOjykVGmXpktVEaoBzevy5wMtkqjEZljk71vzm2nLkxE+xKQCVABROLH3
	 J2yWPNtA5bC96cIUKUflcR25hDaxENp8fqasS975RreMjoyKl7fTbF4g2RIn5uXoQF
	 u21mcgYMDYn8WsTnp3KPbPxtZn9ik0hO7nmrS799zCrAwv7ZjLEUCOjQR+fJKyND4Q
	 6obyKZdRJPLXfVgUWFu1RCrGNuHzLwAZrgd87/gqvsd+44OiDcuJqvIPutFW1cBXdY
	 8/+d9sgXWCav4LUg8sbB6JUD8vwBV+OAoee1dzzFEjehxNl3MPObiLZYk740MIsuQj
	 3OiGxhe/DTc/g==
Date: Fri, 16 May 2025 08:48:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 corbet@lwn.net, danielwinkler@google.com, davem@davemloft.net,
 edumazet@google.com, haijun.liu@mediatek.com, helgaas@kernel.org,
 horms@kernel.org, johannes@sipsolutions.net,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 loic.poulain@linaro.org, m.chetan.kumar@linux.intel.com,
 matthias.bgg@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 ricardo.martinez@linux.intel.com, ryazanov.s.a@gmail.com
Subject: Re: [net v1] net: wwan: t7xx: Fix napi rx poll issue
Message-ID: <20250516084842.26c80cb5@kernel.org>
In-Reply-To: <20250515175251.58b5123f@kernel.org>
References: <20250515031743.246178-1-jinjian.song@fibocom.com>
	<20250515175251.58b5123f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_084844_572611_3F2DC34A 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
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

On Fri, 16 May 2025 15:30:38 +0800 Jinjian Song wrote:
> It seems that a judgment is made every time ccmni_inst[x] is used in the driver,
> and the synchronization on the 2 way might have been done when NAPI triggers
> polling by napi_schedule and when WWAN trigger dellink. 

Synchronization is about ensuring that the condition validating
by the if() remains true for as long as necessary.
You need to wrap the read with READ_ONCE() and write with WRITE_ONCE().
The rest if fine because netdev unregister sync against NAPIs in flight.

