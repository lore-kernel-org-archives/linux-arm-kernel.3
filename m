Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEBACD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 14:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6Q8XCy0zXe1xOArUqxZeTNT47K+djAyAvzM5weh5ag=; b=lQqYtxifL2jZy7He+IOVCPhuOR
	f0/v00UmVkVKj78I+Yb67EdhnEIKR5YCtISGSM3oWp70q+/HaOdvLoVCHNGp4h4Mlap2ERIoUklul
	ahnHxl+i/NBTg9SKx34plBWoyVuHEEyq7nZGDDM74t+sksdiZyitNqAgVN5VeqMcQCDvQ33bS3m5s
	hyfQ/TYV38BEVTUicOguOk3ET4QAAdfPpEPR7BqLqtybwhr8NdISFXoO/FN5Be5qaI7RihRRvGxtU
	S2/9yjBRo7koaNDX5wemnk+yDeKwq+KLlQSkZoN4FoSeoK51MWQhFu89DESBY7Pk5GEFriAFpJErY
	f6fOUYtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFeT-00000004Kxl-0iKB;
	Wed, 27 May 2026 14:54:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFeQ-00000004Kwj-3YBY;
	Wed, 27 May 2026 14:54:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 899314344B;
	Wed, 27 May 2026 14:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304871F000E9;
	Wed, 27 May 2026 14:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779893670;
	bh=E6Q8XCy0zXe1xOArUqxZeTNT47K+djAyAvzM5weh5ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HsfaJKEqK2zij9eVrAg/H0mCdwW7f+jPa6VPlEi/OgY18/ICbhaP0TvYh02P8723q
	 d05/6fhwusJiiPJCqgehDfzasMA+Enbu3dco5olHjA4LRWS0ScqZg6ScRCEOg6NfSX
	 wlkVeTSJTa6r40HbORDCamwiQ3gsl3jYZvDbcmQCXGETQosWLBuASMMaEvuVjRTWZR
	 K9syJsgAM43De46p3pd5dp4mgwVBVihbXgRbLDFLuc4PtLOFmk6MuouWeBcjK2A8V+
	 /QNs9aec1herrWcN95kTc3CezqNwxaCA/ZvmxtZF7NrGEv2brgIxuqmW6Hzttnlm2A
	 VLP/U1zlNDH7Q==
Date: Wed, 27 May 2026 15:54:23 +0100
From: Lee Jones <lee@kernel.org>
To: linux-kernel-dev@aliel.fr
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v6 3/8] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
Message-ID: <20260527145423.GC671544@google.com>
References: <20260516-add-mcu-fan-khadas-vim4-v6-0-cccc9b61f465@aliel.fr>
 <20260516-add-mcu-fan-khadas-vim4-v6-3-cccc9b61f465@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516-add-mcu-fan-khadas-vim4-v6-3-cccc9b61f465@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_075430_940262_BE3BAB51 
X-CRM114-Status: GOOD (  20.53  )
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

On Sat, 16 May 2026, Ronald Claveau via B4 Relay wrote:

> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Introduce a per-variant configuration structure (khadas_mcu_data)
> holding the regmap config and MFD cells,
> selected at probe time via the of_device_id match data.
> This makes adding other variants straightforward.
> 
> Add an enum khadas_mcu_type used as value to match.
> 
> Also introduce khadas_mcu_fan_pdata to pass fan register address and
> maximum level to the fan sub-driver, removing the hardcoded constants.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  include/linux/mfd/khadas-mcu.h | 44 ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
> index a99ba2ed0e4e0..88de49b78f5e6 100644
> --- a/include/linux/mfd/khadas-mcu.h
> +++ b/include/linux/mfd/khadas-mcu.h
> @@ -70,6 +70,13 @@
>  #define KHADAS_MCU_WOL_INIT_START_REG		0x87 /* WO */
>  #define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG	0x88 /* WO */
>  
> +/* VIM4 specific registers */
> +#define KHADAS_MCU_VIM4_REST_CONF_REG		0x2c /* WO - reset EEPROM */
> +#define KHADAS_MCU_VIM4_LED_ON_RAM_REG		0x89 /* WO - LED volatile */
> +#define KHADAS_MCU_VIM4_FAN_CTRL_REG		0x8a /* WO */
> +#define KHADAS_MCU_VIM4_WDT_EN_REG		0x8b /* WO */
> +#define KHADAS_MCU_VIM4_SYS_RST_REG		0x91 /* WO */
> +
>  enum {
>  	KHADAS_BOARD_VIM1 = 0x1,
>  	KHADAS_BOARD_VIM2,
> @@ -82,10 +89,43 @@ enum {
>   * struct khadas_mcu - Khadas MCU structure
>   * @device:		device reference used for logs
>   * @regmap:		register map
> + * @data:		pointer to variant-specific config
>   */
>  struct khadas_mcu {
> -	struct device *dev;
> -	struct regmap *regmap;
> +	struct device			*dev;
> +	struct regmap			*regmap;
> +	const struct khadas_mcu_data	*data;
> +};
> +
> +/**
> + * struct khadas_mcu_data - per-variant configuration
> + * @regmap_config:	regmap configuration
> + * @cells:		MFD sub-devices
> + * @ncells:		number of sub-devices
> + * @fan_cells:		MFD fan sub-devices
> + * @nfan_cells:		number of fan sub-devices
> + */
> +struct khadas_mcu_data {
> +	const struct regmap_config	*regmap_config;
> +	const struct mfd_cell		*cells;
> +	int				ncells;
> +	const struct mfd_cell		*fan_cells;
> +	int				nfan_cells;
> +};

My alarm bells started ringing as soon as I saw this!

> +/**
> + * struct khadas_mcu_fan_pdata - fan sub-driver configuration
> + * @fan_reg: register address to write the fan level
> + * @max_level: maximum fan level
> + */
> +struct khadas_mcu_fan_pdata {
> +	unsigned int fan_reg;
> +	unsigned int max_level;
> +};
> +
> +enum khadas_mcu_type {
> +	KHADAS_MCU_GENERIC, /* VIM1/2/3, Edge, Edge-V */
> +	KHADAS_MCU_VIM4,
>  };
>  
>  #endif /* MFD_KHADAS_MCU_H */
> 
> -- 
> 2.49.0
> 
> 

-- 
Lee Jones

