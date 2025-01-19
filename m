Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99586C02183
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 05:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvJecefk7RmS0IifJ26t3rGZLpvHVBi8QGp4fEpog/w=; b=ymtyY1pGfQ5QYsxIePh9qqQA7n
	b705x0wKfZkXb/rcLasubd5J3OFg6q7l114vWrmDywK1O2sg/eTyEyf7HAcUETviA3xF80wYiCCUD
	qxJRFKuzEAKOMrkVG53/tw13TBeJenNws01/eS2HhWwxwwqOW7wPn9xezpPq5EMGr1zJAQzGvpKX2
	hVGh+/UXRn5L6wMU8FJjIiekAwOED3KTKR+QYWkUTBBKTlsNKGTT/ztazlGaB+106Wnis+BKV2cG5
	c2fHpYcuySW/VqihhmsuWwaej91yOi+FgImy1BZE6lM9+gZ4DkWz+zfu9EZWrYIbIcHr8wP/VOexE
	JG+j7OMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNZq-00000003Prd-2Lw3;
	Sun, 19 Jan 2025 05:10:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNYW-00000003Pnc-3I9j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jan 2025 05:09:06 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21654fdd5daso58892815ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 21:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737263343; x=1737868143; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YvJecefk7RmS0IifJ26t3rGZLpvHVBi8QGp4fEpog/w=;
        b=hstxeG5GK/0IGU4a7he1Xo7b5b3Kn8TQZbaxUBTpHbtwc14MUGAJLDhenR89pA82Hi
         Mo/QUW+wiW4aWaLzR2zgIJsz1/h5cbzIj07tXhLrisDmK2ur8/TZkPzDuJr8pD8X0kJ4
         j/ijx5eukbPSEkxTI85DVHggWDTYvp/TFqTIFv4wE4M/wSkAiVN1oC57htcF2QUVNaOd
         xR7n6EFuotbVO264tFRJ/CrEoZ+a93C9KgZt2sy9u30eEfrn+fVKD5FOS6O//IF9BO+g
         iHrEA/BSuQAYsIzjQ6A1WmVTTmAzTKP9xldoa6x+pOPDOuuX8adqAaXaiHzBaVXgvK0I
         GNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737263343; x=1737868143;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YvJecefk7RmS0IifJ26t3rGZLpvHVBi8QGp4fEpog/w=;
        b=aexawCJj5TSObu+O0dUmgwzg+4iqo8g/VCSe15BoPrc6CkaLwBRzlh5VHfXabeCMQn
         ScwdRcaN731CPA/zQ+7SOKa5E61vct/dgfxIjz5TQdwaWSJbRFUDaZUPegwaIM72DJSE
         FNIXRXswnQAiTh4BYEigroZSSNB0851qlSyamzZLb7Dom0wwQKMwgoa11EOKueywg7RM
         klLrSJTqPgxiDj9w1jbBzjrVnFAThKb5zWE37U3HCAIzVDU0Crf/TYeuFuYwvvnYTdLW
         0BXVKNT5rmy0No72pmqg5hT1Y0fj5Zopdfm/bYZDt8m76rHVmkGoqLoMsgN3BXTus4eH
         whJw==
X-Forwarded-Encrypted: i=1; AJvYcCXKiiEi72Cb2wELmpw7ZrlyHqj2GWi/KL6eDxiy6LDOhyH6BYw7nuaCJyxfLYjV7pFt3DD12O/JaARqXU42vtiX@lists.infradead.org
X-Gm-Message-State: AOJu0YxeFY0gRp556iVUsSzzGH+8tmxHbuEI5FZJrp23yDh6T3pMK8cu
	bO3EFxsiShErvPCQ09FE/pyIGgEPHV4rhpDExSO0ChWifAsNtX5pGALuePCbCQ==
X-Gm-Gg: ASbGncskp2/gOu1Eqm4Cs0PiIPgLtjpvCRg9JzywcGzjnvQBZTmtrWBei4Tmo69HfWw
	ZGrEHeuH/floPGRCttLAjkwe1zPA/DS8//Qz5OrNwb2Fc7csRsrjNS+pqCMtDtNV4k92+xaSflD
	YeZ3htjixzZnk4YBpmVSabvcZ7RDtAsJIGySUkZ6Rzsx1mwQrwk99io09x2rS3EwzVpO3NkvHPt
	heHhW0bJNwSYYxL5Ewu0YnWOu6DotHK++MEuKvomy50XPm8zXuqaqy7P3sTyeu6Rqp3kNKPr5UV
	Cjjscg==
