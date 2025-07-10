Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F50C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3eDvXH7d5eFDYVWU06PRyX8OxFvPAhOSJDMUuWqkZo=; b=XnsnTFI9sXA/AHrZMdXZu+8gfd
	/BLapkkXEpJERUhpCka7JXCqXPeOLzkwCI+yFcV2P+H/Xhq5+DeVP8mQ25AaMrIOxX5BmK6ZpsLL+
	AogEQNu+lOySwPNN01CHJO+YoddO7JvjUVIfRNf58lgZpT/ObwQDR2OEssQ86J7zGxfQnRLE/OOtB
	xL0skPxqkA7JYOmXGzh6Nz///IUN+QAEiR+ey2OLxPGX195WhYyf6dfvKxWuLVgn4l3YAeP9hWbwy
	ZlkAAiAjmTa/Pa+biJIE+deN3LPJZlXgc3Rd4jIEWG3NEXrXJui1VOrzlzj37gqO+GSKsHdKnNbFK
	t/qjWRXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZr2U-0000000Bsa3-2r9G;
	Thu, 10 Jul 2025 13:10:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpQW-0000000BdWq-1tmq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 11:26:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F62446DE7;
	Thu, 10 Jul 2025 11:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0AEC4CEE3;
	Thu, 10 Jul 2025 11:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752146815;
	bh=YsnzDVQg/DVkrhs774taeeXQ+MFgNHcGDxgkiSjhU6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faLhZDzgdqb/3jBhBBX/zTH/N4QurnqFsyCi048n7aREzmjV8pBAl1a5w4HHtcQ0A
	 D1OYkmMiNpVVb+i1oP9aOd7MLe7pxkJ/UVYNZkksz/AU6h4tgMkDLA+h25YFxL6UCp
	 fMjjRNpCPWB9pwJOwaMr22x6f2IEvg1r8cQqNZP4pxjtwmvXsgTxroowFWV9/5QUbs
	 uqfpPIp/ht01Qf3q2h3P+O4j3/TPA0DPBNlzJKEAVukOlB3A0nUTn9wQ6ctbZHci/6
	 nLkUcu3Mm/lEBSfKX40ZlVtubMskrW4VR9bP/hfTxZrGwLD6175HGyjNSaV2RuTqo7
	 e0HUNzAALuVtg==
Date: Thu, 10 Jul 2025 12:26:50 +0100
From: Simon Horman <horms@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, michal.simek@amd.com, vkoul@kernel.org,
	radhey.shyam.pandey@amd.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, harini.katakam@amd.com
Subject: Re: [PATCH V2 2/4] dmaengine: xilinx_dma: Fix irq handler and start
 transfer path for AXI DMA
Message-ID: <20250710112650.GS721198@horms.kernel.org>
References: <20250710101229.804183-1-suraj.gupta2@amd.com>
 <20250710101229.804183-3-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710101229.804183-3-suraj.gupta2@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_042656_512646_7EE982A5 
X-CRM114-Status: UNSURE (   9.52  )
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

On Thu, Jul 10, 2025 at 03:42:27PM +0530, Suraj Gupta wrote:
> AXI DMA driver incorrectly assumes complete transfer completion upon
> IRQ reception, particularly problematic when IRQ coalescing is active.
> Updating the tail pointer dynamically fixes it.
> Remove existing idle state validation in the beginning of
> xilinx_dma_start_transfer() as it blocks valid transfer initiation on
> busy channels with queued descriptors.
> Additionally, refactor xilinx_dma_start_transfer() to consolidate coalesce
> and delay configurations while conditionally starting channels
> only when idle.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> Fixes: Fixes: c0bba3a99f07 ("dmaengine: vdma: Add Support for Xilinx AXI Direct Memory Access Engine")

Hi, 

This is not a proper review.
And there is probably no need to repost just becuse of it.
But:

s/Fixes: Fixes: /Fixes: /

...

