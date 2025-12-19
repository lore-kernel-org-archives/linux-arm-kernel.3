Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72000D767EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 11:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H3slMuAc0DlPsqmSXZpbwpx526MvEmle/4DotqrbAZE=; b=JJqBDHl4JntO5Hge73sU4QehT+
	zPkfVBBefVEpwfFy82HS8sdo/EJaN1TAj0xNw3v71MadvCrCwO/TlytTBQGpt7/yzj0ziuAZbUboX
	KQgwZfLaSsutNm7vC09Y96JQbf+QU61inmOWVoAK9lh9HVTYLboj1iW2CnQvgn8B8sgJa9/SjqaOi
	j5wHXXBHKqfdIQaCcWoHRdRchkVP+OkQnUtMFk0Xug2MjpftZQ9iPJLEWTochT+sv29Ujs9K+0++V
	HSVsLi1rFSlQf5fX4/ZCn5wCovNoTbtt/LN1zImWRba+kb5+SXnPdyjEIWl51jQuwdFrCcjvSjJSJ
	p0mTpa4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYwE-0000000AEN2-0v1Y;
	Fri, 19 Dec 2025 11:46:26 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYwB-0000000AELm-3lBr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 11:46:25 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-596ba05aaecso1683415e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 03:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766144781; x=1766749581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H3slMuAc0DlPsqmSXZpbwpx526MvEmle/4DotqrbAZE=;
        b=dsWUZ4qhcmxxMagZdrVd6blD7eoQiwSj3nM82FLJRN8CSJWpww7848rQNq3uiNIbW/
         P5Y4QhjPWpV7+Tv3rZg1sc8KpMzjfsZs0Z244jsdGVK4DKOG6oM3Kip0rKTAoLlrCNfT
         8UKtHmlM8XJletCJBfxeNiQslZmfON1A1Fqa7kSG3Nk/GWJqBecgLoWe2MOZBetU+E0a
         EeABbkLXaF3oHjYk8/4RiMNGqsKWZfsBN30ciFIY6o28adKgDnL4T3vRKmiOxRP9KdeD
         6GaUvu0xWZ5Zg+0rpaIZJzjUiPcShTxNjVurq+VChWCL+QQD0n6xCOQp8LtTKbjvmiTm
         F5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144781; x=1766749581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3slMuAc0DlPsqmSXZpbwpx526MvEmle/4DotqrbAZE=;
        b=qAtLbSvvyp199AZVstgMZmyhg7jBGFqvk5ydup8alwwyNiJP0HaaCaAeoMAihPsNKt
         Lut+Y/An2aCzvPQUuM5AeikRN77djVqPvV/9hh3tqCj2AfyeusxxWsaBOoP8VurzLgy+
         zrZvLFVluJBjGQvVdKNlXw0M4THHFHqZ1hN38+T1SoJSShKuGv6pfxry72J05TKgsg+8
         a4UtsQ5lT0wKr86Qo22ena9b4c3p57+xzU3JS3TSCUI3sNpBCdWJPJvhNtYiJO6a+yYK
         e0jDE6NPYTuaZYkzZgY4Ba8ioQOU0UhzkHzIu5pdha25lCNSX20II0RQZ8xPot6bIDJC
         L02w==
X-Forwarded-Encrypted: i=1; AJvYcCX4JtarVVqH6U3tWTVnsj6vOs1fv9KPSPV43C8ohwyQLHwEsv4ab+kK3KmlrNbxO0nxJNOZsm04phpbhJIp+p8S@lists.infradead.org
X-Gm-Message-State: AOJu0YzsB987Yn5+U0NsWtPzVIeC2eOU6OsV8evjhfOnyDQKNW30SDE1
	fk6X1vxLwvvTKlQvFEtAuC/+sjDvin+SCN/ONrZttTquBKuGmCY7bb4I
