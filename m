Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D98105F781
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5QnXfVQ0hqJvfUwJ7gOEOH7kwY3Eu5ATH2Q/qu+Ugo=; b=3rAammwjpphIXe03Ct/x72f/Lt
	aCWvWZ1IL4E09KIGaQHzvufPB1RcCo6Dn6NGSALYNIjeKwAXkTsf2y+I2mPJkYxnb/ZgJDxYHsxyq
	uDz9svNNvSw1f9KQcqMvPyjv01ClMaHwfqQRUAp8GQVJg5LvkbR0g0vUgQyQA85vKYTP0PKRXh0Xy
	QLwv7aJguWvDILK4dPrY/KjH08RjEsBceYSgyMmxywjJ3zE06TvRSaAN1XF4wu7iiKdVNtOhPge/q
	HUT4F+ltdNMDme2X4SixwktY8nVrwrGaYuRh1H1GvNnUAWiGSf/8vCVltCcah08pwjTRszL9VuDlu
	ZG7J+3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yjW-0000000HNJx-3aqr;
	Fri, 13 Mar 2026 09:23:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yjU-0000000HNJA-1HuM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:23:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38F8D4347E;
	Fri, 13 Mar 2026 09:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B8DC19421;
	Fri, 13 Mar 2026 09:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773393779;
	bh=OSkNcbUS9YGvPKDa8n1+2Deyv3usv6l4sfKN/25R4mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KP5AFQsVD2fnagL9ktzranuODnZj5yec3IGDn8dCtYe3/snhvHtHl4hCuJDk5mIFX
	 XTi/wT2P5RBqBcwVVK9nopqfH93px8aj7zV3cxTXaMox5XwwKQhJr6ATgMV4ahilsI
	 wa5hi4eh1jsInBssCel8lPW4fKrsAbdJ0wHbpL84=
Date: Fri, 13 Mar 2026 10:22:48 +0100
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
Message-ID: <2026031332-widen-unpack-1f6f@gregkh>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260224183832.GB3239922-robh@kernel.org>
 <CAMRc=Mft5vc-C8miKVdw6C-qRdYsqfgm-UgLZJOctFwagMF0iA@mail.gmail.com>
 <2026031231-whiff-speculate-805a@gregkh>
 <CAMRc=MdhhEMJn5JTB3wn_ScmV=a0o6fTnaUDSDjOLN5WH5rOFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdhhEMJn5JTB3wn_ScmV=a0o6fTnaUDSDjOLN5WH5rOFQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_022300_644877_BCE9FFC7 
X-CRM114-Status: GOOD (  23.24  )
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

On Fri, Mar 13, 2026 at 01:36:49AM -0700, Bartosz Golaszewski wrote:
> On Thu, 12 Mar 2026 16:18:38 +0100, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> said:
> > On Thu, Feb 26, 2026 at 10:28:26AM +0100, Bartosz Golaszewski wrote:
> >> On Tue, Feb 24, 2026 at 7:38 PM Rob Herring <robh@kernel.org> wrote:
> >> >
> >> > On Mon, Feb 23, 2026 at 02:37:15PM +0100, Bartosz Golaszewski wrote:
> >> > > linux/of.h declares a set of variables providing addresses of certain
> >> > > key OF nodes. The pointers being variables can't profit from stubs
> >> > > provided for when CONFIG_OF is disabled which means that drivers
> >> > > accessing these variables can't profit from CONFIG_COMPILE_TEST=y
> >> > > coverage.
> >> > >
> >> > > There are drivers under drivers/soc/ that access the of_root node. This
> >> > > series introduces new OF helpers for reading the machine compatible and
> >> > > model strings, exports an existing SoC helper that reads the machine
> >> > > string from the root node and finally replaces all direct accesses to
> >> > > of_root with new or already existing helper functions.
> >> > >
> >> > > Merging strategy: first two patches should be either acked by Rob or
> >> > > picked up into an immutable branch based on v7.0-rc1, the rest can go
> >> > > through the SoC tree.
> >> >
> >> > SoC tree is good.
> >> >
> >> > For all but patch 8,
> >> >
> >> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >> >
> >>
> >> FYI Rob also reviewed patch 8 now. Who would pick the patches up? Greg
> >> KH? There does not seem to be a centralized SoC maintainer in
> >> MAINTAINERS?
> >
> > Sure, let me take them now, thanks.
> >
> > greg k-h
> >
> 
> In the meantime Geert sent an alternative to patch 8/9 so this single one can
> be dropped from the series.

Ick, ok, I've now dropped that one commit from the tree.

thanks,

greg k-h

