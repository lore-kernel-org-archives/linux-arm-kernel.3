Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D16CFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 19:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZvhmZ3ZsaI84zJzHZFp4OgbKNKfkWafjnHrFpWIa3x0=; b=28A4GaTeVtV4rG8ZfjcXL6BMW9
	YYbxz9slOooKOASzL14wAR+8WJoaeu3MJf0q6CreyuqLfFeJ7sDbsWtgADYcAo0Tqo2uaYhhc7AFK
	F95vu8rtoPCY5UU7bRb6xLsbEPvJUF2BrX1h8Pg/A3RbVsYhTCYnTe1rMiXLzuTeGqpliTsNU0y4o
	iSrGdG1u3LzI+03F0FGYUtL3oXPc2HpEoFdkrwRtEXARYFNV6qxjVUpdpo95b0/uPsUAaid1oVN72
	ppIlXMn9daG6WLDTccgLo0NcyTahNFTpdR7CIGzL5aa4BAFCSmMp8v6eYeYsh7KQkggZV9eYBG2Dr
	IAq+yNbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIB0Q-00000004AbU-0UtM;
	Wed, 29 Apr 2026 19:55:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIB0N-00000004AbA-2rkJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 19:55:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8706340E32;
	Wed, 29 Apr 2026 19:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D63BC19425;
	Wed, 29 Apr 2026 19:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777492530;
	bh=py3ZugpVGOSerR4b9aWRzpta2tWjJhkdkiUmYWanWSs=;
	h=Date:From:To:Cc:Subject:From;
	b=syvJohsudSrYN3C1ecR5siFFpEGtIeIbdtsafi881gUolpzc0EmA3sn2uWpzB+I0E
	 ZkmGnBHUdKE2n1Mw8VBUkv35Si/6WOgzQMZGp/A4OPndlPTgRglYzB5s2pV+H17h3Z
	 4l5L+vIrZr1UcEu4mlirV5lFUN67UmkGz5CQVREqY8ssseiWnGE1qcc/mA9rsnjLNN
	 1nssc9HWWqTxaxDBi74EnS0T23lvHaqD370sjUXy5CL6MIQUR+53yM/sfQns328ty3
	 Iw6RJniD1o7yt+YNNnYRfHcesisVVnTek97OJ5SINW4Ej7NX9PVeAE9GNz6C/0T3xH
	 vBMBbhaj+CiVw==
Date: Wed, 29 Apr 2026 13:55:27 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] media: xilinx: Avoid -Wflex-array-member-not-at-end
 warning
Message-ID: <afJiL-iZ4QbJ5v12@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_125531_740749_B18976C2 
X-CRM114-Status: GOOD (  11.47  )
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use the TRAILING_OVERLAP() helper to fix the following warning:

drivers/media/platform/xilinx/xilinx-dma.h:99:41: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

This helper creates a union between a flexible-array member (FAM)
and a set of members that would otherwise follow it. This overlays
the trailing members onto the FAM while preserving the original
memory layout.

Lastly, the static_assert() ensures the alignment between the FAM
and struct data_chunk sgl; is not inadvertently changed, and it's
intentionally placed inmediately after the related structure (that
is, no blank line in between).

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/media/platform/xilinx/xilinx-dma.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-dma.h b/drivers/media/platform/xilinx/xilinx-dma.h
index 18f77e1a7b39..65f6147ff6c6 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.h
+++ b/drivers/media/platform/xilinx/xilinx-dma.h
@@ -96,9 +96,14 @@ struct xvip_dma {
 
 	struct dma_chan *dma;
 	unsigned int align;
-	struct dma_interleaved_template xt;
-	struct data_chunk sgl;
+
+	/* Must be last as it ends in a flexible-array member. */
+	TRAILING_OVERLAP(struct dma_interleaved_template, xt, sgl,
+		struct data_chunk sgl;
+	);
 };
+static_assert(offsetof(struct xvip_dma, xt.sgl) ==
+	      offsetof(struct xvip_dma, sgl));
 
 #define to_xvip_dma(vdev)	container_of(vdev, struct xvip_dma, video)
 
-- 
2.51.0


