Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AA5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3R4Jhe3KgMdcHWwBtGAqNwkL06pjGhdfYrGLYcX0qU=; b=0kaG6bhd8pl92rYj/2Q/ec9DKs
	oxF9OQkzgaAhplsY+5XdQcxFIeDS9UL7T2I2lNvSrOI4WW6fBgU0NPZ9RUnMu4ZjQLSXgrjrnqN1r
	M0IIno102GEHzwps9SvGv+qs++ShOyo4Ck16MHsjZ1SagkddtyjxmvcGIi6C9Hb40Vh1NZWtaqplo
	rLy3K9b0PUJz3yAfYp1DdPJS+MWPbUaQ3pJDLeqcJOqv0Ysurzbyxf7FAjwO+t5XWAz4LK2Eq6jxJ
	TWdnk5pxEEYDiiCeM6l2ec+MMwHSRmLEzvtrCse8LOr3h5qtqunB3FsxCOLmetar0cxmB6d8EADVU
	ABM4Et3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdd0-000000055gT-0Rvk;
	Fri, 20 Dec 2024 14:05:18 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdOG-0000000535B-0Olt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:50:05 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so1333275f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 05:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734702602; x=1735307402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3R4Jhe3KgMdcHWwBtGAqNwkL06pjGhdfYrGLYcX0qU=;
        b=lT0ASPbtGa8hpRb0qZ9PkwCWG1TaMHfAy7O14pUSydjew5TMtVyqrdYvmlVaL0/Myl
         LgnnL9ENgc5LDZcPjKt7+3tAnKe5jAq7UOn0K3BOT3RhP51zGio7hO1QJzHO36XiP5GS
         eWvRbDaDB7TyKipPC2tcVP98y6S1c3e+6EcHgStwgQLstx4JgmracLXiGXhpZMBk+BAz
         b1wzv9Z+N7rcVkzNF8M/2tRiVSBqbyD6KgyD4DUYXoZQDEP6j2tMGlOT103GXvYyt6rk
         wWWSBstl9oJpxyHi1hEAzzNx2zjOqq4NGK7dvDSIHWY2zOB5zI1xou7G6Ax2by/GFvqp
         ibNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702602; x=1735307402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3R4Jhe3KgMdcHWwBtGAqNwkL06pjGhdfYrGLYcX0qU=;
        b=lIZjaHjbsLQP3n08K3x+Jjhxljr4dYX0LcwvxAwaSdwS8KopAv5UTTlIDtHjT9JBBS
         KRCvSaPXWu4uUBHY02Zyrg+tBebUsFhCfBbl2Q/e6cxOVV5wy0GsRJFpIMvNHCwGP618
         sqioUGQzij1Q0Cl8NECii5E4uHxmDOUSbVmJ5Mwy2dqFU2HpoPBkAI9ekqD5pTd/S5Hq
         w9dikK3SiN9ls0N12SGFahmp/Eg6WoOqlapIv/oyg7LFqTTMw7btb+dru83ADbxLJ6zb
         WQ7IRVh8NinI55c+HPAGxpuNkG1CkNzHDTtl8FWnTfiq9emoUMfVbErCTs2QrmNt3jh6
         eMjA==
X-Forwarded-Encrypted: i=1; AJvYcCWRxRrOTu3ZTJa9UjB/PejLtJT4IyeRxyCoMCOFK78QtPadfpIOaQQtY1487+wyV2lXrzd37QEogtIzx1YL7ASK@lists.infradead.org
X-Gm-Message-State: AOJu0YyQB5pTGC6oKV4EyfbpcZljsAU/vWdk/bkzBCplZtfTQl87muo5
	NnoxeGRsghVMjTJvKmJE14V4GAuCCrkJrtjiO/RwwotGM2iPoxhr2OXzzF1ytvc=
