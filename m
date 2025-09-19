Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F49CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 18:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6BIW6nk9VokxNdMUnaPbHqz+kXxqZQzHIR/NiggwLg=; b=fUDrQ1/n3P6dvuh048EeHCk1Rx
	KPVWcdGb5VcWaJ4iYmGIqBr7AsCsqRyfn8gyxwBIXZsXfC71G+R4Sn/tfyE3BB1R7BqiA8mccCEJU
	fdZJUigom/fGMQ1xNwq4r0MEMvmvz8hzwhxpWEIhlrzl310QzUzRykap+mEXojGQXMzzU9mwZKcGR
	8OLXKJBMY729TbK8TbtT0n8z2bh/tojRIIDsEJ1P+c4M0vbEDrbhSsPsk4RC+vx7iJwUBPSWt2XOh
	2fP8tZWpQnL+6fZG0jtNparAis87tYCI4lQesJVensmmxo3zvGcDviF1Cz6k/hHrq64aLiGE0hHdJ
	GmOPFJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzfss-00000003lbv-0Zdv;
	Fri, 19 Sep 2025 18:31:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzfsp-00000003lbJ-2jgi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 18:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB8A1404B4;
	Fri, 19 Sep 2025 18:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F83C4CEF0;
	Fri, 19 Sep 2025 18:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758306658;
	bh=VqGaXrsnHDB0BUTkmiNdMkMLAZVWdKAH/20+GH3zJ4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qiTCts8ITuKje9k20xuiq9n+85M+xbls4wD13KoIdMwCL9Af3TTOit6LevDtelBCQ
	 y8KdVdq5c+gWclkluTbPyEpvsfM2EYFiOjal41dTJUahi1kwuEuudZDJNY0aBqotrI
	 Zo4YXug1FwXnGQYx8MRgXLUoxrwMmk4AnmvobngvYR05B/yFwWtXzL6Qj1v3iZR+bK
	 XhenwT9qvFeYVMkz504Pnxj/C4IFhwWT+tgrWYeZLJyipVJzrTLY6GvGBqhO8jS+8Q
	 qb7zUON53XmUNdIjypNaIdYWpKiSlUs9C/lxU5BXUW7gvpbT3rOexT3jQr4V7CTMUl
	 UGUs33Pih9wsA==
Date: Sat, 20 Sep 2025 00:00:47 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, christian.bruel@foss.st.com, 
	qiang.yu@oss.qualcomm.com, mayank.rana@oss.qualcomm.com, thippeswamy.havalige@amd.com, 
	shradha.t@samsung.com, quic_schintav@quicinc.com, inochiama@gmail.com, 
	cassel@kernel.org, kishon@kernel.org, sergio.paracuellos@gmail.com, 
	18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2 04/10] PCI: dwc: ep: Export
 dw_pcie_ep_raise_msix_irq() for pci-keystone
Message-ID: <kb6jxzyihyuhd4qfvdtgxgopzgyymhsflqmheb3fribovdck23@ahswbufb23sv>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
 <20250912122356.3326888-5-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912122356.3326888-5-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_113059_712396_92FE165C 
X-CRM114-Status: GOOD (  14.88  )
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

On Fri, Sep 12, 2025 at 05:46:15PM +0530, Siddharth Vadapalli wrote:
> The pci-keystone.c driver uses the 'dw_pcie_ep_raise_msix_irq()' helper.
> In preparation for enabling the pci-keystone.c driver to be built as a
> loadable module, export 'dw_pcie_ep_raise_msix_irq()'.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

This patch could be merged with patch 2.

- Mani

> ---
> 
> v1: https://lore.kernel.org/r/20250903124505.365913-5-s-vadapalli@ti.com/
> No changes since v1.
> 
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 7f2112c2fb21..19571ac2b961 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -797,6 +797,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_msix_irq);
>  
>  /**
>   * dw_pcie_ep_cleanup - Cleanup DWC EP resources after fundamental reset
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

