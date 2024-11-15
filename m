Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08C8D68BCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 16:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1rLKs7XMafDwKPJur3KVVVuDZ+Nk4nB0R3fvhHVGOI=; b=IjrXpQwHw51gwx8saNOHYsh8FT
	oZz42U7va8dL5qQti9Cjn+89oHtDFEZgvt071AcbnzvJ2VdjZW+tJ9RAPpEj3U9LLpGi+uhPLtpeO
	OK3QHhYdABDJZ8IX2/1k9+ANdE6dvlRfo00csgmftQPkHiP0c0EL92Su39aF/QZYMfSURbH76PqY+
	82U0bBRu8p28dqs2EWl4u4lW0kX4iu42WQ8xPF69b7rsbovaC4MBOWNZiX5u/Q7Mw1eqJGEurGmuy
	6F25z5xoRrnX5WLMAPcEQzCJoTCe1oskdF9D8b/RJtxVVDlnC5bY1IC2Nqb/OobFduhbFQNrQMm1U
	+NdVYaSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzJd-00000003MhD-1cu9;
	Fri, 15 Nov 2024 16:37:01 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzIh-00000003MV6-41GW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 16:36:05 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7246c8c9b1cso1425730b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 08:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731688563; x=1732293363; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A1rLKs7XMafDwKPJur3KVVVuDZ+Nk4nB0R3fvhHVGOI=;
        b=IhmDd9t6Vj9J21LaRuzdEhcDc1tApOovoio5+I3TaxJ4dObzO3WXI9CRYijr5O3r/X
         25GvbVI6Ivbd8Zh/JarxRBMmk+Ux0bp7moC1pt//GQFLoby4vPYPLZHrYSNgeZTqURik
         wxU96Ct4y1/9dES57R6R74L2FGFKTOPQr8QYDn+bYcNsZhAP43xhFBdWyjPhCj8z1gfL
         6pjZUaEGviPYaHl0bgbHCpyuAOWUg+6zF51T5ZdD2efg6WHR+pB3e0IR1DgtC1vDM/i9
         fJWWpS2UWJZ8OYyMR27jDHFQhEGKONWTxslR05ciJGZkaqfRbGeViM6j0+0gOacvbrEu
         WGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731688563; x=1732293363;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1rLKs7XMafDwKPJur3KVVVuDZ+Nk4nB0R3fvhHVGOI=;
        b=bjQVcf8MM4OenQHWYHi3m1IMbredNC1uDdpyBChitEekYHR7T1Wb4jCXRlh3q79V5g
         5t/zR/PxDOV2iNULqPWXRZNdO8jdhwPohqFgNVZNoTjfx9CDxLL5YWm+xlmXI3AykjSo
         5UdKTnUPL+kiRUlch64EZmM3AjQxBtpP0Wm9JzBP/T6+sq+8CC3L02NNxkRs0ItdCDrX
         f2Kd/C+hF3Gj+lbN+mg+yl6wUdJ/KCGzhnbKbqs3cPZySOjjfQEtgEJMm/kOQB5Dn/rm
         DdCluXMKrEon7iO0p/7kjBJrvPdmazwQHJ+ugGlaGkKSVVs8uNvlUIpH8xHbG8pLs+2h
         mckQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+H5eb5iomIxx1zOoe5EOUu635cv4NIrER7sTfpkGKDCc29qq2oR6qxVviashX9yjC168OSSmcbH3t4nNw2Vw+@lists.infradead.org
X-Gm-Message-State: AOJu0YxHKDbm6Oc1FCSgWZkND75NiRXM44fCIHAGN1tWHqt8AHaDMGtu
	246H0F49cx7TY8NmKNVkQqxFRDBxp5YW/MKX8V8p+z/FRBktWbS3RCR3d98nmg==
X-Google-Smtp-Source: AGHT+IGFnW6rFMw+hHUnNFuHyJmsLi6k9X5/Gsoh1t7i3szUhNuaPDcIgnR8yPSEXL5+AmJiguW+3g==
X-Received: by 2002:a05:6a00:b56:b0:71d:fb29:9f07 with SMTP id d2e1a72fcca58-72476bba9femr3943662b3a.15.1731688563135;
        Fri, 15 Nov 2024 08:36:03 -0800 (PST)
