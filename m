Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313ADCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 15:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgPYNYfrn7ye985WUhZmZjMTjO1NjL5/D97itGyhqAw=; b=D9DArPfwq982kOZntSZ5PLf3W6
	cOybE73QsWHxsoQYoAVfmdYYC8RcZffH3V96lwf3e6FYtar9KiWg8iWrxkJTcOcY+2o7PFH0cD6g+
	TdG2Th8SGnfgibqdrzYS8dZ4ESbvQuIxLCrwvHlwnkeUfqGc2oa/XsnVHCmb82lECLWiS+azJCHcR
	VlsWQBlnEqO1+Ko7fi/wEtk4RHvWiGtDY6JrOjVPP6ozWHzuCQtVUnZ3/Fifz7HyQPPuq9c4BhGed
	1CCgvckh8w/m6Aue5/KZniuKA806LD1MlQm76m8/EKcuYNinUzsNGTWbEE8KuzpigXNRep9/Wqz47
	SDQMGD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDl3O-0000000GnrF-3rxh;
	Mon, 05 Oct 2026 15:56:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDl3N-0000000Gnqt-2lyH;
	Mon, 05 Oct 2026 15:56:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 453EB40966;
	Mon,  5 Oct 2026 15:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366F21F00893;
	Mon,  5 Oct 2026 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215797;
	bh=LgPYNYfrn7ye985WUhZmZjMTjO1NjL5/D97itGyhqAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cj4VBovtnl76Di0FNaORQZqDfwdvc7zCoApzbtNjmPFX9T+uWd73bUMuh06UpnQ1+
	 ksSW1dEw2ub2TgAc9dPSUkjq9UsyIpuDX6Pv0bucOlI867eEbPfpGtLEsNSX7jrwRr
	 hO6Y8Q0Es7gBAN1iCW3ji5CF3mgjFCSkukc684bfHudd3KBwDlysCcz70C38EukJEy
	 7e3l+7ReX/I2JelXHCkZ1jLV7X3DZA6DEK1rlGvOC+NzJAOB8rgZ3+7zr5Gja+OICu
	 YKs18aFOTmpUEKcJbxSSZCe2vO8BGvgwIYw8chacuWO6WU1WI6CQ7l0xgyljXt4/kA
	 ACVa3CuIoU6ug==
Date: Mon, 5 Oct 2026 17:56:32 +0200
From: Keith Busch <kbusch@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: Update saved Max Payload Size in pcie_set_mps()
Message-ID: <asPIsBZYD51d7YsL@kbusch-mbp>
References: <20261005124154.2190628-2-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005124154.2190628-2-cassel@kernel.org>
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

On Mon, Oct 05, 2026 at 02:41:55PM +0200, Niklas Cassel wrote:
> pcie_set_mps() changes the Max Payload Size (MPS) in the Device Control
> register but leaves the copy saved by pci_save_state() alone, so the next
> pci_restore_state() puts back the old value.
> 
> The PCI core does change the MPS of devices whose state has already been
> saved: pci_configure_mps() reduces a Root Port's MPS when a device with a
> smaller MPS Supported is hot-added directly below it (commit 9f0e89359775
> ("PCI: Match Root Port's MPS to endpoint's MPSS as necessary")), and with
> "pci=pcie_bus_safe", pcie_bus_configure_settings() can do the same when
> pciehp calls it after a hot-add.  The Root Port's state was saved when it
> was added and again when portdrv probed it.
> 
> Since commit 3fc686d550f6 ("PCI/ERR: Add support for resetting the Root
> Ports in a platform-specific way"), pcibios_reset_secondary_bus() restores
> that saved state, without saving it first, after host->reset_root_port()
> has reset the Root Port, e.g. during AER recovery or on Link Down with the
> qcom and Rockchip DWC drivers.  The Root Port then goes back to the old,
> larger MPS while the device below it is restored to the smaller one, so
> the Root Port may send TLPs that the device treats as Malformed.
> 
> Update the saved copy of Device Control when pcie_set_mps() changes the
> MPS, like commit 909f7bf9b080 ("PCI: Update saved_config_space upon
> resource assignment") does for BARs.

Looks good to me:

Reviewed-by: Keith Busch <kbusch@kernel.org>

