Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61978C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dprxgYd134ZCbde7II6xEs/NYUu1NZeUWNqjC0nuXDg=; b=4BmWvllryY4ws0wkuaV2fpkQib
	c0vOU4TbGAfc6eMpkxKHLTrsXo0denxfCdtG+lHaIaYGF8Jp8QO6H+Cc3HVUkrj2vQa0pTu3i5lKy
	JFjl1RjoxDvKux3ahQR77wcDuvEibZv+Zt46GCzkSt1PGA+U9F3qaGqmO0j54ywAVbItkPAr1M9V0
	6W1JrDYZgUc0KUJFbpCLdYl6fqiDaaMHcj03wOsm6E7PGC9WoB+jwwB9D3io0BnmEPBNeRPrq6hmZ
	qA0jXVSH1ZMPUJeVAwxi7HdThMrUxBg3sCkcAx7wNzz0XkfEUj2UnvLizreTepf9frjjDUMyDdCkb
	edSeexOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAy3-00000008NF4-1vYo;
	Mon, 13 Jul 2026 07:20:43 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAxx-00000008NC7-1TzI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:20:38 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so2220383e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 00:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783927235; x=1784532035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dprxgYd134ZCbde7II6xEs/NYUu1NZeUWNqjC0nuXDg=;
        b=Ws+KcIb0nAI+qnwfw7O6/PBXRo9+SGCRbyvCguck0lLZAEOTEjqW/oTEZp5tq0C5aE
         U3qarZqa/SerdAB5x+Ivysjlpma9YFfUIMON8/J5Sx0bV4TbH1MsHuVmpxsJCXLh+IEV
         gq8uFzNyL+N9vg/5hqABNK15Sl3e5g48KkELyaONR9UbRmOTnyXct+gk+SZ+6HZJ5NJe
         3ilrBA4Qc3sd0DgsBe07jSilBaWaaJdQatuGrYaLS9e7G6SqCgk5A2OABYJaDhqduLh4
         0NOFbz7dxyQHnfXPKpF3J3uxFVSvmLxe61CWIUN/D7UouX4Z7L7wz/mk0X/k1fadowx1
         ozzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927235; x=1784532035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dprxgYd134ZCbde7II6xEs/NYUu1NZeUWNqjC0nuXDg=;
        b=ObG9Fk4w4zgEC8XaiRoSAZTcMYgCrPU+4Y+sKcSHfzZK5Wzs9FQQBBFIvmbm7C0x5q
         EuXZL9tAzDnCjWNStUotpIsPCmZz1uQaFWZ932EC7njfRh1EyCJ8Or97sKr1eAg2vXFL
         Y+CFVllD797Pg5nU3eJzV7aRvTbL04gEnYMfkyAEJtDr7BdFcJCMzb+ATxlR3WS0KI6g
         ZhHKUKCYKoCNX3Hc6FHMEhqTwFUA9CbrVuDaqrvm/AQfgmHTnFweahUERvubhH5V92KP
         JeqnbVRt2vSJ3ckJ1MvWiQHBeWnE8+h9iPo4rHS2SdNJ3IBPKP9U7GfyxwPRVBCEPKeV
         gj1g==
X-Forwarded-Encrypted: i=1; AHgh+Ro3v2JErBBhUUlPOajyI7ardgFLok2LYJ1+3pWCxUU4OfThBlKCTPhn5kzzBF5bMyQfnXJm1yRWsfgTorFDg8NZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyPz8VDeTY305+IDcA9xEOl5Ib1WoIe3ZEujRvKpfGdAFs2ltJA
	wBzFqK6H8WVj7AeL1dkWk5M5bH2xb3/22av7cEYIZE4XPRzcsEhgY16M
X-Gm-Gg: AfdE7cmz2obRQdXD+9ony156+reF79+ut5dynB4rFTOGSAy+BCCC5RKRPOzGN+PZ0K6
	6Zv5K/jfdewT8ojU65qiHzr5HVZOxIDOgndJVvfMDs56/OTaoRuZ979dw5rWkBLEhXB8zL/yx7P
	/fSUrPYsUnGcw7LDCLS60xEpbJai4ianHgUfTsSly/jgBaNwGMSgB3ur9ZzpEr87uFzr+Ugd7gE
	8BCmGFlf1dSobqA/0QaUd8Uw04a7G51LhzlVIhD4SlnsT1Ot4aGgsYAvEOSrRBSxTj+belpp2fJ
	5iz1r4kDgTSY3WubHOSvrWp70+DBIffmfHrGr/wpZvh3etwnqmlC1dUy6IDV9vhiFU9BMtX3c9Q
	la4tTAHPDWVDXfzdqcfN2f0hJud+ngA2Svgfy2NY9Vy0MYivfP4s7yNau/Igtf+pWldG7W848FE
	DKyKMpqPEVToi6Od9zCuRJmXPfqcbM3zHnkCF4SO5qMN1jDhXoFACb+CWdrl4jmP8IbpJS
