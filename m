Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2D7CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 04:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAsp3VpEafJ9cxB3mLI79s5LcZsAYgH/J7dK9sn4380=; b=z/jMAc2uORGd8eo3+y7HvqAn3o
	IA+D3QEgrbmf3VorQplSBOHf18fpHSnhSR1Hr9xMEsY4+OGCeyYN5Y/RAwpVPJ8jANtUtPOMQuhnW
	EJfdrF59LNVDHhbIQQLIIIQhrsR4qHwJ3pjGqbjN/hhsKcbfpSvs6CGpWO3Yd1Lu/0AR/0iYO91M6
	7pZppqg3TgzOnrO/NYE2uFJGnGvTeFANegnJcNSYzZ9GiYYJNXX7sLWYREisktQ5KvAw5TqGpRvU7
	Mix7wIcO5z1kTpF3bGYjhusEdLxbRevXUKTONDSyGAdK/gcnFgl3IUApKS7U4JZw67FAUmMjr7mf3
	Q8U8/lgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtaw-0000000ALc3-29oo;
	Fri, 12 Jun 2026 04:34:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtat-0000000ALb7-3qDm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 04:34:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490b3637b90so3430495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 21:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781238850; x=1781843650; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAsp3VpEafJ9cxB3mLI79s5LcZsAYgH/J7dK9sn4380=;
        b=JkVk2cRucktgYUrFIwc5PuslPS0xfnBwCTm0Di+LS685wLUdzkrdRpgDuAY4fYRy9u
         oOvgx6SxFpKEVNpWF6F/CEzqxrILqE4YGI8Q7eja1R1vZcxZWnuCnwcf2kCXkhseCcBm
         je5HsizTCdoFD+ieFvVE6hphz9GQptSQrZPCrxt1IP9B8olYxML5ynPJvWiWVeEFNTBQ
         xOtMRAOwTHR+1jY2ed7t3IjoYjvpHrXCeQalXjNTP0lV3hWx4nIRadHiUC/ja0H/s3Sy
         4pIInU9LibSylvmOzrdUhHeENqxvqPANs/jtPxqlfuglNTjgqw57yHyuKTZn3yZ19lyD
         lScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781238850; x=1781843650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cAsp3VpEafJ9cxB3mLI79s5LcZsAYgH/J7dK9sn4380=;
        b=rVoF0BjtT/BmcDnp0K+IViVhgXO2nJHguv/NSOhEFoEIZlslH9rJ6wRPONfyIgnj2f
         SjhZTLjgWVkIxtzxQsza0qZ4qM38kWNFwDdDttyioEvkstV8LQCbFSoKw9WPR6tJtVjp
         7e9ZmvEjeW5LEEbe8IhD9N81LwAzZTyG7DOeMX6Qkf9afDv7i+Z5Z2H0Xndgx1Tm2KDT
         EO6KN8Of5Q4btGe9sSJQJQ8ss+QtqAD4Q/IuxzZriwQHhl+rM36UDDP2GcTs7tqm+6ge
         Pih2Bt6Mn5oCLTNOY2xlWIiZhvhDtecO2DPg8KMK5I0HYDJdv3Ky/cFtcXPDtuzc/uvi
         LXPA==
X-Forwarded-Encrypted: i=1; AFNElJ+Fvr+8iYHtyHicwE6UjRnc7t5jk26Tut4jplhXTpbgn67V01X4SSfskCbDLQDbygheyTYUF1IgsN2qrPSGR6Qk@lists.infradead.org
X-Gm-Message-State: AOJu0YxZCDrGkNQyCWi6p2cv9TmCmHX7DnLzmKMntc86au0192knPj05
	8VXtVzrUzzgAyieEzW8QuSIrK2erWRdBXdXRbB2bGJV3vOVDLwRXo3oqHZV5SPfg54o=
X-Gm-Gg: Acq92OE4230UgK6UaYdiXcE809+fDuRhn3C8cor8YiRklJs2qJO5WT7V6GJcLmeXx1G
	H+vJ4qrO2VrH2tfy4OMAPcLsrot4PHpu+q7X5Dr6U6cJnr/fFwNo0NqOcJTjb9Fogt2ORJhHvGS
	E54lokWRPU033EHTHyl2e8W62d0irExNGaSOGu7Fo9bvmdZXSPpB4n/311mlJ/kHrx9Ry2/e9fv
	IubMz0UUtOilFLaz/EE+1I31fDk7gkevRQasO2QxUPPeR3/+RSqxZ/LIwLP9KnEqDI7EY+xW+DN
	YG119AvrLnXMOuXqWTzPgSSV55D42wn+CuNKHIo58F3zkv5v1zPv+xb4sAKgGJfrDBSvO4XQ1O7
	a/bWMuYtnIyjaOnnQlC+1jo2jJJhK9XG8BCHq+Im9GH4qvddy5GK87E/fPBNlyAwmPksbMSiNYl
	kh2k1Rs/jYd1Oy6/5ctMCtIy/VEjbK+gauTCV73ddlHkOFgctLRsWWumjpvr3NGfKNu0hcaiCJZ
	To0PkA859jmqj5bU7cPRwAOYIY=