X-Gm-Gg: ASbGncsjda5okdl5/+jJ2zb6LH4tmQlt8xJBHyrPIJslFyEKBElxZy4gbqD7+YK5zY+
	yKvAOcKuYikIpBUkUhdzMuAEzIWvH9PDtNnouC/bV0gsbutML6ML37cq4y1ALSrAiuyErb5xaR6
	GeFxw8w2yHn7k3G2NRTV7LS0p6pbBa6SytznYwvtd7b8BFAYZceVxMyKSgmAe8RoZJqdM1VrS7B
	Yu1HxV5aHCL37KSIIyF4Y/SKC9bFI/SM3KtC3bykcuhKv/UgOi2XTXtlhcX55DZg0NehKGTPtNl
	WY2PQHM9YqSsSfDRZlm27sCV95RDP4Dt7ayP
X-Google-Smtp-Source: AGHT+IFO4m1UMUWH98xI6WEcrXsCmyinFas11MjCCiL6zLrmfdc5i7QkqHRJkTCA4ukd1H0E1zdRFw==
X-Received: by 2002:a05:6000:1785:b0:386:3c93:70ff with SMTP id ffacd0b85a97d-38a1a1fdd35mr6675772f8f.8.1734702602133;
        Fri, 20 Dec 2024 05:50:02 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e74sm4044313f8f.30.2024.12.20.05.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 05:50:01 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 13:49:58 +0000
Subject: [PATCH v6 3/5] mailbox: add support for clients to request
 channels by args
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-acpm-v4-upstream-mbox-v6-3-a6942806e52a@linaro.org>
References: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
In-Reply-To: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734702598; l=5904;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=yyB5CQGhVmNL0L7BcpLJ32JRUO4zLOTRcjHSgygE7Ik=;
 b=vsmN1tUctzs2mQxUDHpQYFZZw2uQY7/lH7aU0MJkG/FL5nc9qKT2nTT5HYlqjC6BnhqU8Jipu
 zaGST/SqFPyALdMnBZnXEks6QaRLLJw/KxnPYpoXUa0ql5fqZ+5W8/P
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_055004_158845_12BB581D 
X-CRM114-Status: GOOD (  21.63  )
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

It works by supplying the usual client pointer as the first argument,
the usual index of the mailbox specifier in the 'mboxes' property as
a second argument, and a pointer to a 'const struct mbox_xlate_args'
as a third. The newly introduced struct is modeled after
'struct of_phandle_args'. The API identifies the controller's device
node, and then calls that controller's xlate() method that will return
a pointer to a mbox_chan or a ERR_PTR. The binding between the channel
and the client is done in the typical way.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mailbox/mailbox.c          | 60 ++++++++++++++++++++++++++++++++++++++
 include/linux/mailbox.h            | 17 +++++++++++
 include/linux/mailbox_client.h     |  3 ++
 include/linux/mailbox_controller.h |  4 +++
 4 files changed, 84 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index d3d26a2c9895..0eecffd5a2ad 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -467,6 +467,66 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 }
 EXPORT_SYMBOL_GPL(mbox_request_channel_byname);
 
+/**
+ * mbox_request_channel_by_args - request a mailbox channel using client's
+ * channel identifiers.
+ * @cl: identity of the client requesting the channel.
+ * @index: index of mailbox specifier in 'mboxes' property.
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
+			int index, const struct mbox_xlate_args *mbox_spec)
+{
+	struct of_phandle_args of_args;
+	struct device *dev = cl->dev;
+	struct mbox_controller *mbox;
+	struct mbox_chan *chan;
+	int ret;
+
+	if (!dev || !dev->of_node) {
+		pr_debug("%s: No owner device node\n", __func__);
+		return ERR_PTR(-ENODEV);
+	}
+
+	if (of_parse_phandle_with_args(dev->of_node, "mboxes",
+				       "#mbox-cells", index, &of_args)) {
+		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
+		return ERR_PTR(-ENODEV);
+	}
+
+	mutex_lock(&con_mutex);
+
+	chan = ERR_PTR(-EPROBE_DEFER);
+	list_for_each_entry(mbox, &mbox_cons, node)
+		if (mbox->dev->of_node == of_args.np && mbox->xlate) {
+			chan = mbox->xlate(mbox, mbox_spec);
+			if (!IS_ERR(chan))
+				break;
+		}
+
+	of_node_put(of_args.np);
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
index 734694912ef7..06e2721313ca 100644
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
+			int index, const struct mbox_xlate_args *mbox_spec);
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


