Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FA1F4BB6F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 18:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+9/kVThc3/+V8elCs3VhAo/JNdEc8B5u2qZALvxJF4=; b=06F3oqNTdFfmS+odAExYp4/LJM
	3/jvgoo+e06V+gaChiuVxlYvZgO8lkDUkK43lRiPbkk354PaF7Or18SXeB/L4SHJ6ZxKpXtg6oFXC
	L5UXs9FPHe/7XamXOPP3eLbuA9++VMlilt4BOxXt8qrnQVsyK3CIFe/L4BOCQ6vGkd3Gv9ZwgPrU7
	J8x7NubzfltAVJnk/5kbk7FvL1FQFoBRk0XQLdd8h7d+xgKX5697AuA5dMDXGW2SwT1OhiPB4ycMl
	rmlt7N2lTTvPz7qVQ/BAmOmvMAaFMXhJw7P5SiScd/OI3OaeZK+yNUsi9UkbJqHYhnbQl+dmKbnY2
	cvhj1xRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuxIq-00000002eFj-2CW4;
	Tue, 24 Feb 2026 18:38:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuxIo-00000002eF5-1eaR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 18:38:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63FF8600AD;
	Tue, 24 Feb 2026 18:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B2DC116D0;
	Tue, 24 Feb 2026 18:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771958313;
	bh=dS/PeNeD3SjxSqxDdPYuOcwLO2rhR2F/UDY4OUrE8go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NeVWlmTOJhJlcf2PmA7E4NC6gNxINhb72p4NHtgkyLKaCJYMzQAy/keCJnA2KK+D4
	 Mf0HKgARJSzH2/4R4f40d31RyUB9qGr3mFYQrsP3gxEg+O4XWATTxQHXdNslk5f+yv
	 w2pFlwO5vAp9GZHfw6EXQ0O5P5At56q/eE3dWguZ64rHK/ZtFclnJZZaFmSBaKdvv6
	 rtQ1AGhipiTlK6H9Xbigxs2zEBQUPcF79m1CMwGc0e6oxJHnP96DtyoNcxU1LGg/3j
	 D0QGJ6559cz1b6h6MDNhDBN2F0l6CZzeazoO+GDCuTQ3g0z4Od6TmS4qZI3gX1qV7f
	 Ejfo/J/YfSL7w==
Date: Tue, 24 Feb 2026 12:38:32 -0600
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 0/9] soc: remove direct accesses to of_root from
 drivers/soc/
Message-ID: <20260224183832.GB3239922-robh@kernel.org>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
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

On Mon, Feb 23, 2026 at 02:37:15PM +0100, Bartosz Golaszewski wrote:
> linux/of.h declares a set of variables providing addresses of certain
> key OF nodes. The pointers being variables can't profit from stubs
> provided for when CONFIG_OF is disabled which means that drivers
> accessing these variables can't profit from CONFIG_COMPILE_TEST=y
> coverage.
> 
> There are drivers under drivers/soc/ that access the of_root node. This
> series introduces new OF helpers for reading the machine compatible and
> model strings, exports an existing SoC helper that reads the machine
> string from the root node and finally replaces all direct accesses to
> of_root with new or already existing helper functions.
> 
> Merging strategy: first two patches should be either acked by Rob or
> picked up into an immutable branch based on v7.0-rc1, the rest can go
> through the SoC tree.

SoC tree is good.

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - rename of_machine_get_compatible() to of_machine_read_compatible() and
>   add the index argument
> - add a stub for of_machine_read_compatible() for !CONFIG_OF
> - provide of_machine_read_model() to avoid having to look-up the root
>   node via of_find_node_by_path("/")
> - rename soc_device_get_machine() to soc_attr_read_machine() before
>   making it an exported symbol
> - Link to v1: https://lore.kernel.org/r/20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com
> 
> ---
> Bartosz Golaszewski (9):
>       of: provide of_machine_read_compatible()
>       of: provide of_machine_read_model()
>       base: soc: order includes alphabetically
>       base: soc: rename and export soc_device_get_machine()
>       soc: fsl: guts: don't access of_root directly
>       soc: imx8m: don't access of_root directly
>       soc: imx9: don't access of_root directly
>       soc: renesas: don't access of_root directly
>       soc: sunxi: mbus: don't access of_root directly

For all but patch 8,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

