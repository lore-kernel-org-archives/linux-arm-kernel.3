Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A0DC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=us3P1yv6VOuxtB5vvFKg6U2I9kXSoWlwy5iqQagTPAU=; b=wG9PllAchoVrBzx/b04ZlGkKVa
	bY/WNV4y2RXnjKC1xdLbAzYhXbSX5roeKTmegu2AZSw2NGy3TgXs6kl4qMKC2m+41S01kRwzQNLkv
	hs+aw0vLNw/SG17j8V1qknmmm+ly6/GqKywGEy4gbQEuBQEkS0Y1NLPEkBig9EBey+I8EvsJmxhjn
	V59tvJDt05v0xwirCJcZI0c50PhvY2Dw/hA7Lx/J9gCSSX8KQKialyms2Xq8Znt6l+jo92DSy80cp
	UnEFgM5o0EA+51LZukj4JLLZFxqBBLtin0fW0SkvsJnL3Ut4e6bIJUH57Kosj7dUwjQTltCIAi/TT
	Ll8Q5R0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2pt-0000000BaiC-343r;
	Fri, 28 Feb 2025 16:03:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2Zd-0000000BWuz-42z5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:46:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF239150C;
	Fri, 28 Feb 2025 07:46:59 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 64CB43F5A1;
	Fri, 28 Feb 2025 07:46:41 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Charan Teja Kalla <quic_charante@quicinc.com>
Subject: [PATCH v2 0/4] iommu: Fix the longstanding probe issues
Date: Fri, 28 Feb 2025 15:46:29 +0000
Message-Id: <cover.1740753261.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_074650_045528_B710E04D 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

v1: https://lore.kernel.org/linux-iommu/cover.1739486121.git.robin.murphy@arm.com/

Hi all,

This spin irons out a couple of issues which v1 had. Firstly there
should now be no change in behaviour for the weird of_dma_configure()
calls, other than possibly getting the warning if they deserve it.
Secondly I think there was still a possibility for probe to run via
the replay path while its "real" probe was waiting to reacquire the
lock; this is now solved by making dev->iommu a reliable indicator of
the probe lifecycle, with a couple more prep patches.

Thanks,
Robin.


Robin Murphy (4):
  iommu: Handle race with default domain setup
  iommu: Resolve ops in iommu_init_device()
  iommu: Keep dev->iommu state consistent
  iommu: Get DT/ACPI parsing into the proper probe path

 drivers/acpi/arm64/dma.c        |  5 +++
 drivers/acpi/scan.c             |  7 -----
 drivers/amba/bus.c              |  3 +-
 drivers/base/platform.c         |  3 +-
 drivers/bus/fsl-mc/fsl-mc-bus.c |  3 +-
 drivers/cdx/cdx.c               |  3 +-
 drivers/iommu/iommu-priv.h      |  2 ++
 drivers/iommu/iommu.c           | 55 ++++++++++++++++++++++++---------
 drivers/iommu/of_iommu.c        | 13 ++++++--
 drivers/of/device.c             |  7 ++++-
 drivers/pci/pci-driver.c        |  3 +-
 11 files changed, 74 insertions(+), 30 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty


