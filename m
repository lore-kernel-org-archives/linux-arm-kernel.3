Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB6DD40D08
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 23:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=u/KxNTQx98oneolstQRJpjGK16KMfxmMLMq7wPEVyP8=; b=GIC0Fekdg+TJvG
	XJdKK9Om99+f1AwOk0/4TBrBHm282mX8l8qOT+YS2h9tZVBjGjzlkQwgHRwAo+0lR3sqRSAKgYgzy
	mZJF9u9D398WrOoMDujfOuAvWzLXNFyuiBVK8yScif0jO5ARM8SibAIaT0eViyaHXHW5l8pVef/Kk
	03IePkN5MP5OA8tlzAQxey8h1ttc0P/wMna9YxY8QP9HJJRK7WOmfLGeHuVdoQsyCmm4u6kwQZ4s8
	bYrU6NMyGNTIJjI/Jq8+OOsbU3HSVOHlZNmhd3Mux1+8a9SZ3v89xUFzMBQcvweQXeMBPcvWxJNQo
	d7txLsqatFO3n5wNaiPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8T7q-000000017Ns-1c4a;
	Tue, 05 Nov 2024 23:38:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8T4u-00000001761-08Zr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 23:35:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE367A43C47;
	Tue,  5 Nov 2024 23:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF22C4CECF;
	Tue,  5 Nov 2024 23:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730849714;
	bh=EkLwGAD+vkQfJXaeXFFexTFClHB8gkvGZzJT+rMGMb4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=S8ydKuoZN3G8z4EUhrNgUlPaoxuqLwov1sbZ3LCb7eKt9f4xy4xTgGxsNTKEEBT8z
	 5jnVRXoy/Fo9hZ+O72hUTG2ZOiPMv9lerDTCFyNlYG/6wHeGJAbvUPEgdQa8iv/+fT
	 UPPOKHhQYb28JnnCr0Pll2UwGEJ2M2QEdaJ+UkGTyXyHbctXRyQHVBka6Cv9a+yGLb
	 ErszweYPujZR1Z6TrfDFc+5RFV9CfLLE1VsSXhuxIyf6o6okDFTNpTFsY2BBQGWBKy
	 nfeHXLXP4KrQiR06qAUSlH6A5Etsok8YuXLhdc7FHL+OjzgCMGKGcQvh0Xdu3M5oxf
	 KPArUQhMj1cmg==
Date: Tue, 5 Nov 2024 17:35:13 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: kwilczynski@kernel.org, bhelgaas@google.com, lorenzo.pieralisi@arm.com,
	frank.li@nxp.com, mani@kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, imx@lists.linux.dev
Subject: Re: [PATCH v2] PCI: dwc: Fix resume failure if no EP is connected at
 some platforms
Message-ID: <20241105233513.GA1495684@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1721628913-1449-1-git-send-email-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_153516_300993_0A2FC50D 
X-CRM114-Status: GOOD (  18.27  )
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

On Mon, Jul 22, 2024 at 02:15:13PM +0800, Richard Zhu wrote:
> The dw_pcie_suspend_noirq() function currently returns success directly
> if no endpoint (EP) device is connected. However, on some platforms, power
> loss occurs during suspend, causing dw_resume() to do nothing in this case.
> This results in a system halt because the DWC controller is not initialized
> after power-on during resume.
> 
> Change call to deinit() in suspend and init() at resume regardless of
> whether there are EP device connections or not. It is not harmful to
> perform deinit() and init() again for the no power-off case, and it keeps
> the code simple and consistent in logic.
> ...

> -	ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
> -				PCIE_PME_TO_L2_TIMEOUT_US/10,
> -				PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> -	if (ret) {
> -		dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
> -		return ret;
> +		ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
> +					PCIE_PME_TO_L2_TIMEOUT_US/10,
> +					PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> +		if (ret) {
> +			dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
> +			return ret;
> +		}

Not related to this patch, but what's the reason for waiting for the
link to enter L2?  There are a few other drivers that do this, but
most don't.  Is there something else the driver needs to do after the
link is in L2?

>  	}
>  
>  	if (pci->pp.ops->deinit)
> -- 
> 2.37.1
> 

