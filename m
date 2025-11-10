Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63911CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqwDXzaW1U2yeBwdvor/dNODr3HWyQhtT9SWzJNIGFw=; b=wXzlAP1JqbpLNFfEhvQDZTKbE2
	6R3yUK0s0YK/ffJ5PfjfWrUE6h1mdgb3HrDAB6aqWt5R4KI9WJWN7e1zYC6+GrNhK8F1sUukNylmc
	1gLr3bLDdgnpjJptaDWXjSYOvCX9A5fyKAQyxnjC/aslrgRvXspbKPftrw/UiPSKjsh/R8+QbVEcN
	94bId9H7u2HX6NjqGF0YnQudJEm6IN9EPVYQkwobda3bDyW6L9094RKRfbciDY9AIhpqyqP2l8qQf
	0PhHRaNHD9WKJOdZpGWaaYgmBx8ipuGgQo6TqzdR6W6RM1u1mTGsskUEiZg89FKHrjO1G6ZV68v3W
	bw+xJdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRDG-00000005QVm-1AgP;
	Mon, 10 Nov 2025 12:41:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRDD-00000005QVJ-3Xrm;
	Mon, 10 Nov 2025 12:41:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C876043206;
	Mon, 10 Nov 2025 12:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDC2C116D0;
	Mon, 10 Nov 2025 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762778494;
	bh=Eb3GSPNticXIxxLgS/f24j6ecx9A5x3T4N37cr98YT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z2tMdDdxgWlB1JhvhOXNoZalXUZXTgXjJZ5YGfP5lDf6dGcsq3XnFdsTNUiH0BcQ1
	 CPYNUhpucvOqLCZDrYMYz8ilGov8kmQDuo4yQdae5Wk2BpGWlhJicasIPuEeSczsG/
	 H75yEW/fXShEiB9bjWLwgxGTHZgpzuqQBIwGkcEn7R4tkNQgpHZlHrGEN4xuc7SvNA
	 jTN+JKzQhJc4o5v9mnu7Qx4I+r/NBL0CGLGcJ0YiaGq6No944KsltQDb4uIcaeR3KK
	 ba9YkW9rlcxG/5MYAsPohoGkC34XhEYCJzNl0q2/wQOPB4t0PFVHPeThxbFq/fFth1
	 gmc00AfZ4zT1w==
Date: Mon, 10 Nov 2025 13:41:29 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: FUKAUMI Naoki <naoki@radxa.com>, Damien Le Moal <dlemoal@kernel.org>,
	Anand Moon <linux.amoon@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dragan Simic <dsimic@manjaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, mani@kernel.org
Subject: Re: [RESEND] Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
Message-ID: <aRHdeVCY3rRmxe80@ryzen>
References: <aQ9FWEuW47L8YOxC@ryzen>
 <55EB0E5F655F3AFC+136b89fd-98d4-42af-a99d-a0bb05cc93f3@radxa.com>
 <aRCI5kG16_1erMME@ryzen>
 <F8B2B6FA2884D69A+b7da13f2-0ffb-4308-b1ba-0549bc461be8@radxa.com>
 <780a4209-f89f-43a9-9364-331d3b77e61e@rock-chips.com>
 <4487DA40249CC821+19232169-a096-4737-bc6a-5cec9592d65f@radxa.com>
 <363d6b4d-c999-43d4-866e-880ef7d0dec3@rock-chips.com>
 <0C31787C387488ED+fd39bfe6-0844-4a87-bf48-675dd6d6a2df@radxa.com>
 <dc932773-af5b-4af7-a0d0-8cc72dfbd3c7@rock-chips.com>
 <aRHb4S40a7ZUDop1@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRHb4S40a7ZUDop1@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_044135_930265_AF2CCF96 
X-CRM114-Status: GOOD (  20.14  )
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

On Mon, Nov 10, 2025 at 01:34:41PM +0100, Niklas Cassel wrote:
> @@ -672,15 +705,13 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	if (!pp->use_linkup_irq)
>  		/* Ignore errors, the link may come up later */
>  		dw_pcie_wait_for_link(pci);
> -
> -	ret = pci_host_probe(bridge);
> -	if (ret)
> -		goto err_stop_link;
> -
> -	if (pp->ops->post_init)
> -		pp->ops->post_init(pp);
> -
> -	dwc_pcie_debugfs_init(pci, DW_PCIE_RC_TYPE);
> +	else
> +		/*
> +		 * For platforms with Link Up IRQ, initial scan will be done
> +		 * on first Link Up IRQ.
> +		 */
> +		if (dw_pcie_host_initial_scan(pp))
> +			goto err_stop_link;