Received: from thinkpad ([117.193.215.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724771e8ad1sm1533972b3a.168.2024.11.15.08.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 08:36:02 -0800 (PST)
Date: Fri, 15 Nov 2024 22:05:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v7 1/7] of: address: Add parent_bus_addr to struct
 of_pci_range
Message-ID: <20241115163552.mk7msyu57oqqetaw@thinkpad>
References: <20241029-pci_fixup_addr-v7-0-8310dc24fb7c@nxp.com>
 <20241029-pci_fixup_addr-v7-1-8310dc24fb7c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029-pci_fixup_addr-v7-1-8310dc24fb7c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_083604_002106_F828E56A 
X-CRM114-Status: GOOD (  24.26  )
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

On Tue, Oct 29, 2024 at 12:36:34PM -0400, Frank Li wrote:
> Introduce field 'parent_bus_addr' in struct of_pci_range to retrieve parent
> bus address information.
> 
> Refer to the diagram below to understand that the bus fabric in some
> systems (like i.MX8QXP) does not use a 1:1 address map between input and
> output.
> 
> Currently, many controller drivers use .cpu_addr_fixup() callback hardcodes
> that translation in the code, e.g., "cpu_addr & CDNS_PLAT_CPU_TO_BUS_ADDR"
> (drivers/pci/controller/cadence/pcie-cadence-plat.c),
> "cpu_addr + BUS_IATU_OFFSET"(drivers/pci/controller/dwc/pcie-intel-gw.c),
> etc, even though those translations *should* be described via DT.
> 
> The .cpu_addr_fixup() can be eliminated if DT correct reflect hardware
> behavior and driver use 'parent_bus_addr' in struct of_pci_range.
> 
>             ┌─────────┐                    ┌────────────┐
>  ┌─────┐    │         │ IA: 0x8ff8_0000    │            │
>  │ CPU ├───►│   ┌────►├─────────────────┐  │ PCI        │
>  └─────┘    │   │     │ IA: 0x8ff0_0000 │  │            │
>   CPU Addr  │   │  ┌─►├─────────────┐   │  │ Controller │
> 0x7ff8_0000─┼───┘  │  │             │   │  │            │
>             │      │  │             │   │  │            │   PCI Addr
> 0x7ff0_0000─┼──────┘  │             │   └──► IOSpace   ─┼────────────►
>             │         │             │      │            │    0
> 0x7000_0000─┼────────►├─────────┐   │      │            │
>             └─────────┘         │   └──────► CfgSpace  ─┼────────────►
>              BUS Fabric         │          │            │    0
>                                 │          │            │
>                                 └──────────► MemSpace  ─┼────────────►
>                         IA: 0x8000_0000    │            │  0x8000_0000
>                                            └────────────┘
> 
> bus@5f000000 {
>         compatible = "simple-bus";
>         #address-cells = <1>;
>         #size-cells = <1>;
>         ranges = <0x80000000 0x0 0x70000000 0x10000000>;
> 
>         pcie@5f010000 {
>                 compatible = "fsl,imx8q-pcie";
>                 reg = <0x5f010000 0x10000>, <0x8ff00000 0x80000>;
>                 reg-names = "dbi", "config";
>                 #address-cells = <3>;
>                 #size-cells = <2>;
>                 device_type = "pci";
>                 bus-range = <0x00 0xff>;
>                 ranges = <0x81000000 0 0x00000000 0x8ff80000 0 0x00010000>,
>                          <0x82000000 0 0x80000000 0x80000000 0 0x0ff00000>;
> 	...
> 	};
> };
> 
> 'parent_bus_addr' in struct of_pci_range can indicate above diagram internal
> address (IA) address information.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Change from v5 to v7
> -none
> 
> Change from v4 to v5
> - remove confused  <0x5f000000 0x0 0x5f000000 0x21000000>
> - change address order to 7ff8_0000, 7ff0_0000, 7000_0000
> - In commit message use parent bus addres
> 
> Change from v3 to v4
> - improve commit message by driver source code path.
> 
> Change from v2 to v3
> - cpu_untranslate_addr -> parent_bus_addr
> - Add Rob's review tag
>   I changed commit message base on Bjorn, if you have concern about review
> added tag, let me know.
> 
> Change from v1 to v2
> - add parent_bus_addr in struct of_pci_range, instead adding new API.
> ---
>  drivers/of/address.c       | 2 ++
>  include/linux/of_address.h | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 286f0c161e332..1a0229ee4e0b2 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -811,6 +811,8 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
>  	else
>  		range->cpu_addr = of_translate_address(parser->node,
>  				parser->range + na);
> +
> +	range->parent_bus_addr = of_read_number(parser->range + na, parser->pna);
>  	range->size = of_read_number(parser->range + parser->pna + na, ns);
>  
>  	parser->range += np;
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index 26a19daf0d092..13dd79186d02c 100644
> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -26,6 +26,7 @@ struct of_pci_range {
>  		u64 bus_addr;
>  	};
>  	u64 cpu_addr;
> +	u64 parent_bus_addr;
>  	u64 size;
>  	u32 flags;
>  };
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