X-Received: by 2002:a05:600c:c107:b0:490:e106:4fd1 with SMTP id 5b1f17b1804b1-490ec50a95fmr8737825e9.34.1781238849975;
        Thu, 11 Jun 2026 21:34:09 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea83da91sm36134865e9.10.2026.06.11.21.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 21:34:09 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 12 Jun 2026 05:34:01 +0100
Subject: [PATCH 1/2] firmware: samsung: acpm: add fire-and-forget xfer
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-acpm-fast-xfer-v1-1-1aa6cd2268ba@linaro.org>
References: <20260612-acpm-fast-xfer-v1-0-1aa6cd2268ba@linaro.org>
In-Reply-To: <20260612-acpm-fast-xfer-v1-0-1aa6cd2268ba@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_213412_033838_96E29F96 
X-CRM114-Status: GOOD (  26.05  )
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

The current ACPM IPC protocol relies on synchronous polling
(acpm_dequeue_by_polling) to process mailbox responses.
For CPU DVFS, cpufreqs schedutil governor requires ->fast_switch() to
execute in an atomic context. Waiting for firmware acknowledgments
in a loop in such case also using udelay(20) under spinlock doesn't
make a lot of sense. Experiemnts on Exynos850 showed that even with
removed udelay() or with it significantly decreased, the firmware
processing takes 15us...250us.

Introduce acpm_do_xfer_fast(), which implements a fire-and-forget
asynchronous path:
 - utilizes spin_trylock() to exit without sleeping if the channel
   is busy;
 - adds/sends the message and kicks the mailbox doorbell;
 - exits immediately, allowing fast_switch to complete quickly.

To prevent the unread asynchronous responses from permanently exhausting
the 63-slot sequence ring buffer, implement an acpm_drain_stale_rx().
This drains the RX queue during the fast path:
 - copies payloads and sets completion flags for sleeping
   synchronous users;
 - explicitly acks 'is_async' messages.

Hooks it up in the right places of ACPM dvfs machinery.

The channels {tx,rx}_lock needs probably a bit of rework to
differentiate between channels that support or need fast xfer and
those that do not.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  14 ++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |   3 +
 drivers/firmware/samsung/exynos-acpm.c             | 142 +++++++++++++++++++--
 drivers/firmware/samsung/exynos-acpm.h             |   3 +
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |   2 +
 5 files changed, 154 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index 7266312ef5a6..5411aa121b73 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -43,6 +43,20 @@ int acpm_dvfs_set_rate(struct acpm_handle *handle,
 	return acpm_do_xfer(handle, &xfer);
 }
 
+int acpm_dvfs_set_rate_fast(struct acpm_handle *handle,
+			    unsigned int acpm_chan_id, unsigned int clk_id,
+			    unsigned long rate)
+{
+	struct acpm_xfer xfer = {0};
+	u32 cmd[4];
+
+	acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
+
+	return acpm_do_xfer_fast(handle, &xfer);
+}
+
+
 static void acpm_dvfs_init_get_rate_cmd(u32 cmd[4], unsigned int clk_id)
 {
 	cmd[0] = FIELD_PREP(ACPM_DVFS_ID, clk_id);
diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.h b/drivers/firmware/samsung/exynos-acpm-dvfs.h
index b37b15426102..107d9aa27690 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.h
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.h
@@ -14,6 +14,9 @@ struct acpm_handle;
 int acpm_dvfs_set_rate(struct acpm_handle *handle,
 		       unsigned int acpm_chan_id, unsigned int id,
 		       unsigned long rate);
+int acpm_dvfs_set_rate_fast(struct acpm_handle *handle,
+			    unsigned int acpm_chan_id, unsigned int id,
+			    unsigned long rate);
 unsigned long acpm_dvfs_get_rate(struct acpm_handle *handle,
 				 unsigned int acpm_chan_id,
 				 unsigned int clk_id);
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 942a2e9f02f5..3caab47adf26 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -20,13 +20,13 @@
 #include <linux/mailbox/exynos-message.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/math.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
 #include "exynos-acpm.h"
@@ -109,12 +109,16 @@ struct acpm_queue {
  * @rxcnt:	expected length of the response in 32-bit words.
  * @completed:	flag indicating if the firmware response has been fully
  *		processed.
+ * @is_async:	For fire-and-forget xfer. Set to true to just ack
+ *		responses without processing.
+ *		By default, set to false for regular senders.
  */
 struct acpm_rx_data {
 	u32 *cmd __counted_by_ptr(cmdcnt);
 	size_t cmdcnt;
 	size_t rxcnt;
 	bool completed;
+	bool is_async;
 };
 
 #define ACPM_SEQNUM_MAX    64
@@ -148,8 +152,8 @@ struct acpm_chan {
 	struct acpm_info *acpm;
 	struct acpm_queue tx;
 	struct acpm_queue rx;
-	struct mutex tx_lock;
-	struct mutex rx_lock;
+	spinlock_t tx_lock;
+	spinlock_t rx_lock;
 
 	unsigned int qlen;
 	unsigned int mlen;
@@ -232,7 +236,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer,
 
 	*native_match = false;
 
-	guard(mutex)(&achan->rx_lock);
+	guard(spinlock)(&achan->rx_lock);
 
 	rx_front = readl(achan->rx.front);
 	i = readl(achan->rx.rear);
@@ -297,6 +301,9 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer,
 				*native_match = true;
 		}
 
+		if (rx_data->is_async)
+			clear_bit_unlock(seqnum, achan->bitmap_seqnum);
+
 		i = (i + 1) % achan->qlen;
 	} while (i != rx_front);
 
@@ -306,6 +313,57 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer,
 	return 0;
 }
 
