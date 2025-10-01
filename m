Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46E7CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=IrUAhcVi/sKmTDX+5YgtgHXJ6zHyYeUQTSdDcCwHWfw=; b=YMEyMq9WU4b+fE
	grCDAL+PsUUv3MQxg6/C5ZCCAEn3Omb88cCmQvI+5w/O0KNsp4jvIMw8TPjOeom2nqcBnrlNfA+Q6
	gRsxWCxW+lQg7ruSnRvBrbK2RDlUUOativDQoNuKgNKGDYTF3d/DYKY0mkNlmCQIZnfPTCaDpChB3
	bnYG+s9glPu/6zwRXuvuYz3VTaqdR1Fl2gC/2jNTDHAFgp402DgiPmvk7RETrc467D5JPSiRgMaHV
	9/xVHD9rECsS9B3KAR6FZLooIFUg+Wepr7m9Te1NlBAi9f+WmP7Qiubr5JdCvPOrcRJXDESghKMSS
	K0758vt8Pwf6wPe4J/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3yBw-00000008GXC-38Lb;
	Wed, 01 Oct 2025 14:52:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3yBu-00000008GWU-2lPG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 14:52:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D35E45A1E;
	Wed,  1 Oct 2025 14:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBB8C4CEF9;
	Wed,  1 Oct 2025 14:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330346;
	bh=ZLuAJtf5Ay5V3wJzzmRXG3Pw3uAXV9z6Fj6IMRT0cJE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VbLGX5a5HziGndAsvgrxLMIOrlcpzm8thMULLWEGLhtnECk4IVmzjC8XTXci/YarC
	 QOyjqQFLeVq70nfhAYnh+YiN0wt9/1Slt9zCEBBnzWTSpqJKC0i88d7THX+nEE7+jn
	 JNl7OskrE87jgKcrq8mPO4X5az4kxQrHy2uidsRNVXXelmpVMpbhwmxQsyRSGDvuAF
	 DgiQNLkhP1J83Dtk0r+5xzmuqmvkzunT42Z4qfwu3JahHU7BPrqmM7U8FbV9YDoSz5
	 Eri2WcVFLxX8kG8nfTQHoCpmw3MFlhxUXE5qWuYNoQw2NqiEZ7qH/wmsQs051iWvoF
	 QyKK0wMf9/lvw==
Date: Wed, 1 Oct 2025 09:52:23 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Christian Bruel <christian.bruel@foss.st.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: stm32: Re-use existing error handling path in
 stm32_pcie_probe()
Message-ID: <20251001145223.GA226169@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e69ade3edcec4da2d5bfc66e0d03bbcb5a857021.1759169956.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_075226_720434_FAE2752A 
X-CRM114-Status: GOOD (  16.46  )
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

On Mon, Sep 29, 2025 at 08:19:30PM +0200, Christophe JAILLET wrote:
> An error handling path is already available, so use it instead of hand
> writing the same code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The stm32 driver hasn't been merged upstream yet, so I squashed this
into it:

  https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git/commit/?id=fd486e67e88c

Thank you!

> ---
>  drivers/pci/controller/dwc/pcie-stm32.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
> index 964fa6f674c8..96a5fb893af4 100644
> --- a/drivers/pci/controller/dwc/pcie-stm32.c
> +++ b/drivers/pci/controller/dwc/pcie-stm32.c
> @@ -287,18 +287,16 @@ static int stm32_pcie_probe(struct platform_device *pdev)
>  
>  	ret = pm_runtime_set_active(dev);
>  	if (ret < 0) {
> -		clk_disable_unprepare(stm32_pcie->clk);
> -		stm32_remove_pcie_port(stm32_pcie);
> -		return dev_err_probe(dev, ret, "Failed to activate runtime PM\n");
> +		dev_err_probe(dev, ret, "Failed to activate runtime PM\n");
> +		goto err_disable_clk;
>  	}
>  
>  	pm_runtime_no_callbacks(dev);
>  
>  	ret = devm_pm_runtime_enable(dev);
>  	if (ret < 0) {
> -		clk_disable_unprepare(stm32_pcie->clk);
> -		stm32_remove_pcie_port(stm32_pcie);
> -		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +		dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +		goto err_disable_clk;
>  	}
>  
>  	ret = dw_pcie_host_init(&stm32_pcie->pci.pp);
> -- 
> 2.51.0
> 
> 

