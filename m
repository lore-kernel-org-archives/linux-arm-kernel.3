Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3708EC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 22:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grSCuiAwDCBeCFH+68Z8byC7gM3bxL4Cu93vNJLHf8w=; b=b1juKhNJp328oY2rV32sMZDAKu
	ksLJxe7o9e+lovrVAinVRlmoHRmH6LQFOz0knLOD7sQYqU2oKLe9Q9uVqrULnAX7V2qJ0b/TbHlWY
	qYOzigWpYSnPJgLoovZsXTTlVUResMXD1tBoZ4+nNv4um9pzl1jAYgrMiXEJn8DWoZBytbe0oHbtJ
	AU2qs2MdKpR59FCks8OhQDhTJrxcaOxrh0fyx5BKO54e/xG31Ns9i1o08xf379/kzNLtbXqX0wwF+
	5iASTPYyY9ghVVeNcWQIZQb4kJ6ISy1Y34AJdE3nPUouBftaneDYgmma/jKn4sP5h4KYEp35yxyMD
	arRTu/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4XH-00000008bwl-1R9C;
	Thu, 24 Jul 2025 22:35:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4Dn-00000008ZVT-2SAg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:15:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BBD2601DA;
	Thu, 24 Jul 2025 22:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666DEC4CEED;
	Thu, 24 Jul 2025 22:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395326;
	bh=grSCuiAwDCBeCFH+68Z8byC7gM3bxL4Cu93vNJLHf8w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=E66zGOvbXj5RU5mFjLO7+U5lA78MW2mEnLgq4Yw10ocYgTS9wWCaT5qcComr+19ca
	 moKsRzn4JTOUmxti3xQ42p3YtHr+01g4y8gfg2RJcsN52svsajtgN90h3wBSls8GPW
	 7HL3BHdnI9arfRP+sXSiQ8SLIQzflf5l7kEfnbsozcwjyS76YO2KQqIX5KRqEK4y/0
	 UYCVaYrr3/uzzmpf5rdnmG6VyGj4ubuDBboQ7ILH/HK5yaqaRdF/pta+ooCSJf92zB
	 7n71Gs4+X+M2tbji+lOShk7cM2F7U0ZRnJY5G/jvxJqjJ/2STLXPoRkjOvqjEYRYDQ
	 MAbAd2ix4Y+Eg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-clk-imx-round-rate-v1-13-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com> <20250710-clk-imx-round-rate-v1-13-5726f98e6d8d@redhat.com>
Subject: Re: [PATCH 13/13] clk: imx: scu: convert from round_rate() to determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 15:15:24 -0700
Message-ID: <175339532491.3513.6017087056878306040@lazor>
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

Quoting Brian Masney (2025-07-10 14:10:45)
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> This driver also implements both the determine_rate() and round_rate()
> clk ops, and the round_rate() clk ops is deprecated. When both are
> defined, clk_core_determine_round_nolock() from the clk core will only
> use the determine_rate() clk ops, so let's remove the round_rate() clk
> ops since it's unused.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

