Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B017BC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 22:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1K/eRSbOff0T8+rVekcManbjFwPLp/evZt/FzKJpE8U=; b=2wWU27Xoblbk0w0jSYzbbOei3h
	h2c+/EoUv/9LGxS3CF2H1gjuMOKp0eg2clLDiVwFzmCbcDYJ47Im2VQjFv68ZiFaVkLxUexWGie1S
	443+LLnlHT9WZj/Ef53WR93e1TPSC+Kj2l11ZZnevDGMNfKqTwUSqQyMLhc3itBlOkl/CPqL3Ugn0
	Lyu1yQUdt/ceTgJ4T2UewlPae0WNrhfZq1AZu+wsB5sYpDrJ3PE4iA4k9+fX2GQ88oUPJSzoD5rpr
	Hl/e2qrfG/5mWsWyamuJhQujVexv62ZIuOs8BHcwC/GLmzVKoRjKgayIJ1JWHwvhBDtfZ5vzjzn+y
	W03v5jeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4c6-00000008cks-3c39;
	Thu, 24 Jul 2025 22:40:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4Dw-00000008ZXl-2ntS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:15:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FE6E601E5;
	Thu, 24 Jul 2025 22:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA6DC4CEED;
	Thu, 24 Jul 2025 22:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395335;
	bh=1K/eRSbOff0T8+rVekcManbjFwPLp/evZt/FzKJpE8U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jEHGIVcQq62aGxLF8GiPjy3xIA6ROk23PQ5672ROgz94Jm2D2sSAGvCwB8kYRrRuX
	 WsBQLqbOxtpSIX3ti8ZZB0WOnxJ/fnA0x8HsAA769QPoo5t8PYnDqhpiWWpwsOeU40
	 Tbxm1jHj0QQKYfMPLrWNUYwpyM8lcVk8Dbls1LDIOYL3DhhlfzKjXC2kssTgFiX6r6
	 ee64fYBArRkbs7EwbcS8aQrxouW+A9xNUNIo56LkbB/dn2ikyccH74FfDZGVRyed6q
	 E50qtSIvTYuDVeV0Q9Y6ZMa2eipJlJ0sjP/+D1VCb8iGhGPeB1SDDp8FACj6YZYGYH
	 s73+NAOiIy1zA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-clk-imx-round-rate-v1-11-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com> <20250710-clk-imx-round-rate-v1-11-5726f98e6d8d@redhat.com>
Subject: Re: [PATCH 11/13] clk: imx: pllv3: convert from round_rate() to determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 15:15:34 -0700
Message-ID: <175339533490.3513.1645095871041504041@lazor>
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

Quoting Brian Masney (2025-07-10 14:10:43)
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

