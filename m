Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4FBC36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 17:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83CYsZDlIxjagBMUpXjJLP1JyYGcnqEAQYBsR+/D8Lg=; b=joJMKHdbJUE9HmpStaDa2nPXXZ
	6getuHZEHAm/K6mNdUKuebsjZHzvRH3XlA+kg+mO6/KOdlqVfq047nx/9hcGN8nji/m8Jy9QLJmLU
	IJK/Q+UAdk8QrlnfM3FH8IgxvaKliaEY++g/PSvhScV9cuDg244duwmR3QXuPEZ3b0FZqOTgkypDn
	YBgQBwrNWFvmi3piQSi7nddflDiSnQ+2aawbCmphVjaD1ixkVG5kwR1Fk84NKsjdl53w+8uLtx4Q0
	Mqxo4vCetkGpTIgKNM6rYFdN+sT+LIbPoqu9/nWVf9ozx9twx3Vz32CXs7aH4dHJY6+TwCiT+Yio0
	3GQquy1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twlic-00000003nzx-0QVZ;
	Mon, 24 Mar 2025 17:36:10 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twlgr-00000003nct-1w0k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 17:34:22 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-224100e9a5cso90360945ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742837660; x=1743442460; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=83CYsZDlIxjagBMUpXjJLP1JyYGcnqEAQYBsR+/D8Lg=;
        b=MSh3O0j+uOy/ZoSInY4jc/1UhRQGR2boME47bt6PMzKPvNuX0ntyuTkYM76iqhzrZ5
         PZLm1V8Gq9xw2pyZ5FlAE+H1yMOEu7AbeyBTKVHFndt14I90VHFyOMohQG7LewS1A5bb
         +qlXdb/q0C5yjkLBGUTU0WuXDBvy0hPUFIbKTkZyhDUr1Ew4TFxY77rIM1QNnhsRNxYm
         qc5DGiYmsTvLW6rgmClkylLRrv1wKn1S2xBK/pVV1SmiUFGSyYBp4IAm3JOAmLxSDvdA
         Uf3Sg5i0j2tiq1rjiQW5tauvjJOzvd31EllB40Uo9aMrRaOjvJYIwKuREMdRRUC//2yI
         GqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742837660; x=1743442460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83CYsZDlIxjagBMUpXjJLP1JyYGcnqEAQYBsR+/D8Lg=;
        b=kP2YeveAEPz5TP4Zce8WK86b/1Fwr39cETi2rqg++nvv1/PSTGwM+ObTy1vPGjMzWQ
         KegTIYby0V8vZxcjP8qu3jyzDV7rO56CJ1YUyeWhDaZ9CJDQN/GL7sSZpwcBfFHUHZCV
         vdD9VkL4rnj/gIsX+vx/QPFFmE/FBJDxzyyID4R+F0e6bTajNN4gMNfKYmg2ILWd1zkI
         Q8S1LQhcz+P/3vtuSnPT3Qmv7D9fq8WtZczVus1/dGdzYI8VMtqUQg2KupM/g8TZQs2a
         Q1nSF2ucJP392P3XMWreamqLoobimHa12EM4wroczvLaBnuadYQ1fkjYOwJJ/cAOMf6S
         AzGw==
X-Forwarded-Encrypted: i=1; AJvYcCU1HHpRcU6jAbDx+PiNs0MX0LDNFUSlaqAlsC4fBerfbYzzMIUvMtjtWcFO3DXDN9FxyH9M3zvIizGqLWxgkZG9@lists.infradead.org
X-Gm-Message-State: AOJu0YxHHGuoNgK9GbS9Kbh+dmO96aEXolaBwJhyWuh9cozaIM+hhhyB
	jp9uAa/gsGKcckosk4za92c50j1uRjBaT5BW6BGp5WZ+Z7A01nayxLPiFUCjTg==
X-Gm-Gg: ASbGnct/1kzMXKpwQ2G3vDe5XJZP1JphQlvrSi7d1PmAwydWXDB6yUGZXdwnJ3ffu3l
	7xCR3bWDsZiZ+6JnuOXWjLwM3jNSjidGlGEzzy6gOqoNaRlTGMQQ2A7wSeIM39Pz6csktzoqQJt
	t1f49YnuDFoqY9osuiUFprvCIpypFZ8r9uBH8WfCdYUCDiWnKuHkTb4j3RG6jKvIuTU5C427bPK
	WPVLhIQNuBaNvcny3Db8+e/HXUlxSOpbE0ohjLs3eNJHSBPxDooyRqWF5vNTjfxNwEcDAfFpHq4
	JBDJqR2YzMRXqKNUqYvHTS9dDeQHHzeF9sj6lRrYG61rF45GkP2WSnU=
