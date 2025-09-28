Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943C9CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 04:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNu+0SYd6CtjwR014NYQwAo7JBQF+t/CC9wppPlsRa4=; b=oe9BEE2rS34Rva8hmBj1gkdxq1
	TikM7M6pJOwEPLf6W9KnTyeH0k0EzlUDEJj6D5uufnb0EFVQddqroJkVztnAU0uWyxaxx1ahjrXCO
	UFt0sfKTBv8YWP2Z9iRDuMplLqm22zhnNX4iOiTSP/a+DNO/TWnnm4d+jRbGEhO+4QqCmCs7J2C1c
	eDvYARo4NIeWsc4CiQ0PZxaIwYgOGeGDLkRJFkWNFpO55hlkXR09lYZYNwmB5gdf5r+a0g+fEOxPk
	RF664kRvAsN+zrvjueH0Mwint3A4M3OfKFjmby1w2UIKo7JfOPWN9RXz0AiZIiUyDTUM9ACglQGvN
	4BPdzy2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2jAv-0000000DuDe-2L5X;
	Sun, 28 Sep 2025 04:38:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2jAt-0000000DuDW-2jN8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 04:38:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8DBD6026A
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 04:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4ABC16AAE
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 04:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759034294;
	bh=yPUCQARO/E1b/PpKhkuynrSeBmbzRpj/2AlmBYWvBEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uwvKqMGTr7gvSwWcF7i0B3Gyiq5dOWXVEHss0z7q9tzNvJaiQxw4QAWxZhtYtQpr/
	 k3yBIbcuyc/zNYe83bgBx/qFKixs7X9raANbbB5WjgdKFSfYdlkOl9MnJIoWRjOfRA
	 FTluEPI3nC4nYQGhO6XW0O6S2pqAqcH4b0HdCXqS2LwmanyGYdQLcke7FpmQtxBsDE
	 r1qsBXPYBmCeY1TMREmAmoTc1nD8FbY7d5dzfrr7ZgM0TncP/A8+XzVhxuekf02VLl
	 FSqRi0y82hfn2SZ41dqt38VVwjVZlAYOS0sPjBiE3KuLsrJMLlGj6WDJh3RhW2AXTg
	 LNgaPLPVOd+LQ==
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-28832ad6f64so619085ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 21:38:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOLsvckzqAa2xJ3n6ZTrzrsJwm8Q+nVwsFgCBGu9zVXA2L9JwXzFe1llVpl5sHCviiBe09gUK/moST13g7i1RI@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi3opazXYB8w0AkI8XQbjpBrjYIZLSpNbpo1BFA3a/MK6K6T+Q
	rJ6vdfyMTndoaKJBZK+GG0PM1Qy5I8CBPWzd/Q+5/bpUchCrAh7TmR/37+eIEqewJIj7sYQm301
	7VTONfTlirKM/LLGUfv44nl/QUB4VLRw=
X-Google-Smtp-Source: AGHT+IFovBFKctggukgqFj3XIJcZWk9fg1TefA/Wwh6SK14YTc4CRxw9XITK+mpUG2jv5RfWSvlF4YsBkFYpkeUNa/0=
X-Received: by 2002:a17:902:f64f:b0:273:7d52:e510 with SMTP id
 d9443c01a7336-27ed4ab37admr146753645ad.58.1759034293913; Sat, 27 Sep 2025
 21:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250928035108.10432-1-make24@iscas.ac.cn>
In-Reply-To: <20250928035108.10432-1-make24@iscas.ac.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 28 Sep 2025 13:38:02 +0900
X-Gmail-Original-Message-ID: <CAJKOXPcNnzTw7_bE4J8G91n=+fz==xAg4D6GXzRqJKhZhpAw4g@mail.gmail.com>
X-Gm-Features: AS18NWD0KSDsFXZFUEVjn0bzNBGXma2W0otpCGVfLYk-XWgTFtTO54OEwfjhbIA
Message-ID: <CAJKOXPcNnzTw7_bE4J8G91n=+fz==xAg4D6GXzRqJKhZhpAw4g@mail.gmail.com>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: fix reference leak in exynos_get_pmu_regmap_by_phandle()
To: Ma Ke <make24@iscas.ac.cn>
Cc: alim.akhtar@samsung.com, semen.protsenko@linaro.org, 
	peter.griffin@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 28 Sept 2025 at 12:51, Ma Ke <make24@iscas.ac.cn> wrote:
>
> In exynos_get_pmu_regmap_by_phandle(), driver_find_device_by_of_node()
> utilizes driver_find_device_by_fwnode() which internally calls
> driver_find_device() to locate the matching device.
> driver_find_device() increments the reference count of the found
> device by calling get_device(), but exynos_get_pmu_regmap_by_phandle()
> fails to call put_device() to decrement the reference count before
> returning. This results in a reference count leak of the device each
> time exynos_get_pmu_regmap_by_phandle() is executed, which may prevent
> the device from being properly released and cause a memory leak.
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: 0b7c6075022c ("soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index a77288f49d24..ed903a2dd416 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -302,6 +302,7 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
>  {
>         struct device_node *pmu_np;
>         struct device *dev;
> +       struct regmap *regmap;
>
>         if (propname)
>                 pmu_np = of_parse_phandle(np, propname, 0);
> @@ -325,7 +326,10 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
>         if (!dev)
>                 return ERR_PTR(-EPROBE_DEFER);
>
> -       return syscon_node_to_regmap(pmu_np);
> +       regmap = syscon_node_to_regmap(pmu_np);
> +       put_device(regmap);

Are you sure this code actually compiles?


> +
> +       return regmap;

So is regmap valid now, if you drop the reference? I think no. I also
think you should check the purpose of this function. I don't see a
leak here, not at callers place. Anyway build failures are my main
concern.

