Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78898C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 22:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skJlv5nKrKt+KRG5Rl9pA53QIJvUZRFd59QA2jsBb7s=; b=eTNBP64j2wZhpJSF6LxT4bGWlK
	C00ZTHm0Z0rNHCODaLjN3Dxen+tMi+t3uyHPn6Wyf1cuciMonHDG5DzsKlzPWd4pElJmlPsZGATPN
	4c3Z00aB7HwhmsORBtZIaLMXAz5O+s+B1WLPHmqZfwMCHKKP/6nTaseCDrT5NrzQyAcK1LubF6Wt9
	qfZ2tczPS14W7L3TV0VizdDhIRSqYHFujRqnsIncehrONXRzL+GfRE+sCYMy+JqXoTfD9i6beOOHu
	lmiDcsUq5EAOX2T7RAodAnE+YW/gOazYtD/k2MhbdIWl2XODXxZ5et4ByZtwbjyFA2dhDw3PKRaL1
	3MZ8aXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5wz-00000006vsV-3bCy;
	Mon, 17 Aug 2026 22:37:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5wt-00000006vp3-3Kqj;
	Mon, 17 Aug 2026 22:36:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCAAF601E0;
	Mon, 17 Aug 2026 22:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA811F00A3A;
	Mon, 17 Aug 2026 22:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787006214;
	bh=skJlv5nKrKt+KRG5Rl9pA53QIJvUZRFd59QA2jsBb7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IrLkPfJSSwOJfhJJMIu+eeJpnn9ObnoEbCNsBJQfqNlVJ9vFbMviZ227fJz+gox51
	 LsnIEJY4hf0CA3nuSm/jXKVWV2fEBmJxtdMrhDhkvFE45Aa4DRAS8pGXQvrQC7MsoY
	 na21r2TUdk3N4gkBenpctfhajDbn3vvz6h/PbtwlyoDeXe/h6OKesTV+0JDhOBulq9
	 5oyfQGy8raOuOM8x/6a6b9dMQajPWReKULUUcnn4VhZ/n/B1UhU7f9DJyT/gWP9/MH
	 Ob/Mb9B98dxq1baw7drUw/ZTQUDnrEcIIth0eUitmYPTyWwC7yUzzRp9AKcPEN61me
	 aDZILxQe2w03g==
From: Jakub Kicinski <kuba@kernel.org>
To: jackbb_wu@compal.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	wen-zhi.huang@mediatek.com,
	shi-wei.yeh@mediatek.com,
	Minano.tseng@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	robert_yu@compal.com,
	Jeff_Chang@compal.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/7] net: wwan: t9xx: Add control plane transaction layer
Date: Mon, 17 Aug 2026 15:36:52 -0700
Message-ID: <20260817223652.3688666-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811-t9xx_driver_v1-v6-2-2c969fad57c6@compal.com>
References: <20260811-t9xx_driver_v1-v6-2-2c969fad57c6@compal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: wwan: t9xx: Add control plane transaction layer

This patch adds the mtk_ctrl_blk and mtk_ctrl_trans data structures along
with mtk_ctrl_init()/mtk_ctrl_exit() for the T9XX WWAN driver.  It also
splits the build into a separate pcie/ Makefile gated by a new hidden
MTK_T9XX_PCI symbol.

A couple of questions below about the module split and the mtk_ctrl_exit()
documentation.

> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
> index 18bd40b3b8d21..a2ffed346acc9 100644
> --- a/drivers/net/wwan/Kconfig
> +++ b/drivers/net/wwan/Kconfig
> @@ -124,6 +124,7 @@ config MTK_T7XX
>  config MTK_T9XX
>  	tristate "MediaTek PCIe 5G WWAN modem T9xx device"
>  	depends on PCI && ACPI
> +	select MTK_T9XX_PCI
>  	select NET_DEVLINK
>  	help
>  	  Enables MediaTek PCIe based 5G WWAN modem (T9xx series) device.
> @@ -133,6 +134,10 @@ config MTK_T9XX
>  
>  	  If unsure, say N.
>  
> +config MTK_T9XX_PCI
> +	tristate
> +	depends on PCI
> +
>  endif # WWAN
>  
>  endmenu
> diff --git a/drivers/net/wwan/t9xx/Makefile b/drivers/net/wwan/t9xx/Makefile
> index 6f2dd3f914543..ae9d6f2344ab4 100644
> --- a/drivers/net/wwan/t9xx/Makefile
> +++ b/drivers/net/wwan/t9xx/Makefile
> @@ -4,7 +4,8 @@ ccflags-y += -I$(src)/pcie
>  ccflags-y += -I$(src)
>  
>  obj-$(CONFIG_MTK_T9XX) += mtk_t9xx.o
> +obj-$(CONFIG_MTK_T9XX_PCI) += pcie/
>  
>  mtk_t9xx-y := \
> -	pcie/mtk_pci.o \
> -	pcie/mtk_pci_drv_m9xx.o
> +	mtk_dev.o \
> +	mtk_ctrl_plane.o

