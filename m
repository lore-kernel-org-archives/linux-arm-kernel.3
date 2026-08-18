Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A612DC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUcfhj85sX4cPSzt12bp3zzQ/yVXxAtFH+q/piQ/qBI=; b=yO88PF8x862HScE374KYDqKpL7
	L/OnMmf3fRwTgVuAEqVkHHb5Kx/zF+C/r7oMBEwNoDIdFQ7TV1WOssX/VDjW8TFFTb0Sy3c3wonYQ
	rEl1topK+SrbrkJgvlBljHmkVZgJSA0w1xRRgRTBdOd49xzcGrDi1+QDyBSY5qtTqBVKdNC+1md/V
	ZQ2FoAoDSZyzu0FkbHrvjXmd/ZAgwVEf6K0AvYEvwknd1Iy0a049JFYirjcqCVd3Zy0jKBsezRg/B
	324+2FQ3uNImKbM06juG8sr3kop7+O2emRHAy6TdOtxhGAIOnqjN8/T4QSk7fCBGYdH28mvErnHV7
	BrfdmUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG6D-00000007cN1-1pap;
	Tue, 18 Aug 2026 09:27:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG6C-00000007cMv-2b0e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 09:27:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 26C6E435AA;
	Tue, 18 Aug 2026 09:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073451F00ACA;
	Tue, 18 Aug 2026 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787045232;
	bh=xUcfhj85sX4cPSzt12bp3zzQ/yVXxAtFH+q/piQ/qBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nAg4bcC2+xd4rXCg1Xoy05lf0LRLLNQkiFqvbfD1IZWaPZSWI34IBfju7U4vO1r+Q
	 n4+E3PM/xuCbBLjsOhVYbKrZ+8M+aFTsDHOHiMaAxEIoywpR4tMLpybhBVzRmGXRQf
	 AmHs+8M/RWjcxUZFa5vlMaQn7c+8SS7wAvccJiyCL7audVJddbgsGZ1dDVtbV1FrTN
	 65e5nDotPtuakJ7snWZFdnM5i8faaPQOJHezh+irnjm0AlAmnuVkzvZW353tiwG4CB
	 UpaSA+l+dB3St2LCtm9OcXWuq/cM4LInNCYeVpKbmolYlwbm0hdUyTQWi2w5rB17y0
	 OXulz5OKBHQLw==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wwG69-00000000oqO-2TCu;
	Tue, 18 Aug 2026 11:27:09 +0200
Date: Tue, 18 Aug 2026 11:27:09 +0200
From: Johan Hovold <johan@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: imx: scu: fix autosuspend cleanup on probe failure
Message-ID: <aoQlbUquNf44_eav@hovoldconsulting.com>
References: <20260808082933.2692878-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808082933.2692878-1-lgs201920130244@gmail.com>
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

On Sat, Aug 08, 2026 at 04:29:33PM +0800, Guangshuo Li wrote:
> imx_clk_scu_probe() calls pm_runtime_use_autosuspend() for non-CPU
> clocks, but its probe failure paths do not call the matching
> pm_runtime_dont_use_autosuspend() before disabling runtime PM.
> 
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during cleanup, this reference is not dropped and usage_count remains
> unbalanced.

As I've explained elsewhere, this is just misleading. There is no usage
count leak here as the count is balanced whenever the user re-enables
autosuspend through sysfs (by writing a non-negative timeout).

Drivers should clean up after themselves and disable autosuspend, but
this is more of a clean up than a fix and should not be backported.

You've sent upwards of 60 of these in the matter of just a few days,
some of which have even been picked up. Please send follow-ups (replies
or v2s) as soon as possible to prevent further of these from getting
merged.

> Add the missing pm_runtime_dont_use_autosuspend() calls to the probe
> failure paths before disabling runtime PM.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 78edeb080330 ("clk: imx: scu: add runtime pm support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Johan

