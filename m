Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D6BCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 10:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42tYmO0dZcjSeLM0zqcR6vDt5BEyQJYqSsu5kU/EWJs=; b=2qF6gSc1h2IOpAYq/xdpNfuxGd
	31hx58wHlO+PIPwA3gMnovSA83ZxNTqcjo82XCrztm7Nmfs0fd9LL0TRsmK7lJt4hfOLg4Qlaf+u6
	syLgEp5/mMIR8QOGbciiCy/CEdJazFsR05SoPFXRq0Sy2bJ11Q/6LU9Gf4eOcjvZ8jEcq/mluNvHC
	CAYqfOdmeT/SmiSzbXVGMjttkl6RhYnpdiX/duQUJj2avcyWh6vKPL+tRblaFzCzY4bDrpJktVKrI
	B8mjR/R6TYNQ3Fky+IO5+jvTlz7xcJav5F5DV6vcpGtOjvK0Wjw5PDrRzM4DfgX1NNXMk7haFItwG
	hn+ID4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIP0V-00000005DxX-1osE;
	Thu, 30 Apr 2026 10:52:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIP0V-00000005DxQ-0htC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Apr 2026 10:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=42tYmO0dZcjSeLM0zqcR6vDt5BEyQJYqSsu5kU/EWJs=; b=ntLh136UqxlS/mHj/MnObyyqDk
	XuLQxqixW3wwdO6eAPYf++J+wFrJGO62MrEuRI0MUPvl4clvPCmXs6WtzlmN4ROGAWuXTq7/TSIuk
	mOYFAod+OA40yFEBySn93FavkDLi3SCmUhTMjxoj0uxyVdkLW1uzdkTEs75+G5jsr4yKj3kkZpakO
	r6QsAxqyqziVAIOc/Gk/j8IMeZotY/YuhTWUSFNiNo5X8sRrbMPvR0YiGLW7niSMAV27WdWKG1pd4
	UAQ0rUAMwMF85sBaTrAoYePTmNucbwMgt0krvsKWv1XMM6cx7Sg4Ks7KZjuSlmpHymIvpTfQO7oDO
	BpDEDTsw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIP0S-00000007A6p-0LbZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 10:52:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01A6B403D3;
	Thu, 30 Apr 2026 10:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873C3C2BCB3;
	Thu, 30 Apr 2026 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777546347;
	bh=gYsKTSldQ+t3dAVYY8tm2L8dmGS2r3wIELcQphbR2MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ly3jpivduFyRda6zGopCDcMIOoUAdg4wiKhOYtmYz0CD/fZSO4sg7xYe3mbBZ0WFS
	 qVAZisw7OYBdkJycAG+YbsBc393Xc1ZkuquD/lWRR7qXdNiSWeuD61j3P8NdvkjncM
	 htJy4xxHJsTRm0GXJsi1gAlaD92b8TlCUvHXNdJn4geWiP9AGF9mc/1HBpN1/Howe9
	 3rYsM9181RXvaAXEHvqDTNAbHirP3Oj1o5XDXELna5nSrV8KaB6lzwVn/uBoMBLHuW
	 QAAB32xLuP3mqJ4fFFp8M7l103stl/ffpclkF/dAL38B5cX2/mdKy9sp1maQd6/jBA
	 hCm7pubYigIow==
Date: Thu, 30 Apr 2026 11:52:24 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] firmware: arm_scmi: quirk: Improve quirk range
 parsing
Message-ID: <20260430-meticulous-obedient-butterfly-0dfdc0@sudeepholla>
References: <cover.1775205358.git.geert+renesas@glider.be>
 <fe257b3b7b7b5c17fd0e5727bb9746c731bd7e3c.1775205358.git.geert+renesas@glider.be>
 <20260430-heretic-mandrill-of-symmetry-1c9a5e@sudeepholla>
 <CAMuHMdWaF8buTuuMOPZLyEVF0vqPPdQxYP7LYJSj+vhdPJFc0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWaF8buTuuMOPZLyEVF0vqPPdQxYP7LYJSj+vhdPJFc0w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_115232_401528_706D849D 
X-CRM114-Status: GOOD (  21.28  )
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

On Thu, Apr 30, 2026 at 12:34:43PM +0200, Geert Uytterhoeven wrote:
> Hi Sudeep,
> 
> On Thu, 30 Apr 2026 at 12:17, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > On Fri, Apr 03, 2026 at 10:41:29AM +0200, Geert Uytterhoeven wrote:
> > > When a range contains only an end ("-X"), the number string is parsed
> > > twice, as both "sep == first" and "sep != last" are true.  Fix this by
> > > dropping the superfluous number parsing for "sep == first".
> > >
> > > This does have a harmless functional impact for the unbounded range:
> > > "-" is now accepted, while it was rejected before.
> >
> > Supporting "-" is good but I think the ret is uninitialised in that case
> > as sep, first and last are all equal. If you agree, I can patch up by
> > initialising ret to 0. Let me know if I am missing any other case where
> > it is not good to have ret initialised to 0.
> 
> My bad, ret should indeed be preinitialized to zero.

Thanks for confirming.

> Thanks for fixing!
> 

Pushed now, will let the build/other bots take a spin and then I will
announce as applied if there are no other issues(which should be the case
as it has been in my -next for a while)

-- 
Regards,
Sudeep

