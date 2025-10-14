Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AB0CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 09:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PkKKZno8exLGJkGqBCYPsMsDCGqBKL4BAf+M9kvvrLs=; b=RR3Qxk9sBfikpAHmQcfm7JIPSX
	mviRGRHRigjRko2XRPTy5LHpy76wh+kPtk6WaZLJXCSClHghFiHnCsrZvmIe9HwtHK1S7PKwG7Fwb
	9+3hS+DrjY+njMFyshK3NrrWc+AYxhvAkZv3HKOUyxTb9XWsZySyib4MAEwhyzKL+G6dsk/HWSkhe
	vYIkFvmiUd8gO+tcNC93ZCsPpeeVg8y/CiEqbGbczUR1XvZQfIZCN76QG+7NDsK3dZGN0y/Cezp6K
	6f+iPQsN4X03IEbnV+svw3VaQgbjoEBpOeFE9Fy/zCAVNxaQ+vyKAY0zy/EbwS0cnesvmocz03eGX
	S65xN6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bny-0000000FqLC-2gyy;
	Tue, 14 Oct 2025 09:58:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bnw-0000000FqKo-2VCR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 09:58:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB41D45C0A;
	Tue, 14 Oct 2025 09:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0011AC4CEE7;
	Tue, 14 Oct 2025 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435931;
	bh=z4NC7gBEwYaG1YOUUIGK9XXB3J4aw0TajwAMPUKYIM4=;
	h=From:To:Cc:Subject:Date:From;
	b=W9HH7T+M4igPd4fD6kxus7phc9ehkqL1GNsCEcaVOH7zhODJUSjftFg8LWbmWyyec
	 bw/qk1Ch1jdd0qcP7tD5qeIKHDEYdeuse8VooY7XJYocPIj6NKfZOMc9o438cJd7kW
	 5n6ZSXgKIt0RtEBFI3pGxBSTRyMZR12/suvOswZmoIsd/dow1J69GDfFt7To0zWqZA
	 YxaJ+wjRftdNW1oHfW1uqgEqv/mbPAm3MfxlmBWIBNJsu8LL+peUE4gtNSAJQ1UzOu
	 6mYCodxD0KZDWXawxLDf8hQUeS8XVNrTECg1tkuk7AgUTGf2+k8qJUkmGDQAjfhTVB
	 4txgZHDBOTLMw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 0/4] of/irq: Misc msi-parent handling fixes/clean-ups
Date: Tue, 14 Oct 2025 11:58:41 +0200
Message-ID: <20251014095845.1310624-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_025852_675042_738E7459 
X-CRM114-Status: GOOD (  10.37  )
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

This is a follow up to [1] - with additional patches that are addressing
Rob's feedback (pcie-layerscape-gen4 was removed from the kernel, Yay !)
and other bits and bobs I noticed while staring at the code.

Patch (1) is a fix and technically we would like to get it in v6.18 please.

Patch (3) is compile-tested only, I can not run it on HW, I do not have it,
Scott, Ray please test it if you can.

[1] https://lore.kernel.org/lkml/20250916091858.257868-1-lpieralisi@kernel.org/

Cc: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>

Lorenzo Pieralisi (4):
  of/irq: Add msi-parent check to of_msi_xlate()
  of/irq: Fix OF node refcount in of_msi_get_domain()
  PCI: iproc: Implement MSI controller node detection with
    of_msi_xlate()
  irqchip/gic-its: Rework platform MSI deviceID detection

 drivers/irqchip/irq-gic-its-msi-parent.c | 98 ++++++++----------------
 drivers/of/irq.c                         | 42 +++++++++-
 drivers/pci/controller/pcie-iproc.c      | 22 ++----
 3 files changed, 76 insertions(+), 86 deletions(-)

-- 
2.50.1


