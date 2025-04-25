Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1700C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BMXqgQl7jfC6H77AGknLL1fmdPdkIRiy2JGqphh2TI=; b=3Ef/+qaNYdrEydAA0T6+oP23XR
	cu59hyBqjZG8VmIDTgAauBw3xJY3XSxsfS0Rce7wmddSINtXILr2VCpSzIq8ZP10abgKy5d97W2iz
	RkAPgXVwI33fbMiPflK8j6ju0n2N4OID5ZqYwVnyzN6H2LXN1uHb5rVUy6ZrFj4hwEh6ulfG2s3da
	jBWd7GoWnKPCPLdfaO270koEZK2vfZ5vlVbSXs5HQ4k/JSrxavsUkN5thp8yrVHiHm4wkFB5HZTzy
	cI/dGpB+mNMeVyYLaCijtaUHRPbnG3U9aquEJIz4A3JRk+r9XDQfde0GKBK3va2L0Fx9mPHBmP7tL
	vwyhKE7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Is5-0000000HEYy-0xxB;
	Fri, 25 Apr 2025 13:13:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Hid-0000000H2qu-1ESX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:59:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso14624715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 04:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745582385; x=1746187185; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BMXqgQl7jfC6H77AGknLL1fmdPdkIRiy2JGqphh2TI=;
        b=w6bHL1CMyn0EVVsCmZdJvS+q1PphbeqsFAMXIs2IMS6CJgXDfZ8iOa6Ui33BHOGcjL
         ywaiDnOlDb+o9AiTbj0B0x82wOnMMT36a7kRc+VmO0ZZR38esp3sj/LdT2LFMLHz0xre
         UOz9erjjejzxkwMumj/HiIq3U9O8R6jLe0j7JItrmFahjmpwoJCe7jO4Y/H2OZ/H0BKl
         WdOxgD5Sm94UJrGXZR0ZQ30ILxt0N8NKELFNGJAeI+T5CrlgX40SUVaMZqTTYrljOjFD
         so7T1tPtcxnj/JTlw/BmXdRBx1noACt85Otii5wjlYB36ZxJ/7qKcgjdsfQRdSQD8RXf
         Wn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582385; x=1746187185;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1BMXqgQl7jfC6H77AGknLL1fmdPdkIRiy2JGqphh2TI=;
        b=eRX+Q9hOlqUyZCY7i4JO4qkADhRiNCuxzN7ojvu9huAqH0r2GmRESVMwD6m7HBOgjT
         EIVex4+C+yNl/VOwN+09h9+XPcxXHbCpS3r1mHQCTiEWU2pFKvcXTl1+WtOr1epke5Ng
         Pzt4wlVFtIsnGIq+tCMu2FlAQ3nO4DN8iVlseLyGxFqVTm9Ir/PA/cSvuJMcmU4DMY8X
         GwYtWJYRkxT5YYUTWVnyW1rDblF8x04EWf58UJj1GO3GqNYQYMQllwxUkfNjoMYsT6dp
         KQFM3tNFiPaXXkzPrt4KINwU0DLs/rky9aAbjfmJ4T/81GMRoY+myvsvPW2gSAAKSqTp
         lrdA==
X-Forwarded-Encrypted: i=1; AJvYcCXb2a1HpNJsZkyAB9mGdpQBYps0SEHHbUsX+049ULUQaW9hh4rD4ZuSg/A4uqqQCQYo00uadO1YDMyrSl5cm7TA@lists.infradead.org
X-Gm-Message-State: AOJu0YwmxssDRtU6Uz+oWHA4NeZQsyEVhr2jKBf1/8e1uqocPoCVxO2L
	DM1M2WpzxobKWwrcMWpakS/xl/9bVrzAnLDImcBh2Qg+mXb2d1AYtx2J4dt9B30=
X-Gm-Gg: ASbGncuGAQlzB6AWaoS8Gqraji/x3zMRh3xcTlf8zJPd6aCFVfSgnafSZp9JBhD4N+q
	hVVOHgvOzbQGilUy7u6VFoQ5wFRyV6LL3uu+pydOcVLj64goCXaHOmZ9VgNUYoeapX7Uj0jiCrl
	H/OQCfP4S9NFLYq5HqWdPA+PNbYTpxUykzkPBKTR0p3AYBEtwLMDO+U5erseYw1Byx0Lm1TYc0m
	2Ddb8ZhsE6q2tABJ8KHOHBKakrxllpKHWePnTrqIdlqLm4zIrBX6SSFNs4+P7FlapGssdvzMyUE
	cOAJvqdgzKjq9fue/w7+zksCFK3UYE1Mg4IhspvBWwJVHFC+btPFmZTpmL1Si7pxfNoD/oomJBq
	JUEYxFsJrokd1ci4=
