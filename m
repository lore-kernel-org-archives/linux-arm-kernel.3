Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0B9CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 18:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=CwZGbYEO/VvrGYhP7TN/I2d/WvK58jBWlivKb8AGeWg=; b=x2e3N7sd2tsHnM
	E60WfIVM4Dn+HgAPDG9arxNmslA8/mBH68DyTaW8BEzLOAlctLOr+k5+zdz+yRCRHnyTN5NnTRUGr
	ks1vkDM4gUUxyhIqdTnHA6hXnCO6AkCYrXlqoivAzCqXF1gIurLM9/j/n+EbZtEM1u4RR1srRSm7N
	9HNnc38pU5NhamPwKeI7xcXeDBgN0c9xx4KqRBJGhA10cIbv3De0n5eRrnqg4d7+QF2lMWBB3I2P4
	O7zCpHe3gF35POtGW8fDSwpwGfVJaDHXy+HL1zTX7fxknEHHsPetg85hRTCuUxzN8uNztqeZuPEdG
	eRsrz/CiGJvThuzXNo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFz0s-0000000ASxu-2Jp1;
	Mon, 03 Nov 2025 18:10:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFz0r-0000000ASxk-1W0v;
	Mon, 03 Nov 2025 18:10:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FD446013C;
	Mon,  3 Nov 2025 18:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03921C4CEE7;
	Mon,  3 Nov 2025 18:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762193440;
	bh=dZ5DzmV8v+EdzX/v24I9P1Dtpu2Lj+7owRynAELiKHQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LwB/JXL47a6IAwbTm9xSakkJCGfu82fn/vpMMT6GFWRB6cQ0dL2vEVWxPkGkmN+N/
	 1EkdRhwDrAHXkytiFeIwv/kWUcnqe1++yX7rQ2xrNS6MoNfcRMuoVUIXLkO546Edak
	 EGkq79cEE0iemsqGiiDdxOTQZgkTya6f4jriLo0bfK2vQso/PHIHxYRjm1BIMXbLkw
	 MRYd/0ugIMaWgcmpGmednsEbbBZYJFD4BBdr5HPZvtN/nk7/C/+VSM0f+h1zscxvHE
	 kuXtZQ32SPf/HLrlhA7hUUtHooqG67Z7hW6Dc/Ez7IRSAiCGEP46p6X0vPqoYkmPaJ
	 FB1RjwG24qhMQ==
Date: Mon, 3 Nov 2025 12:10:38 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>
Subject: Re: [RFC PATCH 2/2] PCI: rockchip-host: drop wait on PERST# toggle
Message-ID: <20251103181038.GA1814635@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3d0c3a387ff461e62bbd66a0bde654a9a17761e.1762150971.git.geraldogabriel@gmail.com>
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

On Mon, Nov 03, 2025 at 03:27:25AM -0300, Geraldo Nascimento wrote:
> With this change PCIe will complete link-training with a known quirky
> device - Samsung OEM PM981a SSD. This is completely against the PCIe
> spec and yet it works as long as the power regulator for 3v3 PCIe
> power is not defined as always-on or boot-on.

What is against the spec?  In what way is this SSD "known quirky"?  Is
there a published erratum for it?

Removing this delay might make this SSD work, but if this delay is
required per PCIe spec, how can we be confident that other devices
will still work?

Reports of devices that still work is not really enough to move this
from the "hack that makes one device work" column to the "safe and
effective for all devices" column.

It's easy to see how *lack* of a delay can break something, but much
harder to imagine how *removing* a delay can make something work.
Devices must be able to tolerate pretty much arbitrary delays.

> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip-host.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> index ee1822ca01db..6add0faf6dc9 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -314,7 +314,6 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
>  	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
>  			    PCIE_CLIENT_CONFIG);
>  
> -	msleep(PCIE_T_PVPERL_MS);
>  	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
>  
>  	msleep(PCIE_RESET_CONFIG_WAIT_MS);
> -- 
> 2.49.0
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

