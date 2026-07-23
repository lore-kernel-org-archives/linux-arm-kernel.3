Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B562EC531CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9iBEUWCa780NKREnuZlfqOv1A8GdvpYRK+dYt5P3FuE=; b=1Df1edulELzXin
	cD3O7bkIAhpOb6ZEDpzFmLSUzQ8D3dFFo24QQPa/6eUnYHK9vLWmn1edxpseoaglDwNF5Pkryu/Cs
	bLJnIhk2RJNt+OSD1M8WyxsNYEZ30qdwTmHQuXsJBvM98duF5YHg/Eke6SBbfR6h/IeYywQEO214J
	ZK81EnjKFqvesgP2P419PlnZ220v2bFCJ8RKagkmB/7DKNOwJw4O+hkbozpiym5xIvQ1lmvb+2UZn
	4j62qbb/ZswBOOAGUOAU5MzjrGBJZ7Ry1tS1thqjJAIB8fIaH8nyJ7hA75hUCvHsRYQrJz/+A7D8+
	THvf0U1S9ioK9iMz7SJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtIp-0000000EMEX-3J3O;
	Thu, 23 Jul 2026 13:17:31 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtIn-0000000EMDw-1ZaS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 13:17:30 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so420295f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 06:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784812647; x=1785417447; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9iBEUWCa780NKREnuZlfqOv1A8GdvpYRK+dYt5P3FuE=;
        b=uP10iGYcjJ+G5wCLevl9/UNfmj+zN813WFba/QX9/k7XzmIYaui0Me8x0T93p/w2F1
         nCQHapif08UX7tXDSP8F0ktwsHDjizGUJS3ohrtRixoe1UpRbuy5D0lUfuKthXYO2zPs
         6HpNa8sBoBZmv7Dkctp0QydOhC34LeflkiM9lo/9gvst/bKtJq7nUIs3YZsI7aifrFXE
         2cOV+CmvopF9ei9AX8dIz1k/KnEeSwxEm5T5tIWIMQ9EsJrP5zS4SSzTCjvBficR3FbF
         /b90lMv9Jc7wQYwTIHtvlzBGwrcFw7RrVMBoPysbOYJFApnTWGWYbe7XPccS7JZlCHgu
         7WeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784812647; x=1785417447;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9iBEUWCa780NKREnuZlfqOv1A8GdvpYRK+dYt5P3FuE=;
        b=Vv5dOPxVvrLhY+5e2eNrn9Ww+7TiCeQVDCp574M+jiTHNC0EOLrX/446roUU+uvSlG
         2pUECDCpVKoKw10UmNTgnYtJX6EhIb3En2bTIXfMBPnwR/GPQ02pSWC27ZDNlKVzfwf5
         TsjJ08zN/cdwUtYqOfJEuaO1xxQcPa+mB5DMz6wTAKBLRaxMUXz5lDVHMziFoO3cJiKL
         DPUAwj0NEZQBaJNe07ldBmItVW74CwFDfZdbPgTgA2IbArG+IYnmirZfA8BqKR8z1yjD
         2ZzKhjDN3qCPoNpq0cYoKebCMeUa8VhF/iLbQULB670MN4785aBJ28b8tMFp4V3OEXm4
         W/qw==
X-Forwarded-Encrypted: i=1; AHgh+RovvXoziiPr15ssB1UG5UO0g7k7kEbQ/iyvV/R+zTXakklOurwmYX8TMYyHdhYVjTtXIm+NIWs7T6UD6Je8lAmF@lists.infradead.org
X-Gm-Message-State: AOJu0YwIJXbdmjA1VNTs1EPrM59Ui5T0TjpBgkeRbrghi/3xoJJNMg8p
	Ndm0ptCHuwsf8d5sYAk4tCzTYce3XmiGzLkBwTpY68Q/qiq3VFMVNP6bGurkhtLOiwI=
