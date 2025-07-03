Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D2CC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3d+kwkFQVNLQ4ma4czIBTf7xgDwxc1OtWyHstQlNrM=; b=EGUQH+gJnt1Vv0dM/DnseAt0jW
	yzi057SZmtaJVpKc8+cKKOQr5DsVacLBZCjf5xnEQLmQRvho70AT4JChmIxv6ARUJJZhCMtphSYBa
	Tq0ujgi/1+qFYJmJP6sxFjMd+gRI+hM4WHfZW8wB5PBbhxt67v7OuxjQHzNtzszduIAGTHuQO+8lS
	sQXFMb4B5g7j18dVhuBVRJ+NgtBhqVF6GP0qDDRtxTrHk0H5Zsiqm/orOKDaEPckxXH7IJKke7Q7z
	5seiZ3coc2Wpy2I1OGmZS4r+t2XlJ+dO0m7NoXysGRUFLydUoVJaDatQnUlB9iMTWJrhkIMim88EM
	DfLhs8Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR1R-0000000CWFc-2eUm;
	Thu, 03 Jul 2025 20:59:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMQL-0000000BvpJ-0S01
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:04:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAD0E43E21;
	Thu,  3 Jul 2025 16:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A1BC4CEEE;
	Thu,  3 Jul 2025 16:04:28 +0000 (UTC)
Date: Thu, 3 Jul 2025 17:04:26 +0100
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
Subject: Re: [PATCH v7 18/31] arm64: smp: Support non-SGIs for IPIs
Message-ID: <aGaqCofcXUxAdVAZ@arm.com>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
 <20250703-gicv5-host-v7-18-12e71f1b3528@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-gicv5-host-v7-18-12e71f1b3528@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_090433_166784_1B05FF19 
X-CRM114-Status: GOOD (  12.98  )
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

On Thu, Jul 03, 2025 at 12:25:08PM +0200, Lorenzo Pieralisi wrote:
> From: Marc Zyngier <maz@kernel.org>
> 
> The arm64 arch has relied so far on GIC architectural software
> generated interrupt (SGIs) to handle IPIs. Those are per-cpu
> software generated interrupts.
> 
> arm64 architecture code that allocates the IPIs virtual IRQs and
> IRQ descriptors was written accordingly.
> 
> On GICv5 systems, IPIs are implemented using LPIs that are not
> per-cpu interrupts - they are just normal routable IRQs.
> 
> Add arch code to set-up IPIs on systems where they are handled
> using normal routable IRQs.
> 
> For those systems, force the IRQ affinity (and make it immutable)
> to the cpu a given IRQ was assigned to.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> [timothy.hayes@arm.com: fixed ipi/irq conversion, irq flags]
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> [lpieralisi: changed affinity set-up, log]
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

