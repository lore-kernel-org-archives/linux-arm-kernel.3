Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2185CC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 22:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6BKurNGI48HNi/DpysGBcT/yGh6myOqXQArZ7Fvyls=; b=MW2Bysrwou5alEbHgSBFKk/+aX
	ts0VEum5R1YIa5SswoX4VyrSfCoVDQsD4sJVHxEA4nu8KAzoLkK2zbJhA1sW6vWPYz9LOm7VyuGDa
	bWm81x7DErbeJ2rPaLWImFt5AJBTHiwqr6tvpUoZiH8/l9/Cjr6V3e9NCEOyJTO81u/VLEZ6xBO3C
	sqJLWmvuLSuN9jehn6qw/R1gaKllL5eCW77ZrKwGzRu0Ml1+/cSwzxCFOhlnQVVKo/oBXqNOci8tN
	6KJIVkE0EJvwmM46DSkowqAuDJwc9Cmz+Js7AgSUfufXHXTa0XfiKPfwdU6voXO2knhic7pO8pyOO
	F12EomaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4sv-00000008die-0w0D;
	Thu, 24 Jul 2025 22:57:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4EP-00000008Zfo-3xBH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:16:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62B21600AD;
	Thu, 24 Jul 2025 22:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC5CC4CEED;
	Thu, 24 Jul 2025 22:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395365;
	bh=M6BKurNGI48HNi/DpysGBcT/yGh6myOqXQArZ7Fvyls=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=d1F0mBUyw+cVAirPzfSnUo/Fej1VOADI9otww8ivZmQPlcP55qcD42IkVPBGgZehX
	 xabLhf3UKmqHOd5V3SMgwDmiV3ArWrPPeVSEPX5FUbljfurj0DbwGNMkLlirYmoJAi
	 ys42AyZXhGohqr//0qHxnubf16Xvz/elWu52GuDxpQPkjyNlIMSw3OpqlMY+zbLspm
	 xsYvKFS8XG9Azto4F9//LMiCLRBBlHFr/0SXWhFt9ujV5Qk5qjXHKG5ruk5WC3YV5Z
	 9NCNB27v4KKfTKKeT5bxmx4lyxAJZnEZwW2mzaitrVl9/hnrbxTcrUU7nc30nZJtfC
	 cattaiZ+lKG/A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-clk-imx-round-rate-v1-4-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com> <20250710-clk-imx-round-rate-v1-4-5726f98e6d8d@redhat.com>
Subject: Re: [PATCH 04/13] clk: imx: cpu: convert from round_rate() to determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 15:16:04 -0700
Message-ID: <175339536426.3513.280133875163880352@lazor>
User-Agent: alot/0.11
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

Quoting Brian Masney (2025-07-10 14:10:36)
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

