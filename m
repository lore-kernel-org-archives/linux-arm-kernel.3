Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765EECD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 18:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=zsz4F6t5BdGY4YJSLAr3S0zGjC+3d0taNmvWOrqMMMQ=; b=FXYeHcRQ081Qlf
	sgsng3xMedR70UFge3VwzC3kuZRoPlHewaxiWnYcMK5EXPwdc+wOqy9xdlRiGKHDzOtc1wfed76ty
	t21etm/ijtF72oBQdAxUMFGUlkOaZQ90N7utLZ4kzBVb3GqKTe/koLRUjglIzM+2nvIZcadQq95TU
	WrIojYqXEHbm90AIdASaUBah71T0f3FFIfp2AOR53KEhXqIe+UdU2Y8rWcLi7Yp7uY3tNv4uGa6VH
	yvt/fGABNJu+MJd26+GyelYG6KNuBDWz6yMPzkjGulZx73FrAuQQtAKf2WflDAsFMi7KCvAtlB4cH
	yjALCbFaHqKUGKly8TLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJc0o-0000000Avg0-3I7s;
	Thu, 13 Nov 2025 18:25:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJc0o-0000000Avfj-1uLz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 18:25:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98BA760103;
	Thu, 13 Nov 2025 18:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C97C19421;
	Thu, 13 Nov 2025 18:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763058337;
	bh=gsxNH+9KT9ljmdwEWWaU8Ik/ecApYq3Gd/rK1eq0pfM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=CBGgjN2+OSsYjDKvKRBNNaNvimNMYlaKiUjiyTiOsQ0vJAml/gc51pEvcXJ2apIO+
	 Oa8qBf3uDqkGeMWQpKmtcEbsXXsql5mPPmrI/WWSf4xpEOWJmBPZHMdbUKSVIOneqP
	 tHZGWY3SueHe9/myJebYL4n9AJtSdL36u+5AAd4m5ruNacVn4ZyLht8G7UL3z/2hqc
	 9HedqpvbTgPyd9jZaCYlma86hjYuaFStry68xNxlCm33RJKhr2mNzYz0zrGiKtFFfX
	 ji5x7U55qZwnWREhZAL3AWudthKZIhuok76ItVfZXd4Yj2zMvCofpQFB/dsJ1Ovm/f
	 mz1b2kaSkKK/g==
Date: Thu, 13 Nov 2025 12:25:35 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com,
	christian.bruel@foss.st.com, krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com, shradha.t@samsung.com,
	thippeswamy.havalige@amd.com, inochiama@gmail.com,
	fan.ni@samsung.com, cassel@kernel.org, kishon@kernel.org,
	18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org,
	Siddharth Vadapalli <s-vadapalli@ti.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH v5 0/4] PCI: Keystone: Enable loadable module support
Message-ID: <20251113182535.GA2295551@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176241661035.23562.15419519383714568853.b4-ty@kernel.org>
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

On Thu, Nov 06, 2025 at 01:40:10PM +0530, Manivannan Sadhasivam wrote:
> 
> On Wed, 29 Oct 2025 13:34:48 +0530, Siddharth Vadapalli wrote:
> > This series enables support for the 'pci-keystone.c' driver to be built
> > as a loadable module. The motivation for the series is that PCIe is not
> > a necessity for booting Linux due to which the 'pci-keystone.c' driver
> > does not need to be built-in.
> > 
> > Series is based on 6.18-rc1 tag of Mainline Linux.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/4] PCI: Export pci_get_host_bridge_device() for use by pci-keystone
>       commit: 88254d46823be8563f8f81d78390a7313ae6fad7
> [2/4] PCI: dwc: Export dw_pcie_allocate_domains() and dw_pcie_ep_raise_msix_irq()
>       commit: 9acc60a5bca02351f852651c0123d9994663ec0a
> [3/4] PCI: keystone: Exit ks_pcie_probe() for invalid mode
>       commit: 7b5a5b7715c2dea2541e7fd3da15c2881fdfc553
> [4/4] PCI: keystone: Add support to build as a loadable module
>       commit: 041c2f0e34ba4823101bf307d6a6d41d98f5dac3

Just FYI, I moved these to pci/controller/keystone to separate them
from the j721e changes on pci/controller/ti.  It's a little easier for
me when each driver is on a separate topic branch.

I also reordered them so all the module-related changes are together
instead of having the invalid mode bug fix in the middle of them.

