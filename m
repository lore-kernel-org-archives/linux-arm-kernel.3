Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9438CD6DDEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6LO4Usr4YLCJ7gfFHS9SsbF18mDXFAaRhBjtGDvUq4=; b=N9hiy0AiNqZlZF+7zTSntYIoze
	FSOUle26KVRFH7DTnMMD5ljcXA8//OoJ2JQD4Xeka5h+y5bnVt0LkKo8theySidiyDMfheLwzIJgT
	BiKh9aWIunyTJvpHQNDN6/cKLa4gtOlaCmwvUBNM/tWXmmou915U8krPRHf6e/gD8iXi6rOEeJtIR
	8r3gIKMnntsL3v27AUYpNj2EJ7E/y0oD57L6RG5uxaz1JeNXls7GoPn9EsX/k501juaL93T6O+6I4
	hPjocz9f61/+0dTowQwP/uSKQ0yRmQOxKkPPw6+/ieOnfiEBfA5/dSu6mQrdp/6VLhU8BeM1jLAdM
	pVH2kfiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsCM-000000027Ov-22h3;
	Fri, 15 Nov 2024 09:01:02 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsBR-000000027CU-1cqE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 09:00:06 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7246c8b89b4so1033433b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 01:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731661205; x=1732266005; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c6LO4Usr4YLCJ7gfFHS9SsbF18mDXFAaRhBjtGDvUq4=;
        b=CvdskNCn3it2elC2hjfgM/onx5zNWchHdapqfxllGuaPDnp4xCm1Ygd4WPll0li8yA
         MhsEb+DSudikV5QxiprhIMC6hgXXxxTazvDZ8G6oIHjgMZcVYLXx8QStzWUG1HZamsQ4
         8JJcsCXRP2c6CTcIkn8dIrhxn2XJU3dgA3zvS2x/504pjILWjAKl5dZ7Tejw2XFtKCer
         S50MrCtYj86mY+ewpS4SmpLEVqqJ68gh6IfPRse4JkWGXbK6cn9VdMUEnOP3ZijKR3lc
         ertNxntcOFl+3mOeP3Xkv3Ab/ztjBU8JUNOUNAfB7ODoAcbfQOelAOwqYLsRLcIMKWUi
         9SXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731661205; x=1732266005;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6LO4Usr4YLCJ7gfFHS9SsbF18mDXFAaRhBjtGDvUq4=;
        b=xC2uFa0foCrsIk3tvs3u5A4bZ457ewlTA+CeqPZQB/TPCNHuz8+cxJ2zJniLjoqPkL
         /qHzK/sNKZ2aGJYVXdoijjEMthVNSoYNvUiNmkagqTj4loWGrszUXNQcQzJ60BJv7ZMF
         RkJCTbQ+c7b3w/djakuggVaXFYj5+N0Kx6GHY8kmR4Z7PfT617DoO7QsyOffG3cWCYyN
         bz5q3LVGt2UOnX5+It9kItHG27cv2Ch1fX+uwQYY0gwTiymrJ7AXz+P11yMrSK/vPGOV
         CsVxxdzuZ3aox0al0uOJjPi89mDHelmiu0xCh/9YBD6BCyN1jcgbEk540x30iIWX7f5H
         Np/A==
X-Forwarded-Encrypted: i=1; AJvYcCUo1IHxzSOYoCZaa9YeWfkr7tRm0l7Z1A01UK9GJNg8TsPwVPok5bpqvMNX/EPIikhYqSEkXf3oPK/4ZDeWs3/W@lists.infradead.org
X-Gm-Message-State: AOJu0YwNVzYXTKXht2WOXl7GIaKjCwMBOOzbp+TD4QVGITne9KYmCX2D
	Re6g9FRv3IV3InPTiKTSkEy/UA1iMw0XpYimF38gnCw4xolHpdd2TTqDRulJnw==
X-Google-Smtp-Source: AGHT+IGXzc2k85nHigsVQvGCV/dEUXykSPtZP9SAjYxa8cXADj5jMo8+rVoyKMXLZcK2JnJ73FDM+Q==
X-Received: by 2002:a05:6a00:21ca:b0:71e:44f6:690f with SMTP id d2e1a72fcca58-724760cafa2mr4071933b3a.8.1731661204509;
        Fri, 15 Nov 2024 01:00:04 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724771fc665sm883611b3a.173.2024.11.15.00.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 01:00:04 -0800 (PST)
Date: Fri, 15 Nov 2024 14:29:55 +0530
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
Subject: Re: [PATCH v2 2/4] PCI: mediatek-gen3: rely on
 clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up()
Message-ID: <20241115085955.dbhi2v7qfuq3tmr4@thinkpad>
References: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
 <20241109-pcie-en7581-fixes-v2-2-0ea3a4af994f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241109-pcie-en7581-fixes-v2-2-0ea3a4af994f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_010005_464401_D7B0B9CF 
X-CRM114-Status: GOOD (  19.07  )
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

On Sat, Nov 09, 2024 at 10:28:38AM +0100, Lorenzo Bianconi wrote:
> Squash clk_bulk_prepare() and clk_bulk_enable() in
> clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up() routine
> 

Perhaps use something like,

"Replace clk_bulk_prepare() and clk_bulk_enable() with clk_bulk_prepare_enable()
in mtk_pcie_en7581_power_up()."

'Squash' doesn't sound right since you are not squashing any code.

> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 0fac0b9fd785e463d26d29d695b923db41eef9cc..8c8c733a145634cdbfefd339f4a692f25a6e24de 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -903,12 +903,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_sync(dev);
>  
> -	err = clk_bulk_prepare(pcie->num_clks, pcie->clks);
> -	if (err) {
> -		dev_err(dev, "failed to prepare clock\n");
> -		goto err_clk_prepare;
> -	}
> -
>  	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
>  	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
>  	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
> @@ -921,17 +915,15 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
>  	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
>  
> -	err = clk_bulk_enable(pcie->num_clks, pcie->clks);
> +	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
>  	if (err) {
>  		dev_err(dev, "failed to prepare clock\n");
> -		goto err_clk_enable;
> +		goto err_clk_init;

err_clk_prepare_enable?

But I usually prefer err labels to be named after their purpose. Like here,
'err_runtime_put_reset' so it gives the reader a sense of what the label is
supposed to do.

However, to keep the existing sematics, you can just name it
err_clk_prepare_enable.

- Mani

>  	}
>  
>  	return 0;
>  
> -err_clk_enable:
> -	clk_bulk_unprepare(pcie->num_clks, pcie->clks);
> -err_clk_prepare:
> +err_clk_init:
>  	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);
>  	reset_control_assert(pcie->mac_reset);
> 
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்

