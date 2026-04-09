Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F3BE98FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRlSOieQwZuj3hHx9M8ISniqi6X9+3FvpqzcTyUW6ew=; b=Et5nI+s6tcywak3A9XUzgX6RU5
	Xx47lRSzSp3xba3pU6sHWUQA4kSSx/vZFm6cUI1tsAHunqCJe+tCD0UHrrJ16Q4zMI/+N/D6RANcJ
	h09PMiw5myJOAT2Nzpp4n5QG+9W5b+V2/bLSU7ux7kBTi6Mil9c3jViZp72tnpOYLvIr3hI32DdGR
	6J0KyeIp1qD8Hm8Bur987PtZrmjwFPZbb6bnV88s5HHCzyD41R2/O46p5p3UduNp1vGqBK0nxOJg5
	Pzgrdihi/aEBc7VSwjLSskicrcAj+fD4sp3y2htHpc/mUOScuHwie4u9m4KxbWcNi07HHqTS6zzrF
	UMqtZydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApnK-0000000Aa1j-02tB;
	Thu, 09 Apr 2026 13:51:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApnD-0000000AZxP-12Cd;
	Thu, 09 Apr 2026 13:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775742692;
	bh=Uf3oawvhkOYDFsuF3t/kHZrtN6yz3uwa92uWH3g5zZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jOsFp6YU19b4d9Al8Ya16eVbiA5JsxqAJk1Td7XesbTO3lecWg/CaHDjV0z88Z+wb
	 DyGdSLd82ehcyXpESkkersjoow99twav8ffpVGSyo3ljejE60umkCJ9pbHze46LVhs
	 oxjOOr/1tbekHy8UbuabqjGHmFVtrRN3wJcra9WNgm9OC1T/V4Q0YOy79DOrQlMl44
	 3lMVLCTZyFfuGEWUpqiSDomLanqEgLF4fT7glpfMKA0b+hD3NKsbNNNTYA51Bg50BZ
	 R9Oqk6nhI4gqtPtVmYnR9TjTyP1CWvkNOO90zFU29Aey0SxevVZ1FuUg+E6VCQVF+6
	 wGCto+Wtu4K+w==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 09A3017E1313;
	Thu,  9 Apr 2026 15:51:30 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 09 Apr 2026 09:50:37 -0400
Subject: [PATCH 2/7] media: v4l2-mem2mem: Remove WARN_ON() in
 v4l2_m2m_job_finish()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rkvdec-multicore-v1-2-62b316abf0f7@collabora.com>
References: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
In-Reply-To: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_065135_947916_21C2161C 
X-CRM114-Status: UNSURE (   8.71  )
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

This warning was added because there was no way, for drivers that support
holding capture buffers to mark jobs done correctly without calling
v4l2_m2m_buf_done_and_job_finish().

Now that v4l2_m2m_buf_done_manual() has been introduced, it has become
possible and drivers can use it with v4l2_m2m_job_finish() for finer
grained buffer management.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 7f9fad4f6807..27f7dd7974b5 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -487,13 +487,6 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 	unsigned long flags;
 	bool schedule_next;
 
-	/*
-	 * This function should not be used for drivers that support
-	 * holding capture buffers. Those should use
-	 * v4l2_m2m_buf_done_and_job_finish() instead.
-	 */
-	WARN_ON(m2m_ctx->out_q_ctx.q.subsystem_flags &
-		VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
 	schedule_next = _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);

-- 
2.53.0


