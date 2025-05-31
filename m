Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ACDC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 17:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AbNlKkJboN5wZoU7ozNTe8jKHTn2i9ktrC3fw6ibsc=; b=H9CXYIjGdOpSybOThSHmsgQRS+
	0fMpPy4MKTNRmcnWILy3KHdZw8NyXPTpEhYGj74qmz/r3xot3Siv/Nb5EbzAboy2gdzuE+kYOxaOD
	sMuB5cn8/zPgG1riIRrkfLhpwdojKmeWXH8iLG6cNijEdgRIL0ObOhm1MteYJAFjnzsvdzTQX68aq
	NlzNogwjM3UgGalrDGorbM97TORYbBf7VD8tcWcueIIcirJa7UrGbMDINfGCjzK1+re7DjVihV0MV
	DzjmYEMlvXYRvBOc7kTm+8+zJtiQx6eaF0JHo2uRWThu8vzu1RJjbyWYD/ET/jb0tDKFkwNcN/Fb5
	aKdIJ2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLQNo-000000047Tq-3R5V;
	Sat, 31 May 2025 17:52:36 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLQLf-000000047NF-24op
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 17:50:24 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-742c27df0daso2450802b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 May 2025 10:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748713822; x=1749318622; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AbNlKkJboN5wZoU7ozNTe8jKHTn2i9ktrC3fw6ibsc=;
        b=ku3tEMw/qPwVUKGtLfMhDgvXihX7ZuPhL1JHcQJ7N0dC3yELrB+ltVEOdQsiAS/x7n
         jZhCjUQ3foayR9k+P2HllB8EcQGBaR/KV7HpseB9s0kJ9QqOEneJfbITfC14o133ifZX
         h6YumMsThlk5TvgB8sG6atgYyoNF9OIDHeaxty4+dc6QpIITy7uAFkR5v9OlNoFIqZnf
         TKNOOQj5NdYkblPyJ6JB1QkwQgG9UlVJP8/Hd9vpGdQocPKMO0u0aWH/rEgZ9sdoCyAB
         tJ6xvIooPbcZt8U5ahDMIOM0IpwaWp5AvqkNC6oPidQb5nNbWijnuHjM5o5K3p49gS21
         La9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748713822; x=1749318622;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AbNlKkJboN5wZoU7ozNTe8jKHTn2i9ktrC3fw6ibsc=;
        b=lmkMx4r87yp6CkZ1V3tOAeiN2habMYa7Azwumsu01TsCBpMGgHqf3BD82+LKujAg4z
         WDd2AoiSKjQS412+s9DhS2x/1f3QTEU1ZCReuAs8UQ62Shr6CGtTGJ7gdVmRcXgiagrK
         8u+2ENaJjn6WCufd066cppbMknp0Zl+n+1r/6rSDjZIyDc7SGGvXVrQw/SlxBD8O6L1r
         O9eGSSS77xw+Q3Ioth6PZKzHVD6ugfGqlq6+bP6GwVWoWf/H2T2QsmvVZ8bAvUnURrVb
         opgDJDhKkmVtIPnKBN75nDe61tjEu4tUyec6+CgWUZFKFnkTqwmyJj68+frLUSUH2BtS
         T0oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp+eWQzqzUiAr1deQqMYstYwu64e1VYvGazp1gKP4JgCLQrEve8pWfJycbIVr94mPlafpFdS7vkQfsnQYlA+nu@lists.infradead.org
X-Gm-Message-State: AOJu0YyPYhULRKwnMu2c7odXmelSJCTawSx8mbSaoaauvejstGEp3uZM
	F9VaFuX6sjBMg/YOfAsn6zMOzmA3E2afElBmpWgi8XYA6cNb5eu15vt50XeCOleplg==
