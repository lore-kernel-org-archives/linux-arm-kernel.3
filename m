Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7564C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 23:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3L3Mit1dr1E4S3bHgoJxCDbceOrm3lMkpt/MDBwFasI=; b=BaxryRXnxiswKZpf1NL02qU/Hi
	X2JGxkPehYeC4NNbE4aMWzI2NLz+Pv4n0ipGypzYx+ciwxg7UtcscrhqASw6fE1s4LEThxxNZdO/f
	4NhlocIp1nEIBaePmX1LymcYkY74K3YvDwxXuIzDFbDzgbuQsADc2u3jVrPdD8Srj1CCHWC4G3nCK
	FXs4B9D8+/wxFqF8hjnX2uFCCV99EJzMsmWKl27oZJrycW1jLQIu2pWdS5VOt+Fn618j1ce6Yqdrv
	ZQ3p61LD3eAm9HeOeRowTFnoQWYcD/s1u0Dz6JrrCB/ZZ/hPI1WJaE0tfn+H9jIKEVomGn9yERHpy
	tW+1wm+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf508-00000008eXo-1ecc;
	Thu, 24 Jul 2025 23:05:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4Eb-00000008Zi9-3aOt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:16:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E710A562CE;
	Thu, 24 Jul 2025 22:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B9AC4CEED;
	Thu, 24 Jul 2025 22:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395376;
	bh=3L3Mit1dr1E4S3bHgoJxCDbceOrm3lMkpt/MDBwFasI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bZ9hGX7TFoEbmFRxa+GlLtUm1x9+uz45iNRu8jSsgIOHubZjwMOI0cFguerCF88/6
	 MmFXhgOyANNij1ZCdqQVULFt6FQcWbV1ghD0ZzG7HdJfa38eD14QpuCl9SbTuTqwx9
	 MC/bYOWcRcCqJ7v0syXsRB+aPHAVQsaHtmMxgxZt7JuKESIfCUo1tnkBAfP2cFZadU
	 CT12pprEPWzdqzqZyGDXxWG6SHTuw7EBTDcDsMoVMz1O7i9A5/52uWgE2T4pu8iNDZ
	 0K3SM328TC6qo0VzLg4cDgupWAtY5f8/bgly1aay8dvnQ5zOFQT8PZRkBKad+TwxSj
	 WxYgfGgFTmoyw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-clk-imx-round-rate-v1-1-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com> <20250710-clk-imx-round-rate-v1-1-5726f98e6d8d@redhat.com>
Subject: Re: [PATCH 01/13] clk: imx: composite-8m: remove round_rate() in favor of determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 15:16:16 -0700
Message-ID: <175339537615.3513.10122327980339269667@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_151617_968473_E0EDC05E 
X-CRM114-Status: UNSURE (   8.10  )
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

Quoting Brian Masney (2025-07-10 14:10:33)
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops, so let's remove the round_rate() clk ops since
> it's unused.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