+static void acpm_drain_stale_rx(struct acpm_chan *achan)
+{
+	u32 rx_front, seqnum, rx_seqnum;
+	const void __iomem *base = achan->rx.base;
+	struct acpm_rx_data *rx_data;
+	u32 i, val, mlen = achan->mlen;
+
+	if (!spin_trylock(&achan->rx_lock))
+		return;
+
+	rx_front = readl(achan->rx.front);
+	i = readl(achan->rx.rear);
+
+	/* Get out quick if we nothing to process */
+	if (i == rx_front) {
+		spin_unlock(&achan->rx_lock);
+		return;
+	}
+
+	do {
+		val = readl(base + mlen * i);
+		rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, val);
+
+		if (rx_seqnum) {
+			seqnum = rx_seqnum - 1;
+			rx_data = &achan->rx_data[seqnum];
+
+			if (rx_data->rxcnt)
+				__ioread32_copy(rx_data->cmd, base + mlen * i, rx_data->rxcnt);
+
+			/* Signal the waiting thread (if any). If it hasn't started
+			 * spinning yet, it will see this instantly when it does. */
+			smp_store_release(&rx_data->completed, true);
+
+			/* Only free the sequence number if it belongs to an
+			 * async request. Senders who use regular acpm_do_xfer()
+			 * will free their own sequence numbers in
+			 * acpm_dequeue_by_polling().
+			 */
+			if (rx_data->is_async)
+				clear_bit_unlock(seqnum, achan->bitmap_seqnum);
+		}
+
+		i = (i + 1) % achan->qlen;
+	} while (i != rx_front);
+
+	writel(rx_front, achan->rx.rear);
+
+	spin_unlock(&achan->rx_lock);
+}
+
 /**
  * acpm_dequeue_by_polling() - RX dequeue by polling.
  * @achan:	ACPM channel info.
@@ -388,15 +446,15 @@ static int acpm_wait_for_queue_slots(struct acpm_chan *achan, u32 next_tx_front)
 }
 
 /**
- * acpm_prepare_xfer() - prepare a transfer before writing the message to the
+ * __acpm_prepare_xfer() - prepare a transfer before writing the message to the
  * TX queue.
  * @achan:	ACPM channel info.
  * @xfer:	reference to the transfer being prepared.
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int acpm_prepare_xfer(struct acpm_chan *achan,
-			     const struct acpm_xfer *xfer)
+static int __acpm_prepare_xfer(struct acpm_chan *achan,
+			       const struct acpm_xfer *xfer, bool is_async)
 {
 	struct acpm_rx_data *rx_data;
 	u32 *txd = (u32 *)xfer->txd;
@@ -429,6 +487,7 @@ static int acpm_prepare_xfer(struct acpm_chan *achan,
 	/* Clear data for upcoming responses */
 	rx_data = &achan->rx_data[bit];
 	rx_data->completed = false;
+	rx_data->is_async = is_async;
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->cmdcnt);
 	/* zero means no response expected */
 	rx_data->rxcnt = xfer->rxcnt;
@@ -436,6 +495,12 @@ static int acpm_prepare_xfer(struct acpm_chan *achan,
 	return 0;
 }
 
