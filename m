Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D255CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 19:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLp/czXwB3dzxPXW4QmHdL7QdkTZq786ExgMICGlxW8=; b=iBH0L5moF6OWYqvkp4U2C2A4iO
	mjMBpwQQ97v3W+eZ7D/TmOjr2alBlcgWNhvBp7DeRW+shjRK8+DZmxKt3xoIrcl1un7GFf0gD/ziL
	pU385MTEt+SI8ImxWqJB1UVf8e7HqGA7wCla63SnlFW7r4XHFZjMIpXOGBmKtKRvDu6pi6kuXF5pF
	7N9KJM7glhRRFdsEAVcT7vs3n7FZhi25HHwpvYAPXRpwzY4igCVue5/1xkFm+OHyFEhgVkZt70wjG
	zS20nDRqCzckx/pNTbHEk+xvXKYe3f9xxD5tlBDcG/8HXzkyRPgJFgyL0rBHm6qtspObrf/x+kOsb
	u8ZGcg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNc1r-0000000CE5m-1F1u;
	Mon, 24 Nov 2025 19:15:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNc1q-0000000CE5R-0HDH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 19:15:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 760E960199;
	Mon, 24 Nov 2025 19:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBBAC4CEF1;
	Mon, 24 Nov 2025 19:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764011713;
	bh=z2i6xOwTgPt675KWrdd6Uyxx4S+UvK5AI+S6QNfhulw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBqozLPmxlmrLmLwoHPmIeJbzBT1W42aAhoz8uVQkL8oDZCTg8kuX8yPWXV3FTG0r
	 PgyoXBXIdHvDdMDXM+AhptN29OVavW+JwDuvM0UpUC3r6pA3GmAEgNIx2Y2iPZvI+A
	 IYPPI1qMf6hZkzpO27NHwDae9GOCtM/sJngfkQ5/zst9jd1br2E3eA7Tuik6uVAUDW
	 LU+yb148QsISx2EaNbL5pHY9cz3kPg436m5CKY5Di2g82F9CuL298oREj0j/Cz382Q
	 roqgZAHpcOufueqJD6uXZbERw14S3G8nVUwMzHYEjRVjECcLZ38vpBqgJlW1MQYQID
	 gCMg5kwMJl2ig==
Date: Mon, 24 Nov 2025 11:15:12 -0800
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Salvatore Bonaccorso <carnil@debian.org>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, stable@vger.kernel.org,
	Jochen Sprickerhof <jochen@sprickerhof.de>
Subject: Re: [PATCH] clk: samsung: exynos-clkout: Assign .num before
 accessing .hws
Message-ID: <202511241115.0E974A2C@keescook>
References: <20251124-exynos-clkout-fix-ubsan-bounds-error-v1-1-224a5282514b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-exynos-clkout-fix-ubsan-bounds-error-v1-1-224a5282514b@kernel.org>
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

On Mon, Nov 24, 2025 at 12:11:06PM -0700, Nathan Chancellor wrote:
> Commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
> __counted_by") annotated the hws member of 'struct clk_hw_onecell_data'
> with __counted_by, which informs the bounds sanitizer (UBSAN_BOUNDS)
> about the number of elements in .hws[], so that it can warn when .hws[]
> is accessed out of bounds. As noted in that change, the __counted_by
> member must be initialized with the number of elements before the first
> array access happens, otherwise there will be a warning from each access
> prior to the initialization because the number of elements is zero. This
> occurs in exynos_clkout_probe() due to .num being assigned after .hws[]
> has been accessed:
> 
>   UBSAN: array-index-out-of-bounds in drivers/clk/samsung/clk-exynos-clkout.c:178:18
>   index 0 is out of range for type 'clk_hw *[*]'
> 
> Move the .num initialization to before the first access of .hws[],
> clearing up the warning.
> 
> Cc: stable@vger.kernel.org
> Fixes: f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with __counted_by")
> Reported-by: Jochen Sprickerhof <jochen@sprickerhof.de>
> Closes: https://lore.kernel.org/aSIYDN5eyKFKoXKL@eldamar.lan/
> Tested-by: Jochen Sprickerhof <jochen@sprickerhof.de>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

