Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5821DC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i8KQnL2/4WkeJNW646kevDNZ7P73axxo8GxkdWXAlmI=; b=OCRqIBXdvvCWwsWaisEQCFBhN7
	5y4fKEevVKdpJIBOXAYFzlM8GOp3qUrHdOQsBRuiplrf6Phe5pROcXnBqwTpZgFAslXK6SlWjW19q
	cjXjXDMhZtjVS3WMYg7/whLBhhSAbzcEEQmQEiMtyrecSOfGDgEiaflAuO6T4pwPvZFvXpUa5V9Tz
	hhlC+MesXTeO5YTvXro1rPII1W0CQYhW2M4z/53Qzc5tCggpcTzkYUQW9BIjcd9mtP/MMcjNK0Uh7
	DUuhMCauhPf71rsbQcVHi6lcUvCtxqKO8opPGxDAB427kBSuFf0w3/HgEzUn0HYpZg2fSxZn4WTKw
	QoY88U4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6m3d-00000008rAX-3rEY;
	Wed, 16 Sep 2026 09:36:01 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6m3a-00000008r8n-2Af4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:36:00 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACnqjj7YqpqpXTgBw--.42407S2;
	Wed, 16 Sep 2026 17:35:55 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: arm-scmi@vger.kernel.org
Cc: cristian.marussi@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sudeep.holla@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: Fix msg use-after-free in virtio_mark_txdone()
Date: Wed, 16 Sep 2026 09:35:27 +0000
Message-Id: <20260916093527.2004594-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACnqjj7YqpqpXTgBw--.42407S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF18CrW5CF4kJr4DKFW5GFg_yoW8AFy5pF
	4qga9xGw4UJF4xta48AF4kuFya9anYgr9xWry29aykCan8JF18XrWUAwn0gFyUArWxGa4j
	kF4ktrZrGF1DZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUOM
	KuUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRQMA2qqP4eVTAAAsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_023558_924343_E256A242 
X-CRM114-Status: GOOD (  10.81  )
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

virtio_mark_txdone() can drop the last reference of a polled message
while msg->poll_lock is still held, returning the message to the
free-list where a concurrent sender can re-allocate it and race with
the unlock at the end of the critical section. Hold a spare reference
across the poll_lock critical section and drop it after the unlock.

Fixes: 5a3b7185c47c ("firmware: arm_scmi: Add atomic mode support to virtio transport")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/firmware/arm_scmi/transports/virtio.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index 326c4a93e44b..4bbd9dd2de83 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -616,6 +616,14 @@ static void virtio_mark_txdone(struct scmi_chan_info *cinfo, int ret,
 		return;
 	}
 
+	/*
+	 * Hold a spare reference to msg so that it is not returned to the
+	 * free-list while it is still accessed under poll_lock: a message
+	 * sitting on the free-list can be re-allocated and re-initialized
+	 * without taking poll_lock.
+	 */
+	scmi_vio_msg_acquire(msg);
+
 	spin_lock_irqsave(&msg->poll_lock, flags);
 	/* Do not free timedout polled messages only if still inflight */
 	if (ret != -ETIMEDOUT || msg->poll_status == VIO_MSG_POLL_DONE)
@@ -624,6 +632,8 @@ static void virtio_mark_txdone(struct scmi_chan_info *cinfo, int ret,
 		msg->poll_status = VIO_MSG_POLL_TIMEOUT;
 	spin_unlock_irqrestore(&msg->poll_lock, flags);
 
+	scmi_vio_msg_release(vioch, msg);
+
 	scmi_vio_channel_release(vioch);
 }
 
-- 
2.34.1


