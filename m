Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A58DE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 13:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUOQPXTRe3lg7UV1cQpho3gjLjQwoiMIh3ZBdN3lBVY=; b=1Yyi2D4ISyIO/0P4gyjEoOLWVU
	ktI8R/r8nSPuz152drSq1nRl3B6WsXQe2hACxuavwu4hc9WaCtLzxx9IztA+PhT5rxlPLLuW0Ys30
	u2h8LRFPxJ/UvT49/dy4xIQqrFqboPyimcgoIVNtnMBpI7l+z9F8f7gFPf23uriNarRcU4RYn82yB
	EEnld8qM5C7h5tgxJGlGQkeH8x6l2Fq7uFx7OXCOD2bxN2nR1dA2DMuBeY8lCkecjSJyBtkhXpP0E
	f7/E4YTkv75Vs3MNpLnbORzlx7LXuPcqqCCSHJwc0WVALZter64/Qa2/RYfv3fuwqxPKv3Qp+iJF3
	fdQH3AZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGJB-00000001uPn-3Awk;
	Thu, 19 Dec 2024 13:11:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGFw-00000001toe-1djC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 13:07:57 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-432d86a3085so5331215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 05:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734613674; x=1735218474; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUOQPXTRe3lg7UV1cQpho3gjLjQwoiMIh3ZBdN3lBVY=;
        b=aOPW7j4DrQLUPU4L2LYzfamPi6Xjkc+Xp4bg76acCI+SNf3aLUmcmJpwlp4fKnNJPZ
         iS5xuN9D5+HPwQqD5UbgRRIPkrJ5XzWTG+haOi6FomcHs88r8gVFLGkZ0Z4UPK17mIZu
         8xQEfB0CdHUSFuaDf2eTet2SaHnha5tqbPK/wGsbaGkzI5EKFXytzGte5XNYet2+KPt7
         g/FoYog5MkwnGS32HJ2mys/6Q7tKjNFAvGoi452OFc/oNlpJJlEl6ZusOiAFLLQ3kime
         jxn4PtQAe22Z0M6k8Tk6z/XxQOd1/EHz6OSywg8PgLRrpcJs6KWvZmeCuctr2+uJaUjz
         tvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734613674; x=1735218474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUOQPXTRe3lg7UV1cQpho3gjLjQwoiMIh3ZBdN3lBVY=;
        b=Q7+xIDI7GiLWObK6cjjF9XwdH9jRJewaq664l1lY3rMWVRXSt+HULEOizBuUePLgmr
         cv8S+S7qp2d564WIEgOvxi4Cb+fYxc+j2IZC8KKrwfhFX3gAh+SMnbJPP6Dp5tTd2KG/
         2vaOz37TCJimEAupwpwPUHUiYJOXHzCeO3AN6JNodRYX+pZaOV4ijin63iEwKj8Pjdyz
         ctuG18t9YD74u2CS9uhX4SvWIQShFZbq8zXD46X1h0mefjbNFjzGILUAF2uAXHvRETjD
         woLXHjOZ3wDc/D9JuYuCFCNS9hgSaTahRKE8tbmp/MUwrtGWrv+TciUqs1+KCAwzgbJ3
         XgrA==
X-Forwarded-Encrypted: i=1; AJvYcCUQb0NrGWLDcckN02/qajKkxJRW5RGSCr9sHGGLOrdeAxiOLnC+MNLPcDGy8tthOLsPDrqwPlcKnbRVnof2AoN0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlrb2IVVKmDFaA5pBaNEdK3Oof4pVQzwzBFes9tPyCgYpwcSSU
	+XGoKek1HWMmhQfxaXe+mhJh9D5K4aYC+5k7tBKmk4SgSeGyQK/aSijlC0JJyCs=
X-Gm-Gg: ASbGncvuV95UNORr1YbotDZ7sKKiKDD7M0lL7x0SX05yletmyDWjcR7g3M682ghYeJw
	1bXj3K1E55Cb6pj4E7nqH8EAuk8iu0UoCpqa7Qm2XpA+6TAYJGICHVve+ltBoQ9D1wdprbH61bw
	n7SbFImTR5lzqy5tM/AJ3QxJ8A3l2d8Yicq2gwEhr2ipvHRIsCSNE8EtWELxNpX3eRhTZZDqH3l
	T2iJT79KKTze2pij4nP+IUCbemBzi6BvX8/bYpeKSv7L5Blssyr3nZRqMYwAnrGRCjSfdKf7Ljy
	4LmGQG0MQ4PdhnhzvFP5iW5ypW0lO3Z94wv3
X-Google-Smtp-Source: AGHT+IH7QXzVbmArkNE6kY0mh8UxCymkYvZfRaYwodpZUWknXO1JZt6pMIJoZmzQeGk94zIBsb8bHw==
X-Received: by 2002:a05:600c:350c:b0:436:1c04:aa8e with SMTP id 5b1f17b1804b1-4365c7942b6mr32991725e9.16.1734613674393;
        Thu, 19 Dec 2024 05:07:54 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm17436705e9.6.2024.12.19.05.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 05:07:53 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 19 Dec 2024 13:07:47 +0000
Subject: [PATCH 2/2] mailbox: add support for clients to request channels
 by arguments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-mbox_request_channel_by_args-v1-2-617a6910f842@linaro.org>
References: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
In-Reply-To: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734613671; l=5667;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Q2/Ilfy56ojSZu1+fOIemD2xiXcbZHn9eQaGm8k0miI=;
 b=DjvbKV9+OxuCn/g6zNLfMtnGo0ac9oiSZ61hg9UOxS8u84Deij/SZOVt8RZG/MWpoV+4CNVYI
 JGsGxeG3VrmBjbJEriNyu7OXAB4fQa5a+qF3YVvdcTl7LG3+UQDNJyw
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_050756_435354_54D27DD4 
X-CRM114-Status: GOOD (  22.79  )
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

