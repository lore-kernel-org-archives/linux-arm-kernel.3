Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566D7C71151
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 11:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=629JP4RloYd0AtRr7iHTTkC9nVi9eInO64mnKOCzxxc=; b=MSVd4bWPV6zAMrQhgQ95ON2RbX
	w6OuRJLJgmkCRFzSlCoD3CV5GWJlnkcpZXvj/SBTV+rBGCDPlqDaxE0GyXBIVwENuzDf3YkQM6aJU
	TtIyoTr5w3huhoNsKCy2wJeJG1u64RnrZG1Mp2918Nxchv3dbhuUhA2S5tgbLma9NtrVhriZhA/Oq
	BVvbQbVUQjMMzt6pKRtQ2fcFJwiXwD/nTnk0YasqVetC/wl8DfwQ8IGpFgu3DYmBuAx1jYDgxpbYm
	NmzNU6OJcw9irLA+TFUxQHDrNe47ASP6zkWoYlYusZI95LY4D4mF/fdVWmHwgWLvdCGwA8QLRR+20
	UytpjN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2cI-0000000GAXc-3phI;
	Fri, 13 Jun 2025 11:30:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0RW-0000000FsmE-1JNY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Jun 2025 09:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=629JP4RloYd0AtRr7iHTTkC9nVi9eInO64mnKOCzxxc=; b=F7xWD1Zvrje3nsTo7SlFdfsCYm
	MWQSQai6w9XJFo6IrQX/Zj5c+DscOV2eeEuMHN50TMsp4fxnw+0SXbVl9OL2cURUBODyF1e56eevG
	ImFEFKCNvGNqXDhYbbIiP4GMW70oaxJ95rMpYtaSYttKbSJr/avFXx7np82g2C+wJuV3I+LJZlA/p
	iB9IDsCXOXLv7BsXZYWgOWQRq0PZJ2O4TvTH2DZoBoyjqaZY0eM8JGt9V+bBFcr3mHSx8rcl8K50I
	XvrKr0XwurlEl86yXhdWCODNI+fzKJXTr6n2bdAWK7B16b6cHThHVP6MArq0WbS5/13kai+876OtT
	nj8HtZaw==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0RT-00000002x1I-3Vpr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 09:11:21 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a51d552de4so1165272f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 02:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749805876; x=1750410676; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=629JP4RloYd0AtRr7iHTTkC9nVi9eInO64mnKOCzxxc=;
        b=F1jqtMjqWoudtEuazKytPeCC9JUU2LBPKyxFAZj7lczZlfECyY1JnzE1/sdwnRQpYi
         SLOeX8fsAYOl1DvmhsF0t2hZltGe14qyoRxf75fw1gCq1+j4sOvn1uPnexqnk9SQqq2y
         dQKhpAILfbUH/EOICmNwhUyfCvEd0IIpJh5/ZCL+a2Q8RIx7lbaqQ3CY6PH5HrNGlTxf
         Sif2dDZ+NxWV02A7+7xYMBy/28/3gprI00dCz7e3kQy+CuU5TGRTG9jRYTxED/GezhhC
         LZfVok8IvRTtZp/OwZ6AJCqrMPgQvLi/pBTDWIkKq3lUfuVASkGk3hjQSOwSQdujttyX
         l46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749805876; x=1750410676;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=629JP4RloYd0AtRr7iHTTkC9nVi9eInO64mnKOCzxxc=;
        b=ASSxdv4h2vFx1Qo9MfM9f+8yZ1tC0UZaSEEhUHNLI9UL3QfNWjInt+2ORUJN7fpuY3
         IXhWNWbtkpDvjnEQ5JaVsQr2ajRWxwpiAR51UDvPxyEgmdXze7JnIbrLFxyUBSutOmYr
         InMLK7n9bHHn03EWQiWBkUsMJtROMfUpOvYfgnfd/P/PHcQRmzjTJn0gS8/hMEeCCLT6
         9uIQjiNIHTOs7qdhnngkB7lIQL1MEiN0PoKNaK2nHZLIfhy1Vecu7EqQw+CgAv1bUrnC
         3xdAli3Mq/4fDtqCvHzcrL+UJL9YsELNNRjgnxFuhimiu1OHj+FRXZAFreIAsalFMgYf
         mMFw==