X-Google-Smtp-Source: AGHT+IHbIVCssVeg7Lv61Tjada9UpukwFQFdXBab670umPHzvG4MJv+C/Yb75yCUgxbb10I3kj+LVA==
X-Received: by 2002:a17:90b:510d:b0:2ff:4bac:6fba with SMTP id 98e67ed59e1d1-3030fefd847mr23814182a91.24.1742837660393;
        Mon, 24 Mar 2025 10:34:20 -0700 (PDT)
Received: from thinkpad ([120.60.67.138])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf61b525sm12457882a91.35.2025.03.24.10.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 10:34:19 -0700 (PDT)
Date: Mon, 24 Mar 2025 23:04:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Niklas Cassel <cassel@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v12 00/13] PCI: Use device bus range info to cleanup RC
 Host/EP pci_fixup_addr()
Message-ID: <sffiojhyyu5gc7nx4oe6re53r3ti4nbnkworsxzawkus6ovlsh@3auwqhcpdp3c>
References: <20250315201548.858189-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315201548.858189-1-helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_103421_509868_F25AD546 
X-CRM114-Status: GOOD (  17.50  )
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

On Sat, Mar 15, 2025 at 03:15:35PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> This is a v12 based on Frank's v11 series.
> 

Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> #SA8775P-RIDE

- Mani

> v11 https://lore.kernel.org/r/20250313-pci_fixup_addr-v11-0-01d2313502ab@nxp.com
>     
> Changes from v11:
>   - Call devm_pci_alloc_host_bridge() early in dw_pcie_host_init(), before
>     any devicetree-related code
>   - Call devm_pci_epc_create() early in dw_pcie_ep_init(), before any
>     devicetree-related code
>   - Consolidate devicetree-related code in dw_pcie_host_get_resources() and
>     dw_pcie_ep_get_resources()
>   - Integrate dw_pcie_cfg0_setup() into dw_pcie_host_get_resources()
>   - Convert dw_pcie_init_parent_bus_offset() to dw_pcie_parent_bus_offset()
>     which returns the offset rather than setting it internally
>   - Split the debug comparison of devicetree info with .cpu_addr_fixup() to
>     separate patch so we can easily revert it later
>   - Drop "cpu_addr_fixup() usage detected" warning since we always warn
>     about something in that case anyway
> 
> Any comments welcome.
> 
> 
> Bjorn Helgaas (3):
>   PCI: dwc: Consolidate devicetree handling in
>     dw_pcie_host_get_resources()
>   PCI: dwc: ep: Call epc_create() early in dw_pcie_ep_init()
>   PCI: dwc: ep: Consolidate devicetree handling in
>     dw_pcie_ep_get_resources()
> 
> Frank Li (10):
>   PCI: dwc: Use resource start as iomap() input in
>     dw_pcie_pme_turn_off()
>   PCI: dwc: Rename cpu_addr to parent_bus_addr for ATU configuration
>   PCI: dwc: Call devm_pci_alloc_host_bridge() early in
>     dw_pcie_host_init()
>   PCI: dwc: Add dw_pcie_parent_bus_offset()
>   PCI: dwc: Add dw_pcie_parent_bus_offset() checking and debug
>   PCI: dwc: Use devicetree 'reg[config]' to derive CPU -> ATU addr
>     offset
>   PCI: dwc: ep: Use devicetree 'reg[addr_space]' to derive CPU -> ATU
>     addr offset
>   PCI: dwc: ep: Ensure proper iteration over outbound map windows
>   PCI: dwc: Use parent_bus_offset to remove need for .cpu_addr_fixup()
>   PCI: imx6: Remove cpu_addr_fixup()
> 
>  drivers/pci/controller/dwc/pci-imx6.c         | 18 +---
>  .../pci/controller/dwc/pcie-designware-ep.c   | 74 +++++++++++------
>  .../pci/controller/dwc/pcie-designware-host.c | 57 ++++++++-----
>  drivers/pci/controller/dwc/pcie-designware.c  | 82 ++++++++++++++-----
>  drivers/pci/controller/dwc/pcie-designware.h  | 24 +++++-
>  5 files changed, 171 insertions(+), 84 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

