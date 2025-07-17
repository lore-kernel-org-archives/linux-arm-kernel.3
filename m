Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90894C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 10:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ij8sQ0PZojeFLAf4MdDXPZA2nHvOpAbNVzssIL+5IpQ=; b=X1Nyto6prhmGGNfAB5vPaYdrpo
	ZMa74Jh4HGgsvbhb19JHKxdHdbfVg77989ceOvqqSWbwofRzicxK0a8XfzUV/SEY3z3Pmx69uWayQ
	JGCSpP0ubC9uMgFBcwlxLnCKE1v/DWtb8pQ9v7u2Agl24ZE9Xo0K8xBsC1db+hnnFIqM7L2wDzdGa
	YDtR5o9S6W+iIRtuQVAjn8GPKPp8A5bNvMY6wVJ/9PsHoblRmb8I5OmyODv4a6tznWEExvSNVMuTG
	GTK1iP09r/mNnP+Q6EvVicBb5XgGJ46Xs3kq81DIqHLB9x2mGplWEXb7mcVhPBsP5F8snRbtXysf4
	P6keoYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLi9-00000009pKT-0hBH;
	Thu, 17 Jul 2025 10:19:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLIq-00000009msz-3a4b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 09:53:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6265D5C5CB4;
	Thu, 17 Jul 2025 09:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4A2C4CEF7;
	Thu, 17 Jul 2025 09:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752746004;
	bh=79WBhvJn26OfZelR9I5aNME3T7KKPk5kwAHzs9mtrWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ss0gnunK0w/lqoGyuWXzxn6IwCftyipoYUczlCWvEDN+/XwvvnFYfs1jIosBn07yK
	 cBoW022cIxh5mkGU2bumukgtJsQyRtXkbjei3Xjj0Tgqj6GP7tMJKK1NNfqdQzgoLf
	 aMvPe3hknB23C1KbLKhwhqbVe/WZP58Uipek/jWOS3r81AN9JJlnmmZRhMaPdFqAoE
	 utgRTYqMYqFBTjyIJ43+VDtxfa8OkTi+lTRq5Cf8sEZZFW5bGSPgcKBWuuBCCSXLDI
	 iofq45uEXG5IK3sDKpz8vHdmx/1I2/BLOm3IHfbC7Qtwr3uNC58Iq5DViELTQU/ryR
	 erchg6tWqfAWQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Toan Le <toan@os.amperecomputing.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 00/13] PCI: xgene: Fix and simplify the MSI driver
Date: Thu, 17 Jul 2025 11:52:38 +0200
Message-ID: <175274579907.217726.8694214469184941348.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250708173404.1278635-1-maz@kernel.org>
References: <20250708173404.1278635-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_025324_932205_FFBA1CF0 
X-CRM114-Status: GOOD (  10.67  )
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

On Tue, 08 Jul 2025 18:33:51 +0100, Marc Zyngier wrote:
> Having recently dipped into the xgene-msi driver to bring it to use
> the MSI-parent concept, I have realised that some of it was slightly
> sub-par (read: downright broken).
> 
> The driver is playing horrible tricks behind the core code, missing
> proper affinity management, is terribly over-designed for no good
> reason, and despite what MAINTAINERS says, completely unmaintained.
> 
> [...]

Applied to controller/xgene, thanks!

[01/13] genirq: Teach handle_simple_irq() to resend an in-progress interrupt
        https://git.kernel.org/pci/pci/c/fad9efd72b5f
[02/13] PCI: xgene: Defer probing if the MSI widget driver hasn't probed yet
        https://git.kernel.org/pci/pci/c/b3ffac51b6a7
[03/13] PCI: xgene: Drop useless conditional compilation
        https://git.kernel.org/pci/pci/c/1ded8cc14884
[04/13] PCI: xgene: Drop XGENE_PCIE_IP_VER_UNKN
        https://git.kernel.org/pci/pci/c/14a347069f71
[05/13] PCI: xgene-msi: Make per-CPU interrupt setup robust
        https://git.kernel.org/pci/pci/c/84cb4108bf6f
[06/13] PCI: xgene-msi: Drop superfluous fields from xgene_msi structure
        https://git.kernel.org/pci/pci/c/61aeded55e5b
[07/13] PCI: xgene-msi: Use device-managed memory allocations
        https://git.kernel.org/pci/pci/c/a782a50689d6
[08/13] PCI: xgene-msi: Get rid of intermediate tracking structure
        https://git.kernel.org/pci/pci/c/9a7ca398f2d4
[09/13] PCI: xgene-msi: Sanitise MSI allocation and affinity setting
        https://git.kernel.org/pci/pci/c/7112647f6d19
[10/13] PCI: xgene-msi: Resend an MSI racing with itself on a different CPU
        https://git.kernel.org/pci/pci/c/b43fa1b0691b
[11/13] PCI: xgene-msi: Probe as a standard platform driver
        https://git.kernel.org/pci/pci/c/a435be2c3318
[12/13] PCI: xgene-msi: Restructure handler setup/teardown
        https://git.kernel.org/pci/pci/c/f7d447633452
[13/13] cpu/hotplug: Remove unused cpuhp_state CPUHP_PCI_XGENE_DEAD
        https://git.kernel.org/pci/pci/c/8db22d697c52

Thanks,
Lorenzo

