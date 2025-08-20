Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074DECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 11:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V8Jc4FOwHd285z8ayJQSPGu0Ri8YU8kfALzud9lDK50=; b=qQ67dhH7GhydWxebDiFebF11U3
	5avTqRzeYg4eDg2jovAUfHnct2lYdtDPTrWyZnZhsYX6ThsmwnFHtfqq8oNu6vPNWWTtouvVskwEx
	eGIxZ4XiPHxW7DdpPGMTuQ1XzwGK0Zocc1huVUvOv5+Yh5/4pIUuQYuc0JMQBYVpHbOSVx9KJdWmV
	RkfoOYp30Yf8UfwLD0IrEzotYAKKN7bJ8pOWDDt78hzGBPUULYFVtSQjMKfqyBAiLLXSWAoJTjthq
	wmUpdGVEitkdNEAJJEKwU7tW6jP3s5L/LYmGKJvHKVnvrf8ot3C8vbjl8M+Ggf12xx2OGSYyqUDI2
	2OgRAXEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoger-0000000DJaK-3W7L;
	Wed, 20 Aug 2025 11:07:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uog3C-0000000D8zS-3Ii4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 10:28:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D346845F7D;
	Wed, 20 Aug 2025 10:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD9F1C4CEED;
	Wed, 20 Aug 2025 10:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755685693;
	bh=rvVoT5qxgkkZDKZS3YjM68YWfV1dOLg3+5PJa4h8d6c=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NNxNl4f0l9LnP23igZh3KkAHaDDT4KXUjqVwCCIlY8k408CeYlaONp7x5NYGAHmkh
	 FmJ0BpUOqz+XOanJIA0Bnnj+HEnj2/sTAl8Q/rqEu3iO1ppiLyuBs8NTSRmY3uepyQ
	 PC787yEWM6X9p9ql8wn5QpfrkKlTaMtHi1CcbGE7ovxg5DhUXjCk344b4grdB7m4+l
	 IaBhs03NzEEXpRcE2+aUiM6XjiWy6STrRKXfXqPME8g+21AfIGBFv4q/nw2uEwzDNv
	 wPVZ2ZPyrtUuYinB1eHMUZcGwHPPDJCqRVtfrbfqDPWWccTKaUBt/H6oClDJqJVlgh
	 Xqv2PeRAxV+ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CFFCA0EF8;
	Wed, 20 Aug 2025 10:28:13 +0000 (UTC)
From: John Cox via B4 Relay <devnull+john.cox.raspberrypi.com@kernel.org>
Date: Wed, 20 Aug 2025 11:28:06 +0100
Subject: [PATCH] arm64/dma-mapping: Fix arch_sync_dma_for_device to respect
 dir parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-arm64-dma-direction-fix-v1-1-818a4ca8f879@raspberrypi.com>
X-B4-Tracking: v=1; b=H4sIADWjpWgC/x2MSwqAMAwFryJZG2hL/V5FXFQbNQs/pCKCeHeDy
 3nMmwcSCVOCNntA6OLE+6Zg8wzGJWwzIUdlcMYVprYNBllLj3ENGFloPNXHiW+sgq3i4AtnvAF
 9H0I6/+Wuf98P26gJo2kAAAA=
X-Change-ID: 20250819-arm64-dma-direction-fix-7a17db452040
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 John Cox <john.cox@raspberrypi.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755685692; l=2865;
 i=john.cox@raspberrypi.com; s=20250820; h=from:subject:message-id;
 bh=A0faGdB6jvGvpOhr4yqKULcyxzYLZmrHeTUjS8AAS2I=;
 b=nrUwVChnIiNiher7bRqc6ipbU0fkP4TfLtEF+RtEpxE5xLugC4vRWGZBL2szJSAGBc60CXbWJ
 RzsIhegwfJoAg7TfnGbPK6FJzz5Y5fJxcjBgBQc5bz+7LOZ3MLrO8oc
X-Developer-Key: i=john.cox@raspberrypi.com; a=ed25519;
 pk=a3LAIU66MAZzpHbiNZ4El5gKaDfA4ONOVlPUCzEGUDI=
X-Endpoint-Received: by B4 Relay for john.cox@raspberrypi.com/20250820 with
 auth_id=497
X-Original-From: John Cox <john.cox@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_032814_871164_E37A93FF 
X-CRM114-Status: GOOD (  18.47  )
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
Reply-To: john.cox@raspberrypi.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: John Cox <john.cox@raspberrypi.com>

All other architectures do different cache operations depending on the
dir parameter. Fix arm64 to do the same.

This fixes udmabuf operations when syncing for read e.g. when the CPU
reads back a V4L2 decoded frame buffer.

Signed-off-by: John Cox <john.cox@raspberrypi.com>
---
This patch makes the arch_sync_dma_for_device function on arm64
do different things depending on the value of the dir parameter. In
particular it does a cache invalidate operation if the dir flag is
set to DMA_FROM_DEVICE. The current code does a writeback without
invalidate under all circumstances. Nearly all other architectures do
an invalidate if the direction is FROM_DEVICE which seems like the
correct thing to do to me.

This patch fixes a problem I was having with udmabuf allocated
dmabufs. It also fixes a very similar problem I had with dma_heap
allocated dmabuf but that occured very much less frequently and I
haven't traced exactly what was going on there.

My problem (on a Raspberry Pi5):

[Userland]
Alloc memory with memfd_create + ftruncate
Derive dmabuf from memfd with udmabuf
Close memfd
Queue dmabuf into V4L2 with QBUF
<decode a video frame>
Extract dmabuf from V4L2 with DQBUF
Map dmabuf for read with mmap
Sync for read with DMA_BUF_IOCTL_SYNC with (DMA_BUF_SYNC_START |
DMA_BUF_SYNC_READ)
Read buffer
Sync end
Unmap

I get old (zero) data out of the "Read buffer" stage in some cache
lines sometimes.
It doesn't matter which way round the mmap & sync are.

I am aware that there is a patchset going through for udmabuf that may
well fix the udmabuf case above, but given that this patch fixes
something similar in dma_heap/system too I think it is still worth
having.
---
 arch/arm64/mm/dma-mapping.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index b2b5792b2caaf81ccfc3204c94395bb0faeabddd..51c43c1f563015139e365ed86f0f5f0d9483fa7f 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -16,8 +16,22 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 			      enum dma_data_direction dir)
 {
 	unsigned long start = (unsigned long)phys_to_virt(paddr);
+	unsigned long end = start + size;
 
-	dcache_clean_poc(start, start + size);
+	switch (dir) {
+	case DMA_BIDIRECTIONAL:
+		dcache_clean_inval_poc(start, end);
+		break;
+	case DMA_TO_DEVICE:
+		dcache_clean_poc(start, end);
+		break;
+	case DMA_FROM_DEVICE:
+		dcache_inval_poc(start, end);
+		break;
+	case DMA_NONE:
+	default:
+		break;
+	}
 }
 
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,

---
base-commit: 14131859b2615fd3076ffdad370fc5500a037432
change-id: 20250819-arm64-dma-direction-fix-7a17db452040

Best regards,
-- 
John Cox <john.cox@raspberrypi.com>



