Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C2ECD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEsgan7+UWvqs7M6W0fM7HOY0ilw8DzM4/jZx/Jt/YM=; b=tQQOtrbsj+CIqJckryxk1Ckdwa
	OGvBFw9VkMAYhD3QyHakdRh3yyKC0h+51qRWsoVNuDsjULUtncXY6PlDwqg8PPRUmmbPHJb7sJJ2r
	yq3HWpJw/yVvnRgrWsA3JtX8xxvVAJ9CgqlFajdxg5cCARcqFQ1FiG/aGACVtkn0XxyIWXXBV9WKx
	OBhclMx7ue3IbdK7qydhOQV1gHkAyo+gkZqINmDsj9av5oiPUQhWlEQ7oS1km1l2JAf8R4vcztvfQ
	sOCb4R+gyosX46MPOXkKzHw2pIh/cEP46cZib0mEcYWQB18zs8q37vBwLlU4RPMT1WQCCZMGOBNMC
	kvPgPCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN66P-00000001xRk-1BOW;
	Wed, 13 May 2026 09:42:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN66M-00000001xRF-3M1o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D58AF406DA;
	Wed, 13 May 2026 09:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D72C2BCC7;
	Wed, 13 May 2026 09:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778665320;
	bh=FRzh2TqI6eV1IGDJSpXe9vTknIKuMbT0qAfdYLMNBU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uS7nBPA/KMSgwEaT99+fPUSNMe2gzrvpw5CRRNfXYU0BSOQ+JsRCWz8iZ82wFvt2n
	 AHaEsHctV/lpMT0x/ErtnPOAlJ0AjVQLt+XpJwLsCA6lW4eg5x+KERjrDSB+8zoTYq
	 UxbXTRzQP9u8VhK08Jr+rdJaGy/HXU7hxykGc6ulxlroFJW717+nB5HtIF2Y2vT8v0
	 pJlXmmogzfNeAOb2Sa4vZqa4wbPfHySRWvepOf3xBapGgntAZi34LzwGmP40+rUKZz
	 xyYf4ouG4TP7s7jk+dIA+9LSommSijSsIClHypoS3JOFiwCD+yhUbsl2UX0JY8axPt
	 2hnQc6GfZB/Vw==
Date: Wed, 13 May 2026 10:41:51 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ge Gordon <gordon.ge@bst.ai>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 01/16] ACPI: GTDT: Parse information related to the EL2
 virtual timer
Message-ID: <20260513-crouching-stirring-pigeon-6e46bf@sudeepholla>
References: <20260507125544.2903406-1-maz@kernel.org>
 <20260507125544.2903406-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507125544.2903406-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_024202_880068_579F31AF 
X-CRM114-Status: GOOD (  24.94  )
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

On Thu, May 07, 2026 at 01:55:29PM +0100, Marc Zyngier wrote:
> Since ARMv8.1, the architecture has grown an EL2-private virtual
> timer. This has been described in ACPI since ACPI v6.3 and revision
> 3 of the GTDT table.
> 
> An aditional structure was added in ACPICA, though in a rather
> bizarre way, and merged in v5.1 as 8f5a14d053100 ("ACPICA: ACPI 6.3:
> add GTDT Revision 3 support").
> 
> Finally plug the table parsing in GTDT, and allow it to be eventually
> presented to the architected timer driver.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/acpi/arm64/gtdt.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
> index ffc867bac2d60..1a58007fccf0a 100644
> --- a/drivers/acpi/arm64/gtdt.c
> +++ b/drivers/acpi/arm64/gtdt.c
> @@ -88,6 +88,19 @@ static int __init map_gt_gsi(u32 interrupt, u32 flags)
>  	return acpi_register_gsi(NULL, interrupt, trigger, polarity);
>  }
>  
> +struct gtdt_v3 {
> +	struct acpi_table_gtdt	gtdt_v2;
> +	struct acpi_gtdt_el2	el2_vtimer;
> +};
> +
> +static struct acpi_gtdt_el2 *gtdt_to_el2_vtimer(struct acpi_table_gtdt *gtdt)
> +{
> +	if (gtdt->header.revision < 3)
> +		return NULL;
> +

We should validate the length as well just in case some platform bumped version
but didn't add these fields. Again it is problem if the platform timers are
also missing. We can just add the check in acpi_gtdt_init() if the version >=3
perhaps? If (gtdt->header.length < sizeof(struct gtdt_v3) invalid table or
something.

Also we have in platform_timer_valid()
	platform_timer >= (void *)(acpi_gtdt_desc.gtdt + 1)
which is still valid, but again if someone messes up in v3 keeping
offset where virtual EL2 timer GSI should be present as they just copied
it from v2, then we might allow it as valid.

Do it make sense to add that check as well in acpi_gtdt_init()? I mean
the offset should be >= sizeof(struct gtdt_v3).

Both checks can be added to acpi_gtdt_init() to avoid checking for each
platform timer instance may be ?

Other than this couple of minor nit, this patch looks fine.

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

