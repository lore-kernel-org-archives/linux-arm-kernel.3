Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349D6CD040D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=le5Y4bZnYOXFfWpyttP9RqC5Wv5OlgHvktPhqYfo3vM=; b=zv4rhyOVc/qEu4itstw7hFpa+r
	f2EDjiK+y7mNSZ0+KPUzBmhnoMrBxByHry00df4DqZImkfmIQ0rwTvjo46LZ/H/zLcQWbMSm2E6cg
	pJFqkGXP0dxDu35+SgM7PMhstqHjZxDwR1NbrMIzVk3ljEf1ibSUIy6j/eB0VZUPXsYzZN3P3b9XN
	5GoMr/72m7wcnVFu+5YrJ3H5bxAZeerPFamwSvzc8hruzrZRCWctyD5XizOt4aGvVVCNZJn9o3hFc
	twuTrX/cqcgS3HGXOhK5Psfp+mCCxNziALj+xaYEtBaJzVx3YHO79lZXcDvzhAH9fr7l8xLvO3NOR
	Xzblj3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctBx-0000000CAK6-0IrX;
	Mon, 05 Jan 2026 22:36:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctBu-0000000CAJj-0zcN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:36:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9104E405A7;
	Mon,  5 Jan 2026 22:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47434C116D0;
	Mon,  5 Jan 2026 22:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767652605;
	bh=kzkUocZGzbldAqL7H+ZbDJj1W7al0AimC+VuLG+yvHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dmbHwuIs+Jus28fsK5wm0xq/ylwPIKhkr5dyCyT/XQL2ulRMOn63qz9aCdKiEaCov
	 Jd9a57EMPcFXqJhga7Fp0ZIjS73JKd5dOkHRg2dEcMidwoO77HKO1vriP/dsVzHPfA
	 dzPOnbxH4z4WVGzGyN2Nr4qg2ODsudK2C4wa2JDGQ0ENC81eHPfEfU/stMY7zXBjiK
	 hvO+GP6m++TN9SO+Pnmaf14Kg/z0dcI+Z+ggkx97EtvnNELUIPfS8uHdbyyFT1OCs6
	 RzPiRnzPyb2M/xb2uU6ERe6nlnPwbEx5h/c8oyr8ufiJP2RVk6dBGg0wT0ctIQs++l
	 kUKgFhWdsrlYw==
Date: Mon, 5 Jan 2026 16:36:44 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH 01/11] of: Add for_each_compatible_node_scoped() helper
Message-ID: <20260105223644.GA3633916-robh@kernel.org>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-1-24e99c177164@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-1-24e99c177164@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_143646_323283_BD8E9673 
X-CRM114-Status: GOOD (  16.38  )
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

On Mon, Jan 05, 2026 at 02:33:39PM +0100, Krzysztof Kozlowski wrote:
> Just like looping through children and available children, add a scoped
> helper for for_each_compatible_node() so error paths can drop
> of_node_put() leading to simpler code.
> 
> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Prerequisite for all further patches.
> ---
>  .clang-format      | 1 +
>  include/linux/of.h | 7 +++++++
>  2 files changed, 8 insertions(+)

You need to update scripts/dtc/dt-extract-compatibles

> 
> diff --git a/.clang-format b/.clang-format
> index c7060124a47a..1cc151e2adcc 100644
> --- a/.clang-format
> +++ b/.clang-format
> @@ -259,6 +259,7 @@ ForEachMacros:
>    - 'for_each_collection'
>    - 'for_each_comp_order'
>    - 'for_each_compatible_node'
> +  - 'for_each_compatible_node_scoped'
>    - 'for_each_component_dais'
>    - 'for_each_component_dais_safe'
>    - 'for_each_conduit'
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 9bbdcf25a2b4..be6ec4916adf 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -1485,6 +1485,13 @@ static inline int of_property_read_s32(const struct device_node *np,
>  #define for_each_compatible_node(dn, type, compatible) \
>  	for (dn = of_find_compatible_node(NULL, type, compatible); dn; \
>  	     dn = of_find_compatible_node(dn, type, compatible))
> +
> +#define for_each_compatible_node_scoped(dn, type, compatible) \
> +	for (struct device_node *dn __free(device_node) =		\
> +	     of_find_compatible_node(NULL, type, compatible);		\
> +	     dn;							\
> +	     dn = of_find_compatible_node(dn, type, compatible))
> +
>  #define for_each_matching_node(dn, matches) \
>  	for (dn = of_find_matching_node(NULL, matches); dn; \
>  	     dn = of_find_matching_node(dn, matches))
> 
> -- 
> 2.51.0
> 

