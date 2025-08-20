Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31950CA0FE2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=N9JcTU4z8cVE0lYrDUIu1MDdLsRDuKVIaNTysO8u42w=; b=rryxf9EBEebmZu
	cHeFPXMzZluWyw1gTPMfzjl4EKxCgVvIszHJQSTMrCYGCaMNv0qgBdEJBX4fc6SOoiO6kQ+Kv1ATt
	YqtQ3I8UgxLboXrYhLWL2vq0/bcQIjNgrfg8P8WwQyNks4j94ThaSXGVSCMqhiX2lMyx80FL8bN5e
	OVcnRLdbtRdqi0zbTKXJ2WFS10LLcMtXYghSC7VI9uwGN9KF7sgz6yRKGsKF90VUOLOX4yP1/Ch1a
	K12A37fbKKxvSpib9P99GLIM5fGo3q3qlCrvycGy9CZsStlZtBitovTr4YqwWkntHYa2OkhMpGdWL
	+5JxAeycRLlK4k6nG6mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopkV-0000000Erwd-3KhC;
	Wed, 20 Aug 2025 20:49:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolCA-0000000EJyH-1nHY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:57:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D70CF5C665B;
	Wed, 20 Aug 2025 15:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFB2C4CEE7;
	Wed, 20 Aug 2025 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705469;
	bh=p8L/MSQcq7yF/LI2ZVnymQ3FOXY3S7Zhq5jrLFURDYw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=prO3xTMJrHASsyJv+GWfgfUF8IJH4vY+Ktdyp7frUwqvzrATsej91VY+mKrqCcoJA
	 GiPEWxx8R89u8WU2jMluM3L5BIv22jeZXxfQ+e6bmHygxNY5ceTjttjfwrVtLV3RJT
	 cjL1eIIhPs8N1UgqRV+r8WgHPsjvt7O41ym2gIc7sen7c7nu1JVrfojVsQG3pHBmdU
	 98sIb25Tv+DSrDFAtjrW1kmyTjHDopKfApgGvHruNvasnO6A7IJ0MiEmBnSPqXzL4y
	 CYTtpVV0S+NSjxHrEVCQdXwVTP685vVL/6QDKfjgiwa/xxF2pucvZ3mUD0Pk30DG6e
	 enrARmDXpglYw==
Date: Wed, 20 Aug 2025 10:57:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] PCI: dwc: Invoke post_init in
 dw_pcie_resume_noirq()
Message-ID: <20250820155747.GA628315@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820081048.2279057-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_085750_506871_4E782799 
X-CRM114-Status: GOOD (  13.99  )
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

On Wed, Aug 20, 2025 at 04:10:47PM +0800, Richard Zhu wrote:
> If the ops has post_init callback, invoke it in dw_pcie_resume_noirq().

Can you briefly explain why .post_init() is required here?  Bread
crumbs about the purpose of .post_init() will help other driver
writers (and me!)

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 952f8594b5012..f24f4cd5c278f 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1079,6 +1079,9 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
>  	if (ret)
>  		return ret;
>  
> +	if (pci->pp.ops->post_init)
> +		pci->pp.ops->post_init(&pci->pp);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_resume_noirq);
> -- 
> 2.37.1
> 