X-Received: by 2002:a05:6512:3056:b0:5b1:5142:5c30 with SMTP id 2adb3069b0e04-5b151425dadmr568417e87.4.1783927234912;
        Mon, 13 Jul 2026 00:20:34 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca55723sm2625636e87.35.2026.07.13.00.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:20:34 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 13 Jul 2026 09:19:58 +0200
Subject: [PATCH v11 2/7] i2c: mux: add idle_state property to i2c_mux_core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-i2c-mux-v11-2-72bb8af8ee8c@gmail.com>
References: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
In-Reply-To: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=vnuM7kAv6UZYVTKxBCbKpa+2q5drZUiYDWWf72AF6A4=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqVJG2jUPsQ+B917os5jCn8R16fUEqvn3JkO3eJ
 spLK8xMh2WJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCalSRtgAKCRCIgE5vWV1S
 MtZxD/9ASSOsNq1O1WXCwFDoTWIHuFHmsrumS2i+YzrgmZvlAUXbOxWVxCXxSPHTayTfPpEvrpf
 XSTy7kw3jB5fM7qRPi1N5FOp4MfZh4YVyrKnKtq1LDZP+FG336Mb64Un8vMYxZ2SMBYSQZdJBo6
 j2ERjEtS0MUZT7rxZlBkW8N5+jLfGqGnxhnP+xOwtVNeuM5GYuJ23esdRstjd7sVyA6NJdhM6na
 fHGmFomp3OaWL0V8iWXI7rlg5x1bkNUdwZaje0A5zk/2TI4LsBS4O1oJ5yOQuUORp9CRb8dhTAS
 2/Gsv/laAx0CIPvAAHVlc1kCaCii5MlZDfNmuSqWqEksEijbS9gTwZQIs2mLC7RIxxpgHNf568g
 +fi8BqjFL1F9lAWfw/seqUpC37YdLqQOT71e0AbURBbzGfJAhy0sqlTp3bvDsSQPW45ZS5lzRn6
 QYEMJB5HXcr8nPaHa608aPj+x0rqdsCfeFBPRLHtBW+3rI1s0VawM0iF1hoqCdDgtiskSjnEUyu
 mKVOLHQINzOqudtvzWAiTEn1qbfvd0KcjsPF0jy0pbWkec5CubMb+wgOL8pDq57ChHAiBMdr7GO
 k6Q1D79MPQlDyzAGLVSUe40ypi0CKtUHhYojuOLDOjFTLiNy/uuUPbnSLAnOTgagqgwecOHu5QQ
 tIxxsRjJpi4YDzg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_002037_429580_9D9A49A2 
X-CRM114-Status: GOOD (  13.73  )
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

Muxes treat their channels differently when idle.
Let the mux core have this information to make it available for
internal use.
Reuse the same state values used by CONFIG_MULTIPLEXER.

Possible idle states are:
- MUX_IDLE_AS_IS: Leave channels as is when idle
- MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
- <n>: Enable channel n when idle

Default value is set to MUX_IDLE_AS_IS.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/i2c-mux.c   |  1 +
 include/linux/i2c-mux.h | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 681a201c239b..edf16683dc83 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -247,6 +247,7 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 	muxc->select = select;
 	muxc->deselect = deselect;
 	muxc->max_adapters = max_adapters;
+	muxc->idle_state = MUX_IDLE_AS_IS;
 
 	return muxc;
 }
diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
index 1784ac7afb11..624fadbaa703 100644
--- a/include/linux/i2c-mux.h
+++ b/include/linux/i2c-mux.h
@@ -13,6 +13,7 @@
 
 #ifdef __KERNEL__
 
+#include <dt-bindings/mux/mux.h>
 #include <linux/bitops.h>
 
 struct i2c_mux_core {
@@ -22,6 +23,17 @@ struct i2c_mux_core {
 	unsigned int arbitrator:1;
 	unsigned int gate:1;
 
+	/*
+	 * The mux controller state to use when inactive.
+	 * Possible idle states are:
+	 *  - MUX_IDLE_AS_IS: Leave channels as is when idle
+	 *  - MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
+	 *  - <n>: Enable channel n when idle
+	 *
+	 * Default value is set to MUX_IDLE_AS_IS.
+	 */
+	int idle_state;
+
 	void *priv;
 
 	int (*select)(struct i2c_mux_core *, u32 chan_id);
@@ -38,6 +50,20 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 				   int (*select)(struct i2c_mux_core *, u32),
 				   int (*deselect)(struct i2c_mux_core *, u32));
 
+/*
+ * Mux drivers may only change idle_state, and may only do so
+ * between allocation and registration of the mux controller.
+ */
+static inline void i2c_mux_set_idle_state(struct i2c_mux_core *muxc, int state)
+{
+	muxc->idle_state = state;
+}
+
+static inline int i2c_mux_idle_state(struct i2c_mux_core *muxc)
+{
+	return muxc->idle_state;
+}
+
 /* flags for i2c_mux_alloc */
 #define I2C_MUX_LOCKED     BIT(0)
 #define I2C_MUX_ARBITRATOR BIT(1)

-- 
2.54.0


