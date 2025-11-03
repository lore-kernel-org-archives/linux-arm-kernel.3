Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58063CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyfgOfO5wbQrka4RaJRIQ58bY784PFhznl4lHer181M=; b=2KoncYmfdv1OCh5kcko9Yo0TK6
	5WgAs/6F53JHEBFrh8aKyhxUd2/Ch+kKtj4G2pnzTgfcNb/vwb3LLX8HVG80VQu9r+raQ1YxyHyQY
	xTqwR1lK+i5COybE98aRHWo2GN5vhX0MKvGoAgaPYf/kTq5sQ7/39CYE7tYdORsH0FmYXQURp25JB
	2An9kzbhdcnUoxgFIUQ/pk2W56hzrbrD/C0Q7uH3rfg55DkmJvgXV5pEAfaS9g38+/UHuh18ZPBNk
	E/HPpwsH3eJXqbAqcgwI9xDy5QYsmS+fdPMKMZt1pI2CqJwYjdX44OjZExGpGbk8+qLY4nzFYEk2x
	byo6lbGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrBV-00000009XVk-2Z40;
	Mon, 03 Nov 2025 09:49:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrBT-00000009XUy-0J2T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:49:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47118259fd8so30350415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 01:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762163345; x=1762768145; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyfgOfO5wbQrka4RaJRIQ58bY784PFhznl4lHer181M=;
        b=VHRVf+lhthMaNb7IlvSh8+I2p0YMcaYWkIoaWz1mrsMPsBCpiLhGLxMYz7nfVoDU+b
         okb8o8FyB+/rdPNHDZkd9neIE82+oGvjB3QVAevjP79dTL6BgveEZ8UQqFamGd3P5j7V
         8HfDGJEqc0adxxFbpKYQ/a9YLe0N5KFGtKqUxiOt80hEwsP2T7UX5bBjOWszC6RCHwqa
         kqoKdya8sJLojAXnvgxAl8MVG0AWTj1+AN8UeMUfFuWzY53KbmRZ8hd0iAyJKYqUETpm
         0scbRWOy+jdHwvW3rtdVj3k32Qs8/ALtYR0IPwR4caAlVibvvSv4zzCVo8SHCPkzt68H
         3pYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762163345; x=1762768145;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cyfgOfO5wbQrka4RaJRIQ58bY784PFhznl4lHer181M=;
        b=LgzdeGzpkS9i5W9hEvR87b3Q1/OuD0HY+YGQIioo95Qs7H8gsr6r8Y9imUT7UD2jt0
         36Rb95kk7W+EDjPHpZOu2atqyoajVdGPnOMQmtyQm4WG/WZkV6u63sJTrajyptd4JFeH
         fNccPGCAZqyHjwk8UAVPXD2cOzlQoaOU1+r458aGuw629Q69h/22vJKnXs3rvfoLzNQG
         0bybGKYQ6J89j3/fSyuxDBeFGg6kVQZ4jhBkQa+NXlKz200dN79b7XC7CV0XoU651EMf
         Z+dz4rDVIZP9Y/3wBZCETElDZF+Tx/6FQwvsDK2FhIFJVp8Xu3q30hKUbTB2gTX344wS
         OrWA==
X-Forwarded-Encrypted: i=1; AJvYcCXm3H37Tp5EWJ5ickO/fkEXEWf2+b9EBBbmySQb+jFJQfSnYgILhshthqTbc1Jes5Uv/pXQp/C6Js+9qNo/nw0u@lists.infradead.org
X-Gm-Message-State: AOJu0YwLhbOZnMm0U3bhTpfweFzQTzNs3l9Jw9wIPY6hUvkJfni+p8OI
	ddSQQfko4c0NnDxgLRW3UrAwI5jyrYBQpjOhVvioNMfcGEM0TSgNydcHVq4FgESCfsw=
X-Gm-Gg: ASbGncumrcjJAq1qWwkLG38UY5ge1tjH5JmzSE3cKZG4BTtUVZtqMy5gLtcPp2CVZ64
	hEw6JWqJyE5086Vxon1jjwifrl+SH3/lMjAxE9OTrh2MH69sPWEPEfuZXUqv9FNUrYUweeDlBeu
	HSXhP73oPz+4BAbUmzYjRByhFQL6+1QgISUUsKBvcAwYCspuwAyyuRz2k92J/DdS2kTn+/z7H42
	TohyQpYVSySyvtinR4BIQYMoe3WwQNbfrTvJ4EpaYpptQVHZ+6hb2krs1ue+6yVY19QGScpuU3P
	UQyt3Fs4Jn5HU57QlfqNpbBcNkXiaNnLWVIDyHmoXEoVQ9VVYG91KjtZG/wYoFmehkDBtpW4v+d
	izIrFXG36Up1v9s7B9N9JHl2liGzxFR7lTzx4Q7yYXBeUMXkwIpFviJk6EyMSfbdccXKcEZZSlk
	LagyGpK8BNCllYkNdYDq3Kb20vdeUWacoJUTWF+/1rCAiZ
X-Google-Smtp-Source: AGHT+IH9c7oxZUwI4MZc+UcQYfSkmXSjNxCEXJEJzZAI5xj3Z/FVbn/Z55mp6ddo/Yu2LHLMUnh/Mg==
X-Received: by 2002:a05:600c:b8d:b0:471:803:6a26 with SMTP id 5b1f17b1804b1-477308c8bc7mr112449905e9.37.1762163344829;
        Mon, 03 Nov 2025 01:49:04 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c4ac18bsm144251275e9.5.2025.11.03.01.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 01:49:03 -0800 (PST)
Message-ID: <807e9f74-79ed-44bc-8a80-3d99787edc65@linaro.org>
Date: Mon, 3 Nov 2025 10:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND 3/3] PCI: meson: Fix parsing the DBI register
 region
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>,
 Jingoo Han <jingoohan1@gmail.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, stable@vger.kernel.org,
 Linnaea Lavia <linnaea-von-lavia@live.com>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
 <20251101-pci-meson-fix-v1-3-c50dcc56ed6a@oss.qualcomm.com>
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
In-Reply-To: <20251101-pci-meson-fix-v1-3-c50dcc56ed6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_014907_179224_B2554C72 
X-CRM114-Status: GOOD (  23.25  )
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

On 11/1/25 05:29, Manivannan Sadhasivam wrote:
> First of all, the driver was parsing the 'dbi' register region as 'elbi'.
> This was due to DT mistakenly passing 'dbi' as 'elbi'. Since the DT is
> now fixed to supply 'dbi' region, this driver can rely on the DWC core
> driver to parse and map it.
> 
> However, to support the old DTs, if the 'elbi' region is found in DT, parse
> and map the region as both 'dw_pcie::elbi_base' as 'dw_pcie::dbi_base'.
> This will allow the driver to work with both broken and fixed DTs.
> 
> Also, skip parsing the 'elbi' region in DWC core if 'pci->elbi_base' was
> already populated.
> 
> Cc: <stable@vger.kernel.org> # 6.2
> Reported-by: Linnaea Lavia <linnaea-von-lavia@live.com>
> Closes: https://lore.kernel.org/linux-pci/DM4PR05MB102707B8CDF84D776C39F22F2C7F0A@DM4PR05MB10270.namprd05.prod.outlook.com/
> Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
> Fixes: c96992a24bec ("PCI: dwc: Add support for ELBI resource mapping")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   drivers/pci/controller/dwc/pci-meson.c       | 18 +++++++++++++++---
>   drivers/pci/controller/dwc/pcie-designware.c | 12 +++++++-----
>   2 files changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 787469d1b396d4c7b3e28edfe276b7b997fb8aee..54b6a4196f1767a3c14c6c901bfee3505588134c 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -108,10 +108,22 @@ static int meson_pcie_get_mems(struct platform_device *pdev,
>   			       struct meson_pcie *mp)
>   {
>   	struct dw_pcie *pci = &mp->pci;
> +	struct resource *res;
>   
> -	pci->dbi_base = devm_platform_ioremap_resource_byname(pdev, "elbi");
> -	if (IS_ERR(pci->dbi_base))
> -		return PTR_ERR(pci->dbi_base);
> +	/*
> +	 * For the broken DTs that supply 'dbi' as 'elbi', parse the 'elbi'
> +	 * region and assign it to both 'pci->elbi_base' and 'pci->dbi_space' so
> +	 * that the DWC core can skip parsing both regions.
> +	 */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "elbi");
> +	if (res) {
> +		pci->elbi_base = devm_pci_remap_cfg_resource(pci->dev, res);
> +		if (IS_ERR(pci->elbi_base))
> +			return PTR_ERR(pci->elbi_base);
> +
> +		pci->dbi_base = pci->elbi_base;
> +		pci->dbi_phys_addr = res->start;
> +	}
>   
>   	mp->cfg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
>   	if (IS_ERR(mp->cfg_base))
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index c644216995f69cbf065e61a0392bf1e5e32cf56e..06eca858eb1b3c7a8a833df6616febcdbe854850 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -168,11 +168,13 @@ int dw_pcie_get_resources(struct dw_pcie *pci)
>   	}
>   
>   	/* ELBI is an optional resource */
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "elbi");
> -	if (res) {
> -		pci->elbi_base = devm_ioremap_resource(pci->dev, res);
> -		if (IS_ERR(pci->elbi_base))
> -			return PTR_ERR(pci->elbi_base);
> +	if (!pci->elbi_base) {
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "elbi");
> +		if (res) {
> +			pci->elbi_base = devm_ioremap_resource(pci->dev, res);
> +			if (IS_ERR(pci->elbi_base))
> +				return PTR_ERR(pci->elbi_base);
> +		}
>   	}
>   
>   	/* LLDD is supposed to manually switch the clocks and resets state */
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

