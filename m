Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B4FC88E66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 12:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zneXk2zvxhOJsgdPO+EexwvyQ2vdihR/t5cnjfiXPTE=; b=N45jyYpfw23xmKv9LxjazZsCQA
	+lwlBINufknqup4SZ+v7EIscWc1xoWZCzcnZV75QFZwWyRDi5JaINDGhdApbXGtZu+lscTMlvKBLS
	yYloVM54lFpRs7wD37vl07t4SyDMdgjMDKKNqzsCb9TBQlOsgkLtYdi+9oWox/OZxd3OiLfnsu3Dh
	75nOm8QbnE+B6/JRObBHPdDiI63M+y6dZcec0QPCgQnrt8R1X4pvRlEtKWNaJAHynFbZoNXq4bE51
	rVrNa/3jkE5n3SUBka4AIkD9i9RGY2K7fd/4bY4g9r9kOzjgpMTPpzzdLd9Oq2krv4h91muuVne0R
	vRGPPlyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jhC-00000001frc-2O5n;
	Sun, 13 Sep 2026 12:52:34 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jh9-00000001fqT-0AZn;
	Sun, 13 Sep 2026 12:52:33 +0000
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d907a3f9;
	Sun, 13 Sep 2026 20:52:27 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com
Cc: kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH] media: pispbe: check configuration buffer CPU mappings
Date: Sun, 13 Sep 2026 20:52:24 +0800
Message-Id: <20260913125224.110051-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09ad37f2803a1kunm913aef5425120d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQhlLVkNKGh1PGExNQkxLGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=Dagyz37SunneW4iPEWr7VosuEqqD4oMyF1/h+LUo0AbEk627gU9+e57qlXP18NS2C7Rxd9i9lsPadoE/LT0QdZIUUO4muLGh1KQ8abLNZleFJxEq60fwE8RFp5TsbxjHpFskqPgwERSVCsw4N7nspm1w3jWm9LNG+BT6TBSVvF8=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=zneXk2zvxhOJsgdPO+EexwvyQ2vdihR/t5cnjfiXPTE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_055232_046777_8A39004C 
X-CRM114-Status: UNSURE (   7.71  )
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

vb2_plane_vaddr() can return NULL when a DMA-BUF exporter cannot
provide a CPU mapping, even when the buffer's DMA mapping succeeded.
pispbe_node_buffer_prepare() unconditionally copies the configuration
from that address.

Reject the buffer with -ENOMEM before copying or validating the
configuration if no CPU mapping is available. No buffer is queued or
hardware operation started on this failure path.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index d60d92d2ffa1..56bcf69d70f8 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -839,6 +839,9 @@ static int pispbe_node_buffer_prepare(struct vb2_buffer *vb)
 		void *dst = &node->pispbe->config[vb->index];
 		void *src = vb2_plane_vaddr(vb, 0);
 
+		if (!src)
+			return -ENOMEM;
+
 		memcpy(dst, src, sizeof(struct pisp_be_tiles_config));
 
 		return pisp_be_validate_config(pispbe, dst);

