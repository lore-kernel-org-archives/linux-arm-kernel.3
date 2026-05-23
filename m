Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81148CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 01:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DOM+ISKNcSFebVAP5pIedBdmbNcMKzy4d24GOB2ZIk=; b=2RYoQiAKgVh/w+rBDFBn+5dfsz
	oSMbtvD09O1ewF1jLy1gYVblhTNA808XFh4uxnE9Z3pepASTMUBN4xIuvqw5mBRPZl0dTFkkZXyud
	+Tx8069sjs5yoxJOuaU+2OKl1AHYm2NKQOKvdX2DGarxuffKuhS0tOO1h80db6oQdPYT7CJ9m+CDQ
	A+pg9l7s53ktvte8vMI2E0oiwnit+EdWtfrBuf0phNjEb467+huScGXG6TdhKWXycUhINeqiX9R8l
	zk6fvAfmpsvjA2kxBKQSbBTftjh4wxONGCw0WVTTxfY94Y5x+cHigwxlJmpi9kJ+CNFWY6mrQLUJy
	eGyrxkow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQbbW-0000000CUF2-1diV;
	Sat, 23 May 2026 01:56:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQbbU-0000000CUEt-2D4P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 01:56:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8102060103;
	Sat, 23 May 2026 01:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658171F000E9;
	Sat, 23 May 2026 01:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779501399;
	bh=3DOM+ISKNcSFebVAP5pIedBdmbNcMKzy4d24GOB2ZIk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QcWPDC9RCLoP/1403KuaJs8HJLSSIQ4DsF8kskuKSuxiVm2hBB7Mr4nSSfG16QVTk
	 852ys8TA1iix9fyxX1jaiJo9vTE3wKe6OeKvEEqxZft71sq2QuCACpfJKeuig03E8R
	 8K7ikSqJWfGYNYGFvBum3ZTZw1QGmdyRgBUXnIIeeAGLBz6XkhxgO9uKCTN9X0CWFD
	 ZWeyFr4BFYoqzt0oxV+0bNmK9DKQmC3R2K2/ZAdo5iQQdJrplySB9TNvJjUwLuz43V
	 a2dGN9eefqE8Iyn+9PmzrWL8GAjIj1bHhhW9Hf+ZTXvOy4qUzvioOdXqnNhgyfjbQR
	 nY5lbQspCV/MA==
Date: Fri, 22 May 2026 18:56:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Steen
 Hegelund <steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
 "Alexei Starovoitov" <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, "Jesper Dangaard Brouer" <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>,
 Herve Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mohsin Bashir
 <mohsin.bashr@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v5 09/13] net: lan966x: add PCIe FDMA support
Message-ID: <20260522185637.1fe72213@kernel.org>
In-Reply-To: <20260520-lan966x-pci-fdma-v5-9-ca56197ae05b@microchip.com>
References: <20260520-lan966x-pci-fdma-v5-0-ca56197ae05b@microchip.com>
	<20260520-lan966x-pci-fdma-v5-9-ca56197ae05b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 20 May 2026 10:12:21 +0200 Daniel Machon wrote:
> Add PCIe FDMA support for lan966x. The PCIe FDMA path uses contiguous
> DMA buffers mapped through the endpoint's ATU, with memcpy-based frame
> transfer instead of per-page DMA mappings.
> 
> With PCIe FDMA, throughput increases from ~33 Mbps (register-based I/O)
> to ~620 Mbps on an Intel x86 host with a lan966x PCIe card.

> diff --git a/drivers/net/ethernet/microchip/lan966x/Makefile b/drivers/net/ethernet/microchip/lan966x/Makefile
> index 4cdbe263502c..ac0beceb2a0d 100644
> --- a/drivers/net/ethernet/microchip/lan966x/Makefile
> +++ b/drivers/net/ethernet/microchip/lan966x/Makefile
> @@ -18,6 +18,10 @@ lan966x-switch-objs  := lan966x_main.o lan966x_phylink.o lan966x_port.o \
>  lan966x-switch-$(CONFIG_LAN966X_DCB) += lan966x_dcb.o
>  lan966x-switch-$(CONFIG_DEBUG_FS) += lan966x_vcap_debugfs.o
>  
> +ifdef CONFIG_MCHP_LAN966X_PCI

ifeq ()

would be more common in a Makefile?

> +lan966x-switch-y += lan966x_fdma_pci.o
> +endif
> +

> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> index cc3c7b6c65ae..7036b1d937d5 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> @@ -7,6 +7,7 @@
>  #include <linux/ip.h>
>  #include <linux/of.h>
>  #include <linux/of_net.h>
> +#include <linux/pci.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> @@ -49,6 +50,9 @@ struct lan966x_main_io_resource {
>  static const struct lan966x_main_io_resource lan966x_main_iomap[] =  {
>  	{ TARGET_CPU,                   0xc0000, 0 }, /* 0xe00c0000 */
>  	{ TARGET_FDMA,                  0xc0400, 0 }, /* 0xe00c0400 */
> +#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)

why config option being enabled changes the targets?
Can someone with a non-PCI device enable that option too
(sure it would be useless but given that/if they can guarding
with an #if seems like a waste of LoC)

> +	{ TARGET_PCIE_DBI,             0x400000, 0 }, /* 0xe0400000 */
> +#endif
>  	{ TARGET_ORG,                         0, 1 }, /* 0xe2000000 */
>  	{ TARGET_GCB,                    0x4000, 1 }, /* 0xe2004000 */
>  	{ TARGET_QS,                     0x8000, 1 }, /* 0xe2008000 */
> @@ -1100,6 +1104,13 @@ static int lan966x_reset_switch(struct lan966x *lan966x)
>  
>  static const struct lan966x_fdma_ops *lan966x_get_fdma_ops(struct device *dev)
>  {
> +#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
> +	for (struct device *p = dev->parent; p; p = p->parent) {
> +		if (dev_is_pci(p))

If the PCIe devices also use an intermediate platform device for
probing, can't they explicitly have some flag / state to indicate
they are PCIe? The device walk in such a constrained env seems
like an overkill

> +			return &lan966x_fdma_pci_ops;
> +	}
> +#endif
> +
>  	return &lan966x_fdma_ops;
>  }
>  
> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
> index 5f4dbeda17cd..e7fdd4447fb6 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.h
> @@ -17,6 +17,9 @@
>  #include <net/xdp.h>
>  
>  #include <fdma_api.h>
> +#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
> +#include <fdma_pci.h>
> +#endif

Conditional #includes make build testing harder, better to avoid them

>  #include <vcap_api.h>
>  #include <vcap_api_client.h>
>  
> @@ -288,6 +291,10 @@ struct lan966x {
>  
>  	void __iomem *regs[NUM_TARGETS];
>  
> +#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
> +	struct fdma_pci_atu atu;
> +#endif
> +
>  	int shared_queue_sz;
>  
>  	u8 base_mac[ETH_ALEN];
> @@ -586,6 +593,10 @@ void lan966x_fdma_wakeup_netdev(struct lan966x *lan966x);
>  int lan966x_fdma_get_max_frame(struct lan966x *lan966x);
>  int lan966x_qsys_sw_status(struct lan966x *lan966x);
>  
> +#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
> +extern const struct lan966x_fdma_ops lan966x_fdma_pci_ops;
> +#endif

There should be no need to wrap extern in an #if