X-Gm-Gg: AY/fxX5NqBJijF8RAncUhN+bOWr+PR8c2DhUmIcCMGZ6bbbKWBcrcPli5cMAg+jW4DH
	x5SK0mrf5bRR8QkN3OpJNixoHcRBnnnT5W+N1boWLiIdmL/LreDlE/uCMPDn2zPFnnNgp4S60Ym
	QSSKzTwuHpuQmh9gahfWvKFkcaG2beXjK1G1/UghRznWJbWgDqrMJakMr2zCDhDIrr+3FvEIQNM
	TcynqSqODekwseo3BFh7YsLXH6R6VXcfAk+Td5+TVnJ97+UWAb4x8telf8TW9jsAFJpsfO/etED
	pAfokZ3RPjk35eiDVe1vk7QMb8+4S9ool2k1xrUi3zEw3RgYcs8ly9Hgl50BkcVn0xdoWzLWein
	KylGCss+9MuSWi831yf/PDys7olfqXD9A+GhUTnkVmh87Q//j7Kg3jOKt0a0q2or0/weSY0VXVm
	+IB/TXxs4SXTwXaZoVfEE/LXhPq0g=
X-Google-Smtp-Source: AGHT+IE2dzwhnzenN7c5SQt80XIPrIwa3arfO8FHTkl1HzzGSCjhijUW2HFHsyB+YFJIWZnI0YzRVg==
X-Received: by 2002:a05:6512:3b86:b0:598:f283:e12f with SMTP id 2adb3069b0e04-59a17d08b96mr1129675e87.11.1766144780522;
        Fri, 19 Dec 2025 03:46:20 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5ff5sm633651e87.6.2025.12.19.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:46:20 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: Fix raw mode async completion race
Date: Fri, 19 Dec 2025 14:46:16 +0300
Message-ID: <20251219114617.2057576-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_034623_983497_94266338 
X-CRM114-Status: GOOD (  16.08  )
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

A race condition exists in scmi_xfer_raw_worker() where async_done
completion can be accessed after being nullified by
scmi_xfer_raw_waiter_put() in scmi_handle_response(). This happens
because the worker skips wait_for_completion_timeout() when ret has
an error value and goes directly to nullify the async_done.

Fix by waiting for async_done unconditionally when it exists, without
checking the result of the ret variable. This ensures the worker
always synchronizes properly with the scmi_handle_response()'s complete
for async_done.

Fixes: 3c3d818a9317a ("firmware: arm_scmi: Add core raw transmission support")
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hello maintainers and reviewers,

This patch fixes a race condition in the SCMI raw mode implementation
that can lead to kernel crashes when handling asynchronous delayed
responses.

I temporarily added the trace_printk("%s\n", __func__) to track the problem.

# mount -t tracefs nodev /sys/kernel/tracing
# mount -t debugfs debugfs /sys/kernel/debug
# cd /sys/kernel/debug/tracing
# echo 1 > options/trace_printk
# echo 1 > tracing_on

Doing that until Oops
# echo -e -n 'sorry, but NDA raw msg' > /sys/kernel/debug/scmi/0/raw/message_async 

