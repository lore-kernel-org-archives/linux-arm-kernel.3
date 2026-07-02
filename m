Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE488C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzDg6Eu0nRR4p4AkNSCywRzTxAwA/c7nHfpbUiOlcNE=; b=WbUtFm8oE9utFOaDT9ihni88w5
	8+HJNVqAXzRCrxUW6tC06pMPNiKYNZrejYsyomx4YIdxLKxdOPGGjaDsRYAbfVIyEj7rLcjrbCKmN
	8QMZ9SXtfI7S2B/GrJu3AmSkQ0zz/I+xwXoe9EKNUNPN59uNQ0m3qtFrSMPiNwcXxuk4KbIu6XBYS
	5FAYIC0b9hD40IX0Emc4m33hWVlzAanPfWVoMXkW//W/nSwW/4GH5k1ybBgmAJiyRRE03dtq5wVgy
	qi25NeVEv+YcWa28U+h1VCJtU9TCcFMBV8DE85VG9j2VHri0qHUFCdtdleTZ8FEOWhVTsDSYIheI1
	uh6ZMHQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJtC-00000004vpw-4A0Q;
	Thu, 02 Jul 2026 16:03:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJtB-00000004vnQ-3uZ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 605B8601EE;
	Thu,  2 Jul 2026 16:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330CD1F000E9;
	Thu,  2 Jul 2026 16:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008225;
	bh=rzDg6Eu0nRR4p4AkNSCywRzTxAwA/c7nHfpbUiOlcNE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XDmHyGxWFNpd+TXH31F8Y65qId4sMIqFOB/0x0UMCZtGjx1jtvshcuYYeASiYxTcO
	 dBk8EX9wQiBK4XTNWdHEODZqN7CNateo63o+1QQ1ZvG4nSZXjJrskVxNclS9QB7c7j
	 rwg8IqwC+anXaKa8AEZsX058hCfCTFGZQptu/CQh8NPFr7uGPg+uGZ5sDofleZ+Qrc
	 M7VuuR01jXbWi+uD3guMuH8+vnhHmmYaZ9sG6fppmDOjLvvJTzaqLOY5cSK/ZT5XM2
	 hqqdwi6jI1+WYZjlmYitdaD/B7kkTG9JB78Ch+suKYQ3lztkYEPlBBDEhwtL3M2VBW
	 li4EWV8pKpXMQ==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, michal.simek@amd.com, dev@folker-schwesinger.de, 
 Suraj Gupta <suraj.gupta2@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260626092656.1563871-1-suraj.gupta2@amd.com>
References: <20260626092656.1563871-1-suraj.gupta2@amd.com>
Subject: Re: [PATCH v3 0/3] dmaengine: xilinx_dma: Fixes and optimizations
 for AXIDMA and MCDMA channel management
Message-Id: <178300822284.756665.15130671466547971043.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:33:42 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Fri, 26 Jun 2026 14:56:53 +0530, Suraj Gupta wrote:
> This patch series addresses issues and optimizations in the Xilinx
> AXI DMA and MCDMA drivers:
> 1. Fix channel idle state management in the interrupt handlers.
> 2. Enable transfer chaining by removing unnecessary idle restrictions.
> 3. Optimize control register writes and channel start logic.
> 
> Note: The patches in this series were part of following IRQ coalescing
> series which is under discussion:
> https://lore.kernel.org/all/20250710101229.804183-1-suraj.gupta2@amd.com/
> 
> [...]

Applied, thanks!

[1/3] dmaengine: xilinx_dma: Fix channel idle state management in AXIDMA and MCDMA interrupt handlers
      commit: 0b6d055edb55ecadadf54e930c2b4fab76fa9a5a
[2/3] dmaengine: xilinx_dma: Enable transfer chaining for AXIDMA and MCDMA by removing idle restriction
      commit: 6078690034790131b9a59081bdf30e26de2254af
[3/3] dmaengine: xilinx_dma: Optimize control register write and channel start logic for AXIDMA and MCDMA in corresponding start_transfer()
      commit: 887b3119380cde56f648130029062c223341a1b3

Best regards,
-- 
~Vinod