X-Google-Smtp-Source: AGHT+IFUziGPo9gQMFmCnZNYEF+uivB8dimTgfWb3U4m2/eIphhsJOITXlVU1qUIZpOSQaR9a2Vnog==
X-Received: by 2002:a05:600c:c88:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-440a6693e9fmr16619325e9.12.1745582384889;
        Fri, 25 Apr 2025 04:59:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:d16:61ed:6880:1168? ([2a01:e0a:3d9:2080:d16:61ed:6880:1168])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530a6e9sm22682585e9.16.2025.04.25.04.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 04:59:44 -0700 (PDT)
Message-ID: <e6752451-4492-4ae2-9bad-3865c4945dbe@linaro.org>
Date: Fri, 25 Apr 2025 13:59:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/2] PCI: Remove redundant MPS configuration
To: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org, kw@linux.com,
 bhelgaas@google.com, heiko@sntech.de, thomas.petazzoni@bootlin.com,
 manivannan.sadhasivam@linaro.org, yue.wang@Amlogic.com
Cc: pali@kernel.org, robh@kernel.org, jingoohan1@gmail.com,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250425095708.32662-1-18255117159@163.com>
 <20250425095708.32662-3-18255117159@163.com>
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
In-Reply-To: <20250425095708.32662-3-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_045947_327001_802B2D8D 
X-CRM114-Status: GOOD (  16.63  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 25/04/2025 11:57, Hans Zhang wrote:
> With the PCI core now centrally configuring root port MPS to
> hardware-supported maximums (via 128 << pcie_mpss) during host probing,
> platform-specific MPS adjustments are redundant. This patch removes the
> custom the configuration of the max payload logic to align with the
> standardized initialization flow.
> 
> By eliminating redundant code, this change prevents conflicts with global
> PCIe hierarchy tuning policies and reduces maintenance overhead. The Meson
> driver now fully relies on the core PCI framework for MPS configuration,
> ensuring consistency across the PCIe topology while preserving
> hardware-specific MRRS handling.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>   drivers/pci/controller/dwc/pci-meson.c | 17 -----------------
>   drivers/pci/controller/pci-aardvark.c  |  2 --
>   2 files changed, 19 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index db9482a113e9..126f38ed453d 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -261,22 +261,6 @@ static int meson_size_to_payload(struct meson_pcie *mp, int size)
>   	return fls(size) - 8;
>   }
>   
> -static void meson_set_max_payload(struct meson_pcie *mp, int size)
> -{
> -	struct dw_pcie *pci = &mp->pci;
> -	u32 val;
> -	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> -	int max_payload_size = meson_size_to_payload(mp, size);
> -
> -	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
> -	val &= ~PCI_EXP_DEVCTL_PAYLOAD;
> -	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
> -
> -	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
> -	val |= PCIE_CAP_MAX_PAYLOAD_SIZE(max_payload_size);
> -	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
> -}
> -
>   static void meson_set_max_rd_req_size(struct meson_pcie *mp, int size)
>   {
>   	struct dw_pcie *pci = &mp->pci;
> @@ -381,7 +365,6 @@ static int meson_pcie_host_init(struct dw_pcie_rp *pp)
>   
>   	pp->bridge->ops = &meson_pci_ops;
>   
> -	meson_set_max_payload(mp, MAX_PAYLOAD_SIZE);
>   	meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);

Seems you can also remove meson_set_max_rd_req_size() since it's
done by pcie_write_mrrs()

Neil

>   
>   	return 0;
> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> index a29796cce420..d8852892994a 100644
> --- a/drivers/pci/controller/pci-aardvark.c
> +++ b/drivers/pci/controller/pci-aardvark.c
> @@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct advk_pcie *pcie)
>   	reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>   	reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
>   	reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
> -	reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
>   	reg &= ~PCI_EXP_DEVCTL_READRQ;
> -	reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
>   	reg |= PCI_EXP_DEVCTL_READRQ_512B;
>   	advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>   


