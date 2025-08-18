Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF91CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BiaTVxCVbCETxM2X9njtKCefT47H6gSC2OI3+kcXKs=; b=Ry04dSqx5kyS98zCcIW+BHnRqa
	DRoghIRieIFG3ENVR+nCxRr2CPkhDUtvCrEW937lH9+jBO/mUZDCTVPNAbwi0UZivSRv0VWdKEgr4
	AazCkjpeVa8jo2Q9pC1b2IIKzjvWM5ouY4impjw9Hu1V++uWCIxW2dk4x2Mv+NvAVdPioROa10qZJ
	iab3HoWd8nKbcMARFwE3u67ISxWa1oJGB+l6PKr7hm41CjPx1U336LnWJXo+Kk3sT3T9MkLfryf98
	ZFXo9Zx3kDR9mp7odqU0let0BcWC5/JIO09r5b6DUbh+/0X//7aFtgcEI4S5vohkaWaBKAgXtvVvl
	Eb5n5E2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo06E-00000007Yv8-0PZc;
	Mon, 18 Aug 2025 13:40:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unw40-000000072dJ-2Ndu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:22:02 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9B7B417D1;
	Mon, 18 Aug 2025 11:20:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755508858;
	bh=kqWkwpZeDd3/I+FFiy2R27j1WrvPesd6DRcrbiWwlas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MiNljGcwNxjzMcy1MqNDcTJD1GeWwOnpxjDNCVBmYPbX8wToXu5Dbi+7oatKDBds1
	 pJOX746hIzx1pUtfClWxjOehH97MfSZLhhOpJRpwsem6DIamO9EzhWWPeyaRvEMAOv
	 FMnsDM4Km1i9WLuos2TwoKQxhtibpk3R77xvujxo=
Date: Mon, 18 Aug 2025 12:21:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Inbaraj E <inbaraj.e@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, martink@posteo.de,
	mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com,
	shradha.t@samsung.com, ravi.patel@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 05/12] media: imx-mipi-csis: Move clk to
 mipi_csis_info structure
Message-ID: <20250818092133.GA5862@pendragon.ideasonboard.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141025epcas5p2b226c4eaab5d60d0e95f684e2ef930f2@epcas5p2.samsung.com>
 <20250814140943.22531-6-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250814140943.22531-6-inbaraj.e@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_022200_745671_F86A7BF4 
X-CRM114-Status: GOOD (  20.45  )
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

Hi Inbaraj,

On Thu, Aug 14, 2025 at 07:39:36PM +0530, Inbaraj E wrote:
> clock names in NXP SoC's is different from the FSD SoC. Inorder to

s/clock/Clock/
s/Inorder/In order/

Is the difference really a matter of SoCs, or is it because the FSD SoC
uses a different version of the IP ?

I also suspect that the "phy" clock was added by mistake, and isn't
needed in NXP SoCs. Could you please check and confirm if the v3.3 and
v3.6.3 versions of the IP have an input PHY clock ?

> extend this driver to use for FSD SoC. Move the clock names to
> mipi_csis_info structure.
> 
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 2beb5f43c2c0..4afa75734f05 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -267,6 +267,8 @@ static const struct mipi_csis_event mipi_csis_events[] = {
>  
>  #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
>  
> +#define MIPI_CSIS_MAX_CLOCKS	4
> +
>  enum mipi_csis_clk {
>  	MIPI_CSIS_CLK_PCLK,
>  	MIPI_CSIS_CLK_WRAP,
> @@ -274,13 +276,6 @@ enum mipi_csis_clk {
>  	MIPI_CSIS_CLK_AXI,
>  };
>  
> -static const char * const mipi_csis_clk_id[] = {
> -	"pclk",
> -	"wrap",
> -	"phy",
> -	"axi",
> -};
> -
>  enum mipi_csis_version {
>  	MIPI_CSIS_V3_3,
>  	MIPI_CSIS_V3_6_3,
> @@ -289,6 +284,7 @@ enum mipi_csis_version {
>  struct mipi_csis_info {
>  	enum mipi_csis_version version;
>  	unsigned int num_clocks;
> +	const char *clk_names[MIPI_CSIS_MAX_CLOCKS];
>  };
>  
>  struct mipi_csis_device {
> @@ -697,7 +693,7 @@ static int mipi_csis_clk_get(struct mipi_csis_device *csis)
>  		return -ENOMEM;
>  
>  	for (i = 0; i < csis->info->num_clocks; i++)
> -		csis->clks[i].id = mipi_csis_clk_id[i];
> +		csis->clks[i].id = csis->info->clk_names[i];
>  
>  	ret = devm_clk_bulk_get(csis->dev, csis->info->num_clocks,
>  				csis->clks);
> @@ -1539,12 +1535,14 @@ static const struct of_device_id mipi_csis_of_match[] = {
>  		.data = &(const struct mipi_csis_info){
>  			.version = MIPI_CSIS_V3_3,
>  			.num_clocks = 3,
> +			.clk_names = {"pclk", "wrap", "phy"},
>  		},
>  	}, {
>  		.compatible = "fsl,imx8mm-mipi-csi2",
>  		.data = &(const struct mipi_csis_info){
>  			.version = MIPI_CSIS_V3_6_3,
>  			.num_clocks = 4,
> +			.clk_names = {"pclk", "wrap", "phy", "axi"},
>  		},
>  	},
>  	{ /* sentinel */ },

-- 
Regards,

Laurent Pinchart

