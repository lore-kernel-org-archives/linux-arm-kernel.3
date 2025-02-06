Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F7FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07oSBwgh/00XqU8S9NwC+z5K2Q1ohr8OmAinlMr1GuU=; b=Zs0dYpp7Aw7h9sdkydYEoxIfj5
	6Gnxw5PUBFRffr+e/+HtBIYKxOxM0QNSkAxG6XpviBfQiktq0PnedsvcopiJajyI63z2NbNuI+cp8
	gBhIpgOVuxh2TeIi8Qyr35t6PKDDMUX6+iWAA9zjMe2B1G6phPLBqVnOaoqEH+G+5cp2vwmCoQjd/
	VyjvZfp85ZWWf8YAHexWyoEbjQg1ZEhx+GcJRmbgCk94+vtgiaLN9UaOat80honqkV4xFlObB3qiF
	JWC0iW9gLFprBwrdyyyBZQNDvE7zvT0a7GYue4hTpKYlkytQMmaj0y9nX7jT3r8RQtrxkzdrF4h/e
	J17R9Fwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4dL-00000006q5u-37f9;
	Thu, 06 Feb 2025 16:21:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4Yt-00000006p6I-2keu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 16:17:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAA9912FC;
	Thu,  6 Feb 2025 08:17:27 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 660E43F63F;
	Thu,  6 Feb 2025 08:17:01 -0800 (PST)
Date: Thu, 6 Feb 2025 16:16:58 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2 3/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Message-ID: <Z6TgesTZklGvmI56@bogus>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
 <20250205-clk-ssc-v2-3-fa73083caa92@nxp.com>
 <CABGWkvqXf0ZmJKofrbahB5N5uer6ye6Q4s_PXz_Z61vG2pMu=g@mail.gmail.com>
 <PAXPR04MB8459F1CE0E8049355ADC9F3C88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CABGWkvrKe6az5XR=MvdMwBOfeXqd5yPoF4Yf4pqyyGPD4Kpvpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABGWkvrKe6az5XR=MvdMwBOfeXqd5yPoF4Yf4pqyyGPD4Kpvpg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_081707_785412_79F2752A 
X-CRM114-Status: GOOD (  23.76  )
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

Hi Peng,

I apologise in advance for exploiting this thread to make my point.

On Thu, Feb 06, 2025 at 04:31:46PM +0100, Dario Binacchi wrote:
>
> Sorry if I miscounted the lines, but here we are not considering who
> actually implemented
> the algorithmic part of the SSC management and all the time spent
> testing the code on more
> than one platform/board with each submission of the series for all 9 versions.
>
> [1] https://lore.kernel.org/all/20250118124044.157308-18-dario.binacchi@amarulasolutions.com/
>
> Your changes, which are unnecessary for the clk-scmi.c changes, only
> serve to support the
> DT binding `assigned-clock-sscs`, which, as Krzysztof also reiterated:
>
> https://github.com/devicetree-org/dt-schema/pull/154
>
> you should have proposed during the review of series [1]. You are the
> NXP reviewer.
>
> >
> > If you think it is not fair, I could drop this patch in V3 and leave it to you to handle.
> > I take this patch in the patchset, mainly to ease your work and make
>
> Sorry for quoting Krzysztof again, but:
> "Three months iMX8 patchsets, multiple reviews and no single comment
> from you till January!"
>
> So please, if you really want to ease my work, then remove this patch
> from this series and resume
> reviewing series [1].
>

I had complained once in the past. I am repeating that again. You are not
new to the kernel development, yet at times I get really surprised with
the way you manage your patches and create so much confusion. It gets
extremely difficult to track what is happening if one doesn't follow all
your patches for a week(week is too lenient IMO, you manage sometime to
create same amount of confusion in just 2 days).

And as usually you ignore merge window and post a whole set of new series
on the first day of merge window. Which is fine especially if you are new
to kernel development(not true in your case though) or even otherwise if
you don't regularly track upstream cycle so much because of corporate
commitments(which may be true in your case and I am fine with that). But
you need to wait at-least a few days after the merge window so you give
every one a chance to follow your work.

And in this case, I would have avoided scmi changes are you have non-scmi
specific driver to get the core clock changes review first and then added
SCMI as it is OEM specific and we need to analyse it without other things
in flux or under discussion.

--
Regards,
Sudeep