+static int acpm_prepare_xfer(struct acpm_chan *achan,
+			     const struct acpm_xfer *xfer)
+{
+	return __acpm_prepare_xfer(achan, xfer, false);
+}
+
 /**
  * acpm_wait_for_message_response - an helper to group all possible ways of
  * waiting for a synchronous message response.
@@ -452,6 +517,62 @@ static int acpm_wait_for_message_response(struct acpm_chan *achan,
 	return acpm_dequeue_by_polling(achan, xfer);
 }
 
+int acpm_do_xfer_fast(struct acpm_handle *handle, const struct acpm_xfer *xfer)
+{
+	struct acpm_info *acpm = handle_to_acpm_info(handle);
+	struct exynos_mbox_msg msg;
+	struct acpm_chan *achan;
+	u32 idx, tx_front;
+	int ret;
+
+	if (xfer->acpm_chan_id >= acpm->num_chans)
+		return -EINVAL;
+
+	achan = &acpm->chans[xfer->acpm_chan_id];
+
+	msg.chan_id = xfer->acpm_chan_id;
+	msg.chan_type = EXYNOS_MBOX_CHAN_TYPE_DOORBELL;
+
+	/* Ideally should be a raw_spin_trylock.
+	 * If we can't get it immediately, then give up.
+	 */
+	if (!spin_trylock(&achan->tx_lock))
+		return -EBUSY;
+
+	/* clean up/ack previous responses */
+	acpm_drain_stale_rx(achan);
+
+	tx_front = readl(achan->tx.front);
+	idx = (tx_front + 1) % achan->qlen;
+
+	if (idx == readl(achan->tx.rear)) {
+		/* stalled; queue is full? */
+		spin_unlock(&achan->tx_lock);
+		return -EBUSY;
+	}
+
+	ret = __acpm_prepare_xfer(achan, xfer, true);
+	if (ret) {
+		spin_unlock(&achan->tx_lock);
+		return ret;
+	}
+
+	__iowrite32_copy(achan->tx.base + achan->mlen * tx_front,
+			 xfer->txd, xfer->txcnt);
+
+	/* advance TX front */
+	writel(idx, achan->tx.front);
+
+	/* ring the doorbell */
+	ret = mbox_send_message(achan->chan, (void *)&msg);
+	if (ret >= 0)
+		mbox_client_txdone(achan->chan, 0);
+
+	spin_unlock(&achan->tx_lock);
+
+	return ret < 0 ? ret : 0;
+}
+
 /**
  * acpm_do_xfer() - do one transfer.
  * @handle:	pointer to the acpm handle.
@@ -485,7 +606,7 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
 	msg.chan_id = xfer->acpm_chan_id;
 	msg.chan_type = EXYNOS_MBOX_CHAN_TYPE_DOORBELL;
 
-	scoped_guard(mutex, &achan->tx_lock) {
+	scoped_guard(spinlock, &achan->tx_lock) {
 		tx_front = readl(achan->tx.front);
 		idx = (tx_front + 1) % achan->qlen;
 
@@ -654,8 +775,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
 		if (ret)
 			return ret;
 
-		mutex_init(&achan->rx_lock);
-		mutex_init(&achan->tx_lock);
+		spin_lock_init(&achan->rx_lock);
+		spin_lock_init(&achan->tx_lock);
 
 		cl->dev = dev;
 
@@ -675,6 +796,7 @@ static void acpm_clk_pdev_unregister(void *data)
 static const struct acpm_ops exynos_acpm_driver_ops = {
 	.dvfs = {
 		.set_rate = acpm_dvfs_set_rate,
+		.set_rate_fast = acpm_dvfs_set_rate_fast,
 		.get_rate = acpm_dvfs_get_rate,
 	},
 
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
index 708f6b0102ac..210709326a1f 100644
--- a/drivers/firmware/samsung/exynos-acpm.h
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -22,4 +22,7 @@ void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
 int acpm_do_xfer(struct acpm_handle *handle,
 		 const struct acpm_xfer *xfer);
 
+int acpm_do_xfer_fast(struct acpm_handle *handle,
+		      const struct acpm_xfer *xfer);
+
 #endif /* __EXYNOS_ACPM_H__ */
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index c6b35c0ff300..93c9b20517f8 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -16,6 +16,8 @@ struct device_node;
 struct acpm_dvfs_ops {
 	int (*set_rate)(struct acpm_handle *handle, unsigned int acpm_chan_id,
 			unsigned int clk_id, unsigned long rate);
+	int (*set_rate_fast)(struct acpm_handle *handle, unsigned int acpm_chan_id,
+			     unsigned int clk_id, unsigned long rate);
 	unsigned long (*get_rate)(struct acpm_handle *handle,
 				  unsigned int acpm_chan_id,
 				  unsigned int clk_id);

-- 
2.51.0


