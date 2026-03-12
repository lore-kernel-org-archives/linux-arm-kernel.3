Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038251067045
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRkr9tlQtutDgkuphlYmn7fRBgJ/GwVX/ag0J9/X/gI=; b=tYkg1Cc5/6HSTvBC0tnJFyRsDk
	+71TW9E9cxRuOxY7QUpJxiA2tJHPCJu8yxr2KT59c+fPxXQ7zE5tUNgVwOj8dfaXEpEs60jj9OpGr
	9sUn5wNdABAQFqkxfOWKslA8b3De3GEpcccL4XaKtVDqfyfkYaLnOEzuEJJBm42GHXvQC0UKKE3Ky
	9wMi8F1QmWMF6cyy+waH2U+pn2fg2JFGtgDUK95TBxdMmY/WaNJChKIv+kbzlVDqBA2+6dbixfVq3
	IATMOWie93j2QjE0t5xuTxV74m3NTHNEXGv75/7QKmYuY0jBfTgMYyf/sSV74vOULPO2jhcOmY7cU
	PrtABq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hoD-0000000ELxG-1mXj;
	Thu, 12 Mar 2026 15:18:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hoC-0000000ELwP-0jLx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:18:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4452960142;
	Thu, 12 Mar 2026 15:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24701C4CEF7;
	Thu, 12 Mar 2026 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773328722;
	bh=RU7mCgn4p4aFt4z17AtB/HzQEKVXpAiuBbfZS5Sysa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1k65cmJmmo+ZdpjbsNZv8nsCPVPi61VKALCKXZeOdH3/KVdSz+l5mdTs2j4pTFLz
	 TjGA79gCGU23W5C90XwC6e0xdRba2zTRj0weRhQoxKvJs12V/HeNxVa41VKe9AjWPv
	 fXDGMebsWeyd/6rYWviq9pQAuQImG1jFn3xPJpkk=
Date: Thu, 12 Mar 2026 16:18:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Saravana Kannan <saravanak@kernel.org>,
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
Message-ID: <2026031231-whiff-speculate-805a@gregkh>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260224183832.GB3239922-robh@kernel.org>
 <CAMRc=Mft5vc-C8miKVdw6C-qRdYsqfgm-UgLZJOctFwagMF0iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mft5vc-C8miKVdw6C-qRdYsqfgm-UgLZJOctFwagMF0iA@mail.gmail.com>
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

On Thu, Feb 26, 2026 at 10:28:26AM +0100, Bartosz Golaszewski wrote:
> On Tue, Feb 24, 2026 at 7:38 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Feb 23, 2026 at 02:37:15PM +0100, Bartosz Golaszewski wrote:
> > > linux/of.h declares a set of variables providing addresses of certain
> > > key OF nodes. The pointers being variables can't profit from stubs
> > > provided for when CONFIG_OF is disabled which means that drivers
> > > accessing these variables can't profit from CONFIG_COMPILE_TEST=y
> > > coverage.
> > >
> > > There are drivers under drivers/soc/ that access the of_root node. This
> > > series introduces new OF helpers for reading the machine compatible and
> > > model strings, exports an existing SoC helper that reads the machine
> > > string from the root node and finally replaces all direct accesses to
> > > of_root with new or already existing helper functions.
> > >
> > > Merging strategy: first two patches should be either acked by Rob or
> > > picked up into an immutable branch based on v7.0-rc1, the rest can go
> > > through the SoC tree.
> >
> > SoC tree is good.
> >
> > For all but patch 8,
> >
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >
> 
> FYI Rob also reviewed patch 8 now. Who would pick the patches up? Greg
> KH? There does not seem to be a centralized SoC maintainer in
> MAINTAINERS?

Sure, let me take them now, thanks.

greg k-h

