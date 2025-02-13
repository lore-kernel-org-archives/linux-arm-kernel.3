Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16C6C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 23:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5i60yDj3sbiGb2ZAlpPVacqtY56zIY3NzsyI8aP0jSY=; b=AdiMfpSHkZ3CNxFxIUzuGrdzLZ
	E7EljBgfZ9rbSqpOCRNvPXjAIAMF3XdKXZWFGhOuHjtMVgKnb8FWTmdagPjFvU4+X2uMkyMFU/uuc
	9NDOispbQe6+OrVXtlwVyr+VT/o04RyycXwQ1AwxObZ6TQGaJh4J1drbu26OUxvTa4kXeAQI/QZzV
	g0TFEkn9cOQvfA4Ca4n+yf6EAIGT3z1Rd1H+us2+3kvmZMRzL+D+UHxtHEtQXCVIBsh/oDwptH6Kn
	oZ7Ze4mo7DX+cPeNHXDJBG8LlefFwv/4pcf70rW7n2Gpewo/ZVKjV3RL6ZtuCZMr3uFRqonyD5TG5
	RWUUxXDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiiyq-0000000CzdL-3y3G;
	Thu, 13 Feb 2025 23:50:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiixM-0000000CzH1-1uTM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 23:49:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E1B0113E;
	Thu, 13 Feb 2025 15:49:36 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2282E3F5A1;
	Thu, 13 Feb 2025 15:49:12 -0800 (PST)
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
Subject: [PATCH 0/2] iommu: Fix the longstanding probe issues
Date: Thu, 13 Feb 2025 23:48:58 +0000
Message-Id: <cover.1739486121.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_154920_540575_E88ACDA3 
X-CRM114-Status: GOOD (  21.56  )
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

Hi all,

Finally, it's that thing I've been mentioning on and off for the last 5
years or so! After far too much thinking about "clean" ways to refactor
everything towards an eventual goal of working properly, I finally gave
up and decided to see how bad it would be to just get it working, then
worry about cleaning up afterwards. Frankly I still can't quiet believe
how small the patch turned out to be...

Patch #1 is a fix for what I think is the only "expected" race in the
core API design - we knew we had that window where a default domain is
NULL, but the potential consequences weren't clear until Charan figured
it out the hard way. That should be good to go already, and it's not
strictly a dependency for patch #2, but it seemed worth posting them
together on the common theme.

Patch #2 is then the first big bite out of the problem I feel compelled
to fix because it's my name on d7b0558230e4 ("iommu/of: Prepare for
deferred IOMMU configuration") which, in hindsight, started it. I hope
this will be the only patch which has to touch absolutely everything all
at once. I've not got very far with the follow-up patches yet, but I do
foresee being able to tackle the driver core, firmware subsystems and
bus drivers more independently. I don't expect anyone to love it, but I
hope you can at least see where I'm going and give a bit of leeway for
now :)

I also do rather expect that WARN_ON to be hit, but the intent is that
I'd like to get the attention of any of_dma_configure() abusers so they
can help me figure out what the heck their code *should* be doing...

Thanks,
Robin.


Robin Murphy (2):
  iommu: Handle race with default domain setup
  iommu: Get DT/ACPI parsing into the proper probe path

 drivers/acpi/arm64/dma.c        |  5 ++++
 drivers/acpi/scan.c             | 10 +++----
 drivers/amba/bus.c              |  2 +-
 drivers/base/platform.c         |  2 +-
 drivers/bus/fsl-mc/fsl-mc-bus.c |  2 +-
 drivers/cdx/cdx.c               |  2 +-
 drivers/iommu/iommu.c           | 48 +++++++++++++++++++++++++--------
 drivers/iommu/of_iommu.c        | 10 ++++++-
 drivers/of/device.c             |  7 ++++-
 drivers/pci/pci-driver.c        |  2 +-
 10 files changed, 65 insertions(+), 25 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty


