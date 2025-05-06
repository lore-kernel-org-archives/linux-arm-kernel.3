Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575DEC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZwVCAFKvQ82NrmUkSMxtLmn6GtT1Ejjv3PtKnci1G0=; b=olVViP2XdTB6tDI+VcV2Mk3B+N
	SwkNH6OI7aymIx8FEkDp8TEXECEhhJCo7pLXz8mSmkKvilFsv+ie9sP/zE5483JkZcoyJQiGaJKeM
	QPWyGotUkYPEMYomJ+JBkC2mYcGFMP7gXhupm6UL+uAwz9+VBdhDItd+JPymadXLruarb4F0gyFO6
	dGGqmrtOJbAbzSR7+ard8FOqUFuNNU/PpiN9En3v4tQUiya7HfsUchuc4SNMFSHGcJf42abxch/6p
	lghrk13mPfPo8Ha7gwVE8P2l7naNtxRyosJrb8BzmUQecwurnS3xuVDholn7TM+qvbok3PDdDosrP
	M02vvQJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCR0E-0000000DcUY-2uJA;
	Tue, 06 May 2025 22:43:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMI7-0000000CsQz-1qIK;
	Tue, 06 May 2025 17:41:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31E27A4D75C;
	Tue,  6 May 2025 17:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5E3C4CEEB;
	Tue,  6 May 2025 17:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746553273;
	bh=addtd2tD+DOVZOCpE3AbYsDQUYIQPT10US31SZtt2d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qQ13y8A2z2q3OM1MObsbWCM3zla4VJlDmuJTvyfkO9aLQ99ypDNhNEN5oIxX8/CF2
	 L7PE7DWzOZPp8ZoJDpDZlpxNWTk5Ih4sWfsD84tNapMnA3Y2KOw5B9Y4QZvvndl1mh
	 OaqinBL3jRrAXKDx1+2yyGAihpf5tY7CMaH3ajYjdYUoCrccekKFDzi+RY471N+O6g
	 DLNKlwl5z4KVODs9zh9AM0Y9QIoVY2JiKb7Wvkg8siHRf9KFynN7ZtDScFTVNASztZ
	 HHcK779OBDwABXOTxQ233HRRs0qXWSGtkHiFvT9ZytMwZVGnlGYVjBiQXW/Wq4izM5
	 uuVjbbjUkI0dw==
Received: by pali.im (Postfix)
	id B53EE67E; Tue,  6 May 2025 19:41:10 +0200 (CEST)
Date: Tue, 6 May 2025 19:41:10 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	heiko@sntech.de, manivannan.sadhasivam@linaro.org,
	yue.wang@Amlogic.com, neil.armstrong@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 3/3] PCI: aardvark: Remove redundant MPS configuration
Message-ID: <20250506174110.63ayeqc4scmwjj6e@pali>
References: <20250506173439.292460-1-18255117159@163.com>
 <20250506173439.292460-4-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506173439.292460-4-18255117159@163.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_104115_547359_BAAB7190 
X-CRM114-Status: GOOD (  15.11  )
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

On Wednesday 07 May 2025 01:34:39 Hans Zhang wrote:
> The Aardvark PCIe controller enforces a fixed 512B payload size via
> PCI_EXP_DEVCTL_PAYLOAD_512B, overriding hardware capabilities and PCIe
> core negotiations.
> 
> Remove explicit MPS overrides (PCI_EXP_DEVCTL_PAYLOAD and
> PCI_EXP_DEVCTL_PAYLOAD_512B). MPS is now determined by the PCI core
> during device initialization, leveraging root port configurations and
> device-specific capabilities.
> 
> Aligning Aardvark with the unified MPS framework ensures consistency,
> avoids artificial constraints, and allows the hardware to operate at
> its maximum supported payload size while adhering to PCIe specifications.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/controller/pci-aardvark.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> index a29796cce420..d8852892994a 100644
> --- a/drivers/pci/controller/pci-aardvark.c
> +++ b/drivers/pci/controller/pci-aardvark.c
> @@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct advk_pcie *pcie)
>  	reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>  	reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
>  	reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
> -	reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
>  	reg &= ~PCI_EXP_DEVCTL_READRQ;
> -	reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
>  	reg |= PCI_EXP_DEVCTL_READRQ_512B;
>  	advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>  
> -- 
> 2.25.1
> 

Please do not remove this code. It is required part of the
initialization of the aardvark PCI controller at the specific phase,
as defined in the Armada 3700 Functional Specification.

There were reported more issues with those Armada PCIe controllers for
which were already sent patches to mailing list in last 5 years. But
unfortunately not all fixes were taken / applied yet.

