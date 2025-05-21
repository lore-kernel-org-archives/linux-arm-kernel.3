Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2945C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpHoLj8X9ON8b2bdgz8Ku4ZBXQZk+malD2qxSqkZQbA=; b=VTN2kljIBnmud3e6AYupE/U90N
	ZZxnX1NrSs370QyJidqiQwXqzsQu7+vAJrDZeAOnNAGOpLxbDg4VxzY17sNg6daTIDLAJy6d6wNjv
	baK02OLkX2ca8ukqnwcd5mAZC0FIB2TCyUj13iu3mEpw6rlqth6CIuixvLxAg0Jr7AGpInsMRm2Ld
	4VmiSi+nzToH9gnFX5OPmxKFyy0C7LcZ/sfQEuz6cL2NobiAac9Nr4AYc5liZUWTYdzqYaxxUTDPe
	s17NrHObA0e7TFjkdz0+48lL3erRUxnDRV05i7SODpwQW7HWyQUMx9reBYR5b2RemMinv29P4V1Zr
	z16GcpQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghn-0000000FSp8-2VNG;
	Wed, 21 May 2025 10:29:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHg1Q-0000000FMaz-38TV;
	Wed, 21 May 2025 09:46:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22AEE4A52C;
	Wed, 21 May 2025 09:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C52C4CEEA;
	Wed, 21 May 2025 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747820760;
	bh=7RivNfJQ1tM6ITxUNsv+CWRaSsbDI8HVCn9mI4Hvzik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8hLmQXVmY/w2GWyB6vXjojnqvRerNfVmKYr2A4cFZqWB9JqefvaWU3Qxk4tpTn/g
	 yOgTv6KuDHFD87htzZ0Eb9dlJINuZW2s4UQ8vHUo/7U9ZsTZfOCV4Z2yRP2n5vp0Pm
	 db2tNS7X4EY1xkQ4XcP0Tt5jHdzgoHcHU8dnasUDOjgGZZeUWFr/Pji6llF8dJpAQu
	 ol0NawpfzfWVEYeaDLeYkdC/SFZT3UMbfI0BwGCASOIpDdvJSww2OmcfpyN6VHSdNO
	 EnkeiRtbzv4gYFsKZAcCApI19l6pmk88phgqAWkrouLCHRkXerBB/vGf5E5IIhfa8G
	 Pw1CXtHMHF2og==
Date: Wed, 21 May 2025 11:45:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.or, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, vkoul@kernel.org, 
	kishon@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com, 
	Hrishikesh Dileep <hrishikesh.d@samsung.com>
Subject: Re: [PATCH 03/10] PCI: exynos: Reorder MACROs to maintain consistency
Message-ID: <20250521-mysterious-mole-of-priority-8a5f4d@kuoka>
References: <20250518193152.63476-1-shradha.t@samsung.com>
 <CGME20250518193235epcas5p4f0bcf581b583a3acf493a20191ad2b00@epcas5p4.samsung.com>
 <20250518193152.63476-4-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250518193152.63476-4-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_024600_805273_51BEC940 
X-CRM114-Status: GOOD (  13.93  )
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

On Mon, May 19, 2025 at 01:01:45AM GMT, Shradha Todi wrote:
> Exynos PCI file follows MACRO definition order where
> register offset is defined in ascending order and each
> bit field within the offset is defined right after offset
> definition. Some MACROs are out of order and so reorder
> those MACROs to maintain consistency.
> 
> Suggested-by: Hrishikesh Dileep <hrishikesh.d@samsung.com>
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  drivers/pci/controller/dwc/pci-exynos.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
> index 990aaa16b132..286f4987d56f 100644
> --- a/drivers/pci/controller/dwc/pci-exynos.c
> +++ b/drivers/pci/controller/dwc/pci-exynos.c
> @@ -27,11 +27,11 @@
>  
>  /* PCIe ELBI registers */
>  #define EXYNOS_PCIE_IRQ_PULSE			0x000
> +#define EXYNOS_PCIE_IRQ_EN_PULSE		0x00c
>  #define EXYNOS_IRQ_INTA_ASSERT			BIT(0)
>  #define EXYNOS_IRQ_INTB_ASSERT			BIT(2)
>  #define EXYNOS_IRQ_INTC_ASSERT			BIT(4)
>  #define EXYNOS_IRQ_INTD_ASSERT			BIT(6)
> -#define EXYNOS_PCIE_IRQ_EN_PULSE		0x00c
>  #define EXYNOS_PCIE_IRQ_EN_LEVEL		0x010
>  #define EXYNOS_PCIE_IRQ_EN_SPECIAL		0x014
>  #define EXYNOS_PCIE_SW_WAKE			0x018
> @@ -42,12 +42,12 @@
>  #define EXYNOS_PCIE_NONSTICKY_RESET		0x024
>  #define EXYNOS_PCIE_APP_INIT_RESET		0x028
>  #define EXYNOS_PCIE_APP_LTSSM_ENABLE		0x02c
> +#define EXYNOS_PCIE_ELBI_LTSSM_ENABLE		0x1
>  #define EXYNOS_PCIE_ELBI_RDLH_LINKUP		0x074
>  #define EXYNOS_PCIE_ELBI_XMLH_LINKUP		BIT(4)
> -#define EXYNOS_PCIE_ELBI_LTSSM_ENABLE		0x1
>  #define EXYNOS_PCIE_ELBI_SLV_AWMISC		0x11c
>  #define EXYNOS_PCIE_ELBI_SLV_ARMISC		0x120
> -#define EXYNOS_PCIE_ELBI_SLV_DBI_ENABLE	BIT(21)
> +#define EXYNOS_PCIE_ELBI_SLV_DBI_ENABLE		BIT(21)

What changed here? Why you cannot fix indentation while renaming?

Best regards,
Krzysztof


