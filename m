Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0832C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 23:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpVetdFsSyXnn6b8ojWdDyu7cAVOzViuBAf4H4DsFJw=; b=Pn4complHT/cDkvOGQdRfeXVC3
	jldSl1mVRL5duaeQDDbg5Q3Rfp/j47/DiYmolPt1ZGCJ61hQe7whfo4R5Q3CW215PrMMJ9V+oDy7f
	VGLFZmoFKOUF+oDiTK8Cdo39PNbQ2jn/7QPKN4kN7LruhQ5aClGEks5Clcw+nQQv/LkjCqJ+aElsd
	Ntl0//E2yLMh25DjcBq2C6geXGPcZZ5qgpbxHD2bddFKntVWbaFGdVhJRrOCMxo824FFwIds55GTx
	fUeWE8FOT59vJ9h2KLjMx+7cF9wzIL5czkvwmccQlshQ3H7otatGq+sS6HgnToEO7/pIuHy7197nm
	yngY+TrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4vJ-00000008e87-3uti;
	Thu, 24 Jul 2025 23:00:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4ET-00000008ZgQ-3QhS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:16:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2BB74A562CE;
	Thu, 24 Jul 2025 22:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18DEC4CEED;
	Thu, 24 Jul 2025 22:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395368;
	bh=SpVetdFsSyXnn6b8ojWdDyu7cAVOzViuBAf4H4DsFJw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FvPFB0vlD9sI30fE0J2iUFVqzaYllyWbIhmLwuZ3olE5NJl5zfpkfGx7KU+PRdzbN
	 VBgAjfxhCiSIpgORjMk9JA1Gv0Jyowf2FctfXdG4EEVee9jrgYy2cmE34RmM60if2D
	 041BPvXM1+dQwTcaBoud0tlZ+auXvFluoEEFGuNeioQPDgbKkpnTkRYn4C+8bQMO4p
	 7AT+MHkdTlxeghLgs0RC0pozS8BSgNpt5aySw4hmZmyZS6p2A/qSfr8ev7vb+wv7/P
	 V3PfSSKbQJE7qMUzwIx7LDgcSHOhBt0ljYYw+x6xjYw44ZeEO2AJFk6T4CnXAyO6bC
	 +6I4DWUCoZZag==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-clk-imx-round-rate-v1-3-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com> <20250710-clk-imx-round-rate-v1-3-5726f98e6d8d@redhat.com>
Subject: Re: [PATCH 03/13] clk: imx: busy: convert from round_rate() to determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 15:16:08 -0700
Message-ID: <175339536800.3513.2964091155762156167@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_151609_917030_C6721022 
X-CRM114-Status: UNSURE (   8.28  )
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

Quoting Brian Masney (2025-07-10 14:10:35)
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> The change to call busy->div_ops->determine_rate() instead of
> busy->div_ops->round_rate() was done by hand.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

