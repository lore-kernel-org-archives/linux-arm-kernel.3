Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE9BC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usHmxHbXCM+dAW0xD/QM+lICH9ZjXWjSDlg+5wMOzf8=; b=FF+Qorkrb+CG/zs04dGGNHVJcb
	DHCQLztovivhvTpaoPPaAritOyFOLq2IbgKAaYGRRHl4n1V+x11ZnN03p7/05YwCn741AZejem2HO
	ejkDMVWfCBA+6vWZOo/Udeg1qDbh362hvd6yfPo/SDQNO6H4pZ5kh3fIsJwoPx2zuMWEAtzWn9cj1
	1kLUdI0N3muz91ENZcIpANWDGjR2Q5uW32dwGNMtK/RJktkvvqr0IRy7XOyME66D0ijKwW1IkcnQu
	MTFL5pvDeM2TLIl7semRY2vatJ+F32piR5oHPrOFsHLOy+zE3t4/WsbDvNKiMOWNsHPoPnOQaQ5GD
	6kUlSXIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2P0p-00000006I0K-18sT;
	Wed, 09 Apr 2025 06:34:15 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2OwP-00000006HZg-0XVM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 06:29:42 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-af9a7717163so6326182a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 23:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744180180; x=1744784980; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=usHmxHbXCM+dAW0xD/QM+lICH9ZjXWjSDlg+5wMOzf8=;
        b=CdEBGhphlxJou6jHFVplKUeb2cZ1WCdfM0jB8AbNCH1gTv56a2XJ1dMMnWMvLznQVS
         hoFoIEkWjaBSIfFDARr6ZcCUj4gue+RTCSWBBixV5F+5fPTTQ31GvB23/t6q03AsrDHu
         9QZyuNpZ1oJm9pc3Ya6AXrssoo6Jr8BkxX0a1tLM1qzjh0VotOL7Il3iLdyxyPbuRT2k
         SoWGRq+74TZx2xF3jXteyrLSn2v710oHiYZbfN3R4y8tMUhCIydzHrlj3wsfFTvByEwS
         w1rlOmJTng+yr2JEEb+MEvTdw9P96EtpcPHSyKiKvV4t1INlvdvevE0+lE7cbqp/SIG3
         Wn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180180; x=1744784980;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=usHmxHbXCM+dAW0xD/QM+lICH9ZjXWjSDlg+5wMOzf8=;
        b=FXAJL+PNS0DJMyH/ljPI7xk84ihZx6u0GoziUyQCHvGIXRPtMOoOxSam5lpspqM0vc
         wX6MgKl7DI2irbKI+ry45uCi4zA8gPRj3i0PO3qCvDj6e4ILZ4makszpaPUlK9WHWubt
         HWVNdInmVN5kr7M7bFa3uOb6+ITbHg8ML0SzDHEQRAC/VY/zBh63f/k9dLVjATzqo9dR
         1p7bcCvdlKfMHItGt3rEEQtow8EQzB3ikzWy4QeWmEUIPxIidKl1hZtvrmcj8QJKdPZl
         u9k0Uyf5iF9qfn8uQQjSmjaXde92dKNcfrSR2jxkJZ2/lMwcRyzRP8X8/SET6HqRSIUM
         3mrg==
X-Forwarded-Encrypted: i=1; AJvYcCU0uVaTDmA1tOgKh10EwZU4x+ZaDShwPRpEy/ZLuW1iMZoP+8FvUi8YriFq7QZ+AwzGo9LtNYx109h+Ac2wHlhg@lists.infradead.org
X-Gm-Message-State: AOJu0YzPAlw/AlPiM0aaFj8T03balj9WuepdbNeeUE/Z8SqTfC/uoIMM
	rPeC6f1anog9QBhsKD0ZZ0aocIttdA+kFL8yotmUVZRy9KICOYiWZihdT6VH0w==
X-Gm-Gg: ASbGnct3M6K5flrOYhpiJwgkHxjt6U9qoCHeXDrGIGr1WimqkZ6s12+glRtTW7cee8a
	pfCJJ5YJe/JaPt2ouxtYjwo/RpbjuIAT1FEtrOyjWS4WgbasML2c4RhDDeQGbi27zvtGWuJEO1w
	gjEIAAIRZRz4temW7eoOfl8wAiCcghzmx/NBYaa7/kqp/fP0zNzfz45IH8fWtu2dgrlrn5E5w2b
	sflzc12sfCf4ytofJLRJzmfTxuzgFHr1rlwUbApmcpno+Fx/Mr21iWTZvCY+aRLA3OIzd6iMWa2
	o+1FFRpMGENt/AdWLnTs0ns28+nUZH5kUf2fnmfv939Eaa88h/c=
