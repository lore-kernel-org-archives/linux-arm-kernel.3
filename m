Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597F9C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OW7OP/NQ49fQv/lKJd6pSJwjF7WpKW61USJQD2CXCbw=; b=Hsk93U7vsqgnJkulUoMD4JZtaD
	alBl9jlpyiaE8Ajjn/XXDq5TPH315Yo3SbOojlLXJrIQZpXaEN7QSc2tWHJ+tBEQ6gSBGJ4WpBdPA
	lwzC3lMgoYqGEMghqULj/XHEJ4SeTte8lOw2Ns7ZArH2DEjmt93gV1WpAxmAAiYGAY9iqg9MIrZ3v
	gzqv8gpT5byEdTbIZ/lOuHJeOx569AUlgMSvDTB3+huPsS7OgF2Q5kjAuDg7OJut0g9pVgPe7/vIq
	aQHL5MP2GT1uzo8ayzADKwQqYm6KZapUWkFvW+0nCdUX3lM57wVoyCgnxYB3uN/AS5lLpSC8CEEZj
	phIDyjDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgODU-00000009cdA-1P9O;
	Fri, 07 Feb 2025 13:16:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOC5-00000009cQE-36ud
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 13:14:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3F50113E;
	Fri,  7 Feb 2025 05:15:15 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FE453F63F;
	Fri,  7 Feb 2025 05:14:49 -0800 (PST)
Date: Fri, 7 Feb 2025 13:14:46 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
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
Message-ID: <Z6YHRlxJG4V56wrZ@bogus>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
 <20250205-clk-ssc-v2-3-fa73083caa92@nxp.com>
 <CABGWkvqXf0ZmJKofrbahB5N5uer6ye6Q4s_PXz_Z61vG2pMu=g@mail.gmail.com>
 <PAXPR04MB8459F1CE0E8049355ADC9F3C88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <CABGWkvrKe6az5XR=MvdMwBOfeXqd5yPoF4Yf4pqyyGPD4Kpvpg@mail.gmail.com>
 <Z6TgesTZklGvmI56@bogus>
 <20250207112622.GB14860@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207112622.GB14860@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_051453_825710_5885D101 
X-CRM114-Status: GOOD (  20.32  )
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

On Fri, Feb 07, 2025 at 07:26:22PM +0800, Peng Fan wrote:
> Hi Sudeep,
>
> V2 is actually 2 weeks after V1. So after addressing the comments
> from Stephen and Dan, also updated clk-scmi.c to use a non-vendor
> changes, I posted out V2.
>

Sure, but as I said you posted on the very first day of the merge window.
So 2 weeks just cover the end of merge window.

> 2 days, this is just after got Cristian's comments. Then I posted V2.
> I try to follow your working style on handling scmi patches, but seems you are
> not active, so I mainly count on Cristian's comments and update patches.
>

Yes, his comments were for more discussions internally and externally.
Not to churn up another patch set.

> The i.MX pll patches in V2 is orthogonal to clk scmi, I did not expect
> complains. But ...
>

Sorry if I overlooked, but with not all the platform specific
knowledge it is just too much info to consume at once. Again it is
fine if you don't make it hard but churning newer versions. So please
give time.

> In my view, maintainers have patchwork to maintain patches. patches send
> out in merge window will not be reviewed in short time or surely not
> picked up, I understand this. patches could just be marked new in patchwork.
> If new version is out, old version just marked as not apply.

Though I don't use patchwork(probably I should not your problem).
However, sometimes I see all versions to understand the changes and
evolution sometimes. And it just gets hard if there are too many
versions in short duration.

> And I use b4 to manage patchset, and each revision has changelog.
>

Good.

> Indeed I not track merge window since I am not maintainer role. I was
> not aware this would introduce complain (: I will track the cycle
> in following days.
>

I don't say it is a must. But good if you manage to.

I will look at all the pending patches from you soon, give me until
middle of next week.

--
Regards,
Sudeep

