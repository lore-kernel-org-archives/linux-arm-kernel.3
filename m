Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33076E73164
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdBAdm3NsiourOU55YC9hR7JS/FvK2hnPjntCPDdIPg=; b=U7ay5qCs46uE7ES9HY3+60FZQ9
	Q/nJUVN0T1R6iwfNOVzsv/QnpIQYC9+4CXB51/isq8FEj8VBd40oSeVoGeSTCCxKClk2ciV3iBcnp
	yeyIFtfgahziu1/TuXbCKqtFsQ328Xpzfl2VHrjB8Gfw2kNvC9k07FZXOwOqqgdMLu7tO9DUYmjDK
	E0hOnPBLRUraZec/fjCulSoeGWWLTLS/R8eQk2KBLOz2BqkRdNOSycTcx15NoVVOiLafokBhzUw67
	/xkcFL6PSI0MaAJPLlZrho++Zy+qpD4Yw4tnaqEiXNtUZG1vYahguXPoIt08UDygOP2jBNDNh5WeN
	WF777UKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtpA-0000000507G-07Ku;
	Mon, 02 Feb 2026 13:18:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtp6-0000000506n-3gX2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 13:18:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E7C4640E4C;
	Mon,  2 Feb 2026 13:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E454BC116C6;
	Mon,  2 Feb 2026 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770038314;
	bh=W7c7pgUrTFjdZTelEf6hNNG1gxYMmfAV5JcXC1NB+I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uRIBkGyWjmofVDdhDf4qT/1saarer8FexlI+HfYk38vNj7Hp1/RkpETs/5gAzuuJ8
	 dfcUOwvKq6hULlaaDJCsoyjx0svRibm8LFhU1Bj7T92B2qc65vdajDYpGT7s2LykXm
	 5P0BvVreH4WRULQl6lFppKMLFwjpb6FgZ+ItNnW29P969Z+sQyY/lLqLRHQ4zkeCKS
	 VG6XpKO/IsNKVpwnyCLUZTCcTyI8p0ki8cO97T+piNd2yCtk8ZWPceaL2yis7+9uCy
	 Ak3GxNh0PLIVfJxzwKXYoaByN7BQ0+pUAjPLdfSP6PB2EkvBl7Ow1edws1mbLNvbU5
	 iwt1uhgzFpdYw==
Date: Mon, 2 Feb 2026 18:48:26 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: ciprianmarian.costea@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: s32g: Fix ports parsing
Message-ID: <scnf5gh3h5pwvnbe4bwtztdlgcpvvtse4fg64bto2jgyotfpwl@sle4k4ky3gtu>
References: <20260202130756.1421488-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260202130756.1421488-1-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_051837_016006_14764F9C 
X-CRM114-Status: GOOD (  16.28  )
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

On Mon, Feb 02, 2026 at 02:07:56PM +0100, Vincent Guittot wrote:
> No error return is missing after the loop resulting in removing the
> ports from the list.
> 
> Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (RC)")
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-nxp-s32g.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> index 47745749f75c..767f5a622441 100644
> --- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> @@ -285,6 +285,8 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
>  			goto err_port;
>  	}
>  
> +	return 0;
> +

Hmm. So the initial 'ret = -ENOENT' will become redundant and you'll return
success even if there are no Root Ports in DT.

You should do:

	if (!of_get_available_child_count(dev->of_node))
		return -ENOENT;

at the start and remove the 'ret' initialization.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

