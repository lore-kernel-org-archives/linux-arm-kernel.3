Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4449CCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 16:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=OeslJT/dTVTNMqcggaMPCiuzsekbjaahrLHAV/7U/9A=; b=JaFupLN+oz9lH/
	prceZG4IrEO96nO35xvrcQ3EUpju/laxOWWSTdpVwLHQ/Q5P/xervt9VY/FsTlDPiOPckOQNxRJJ2
	Y6qKhg4c8iiY4a4A030TmOT9QSLtwlvB0m71+3Ap2RNIqeEzJ8rWnVMO+IomeKWPhDPTnJNNErEFh
	jUafE81gmnhOg1TrW2SH4t9cZDJAWC84Rl+lkTOv3lZdk8mLISuLGkN6HYtayLXVELxzLvMgqCMaW
	nmCuHAmtpmTNts8Kmfwvjr9O9dpu2NJqZLxLKeIRTvHXPZbnXDyZQ+6WBFMj3HOsuCMKyVAkJMpWH
	k+8EpPKzoayQYX224L2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dHF-00000005mCG-3Oy5;
	Tue, 30 Sep 2025 16:32:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dHD-00000005mBp-1FbR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 16:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28F9345985;
	Tue, 30 Sep 2025 16:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA54C4CEF0;
	Tue, 30 Sep 2025 16:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759249950;
	bh=jdVuehLsO2BbsXchfGIueYIfBtAAqPbDLFHoBeD0ySM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=btZxeuapgJ8cVMgABl2IrN7ULEYD/efA61/d6uFEPKikOD4Qv9PgFdecqs2WarnKh
	 fM/lVEJ4DBWpwkaQELBbkgx9/+wjjv4ZO7+XaBKUX7vOpvL6JWPt60FgXI1GM4SUJJ
	 rv4cMHFUzfTYQPe4wZv1LfqsvCW83Dj1iT04iPPdWXiJ9XaPUeCwD10mKq/8QKRTl2
	 GG1UY6m+ZqyJxgEx17Pnrni2JmWvcPCaCXpMK/zVLAQOfhtC3fe34Kx3TWIVKhTQbn
	 WSLpRsCuESis8oIaNeur0ZilZNqBIVwPOOjkG/X2tAIfoROkY+tvDVTdS5PLiBafuH
	 iV+2vLz4an3Dw==
Date: Tue, 30 Sep 2025 11:32:28 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
	bhelgaas@google.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	Christian Bruel <christian.bruel@foss.st.com>,
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: stm32: Remove link_status in PCIe EP.
Message-ID: <20250930163228.GA183263@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175915669921.12348.6942864048975237850.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_093231_357134_9808D273 
X-CRM114-Status: GOOD (  11.00  )
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

On Mon, Sep 29, 2025 at 08:08:19PM +0530, Manivannan Sadhasivam wrote:
> 
> On Tue, 02 Sep 2025 14:26:41 +0200, Christian Bruel wrote:
> > Guarding enable_irq/disable_irq against successive link start
> > link does not seem necessary, since it is not possible to start
> > the link twice. Similarly for stop.
> 
> Applied, thanks!
> 
> [1/1] PCI: stm32: Remove link_status in PCIe EP.
>       commit: 7d1c807cd2ddf8ef771f214ae4dab9bebbc61522

Since this is essentially a fix to "PCI: stm32-ep: Add PCIe Endpoint
support for STM32MP25", which hasn't been merged upstream yet, I
squashed it into that patch:

  https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?id=013d82bb62c0

