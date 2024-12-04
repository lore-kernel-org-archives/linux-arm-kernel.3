Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CA1E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iqcVUl6jypUv2yirtx2oOB53fQWi5HfMaKffVOPYuZo=; b=b8SGQs4Z/5aXiVKBFJxHpKFEzD
	NZJ/bwYuPSzUXNc14l25OkWyzuetHdj8e9g0gzyKzFukSw/N1VWoPrAWEygf4BkYECd8qc6feePPk
	bnFKAliKt9k0Zq2Bf8HcWHfug5bselCBGepceD3wlMX4Bvty+sfxLnCJjpVfafb8JFi5GaXaD8kCI
	pI1if64yAhIQzddIQz9yK1kkkgf53CQOdO2mViruO3kg0MvOqvHGCAdEx77cFlAC+MwbFYghaTqN0
	lFUxGdvLavjOgn7o00gQE8DZMoLcfXLqUsFRg7m4M8stx5F/5e8tfsFg5I7oJYmflje0FmloFCQGI
	A0j55vpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqxr-0000000CwQk-1vIw;
	Wed, 04 Dec 2024 15:06:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqsy-0000000CvPq-1Gjk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:01:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BF115C618F;
	Wed,  4 Dec 2024 15:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E70C4CECD;
	Wed,  4 Dec 2024 15:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733324510;
	bh=ZgmW1sBTfwJr9tj+mXvEmq9zW0CWL1uawNJ9/cc4h+Q=;
	h=From:To:Cc:Subject:Date:From;
	b=hLICcAwNyBQPVbBe1H4HFth55jRSywxIhAKDEYYsIoAv+h1uY1VksFb3r7spAWmD6
	 o/rrNu4tBkKcyeHiPwVsmB23m4CEHPHINIEk7u3J+GEpgGogpQ1IwoSX4NKZ/yCSYV
	 A7tJ8Bkk45ETaETagN+O4UUQJrWrvLQ7A7gEnFBN/t5H6mnD9jApPTSf7XBJwTWYIM
	 G8QgZ37A/vUcBdjB8XlzVU47Te0tRDEzdgN/FY/7yv3LRt3cZcy8vQO3qI8dHffY0J
	 Is+e/KWVMVr4881ubXJdq9578vCQ+qVNYWtDOUyJJJj4eP+FWVbR2ZncJ2YJIemECb
	 2ySoenyMq0exg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIqsu-000TvG-Q5;
	Wed, 04 Dec 2024 15:01:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/2] PCI: Convert the Apple controller to host bridge hooks
Date: Wed,  4 Dec 2024 15:01:43 +0000
Message-Id: <20241204150145.800408-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, alyssa@rosenzweig.io, Frank.Li@nxp.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_070152_380877_8E01AF86 
X-CRM114-Status: GOOD (  10.57  )
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

The Apple PCIe controller requires some additional attention when
enabling an endpoint device, so that the RID gets correctly mapped to
a SID on its way to the IOMMU.

So far, we have need relying on a custom bus notifier to perform this
task, but Frank Li's series [1] is a better approach as it puts the
complexity in the core code instead of the host controller driver, and
this series builds on that:

- allow the new {en,dis}able_device() to be provided via pci_ecam_ops

- convert the Apple PCIe driver to that infrastructure

Patches on top of 6.13-rc1, plus Frank's v7 series.

[1] https://lore.kernel.org/r/20241203-imx95_lut-v7-0-d0cd6293225e@nxp.com

Marc Zyngier (2):
  PCI: host-generic: Allow {en,dis}able_device() to be provided via
    pci_ecam_ops
  PCI: apple: Convert to {en,dis}able_device() callbacks

 drivers/pci/controller/pci-host-common.c |  2 +
 drivers/pci/controller/pcie-apple.c      | 75 +++++-------------------
 include/linux/pci-ecam.h                 |  4 ++
 3 files changed, 21 insertions(+), 60 deletions(-)

-- 
2.39.2


