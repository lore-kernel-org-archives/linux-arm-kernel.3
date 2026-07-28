Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C015C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hC8sRjnafAE4kvTJxwUbBr2JgmCMzJbZTFX3udFXll0=; b=ZQE9q+zeX0Ofpu/fCaPbsls1wH
	+EiCFKWmWdAwk3PtyKhWjNL1msMhUNUHBybVsyJ86FDveL4+KMkDxIw+UA3a7RVqv0OO9eL0jHuhx
	TI5iH4p27x8k1U16lpxLFDNmAPIMsSuWN4Lz2UpVHcAutP3HbvRFNVuxAr1ogM2xa74Yoloqf2wc1
	gN4sHTWzsCIBfGwVrjYpGIPVGLLVBibc57ynsseJOoCDVCndh4W+/E03PjA2k4K5SVi+aai7QV+xU
	k1sbW4R+uQfEPMqOrHJF6ldD7LaH7nob7gnMS3Nfv9iFnptNWWDw7j8SQdsPGZu+FRz0SYlMZF35E
	y8QJ9ZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohNx-00000005IqT-2BIY;
	Tue, 28 Jul 2026 12:58:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohNv-00000005Iq0-3F0x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:58:17 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f707e5d75so2608148f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 05:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785243494; x=1785848294; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hC8sRjnafAE4kvTJxwUbBr2JgmCMzJbZTFX3udFXll0=;
        b=IkGEaqyVgMg+qGGv4fzm48y1TzgofiTSluARYqvn9OP5xrO0OZfjag9KsMEU1MG7eB
         luN7YoNeePzHUB5vQk1N7cArywV4azBLJarON2ZKeAJwBNQ+ZeDExiuA29tBuBbQQHji
         Q3rZfFK24gx8onz7U4w/nJv4hwXYCI766aBL2ZgdTHkL+sQnH4gRC+MimHPj+/w6CSFj
         fcK/eGWGZvmXGxKCFIks02t5/gg/72QSP4vV7q01WidlL7JQY+8DSBuENYVO9pRxLjPx
         azKV6dn5qgQzvpLLKnPJtumac3yyISyNoLRHZFNlFGhy8+c7WUFIeeGpxY/jasWCUUZU
         B70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785243494; x=1785848294;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hC8sRjnafAE4kvTJxwUbBr2JgmCMzJbZTFX3udFXll0=;
        b=HscRGL3Ls1EtAO3MC6mUUHH0Al4XaRBqhvdydGMeWylx0w7uHgCRb22qbkpEwU7rni
         8Urdy2CdA7Qlm37TZzHInehAa5gl0eAWyg2jP+2aodjBrZ8nfNUhmC5PoHvFFSyz1797
         jymXjwfinmu1f/IcYvRF+gR82h/xbj5ek5MAKz66Gn7IZp5XDP35PjIgqK2vxguVx9qd
         zXFvWM/9dUDWVRP6XbDtjP2IsN3HSSY5xbPmW04JJEckHzrRbGl8b6bExAANyXq83hs5
         DZT1CbWhenhyNWJq3Xnx6DvDpMZ2jpV0VBSo7zZUrVTufKarVGUoYJiZc41skegPDOqZ
         JR+g==
X-Forwarded-Encrypted: i=1; AHgh+Rr5gk4OEG6ULhaaBohN6+iX1T8PCMzZ8HErkNuzYpVBT2WAw/lKhNIM9c6g0voPoB4eu2Xun88nrmF1xb+AlJ1z@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1qS4HuFnxVBsXai7s8Om63BfczGDmLm7qqah5iJ9dhJlSMiSr
	iXWTITIFVvKR/NlllAKfYAPuKlPLWDjGN30pGeqXt4vX6KMyXzdTas+BJelzwt6WuGM=
X-Gm-Gg: AR+sD12RVlGleD4UHrnlIEcOuq+LZ8xB8ibXg6pOo5NAsRM8A9LJyf72NxDjNqCwnz4
	iAvCdx+oSGiG0+1Hjdj29MmTOI0jwx06XSfhSacmm89HJRV4x1PHIZ/zg4lbsdKr/o2xIKkIDY2
	Fa5elnXmVQqWNxALZaj1hl10hqMQ9MA64BRDtzfzIFNp7pVJc2pdDMN5zr57dUjCdA108TtYEMa
	O1yj7LDszUZcWN8lTQLNNKekyHNoOjgkQ+S5Uz4/D701J5FNztQEcuDWSK3uO9xB3+RG9ruBEEe
	stvIO0FI8KX9Tq8kSlvISoKcdfgpZ3kEPCmMMaGu7SkFP2Ff0XIar8r3o/x2gs5AyTjZbzn/FOl
	W8i1ILJj75VMi/hvFlGAGtdgH2SG91anqYQ9Ub7QPzZqkZqOG+1kZl81vRIwE/TkwlQ0iiZUQSj
	VuqhXab1QPkQLSCCzxJgyZkJ3VKPOkGNZkjqfk1+aVphlMlFds4BBRLm5L2XGXMBoHQNDh
