Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E407CEA3C5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+s0l6CgVHpXjxxEQxSFAhgRpNt1uE98jKbfCFhsnvhw=; b=R9AZ+DPRMo+MhP/iBNRCT9FZuy
	HcV6SveFCR+vD7FUjW1NeevpM/ayFRhuNJSYg7fEcpzfv82I5vy5KH7X9CgvjuLfVDDpDr1u7BlnC
	BtT+CmJ4h6oV2cLaAKi1nfeqQ6FbLwwrsmuknfIY0XxmqnlW5sOynu5Jt1WMaa9Lo9ojcST8+tm/6
	VoLOZkqD1s/BCZOK6e5y6+21nM+LNb1GoJCkmid/XUEm5AgblDUqc9LtYVSX7QWCPulzSS7QF2ngS
	t8W+lkjOJp5JIhu+IlOv82XsL6qRiUdK4MdyQ7KmgDz/EWz8pCBuLe3Hzsnm/NCpw5ENOS5Wi0o5u
	CAZwUQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApnJ-0000000Aa0l-1hRL;
	Thu, 09 Apr 2026 13:51:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApnC-0000000AZx9-1JoL;
	Thu, 09 Apr 2026 13:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775742690;
	bh=EANjXK0pUgPsxuTannl80kTzacZ17wagSvF/zmR7XQE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dXvO3xJxl7lDEOkIRDGLuC+39/Sm6Y2njQQiRjybGrV0XFhGDJ9mL99rvQktUq7cN
	 VqFYAexEknC3JnYkGlCzdstdGN9PalgO49S6bStNXE5piAuVPXWxh5v8uypHd7Mltj
	 KhlW0hg5HJg+jJjVATlAwO8MtJf97+deopOT6vum7r9xBfiL4IWuiRl+7zYLBD+XTO
	 nRjJbzSkrl4GNPBHgmoeBfJZJWpYKtT2LY72khK5p9LqnpnJOxbWimZUSmlj/HnuLR
	 hVlCld99uuUMyy1wucuS/xXkYmx6UdWdb8LwbDEb8SNcz5CnCsdegNBPmRdYMUT6fk
	 xmDcvA5ir4z+w==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C1C917E0D23;
	Thu,  9 Apr 2026 15:51:29 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 09 Apr 2026 09:50:36 -0400
Subject: [PATCH 1/7] media: v4l2-mem2mem: Add v4l2_m2m_buf_done_manual()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rkvdec-multicore-v1-1-62b316abf0f7@collabora.com>
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
X-CRM114-CacheID: sfid-20260409_065134_500087_99AF219D 
X-CRM114-Status: GOOD (  14.67  )
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

This function can be used to mark buffers as done, handling locking, but
not finishing the job as it is done by v4l2_m2m_buf_done_and_finish_job().

To avoid copying similar code, a static function is added with an extra
finish argument.
The code path of v4l2_m2m_buf_done_and_finish_job() is unchanged.

This allows for finer grained buffer management in drivers, scheduling
new jobs before the previous one is finished and prepares for enabling
multicore support in rkvdec.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 27 ++++++++++++++++++++++-----
 include/media/v4l2-mem2mem.h           | 20 ++++++++++++++++++++
 2 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index a65cbb124cfe..7f9fad4f6807 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -503,9 +503,9 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 }
 EXPORT_SYMBOL(v4l2_m2m_job_finish);
 
-void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
-				      struct v4l2_m2m_ctx *m2m_ctx,
-				      enum vb2_buffer_state state)
+static void _buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
+				     struct v4l2_m2m_ctx *m2m_ctx,
+				     enum vb2_buffer_state state, bool finish)
 {
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	bool schedule_next = false;
@@ -532,13 +532,30 @@ void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
 	 * before the CAPTURE buffer is done.
 	 */
 	v4l2_m2m_buf_done(src_buf, state);
-	schedule_next = _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
+	if (finish)
+		schedule_next = _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
 unlock:
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 
-	if (schedule_next)
+	if (schedule_next || !finish)
 		v4l2_m2m_schedule_next_job(m2m_dev, m2m_ctx);
 }
+
+
+void v4l2_m2m_buf_done_manual(struct v4l2_m2m_dev *m2m_dev,
+			      struct v4l2_m2m_ctx *m2m_ctx,
+			      enum vb2_buffer_state state)
+{
+	_buf_done_and_job_finish(m2m_dev, m2m_ctx, state, false);
+}
+EXPORT_SYMBOL(v4l2_m2m_buf_done_manual);
+
+void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
+				      struct v4l2_m2m_ctx *m2m_ctx,
+				      enum vb2_buffer_state state)
+{
+	_buf_done_and_job_finish(m2m_dev, m2m_ctx, state, true);
+}
 EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
 
 void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 31de25d792b9..6a36fc885f5f 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -227,6 +227,26 @@ void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
 				      struct v4l2_m2m_ctx *m2m_ctx,
 				      enum vb2_buffer_state state);
 
+/**
+ * v4l2_m2m_buf_done_manual() - manually mark the job as done, but do not
+ * finish it.
+ *
+ * @m2m_dev: opaque pointer to the internal data to handle M2M context
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @state: vb2 buffer state passed to v4l2_m2m_buf_done().
+ *
+ * The function works the same way as v4l2_m2m_buf_done_and_job_finish()
+ * but does not inform the framework that the job has been finished,
+ * leaving the user the responsability to call v4l2_m2m_job_finish()
+ * when a buffer can be released to userspace.
+ *
+ * It allows driver to process new buffers, before the previous one is
+ * done.
+ */
+void v4l2_m2m_buf_done_manual(struct v4l2_m2m_dev *m2m_dev,
+			      struct v4l2_m2m_ctx *m2m_ctx,
+			      enum vb2_buffer_state state);
+
 static inline void
 v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
 {

-- 
2.53.0


