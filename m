Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D125FB5173
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 02:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vD43A7PaqxDLcWlJP3lFtrRbxPkAYqVqlVIjOSV6+Cs=; b=RqLLO+PGNY3gs/TH4MZ9uL9RR/
	IdImjhrIp0qpYQvbO3Pw+qfvLfyXnlLZ+ia4cbPv+4ELDpD8p9kKk+Qp8A6zPC8h0wt1Wbn+v/RCh
	kNKMD7scHGnLgWLZiU52vk6LGkzrJP7xFqjHQbzSDBtUq0TUt52pUyk1ipY+oZe+XZXwus+/5ZH7a
	UnE1CCmBntBPXSSjvPtSZy9QpSEodoqnwi0hfRA54s8l9cViDFXZK3KfnGz5U0ZvKar9j3RDBxS3h
	BQBAE9UOQMxu/NDN0pMy5wddueI4pKXFpp1+a1NnhY7NiBPbHebQLrD1Gov0FEYpPCFtDSX4YZ3+H
	fqYmlDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vtH-00000005k59-14tW;
	Tue, 07 Apr 2026 02:10:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vtF-00000005k4N-1xZP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 02:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F4A66133A;
	Tue,  7 Apr 2026 02:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFAFC2BCB2;
	Tue,  7 Apr 2026 02:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775527804;
	bh=ZIIp/+ZUoCnQFU4UxASiRQxcQE6IhtOQ6CK/qGpyTpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YheRBWI9F1HtwM5G2yFcl/FwnK3egO39Fh7LQR9y1FIfLXGbOI8XXGmqxsOnBUXW9
	 YL8KsmM170BEIkKX0kBJX057CRwyWOO2CLV30RDNLLcbmsLc0+6XObTTmwtJXCWCn7
	 wGBEBWJEWCIpoOSwbFABvEe3w/u6CjzpfUAQi/SizmkqlqNO3c5t6RCEqF7UW4Ukx7
	 9Sh/53wIf/nsDJPF8f9Xo6f+L4cI6QD4727REsxx16GfTCKmPj/Svcskl37NTaAnuh
	 jDtSzPfNSvHofGxD4YIskqMnAHHVSsoR5cbgmL8sh7bVMxVHMbY+eiXv9NrPkHfTQO
	 Wt9CKCQgD7mzQ==
From: Jakub Kicinski <kuba@kernel.org>
To: jitendra.vegiraju@broadcom.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	alexandre.torgue@foss.st.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	richardcochran@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	rmk+kernel@armlinux.org.uk,
	rohan.g.thomas@altera.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sdf@fomichev.me,
	me@ziyao.cc,
	siyanteng@cqsoftware.com.cn,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	vladimir.oltean@nxp.com,
	lizhi2@eswincomputing.com,
	boon.khai.ng@altera.com,
	maxime.chevallier@bootlin.com,
	chenchuangyu@xiaomi.com,
	yangtiezhu@loongson.cn,
	ovidiu.panait.rb@renesas.com,
	chenhuacai@kernel.org,
	florian.fainelli@broadcom.com,
	quic_abchauha@quicinc.com
Subject: Re: [PATCH net-next v9 3/4] net: stmmac: Add PCI glue driver for BCM8958x
Date: Mon,  6 Apr 2026 19:10:01 -0700
Message-ID: <20260407021001.3674617-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402213629.1996133-4-jitendra.vegiraju@broadcom.com>
References: <20260402213629.1996133-4-jitendra.vegiraju@broadcom.com>
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
Date:   Thu Apr 2 21:36:28 2026 +0000

    net: stmmac: Add PCI glue driver for BCM8958x

    Add pci ethernet driver support for Broadcom BCM8958x soc devices used
    in automotive applications. This device features a pcie ethernet mac
    directly attached to an integrated ethernet switch using an xgmii interface.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
> new file mode 100644
> index 0000000000000..e8c6b4b618acb
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
[ ... ]
> +static const struct software_node *brcm_swnodes[] = {
> +	&parent_swnode,
> +	&fixed_link_swnode,
> +	NULL
> +};

Will this statically allocated global software node array cause issues if
multiple devices are present?

If a second device is probed, software_node_register_node_group might fail
with an error. Additionally, if one device is unbound, unregistering the
group could destroy the global nodes, causing a use-after-free for any other
active instances.

Could these software nodes be dynamically allocated per-device?

[ ... ]
> +static int brcm_drv_init(struct device *dev, void *bsp_priv)
> +{
> +	struct brcm_priv_data *brcm_priv = (struct brcm_priv_data *)bsp_priv;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	int vector;
> +	int ret;
> +
> +	/* This device is directly attached to the switch chip internal to the
> +	 * SoC using XGMII interface. Since no MDIO is present, register
> +	 * fixed-link software_node to create phylink.
> +	 */
> +	ret = software_node_register_node_group(brcm_swnodes);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to register software_node\n");
> +	device_set_node(dev, software_node_fwnode(&parent_swnode));

Does device_set_node overwrite the device's primary firmware node here?

Using device_set_node can destroy existing acpi or device tree companion
nodes. Would it be safer to use device_add_software_node instead to attach
the node without overwriting the primary firmware node?

> +
> +	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LOW,
> +			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LO_VALUE);
> +	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HIGH,
> +			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HI_VALUE);
> +
> +	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_OFFSET,
> +		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_VALUE);
> +	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_OFFSET,
> +		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_VALUE);

[ ... ]

> +static void brcm_drv_exit_cleanup(struct device *dev, void *bsp_priv)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	device_set_node(&pdev->dev, NULL);
> +	software_node_unregister_node_group(brcm_swnodes);
> +}

If device_set_node is called with NULL, will it leave the device permanently
mangled without its original firmware node upon unbind?

[ ... ]
> +static int brcm_pci_resume(struct device *dev, void *bsp_priv)
> +{
> +	/* Enable Switch Link */
> +	misc_iowrite(bsp_priv, XGMAC_PCIE_MISC_MII_CTRL_OFFSET,
> +		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_RX |
> +		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_TX |
> +		     XGMAC_PCIE_MISC_MII_CTRL_LINK_UP);
> +
> +	return stmmac_pci_plat_resume(dev, bsp_priv);
> +}

Will the hardware state configured in brcm_drv_init be fully restored after
a suspend and resume cycle?

When a pci device resumes from suspend, its internal state is typically reset
to defaults. Since the pci core's pci_save_state does not save arbitrary mmio
registers or custom extended configuration registers, it appears the msi-x
routing and address match configurations programmed during probe might be
lost.

Could this cause the msi-x interrupts to stop working after resume?

