Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E25C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 17:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nH9xtVPzbPWocfOAVQI1VzHO7nyVTdC36kSsc9UTgzg=; b=zHmk2mChx5h+TT9GlAg6gYxJe9
	6VCF9Qtxz3JnzR8ENsuv3l8EZVb3rgkHszJbvuoXj/d3nikLdeeBlvfD9Y5vldsFQUJVgikJ9ZlZR
	frYjv0E+qU3dHHmhwoOFZFC609FpX07PLmIOfoesni192VOyGcKFRRnQsRjVuuCuILVV+5H+gkokp
	igyPH/xtWUFWO3+/4a/tELc21dvq6axUXJAevvq5VIxBqSziy1T/eYAGlb/EqYvBIo/+e8dhMr8FI
	J6CeWMm1iheWsMNwtXBdOtBDzK1kjkM9FH63bVP56Rp28tL5H5FYww3+URTaN+B3XWmkZ2rcztEVg
	XYW4yW/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdWp4-0000000CfMz-1Hli;
	Sat, 27 Jun 2026 17:28:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdWp2-0000000CfMr-2UrX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 17:28:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DDC2843BBF;
	Sat, 27 Jun 2026 17:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC2B1F000E9;
	Sat, 27 Jun 2026 17:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782581283;
	bh=nH9xtVPzbPWocfOAVQI1VzHO7nyVTdC36kSsc9UTgzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xn9DlXaG3KC9wdc99i+Ulwez0X/m1yy5C/uOxFiGfNqxy41v8TKKh5zKWRcSxVvW0
	 Ou7BlXKIvzKdvg3hc/Zqx/N4Fnoqfm87Pfaa0DJpzyoDJQvG22p5ZpZdeHx4rNiLgh
	 /qLeQn9iOUdH8/k7AwWwMMuB5Iydro53kKGXn7DM=
Date: Sat, 27 Jun 2026 18:26:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: WenTao Liang <vulab@iscas.ac.cn>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, alim.akhtar@samsung.com,
	bmasney@redhat.com, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] fix: clk/samsung: exynos_clkout_probe: success path
 leaks parent clock   references from of_clk_get_by_name
Message-ID: <2026062704-detail-machine-270f@gregkh>
References: <20260626120135.34173-1-vulab@iscas.ac.cn>
 <2026062612-twiddling-lagged-62ac@gregkh>
 <10D15C29-89E4-4A0B-BB89-F03A86963DDA@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10D15C29-89E4-4A0B-BB89-F03A86963DDA@iscas.ac.cn>
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

On Sat, Jun 27, 2026 at 07:42:36PM +0800, WenTao Liang wrote:
> 
> 
> > 2026年6月26日 22:24，Greg KH <gregkh@linuxfoundation.org> 写道：
> > 
> > On Fri, Jun 26, 2026 at 08:01:35PM +0800, WenTao Liang wrote:
> >> of_clk_get_by_name() acquires clock references stored in the local
> >>  parents[] array. All error paths correctly release these via the clks_put
> >>  label, but the success path returns 0 without releasing the parent
> >>  references. The references were only needed to obtain clock names for
> >>  registration and are permanently leaked after probe completes.
> >> 
> >> Cc: stable@vger.kernel.org
> >> Fixes: 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to module driver")
> >> Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
> >> ---
> >> drivers/clk/samsung/clk-exynos-clkout.c | 4 ++++
> >> 1 file changed, 4 insertions(+)
> > 
> > For all of these, you are not using the normal kernel style, which means
> > a LLM is generating them, which implies that you did not properly
> > document what tool found/fixed all of these.  So please go back and fix
> > them all up and resend them properly, after telling the
> > maintainers/developers that the originals should be ignored.
> > 
> > thanks,
> > 
> > greg k-h
> 
> 
> 
> Thank you for the review and guidance. I understand the issues now.
> 
> I will:
> 1. Study the proper kernel coding style
> 2. If using any automated tools, document them properly in the commit
>    message
> 3. Fix all the patches following the correct style
> 4. Send a v2 series with proper version history
> 5. Inform all maintainers that the original patches should be ignored

Do this right now please!

> I apologize for the inconvenience and will ensure future submissions
> follow all kernel submission guidelines properly.

Also try learning this by doing just a few patches first, not hundreds,
otherwise you run the risk of being outright banned from development.

good luck!

greg k-h

