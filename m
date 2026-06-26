Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7894AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 14:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mq5eB87xLrwNqO+AmRAx98AdQSUns2cVe/ldlPXsX14=; b=w54ea0JoP+osw3HM8Uh0PCP2ir
	zVmEf0Ck0zVbI5MRAdUSvfjr52Yo01/deUXkCbPLLcTjxWmX/55HtxWgIMX7weleiKvPLn5r+oFPJ
	BYfYu4941Di/RIGflVp7cTWqTkXUUsB7W8RyRnUOb1uLRwDF/QxrQswSERA1rgCx+t0EZzKOOQ4ET
	S1duhSyD7LqC+WnNXesDy0kPex5BrstQJJo7K0ooUYghnK3QiJQvPsh/q0D9w0Zbd1SmtvLkfXNmN
	uVt2icO4y6r2LLbJurGKucV00TTKTJA3eZC4QHISfOySAZJJkNxkPLPKIZX4k/D59QxbPPRc5oyOg
	Cxshjfpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7Uj-0000000BSER-0Oqs;
	Fri, 26 Jun 2026 14:25:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7Uh-0000000BSEK-3y5i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 14:25:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 09D6A600C8;
	Fri, 26 Jun 2026 14:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441BD1F000E9;
	Fri, 26 Jun 2026 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782483922;
	bh=Mq5eB87xLrwNqO+AmRAx98AdQSUns2cVe/ldlPXsX14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SlhftcQoyt+CCvsFrPLqCbzrYbKhix2b1KAVgU9jE1ER84hpdJ5RoaGVryqSJBFqK
	 tlCi2DM/GtanGUCMkLwnL7TXrNNQtXobMg1AspzsQZtDl48fwaKFabEaac4blBeM+0
	 nibbMs0foCEmhcjqrKp0o117YZG0XpYNydueh2Ng=
Date: Fri, 26 Jun 2026 15:24:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: WenTao Liang <vulab@iscas.ac.cn>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, alim.akhtar@samsung.com,
	bmasney@redhat.com, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] fix: clk/samsung: exynos_clkout_probe: success path
 leaks parent clock   references from of_clk_get_by_name
Message-ID: <2026062612-twiddling-lagged-62ac@gregkh>
References: <20260626120135.34173-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626120135.34173-1-vulab@iscas.ac.cn>
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

On Fri, Jun 26, 2026 at 08:01:35PM +0800, WenTao Liang wrote:
> of_clk_get_by_name() acquires clock references stored in the local
>   parents[] array. All error paths correctly release these via the clks_put
>   label, but the success path returns 0 without releasing the parent
>   references. The references were only needed to obtain clock names for
>   registration and are permanently leaked after probe completes.
> 
> Cc: stable@vger.kernel.org
> Fixes: 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to module driver")
> Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/clk/samsung/clk-exynos-clkout.c | 4 ++++
>  1 file changed, 4 insertions(+)

For all of these, you are not using the normal kernel style, which means
a LLM is generating them, which implies that you did not properly
document what tool found/fixed all of these.  So please go back and fix
them all up and resend them properly, after telling the
maintainers/developers that the originals should be ignored.

thanks,

greg k-h

