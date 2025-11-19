Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3A4CF258C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 08:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBbixjBnBbPva8e3qQDLXuoT9sUiTXbil/L9/fukswI=; b=P2spSaD2SlO5uq
	IofvcwqsaboGDsH7oh1gnU0qFKzykP44ocZlevFjGjtXfHOPtMJpFIuFV9Cphd4qc5nVVO1MRFwqH
	F225cou6Eez0un5svQsdyEufYuxNl4+vH8ARRUVp3x1Ijjd/A9f+PqmEZcPd8L7vFm7grRQc8GuWg
	FCNTe34CdMvjd/4pUllstjZ+AWUHZMDR7E8LVn1TULA6BgyGyXxnCQYIwboT60RjPz/OTuLd+ELHf
	g7vj7SRZM5D1ijnDNkjY+eCj2etd/GXi/sn/3pqV9dMAvCie3VBoLk5qya3/0NYWBmCzTpB1tWv4G
	3KC5eGCoKdq1otjSchAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdk3-00000002o9j-1QHO;
	Wed, 19 Nov 2025 08:40:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdk1-00000002o93-0GXm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 08:40:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso28529085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 00:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763541639; x=1764146439; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBbixjBnBbPva8e3qQDLXuoT9sUiTXbil/L9/fukswI=;
        b=eO0KlOTNSB2bWjykraRgKi+0y0UP1nADJEhFYO0OUtdD3AyYAJlzxgIo27VQpSf0IU
         5J12c41cx/wYPDidK0IC2nrKpofiFo1n6J1CQ4zgqbx41XRxuP+Q2mXO3NKtT/ip9VtG
         ttva2t9lQ1mVpeA5UkXOc5Qs1I0m1LGdA4XRUhGD61D171rot4p5HNmp33FVKqq/yY+h
         A7EWDPXPAyKS72L4lflhr0qjStXDLEzTakgKleU4XNksQWNMad9Fs8uCt32mSdLirEsB
         pmLGGWUEbAZ/DYDUGF6f1nAqqcriVxjiWxJVC6RRJMqbpn/qv5UPVBdcZxkHI7kdd8Kf
         gpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541639; x=1764146439;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBbixjBnBbPva8e3qQDLXuoT9sUiTXbil/L9/fukswI=;
        b=H9h44U3JEFqcOPx0EwkKopEIETmyX0gy0FzByqXgGn1rVNxIxQPDFpt/Lwb+x1JbPK
         X+DxbmIQOEnK4sxFZR/qMZTAvm2WrqrqojrNk1R86Q5IhHWmX1gW3rlSyncx1nyzIh4A
         J+xUwEzmLLSAD3dEiLmK8PkVCXnN89WhxI7DJuw5ZJdJLEPOB4jKGzMdWxZQg5hz/YGi
         O7rl5pgBUNlI7lYI4a3AX8RQtSNb+m3rLhp3LiYwiNFt7zYPITwZp+dIbGo+oBSHYful
         NhRl732e1UJTjKiv3+h3UTxjikPODCXv+Pxq4tTkny+qUA2phZfTbxMpGBD1bJXU18fj
         hasA==
X-Forwarded-Encrypted: i=1; AJvYcCVvLQVgZCvNlDt8zzcLm5SqyuvCrDlEMFXtJtST32ONRbbyXAaCbEHA5MxICio1IGY/FbVZeow7i/M26er/bren@lists.infradead.org
X-Gm-Message-State: AOJu0YxUeGW4vfrgNmJN+fPQRmVekuMIS4/T53AlTEVL9nfONrzc+ePr
	T5VZN3h3vDpnmo2lVPUTF3LRnMpKrBB1NBFn9rRL5MG/3rSAsbkq1ToVA6Ng/0c4ZSE=