X-Gm-Gg: AR+sD118lHl8JO7roMNqNN3BOBhM1BxsloB6GmmZACePh+UnyBaLQkjxshpudgjP3vh
	RsbeQEe8UKkroIVDDDu/2kYZwWiL0/bPGW3Qrtc0BAx1mr3PYy9VxXf6eomftTnxjI8JztbeBCv
	4hOWKhDY+GRSEenuqaSMq2FRsVRCYqCzOQwaW9rM6Hx0cK6yJ5ffTd5FonppSoudy1Dq0pO11X8
	TxrdG5FVJsC2/DFW+Ociix/06HpcHyCdUk+L70f3GH9K3t7+xNAxy1BIEXGFh5I4GWKsDqNUcRp
	4szo7LXHolkNvmB4V01j4C/sSXdJBf7c5ie59vBNq/z/eXja+rpkhjDlNvGO6N5t3mlzSLK86FK
	6AXKwhlKtmdQVBihF1q3+ndnhYTOSfMr3mVbOPTQ3V6u2b5FHzzIuVVvH3RFRMXqzTGz82IpCl8
	dOK2sxUbW7jNiq/qW1VNggoDQNyge9yJg2FIjUvefeNflZpVwZ/iNY7nqxNg==
X-Received: by 2002:a05:600c:4583:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-49573ccd1ddmr33553745e9.11.1784812646529;
        Thu, 23 Jul 2026 06:17:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:f234:5e35:82ba:6d6c? ([2a01:e0a:106d:1080:f234:5e35:82ba:6d6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm14637989f8f.27.2026.07.23.06.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:17:26 -0700 (PDT)
Message-ID: <3f5c974f-425d-47a5-9fda-e05de1f39d79@linaro.org>
Date: Thu, 23 Jul 2026 15:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/3] of: Respect #{iommu,msi}-cells in maps
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, imx@lists.linux.dev,
 xen-devel@lists.xenproject.org,
 Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260603-parse_iommu_cells-v16-0-dc509dacb19a@oss.qualcomm.com>
 <20260603-parse_iommu_cells-v16-3-dc509dacb19a@oss.qualcomm.com>
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
In-Reply-To: <20260603-parse_iommu_cells-v16-3-dc509dacb19a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_061729_626723_81AB106A 
X-CRM114-Status: GOOD (  42.54  )
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

Hi,

On 6/3/26 09:13, Vijayanand Jitta wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> So far our parsing of {iommu,msi}-map properties has always blindly
> assumed that the output specifiers will always have exactly 1 cell.
> This typically does happen to be the case, but is not actually enforced
> (and the PCI msi-map binding even explicitly states support for 0 or 1
> cells) - as a result we've now ended up with dodgy DTs out in the field
> which depend on this behaviour to map a 1-cell specifier for a 2-cell
> provider, despite that being bogus per the bindings themselves.
> 
> Since there is some potential use in being able to map at least single
> input IDs to multi-cell output specifiers (and properly support 0-cell
> outputs as well), add support for properly parsing and using the target
> nodes' #cells values, albeit with the unfortunate complication of still
> having to work around expectations of the old behaviour too.
> 
> Since there are multi-cell output specifiers, the callers of of_map_id()
> may need to get the exact cell output value for further processing.
> Update of_map_id() to set args_count in the output to reflect the actual
> number of output specifier cells.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>   drivers/of/base.c  | 168 +++++++++++++++++++++++++++++++++++++++++------------
>   include/linux/of.h |   6 +-
>   2 files changed, 135 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index d658c2620135..ac7961cbab94 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2116,19 +2116,49 @@ int of_find_last_cache_level(unsigned int cpu)
>   	return cache_level;
>   }
>   
> +/*
> + * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
> + * specifying only 1 cell. Fortunately they all consist of value '1'
> + * as the 2nd cell entry with the same target, so check for that pattern.
> + *
> + * Example:
> + *	IOMMU node:
> + *		#iommu-cells = <2>;
> + *
> + *	Device node:
> + *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
> + *			    <0x0100 &smmu 0x0100 0x1>;

So the sm8650 PCIe controllers has:

pcie@1c08000:
			iommu-map = <0     &apps_smmu 0x1480 0x1>,
				    <0x100 &apps_smmu 0x1481 0x1>;

and

pcie@1c00000:

			iommu-map = <0     &apps_smmu 0x1400 0x1>,
				    <0x100 &apps_smmu 0x1401 0x1>;

and apps_smmu has #iommu-cells = <2>, but gets flagged at wrong:

[    7.538800] OF: /soc@0/pcie@1c08000: iommu-map has 1-cell entries targeting 2-cell #iommu-cells, treating as 1-cell output

Returning false in of_check_bad_map() triggers:

[    7.642680] OF: /soc@0/pcie@1c08000: Unsupported iommu-map - cannot handle 256-ID range with 2-cell output specifier

I don't understand the issue here, we use 2 cells as expected by
the iommu-cells, so why is it wrong ? can somebody explain in
comprehensive words ? I'm super confused, it worked like a charm until now.

Neil

> + */
> +static bool of_check_bad_map(const __be32 *map, int len)
> +{
> +	__be32 phandle = map[1];
> +
> +	if (len % 4)
> +		return false;
> +	for (int i = 0; i < len; i += 4) {
> +		if (map[i + 1] != phandle || map[i + 3] != cpu_to_be32(1))
> +			return false;
> +	}
> +	return true;
> +}
> +
>   /**
>    * of_map_id - Translate an ID through a downstream mapping.
>    * @np: root complex device node.
>    * @id: device ID to map.
>    * @map_name: property name of the map to use.
> + * @cells_name: property name of target specifier cells.
>    * @map_mask_name: optional property name of the mask to use.
>    * @filter_np: pointer to an optional filter node, or NULL to allow bypass.
>    *	If non-NULL, the map property must exist (-ENODEV if absent). If
>    *	*filter_np is also non-NULL, only entries targeting that node match.
>    * @arg: pointer to a &struct of_phandle_args for the result. On success,
> - *	@arg->args[0] will contain the translated ID. If a map entry was
> - *	matched, @arg->np will be set to the target node with a reference
> - *	held that the caller must release with of_node_put().
> + *	@arg->args_count will be set to the number of output specifier cells
> + *	as defined by @cells_name in the target node, and
> + *	@arg->args[0..args_count-1] will contain the translated output
> + *	specifier values. If a map entry was matched, @arg->np will be set
> + *	to the target node with a reference held that the caller must release
> + *	with of_node_put().
>    *
>    * Given a device ID, look up the appropriate implementation-defined
>    * platform ID and/or the target device which receives transactions on that
> @@ -2137,19 +2167,21 @@ int of_find_last_cache_level(unsigned int cpu)
>    * Return: 0 on success or a standard error code on failure.
>    */
>   int of_map_id(const struct device_node *np, u32 id,
> -	       const char *map_name, const char *map_mask_name,
> +	       const char *map_name, const char *cells_name,
> +	       const char *map_mask_name,
>   	       struct device_node * const *filter_np, struct of_phandle_args *arg)
>   {
>   	u32 map_mask, masked_id;
> -	int map_len;
> +	int map_bytes, map_len, offset = 0;
> +	bool bad_map = false;
>   	const __be32 *map = NULL;
>   
> -	if (!np || !map_name || !arg)
> +	if (!np || !map_name || !cells_name || !arg)
>   		return -EINVAL;
>   	/* Ensure bypass/no-match success never returns a stale target node. */
>   	arg->np = NULL;
>   
> -	map = of_get_property(np, map_name, &map_len);
> +	map = of_get_property(np, map_name, &map_bytes);
>   	if (!map) {
>   		if (filter_np)
>   			return -ENODEV;
> @@ -2159,11 +2191,9 @@ int of_map_id(const struct device_node *np, u32 id,
>   		return 0;
>   	}
>   
> -	if (!map_len || map_len % (4 * sizeof(*map))) {
> -		pr_err("%pOF: Error: Bad %s length: %d\n", np,
> -			map_name, map_len);
> -		return -EINVAL;
> -	}
> +	if (map_bytes % sizeof(*map))
> +		goto err_map_len;
> +	map_len = map_bytes / sizeof(*map);
>   
>   	/* The default is to select all bits. */
>   	map_mask = 0xffffffff;
> @@ -2176,39 +2206,93 @@ int of_map_id(const struct device_node *np, u32 id,
>   		of_property_read_u32(np, map_mask_name, &map_mask);
>   
>   	masked_id = map_mask & id;
> -	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
> +
> +	while (offset < map_len) {
>   		struct device_node *phandle_node;
> -		u32 id_base = be32_to_cpup(map + 0);
> -		u32 phandle = be32_to_cpup(map + 1);
> -		u32 out_base = be32_to_cpup(map + 2);
> -		u32 id_len = be32_to_cpup(map + 3);
> +		u32 id_base, phandle, id_len, id_off, cells = 0;
> +		const __be32 *out_base;
> +
> +		if (map_len - offset < 2)
> +			goto err_map_len;
> +
> +		id_base = be32_to_cpup(map + offset);
>   
>   		if (id_base & ~map_mask) {
> -			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
> -				np, map_name, map_name,
> -				map_mask, id_base);
> +			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
> +			       np, map_name, map_mask_name, map_mask, id_base);
>   			return -EFAULT;
>   		}
>   
> -		if (masked_id < id_base || masked_id >= id_base + id_len)
> -			continue;
> -
> +		phandle = be32_to_cpup(map + offset + 1);
>   		phandle_node = of_find_node_by_phandle(phandle);
>   		if (!phandle_node)
>   			return -ENODEV;
>   
> +		/*
> +		 * Assume 1-cell output specifier if the target node lacks the
> +		 * #cells property, for backward compatibility with controllers
> +		 * that predate the property (e.g. arm,gic-v2m-frame).
> +		 */
> +		if (bad_map || of_property_read_u32(phandle_node, cells_name, &cells))
> +			cells = 1;
> +
> +		if (cells > MAX_PHANDLE_ARGS) {
> +			pr_err("%pOF: %s cell count %d exceeds maximum\n",
> +			       phandle_node, cells_name, cells);
> +			of_node_put(phandle_node);
> +			return -EINVAL;
> +		}
> +
> +		if (offset == 0 && cells == 2) {
> +			bad_map = of_check_bad_map(map, map_len);
> +			if (bad_map) {
> +				pr_warn_once("%pOF: %s has 1-cell entries targeting 2-cell %s, treating as 1-cell output\n",
> +					     np, map_name, cells_name);
> +				cells = 1;
> +			}
> +		}
> +
> +		if (map_len - offset < 3 + cells) {
> +			of_node_put(phandle_node);
> +			goto err_map_len;
> +		}
> +
> +		out_base = map + offset + 2;
> +		offset += 3 + cells;
> +
> +		id_len = be32_to_cpup(map + offset - 1);
> +		id_off = masked_id - id_base;
> +		if (masked_id < id_base || id_off >= id_len) {
> +			of_node_put(phandle_node);
> +			continue;
> +		}
> +		if (id_len > 1 && cells > 1) {
> +			/*
> +			 * With 1 output cell we reasonably assume its value
> +			 * has a linear relationship to the input; with more,
> +			 * we'd need help from the provider to know what to do.
> +			 */
> +			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
> +			       np, map_name, id_len, cells);
> +			of_node_put(phandle_node);
> +			return -EINVAL;
> +		}
> +
>   		if (filter_np && *filter_np && *filter_np != phandle_node) {
>   			of_node_put(phandle_node);
>   			continue;
>   		}
>   
>   		arg->np = phandle_node;
> -		arg->args[0] = masked_id - id_base + out_base;
> -		arg->args_count = 1;
> +		for (int i = 0; i < cells; i++)
> +			arg->args[i] = id_off + be32_to_cpu(out_base[i]);
> +		arg->args_count = cells;
>   
>   		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
> -			np, map_name, map_mask, id_base, out_base,
> -			id_len, id, masked_id - id_base + out_base);
> +			np, map_name, map_mask, id_base,
> +			cells ? be32_to_cpup(out_base) : 0,
> +			id_len, id,
> +			cells ? id_off + be32_to_cpup(out_base) : id_off);
>   		return 0;
>   	}
>   
> @@ -2219,6 +2303,10 @@ int of_map_id(const struct device_node *np, u32 id,
>   	arg->args[0] = id;
>   	arg->args_count = 1;
>   	return 0;
> +
> +err_map_len:
> +	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
> +	return -EINVAL;
>   }
>   EXPORT_SYMBOL_GPL(of_map_id);
>   
> @@ -2228,18 +2316,21 @@ EXPORT_SYMBOL_GPL(of_map_id);
>    * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
>    *      stream/device ID) used as the lookup key in the iommu-map table.
>    * @arg: pointer to a &struct of_phandle_args for the result. On success,
> - *	@arg->args[0] contains the translated ID. If a map entry was matched,
> - *	@arg->np holds a reference to the target node that the caller must
> - *	release with of_node_put().
> + *	@arg->args_count will be set to the number of output specifier cells
> + *	and @arg->args[0..args_count-1] will contain the translated output
> + *	specifier values. If a map entry was matched, @arg->np holds a
> + *	reference to the target node that the caller must release with
> + *	of_node_put().
>    *
> - * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
> + * Convenience wrapper around of_map_id() using "iommu-map", "#iommu-cells",
> + * and "iommu-map-mask".
>    *
>    * Return: 0 on success or a standard error code on failure.
>    */
>   int of_map_iommu_id(const struct device_node *np, u32 id,
>   		    struct of_phandle_args *arg)
>   {
> -	return of_map_id(np, id, "iommu-map", "iommu-map-mask", NULL, arg);
> +	return of_map_id(np, id, "iommu-map", "#iommu-cells", "iommu-map-mask", NULL, arg);
>   }
>   EXPORT_SYMBOL_GPL(of_map_iommu_id);
>   
> @@ -2252,17 +2343,20 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
>    *	If non-NULL, the map property must exist (-ENODEV if absent). If
>    *	*filter_np is also non-NULL, only entries targeting that node match.
>    * @arg: pointer to a &struct of_phandle_args for the result. On success,
> - *	@arg->args[0] contains the translated ID. If a map entry was matched,
> - *	@arg->np holds a reference to the target node that the caller must
> - *	release with of_node_put().
> + *	@arg->args_count will be set to the number of output specifier cells
> + *	and @arg->args[0..args_count-1] will contain the translated output
> + *	specifier values. If a map entry was matched, @arg->np holds a
> + *	reference to the target node that the caller must release with
> + *	of_node_put().
>    *
> - * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
> + * Convenience wrapper around of_map_id() using "msi-map", "#msi-cells",
> + * and "msi-map-mask".
>    *
>    * Return: 0 on success or a standard error code on failure.
>    */
>   int of_map_msi_id(const struct device_node *np, u32 id,
>   		  struct device_node * const *filter_np, struct of_phandle_args *arg)
>   {
> -	return of_map_id(np, id, "msi-map", "msi-map-mask", filter_np, arg);
> +	return of_map_id(np, id, "msi-map", "#msi-cells", "msi-map-mask", filter_np, arg);
>   }
>   EXPORT_SYMBOL_GPL(of_map_msi_id);
> diff --git a/include/linux/of.h b/include/linux/of.h
> index ea50b45d9ff7..374b249766a2 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -465,7 +465,8 @@ const char *of_prop_next_string(const struct property *prop, const char *cur);
>   bool of_console_check(const struct device_node *dn, char *name, int index);
>   
>   int of_map_id(const struct device_node *np, u32 id,
> -	       const char *map_name, const char *map_mask_name,
> +	       const char *map_name, const char *cells_name,
> +	       const char *map_mask_name,
>   	       struct device_node * const *filter_np,
>   	       struct of_phandle_args *arg);
>   
> @@ -950,7 +951,8 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
>   }
>   
>   static inline int of_map_id(const struct device_node *np, u32 id,
> -			     const char *map_name, const char *map_mask_name,
> +			     const char *map_name, const char *cells_name,
> +			     const char *map_mask_name,
>   			     struct device_node * const *filter_np,
>   			     struct of_phandle_args *arg)
>   {
> 


