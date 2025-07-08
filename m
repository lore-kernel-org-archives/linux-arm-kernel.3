Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76353C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dj/STn3U+nGjCStQovmQQoY7YADKp+WIWCTtQvUhkFk=; b=1DOUyb1IR+MxuA8vx0SI4sLhK2
	2iIdlf48Bea7HB4xKI8/aKOZf4lY95aE7bTLNxQNyDtor+MMQ3Mdh0DDtPlamZcqr7uRHFRi467kQ
	ULKqxoAJYWqffIK6fDI5YsOCgosIcr+nIiBW8h28HGXLu2Tq16Ro44b0AH/Pp6ayqOmaM6AFOKzmS
	Y6bdU1SgRlFNj+dJuLs8p536sBTEeVXjxkzlRnYL5awJ5VZzoZumy6AMHKoaHqGrRSvasxDm+XDat
	awi+gaHwkQAexHjfWIpdH/rcSHBRrqNBhA+ZFiqmtdEGaxpNp3mFf9dzszlmA6l6+78lJYAZLcKNQ
	vq6wV5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ39w-00000004eI3-1Xky;
	Tue, 08 Jul 2025 07:54:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ33b-00000004d3F-3ymO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 07:48:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63C4644F51;
	Tue,  8 Jul 2025 07:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF64FC4CEED;
	Tue,  8 Jul 2025 07:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751960883;
	bh=9Q5CXN9O5qwDOk34kVlNTKgsb2m3mLtmtiu6Wi3LFeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mSb46+oPCqcoSm83lDKYIiFXtSEU5ju6qkNzXxvK0zNaFIV3c3yK6gHdmp/goOiyB
	 UdhV32c8l3Zbf3fIlRqKhPBVlLCjFfPd6NQ6IVAhC8BE0+aR00NsNuVC2E8kpro/YD
	 0rFM96z9LxDLKKubisu4JMuwNZXcCRET+BaMpo3t7gqhk0yoWtskBOZuCuhCJWVjow
	 tEWs0iUp25u9cD2oxo28HpSxeJdqty7BFS0XDBCGU/bm5/fJPtI8JZZY0yUt+WRNX7
	 W4hXStNtBIWd5yj0LGeQuWXBLbChJhGTnRRrU4LUAiJU3kfi+dqa8iKD0GKwG/5XMd
	 eIvryi7xptaag==
Date: Tue, 8 Jul 2025 13:17:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] PCI: imx6: Align EP link start behavior with
 documentation
Message-ID: <klduv5ytcsxzs6nugiorajwxq4mwqfpmhkifl5wtjy6jiq4mha@mf4732u2xrtw>
References: <20250616085742.2684742-1-hongxing.zhu@nxp.com>
 <20250616085742.2684742-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616085742.2684742-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_004804_064165_34CCB92F 
X-CRM114-Status: GOOD (  15.40  )
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

On Mon, Jun 16, 2025 at 04:57:42PM GMT, Richard Zhu wrote:
> According to PCI/endpoint/pci-endpoint-cfs.rst, the endpoint (EP) should
> only link up after `echo 1 > start` is executed.
> 
> To match the documented behavior, do not start the link automatically
> when adding the EP controller.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Fixes tag?

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index f5f2ac638f4b..fda03512944d 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1468,9 +1468,6 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
>  
>  	pci_epc_init_notify(ep->epc);
>  
> -	/* Start LTSSM. */
> -	imx_pcie_ltssm_enable(dev);
> -
>  	return 0;
>  }
>  
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

