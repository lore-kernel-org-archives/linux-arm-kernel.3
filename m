Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FBEC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 22:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8UCpGinEEx38TrWd/CPG0HIJt78xJ7Fz9XFgRVUUTc=; b=eyXxdPE4av7Qks4BCYnNEsO4Xf
	6iJ6/p3AulpPxPsWGawENcpBStRNCGokrC5mm2SSl0v1W7uG+qQ/TjvTdhqSORlgEh+D4ZP+53A2A
	YmZAPWijsTQkmBg3+7U3Quyb5CW4D8WAbmdLLAQ4YgxowAi7HFVRbXYvVD5/ulpyL4ZOAj0itzQUc
	4QbkWiU897YpoZ7kxwOm3J+eTmrxFC853wIYniSh59KitVUK9cJyWNVcrO2LItXIhSerLR/pBQa/N
	3wsvgRkcK4LUnreUdVc96T2n+ZZ7h/u9udUGb6wiZYyY1ZSVqcsNEx2qXXkh8LTiakvPREp0qXgQX
	rTXiwMoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4eV-00000008cve-2chu;
	Thu, 24 Jul 2025 22:43:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4E1-00000008ZYB-1nVk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CDA045C65E8;
	Thu, 24 Jul 2025 22:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7187CC4CEED;
	Thu, 24 Jul 2025 22:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395340;
	bh=U8UCpGinEEx38TrWd/CPG0HIJt78xJ7Fz9XFgRVUUTc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bQdHgvYzoO7NHFgBWiDmYg0SNxj1OsHhlEBZea4BLgu8E2QHkVIzOvpajBVVC1Jbl
	 AjKfs9GwmpdKIUgMC2WgdaqzXklkNKKTDKHZPyKBCN8HFKozr7VPnE2po+sXYcH0Ew
	 YV32oyt3886w8CVtmHmHwjcgm6ShJjj56KW6L8nlW1VqmlsM2XmUsGkMsMKy6Rk4Xx
	 D4OUf/Wb5vkg4fDiEmMhHLMn1H5WKEpIyLS/2tNCEz+h+DC3/c48A0RE0Q1eCvzxb0
	 NxO5i7QXelu37Q6CNpV0YBnTDV0OoDaN4iDm3CRSlAhBi2FtqHkIN/+D+hVR+o+rWc
	 yuT6kxOhZxNFg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-clk-imx-round-rate-v1-10-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com> <20250710-clk-imx-round-rate-v1-10-5726f98e6d8d@redhat.com>
Subject: Re: [PATCH 10/13] clk: imx: pllv2: convert from round_rate() to determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 15:15:39 -0700
Message-ID: <175339533958.3513.5105460189010715284@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_151541_507483_87909AE8 
X-CRM114-Status: UNSURE (   7.23  )
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

Quoting Brian Masney (2025-07-10 14:10:42)
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