X-Received: by 2002:a05:600c:3b1e:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-496c653d055mr24700215e9.3.1785243493668;
        Tue, 28 Jul 2026 05:58:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211? ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4615681sm77642695e9.11.2026.07.28.05.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:58:13 -0700 (PDT)
Message-ID: <df81c03b-6d2b-4c5d-8818-1aa42c146d44@linaro.org>
Date: Tue, 28 Jul 2026 14:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v16 3/3] of: Respect #{iommu,msi}-cells in maps
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
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
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, imx@lists.linux.dev,
 xen-devel@lists.xenproject.org,
 Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260603-parse_iommu_cells-v16-0-dc509dacb19a@oss.qualcomm.com>
 <20260603-parse_iommu_cells-v16-3-dc509dacb19a@oss.qualcomm.com>
 <3f5c974f-425d-47a5-9fda-e05de1f39d79@linaro.org>
 <fuqnxdknkajqotzmmlknwnthqpku7as5kpvmgogexl5bi7x6y4@tthbasf5lqvc>
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
In-Reply-To: <fuqnxdknkajqotzmmlknwnthqpku7as5kpvmgogexl5bi7x6y4@tthbasf5lqvc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_055815_854499_4B8CF328 
X-CRM114-Status: GOOD (  18.38  )
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

On 7/28/26 13:34, Dmitry Baryshkov wrote:
> On Thu, Jul 23, 2026 at 03:17:24PM +0200, Neil Armstrong wrote:
>> Hi,
>>
>> On 6/3/26 09:13, Vijayanand Jitta wrote:
>>> From: Robin Murphy <robin.murphy@arm.com>
>>>
>>> So far our parsing of {iommu,msi}-map properties has always blindly
>>> assumed that the output specifiers will always have exactly 1 cell.
>>> This typically does happen to be the case, but is not actually enforced
>>> (and the PCI msi-map binding even explicitly states support for 0 or 1
>>> cells) - as a result we've now ended up with dodgy DTs out in the field
>>> which depend on this behaviour to map a 1-cell specifier for a 2-cell
>>> provider, despite that being bogus per the bindings themselves.
>>>
>>> Since there is some potential use in being able to map at least single
>>> input IDs to multi-cell output specifiers (and properly support 0-cell
>>> outputs as well), add support for properly parsing and using the target
>>> nodes' #cells values, albeit with the unfortunate complication of still
>>> having to work around expectations of the old behaviour too.
>>>
>>> Since there are multi-cell output specifiers, the callers of of_map_id()
>>> may need to get the exact cell output value for further processing.
>>> Update of_map_id() to set args_count in the output to reflect the actual
>>> number of output specifier cells.
>>>
>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>>> ---
>>>    drivers/of/base.c  | 168 +++++++++++++++++++++++++++++++++++++++++------------
>>>    include/linux/of.h |   6 +-
>>>    2 files changed, 135 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>> index d658c2620135..ac7961cbab94 100644
>>> --- a/drivers/of/base.c
>>> +++ b/drivers/of/base.c
>>> @@ -2116,19 +2116,49 @@ int of_find_last_cache_level(unsigned int cpu)
>>>    	return cache_level;
>>>    }
>>> +/*
>>> + * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
>>> + * specifying only 1 cell. Fortunately they all consist of value '1'
>>> + * as the 2nd cell entry with the same target, so check for that pattern.
>>> + *
>>> + * Example:
>>> + *	IOMMU node:
>>> + *		#iommu-cells = <2>;
>>> + *
>>> + *	Device node:
>>> + *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
>>> + *			    <0x0100 &smmu 0x0100 0x1>;
>>
>> So the sm8650 PCIe controllers has:
>>
>> pcie@1c08000:
>> 			iommu-map = <0     &apps_smmu 0x1480 0x1>,
>> 				    <0x100 &apps_smmu 0x1481 0x1>;
> 
> To silence the warning, update the iommu maps to:
> 
> 			iommu-map = <0     &apps_smmu 0x1480 0x0 0x1>,
> 				    <0x100 &apps_smmu 0x1481 0x0 0x1>;
> 
> 

Will do, I was surprised none of the DT were fixed.

Thanks,
Neil

