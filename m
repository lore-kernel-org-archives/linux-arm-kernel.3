Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C22CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 19:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXkPmDAB+hNg2HpZM4mIifRvfZ/paT0iAIl5o6P1I5U=; b=ZEECw8Y9T9okPmUwLLXdhtBn5M
	kl/9SW0jJ6KLmpmWOBdj+J8lPIV6Kfx+0LhB2ArdTTqzzuY7OaaMrzzfHN2xdVkqUsAv83JhVYC/P
	SznjKI+Pzw8cL7GVfsgo4yNmP38ic5hmtlm6FIsFfVEZ05Nyv5+7+hkADk+/VYks8ei8RgeVG6ppj
	UQOvGxuNd+bF0ZsxbkNAEOHpO09Uro9kykxBWLdP4eJxlqEnWg6JQgV0NlLT8Rs9J9BtFmTaQLtPj
	n2pkAlqApsolq2jx9zaqoXv5f/CMvSVqEk6U/6kUhKpmmTrbHosufL+pCSt9LJwRCRmwODL4MY1Ky
	T2v5VM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPnBx-00000002WAi-0mRH;
	Sun, 30 Nov 2025 19:34:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPnBv-00000002WAN-1PF3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Nov 2025 19:34:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55D65437CC;
	Sun, 30 Nov 2025 19:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B7EC4CEF8;
	Sun, 30 Nov 2025 19:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764531276;
	bh=fDk5Jal1lnccSK3N9WMpugaH0WztpLXYnlHQgtFU4zA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hW8SipWAFM+89QshRWlSDcseWRuvJj+jQZUbCa2B18aMOhrANvfUOVuLIpF/EFj0r
	 O4IiNK3mEMvA2d96o51OZMKjcJuM7VNhjDdarUmiBzCaL7dUF00/eDTzBhAciTy3SF
	 HSlc32F59LlvSxNfTdJHZIVv9i6hKv4jHmx13TH8Xz5DHAatiQoqebZ2GJId17yVCW
	 LuUhfthJfOxTSVvT0phgm9L8iWO4IWgLIxdewQwf+l/Ycrk+lB7xfWvhfidGtY5KB3
	 wX3gn2+p9nZzJuwP7yzpmiMnHfX5DvK9/hc9RkGGfDG5t5+q7y1CfG6mA4oY8i3wdM
	 y/mOQoMtaC8xA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251124-exynos-clkout-fix-ubsan-bounds-error-v1-1-224a5282514b@kernel.org>
References: <20251124-exynos-clkout-fix-ubsan-bounds-error-v1-1-224a5282514b@kernel.org>
Subject: Re: [PATCH] clk: samsung: exynos-clkout: Assign .num before accessing .hws
From: Stephen Boyd <sboyd@kernel.org>
Cc: Salvatore Bonaccorso <carnil@debian.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, stable@vger.kernel.org, Jochen Sprickerhof <jochen@sprickerhof.de>, Nathan Chancellor <nathan@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Gustavo A. R. Silva <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Sun, 30 Nov 2025 11:34:33 -0800
Message-ID: <176453127378.11952.4906451561257794028@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_113439_397129_CFD2B6BE 
X-CRM114-Status: GOOD (  12.17  )
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

Quoting Nathan Chancellor (2025-11-24 11:11:06)
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
>=20
>   UBSAN: array-index-out-of-bounds in drivers/clk/samsung/clk-exynos-clko=
ut.c:178:18
>   index 0 is out of range for type 'clk_hw *[*]'
>=20
> Move the .num initialization to before the first access of .hws[],
> clearing up the warning.
>=20
> Cc: stable@vger.kernel.org
> Fixes: f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with __cou=
nted_by")
> Reported-by: Jochen Sprickerhof <jochen@sprickerhof.de>
> Closes: https://lore.kernel.org/aSIYDN5eyKFKoXKL@eldamar.lan/
> Tested-by: Jochen Sprickerhof <jochen@sprickerhof.de>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

Applied to clk-next

