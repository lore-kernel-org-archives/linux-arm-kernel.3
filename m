Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA157E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 22:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/nmeGnzAeZFS/kUeVmy+bCkCE+hhczCm+5+dNvYEPs=; b=FAhQQ+TTQXy3jWDMpcJybv0jyT
	EhCuCSfG504XbcI53UVnXf1LMejBRjnXq5yOBrqRPn5eUpjDvTpjRxI70PT40bSXW42WLNbzcWnhU
	JXiniOoKt+HTxeOc1SBSMevlxoUHCfwKV7+P7wWmMIc1ZHBw6WVUJ9NIp3yVTqhPT3z343pPE6c2A
	udzAD9yL4PNX2cNTaVpW733MV1/DwN4f8vEWw4RdLHJuyMKRJZYCk/NVOowrI9/RNVfxVD9N3KjOe
	Ces6X6yYTedycAgOcF+bUb0cOKoqlme2HZeIsNQWjmHpEc2NUfTFSspZgCYvkWz5dFkRCL3MdeNHJ
	dNPBtgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8yt-0000000D2D5-2Wqf;
	Tue, 10 Dec 2024 22:45:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8xq-0000000D221-47rD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 22:44:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 802F1A41BF3;
	Tue, 10 Dec 2024 22:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCD1C4CED6;
	Tue, 10 Dec 2024 22:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733870661;
	bh=HP4MsNw/hXG7nhPJ0xWXWHKylFCTW4+JsqUQHNFKB2k=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=G0KXdhbbJ5rvvoDZqYRO6wYCU/J0eN/NtedIKQgZEPd2HdA2GPfsSOitJG8EW5ruE
	 DxH6lGL9Jr28NBCy+ZXrSsNn4DVjD0FvcBq1IHIi8pNEFXKvR0PCQrZT9C7+C2x+Zt
	 cxr1ixqZFf4slma0NhtmDYZ3q3DJxoHTkAmgxWTDbL8Ev4br2lExKoFXnGeQAGzVOf
	 HzJ+oAHkfu/VaOcs5R0EREvFKR/EWDek4d7n6ZYmLXnQjDdqPaxB/vwJBhXM+eu9jo
	 EIMrcVv9FF1sRyIKhwGu/JpCsHIZIhFmBYk/dVCi+OK6hJLpBpte73ViEaZLFrwE81
	 CWJLj4Z6TEJOg==
Message-ID: <fd2b473bc7c3c70ae0e85b2a6315d9e8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com> <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when walking subtrees
From: Stephen Boyd <sboyd@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, Herve Codina <herve.codina@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>, Miquel Raynal <miquel.raynal@bootlin.com>
To: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, Michael Turquette <mturquette@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Ying Liu <victor.liu@nxp.com>
Date: Tue, 10 Dec 2024 14:44:19 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_144423_149928_5F159A62 
X-CRM114-Status: GOOD (  13.71  )
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

Quoting Miquel Raynal (2024-11-21 09:41:14)
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index adfc5bfb93b5a65b6f58c52ca2c432d651f7dd7d..94d93470479e77769e63e9746=
2b176261103b552 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1927,7 +1927,6 @@ long clk_get_accuracy(struct clk *clk)
>  }
>  EXPORT_SYMBOL_GPL(clk_get_accuracy);
> =20
> -__maybe_unused
>  static unsigned long clk_determine(struct clk_core *core, unsigned long =
rate)
>  {
>         struct clk_rate_request req =3D {};

Please add functions in the same patch that uses them. It is hard to
review this patch when half the context is in another patch.

> @@ -2272,7 +2271,13 @@ static void clk_calc_subtree(struct clk_core *core)
>  {
>         struct clk_core *child;
> =20
> -       core->new_rate =3D clk_recalc(core, core->parent->new_rate);
> +       if (core->flags & CLK_NO_RATE_CHANGE_DURING_PROPAGATION) {
> +               core->new_rate =3D clk_determine(core, core->rate);
> +               if (!core->new_rate)
> +                       core->new_rate =3D clk_recalc(core, core->parent-=
>new_rate);
> +       } else {
> +               core->new_rate =3D clk_recalc(core, core->parent->new_rat=
e);
> +       }
> =20
>         hlist_for_each_entry(child, &core->children, child_node)
>                 clk_calc_subtree(child);
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 200135e0f6d00d48b10e843259333b9733c97f38..baef0b442ac1d36ee935cbcaa=
aa4e2d95fe7654c 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -38,6 +38,8 @@
>  #define CLK_OPS_PARENT_ENABLE  BIT(12)
>  /* duty cycle call may be forwarded to the parent clock */
>  #define CLK_DUTY_CYCLE_PARENT  BIT(13)
> +/* do not passively change this clock rate during subtree rate propagati=
on */
> +#define CLK_NO_RATE_CHANGE_DURING_PROPAGATION BIT(14)

Why doesn't rate locking work?