[Severity: Low]
Should the commit message mention this module split?  Before this patch
mtk_t9xx-y contained pcie/mtk_pci.o and pcie/mtk_pci_drv_m9xx.o, so
mtk_t9xx.ko was the module carrying module_pci_driver() and
MODULE_DEVICE_TABLE(pci, ...) from mtk_pci.c.

After this patch those two objects move into a second module built from
pcie/Makefile:

  obj-$(CONFIG_MTK_T9XX_PCI) += mtk_t9xx_pcie.o

  mtk_t9xx_pcie-y := \
	mtk_pci_drv_m9xx.o \
	mtk_pci.o

so the module that binds the hardware and carries the PCI modaliases is
now mtk_t9xx_pcie.ko, while mtk_t9xx.ko only holds mtk_dev.o and
mtk_ctrl_plane.o with no driver registration.

The MTK_T9XX help text still says:

	  To compile this driver as a module, choose M here: the module will be
	  called mtk_t9xx.

Should that be updated to name mtk_t9xx_pcie as well?  The new hidden
MTK_T9XX_PCI symbol, which is what actually gates building the PCI driver
objects, is not described anywhere either.  Both the split and the help
text are still in this shape at the end of the series (cbf822bf).

> diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.c b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
> new file mode 100644
> index 0000000000000..cf6079218e1ce
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
> @@ -0,0 +1,45 @@

[ ... ]

> +int mtk_ctrl_init(struct mtk_md_dev *mdev)
> +{
> +	struct mtk_ctrl_blk *ctrl_blk;
> +
> +	ctrl_blk = devm_kzalloc(mdev->dev, sizeof(*ctrl_blk), GFP_KERNEL);
> +	if (!ctrl_blk)
> +		return -ENOMEM;
> +
> +	ctrl_blk->mdev = mdev;
> +	mdev->ctrl_blk = ctrl_blk;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(mtk_ctrl_init);
> +
> +/**
> + * mtk_ctrl_exit() - Clean up the control plane block.
> + * @mdev: Pointer to the MTK modem device.
> + *
> + * Frees the control plane block associated with @mdev.
> + */
> +void mtk_ctrl_exit(struct mtk_md_dev *mdev)
> +{
> +	mdev->ctrl_blk = NULL;
> +}
> +EXPORT_SYMBOL(mtk_ctrl_exit);

[Severity: Low]
Does the kernel-doc for mtk_ctrl_exit() match what the function does?  The
comment says "Frees the control plane block associated with @mdev", but the
body only clears the pointer:

  void mtk_ctrl_exit(struct mtk_md_dev *mdev)
  {
	mdev->ctrl_blk = NULL;
  }

The block comes from devm_kzalloc(mdev->dev, ...) in mtk_ctrl_init(), so it
stays on the device's devres list until driver detach.

Tracing the callers at the end of the series (cbf822bf), mtk_ctrl_init() is
only reached via mtk_pci_probe()->mtk_pci_dev_init()->mtk_trans_ctrl_init(),
and mtk_ctrl_exit() only from the probe error path and mtk_pci_remove(), so
there is one init/exit per device lifetime and nothing is actually leaked
here.

The wording is still "Frees the control plane block" at cbf822bf, where the
body unregisters the FSM notifier, calls mtk_port_mngr_exit() and nulls the
pointer.  Could the doc be reworded to say the pointer is cleared and the
allocation is released by devres, so a later patch adding an explicit
devm_kfree() does not end up double freeing it?