X-Google-Smtp-Source: AGHT+IH56I3/tW+579vI6yiwAOJnC+RYQDWkaXTf+d9BkFZwz6flw0LrFdP//bjYLbRS+vchvwKt9g==
X-Received: by 2002:a17:903:41c3:b0:216:728b:15d8 with SMTP id d9443c01a7336-21c3556b158mr128203955ad.30.1737263342699;
        Sat, 18 Jan 2025 21:09:02 -0800 (PST)
Received: from thinkpad ([120.60.143.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2cea0934sm38612255ad.36.2025.01.18.21.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 21:09:01 -0800 (PST)
Date: Sun, 19 Jan 2025 10:38:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Udit Kumar <u-kumar1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 0/6] PCI: endpoint: Add support for resizable BARs
Message-ID: <20250119050850.2kogtpl5hatpp2tv@thinkpad>
References: <20250113102730.1700963-8-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250113102730.1700963-8-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_210905_078499_4E7A1583 
X-CRM114-Status: GOOD (  27.25  )
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

On Mon, Jan 13, 2025 at 11:27:31AM +0100, Niklas Cassel wrote:
> The PCI endpoint framework currently does not support resizable BARs.
> 
> Add a new BAR type BAR_RESIZABLE, so that EPC drivers can support resizable
> BARs properly.
> 
> For a resizable BAR, we will only allow a single supported size.
> This is by design, as we do not need/want the complexity of the host side
> resizing our resizable BAR.
> 
> In the DWC driver specifically, the DWC driver currently handles resizable
> BARs using an ugly hack where a resizable BAR is force set to a fixed size
> BAR with 1 MB size if detected. This is bogus, as a resizable BAR can be
> configured to sizes other than 1 MB.
> 
> With these changes, an EPF driver will be able to call pci_epc_set_bar()
> to configure a resizable BAR to an arbitrary size, just like for
> BAR_PROGRAMMABLE. Thus, DWC based EPF drivers will no longer be forced to
> a bogus 1 MB forced size for resizable BARs.
> 

The subject got me confused for a moment because, you are not really adding
support for Resizable BARs as per the PCIe spec, but just allowing the EPF
drivers to configure the size of the resizable BARs from fixed 1M. This is a
good improvement btw, but the subject should be reworded as such.

- Mani

> 
> Tested/verified on a Radxa Rock 5b (rk3588) by:
> -Modifying pci-epf-test.c to request BAR sizes that are larger than 1 MB:
>  -static size_t bar_size[] = { 512, 512, 1024, 16384, 131072, 1048576 };
>  +static size_t bar_size[] = { SZ_1M, SZ_1M, SZ_2M, SZ_2M, SZ_4M, SZ_4M };
>  (Make sure to set CONFIG_CMA_ALIGNMENT=10 such that dma_alloc_coherent()
>   calls are aligned even for allocations larger than 1 MB.)
> -Rebooting the host to make sure that the DWC EP driver configures the BARs
>  correctly after receiving a link down event.
> -Modifying EPC features to configure a BAR as 64-bit, to make sure that we
>  handle 64-bit BARs correctly.
> -Modifying the DWC EP driver to set a size larger than 2 GB, to make sure
>  we handle BAR sizes larger than 2 GB (for 64-bit BARs) correctly.
> -Running the consecutive BAR test in pci_endpoint_test.c to make sure that
>  the address translation works correctly.
> 
> 
> Texas Instruments kernel developers, if would be very nice if you could
> help out with testing on Keystone.
> 
> 
> Changes since V2:
> -When looping in dw_pcie_ep_init_non_sticky_registers(), use the index
>  that we read from PCI_REBAR_CTRL (e.g. a platform could have BARs 0-2
>  as programmable, and BARs 3-5 resizable, so we need to read the index).
> 
> 
> Kind regards,
> Niklas
> 
> Niklas Cassel (6):
>   PCI: endpoint: Add BAR type BAR_RESIZABLE
>   PCI: dwc: ep: Move dw_pcie_ep_find_ext_capability()
>   PCI: dwc: endpoint: Add support for BAR type BAR_RESIZABLE
>   PCI: keystone: Describe resizable BARs as resizable BARs
>   PCI: keystone: Specify correct alignment requirement
>   PCI: dw-rockchip: Describe resizable BARs as resizable BARs
> 
>  drivers/pci/controller/dwc/pci-keystone.c     |   6 +-
>  .../pci/controller/dwc/pcie-designware-ep.c   | 231 +++++++++++++++---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  22 +-
>  drivers/pci/endpoint/pci-epf-core.c           |   4 +
>  include/linux/pci-epc.h                       |   3 +
>  5 files changed, 219 insertions(+), 47 deletions(-)
> 
> -- 
> 2.47.1
> 

-- 
மணிவண்ணன் சதாசிவம்

