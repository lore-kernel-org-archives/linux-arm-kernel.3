Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F8EC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 13:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cT/hBjEevkq2Mteug+1FOv3W118GQQs36fW0SWyNl98=; b=XUnyfkr2lHYUoNZHgeOgO/YlER
	wYRWPDcN4rVf6k9hfmko7d+Wk9ftmfAXUh0Su/x8EvLv/tElnT4kD4fN2OCNPu9o05jx5qU1etkiF
	HCC/wep4kp37ATTyqI6qDObvFf6gPko/RRUlDSyCFMAc+sukQZTy3YAkppZRVsG0+nnGAW4cCRFmN
	S9FZtA3NZBRrDUAVeLxBF0zDkNUuMJQH3F5Rfbs3yTZQe2aAbTrhFTJMbFNMvkoTSUqMJfNFjSwWz
	ma2/N3prnO8NyqEuJ4V7WJE57Rm3vn8hz0jHi5BTbUqiggFsTM8aqU+nWK+Brjty/aYzpj/GBRVcH
	utwCkXGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHcz-0000000CpXJ-1TML;
	Tue, 05 Aug 2025 13:22:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHQs-0000000CnUh-1mqz;
	Tue, 05 Aug 2025 13:10:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4C35A56343;
	Tue,  5 Aug 2025 13:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6CAC4CEF0;
	Tue,  5 Aug 2025 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399421;
	bh=OtL0BvKJrFQvW7Ox0KkmTvFHyapror2XBcqcthYyGek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QU+N3ybq0GG/icLAmX/HjG7d0buXSJuti1IZGRHl7rqbNmum7g45J6EkcEeBlJcB8
	 MQsoWv3Yhf9PAROxZ6FC+WC72TVR4T5KSjoZbSkoWslyfwPFfSlBQTYsixl7Oa4Fg3
	 cuehlDcmxwRRmF/TnPDIJFj02DGQN+7c0eB0g3Pi2IydxmzQVZcNI3LhWCLC07KC5r
	 kEG7BLiHa30ARhVLXunUInei+CnOOa+yLrxsm7qwpKJBOAXLCHPqs7UMX/Ez0yDeNJ
	 cyGUj91dw7ayObMPJ6dB/R0zGoG0/fx59ricFILwHbx7nZ2dbdSCbI+ftc+NeW9a1G
	 8gCZ1ZQiMMSjA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	kernel-list@raspberrypi.com,
	florian.fainelli@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.16-6.15] media: raspberrypi: cfe: Fix min_reqbufs_allocation
Date: Tue,  5 Aug 2025 09:08:51 -0400
Message-Id: <20250805130945.471732-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_061022_619762_EDD127D1 
X-CRM114-Status: GOOD (  17.46  )
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

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

[ Upstream commit 57b5a302b5d529db96ddc52fbccec005092ebb3d ]

The driver checks if "vq->max_num_buffers + *nbuffers < 3", but
vq->max_num_buffers is (by default) 32, so the check is never true. Nor
does the check make sense.

The original code in the BSP kernel was "vq->num_buffers + *nbuffers <
3", but got mangled along the way to upstream. The intention was to make
sure that at least 3 buffers are allocated.

Fix this by removing the bad lines and setting q->min_reqbufs_allocation
to three.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Clear Bug Fix**: This fixes a logic bug where the condition
   `vq->max_num_buffers + *nbuffers < 3` could never be true since
   `vq->max_num_buffers` defaults to 32. The original BSP kernel code
   was `vq->num_buffers + *nbuffers < 3`, which got incorrectly
   translated during upstreaming.

2. **Functional Impact**: The bug prevents the driver from ensuring a
   minimum of 3 buffers are allocated, which could lead to buffer
   underruns or improper operation of the Raspberry Pi Camera Front End
   (CFE) driver. This directly affects users of Raspberry Pi cameras.

3. **Simple and Contained Fix**: The fix is minimal - it removes 2
   problematic lines and adds 1 line setting `q->min_reqbufs_allocation
   = 3`. This is the proper V4L2 videobuf2 API way to ensure minimum
   buffer allocation rather than manually adjusting buffer counts.

4. **Low Risk**: The change is confined to a single driver file
   (`drivers/media/platform/raspberrypi/rp1-cfe/cfe.c`) and uses the
   standard V4L2 framework mechanism (`min_reqbufs_allocation`)
   properly. There's minimal risk of regression since it's replacing
   broken code with the correct API usage.

5. **Recent Driver**: The rp1-cfe driver was added relatively recently
   (commit 6edb685abb2a), and this bug was introduced during the
   upstreaming process. Users running stable kernels with this driver
   would benefit from having the correct behavior.

6. **Meets Stable Criteria**: This satisfies the stable kernel rules as
   it:
   - Fixes a real bug that affects users
   - Is obviously correct (uses proper V4L2 API)
   - Has been reviewed and signed-off by subsystem maintainers
   - Is small and self-contained

The commit properly uses the videobuf2 framework's
`min_reqbufs_allocation` field which is designed specifically for this
purpose - ensuring a minimum number of buffers are allocated when
VIDIOC_REQBUFS is called.

 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index fcadb2143c88..62dca76b468d 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1024,9 +1024,6 @@ static int cfe_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 	cfe_dbg(cfe, "%s: [%s] type:%u\n", __func__, node_desc[node->id].name,
 		node->buffer_queue.type);
 
-	if (vq->max_num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->max_num_buffers;
-
 	if (*nplanes) {
 		if (sizes[0] < size) {
 			cfe_err(cfe, "sizes[0] %i < size %u\n", sizes[0], size);
@@ -1998,6 +1995,7 @@ static int cfe_register_node(struct cfe_device *cfe, int id)
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &node->lock;
 	q->min_queued_buffers = 1;
+	q->min_reqbufs_allocation = 3;
 	q->dev = &cfe->pdev->dev;
 
 	ret = vb2_queue_init(q);
-- 
2.39.5