Oops.. this condition was inverted, what I meant was:

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index e92513c5bda5..0e04c1d6d260 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -565,6 +565,39 @@ static int dw_pcie_host_get_resources(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static int dw_pcie_host_initial_scan(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct pci_host_bridge *bridge = pp->bridge;
+	int ret;
+
+	ret = pci_host_probe(bridge);
+	if (ret)
+		return ret;
+
+	if (pp->ops->post_init)
+		pp->ops->post_init(pp);
+
+	dwc_pcie_debugfs_init(pci, DW_PCIE_RC_TYPE);
+
+	return 0;
+}
+
+void dw_pcie_handle_link_up_irq(struct dw_pcie_rp *pp)
+{
+	if (!pp->initial_linkup_irq_done) {
+		if (dw_pcie_host_initial_scan(pp)) {
+			//TODO: cleanup
+		}
+		pp->initial_linkup_irq_done = true;
+	} else {
+		/* Rescan the bus to enumerate endpoint devices */
+		pci_lock_rescan_remove();
+		pci_rescan_bus(pp->bridge->bus);
+		pci_unlock_rescan_remove();
+	}
+}
+
 int dw_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -669,18 +702,17 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	 * If there is no Link Up IRQ, we should not bypass the delay
 	 * because that would require users to manually rescan for devices.
 	 */
-	if (!pp->use_linkup_irq)
+	if (!pp->use_linkup_irq) {
 		/* Ignore errors, the link may come up later */
 		dw_pcie_wait_for_link(pci);
 
-	ret = pci_host_probe(bridge);
-	if (ret)
-		goto err_stop_link;
-
-	if (pp->ops->post_init)
-		pp->ops->post_init(pp);
-
-	dwc_pcie_debugfs_init(pci, DW_PCIE_RC_TYPE);
+		/*
+		 * For platforms with Link Up IRQ, initial scan will be done
+		 * on first Link Up IRQ.
+		 */
+		if (dw_pcie_host_initial_scan(pp))
+			goto err_stop_link;
+	}
 
 	return 0;
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index e995f692a1ec..a31bd93490dc 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -427,6 +427,7 @@ struct dw_pcie_rp {
 	int			msg_atu_index;
 	struct resource		*msg_res;
 	bool			use_linkup_irq;
+	bool			initial_linkup_irq_done;
 	struct pci_eq_presets	presets;
 	struct pci_config_window *cfg;
 	bool			ecam_enabled;
@@ -807,6 +808,7 @@ void dw_pcie_msi_init(struct dw_pcie_rp *pp);
 int dw_pcie_msi_host_init(struct dw_pcie_rp *pp);
 void dw_pcie_free_msi(struct dw_pcie_rp *pp);
 int dw_pcie_setup_rc(struct dw_pcie_rp *pp);
+void dw_pcie_handle_link_up_irq(struct dw_pcie_rp *pp);
 int dw_pcie_host_init(struct dw_pcie_rp *pp);
 void dw_pcie_host_deinit(struct dw_pcie_rp *pp);
 int dw_pcie_allocate_domains(struct dw_pcie_rp *pp);
@@ -844,6 +846,9 @@ static inline int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static inline void dw_pcie_handle_link_up_irq(struct dw_pcie_rp *pp)
+{ }
+
 static inline int dw_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	return 0;
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 8a882dcd1e4e..042e5845bdd6 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -468,10 +468,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
 		if (rockchip_pcie_link_up(pci)) {
 			msleep(PCIE_RESET_CONFIG_WAIT_MS);
 			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
-			/* Rescan the bus to enumerate endpoint devices */
-			pci_lock_rescan_remove();
-			pci_rescan_bus(pp->bridge->bus);
-			pci_unlock_rescan_remove();
+			dw_pcie_handle_link_up_irq(pp);
 		}
 	}
 