Without the changes:
[   19.513750] Unable to handle kernel NULL pointer dereference at virtual address NDA
[   19.524756] Oops [#1]
[   19.527034] Modules linked in:
[   19.530097] CPU: 0 UID: 0 PID: 124 Comm: irq/12-1e200000 Not tainted 6.12.0-NDA
...
[   19.638262] [<ffffffff8007af3c>] do_raw_spin_lock+0xa/0x10a
[   19.643843] [<ffffffff80b4e42e>] _raw_spin_lock_irqsave+0x20/0x2c
[   19.649941] [<ffffffff80072dc4>] complete+0x1e/0x76
[   19.654826] [<ffffffff808056bc>] scmi_rx_callback+0x66e/0x7cc
[   19.660589] [<ffffffff80800204>] transport_rx_callback+0x4e/0x56
[   19.666534] [<ffffffff8082f664>] mbox_chan_received_data+0x10/0x1a
[   19.672730] [<ffffffff80830624>] transport_chan_do_rx+0xea/0x136
[   19.678311] [<ffffffff808306c6>] transport_mbox_threaded_isr+0x42/0x9c
[   19.684408] [<ffffffff8008e8ee>] irq_thread_fn+0x1a/0x5a
[   19.689733] [<ffffffff8008e724>] irq_thread+0x16c/0x20a
[   19.694962] [<ffffffff80044032>] kthread+0xda/0xf6
[   19.699761] [<ffffffff80b4f8d6>] ret_from_fork+0xe/0x18
[   19.712403] ---[ end trace 0000000000000000 ]---

With the changes: we dont have the Oops

# echo 0 > tracing_on
# cat trace

Without the changes:
 irq/12-1e200000-120     [000] .....    23.368262: scmi_rx_callback: scmi_handle_response 
   kworker/u45:0-95      [003] .....    23.394836: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    25.625926: scmi_rx_callback: scmi_handle_response 
   kworker/u44:0-94      [002] .....    25.653884: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    27.202031: scmi_rx_callback: scmi_handle_response 
   kworker/u45:0-95      [001] .....    27.228216: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    28.504546: scmi_rx_callback: scmi_handle_response 
   kworker/u45:0-95      [002] .....    28.531534: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    30.102729: scmi_rx_callback: scmi_handle_response 
   kworker/u44:0-94      [003] .....    30.129688: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    31.108407: scmi_rx_callback: scmi_handle_response 
   kworker/u44:0-94      [003] .....    31.136012: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    32.388953: scmi_rx_callback: scmi_handle_response 
   kworker/u44:0-94      [003] .....    32.415700: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    33.737014: scmi_rx_callback: scmi_handle_response 
   kworker/u44:0-94      [002] .....    33.764977: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
 irq/12-1e200000-120     [000] .....    34.979096: scmi_rx_callback: scmi_handle_response 
   kworker/u45:0-95      [002] .....    35.005377: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put 
   kworker/u45:0-95      [003] .....    36.758043: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put <- RC
 irq/12-1e200000-119     [000] .....    37.561734: scmi_rx_callback: scmi_handle_response 

Withthe changes:
irq/12-1e200000-120     [000] .....    23.368262: scmi_rx_callback: scmi_handle_response
   kworker/u45:0-95      [003] .....    23.394836: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    25.625926: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [002] .....    25.653884: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    27.202031: scmi_rx_callback: scmi_handle_response
   kworker/u45:0-95      [001] .....    27.228216: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    28.504546: scmi_rx_callback: scmi_handle_response
   kworker/u45:0-95      [002] .....    28.531534: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    30.102729: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [003] .....    30.129688: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    31.108407: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [003] .....    31.136012: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    32.388953: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [003] .....    32.415700: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    33.737014: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [002] .....    33.764977: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    34.979096: scmi_rx_callback: scmi_handle_response
   kworker/u45:0-95      [002] .....    35.005377: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    36.028136: scmi_rx_callback: scmi_handle_response
   kworker/u45:0-95      [003] .....    36.055553: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    36.906953: scmi_rx_callback: scmi_handle_response
   kworker/u45:0-95      [002] .....    36.933304: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    37.548706: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [003] .....    37.577260: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    38.079993: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [002] .....    38.108648: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
 irq/12-1e200000-120     [000] .....    38.512822: scmi_rx_callback: scmi_handle_response
   kworker/u44:0-94      [002] .....    38.540403: scmi_xfer_raw_waiter_put: scmi_xfer_raw_waiter_put
   ...

--
Regards,
Artem

 drivers/firmware/arm_scmi/raw_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 73db5492ab44..362773f3114d 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -479,7 +479,7 @@ static void scmi_xfer_raw_worker(struct work_struct *work)
 				    ret, scmi_inflight_count(raw->handle));
 
 		/* Wait also for an async delayed response if needed */
-		if (!ret && xfer->async_done) {
+		if (xfer->async_done) {
 			unsigned long tmo = msecs_to_jiffies(SCMI_MAX_RESPONSE_TIMEOUT);
 
 			if (!wait_for_completion_timeout(xfer->async_done, tmo))
-- 
2.43.0


