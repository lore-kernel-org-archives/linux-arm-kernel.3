Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678C1C4450E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTo70EXcAY1AdpA01QmFv+nicuUPm+Q2XR6ayAS68A4=; b=4IkedCDd16ulnpzNbbDF8kjt9l
	zHgVNyz5ZXOMjNUp/k0qpV5AHW0ObGZ9CmO3aAOcXjyUqy93T/TC2LA+djYYqPy1s62R2xC9I1oSL
	LapzH4WT9RDtB+d/hinsnd+5maLiFHF43FxVz66NogY0GLdAj+jv4HErRKjain/mtCSAz26V+cV84
	z8uQ/oYdGx+H9XmamClCIjSLFYQDLVWcLLGJGAL4ytrIrjJhMjTKfaasXVF8vfKKj18YdTaLnhkBx
	3iCBtYGipmpK79YGFKrrH179Dgjjwf37BiqYRsPL5gGAGnM2cDALrt0DVXQF7hNJdUpV45CU723Bn
	5uw0IFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkITd-0000000GsbE-1jNe;
	Thu, 16 Jul 2026 09:33:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkITb-0000000Gsaf-1HQt;
	Thu, 16 Jul 2026 09:33:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 14B1D4368A;
	Thu, 16 Jul 2026 09:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAFA1F00A3A;
	Thu, 16 Jul 2026 09:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784194435;
	bh=vTo70EXcAY1AdpA01QmFv+nicuUPm+Q2XR6ayAS68A4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RABLBVjLTTg0ePG/TJZnC1JlezFxCtnstZFm2lTzX5gK3HkRsUWbHbGtgHnqOMrIZ
	 J23d2B/jveCRRyCpm9VK29SrWFOpWXqxL877WgVs4pBcwts4/gDnI8ItE6cJ5wO4K4
	 uSqENw+r/NFYD3sopEoaTntEXr5AnWLXfWg/Qxfclb6PRjXXqeq3i1QJT3weMgOdhl
	 qWKynvHZjXxzYWH4n6GU599UuhaCHSc1DA1Ngjk/IJVctsgOEdgi4vAYhthFtBQ5vk
	 pfJpTAqPj7+XAiRL9bchiusjNlmE8UfaleatP3pfcWoB8k2Y4DmW5tqbpbNTjGYafL
	 bRKALuAK6ZUFw==
From: Simon Horman <horms@kernel.org>
To: jackbb_wu@compal.com
Cc: Simon Horman <horms@kernel.org>,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	wen-zhi.huang@mediatek.com,
	shi-wei.yeh@mediatek.com,
	Minano.tseng@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/7] net: wwan: t9xx: Add PCIe core
Date: Thu, 16 Jul 2026 10:33:24 +0100
Message-ID: <20260716093324.230974-1-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709-t9xx_driver_v1-v4-1-a8c009d509c5@compal.com>
References: <20260709-t9xx_driver_v1-v4-1-a8c009d509c5@compal.com>
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
Full review at: https://sashiko.dev
---
--- Patch [1]: [PATCH v4 1/7] net: wwan: t9xx: Add PCIe core ---
commit 4564b6641dc4f4a3fb3d169ca45443e5d18c66b7
Author: Jack Wu <jackbb_wu@compal.com>

net: wwan: t9xx: Add PCIe core

Registers the T900 device driver with the kernel. Set up all
the fundamental configurations for the device: PCIe layer,
Modem Host Cross Core Interface (MHCCIF), Reset Generation
Unit (RGU), modem common control operations and build
infrastructure.

> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_pci.c b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> index 0000000000000..72259bf1b6033
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
[ ... ]
> +static irqreturn_t mtk_pci_irq_msix(int irq, void *data)
> +{
> +	struct mtk_pci_irq_desc *irq_desc = data;
> +	struct mtk_md_dev *mdev = irq_desc->mdev;
> +	struct mtk_pci_priv *priv;
> +	u32 irq_state, irq_enable;
> +
> +	priv = mdev->hw_priv;
> +	irq_state = mtk_pci_mac_read32(priv, REG_MSIX_ISTATUS_HOST_GRP0_0);
> +	irq_enable = mtk_pci_mac_read32(priv, REG_IMASK_HOST_MSIX_GRP0_0);
> +	irq_state &= irq_enable;
> +
> +	if (unlikely(!irq_state) ||
> +	    unlikely(!((irq_state & GENMASK(priv->irq_cnt - 1, 0)) &
> +		      irq_desc->msix_bits)))
> +		return IRQ_NONE;

[Severity: High]
Does this logic silently drop hardware interrupts when fewer than 32 vectors are
allocated?

Because hardware source bits map to fixed high bit positions (such as bit 28
for MTK_IRQ_SRC_MHCCIF), systems that allocate fewer vectors will mask out
these high bits with GENMASK(priv->irq_cnt - 1, 0).

Evaluating !(0 & msix_bits) as true returns IRQ_NONE, which may eventually
disable the interrupt line.

[ ... ]
> +static int mtk_pci_request_irq_msix(struct mtk_md_dev *mdev,
> +				    int irq_cnt_allocated)
> +{
> +	struct mtk_pci_priv *priv = mdev->hw_priv;
> +	struct mtk_pci_irq_desc *irq_desc;
> +	struct pci_dev *pdev;
> +	int irq_cnt;
> +	int ret, i;
> +
> +	/* calculate the nearest 2's power number */
> +	irq_cnt = BIT(fls(irq_cnt_allocated) - 1);
> +	pdev = to_pci_dev(mdev->dev);
> +	irq_desc = priv->irq_desc;
> +	for (i = 0; i < irq_cnt; i++) {
> +		irq_desc[i].mdev = mdev;
> +		irq_desc[i].msix_bits = BIT(i);
> +		snprintf(irq_desc[i].name, MTK_IRQ_NAME_LEN, "msix%d-%s", i, mdev->dev_str);
> +		ret = pci_request_irq(pdev, i, mtk_pci_irq_msix, NULL,
> +				      &irq_desc[i], irq_desc[i].name);

[Severity: Medium]
Could this trigger a -Wformat-security compiler warning?

Passing a dynamic string variable directly as the format string to
pci_request_irq() can lead to format string vulnerabilities. Should this use
"%s", irq_desc[i].name instead?

[ ... ]
> +static u32 mtk_pci_ext_h2d_evt_hw_bits(u32 chs)
> +{
> +	u32 hw_bits = 0;
> +
> +	SET_HW_BITS(hw_bits, chs, MHCCIF_RC2EP_EVT_DEVICE_RESET,
> +		    DEV_EVT_H2D_DEVICE_RESET);
> +	return LE32_TO_U32(cpu_to_le32(hw_bits));
> +}

[ ... ]

> +int mtk_pci_send_ext_evt(struct mtk_md_dev *mdev, u32 ch)
> +{
> +	struct mtk_pci_priv *priv = mdev->hw_priv;
> +	u32 rc_base, hw_bits;
> +
> +	rc_base = priv->cfg->mhccif_rc_base_addr;
> +
> +	/* Only allow one ch to be triggered at a time */
> +	if (!is_power_of_2(ch)) {
> +		dev_err(mdev->dev, "Unsupported ext evt ch=0x%08x\n", ch);
> +		return -EINVAL;
> +	}
> +
> +	hw_bits = mtk_pci_ext_h2d_evt_hw_bits(ch);
> +	mtk_pci_write32(mdev, rc_base + MHCCIF_RC2EP_SW_BSY, hw_bits);
> +	mtk_pci_write32(mdev, rc_base + MHCCIF_RC2EP_SW_TCHNUM, ffs(hw_bits) - 1);

[Severity: Medium]
Will this break channel index calculation on big-endian systems?

If hw_bits has already been byte-swapped by cpu_to_le32() inside
mtk_pci_ext_h2d_evt_hw_bits(), performing ffs(hw_bits) - 1 on the byte-swapped
integer will result in a completely incorrect bit index.

[Severity: Medium]
What happens if the driver attempts to send an unmapped channel?

If ch is not mapped in mtk_pci_ext_h2d_evt_hw_bits(), hw_bits will evaluate
to 0. The calculation ffs(0) - 1 will then underflow to 0xFFFFFFFF. This
value is written directly to the hardware and might hang or crash the device
firmware.

[ ... ]
> +static int mtk_pci_bar_init(struct mtk_md_dev *mdev)
> +{
> +	struct pci_dev *pdev = to_pci_dev(mdev->dev);
> +	struct mtk_pci_priv *priv = mdev->hw_priv;
> +	u32 bar[MTK_PCI_BAR_NUM];
> +	int i, ret;
> +
> +	for (i = 0; i < MTK_PCI_BAR_NUM; i++)
> +		pci_read_config_dword(to_pci_dev(mdev->dev),
> +				      PCI_BASE_ADDRESS_0 + (i << 2), bar + i);
> +
> +	ret = pcim_iomap_regions(pdev, MTK_REQUESTED_BARS, mdev->dev_str);
> +	if (ret) {
> +		dev_err(mdev->dev, "Failed to init MMIO. ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	/* get ioremapped memory */
> +	priv->mac_reg_base = pcim_iomap_table(pdev)[MTK_BAR_0_1_IDX];
> +	priv->bar23_addr = pcim_iomap_table(pdev)[MTK_BAR_2_3_IDX];
> +	if (!priv->mac_reg_base || !priv->bar23_addr) {
> +		dev_err(mdev->dev, "Failed to init BAR.\n");
> +		return -EINVAL;
> +	}
> +	/* We use MD view base address "0" to observe registers */
> +	priv->ext_reg_base = priv->bar23_addr - ATR_PCIE_REG_TRSL_ADDR;

[Severity: Medium]
Is it safe to store an out-of-bounds pointer?

ATR_PCIE_REG_TRSL_ADDR is 0x10000000, and subtracting it here results in
priv->ext_reg_base pointing well outside the allocated object. This invokes
undefined behavior and might cause crashes or be optimized out by UBSAN.

Could the correct offset be calculated at the time of access instead?

[ ... ]
> +static void mtk_pci_remove(struct pci_dev *pdev)
> +{
> +	struct mtk_md_dev *mdev = pci_get_drvdata(pdev);
> +	struct mtk_pci_priv *priv = mdev->hw_priv;
> +	struct device *dev = &pdev->dev;
> +
> +	mtk_pci_mask_irq(mdev, priv->mhccif_irq_id);
> +
> +	if (mtk_pci_pldr(mdev)) {
> +		dev_warn(dev, "Failed to execute PLDR, try external event\n");
> +		mtk_pci_reset(mdev, RESET_MHCCIF);
> +	}
> +
> +	pci_clear_master(pdev);
> +	mtk_pci_free_irq(mdev);
> +	mtk_mhccif_exit(mdev);

[Severity: High]
Does this sequence result in the device being powered off before the OS
interrupt handlers and workqueues are synchronized?

Calling mtk_pci_pldr() executes the ACPI PXP._OFF method, cutting power.
If mtk_mhccif_exit() (which calls cancel_work_sync(&priv->mhccif_work))
or mtk_pci_free_irq() runs after this, a concurrently executing workqueue
or interrupt handler might attempt to read MMIO registers from a powered-off
device, causing bus errors and kernel panics.

[ ... ]
> +static pci_ers_result_t mtk_pci_error_detected(struct pci_dev *pdev,
> +					       pci_channel_state_t state)
> +{
> +	struct mtk_md_dev *mdev = pci_get_drvdata(pdev);
> +
> +	dev_err(mdev->dev, "AER detected: pci_channel_state_t=%d\n", state);
> +
> +	/* Request a slot reset. */
> +	return PCI_ERS_RESULT_CAN_RECOVER;
> +}

[Severity: Medium]
Will returning PCI_ERS_RESULT_CAN_RECOVER actually abort the slot reset?

The comment says "Request a slot reset", but CAN_RECOVER instructs the PCI
core to skip the reset. Furthermore, since the driver provides no .resume or
.mmio_enabled callbacks, the device remains in a corrupted state despite
being marked as recovered.

Shouldn't this return PCI_ERS_RESULT_NEED_RESET?

