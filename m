Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9E1C71137
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 16:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3R09Iyu+oVEvrLJByqrLxu4/r9hm8EBVtdwnnJnPEk=; b=JLshr0YEAg3Vhn7MvTcMV1ttX8
	AH1ObCvvagByGlYbPv6QI8/oADNKlSijwUP17K4FQTRsfzdawRdLDyXZQ7u6ZzUpp/RYW8lIkt2z/
	BgEsUCpzzSoVGwyfHgUCJ994TZ1CWQORc7hOz4QHM+8dBkAuj/oM7AsjVESQHW9F7r/qOex0ucz0s
	3GkT+yxoezqnygJaTba828dCTfIMNmBGwNStG+Vifd/Cvzf4gNAZeAsC/J7H0twJIB3JPaQySHART
	ZQuLkd2Ax8sIcohlfUovqsUaoey7qJ5DW8PEzSj8PJt58fE5kv2P9Okhb7Was0P7T6PFZFzP1EHDE
	1bD9Zdgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOAV-0000000AakY-0Fa2;
	Wed, 11 Jun 2025 16:19:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPL97-00000009ut3-40ug
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 13:05:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so5245445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 06:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749647136; x=1750251936; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X3R09Iyu+oVEvrLJByqrLxu4/r9hm8EBVtdwnnJnPEk=;
        b=kjKMhsnaCRi4P1QcBPripVAF01ABcVOdY1qdGSfkjaJW4t91OBKjFrjNDYC9PeAnCE
         nMBGRffJDXueLsXbm5ROT6UiCafCoHHNQtFQC2zRdliXIoFG4Uw5b2dEEx8jZ1HswUO7
         QCBtI1gUOn+Uf4/qqA/fNxJYLeg/bwwE4Q/Uclt77cfnRvExMvTOz0jpcZJcNsgJSHwV
         g7HEcuaw50wvOaHozbO4dt3DUJg/xpBt8I0iaVr70TmCENvzhgBHpt+OIipGUMeqyh7K
         wC8uVMVpp7nR7Zy68miZfOlz8pJpL9mSIDnceXfKFkLaUFOU2TGLLme5FtTRdcK6kXB8
         GD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647136; x=1750251936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X3R09Iyu+oVEvrLJByqrLxu4/r9hm8EBVtdwnnJnPEk=;
        b=LY2k6OMo8HhcLx8hKP1gAw24SN88Ronc+1mR69JX9RSTo45S7MKxEI+wOfq3LAJfn+
         s1zrWvsy8t1hEJuLTZt7wamzKTgDXjrLmPVUu9B2ynwlXL0GWVBwHsScYUlSDgeJH8+n
         h+nxgRNqZaZrk5sG8bYjYOy/0tBhRKvOmg/okXNr8PedwWUbkiTppM9PmkKKxc3gbJiH
         oaWcik8lmL1B1PyzJ2mzij7OJY0ecVYFX4T1/ZoXK69Z5sYDKTolVcRGuT6VRJhf4EJo
         G0VXA3B/USGMhrMHmvwImaZ1Wp3Vzex73dw1TX0RpCASz5ZRCari5d3wm5UvgilEpykV
         22nw==
X-Forwarded-Encrypted: i=1; AJvYcCWloxpQZqHY5ijTk+k7Hroxuyj+QWr331Jq9BzJ1jOJzhlQjact6fHfTgHQr5IlOHA683BvFz94zYm9AEI2Hgxv@lists.infradead.org
X-Gm-Message-State: AOJu0YwIcjstVfW8i441gt60CSkiNblBnlHWeKwo7G1kxTC5jdoX3ex3
	yChYQLnQUFbUlDmGrrzhPMXaIF848gNd0DHOY3xdeB/SDjAOenSUfIWHUQXBJeetA8o=
X-Gm-Gg: ASbGncuqTGb1G8M0iqEKMXge+NAK0fng0+CN1sLNj6Mqpzk29/he+5oXy8vY/bssUiP
	SwBUb4jKiZa4XSXS1MS+ovCHplTXDAeYX1mEVQOekC8FAwCckjnfNmjjSpcQ78f3dxQH+olG4pm
	P6oiojQUxerozjooI5oFFGxMiEL8jxNXHQUB5EBqC25dKmE3gYcb2Miu+jowDQNC7ylfOP7fF8k
	Ifu8yH/faNxwjhzluJFKuL7o9HYb34Z+WVnbWCbC+csYibETyIAA+90+6ib9XFAVXLwcwbWwlT6
	oqHTU0TasCoHdMBwiwOTsvrDXRkTgL8YOgbdCILOWRLZLT9W8c4TqXmCtlNbrBdeiogQHyDonah
	Hr19NoMmNzaGqTvgxkgQ4i8ji8OEmMCpHkcOqpfdnGO04MnOgxpIibjqR
X-Google-Smtp-Source: AGHT+IE/+ZF0202H2gGrgjMZ/XMTAOBrohuHjeBubUtp7vBfdN9DADireHyArZ8FK4FEDHt2MkhIeg==
X-Received: by 2002:a05:600c:314c:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-453240b0e39mr34289735e9.3.1749647136238;
        Wed, 11 Jun 2025 06:05:36 -0700 (PDT)
Received: from [192.168.1.105] (92-184-112-57.mobile.fr.orangecustomers.net. [92.184.112.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45325141397sm21364185e9.8.2025.06.11.06.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 06:05:36 -0700 (PDT)
Message-ID: <0e1ae53e-e2a9-44ec-a59b-432bbf8d4b49@linaro.org>
Date: Wed, 11 Jun 2025 16:05:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: mediatek: Fix a flag reuse error in
 mtk_cqdma_tx_status()
To: Qiu-ji Chen <chenqiuji666@gmail.com>, sean.wang@mediatek.com,
 vkoul@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, stable@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250606090017.5436-1-chenqiuji666@gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20250606090017.5436-1-chenqiuji666@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_060537_987550_D901FCE7 
X-CRM114-Status: GOOD (  14.06  )
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



On 6/6/25 12:00, Qiu-ji Chen wrote:
> Fixed a flag reuse bug in the mtk_cqdma_tx_status() function.
> 
> Fixes: 157ae5ffd76a ("dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505270641.MStzJUfU-lkp@intel.com/
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>

> ---
> V2:
> Change the inner vc lock from spin_lock_irqsave() to spin_lock()
> Thanks Eugen Hristev for helpful suggestion.
> ---
>  drivers/dma/mediatek/mtk-cqdma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
> index 47c8adfdc155..9f0c41ca7770 100644
> --- a/drivers/dma/mediatek/mtk-cqdma.c
> +++ b/drivers/dma/mediatek/mtk-cqdma.c
> @@ -449,9 +449,9 @@ static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
>  		return ret;
>  
>  	spin_lock_irqsave(&cvc->pc->lock, flags);
> -	spin_lock_irqsave(&cvc->vc.lock, flags);
> +	spin_lock(&cvc->vc.lock);
>  	vd = mtk_cqdma_find_active_desc(c, cookie);
> -	spin_unlock_irqrestore(&cvc->vc.lock, flags);
> +	spin_unlock(&cvc->vc.lock);
>  	spin_unlock_irqrestore(&cvc->pc->lock, flags);
>  
>  	if (vd) {


