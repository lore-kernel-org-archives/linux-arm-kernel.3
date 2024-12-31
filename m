Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79A2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 01:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2977F/vnqyUBER9tNZQq405KupuOFUv4wjLFhd48yk=; b=5F+q9rC/M6ATR6UsvY+z7BtVE/
	eszLmuS1xeGSkgCmZzGaEBthnnEJ0LVqRTCJbXpZZPCqR35FYFqOxBmLewx51mLC4OB5CopQiZStb
	lqyBg9kO3KG+yldlgCVURELcDH+01lcwB8/tyVsfQkpoS9odyUfd+oW+XbPDkojluHe5JBHb0KS4G
	BXbzp+6JE7lu0XB+NtYqzmuoyW6od2VjOYM9w0O8f1mKgF60eJ1aDu6QDd05liCYeIfC9NFuKc1MT
	3N8CaGey4fI5HRXrJWx+3uOqaBNYOqQuhW8apaXqnOzkNZnsFc3QqlWOonVP6hhGhm0p3t2rO2TgL
	55A/TP4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQmb-00000006G1D-2Avx;
	Tue, 31 Dec 2024 01:10:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQlL-00000006Fod-1hOc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 01:09:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1327CA40FE6;
	Tue, 31 Dec 2024 01:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2294DC4CED0;
	Tue, 31 Dec 2024 01:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735607374;
	bh=R2977F/vnqyUBER9tNZQq405KupuOFUv4wjLFhd48yk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ineBT4yOUiXBvn2+CodK1YF7hwKVCCNuLyQu5OH4u16pqhUgBmf7U9QkzPa63WGk4
	 Zg5Q1rdhujUIxFErggh6/iTv1PSrWghsyEPFEwBeKMnhNIlLzz3VdXum0ysOFo8KuY
	 bIdeuTIuUj9ZwsngrvVFS66fLt8LBhXRCvWSmLzRsLSAhLEBaKCMmi2CnkP31sNL1R
	 fHi5rTvipoQyzOhMQsqheNpGiLCUkSsEzcoF7Y75/QOmbamiDA/ih3zz0gAfZ1Xl08
	 iKDt/xGirMiRuvToAgNTnJbtpOOl0k27CEThxpeahTgUTqmr+nMnpYfoK/qt+9USXM
	 R0pFoa27MI7eQ==
Message-ID: <3bcf5bc1007c9ed2900780fe07e66cb8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87jzbqtfc3.fsf@bootlin.com>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com> <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com> <fd2b473bc7c3c70ae0e85b2a6315d9e8.sboyd@kernel.org> <87jzbqtfc3.fsf@bootlin.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when walking subtrees
From: Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Ying Liu <victor.liu@nxp.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, Herve Codina <herve.codina@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 30 Dec 2024 17:09:32 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_170935_540516_0F52E33D 
X-CRM114-Status: UNSURE (   9.83  )
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

Quoting Miquel Raynal (2024-12-23 10:38:20)
> Hi Stephen,
>=20
> >> +/* do not passively change this clock rate during subtree rate propag=
ation */
> >> +#define CLK_NO_RATE_CHANGE_DURING_PROPAGATION BIT(14)
> >
> > Why doesn't rate locking work?
>=20
> Can you be more specific? What function from the API is supposed to do
> what I need? AFAIU, none of them is properly locking the rate during a
> subtree walk, but if I misread one of them, I'd be glad to drop all this.
>=20

It's clk_set_rate_exclusive() as Maxime also asked about in the other
thread.