X-Forwarded-Encrypted: i=1; AJvYcCWGYP7RMn0X0Mo7K/ugCuxA+hiQ+pWYSXQiUKOnOQdnFHIcHHEhx2cnfvyTMsnTAuFF9ddGTCQdy1Y4sm0QaJBj@lists.infradead.org
X-Gm-Message-State: AOJu0YwvbDBr62lvvy7ESZpYLlHib6z5qq5YGLTXeYpOrbv0X1onaLE+
	d5hPEJfYVQwc2Pk71ZX9YXEUcTUPhqlHpOibPjLnSSmn1aGMKLtA5pA2p/rDS4FUa/s=
X-Gm-Gg: ASbGnctFRxOkTAcERyFhwizx62HCFDYTtj3QmY60kRKAsnciIPICUX3uVRr7XU+Gq/F
	Nkr1SjTX2TkoLpKNm4YdVHopxaRYgelWZKgj5fjl0gV6lcvxXcqfr2nIb8Jp0O62Dp+izNbQxQH
	SQM4bsNEMxxRB6jWzzCx3NnM8GF0UEwY6Qi9KFPIfAJqBuNdDU9vUPff1XlHkAIoK8puuVCS6hD
	Zn7+FeP4jGOEpZDEwuhhoImJy3rNI96+BpekSdYqYfPgDWhz4hEY0E2ej37Ju8O79zOAPqrBDIB
	Zje2ckUZ0RzwrCjj042lRE9Mwni7bSBi8SKFpcwHYKC8SlrJml4sLrpZ72b//RVDWtpPwtfaca0
	L/RpmMHKfx5tSbzmPpxBvulG1OPzsfRn78YzU/Fc=
X-Google-Smtp-Source: AGHT+IEVkOGummRuxHpBo62hdZ3+dBUw2XniYXFN1l2NS66hsifQhIkXqnGbhatOYQWkJjKohoEfGw==
X-Received: by 2002:a05:6000:2585:b0:3a5:2dae:970c with SMTP id ffacd0b85a97d-3a56876b13dmr1880731f8f.37.1749805875958;
        Fri, 13 Jun 2025 02:11:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d74sm1791133f8f.10.2025.06.13.02.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:11:15 -0700 (PDT)
Message-ID: <d6031204-9bb5-4b0f-adf9-109b305e89e2@linaro.org>
Date: Fri, 13 Jun 2025 11:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 5/9] phy: exyons5-usbdrd: support HS combo phy for
 ExynosAutov920
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, andre.draszik@linaro.org, peter.griffin@linaro.org,
 kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
 m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055053epcas5p377269bcc2c8567c00a2298d86c0d26a4@epcas5p3.samsung.com>
 <20250613055613.866909-6-pritam.sutar@samsung.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250613055613.866909-6-pritam.sutar@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_101119_999623_C3630538 
