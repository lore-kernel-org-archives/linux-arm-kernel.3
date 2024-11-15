Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB6BD6DDEA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 09:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vlc2jQEHSnRz323s6X4ls2WiMLcG19WhHp5TCCtCt1Y=; b=Nm9x0lfq7pffttMMxpTcm27ijX
	YsgTOrbidSF8vEhJBOp4PraZcKsNnSGhTaX/GUHsKO/Tl9s7NXESt0iWs+Xzv8mPNbPeFW5+LcjkL
	6jxac3/hRpmvY0gdnilfRI8qPyDN+LMd+byMQZ75exU8cahmBAa3vb+vnvK5LPo11dEGSOIbMoyXZ
	KsZgESHeFeEt2na1wIVG1dtPwzyb9QDvBde+YqAavWuSb9R1QxWeTkrLp6503a0sJlxJe2DLytG10
	UmCx4YIQZVdc5K4ZxJ0bhFxjexFYoqECeyR82ITGZYbNuoUldtQ4Zufw6DYfxltByeZoJ4A+SW4gJ
	M7/Ou9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsHt-000000028Le-2EnZ;
	Fri, 15 Nov 2024 09:06:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsGx-000000028Em-3YPO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 09:05:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21116b187c4so13103135ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 01:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731661547; x=1732266347; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vlc2jQEHSnRz323s6X4ls2WiMLcG19WhHp5TCCtCt1Y=;
        b=IhD6OgxwOp3U6jaBksGYXYM+aAyT4Mi0B/7hEPVeIKBvhEkdSazIxpJyZh5Qpc6K8i
         qH4iaqJxgLqwaH7G4yLFpkZu/umIjTcOf4FOMqM3wsstS8FM/nGJNcuxVvzvHGyzLrnW
         NAEqkv6JSWys8YxnfbQS7HWkPAEbz7QLkGlfDu5C1FiQXmovgcSo9YwuGIDwug5U8vQ9
         Rz/nWHeT0+q+kx0zR9c3hp3ybuwwd9m8nSrrrW7CYG69mfg2v0m256lp+5I5vNmalqX5
         hSqFm0e/BKnAYl63SvUgqy02o7vpq8PBjsTceSGXmPpS7+YtJYX5LHcgP3fDwFZ1XCxm
         qoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731661547; x=1732266347;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vlc2jQEHSnRz323s6X4ls2WiMLcG19WhHp5TCCtCt1Y=;
        b=uRGCWhLrGH4nPwfzlQ6/EcQDZYQmhR0KhyOOe3lZV1/XC3FG9K6o8XQH3BLu2oLyFE
         SiWMYjjrfY3+L7HsMQmOh5OugdASVitSUCipLtILCu0npUcuIDsQIdFa+3WLvVLG2AXG
         ISInlYs+aBH8tIGR6fsPcmz3RljThANmw1WRPtSeojUnCKNqItAtUeKtIjLpv2AuIXfE
         UICnaE2SZ5omd3bYicP8V8ilq6dSjqwNdzgKrH36JTOiqSrwHvKxUXbROFVeWBDxwPL5
         F1K1fi05/LHg2bWqzuCqOXMMrm94zHeBNIX45bCXz+aRjruzi60RJ85GEuNiTJ5vPHF6
         MijQ==
X-Forwarded-Encrypted: i=1; AJvYcCWliC+1Lnx4pSbOp1XgcqiLPbnZDWMEe4EoFzhtz+E3+m/9Z7COEmaL4fm2sA3rU1aZcp5UevXhu3lFS9ix2oI5@lists.infradead.org
X-Gm-Message-State: AOJu0YwR3EmrDKvGYOeXEnPA8B4yMT22MCZ1vNLtvAwxlUClbBgVr/X2
	j0Rym7Q+UoIH17fwil/clDQpDUofKZGGCk+U72oUV3pLTDBSELq8fUQHQxmiDg==
X-Google-Smtp-Source: AGHT+IEPnyKbtklUqZrKwBgsowtsFMFCMVl2PnJWMT7KygVn0rUWNJaaV7mVXWA6FXcxMjDgHklzTg==
X-Received: by 2002:a17:902:fc4d:b0:211:31ac:89eb with SMTP id d9443c01a7336-211d0d5f589mr24586035ad.11.1731661546846;
        Fri, 15 Nov 2024 01:05:46 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f4685bsm7912705ad.201.2024.11.15.01.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 01:05:46 -0800 (PST)
Date: Fri, 15 Nov 2024 14:35:38 +0530
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
Subject: Re: [PATCH v2 4/4] PCI: mediatek-gen3: Add comment about
 initialization order in mtk_pcie_en7581_power_up()
Message-ID: <20241115090538.3yx7vr5oeckz46uq@thinkpad>
References: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
 <20241109-pcie-en7581-fixes-v2-4-0ea3a4af994f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241109-pcie-en7581-fixes-v2-4-0ea3a4af994f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_010547_892187_A675541F 
X-CRM114-Status: GOOD (  18.11  )
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

On Sat, Nov 09, 2024 at 10:28:40AM +0100, Lorenzo Bianconi wrote:
> Add a comment in mtk_pcie_en7581_power_up() to clarify, unlike MediaTek
> PCIe controller, the Airoha EN7581 requires PHY initialization and
> power-on before PHY reset deassert.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 1ad93d2407810ba873d9a16da96208b3cc0c3011..c9981013e59d18ccd3294acdcbd536dd95a0e436 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -884,6 +884,10 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	 */
>  	mdelay(PCIE_EN7581_RESET_TIME_MS);
>  
> +	/*
> +	 * Unlike the MediaTek controllers, the Airoha EN7581 requires PHY
> +	 * initialization and power-on before PHY reset deassert.
> +	 */
>  	err = phy_init(pcie->phy);
>  	if (err) {
>  		dev_err(dev, "failed to initialize PHY\n");
> 
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்

