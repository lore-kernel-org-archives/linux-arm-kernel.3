Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07E2E6ADEA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKjam0B/w5hfD9V6wh4VdWDXNhOxELwdpw95PhwOCuE=; b=iD6CeGCGoTpXZstsV264lj8U+l
	LiMNmjQGykttxHRu4p9tQnPpIPeeDMxrzBVTu/P+iBQCRzFBOi+2ho3qyOcRFeTxQVlefInoQ/1sf
	zVpPBkhxF4HjyVe+MAq+VVtV10mBXEDEgtQtUwhDIIsK2jfY0s+RBEiWBmEJ8YJMJrnVVy+DOkNJO
	A2qx0qQuG+EX8klBmCtaYDz7GEHuBsRGsM/NnIzQbu8sj72vOJgmMaj8cyNabakfV6HrKweb8T9cI
	UjdysJTkJ9jzDlkddp2NGgDkg4Fc7pgm+vvd7bsiIGR+xasbqQzEpWFf7bwZXMc2SuE+teSaetJl9
	DF0UxkcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEmAu-000000040p1-3aBC;
	Sat, 23 Nov 2024 09:11:32 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEm9y-000000040hk-0mMN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 09:10:35 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ea568d8216so2480777a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Nov 2024 01:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732353033; x=1732957833; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKjam0B/w5hfD9V6wh4VdWDXNhOxELwdpw95PhwOCuE=;
        b=Rcgn4tfpHwYkko7o8dhYD+T1WNFX3qkVNhBivLqTTakgeDrYMnsPvh07WRrcpqnxir
         I049wseSpOCBWsB/jKO+drnR+dyf2YMjofoHknldpu97srPpBoevRMRGjn3RU76boXZ1
         BXN14fKy66tFrUd882Y/aiGCG8cK8c1fRMRXR74qGAiXZzNpD24yZYzwt1BGD2R7dkhy
         yNcCO0YV++kyrLapruB3DzuokygVG6l6fLsmOrm2JzoHXgsy5HXcvqgoWAjia711fUyj
         I7iDDulp8zbihp+mCUR4PidtGzFQAHfdajxKE6n2yf5bibsro8fcG3I3fTZ+2YP/wH+w
         9cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732353033; x=1732957833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKjam0B/w5hfD9V6wh4VdWDXNhOxELwdpw95PhwOCuE=;
        b=ZG/F3vgJdnxrDL3yUvGVchyCYKg+ZYMkEFnaUmynXZfBZmamuZmnQ2WHCDn7XU5Hly
         2r1jhF8BwLzT1R0ujDxhcQBeBw7IfJloAvlwRIbD/Sqdj5OMK5jzRmncmn8x3OLEzt2l
         upPWn2SCZixQO0CSC6788ZhEJpoQF6QP2zUIeju+2bN74PTRIk0RrCxvWGE2MF1hXzP3
         nZLjFmUjQ4smoa7GmVhZIBmHbz0Bt4mcIsetiFwhUQumeWE2YyHGnT30Nw133i/+iNOb
         h/BqQhEsRc1jGdOHLknotkBmnNHoMQq18x/Cdj5jwM/BEr5OM6Nx4yyIZGWV65j8k1i3
         gHqA==
X-Forwarded-Encrypted: i=1; AJvYcCXRdkgYF1GY+XsPLfhfiXq35OTMziP1siPH+wnoWRxxaKONcpJvQu8nKLB3Jv4JfA5x8nKsNTeni7hAUJu9+h3R@lists.infradead.org
X-Gm-Message-State: AOJu0YyIYyCBIYtST8GNsF+VVKhfWeeFy6yf+DP/b83gXXInrzz/7wn2
	Cx9hDKGpa2IVGZaY/UwanJ+chOAy+JXD7oOvDfvsG4PfFL74vcsXIW9ciHvxxQ==