X-CRM114-Status: GOOD (  26.77  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 13/06/2025 07:56, Pritam Manohar Sutar wrote:
> This SoC has a single USB 3.1 DRD combo phy that supports both
> UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD HS phy controllers
> those only support the UTMI+ (HS) interface.
> 
> Support UTMI+ combo phy for this SoC which is somewhat simmilar to
> what the existing Exynos850 support does. The difference is that
> some register offsets and bit fields are defferent from Exynos850.
> 
> Add required change in phy driver to support combo HS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 202 +++++++++++++++++++++++
>   1 file changed, 202 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 15965b4c6f78..ac7bc1d1afd2 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -41,6 +41,13 @@
>   #define EXYNOS2200_CLKRST_LINK_PCLK_SEL		BIT(1)
>   
>   #define EXYNOS2200_DRD_UTMI			0x10
> +
> +/* ExynosAutov920 bits */
> +#define UTMICTL_FORCE_UTMI_SUSPEND		BIT(13)
> +#define UTMICTL_FORCE_UTMI_SLEEP		BIT(12)
> +#define UTMICTL_FORCE_DPPULLDOWN		BIT(9)
> +#define UTMICTL_FORCE_DMPULLDOWN		BIT(8)
> +
>   #define EXYNOS2200_UTMI_FORCE_VBUSVALID		BIT(1)
>   #define EXYNOS2200_UTMI_FORCE_BVALID		BIT(0)
>   
> @@ -250,6 +257,22 @@
>   #define EXYNOS850_DRD_HSP_TEST			0x5c
>   #define HSP_TEST_SIDDQ				BIT(24)
>   
> +#define EXYNOSAUTOV920_DRD_HSP_CLKRST		0x100
> +#define HSPCLKRST_PHY20_SW_PORTRESET		BIT(3)
> +#define HSPCLKRST_PHY20_SW_POR			BIT(1)
> +#define HSPCLKRST_PHY20_SW_POR_SEL		BIT(0)
> +
> +#define EXYNOSAUTOV920_DRD_HSPCTL		0x104
> +#define HSPCTRL_VBUSVLDEXTSEL			BIT(13)
> +#define HSPCTRL_VBUSVLDEXT			BIT(12)
> +#define HSPCTRL_EN_UTMISUSPEND			BIT(9)
> +#define HSPCTRL_COMMONONN			BIT(8)
> +
> +#define EXYNOSAUTOV920_DRD_HSP_TEST		0x10c
> +
> +#define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
> +#define HSPPLLTUNE_FSEL				GENMASK(18, 16)
> +
>   /* Exynos9 - GS101 */
>   #define EXYNOS850_DRD_SECPMACTL			0x48
>   #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13, 12)
> @@ -2025,6 +2048,182 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
>   	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>   };
>   
> +static void
> +exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg;
> +
> +	/*
> +	 * Disable HWACG (hardware auto clock gating control). This
> +	 * forces QACTIVE signal in Q-Channel interface to HIGH level,
> +	 * to make sure the PHY clock is not gated by the hardware.
> +	 */
> +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> +	reg |= LINKCTRL_FORCE_QACT;
> +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> +
> +	/* De-assert link reset */
> +	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
> +	reg &= ~CLKRST_LINK_SW_RST;
> +	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
> +
> +	/* Set PHY POR High */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> +	reg |= HSPCLKRST_PHY20_SW_POR | HSPCLKRST_PHY20_SW_POR_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> +
> +	/* Enable UTMI+ */
> +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> +	reg &= ~(UTMICTL_FORCE_UTMI_SUSPEND | UTMICTL_FORCE_UTMI_SLEEP |
> +		UTMICTL_FORCE_DPPULLDOWN | UTMICTL_FORCE_DMPULLDOWN);
> +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> +
> +	/* set phy clock & control HS phy */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +	reg |= HSPCTRL_EN_UTMISUSPEND | HSPCTRL_COMMONONN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +
> +	usleep_range(100, 105);
> +
> +	/* Set VBUS Valid and DP-Pull up control by VBUS pad usage */
> +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> +	reg |= FIELD_PREP_CONST(LINKCTRL_BUS_FILTER_BYPASS, 0xf);
> +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> +
> +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> +	reg |= EXYNOS2200_UTMI_FORCE_VBUSVALID | EXYNOS2200_UTMI_FORCE_BVALID;
> +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +	reg |= HSPCTRL_VBUSVLDEXTSEL | HSPCTRL_VBUSVLDEXT;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +
> +	/* Setting FSEL for refference clock */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPPLLTUNE);
> +	reg &= ~HSPPLLTUNE_FSEL;
> +	switch (phy_drd->extrefclk) {
> +	case EXYNOS5_FSEL_50MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 7);
> +		break;
> +	case EXYNOS5_FSEL_26MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 6);
> +		break;
> +	case EXYNOS5_FSEL_24MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 2);
> +		break;
> +	case EXYNOS5_FSEL_20MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 1);
> +		break;
> +	case EXYNOS5_FSEL_19MHZ2:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 0);
> +		break;
> +	default:
> +		dev_warn(phy_drd->dev, "unsupported ref clk: %#.2x\n",
> +			 phy_drd->extrefclk);
> +		break;
> +	}
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPPLLTUNE);
> +
> +	/* Enable PHY Power Mode */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
> +	reg &= ~HSP_TEST_SIDDQ;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
> +
> +	/* before POR low, 10us delay is needed to Finish PHY reset */
> +	usleep_range(10, 15);
> +
> +	/* Set PHY POR Low */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> +	reg |= HSPCLKRST_PHY20_SW_POR_SEL;
> +	reg &= ~(HSPCLKRST_PHY20_SW_POR | HSPCLKRST_PHY20_SW_PORTRESET);
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> +
> +	/* after POR low and delay 75us, PHYCLOCK is guaranteed. */
> +	usleep_range(75, 80);
> +
> +	/* force pipe3 signal for link */
> +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> +	reg |= LINKCTRL_FORCE_PIPE_EN;
> +	reg &= ~LINKCTRL_FORCE_PHYSTATUS;
> +	reg |= LINKCTRL_FORCE_RXELECIDLE;
> +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> +}
> +
> +static void
> +exynosautov920_usbdrd_hsphy_disable(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	u32 reg;
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +
> +	/* set phy clock & control HS phy */
> +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> +	reg |= UTMICTL_FORCE_UTMI_SUSPEND | UTMICTL_FORCE_UTMI_SLEEP;
> +	reg &= ~(UTMICTL_FORCE_DPPULLDOWN | UTMICTL_FORCE_DMPULLDOWN);
> +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> +
> +	/* Disable PHY Power Mode */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
> +	reg |= HSP_TEST_SIDDQ;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
> +
> +	/* clear force q-channel */
> +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> +	reg &= ~LINKCTRL_FORCE_QACT;
> +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> +
> +	/* link sw reset is need for USB_DP/DM high-z in host mode */
> +	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
> +	reg |= CLKRST_LINK_SW_RST;
> +	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
> +}
> +
> +static int exynosautov920_usbdrd_phy_init(struct phy *phy)
> +{
> +	return exynos850_usbdrd_phy_init(phy);
> +}
> +
> +static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
> +	int ret = 0;
> +
> +	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
> +	if (ret)
> +		return ret;
> +
> +	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
> +		exynosautov920_usbdrd_hsphy_disable(phy_drd);
> +
> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops exynosautov920_usb31drd_phy_ops = {
> +	.init		= exynosautov920_usbdrd_phy_init,
> +	.exit		= exynosautov920_usbdrd_phy_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct
> +exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
> +	{
> +		.id		= EXYNOS5_DRDPHY_UTMI,
> +		.phy_init	= exynosautov920_usbdrd_utmi_init,
> +	},
> +};
> +
> +static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_hsphy = {
> +	.phy_cfg		= usbdrd_hsphy_cfg_exynosautov920,
> +	.phy_ops		= &exynosautov920_usb31drd_phy_ops,
> +	.clk_names		= exynos5_clk_names,
> +	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
> +	.core_clk_names		= exynos5_core_clk_names,
> +	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
> +};
> +
>   static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
>   	.init		= exynos850_usbdrd_phy_init,
>   	.exit		= exynos850_usbdrd_phy_exit,
> @@ -2250,6 +2449,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
>   	}, {
>   		.compatible = "samsung,exynos850-usbdrd-phy",
>   		.data = &exynos850_usbdrd_phy
> +	}, {
> +		.compatible = "samsung,exynosautov920-usbdrd-hsphy",
> +		.data = &exynosautov920_usbdrd_hsphy
>   	}, {
>   		.compatible = "samsung,exynosautov920-usbdrd-phy",
>   		.data = &exynosautov920_usbdrd_phy

With the subject fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

