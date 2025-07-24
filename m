Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967A4C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 22:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBoq1lCVVrgZnUYIVT028SW6vJYgBrQMeZRnAVi88F8=; b=ozNtjQsNl6eM8vNtdDMpSuDJGB
	NV1uh31pm/q5ChnYD/OHcOLvCv8YIackdhFqV9AMeUuxN7J8F4qsC6I1ih/H0yHDVzWhXJBNVPcNX
	b5hfNrA9iaIJ9g0YI7rdbrd3vfQRKSezn7KDDjzizsGMW//VPDcacaoeq5wnuHLXvYgOm0Kbz33wu
	RBwF1XhsNeOse0sO0WgPD1IikVzo6BnObXja+Xqsc38DiDI2yIYzgmZB0lD9sban1KEPLikpXtyHX
	91YEfa74Xl5b1ZURGHUvCJkKjxdPmJff1VZDqQvWoSn2LZ3uh1m1fbylr5TaYBOWb2l5NZMnlHVmd
	oIb9W4pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4jJ-00000008dCk-0I7f;
	Thu, 24 Jul 2025 22:48:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4E9-00000008Zat-2KbQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:15:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA430601D9;
	Thu, 24 Jul 2025 22:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CD4C4CEED;
	Thu, 24 Jul 2025 22:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395348;
	bh=vBoq1lCVVrgZnUYIVT028SW6vJYgBrQMeZRnAVi88F8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=D3uBKUVKgjDOvAvwkm6d6u4TgcaK2Scvpxjp8XR8HlpsoXyWiNiVkcfwvYJcx3qXm
	 6cZWiAtBDMiovLSpG8FzdPlJo8Ze7hL+MG57WI1PMggtrRngAvjbCEQyYvOO9YlP1h
	 j/E/x9MnHx/vVI1FEDs3NcbcrEip4wOxKYUBVVxe+nq61q7zzCICUISjn3G08l1ToC
	 bYugXlmuW48N0TupBEewz2/SSQcb9qxwRYseq4QeF2aggJsJl7Ep3QVGBoHNBm/flu
	 Ba8BMjht7w37lAVYay78luh91qTLuY6cfozaMWtHfPsJp3eWWmz7oK1s5K/+48QnYx
	 ooVehLeJ+30NA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-clk-imx-round-rate-v1-8-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com> <20250710-clk-imx-round-rate-v1-8-5726f98e6d8d@redhat.com>
Subject: Re: [PATCH 08/13] clk: imx: pfd: convert from round_rate() to determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 15:15:47 -0700
Message-ID: <175339534771.3513.11159628872504238439@lazor>
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

Quoting Brian Masney (2025-07-10 14:10:40)
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