X-Google-Smtp-Source: AGHT+IFMg3stzRdVMVbjl7VIfmZ5+DK7eVP2nR526pWDqOTgCQzPmJ9NitfwkUXy92kR/MtVTv0MhA==
X-Received: by 2002:a05:6a21:8dcb:b0:1f5:769a:a4b2 with SMTP id adf61e73a8af0-20159195613mr2687257637.17.1744180179850;
        Tue, 08 Apr 2025 23:29:39 -0700 (PDT)
Received: from thinkpad ([120.56.198.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e51f48sm496746b3a.147.2025.04.08.23.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:29:38 -0700 (PDT)
Date: Wed, 9 Apr 2025 11:59:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org, 18255117159@163.com, 
	cassel@kernel.org, wojciech.jasko-EXT@continental-corporation.com, 
	thomas.richard@bootlin.com, bwawrzyn@cisco.com, linux-pci@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2 3/4] PCI: cadence-ep: Introduce cdns_pcie_ep_disable
 helper for cleanup
Message-ID: <vaqnrp46asxjiqjefajqfeqcp7kjhcelc2nabilrgjdqevwncj@i64fd7jt5gil>
References: <20250330083914.529222-1-s-vadapalli@ti.com>
 <20250330083914.529222-4-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250330083914.529222-4-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_232941_183865_F2377F99 
X-CRM114-Status: GOOD (  18.80  )
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

On Sun, Mar 30, 2025 at 02:09:13PM +0530, Siddharth Vadapalli wrote:
> Introduce the helper function cdns_pcie_ep_disable() which will undo the
> configuration performed by cdns_pcie_ep_setup(). Also, export it for use
> by the existing callers of cdns_pcie_ep_setup(), thereby allowing them
> to cleanup on their exit path.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
> v1:
> https://lore.kernel.org/r/20250307103128.3287497-4-s-vadapalli@ti.com/
> Changes since v1:
> - Based on feedback from Mani at:
>   https://lore.kernel.org/r/20250318080304.jsmrxqil6pn74nzh@thinkpad/
>   pci_epc_deinit_notify() has been included in cdns_pcie_ep_disable().
> 
> Regards,
> Siddharth.
> 
>  drivers/pci/controller/cadence/pcie-cadence-ep.c | 11 +++++++++++
>  drivers/pci/controller/cadence/pcie-cadence.h    |  5 +++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> index b4bcef2d020a..ffd19cb25eed 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> @@ -645,6 +645,17 @@ static const struct pci_epc_ops cdns_pcie_epc_ops = {
>  	.get_features	= cdns_pcie_ep_get_features,
>  };
>  
> +void cdns_pcie_ep_disable(struct cdns_pcie_ep *ep)
> +{
> +	struct device *dev = ep->pcie.dev;
> +	struct pci_epc *epc = to_pci_epc(dev);
> +
> +	pci_epc_deinit_notify(epc);
> +	pci_epc_mem_free_addr(epc, ep->irq_phys_addr, ep->irq_cpu_addr,
> +			      SZ_128K);
> +	pci_epc_mem_exit(epc);
> +}
> +EXPORT_SYMBOL_GPL(cdns_pcie_ep_disable);
>  
>  int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
>  {
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
> index 0b6bed1ac146..387174d6e453 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.h
> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
> @@ -555,11 +555,16 @@ static inline void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int d
>  
>  #if IS_ENABLED(CONFIG_PCIE_CADENCE_EP)
>  int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep);
> +void cdns_pcie_ep_disable(struct cdns_pcie_ep *ep);
>  #else
>  static inline int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
>  {
>  	return 0;
>  }
> +
> +static inline void cdns_pcie_ep_disable(struct cdns_pcie_ep *ep)
> +{
> +}
>  #endif
>  
>  void cdns_pcie_detect_quiet_min_delay_set(struct cdns_pcie *pcie);
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

