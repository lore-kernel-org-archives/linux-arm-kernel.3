Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D28C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 11:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvI+PEAIkMEzihNF/k07q+gyDD2/Ha+4mpWiLxj1I1A=; b=uNfNcRKRyLVHuZVdzLbBbr82f+
	fbxupY+lKmTzWs8nyyJJpoU/4jyKhi9ocrCYYQCNv1XGqUOT5UHYpnjOny/qF6WZ1njaXeXbYyhxX
	yoemDfS6PWsj4hdTl/NZNgF6Iy/1Bs0XSydcIheb1c7WoxcJzIEgXOFMoNgYBCv46GM0mRllXJiOF
	U7jwhA4nVUa9LXsL968cJDnfXja3OYGzyy1J3mHkySe9vBJ5K6MPqo8OIpKIcxfUBuC2vWNYNWSOf
	z3tUQwBIuSGA5pzsnn1A8TM9s0EsGIGWGKUd8TDMSM12E4qubnC7owNmMiYn/BzOpGTWVItCiBQBb
	g/VUr2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYrJ-00000004q3I-0AoW;
	Tue, 01 Jul 2025 11:09:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYkO-00000004ovC-0rcu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:01:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B23BA51C6A;
	Tue,  1 Jul 2025 11:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B1EC4CEEE;
	Tue,  1 Jul 2025 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751367715;
	bh=x+/jfhbvrQZRQ7RfI+BdPxv9r5V+E7gboa1JLBgD3lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqm81N8lvDX7N/u3xjG7hXMTvGqO54jyHyE2S26wmNaQflgz/pCQwdOLBaUoGESOT
	 UDXcnu+0St+FBVUhbE1ZXYHxCq1/aaIDgs25i4S+Nc3HZmf5pEw4B6Wlce9mnI6v5d
	 PHyKnIjNkUQ5a7JeexhNEKCoCAqOTReLXzznchKJsbh0ArjuB6dDOeklRvElOW7AFX
	 galPphzb0O/qlHWhDUhq0t4Wjf6tkO23p2hh+XiRWqq2tDgHMkURWqVv9jU4GPAXV9
	 JsMhrCDq9SWqebzlQ0d1d2As2JL+n19bD8ySqDEg8+KiH8KsqIkmfFm1TMKyCdw7m1
	 ifQtrqKbZYV6A==
Date: Tue, 1 Jul 2025 12:01:50 +0100
From: Lee Jones <lee@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH] mfd: axp20x: Skip PEK on AXP313A/AXP323 if no interrupt
 line is available
Message-ID: <20250701110150.GJ10134@google.com>
References: <20250630135249.3961621-1-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630135249.3961621-1-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_040156_374697_962D1343 
X-CRM114-Status: GOOD (  24.65  )
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

On Mon, 30 Jun 2025, Chen-Yu Tsai wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> Originally an explicit ID for the AXP313/AXP323 regulator was set to
> avoid a conflict with the primary AXP717 PMIC on Allwinner A523 family
> boards.
> 
> This didn't entirely work since on some or all of these boards, the
> interrupt line on this secondary PMIC was left unconnected, and thus
> the driver would fall back to the generic "no interrupt; only regulators"
> case, which didn't have the explicit ID set, thus undoing the intended
> fix.
> 
> Explicitly exclude the PEK cell in the no IRQ case for the
> AXP313/AXP323, instead of using the generic fallback.
> 
> Fixes: 249abf9b1e25 ("mfd: axp20x: Set explicit ID for AXP313 regulator")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> The other option would be to move the explicit ID to the generic
> fallback case instead. This is really only visible in sysfs and the
> kernel logs, so probably not that important.
> ---
>  drivers/mfd/axp20x.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 25c639b348cd..8877482a95a1 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -1055,6 +1055,7 @@ static const struct mfd_cell axp152_cells[] = {
>  static struct mfd_cell axp313a_cells[] = {
>  	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
>  	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
> +	/* Keep PEK as last entry for exclusion in no-irq cases */
>  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>  };
>  
> @@ -1306,12 +1307,18 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  		axp20x->irq_flags = IRQF_TRIGGER_LOW;
>  		break;
>  	case AXP313A_ID:
> +		/* Exclude PEK if no IRQ is available */
> +		nr_cells_no_irq = ARRAY_SIZE(axp313a_cells) - 1;

This is too fragile.  Please fine another way to achieve your goal.

> +		cells_no_irq = axp313a_cells;
>  		axp20x->nr_cells = ARRAY_SIZE(axp313a_cells);
>  		axp20x->cells = axp313a_cells;
>  		axp20x->regmap_cfg = &axp313a_regmap_config;
>  		axp20x->regmap_irq_chip = &axp313a_regmap_irq_chip;
>  		break;
>  	case AXP323_ID:
> +		/* Exclude PEK if no IRQ is available */
> +		nr_cells_no_irq = ARRAY_SIZE(axp313a_cells) - 1;
> +		cells_no_irq = axp313a_cells;
>  		axp20x->nr_cells = ARRAY_SIZE(axp313a_cells);
>  		axp20x->cells = axp313a_cells;
>  		axp20x->regmap_cfg = &axp323_regmap_config;
> -- 
> 2.39.5
> 

-- 
Lee Jones [李琼斯]

