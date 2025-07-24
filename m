Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACC5C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 23:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqBZ/dBc3/jAic+RGlIRDOKcBSpRxqN9W1Esyu+vQQo=; b=fuSXqVR2mVdDCz7bVznuP2wx1E
	HLPGQzeQgcxhp5kXzqsm//CLwaUh2qsEjCG83dVtKlOLG/2bK3JYwMYkzYiIUtYZPaIqBfDFeoOKb
	DUad6PdFqIEYQI3dQwYlTMZgWay5Ppovr0VXJNIUi+4DSjhh7ZKiybVS9lSS/VyIhl9Z9Rq7+BSUD
	FRpmKCI8EFqMAdGvx20LFAHCXOrRVCIMyZ7JlEYVKkeAKzUlRKo+3k6PmOVTIxUOfKupHWRLNHNHb
	c5bH+qV5QwQdSiZYnkq2h60C9AInysa2F6V6MjG7wW0Erbm1fF85SjkHplElXT4K26qer/KkyWnuN
	v0D/YOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4xj-00000008eM4-2ilg;
	Thu, 24 Jul 2025 23:02:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4EX-00000008ZhB-3Nyt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:16:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 525435C67C0;
	Thu, 24 Jul 2025 22:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1DBC4CEED;
	Thu, 24 Jul 2025 22:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395373;
	bh=iqBZ/dBc3/jAic+RGlIRDOKcBSpRxqN9W1Esyu+vQQo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YIJ2pO1rjgh2MZEdpPDYwKHRPpMctJniFlt2F08cULZS8iKm4OX4+8M+d7xAJ6x9/
	 ADh2s/b9hN8RhXTZ5tjlnsilWYjQ90b0bQNR+3y3rHoUZge0ITkEGbgNWOMo1mBRnV
	 q5t/wnqiFIeqIskg/+y2rpsKx0fw6zEedLJYeGspp4LsBPeOO1sA87heH1qk/gYRJF
	 0bzwFAnRcf2N1iPdcx9pmQ4py4dvkXXAjC5Cq1NRBaMSaZAm/4h+raF8Rf9WHHmNj+
	 wd8x+pHcVrdOHUYiitqavRx+/ympB4pbgfS07IrJNuNCWl8Q1DUBsv7puKvIykPCos
	 l58SETOypKmsA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-clk-imx-round-rate-v1-2-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com> <20250710-clk-imx-round-rate-v1-2-5726f98e6d8d@redhat.com>
Subject: Re: [PATCH 02/13] clk: imx: composite-93: remove round_rate() in favor of determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 15:16:11 -0700
Message-ID: <175339537191.3513.15784417576198098141@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_151613_883121_E271C9F6 
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

Quoting Brian Masney (2025-07-10 14:10:34)
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops, so let's remove the round_rate() clk ops since
> it's unused.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