X-Gm-Gg: ASbGncsVPlYpIJJHvOr0yRf4BHqRu++IysMkg6VUIOI4iWWJNt/PMEfZn44vyvs7O30
	syg8TsfIHONC+G64qxZTxJ65qmRbT/WjTiCBl2ZVEctvuNdTKGeqkam6ziw05TXOUpK/Xn0i003
	BcvEhqcUAKG3nsvP+lSXuoxy3PmXEIMpBqKNQpMJrQ1ldZRjb145/MQs7quXNajCqbpuOM63Yd7
	SMVHuv/pD8rSt9eF8H/X3J3nRENSGUcmqibwo9I2PT0c4bfuuLICEwN5gTF2rV/0Q==
X-Google-Smtp-Source: AGHT+IHj2ihR3OTEsdM875zHnE9nbqW0UuK2wW3/aojdIeu60uxcPJQ+XX/fzZd0wj3T8K2tm2vwLg==
X-Received: by 2002:a17:90a:d40b:b0:2ea:5dcf:6f5d with SMTP id 98e67ed59e1d1-2eb0e528054mr7801274a91.16.1732353033351;
        Sat, 23 Nov 2024 01:10:33 -0800 (PST)
Received: from thinkpad ([2409:40f2:101e:13d7:85cf:a1c4:6490:6f75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eb0cd35e98sm2942936a91.0.2024.11.23.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 01:10:32 -0800 (PST)
Date: Sat, 23 Nov 2024 14:40:26 +0530
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
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 5/6] PCI: mediatek-gen3: Add reset delay in
 mtk_pcie_en7581_power_up()
Message-ID: <20241123091026.qxoeb2qye7kcwikj@thinkpad>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
 <20241118-pcie-en7581-fixes-v4-5-24bb61703ad7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241118-pcie-en7581-fixes-v4-5-24bb61703ad7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_011034_241063_1B9AE215 
X-CRM114-Status: GOOD (  23.88  )
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

On Mon, Nov 18, 2024 at 09:04:57AM +0100, Lorenzo Bianconi wrote:
> Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> causing occasional PCIe link down issues. In order to overcome the
> problem, PCIe block is reset using REG_PCI_CONTROL (0x88) and
> REG_RESET_CONTROL (0x834) registers available in the clock module
> running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().
> In order to make the code more readable, move the wait for the time
> needed to complete the PCIe reset from en7581_pci_enable() to
> mtk_pcie_en7581_power_up().
> Reduce reset timeout from 250ms to PCIE_T_PVPERL_MS (100ms).
> 

and this reduced timeout has no impact on the behavior? If so, it'd be good to
state it explicitly. But this information can be added while applying the patch,
so no need to resend just for this.

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/clk/clk-en7523.c                    | 1 -
>  drivers/pci/controller/pcie-mediatek-gen3.c | 7 +++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 22fbea61c3dcc05e63f8fa37e203c62b2a6fe79e..bf9d9594bef8a54316e28e56a1642ecb0562377a 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -393,7 +393,6 @@ static int en7581_pci_enable(struct clk_hw *hw)
>  	       REG_PCI_CONTROL_PERSTOUT;
>  	val = readl(np_base + REG_PCI_CONTROL);
>  	writel(val | mask, np_base + REG_PCI_CONTROL);
> -	msleep(250);
>  
>  	return 0;
>  }
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index e4f890a73cb8ada7423301fa7a9acc3e177d0cad..f47c0f2995d94ea99bf41146657bd90b87781a7c 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -980,6 +980,13 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  		goto err_clk_prepare_enable;
>  	}
>  
> +	/*
> +	 * Airoha EN7581 performs PCIe reset via clk callabacks since it has a
> +	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
> +	 * complete the PCIe reset.
> +	 */
> +	msleep(PCIE_T_PVPERL_MS);
> +
>  	return 0;
>  
>  err_clk_prepare_enable:
> 
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்