X-Gm-Gg: ASbGnctkGvg29LbiZIqNSKeSCWeKwrnw333f/9a4dFppXRF951iK8C0UThBu0JadQX4
	IKBJfJxMHLL1ZwgwkMQiQ5iFKf5QvILiOPJr5kDXl0CDQFFJqoDrvDX/YTWbOuHmdg87QmDSjkG
	SXE0SowF2nYCZvTfmxL8QXJlMWMIGMvYCkbSNWx9lJcDUsS7pT0gYMvFEVr40Oezdumg0b2bvLP
	qH3AEBjhXBq9rUC5cR++byNJwfBiQwobMDPJZIG2Duulx4y3LWtP5x8U8iV2rlET5liNUJDMUFs
	4caKs7BOOlaXSp/Yalw18lK7f/F2q+zP0n1jDui0reVqCyD9XSto3bbWsXAeaQ==
X-Google-Smtp-Source: AGHT+IEdPK+JHZ+t44u8hV+Tuwo0Dn5k2WtHvYf+YRYNtFb+Y0T4pf/Gas2+IG+qUK9yX+xyBHPdxg==
X-Received: by 2002:a05:6a20:1583:b0:218:76dd:a66 with SMTP id adf61e73a8af0-21ad95636d1mr11124498637.13.1748713822539;
        Sat, 31 May 2025 10:50:22 -0700 (PDT)
Received: from thinkpad ([120.56.204.95])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb4834sm2748724a12.74.2025.05.31.10.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 10:50:20 -0700 (PDT)
Date: Sat, 31 May 2025 23:20:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: jingoohan1@gmail.com, frank.li@nxp.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] PCI: dwc: Add quirk to fix hang issue when send
 out PME_Turn_Off Msg TLP
Message-ID: <xq6ojgyh5tpm4zbpymb2wvtf4at3xq7bai3ztuublgh63e7qdn@vfxan6mew3os>
References: <20250408065221.1941928-1-hongxing.zhu@nxp.com>
 <20250408065221.1941928-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408065221.1941928-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_105023_538278_9D283461 
X-CRM114-Status: GOOD (  24.23  )
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

On Tue, Apr 08, 2025 at 02:52:19PM +0800, Richard Zhu wrote:
> When no endpoint is connected on i.MX7D PCIe, chip would be freeze when do
> the dummy write in dw_pcie_pme_turn_off() to issue a PME_Turn_Off Msg TLP.
> 
> Add one quirk to issue the PME_Turn_Off only when link is up to avoid
> this problem on the PME_Turn_Off handshake broken platform, for example
> the i.MX7D.
> 

Why do we need to send PME_Turn_Off if there is no endpoint connected? We should
skip PME_Turn_Off and L2/L3 Ready transitions in that case.

- Mani

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  .../pci/controller/dwc/pcie-designware-host.c    | 16 +++++++++++-----
>  drivers/pci/controller/dwc/pcie-designware.h     |  1 +
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 0817df5b8a59..a62bf7e0ade8 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -956,12 +956,18 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>  		return 0;
>  
> -	if (pci->pp.ops->pme_turn_off) {
> -		pci->pp.ops->pme_turn_off(&pci->pp);
> +	if (dw_pcie_get_ltssm(pci) <= DW_PCIE_LTSSM_DETECT_WAIT &&
> +	    dwc_check_quirk(pci, QUIRK_NOLINK_NOPME)) {
> +		/* Don't send the PME_TURN_OFF when link is down. */
> +		;
>  	} else {
> -		ret = dw_pcie_pme_turn_off(pci);
> -		if (ret)
> -			return ret;
> +		if (pci->pp.ops->pme_turn_off) {
> +			pci->pp.ops->pme_turn_off(&pci->pp);
> +		} else {
> +			ret = dw_pcie_pme_turn_off(pci);
> +			if (ret)
> +				return ret;
> +		}
>  	}
>  
>  	if (!dwc_check_quirk(pci, QUIRK_NOL2POLL_IN_PM)) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 05fe654d7761..d752af660e95 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -283,6 +283,7 @@
>  #define DMA_LLP_MEM_SIZE		PAGE_SIZE
>  
>  #define QUIRK_NOL2POLL_IN_PM		BIT(0)
> +#define QUIRK_NOLINK_NOPME		BIT(1)
>  #define dwc_check_quirk(pci, val)	(pci->quirk_flag & val)
>  
>  struct dw_pcie;
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

