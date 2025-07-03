Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4E4C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+V16Ex7WEsnggE0dXsuMoVRX0ASKyGVEYRyHSCyc75Q=; b=0Y+BsguCY2TsTzi2jTblGNNkcI
	T0wAqvpXMOO3hEN04YKRM2mUyf6rwLCvJ0WlcDxltMgD3JjmIGvTEmG6Z4cTNH5jPlqQV+8fDjdSV
	FaQ6rM7MoEIYQBgqzGULZbi68AEsvMCoUYHP+3MP0nVBVrIbbFiWw4aZ1H8Y1YIxONccWLViXNofE
	ZZBBhDOixPdwY3a1FEAiyT87Q/Sz5y/Bxt7udQ1jAPmcW5CgRwZF/Dt8zroRlABvxp38ReyDRFZLf
	I5tIehYHf2qAiwFBLKrZeZz0nLM+CGPo4mzpOY+QMdiIOGZS6iEWzGqHuPyMpVAXPo78asgLRodlJ
	y9REqRhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR1X-0000000CWMK-33sx;
	Thu, 03 Jul 2025 20:59:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMRc-0000000Bw4u-3iqv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:05:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 749234594B;
	Thu,  3 Jul 2025 16:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BF1C4CEE3;
	Thu,  3 Jul 2025 16:05:48 +0000 (UTC)
Date: Thu, 3 Jul 2025 17:05:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 20/31] irqchip/gic-v5: Add GICv5 PPI support
Message-ID: <aGaqWooC6Q_HYbDL@arm.com>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
 <20250703-gicv5-host-v7-20-12e71f1b3528@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-gicv5-host-v7-20-12e71f1b3528@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_090552_943553_6DE24C22 
X-CRM114-Status: GOOD (  13.03  )
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

On Thu, Jul 03, 2025 at 12:25:10PM +0200, Lorenzo Pieralisi wrote:
> The GICv5 CPU interface implements support for PE-Private Peripheral
> Interrupts (PPI), that are handled (enabled/prioritized/delivered)
> entirely within the CPU interface hardware.
> 
> To enable PPI interrupts, implement the baseline GICv5 host kernel
> driver infrastructure required to handle interrupts on a GICv5 system.
> 
> Add the exception handling code path and definitions for GICv5
> instructions.
> 
> Add GICv5 PPI handling code as a specific IRQ domain to:
> 
> - Set-up PPI priority
> - Manage PPI configuration and state
> - Manage IRQ flow handler
> - IRQs allocation/free
> - Hook-up a PPI specific IRQchip to provide the relevant methods
> 
> PPI IRQ priority is chosen as the minimum allowed priority by the
> system design (after probing the number of priority bits implemented
> by the CPU interface).
> 
> Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

