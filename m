Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EA9D43370
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 15:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=+o4W6IMLJgaY+el2sKxOFQ2dm7nKe2MQSvoVCojXt3c=; b=eJClqiP6KYzov7
	RtZ2TceGtRGamM1JvsPX2irc8SzpQfAWO6tyYXzEOoh2sVKfWlgh5kmaLKqk9Ej4zjdO8UY3PtonU
	v4dmzF2wzuf7McqRliaFfkiCWIvjii7pSAfsMJi8XaqELKMTzcuCZWYoQD2Q2IU9gLaimfYZvBWIL
	VRgZS9SmU8dNzf5jNfaIoPF+dYlRVmWZV95WPiw/X6u3hH7CIEG8DjlLVdV1Pk0sDmSdmMs7SCZG0
	nIC15dqjkCE8zofMsZDelGnMknEgt+TQj40qz6u79QZIQcKB5POf6ImCaj+C+xaoCPrci6HhjWIIn
	uGs4xUM2E1LgGqGdqRaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94VI-00000007SIo-3uJ1;
	Thu, 07 Nov 2024 15:33:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94Pd-00000007RQP-0BoT;
	Thu, 07 Nov 2024 15:27:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAFEB5C4C54;
	Thu,  7 Nov 2024 15:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE479C4CECC;
	Thu,  7 Nov 2024 15:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730993228;
	bh=dXituCL6gut0fSFPiXLwjg5t14g6zYP1Ea17MJMPgz4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=S6ufIbl/aTbis6ExmtWtZVMDUBioE4lSpL6WbJuTOaYbUyel0lIwRHhzHK+1UNv3L
	 Yifn3xFWnNahmjrVpeboMBpfkOSxMLpVY7uLWnvPdkm7vcVuP4mbFuL9o4Th/gKVth
	 fn4Xi+LwYky+wQPaLhbx6WzNJC4Iu5/yGWxJTvCdsnBS8pWEjR0UADUhM4ONDCtewM
	 yQ7QA7QE78xdMb1uaQIqG1X55kHNlJrrlkixTgRbvb0rRWk4uIGbyj+Url35VYjENi
	 efIheSQVwoDwwsND0x3GWvESf0eL1hnYjPit/K6tVqU2Bz3SK93zmbT/rtuMu2x4T4
	 SSzN7tpQk0tJQ==
Date: Thu, 7 Nov 2024 09:27:05 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
Message-ID: <20241107152705.GA1614612@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-pcie-en7581-fixes-v1-3-af0c872323c7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_072709_194490_BD898B78 
X-CRM114-Status: GOOD (  21.40  )
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

On Thu, Nov 07, 2024 at 02:50:55PM +0100, Lorenzo Bianconi wrote:
> In order to make the code more readable, move phy and mac reset lines
> assert/de-assert configuration in .power_up callback
> (mtk_pcie_en7581_power_up/mtk_pcie_power_up).
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 8c8c733a145634cdbfefd339f4a692f25a6e24de..c0127d0fb4f059b9f9e816360130e183e8f0e990 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -867,6 +867,13 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	int err;
>  	u32 val;
>  
> +	/*
> +	 * The controller may have been left out of reset by the bootloader
> +	 * so make sure that we get a clean start by asserting resets here.
> +	 */
> +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> +				  pcie->phy_resets);
> +	reset_control_assert(pcie->mac_reset);

Add blank line here.

>  	/*
>  	 * Wait for the time needed to complete the bulk assert in
>  	 * mtk_pcie_setup for EN7581 SoC.
> @@ -941,6 +948,15 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
>  	struct device *dev = pcie->dev;
>  	int err;
>  
> +	/*
> +	 * The controller may have been left out of reset by the bootloader
> +	 * so make sure that we get a clean start by asserting resets here.
> +	 */
> +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> +				  pcie->phy_resets);
> +	reset_control_assert(pcie->mac_reset);
> +	usleep_range(10, 20);

Unrelated to this patch, but since you're moving it, do you know what
this delay is for?  Can we add a #define and a spec citation for it?

Is there a requirement that the PHY and MAC reset ordering be
different for EN7581 vs other chips?

EN7581:

  assert PHY reset
  assert MAC reset
  power on PHY
  deassert PHY reset
  deassert MAC reset

others:

  assert PHY reset
  assert MAC reset
  deassert PHY reset
  power on PHY
  deassert MAC reset

Is there one order that would work for both?

>  	/* PHY power on and enable pipe clock */
>  	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
>  	if (err) {
> @@ -1013,14 +1029,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>  	 * counter since the bulk is shared.
>  	 */
>  	reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> -	/*
> -	 * The controller may have been left out of reset by the bootloader
> -	 * so make sure that we get a clean start by asserting resets here.
> -	 */
> -	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> -
> -	reset_control_assert(pcie->mac_reset);
> -	usleep_range(10, 20);
>  
>  	/* Don't touch the hardware registers before power up */
>  	err = pcie->soc->power_up(pcie);
> 
> -- 
> 2.47.0
> 

