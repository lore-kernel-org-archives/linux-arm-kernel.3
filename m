Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E726CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKG9KfjsBZNP0cHiXQ7BMxhy+RjDiC6dJvBuO/eThmM=; b=p8+B7wNE9o2Jo5zBNM/co9ElfW
	6oFz/gtkEU9K24SIsegt0+Fc3DAdPllYOXfKb42WmtgmijjEhHbsWKA3wJNkzUPM9lxv70NV8hPsQ
	NBafM1gsFOmRqcmdWrf9RNvO31Vr/MoPueHvppI6PP5NtTqwMKeYcMbU85pcCk+JkXMojSZEICdG9
	lyt7MdfCqUhAUgqsfBvYKxrRbn5LFjFGw93s1tEXdRXIOtqC0PDdtdTdRA0R5QhW6bETtJuze5QMt
	QqdaWTM+5g+dJZnq0NMzb3ENiBTmCjk0CuBYFEMvabrjM3E085EBoFiMLaJXseg2D9cQ0XtGC1+oR
	NaP/cvsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkTQ-00000005e5H-3OvF;
	Fri, 31 Oct 2025 08:27:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkTL-00000005e4d-0CKs;
	Fri, 31 Oct 2025 08:27:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1216844075;
	Fri, 31 Oct 2025 08:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D0FC4CEE7;
	Fri, 31 Oct 2025 08:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761899216;
	bh=7FtxklPeT6kKf2wTFmqdmmGJFJ7GxQ6bHxoFQMYY/V4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3zR/XC7p6Zomw1FOVOBxx9Hg3K/K3GJWlmPCCuxACNGowc+e/9Lnz3fDyl1oam56
	 HN6xulnnJf4h19cSOG0ColJf3c/MoRjB91E03+KslAEijYiNWoO0jNmmBotvaMzzfE
	 CaVyetElwwXlVUospfMZWUmXYPpk46l4h/Doc1CNXHm+ZXdt1rSKJ9loGBPwNfog3J
	 UDQxJ8XqbftMrM5RT67moTYhKVxDL2tzKX15TfAIBlEdscNmNc9iyb+B3+/I/bU9tF
	 aBXiJxaLh7pt4mt993I2WiNqJaud8c2vrGlJL5fXWZXbOgoGlJb8sM3c+T45jdoqeO
	 FRQ8TsN2su5aw==
Date: Fri, 31 Oct 2025 13:56:43 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, "open list:PCIE DRIVER FOR ROCKCHIP" <linux-pci@vger.kernel.org>, 
	"open list:PCIE DRIVER FOR ROCKCHIP" <linux-rockchip@lists.infradead.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] PCI: rockchip: Propagate dev_err_probe return value
Message-ID: <kgnhru4vpkt6vgsmphrvxhpeuvl73tlt35vmi5ubgmnxyvdk5k@6tpvzojpaflz>
References: <20251018061127.7352-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251018061127.7352-1-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_012659_133534_276F6D3C 
X-CRM114-Status: GOOD (  16.20  )
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

On Sat, Oct 18, 2025 at 11:41:26AM +0530, Anand Moon wrote:
> Ensure that the return value from dev_err_probe() is consistently assigned
> back to return in all error paths within rockchip_pcie_init_port()
> function. This ensures the original error code are propagation for
> debugging.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
> index 0f88da3788054..124ab7b9f3404 100644
> --- a/drivers/pci/controller/pcie-rockchip.c
> +++ b/drivers/pci/controller/pcie-rockchip.c
> @@ -134,7 +134,7 @@ int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
>  	err = reset_control_bulk_assert(ROCKCHIP_NUM_CORE_RSTS,
>  					rockchip->core_rsts);
>  	if (err) {
> -		dev_err_probe(dev, err, "Couldn't assert Core resets\n");
> +		err = dev_err_probe(dev, err, "Couldn't assert Core resets\n");

This change is pointless. Is the 'err' value going to change with the
reassignment? NO. Then what this change is about?

Please do not send cleanup patches that does nothing useful.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