There are clients that can discover channel identifiers at runtime by
parsing a shared memory for example, as in the ACPM interface's case.

Supply a new framework API: mbox_request_channel_by_args().

It works by supplying the usual client pointer as the first argument and
a pointer to a ``const struct mbox_xlate_args`` as a second. The newly
introduced struct is modeled after ``struct of_phandle_args``. The API
will search the client's node for a ``mbox`` phandle, identify the
controller's device node, and then call that controller's xlate() method
that will return a pointer to a mbox_chan or a ERR_PTR. The binding
between the channel and the client is done in the typical way.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mailbox/mailbox.c          | 57 ++++++++++++++++++++++++++++++++++++++
 include/linux/mailbox.h            | 17 ++++++++++++
 include/linux/mailbox_client.h     |  3 ++
 include/linux/mailbox_controller.h |  4 +++
 4 files changed, 81 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index d3d26a2c9895..07ea32ebab80 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -467,6 +467,63 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 }
 EXPORT_SYMBOL_GPL(mbox_request_channel_byname);
 
+/**
+ * mbox_request_channel_by_args - request a mailbox channel using client's
+ * channel identifiers.
+ * @cl: identity of the client requesting the channel.
+ * @spec: arguments that describe the channel.
+ *
+ * Used by clients that can discover the channel identifiers at runtime (by
+ * parsing a shared memory for example). The description of
+ * mbox_request_channel() applies here as well.
+ *
+ * Return: Pointer to the channel assigned to the client if successful.
+ *         ERR_PTR for request failure.
+ */
+struct mbox_chan *mbox_request_channel_by_args(struct mbox_client *cl,
+					const struct mbox_xlate_args *spec)
+{
+	struct device *dev = cl->dev;
+	struct mbox_controller *mbox;
+	struct device_node *mbox_np;
+	struct mbox_chan *chan;
+	int ret;
+
+	if (!dev || !dev->of_node) {
+		pr_debug("%s: No owner device node\n", __func__);
+		return ERR_PTR(-ENODEV);
+	}
+
+	mbox_np = of_parse_phandle(dev_of_node(dev), "mbox", 0);
+	if (!mbox_np)
+		return ERR_PTR(-ENODEV);
+
+	mutex_lock(&con_mutex);
+
+	chan = ERR_PTR(-EPROBE_DEFER);
+	list_for_each_entry(mbox, &mbox_cons, node)
+		if (mbox->dev->of_node == mbox_np && mbox->xlate) {
+			chan = mbox->xlate(mbox, spec);
+			if (!IS_ERR(chan))
+				break;
+		}
+
+	of_node_put(mbox_np);
+
+	if (IS_ERR(chan)) {
+		mutex_unlock(&con_mutex);
+		return chan;
+	}
+
+	ret = __mbox_bind_client(chan, cl);
+	if (ret)
+		chan = ERR_PTR(ret);
+
+	mutex_unlock(&con_mutex);
+	return chan;
+}
+EXPORT_SYMBOL_GPL(mbox_request_channel_by_args);
+
 /**
  * mbox_free_channel - The client relinquishes control of a mailbox
  *			channel by this call.
diff --git a/include/linux/mailbox.h b/include/linux/mailbox.h
new file mode 100644
index 000000000000..cef88c5ae49d
--- /dev/null
+++ b/include/linux/mailbox.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2024 Linaro Ltd.
+ */
+
+#ifndef __LINUX_MAILBOX_H
+#define __LINUX_MAILBOX_H
+
+#include <linux/types.h>
+
+#define MBOX_XLATE_MAX_ARGS 16
+struct mbox_xlate_args {
+	int args_count;
+	u32 args[MBOX_XLATE_MAX_ARGS];
+};
+
+#endif /* __LINUX_MAILBOX_H */
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index 734694912ef7..a9f4d108c48c 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -9,6 +9,7 @@
 
 #include <linux/of.h>
 #include <linux/device.h>
+#include <linux/mailbox.h>
 
 struct mbox_chan;
 
@@ -41,6 +42,8 @@ int mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl);
 struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 					      const char *name);
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index);
+struct mbox_chan *mbox_request_channel_by_args(struct mbox_client *cl,
+			     const struct mbox_xlate_args *spec);
 int mbox_send_message(struct mbox_chan *chan, void *mssg);
 int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
 void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 6fee33cb52f5..dfddcf966f9f 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -8,6 +8,7 @@
 #include <linux/hrtimer.h>
 #include <linux/device.h>
 #include <linux/completion.h>
+#include <linux/mailbox.h>
 
 struct mbox_chan;
 
@@ -67,6 +68,7 @@ struct mbox_chan_ops {
  * @txpoll_period:	If 'txdone_poll' is in effect, the API polls for
  *			last TX's status after these many millisecs
  * @of_xlate:		Controller driver specific mapping of channel via DT
+ * @xlate:		Controller driver specific mapping of channel
  * @poll_hrt:		API private. hrtimer used to poll for TXDONE on all
  *			channels.
  * @node:		API private. To hook into list of controllers.
@@ -81,6 +83,8 @@ struct mbox_controller {
 	unsigned txpoll_period;
 	struct mbox_chan *(*of_xlate)(struct mbox_controller *mbox,
 				      const struct of_phandle_args *sp);
+	struct mbox_chan *(*xlate)(struct mbox_controller *mbox,
+				   const struct mbox_xlate_args *sp);
 	/* Internal to API */
 	struct hrtimer poll_hrt;
 	spinlock_t poll_hrt_lock;

-- 
2.47.1.613.gc27f4b7a9f-goog


