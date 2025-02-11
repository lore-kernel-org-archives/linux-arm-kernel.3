Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D287C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 07:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UvvQtMmlDYkGMGQvLnfsAM4V5vEvjxk19Oc9Xjo0ao=; b=40UUB5ozKydXgI+SfmpZ0raXMM
	9hCwAtzls++lK5Ct7Jtd6lqx0T3N+Vd5nQW/U/KqzfJ3w+YBGw2q8yJ+wBn9w0fWa6kGIjdbDeOuB
	gY6IzpRNWQg9kykwe4PtSkr1CGC60+t+HhQFKo96S2Lqf55htGw4U7Yt8BxEzB95XUlF0EjJqAF20
	5qGq/p0HzL9fL5cyBylNGnb+0G8OhTT3fex1A1mwLTrT7ajV01wTmcFS1GQpwUscnVWPX01Bi7Zy0
	SmYl9lsQmAfBrjNvXoArZGB+13lQBOSuYiZTdDErQLrKS9O7hjQmz658dFWxojd/vjTItUDNUX+F3
	Dkkpxm1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thl0z-00000002sj3-16BD;
	Tue, 11 Feb 2025 07:49:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thkzY-00000002sNp-2IOl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 07:47:38 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1thkzF-0007Hw-1Z; Tue, 11 Feb 2025 08:47:17 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1thkzE-000NbY-1A;
	Tue, 11 Feb 2025 08:47:16 +0100
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1thkzE-0094Je-0o;
	Tue, 11 Feb 2025 08:47:16 +0100
Date: Tue, 11 Feb 2025 08:47:16 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] clk: imx: clk-fracn-gppll: Support dynamic rates
Message-ID: <Z6sAhAM4mGZCDBU-@pengutronix.de>
References: <20250210160012.783446-1-alexander.stein@ew.tq-group.com>
 <20250210160012.783446-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210160012.783446-3-alexander.stein@ew.tq-group.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_234736_584088_CB9D45DF 
X-CRM114-Status: GOOD (  27.36  )
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

Hi Alexander,

On Mon, Feb 10, 2025 at 05:00:11PM +0100, Alexander Stein wrote:
> The fracn gppll PLL so far only supports rates from a rate table passed
> during initialization. Calculating PLL settings dynamically helps audio
> applications to get their desired rates, so support for this is added
> in this patch.
> 
> The strategy to get to the PLL setting for a rate is:
> 
> - The rate table is searched for suitable rates, so for standard rates the
>   same settings are used as without this patch
> - Then try to only adjust mfn, on fractional PLLs only, which specifies
>   the fractional part of the PLL. This setting can be changed without
>   glitches on the output and is therefore preferred

I wonder if this part is worth it. There might be cases in which a
glitch free switch is required, but without being able to enforce
a glitch free switch we can't rely on it.

Also this makes the result depend on the current PLL settings, so the
result is no longer reproducible. I.e. switching from a fari away
frequency to the desired frequency might yield in different settings
than switching from a nearby frequency to the desired frequency.

Finally I think the glitch free switch doesn't work currently, because
the PLL is fully disabled and re-enabled unconditionally in
clk_fracn_gppll_set_rate().

That said, glitch free switching would be great to have sometimes.

> - As a last resort the best settings are calculated dynamically
> 
> Implementation is inspired by commit b09c68dc57c9d ("clk: imx: pll14xx:
> Support dynamic rates")
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

...

> +			if (pll->flags & CLK_FRACN_GPPLL_FRACN) {
> +				if (!dist) {
> +					/* Disable fractional part upon exact match */
> +					mfd = 1;
> +					mfn = 0;
> +				} else {
> +					mfd = 100;
> +					mfd = clamp(mfd, PLL_MFD_MIN, PLL_MFN_MAX);

With mfd = 100 this clamp looks like a no-op. Do we need this?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

