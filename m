Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9933C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gznVwH+MYZINzbreoVjaIlyEQO9ArPaCcwj3cczf12Q=; b=2za9cYDm6mSt4noWcJFcpFNnXE
	fr3C064/0xihym7951UdmKArdxaLJQbMxktP0ufycdxZvNDYvxLrrLUOcerblGE1Oxa0KI3SUZC2U
	7u35HF+NfIepmysBXQfwnyV23o5HNjBrfoaZCO/WW2+6jY9nEI/7JDsPVuPVU8sGm2nJpB1kGBjf8
	SbFB3eYG7em6O81GA5iI8qM3FlB4bhP1fENLDYv0T4zfJSNodw6Chv7dHz4tc+n/VGpAJt5h8MgMd
	iLXfOa+srQJrGCCx6l4g0x9aylVXss+vRYk65rcv2LjIgjJmWlRgi7uArLhYRQriVCZO4R6eLIc5u
	Iid3XLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTfk-000000055Dy-23a4;
	Tue, 04 Mar 2025 14:55:04 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTcI-000000054Tg-1wQe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:51:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2238e884f72so51838745ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 06:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741099889; x=1741704689; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gznVwH+MYZINzbreoVjaIlyEQO9ArPaCcwj3cczf12Q=;
        b=SK3GCAUc6vFbgoWp1cl9uu6t2b5eiJC1UirYB+R51IjZRl2f4G0mtEwFr60FfWKdsc
         lj54YOVTilZ1vVSrmJKpjhiPKi8dTgJx3iOGAzi1Ls3vhWxZhXiRaD+RVoLx4aZQPjIm
         3/DqD1NJEr3k8QLZqQiBIVmaqf34y+wbF7IzuavWWlL1rsG2T2gP18HXP72AS2eXdk/B
         IpnhCz9sNiDeGU/s1joEge3sVY3IJvc7oFtmFkXEdmsF9uQcPQInarxH+Pru50UUnlKK
         nBxi8JWWqlnUskJixK1K8e8or9rrURs6huyHcjTVkxuiPdHvl/OJAo4DdSPv6CSqNs+W
         WIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741099889; x=1741704689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gznVwH+MYZINzbreoVjaIlyEQO9ArPaCcwj3cczf12Q=;
        b=b1gX4265ZwlCUCM82S/+0ePCNmnynUgRZQJfjJShnWn3omuhfsPFZZx2okOYGm9s7Z
         w9WRetuzljz4Zvkm9jXPK6zJMfg+SrGzglKDhXvYW5PBtiXLOYKNbQCJJlEGNkrXLXb1
         vP9SAZNKF6IY5TSKKuW499sGooL60GAvpu1i+xXOytDV3/zpMyYkHknarUmgs6G2aXPg
         ps+YHxlWSh0OosAtyd8aeIOkaqbOLePew/avjAr9QxWiJRhvaYNhIgKYbSdjxJzXH413
         eREgJP6JH3uam6mLvnkXuFmojpAVAl8GfOn3NsalLcbNDSbcg+Tsa/uMqo4gAcRqFcqI
         K48w==
X-Forwarded-Encrypted: i=1; AJvYcCWXyTuWXICnntVviD9o5WkqgFzKGcCfEdMoGvwBFj2cD1j+db0DKuIkdNl2pZTcYSL3eLA/PFJK3WPMLD4X+7SR@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ/zAkJmRW0KA38jCBTR7VM+SaoOSg8XqvplM6lvs3zCdTrM5M
	hUaZ18nDjSVftiVuVIPii8lZFEOEBzyLSuG8RAlQBo1eFYybrWcX7siHiI6Vwg==
X-Gm-Gg: ASbGncubsJaHeQIIFEuddCiIB9J8VUaR/Uon9OIs1Rq5mjzl3MbE4s/dMj2aTgcnAPn
	QMgvz84na5k05fxeloBnLGPn0SkZokx1t+9lz9omAz5fj2neyLiiEGlcGGrTCdsrfekSlYEiT+g
	zK7POWtHneACcboVFigW0qsRDeQzD0aJr7Z20/GOL6svgn+7RMU5+vU0mzcpECwZNOjMPd7Mkp6
	AgphhmmXhz7UUVk+gUXiMlBwtWlkpgV2YcnDM4ZAQYjnoNwVeQerqXtpSELGMBhoXuzqQ9h8ABV
	Art69aDQpq8Afjt0BoEF/60gw08COeuiqD8OVifAQ3cGMJ/TqA4BY2Y=
X-Google-Smtp-Source: AGHT+IFgqXki/xp/pRgDQUN3wwkxjCspLF0YwdBipW/dxQdQmaDNd9QyTywhiG7k4tt1FdiccdjR1w==
X-Received: by 2002:a17:903:fa6:b0:223:37ec:63bf with SMTP id d9443c01a7336-22368fbc8f5mr247045075ad.25.1741099888925;
        Tue, 04 Mar 2025 06:51:28 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d326fsm96562045ad.10.2025.03.04.06.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 06:51:28 -0800 (PST)
Date: Tue, 4 Mar 2025 20:21:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Jeremy Linton <jeremy.linton@arm.com>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/8] PCI: brcmstb: Set gen limitation before link, not
 after
Message-ID: <20250304145120.jrcxrvnuhj2cweyp@thinkpad>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-2-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214173944.47506-2-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_065130_498957_4893DAB0 
X-CRM114-Status: GOOD (  19.78  )
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

On Fri, Feb 14, 2025 at 12:39:29PM -0500, Jim Quinlan wrote:
> When the user elects to limit the PCIe generation via the appropriate DT
> property, apply the settings before the PCIe link-up, not after.
> 
> Fixes: c0452137034bda8f686dd9a2e167949bfffd6776 ("PCI: brcmstb: Add Broadcom STB PCIe host controller driver")
> 

Common practice is to use the 12 chars SHA for Fixes tag and not the entire 40
chars. Like,

Fixes: c0452137034b ("PCI: brcmstb: Add Broadcom STB PCIe host controller driver")

And no need of extra newline here.

> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-brcmstb.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 546056f7f0d3..64a7511e66a8 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -1324,6 +1324,10 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
>  	bool ssc_good = false;
>  	int ret, i;
>  
> +	/* Limit the generation if specified */
> +	if (pcie->gen)
> +		brcm_pcie_set_gen(pcie, pcie->gen);
> +
>  	/* Unassert the fundamental reset */
>  	ret = pcie->cfg->perst_set(pcie, 0);
>  	if (ret)
> @@ -1350,9 +1354,6 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
>  
>  	brcm_config_clkreq(pcie);
>  
> -	if (pcie->gen)
> -		brcm_pcie_set_gen(pcie, pcie->gen);
> -
>  	if (pcie->ssc) {
>  		ret = brcm_pcie_set_ssc(pcie);
>  		if (ret == 0)
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

