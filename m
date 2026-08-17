Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03C4C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 09:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vrh4oL+QDE4HDOIBW2j9thq5JTy4DxnTneOKTiKhZ4I=; b=h0fN5ZS/6U9CccTCrG1HwHZSOz
	gwxNQl+6M7xPT+g6LfkX81RcP5dxiuevuyeJ6i5slm37M3rO3Xxw7r9n7zMeWWgHTz7tYa7LtT8QW
	YDNNJfipVbGREc4DmxE78pCNSWf2rdUoPiO5bWu0i1XTYAPiUHCBsIDYX69BYwjnayDZB0IutnWTF
	JSxL84MPY7JqD5OD7JOvLWVcv+qxRB2MNeQaBjTi9j6Bri9ay1vix10SM9rDeyLP3Dv9Eg1V1SYZ9
	Q2oU2XCurXGWeGy9kmL+TkQgeffkupykJDnvHETgiWdM/PHyGjfZcBEiWlBC3KXtO9T88Eyo/+MX1
	voFBOOeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtZd-00000005o2U-16CB;
	Mon, 17 Aug 2026 09:24:05 +0000
Received: from fsn-vps-1.bereza.email ([162.55.44.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtZZ-00000005o19-3B5w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 09:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1786958636; bh=PXTc+4SpRoVNyuwYVp+0QlMWXywXx28HywPyEUqB3S0=;
	h=From:Date:Subject:To:Cc:From;
	b=p6jGhXETMS1cRTppbmuMT4buwFB6COIuAw5xsqHLgZNP+M8GgSHBCBQ5u7771dwE3
	 y4bcYKeToxI/QSQfL0cK3pUJuFsCjhQdk92s7aGxwcW/6SL+WzU6yZ8eQq9ffusYy2
	 QVMn7u+iZHo6NzWxLhcJPPS80upW6QTpoEryPOwwAFAIdcwjrb+T1niBggj1sYiVid
	 7XLvy/h7VOyhrkwrEqMEoYvXCZFRvhiwKyMcB3kmgvvbqpKQB1SCqAMbm/DpVRsPyn
	 A6noeMbP74wjTsTWGQ/b+Xx/4XUb2AwlEc2Yob8yNSaotCTwYC8z1tl68LD+G3odwa
	 SJD0xvIuX6Tlg==
Received: from [127.0.1.1] (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id 0162360279;
	Mon, 17 Aug 2026 11:23:55 +0200 (CEST)
From: Alex Bereza <alex@bereza.email>
Date: Mon, 17 Aug 2026 11:23:55 +0200
Subject: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 reuse order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-fix-hw-buf-desc-reuse-v1-1-d79827a844c7@bereza.email>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMBCE4Vche2aTtgQBX4V4sGWQ9QCmS5WE8
 O5UPX7JzL+TIgqUrsVOEW9RWeYMWxYUpvv8AMuQTc64i2ltw6NsPH3Yp5EHaOCIpGDfVAYdjLN
 tTfn7isjDX7e//a3JPxHWb4yO4wTNuhjWeQAAAA==
X-Change-ID: 20260817-fix-hw-buf-desc-reuse-b730e9e02185
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alex Bereza <alex@bereza.email>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_022402_248855_5984B87A 
X-CRM114-Status: GOOD (  14.05  )
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

xilinx_dma_alloc_chan_resources() builds a static ring of hardware
buffer descriptors once and the driver uses this ring throughout the
lifetime of a channel. This requires the allocation order of hardware
buffer descriptors from chan->free_seg_list to stay in sync with the
hardware buffer descriptor ring built at channel allocation time by
returning oldest descriptors to chan->free_seg_list first.

When chan->pending_list is not empty e.g. during
xilinx_dma_terminate_all() the chan->free_seg_list and the order of the
static hardware buffer descriptor ring get out of sync. Descriptors age
in this order: pending -> active -> done. So freeing pending_list first
returns the newest buffer descriptors to the chan->free_seg_list first
and thus breaks the order required by the static hardware buffer
descriptor ring. Then when the channel is reused, after a wrap around of
the free_seg_list the DMA will find a hardware buffer descriptor with a
length field that is still zeroed and stop with something like this:

  xilinx-vdma 86000000.dma: Channel 000000003a21d7b8 has errors 10, cdr 6de4c000 tdr 6de4c000

After this no more descriptors are completed and a consumer potentially
blocks and waits forever. The only way to get out of this error state is
to rebuild the static hardware buffer descriptor ring and the
free_seg_list by releasing and re-acquiring the channel.

Fix the order in which hardware buffer descriptors are returned to
free_seg_list to ensure the mentioned requirement holds.

Fixes: 23059408b6a3 ("dmaengine: xilinx_dma: Fix race condition in the driver for multiple descriptor scenario")
Signed-off-by: Alex Bereza <alex@bereza.email>
---
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index bef2b031dba1..0817b74f7450 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -920,9 +920,9 @@ static void xilinx_dma_free_descriptors(struct xilinx_dma_chan *chan)
 
 	spin_lock_irqsave(&chan->lock, flags);
 
-	xilinx_dma_free_desc_list(chan, &chan->pending_list);
 	xilinx_dma_free_desc_list(chan, &chan->done_list);
 	xilinx_dma_free_desc_list(chan, &chan->active_list);
+	xilinx_dma_free_desc_list(chan, &chan->pending_list);
 
 	spin_unlock_irqrestore(&chan->lock, flags);
 }

---
base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
change-id: 20260817-fix-hw-buf-desc-reuse-b730e9e02185

Best regards,
--  
Alex Bereza <alex@bereza.email>


