Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C09C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uZIGtb+7KOrX+sckynNBFkeDyesfoZy0qxCDoajkHk=; b=wjYirbMK+kjuqGo5ZqOCtvcWjz
	WvgrTdq3/NJWTjCsm11W/2BXci4qABa2GMhdW5aw1nWsZX66lKAoGyuNoeG5LKQSROEgwfqvWArWR
	ilmBNT/iIRnnQrl3p468IzXNeRyv5tNpOaNZcWaO83GqHunZbUkFlDpehKv9WeTX81n9OU2spk5bs
	p42LogJu4pV5rikA7XMmlbrL1sOLZFDJ5pptwZ+4AV26mXYquvPGOR6Y1S2vy1o9eu0Xhn24fgjPv
	eJFjiAkcL7A8MHJyl4aTZjYoPApIyEIicO6IuQzZQzytxzzss3o80IMCC2qx5Udd2/GIH8edT2lTI
	sc33itzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1mD-00000006OL4-0dzl;
	Thu, 06 Feb 2025 13:18:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1cR-00000006M4E-2CaR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:08:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D7B91A44241;
	Thu,  6 Feb 2025 13:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B1EC4CEE2;
	Thu,  6 Feb 2025 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738847314;
	bh=dB2sXvFCFazjgPHF18eVuHRPrx9FXxAUTOD4xzJxjjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jwx5N4iUWHTc4s6JspVIkAaCvQTOUAsQAdcmd288qqCgafkBfkUD75H2++2MPWorM
	 ohin+gVLUH7JGtLF3XgaqW/gA1bIItyjRbgT36dq2GT1Ooc4F57TCnxLvm/h1583YQ
	 +Gnt+yQ221CZPGhR4jzQGfzJdSNk8WXEuBg9hYTD+vwqWRH/0uycVCM7x/mRBXtCe0
	 llo4Y/tfH9/P/yX2mXrxjWEriFmbtV6/jDo3IAxekflsUKxzHXPvWWHmq4ZRIsGd64
	 LwlwKeJXphNlYbZmwR6tr6VJLXcpwGCeehrI1U9snoFMQDQUwy7YlJNNZn8zjZDE6W
	 9efLhCnOSk1+Q==
Date: Thu, 6 Feb 2025 13:08:30 +0000
From: Will Deacon <will@kernel.org>
To: Emanuele Rocca <emanuele.rocca@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <20250206130829.GC3204@willie-the-truck>
References: <Z5OpGluX6oX5NLxh@NH27D9T0LF>
 <20250130114332.GA28662@willie-the-truck>
 <Z6M-5jupnms33ZAZ@NH27D9T0LF>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6M-5jupnms33ZAZ@NH27D9T0LF>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_050835_626225_6C7C8AAE 
X-CRM114-Status: GOOD (  16.70  )
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

On Wed, Feb 05, 2025 at 11:35:18AM +0100, Emanuele Rocca wrote:
> On 2025-01-30 11:43, Will Deacon wrote:
> > On Fri, Jan 24, 2025 at 03:52:10PM +0100, Emanuele Rocca wrote:
> > > This is with kernel 6.1.123. The last known good kernel I have available right
> > > now is 6.1.119. In the 6.1.120 changelog I see the following commit which seems
> > > potentially related?
> > > 
> > >  https://lore.kernel.org/all/20241106160448.2712997-1-mark.rutland@arm.com/
> > > 
> > > That's stable commit [1].
> > 
> > I can't see anything wrong with that patch but if you have reason to
> > suspect that it's broken can you try reverting it to see if the problem
> > disappears?
> 
> Confirmed: reverting the patch fixes the issue.

I guess that's just a happy accident thanks to the clobber list changing
on the smc asm with the sve check.

Will

