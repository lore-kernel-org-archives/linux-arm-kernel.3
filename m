Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FF5D46627
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 22:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=T656zAyoKHX86Pqtq137TUW74wWEeNohQYpQUk3FoxQ=; b=Q+2eJmmEhU+gZP
	wvdPYKmEJOaPp+N44hx69DQBryD90WXxxZGwPeL9t0MdXLIHZ4KE2OVSReIoM5SlANyU+EQFIzgPq
	1IezNtz3iyPIxbQGsekfJt7doJMsygIa2Z3O7/Le8XmtkwxWJnRhJl9+Y3QLWQEDr9KAKE7G00xQP
	rhQU5R/XtSPJtLX9WUR+CFlPm1PTHLJcHKXPQ5crDX4z30Vx7cnEQhAVgx7U8BtI/O6q+NVdjK1Wj
	LwguQ+TcRix/4f3jDPuF5E7rLnj/Qc9Ol01Bfq4rOb8O+vFVst9auITR88thlgFhlcdX9/6W+33DT
	ct4DoZ9CHshRCnimTcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVZ1-0000000DGN1-1Fij;
	Thu, 15 Jan 2026 22:11:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVYy-0000000DGMF-38tC;
	Thu, 15 Jan 2026 22:11:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E81C84324E;
	Thu, 15 Jan 2026 22:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC537C116D0;
	Thu, 15 Jan 2026 22:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768515091;
	bh=0SEivEHbabil1CHBC8JpeP5x7F1OA3GPzLMXSrZWkec=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VK1J4/CNQCVD8FZw3E3b/VNcqldFEuoeZnmUYjlr5AXsQaB64xvFqRToWMjmFhRav
	 K+/mGFQoArrB2IDc/Cy6g/jGr1rFlDSsonYvSxylHro++kAYzriCuQFTi9MZWpRkCV
	 CwaHtV9S0EtC8DZTvQ5CJQXQqoFIuObK9Dw2KYndzdRyhd32rv+aZjq3OaAMBGdQoB
	 xZRFSa2CUkkoZD3MXH9vfeQE1becBtu0hLxESLsV4ur0WPP8VmpY0Uhr3XvXF5wo9d
	 je5anl2T87g4ekF14kooL/sGJNUIFhH8WZT8kb10Z3csBj87ODojxXA/pQnlR+k6ul
	 qbbH4C6QjZrQg==
Date: Thu, 15 Jan 2026 16:11:30 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Johnny Chang <Johnny-CC.Chang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Digits_Upstream_Group@mediatek.com,
	Lukas Wunner <lukas@wunner.de>, Jason Gunthorpe <jgg@nvidia.com>,
	Alex Williamson <alex@shazbot.org>,
	Terje Bergstrom <tbergstrom@nvidia.com>
Subject: Re: [PATCH] PCI: Mark Nvidia GB10 to avoid bus reset
Message-ID: <20260115221130.GA888637@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113084441.2124737-1-Johnny-CC.Chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_141132_827786_1A57F0EF 
X-CRM114-Status: GOOD (  16.04  )
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

On Thu, Nov 13, 2025 at 04:44:06PM +0800, Johnny Chang wrote:
> From: Johnny-CC Chang <Johnny-CC.Chang@mediatek.com>
> 
> Nvidia GB10 PCIe hosts will encounter problem occasionally
> after SBR(secondary bus reset) is applied.
> Enable NO_BUS_RESET quirk for Nvidia GB10 PCIe hosts.
> 
> Signed-off-by: Johnny-CC Chang <Johnny-CC.Chang@mediatek.com>

Applied with the commit log below to pci/virtualization for v6.20,
thanks!

  PCI: Mark Nvidia GB10 to avoid bus reset
  
  After asserting Secondary Bus Reset to downstream devices via a GB10 Root
  Port, the link may not retrain correctly, e.g., the link may retrain with a
  lower lane count or config accesses to downstream devices may fail.
  
  Prevent use of Secondary Bus Reset for devices below GB10.
  
  Signed-off-by: Johnny-CC Chang <Johnny-CC.Chang@mediatek.com>
  [bhelgaas: drop pci_ids.h update (only used once), update commit log]
  Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
  Link: https://patch.msgid.link/20251113084441.2124737-1-Johnny-CC.Chang@mediatek.com

> ---
>  drivers/pci/quirks.c    | 11 +++++++++++
>  include/linux/pci_ids.h |  2 ++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index b94264cd3833..12a10fa84c8a 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -3746,6 +3746,17 @@ static void quirk_no_bus_reset(struct pci_dev *dev)
>  	dev->dev_flags |= PCI_DEV_FLAGS_NO_BUS_RESET;
>  }
>  
> +/*
> + * Nvidia GB10 PCIe hosts will encounter problem occasionally
> + * after SBR (secondary bus reset) is applied.
> + * SBR needs to be prevented for these PCIe hosts.
> + */
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_GB10_GEN5_X4,
> +			 quirk_no_bus_reset);
> +
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_GB10_GEN4_X1,
> +			 quirk_no_bus_reset);
> +
>  /*
>   * Some NVIDIA GPU devices do not work with bus reset, SBR needs to be
>   * prevented for those affected devices.
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 92ffc4373f6d..661dc1594213 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -1382,6 +1382,8 @@
>  #define PCI_DEVICE_ID_NVIDIA_GEFORCE_320M           0x08A0
>  #define PCI_DEVICE_ID_NVIDIA_NFORCE_MCP79_SMBUS     0x0AA2
>  #define PCI_DEVICE_ID_NVIDIA_NFORCE_MCP89_SATA	    0x0D85
> +#define PCI_DEVICE_ID_NVIDIA_GB10_GEN5_X4           0x22CE
> +#define PCI_DEVICE_ID_NVIDIA_GB10_GEN4_X1           0x22D0
>  
>  #define PCI_VENDOR_ID_IMS		0x10e0
>  #define PCI_DEVICE_ID_IMS_TT128		0x9128
> -- 
> 2.45.2
> 

