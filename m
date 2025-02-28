Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B34EC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 17:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oxw//IRNbBIHIpWcPLVqGKb8YXTRMgYYVDwzjABTCIA=; b=J80flNVa+UdzkyhQ/31aVMOY3O
	MZdT1j2CexpJZczscfWbjtsoLaUY0dFVJSUmEusrOoN9E5c0n04nNWO1phm1EUfDyZH6r/z6w9bPV
	Ka3CFigJuHqzeIlJeDrnzIrYsbSmDlAVb1ZuvaAXzNQt8CxQ0ZpI3o8IK0YQQmI7+mQSIXYE9NBEL
	gnYm8v1nS0Kz1iu+E7lBu9qi1YbCS9qXBGc8ZbihzlNvyfkjNLaw6MhKMvC8kvX57qbi78DR2X27N
	pivtDE76HD5bFA3V//L6R9PjHCs6gFPIUxfuWwt+1dFIcFxRL98MioG4kPtNjiy29qnCrlW8WI7Xl
	mdITb66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4Cy-0000000BxrY-1RX9;
	Fri, 28 Feb 2025 17:31:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to48I-0000000BxDR-2Q2c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 17:26:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C75DF150C;
	Fri, 28 Feb 2025 09:26:54 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08A043F6A8;
	Fri, 28 Feb 2025 09:26:38 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: vkoul@kernel.org
Cc: devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] dmaengine: Add Arm DMA-350 driver
Date: Fri, 28 Feb 2025 17:26:31 +0000
Message-Id: <cover.1740762136.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_092642_655429_358E3BAE 
X-CRM114-Status: UNSURE (   9.78  )
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

Hi Vinod,

As it says on the tin, here's an initial driver for the Arm DMA-350[1].
This has the intentions of growing into a fully-featured driver, but so
far my only development platform has been an Arm FVP (software model)
which doesn't emulate peripheral requests, so this is as far as I've
been able to get with dmatest alone. However, I figure it's enough to
be worth posting for review, at the very least.

Thanks,
Robin.

[1] https://developer.arm.com/Processors/CoreLink%20DMA-350


Robin Murphy (2):
  dt-bindings: dma: Add Arm DMA-350
  dmaengine: Add Arm DMA-350 driver

 .../devicetree/bindings/dma/arm,dma-350.yaml  |  44 ++
 drivers/dma/Kconfig                           |   7 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/arm-dma350.c                      | 659 ++++++++++++++++++
 4 files changed, 711 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/arm,dma-350.yaml
 create mode 100644 drivers/dma/arm-dma350.c

-- 
2.39.2.101.g768bb238c484.dirty