X-Gm-Gg: ASbGncveurDgZAvUseqeGbRyvlRHjl98GY3lBni8AUuPaV2fNExZ4KqRioLmf+uU48J
	6lV5dmT3KrLDUvI8Lzy8M5BH7RmAsMveebhFTVb51C0b35b36/+QbuIroqax63337ySN+i9YgrW
	KcElcWwawfMls26MsnQhvKtM7yrqBt6+9Rwb+QdXx6Le7UeAlm4/EAeP45++aOyt6TPMD7aJmTv
	LR2qZbrSfAE4ota/K8glh8jPw3+MweHtoLQP6YO+XhRf9d1IkvBVjfYTPJUyYi4DxBx/PwLDIe0
	B2x5QrJUKRRfiXYOOMli6yl1vAlGhkn1rcrMwRNFr1f4LwLxvxU+6iAsOq+Nmh62Lr8IGqnEsH8
	FqGdOfj5p4Xr9kwxqE10KveXHmgX80wvJJqPj3uVwjL3rvj2f+vyjz44rTbnIP5fNhfh+JldBrg
	CcigAxirJHyiBbDarHxAeRhHhaUiVfnvNsyZesli3Yct3iD2VqFcVL9fwJlzA7Mdg=
X-Google-Smtp-Source: AGHT+IGKiZiYBXjHj/z9lV7e7rsBSdkQWY5bFdVCTdvJUrbHHgREFhMcJGGNNV9FKXHCj3CnZDcH/g==
X-Received: by 2002:a05:600c:1986:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-4778fea7037mr172201975e9.27.1763541639176;
        Wed, 19 Nov 2025 00:40:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad? ([2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1012a92sm34648755e9.4.2025.11.19.00.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:40:38 -0800 (PST)
Message-ID: <50bdc65e-b052-4f81-b501-016b36e86574@linaro.org>
Date: Wed, 19 Nov 2025 09:40:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: freescale: Initialize priv->lock
To: Xiaolei Wang <xiaolei.wang@windriver.com>, Frank.li@nxp.com,
 vkoul@kernel.org, kishon@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250925013806.569658-1-xiaolei.wang@windriver.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250925013806.569658-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_004041_143186_FBCA6B1C 
X-CRM114-Status: GOOD (  18.82  )
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

On 9/25/25 03:38, Xiaolei Wang wrote:
> Initialize priv->lock to fix the following warning.
> 
> WARNING: CPU: 0 PID: 12 at kernel/locking/mutex.c:577 __mutex_lock+0x70c/0x8b8
>   Modules linked in:
>   Hardware name: Freescale i.MX8QM MEK (DT)
>   Call trace:
>    __mutex_lock+0x70c/0x8b8 (P)
>    mutex_lock_nested+0x24/0x30
>    imx_hsio_power_on+0x4c/0x764
>    phy_power_on+0x7c/0x12c
>    imx_pcie_host_init+0x1d0/0x4d4
>    dw_pcie_host_init+0x188/0x4b0
>    imx_pcie_probe+0x324/0x6f4
>    platform_probe+0x5c/0x98
>    really_probe+0xbc/0x29c
>    __driver_probe_device+0x78/0x12c
>    driver_probe_device+0xd8/0x160
>    __device_attach_driver+0xb8/0x138
>    bus_for_each_drv+0x84/0xe4
>    __device_attach_async_helper+0xb8/0xdc
>    async_run_entry_fn+0x34/0xe0
>    process_one_work+0x220/0x694
>    worker_thread+0x1c0/0x36c
>    kthread+0x14c/0x224
> 
> Fixes: 82c56b6dd24f ("phy: freescale: imx8qm-hsio: Add i.MX8QM HSIO PHY driver support")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
> v1: https://patchwork.kernel.org/project/imx/patch/20250923141611.1295395-1-xiaolei.wang@windriver.com/
> 
> v2: Use devm_mutex_init() instead of mutex_init()
> 
>   drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> index 5dca93cd325c..977d21d753a5 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> @@ -533,7 +533,7 @@ static struct phy *imx_hsio_xlate(struct device *dev,
>   
>   static int imx_hsio_probe(struct platform_device *pdev)
>   {
> -	int i;
> +	int i, ret;
>   	void __iomem *off;
>   	struct device *dev = &pdev->dev;
>   	struct device_node *np = dev->of_node;
> @@ -545,6 +545,9 @@ static int imx_hsio_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   	priv->dev = &pdev->dev;
>   	priv->drvdata = of_device_get_match_data(dev);
> +	ret = devm_mutex_init(dev, &priv->lock);
> +	if (ret)
> +		return ret;
>   
>   	/* Get HSIO configuration mode */
>   	if (of_property_read_string(np, "fsl,hsio-cfg", &priv->hsio_cfg))

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

