Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067F3D6DDED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 09:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzLXt5Z4Yoq+cL5FZ5kUr3QUZKj6AqTjZlPMJ0a+Ueo=; b=tcgXAoPpu8k94gwqRW1Hd4zh4B
	BN22287C27nR9SRkqme3dBBesjX4ob2y9tPcsLNBNdDY9g6MeGsM7b3495NmYNtL9w8PNLEnIbYjZ
	vYIZon/QTmYLLjZBfMobzEsfx4AiOT7IvQNLLj7ZLVlyeCljy43f2EELJhxA3oAXNhjri57NTtgKn
	7AAuhrwhoaoanOpnx89uA4AkZ+ZjfoVsbBuu7YNLGqXRORGMIVf9K2ggw+83ornX078HCxWYTAv4W
	zT5SX3uO0LYadXRPwjrbshAjnoPgFfbKC5xKwKQ19q3By8SIC6vUG5AvOcSkDU/Pz1VF65pn75v0z
	L1CQfeag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsEs-000000027qu-1aJ8;
	Fri, 15 Nov 2024 09:03:38 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsDw-000000027kt-3spG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 09:02:42 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21116b187c4so13076395ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 01:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731661360; x=1732266160; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JzLXt5Z4Yoq+cL5FZ5kUr3QUZKj6AqTjZlPMJ0a+Ueo=;
        b=gaDvnwv5r6Od/G86V0AqMvEio+UKQDfpJYaMY/LcQSfjAY/M2HPKmIRHykKhLjZntY
         DCY9RtZ1luYqb3iunQV2WqRnJRSm1F0a3Lv4S9NTMHPZ29+NFMqb6lDstvmHQIhULTS0
         /5Sg4dRzuZ5Uo2gCd2a7MpuOvM/GmZpunTDevotUcB3Lve8U8lkBmhQ+6xrXUGqh+tRD
         nqcdXUgY60RxGuSMNeqRkyR7mzp9+QAK0nxkXF2NeLfrD4sP5lJoIzwgfMzIaYVy/Jjh
         DjdIpcIhkXs0c6msobzBUj04MaiW35uxsmLWe5hnNdeRLHPbxzIi1lNwXopkownMlyTz
         cSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731661360; x=1732266160;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JzLXt5Z4Yoq+cL5FZ5kUr3QUZKj6AqTjZlPMJ0a+Ueo=;
        b=G71oz/zZ31AqmhI5ZwbRenDvjb3a1HKhgYXVJmK7oIeLAPik+NKKXlF0XmfsDM2qxf
         RLYfLbLeG87BFfAn7L2tmHwVGiyXeju9b7sjahvRc6888QCpAn9hJBzLX8myFwe4jW55
         2bGTlcKEMZQGZFouHqf8LsFmzFZczB4ndKrJkKTDPSSnWNytCU/nroqfecsdu3x8jPFJ
         wXqe1YM2FvRonEp6fVVxFopoBQWKO0JGag1WWw2mcg3N7ZFu+Vh59hRJDSmL6gVAIfas
         s8HGNk7PLaRdFXc0NXSyXKc47+N8ue7w5QIq6+DkA3AFCuQlJzz0uKl3hASbt8Hx9ZuC
         t8iw==
X-Forwarded-Encrypted: i=1; AJvYcCVVORluwNIbZI8iNWsthncBmRKIElq8S/SuN7p2RUSE+Ctd15S53H4CYdQ+z+vhjr6Qniors9yVm34EqYPXt5rh@lists.infradead.org
X-Gm-Message-State: AOJu0YzqcX5K1aC0bXi8jDKsQ5E1vreuS+dCi8HXR5R2SHdDCAQIrQ5X
	DotgIYAOJHevpb4N1aIYq04gZHtbhKF6X8GMQoWZQdZunlX+BIstQRjaJ6civA==
X-Google-Smtp-Source: AGHT+IF6ewmiGHuNhETgOoZ9s9tHcZMJFEXL8UFTyjr3PsHYLNE6u0F19Zk/8GV3oZcloNjYIK264Q==
X-Received: by 2002:a17:902:c40a:b0:20c:aa41:9968 with SMTP id d9443c01a7336-211d0ed2e4dmr21401165ad.53.1731661360274;
        Fri, 15 Nov 2024 01:02:40 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f47c04sm8089485ad.221.2024.11.15.01.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 01:02:39 -0800 (PST)
Date: Fri, 15 Nov 2024 14:32:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/4] PCI: mediatek-gen3: Move reset/assert callbacks
 in .power_up()
Message-ID: <20241115090231.nwmxl6acspxqflpc@thinkpad>
References: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
 <20241109-pcie-en7581-fixes-v2-3-0ea3a4af994f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241109-pcie-en7581-fixes-v2-3-0ea3a4af994f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_010240_968365_F444614B 
X-CRM114-Status: GOOD (  24.31  )
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

On Sat, Nov 09, 2024 at 10:28:39AM +0100, Lorenzo Bianconi wrote:
> In order to make the code more readable, move phy and mac reset lines
> assert/de-assert configuration in .power_up() callback
> (mtk_pcie_en7581_power_up()/mtk_pcie_power_up()).
> 

I don't understand how moving the code (duplicting it also) makes the code more
readable. Could you please explain?

> Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
> complete PCIe reset on MediaTek controller.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 8c8c733a145634cdbfefd339f4a692f25a6e24de..1ad93d2407810ba873d9a16da96208b3cc0c3011 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -120,6 +120,9 @@
>  
>  #define MAX_NUM_PHY_RESETS		3
>  
> +/* Time in us needed to complete PCIe reset on MediaTek controller */

No need of this comment. Macro name itself is explanatory.

- Mani

> +#define PCIE_MTK_RESET_TIME_US		10
> +
>  /* Time in ms needed to complete PCIe reset on EN7581 SoC */
>  #define PCIE_EN7581_RESET_TIME_MS	100
>  
> @@ -867,6 +870,14 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
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
> +
>  	/*
>  	 * Wait for the time needed to complete the bulk assert in
>  	 * mtk_pcie_setup for EN7581 SoC.
> @@ -941,6 +952,15 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
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
> +	usleep_range(PCIE_MTK_RESET_TIME_US, 2 * PCIE_MTK_RESET_TIME_US);
> +
>  	/* PHY power on and enable pipe clock */
>  	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
>  	if (err) {
> @@ -1013,14 +1033,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
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

-- 
மணிவண்ணன் சதாசிவம்

