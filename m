Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6BEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 11:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3k7fvz1tmhIjGgQ1ycjom2LPIMfNTsp0uqFM8k2kiw=; b=p/dRcI8PzBm+teTX6B3Cz1zUWH
	++QMaRrfb4f9QXWxy+bo7J8eK6zhhUvgzitVYcDaoDXomcFXipRmQQ1C9M3V7pwecrlwa0V3IGoGm
	WUvai4cjQNpiUDAgjs3GlVWIob4Dl8qKn/0ZY+30M6rFCPcz2w0hNNfjSpk3DwAyoOqms5aWgSEcV
	ULOCzSGAmp3f+elNSuOpkI7mnN2JM12+xCkoLRfpPFxzMkyagIMJNDn5eN4f1hjz967mL6JHwgqX9
	8ddAt+Q2rRq4YOdJ6bsO4YrkdxqmJ8XxKvelP8gJK9VRhU2auftxt4K0z1zNSsahwBi4qgZEFqxbZ
	VDX/yrog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3cl-0000000E4Zt-3JG5;
	Fri, 14 Mar 2025 11:54:47 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3aN-0000000E4NU-0ZVt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 11:52:20 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-224019ad9edso51429715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 04:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741953138; x=1742557938; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q3k7fvz1tmhIjGgQ1ycjom2LPIMfNTsp0uqFM8k2kiw=;
        b=lFDSqmWu70mhAR+As5jwMxny1FtxIjX2N7ADc3LCjFY237crcqaJ9ag6QBnIUEqlfj
         B7ixSYSDI42u3N4XlsIiV8NfnMlzveOrCIbuBl32aehwkKeSha7pg6x7dTga6Q/d82f9
         iJSSQReK/mIdGV0PHNeWEdq73hZVTi/ZIIxLIogct+zuuyCQ4nL2Id73GqgQTdzP9Wfo
         YV8ZLUZKepkpAcO6tBdy6Xo+DlH0Rv7m7fme8w6yMCEK5Ecfw5mC53uOWRoY95Srvg+q
         jskgnk5Da43Y5PN+/Z+pjbMVPbMU/e6EozA6Fmkg4Mqtpsz2aAeBm1bFJ19RzAjRXVoa
         KekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741953138; x=1742557938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3k7fvz1tmhIjGgQ1ycjom2LPIMfNTsp0uqFM8k2kiw=;
        b=sA8vCDgx2FbgqEBN4LYFHsgbYQRVMI94zTGad/NIF8unSQbRb7y2+NfNiEcnv+rWII
         GsJJmEhBSxp24TxgUVAxH1H4TDO/Gmd+eZeW2yez972dqwJyMmlw4NnNeGNxU2NpfE1B
         pngfZTI8Su0LbbXl65QxWbWLgepYKZM1hvSS4ACPjg1FHcSTRFr4VSOCJwqSqqEDVilp
         ORDWJQYJkwqYzm9QrdkehIZAwttzIU/sxYJdA46BJZjhoCUEoFeOKi84OWkWQDlJ7coh
         CDdTw5Kw54riL1YtmgZHHl1gfhzfzOHA48nByfYLZnhnA+ENeRZCgTsaVtO6GQzAC4HF
         b/+A==
X-Forwarded-Encrypted: i=1; AJvYcCXtddcJgHIB+zk7b/mo6VkAH/yXiQHfhro1brgYoOlIj7KzyBZA8KJJcr90k+wpcoSA5T+f+ssPi65KrhlECrNu@lists.infradead.org
X-Gm-Message-State: AOJu0YyhJePPyFVxyLOMwD+q+K6PReNFT/02n73Bekade+uk+DQZUALT
	WJ99OdAfZ6ZaJVYCML+d50kdv97yFmdlJ9uROuRxRRfRPWqjZjLNQvZSp86gDA==
X-Gm-Gg: ASbGncucG0UZGO3gZO7sK8xVx8dTidNzlBvU3AVG0qKVJKVfgxEBeNgCfQY3pKwoc6w
	A1LEO5xlddMEA6w4pnZ4RPvvAqPdPm4Bick5OxxrwzGdRzXmgd7FkPaUTuAByvrvecOPaNuGK7N
	vLFAMXSDUE7jYEFZQvSNuATIEQVMKvJJg7kYLCh7gFTYUq6LmphSrY55ZQrnNR4HolfgGfDRGHV
	f6nYYCqfX0AVDcGSe8/RPztIfbTecQcdgGWiMlrv6aBhJLEKYQyKBYdW85BIb1C6MAYWubBB9J9
	RQm6UxPDPV2chB4ei3RKSdU8/WrFTdGb38DI7eViQbXPxazkvD1QcpNQ
X-Google-Smtp-Source: AGHT+IG5j5a+pzEwcsJNmm0hEeTrp2CuiBSxB3Ea66ul7lGwBGWPT/QsbfK1PDyEJKG9pn3UaFiZdQ==
X-Received: by 2002:a05:6a20:7f8d:b0:1f5:80a3:b008 with SMTP id adf61e73a8af0-1f5c13165c8mr3802766637.32.1741953137749;
        Fri, 14 Mar 2025 04:52:17 -0700 (PDT)
Received: from thinkpad ([120.56.195.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115295e5sm2751523b3a.23.2025.03.14.04.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 04:52:17 -0700 (PDT)
Date: Fri, 14 Mar 2025 17:22:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 0/2] PCI: dw-rockchip: hide broken ATS cap in EP-mode
Message-ID: <20250314115212.ywlee4vyuxyq4x6s@thinkpad>
References: <20250310094826.842681-4-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310094826.842681-4-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_045219_169143_1E0EF8A9 
X-CRM114-Status: GOOD (  14.42  )
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

On Mon, Mar 10, 2025 at 10:48:26AM +0100, Niklas Cassel wrote:
> Hello there,
> 
> Address Translation Services (ATS) is broken on rk3588 when running the
> PCIe controller in Endpoint Mode.
> 
> This causes IOTLB invalidation timeout errors on the host side when using
> and rk3588 in Endpoint Mode, and you are unable to run pci_endpoint_test.
> 
> Solve this by hiding the ATS capability.
> With this, we do not get any IOTLB invalidation timeouts, and we can run
> pci_endpoint_test successfully.
> 

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> 
> Changes since v2:
> -Added missing EXPORT_SYMBOL_GPL().
> 
> 
> Niklas Cassel (2):
>   PCI: dwc: ep: Add dw_pcie_ep_hide_ext_capability()
>   PCI: dw-rockchip: Hide broken ATS capability
> 
>  .../pci/controller/dwc/pcie-designware-ep.c   | 39 +++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h  |  7 ++++
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 27 +++++++++++++
>  3 files changed, 73 insertions(+)
> 
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்

