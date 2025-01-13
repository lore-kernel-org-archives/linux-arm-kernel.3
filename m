Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B92C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9IwnQVbNfaB+ZNTJjHRlr8glhXVBJVzpCBXKFIrslYc=; b=b1ZireshdEfT5w
	pAvookn4Mzirpt55GyIf59sHqGb/Yl1kMNw7frF3UBlyB/LW3WhoLW6On5EwpH/f8bboebv2RKqfC
	DQVYTDVl/a4U7coVDY+DqffIsIS0anKpRpP5evt0vLzATrcgDZeU4chKRIxeTN64IkIVPuj0VvdSI
	24xOWWdl8Uh19oHjg0OeyNX+7vW30c/tvoMKp/vf+ro3YwknrdvC+jaQbP6fb9NEzuvEKqxK04FI4
	Y6Qru0FrdGTsgn/kx4I4wwHoI22WJaqVfa7D5UZBuC5bzjYOem3/5/zNhX59Blt6C6VCf3veNlkjO
	mv5G0DKg4BAHlg4pqZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ76-00000006NbW-1J5K;
	Mon, 13 Jan 2025 19:28:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ5r-00000006NFl-2Qrh;
	Mon, 13 Jan 2025 19:27:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DD3ADA41328;
	Mon, 13 Jan 2025 19:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9317FC4CED6;
	Mon, 13 Jan 2025 19:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736796441;
	bh=CjvjHO6S+8TLxs+4MjSObjN8IEm72lKwk6gKdw1AnX4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SBBjA9YtHpIZAElZpnXG7eyfeQ47XnV2mrw7Y/If8zZYzI8PeuENl94vB2jeUoJnY
	 CiIUpMTsmqzDqMGlRcbPenMZOXjlEwNutg5rBIpj9tRinHVXehfiNZIxjLero1PSAt
	 YVEXx3MYLSUJbNpj4tIzDymbUCfohNWie4Cugfj9NsNZd+Uv0uUbWcWmRrRZH2d8RS
	 J4+cMxU8CUP/HsaLwat+svRKSxflCFf6t39tCclPh0wZ8yRjxJrQo2su3DiQQr/80a
	 HkJ/u3IdJsSHFRtJlcbtIIlHibWB/ZMWEWJjO7j5XjQmrmQbuQ5fJxOvLxaCs+nHR+
	 HLTx8TXjhKJEQ==
Date: Mon, 13 Jan 2025 13:27:20 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Anand Moon <linux.amoon@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
Message-ID: <20250113192720.GA414640@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-rockchip-no-wait-v1-1-25417f37b92f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_112723_678162_E97F6CC9 
X-CRM114-Status: GOOD (  21.39  )
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

On Mon, Jan 13, 2025 at 11:59:34AM +0100, Niklas Cassel wrote:
> The Root Complex specific device tree binding for pcie-dw-rockchip has the
> 'sys' interrupt marked as required.
> 
> The driver requests the 'sys' IRQ unconditionally, and errors out if not
> provided.
> 
> Thus, we can unconditionally set use_linkup_irq before calling
> dw_pcie_host_init().
> 
> This will skip the wait for link up (since the bus will be enumerated once
> the link up IRQ is triggered), which reduces the bootup time.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Thanks!  I was just reviewing the addition of your dll_link_up IRQ
handler, and was about to ask whether you wanted to set use_linkup_irq
to avoid the wait, but here's the patch already :)

I think I'll sort out the branches so the dll_link_up IRQ handler,
this patch, and the corresponding qcom change go on the same branch as
Krishna's patch to skip waiting if pp->use_linkup_irq.

> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 1170e1107508bd793b610949b0afe98516c177a4..62034affb95fbb965aad3cebc613a83e31c90aee 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -435,6 +435,7 @@ static int rockchip_pcie_configure_rc(struct rockchip_pcie *rockchip)
>  
>  	pp = &rockchip->pci.pp;
>  	pp->ops = &rockchip_pcie_host_ops;
> +	pp->use_linkup_irq = true;
>  
>  	return dw_pcie_host_init(pp);
>  }
> 
> ---
> base-commit: 2adda4102931b152f35d054055497631ed97fe73
> change-id: 20250113-rockchip-no-wait-403ffbc42313
> 
> Best regards,
> -- 
> Niklas Cassel <cassel@kernel.org>
> 

