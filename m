Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AFEC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 16:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgqqVRk8zgVEKC8aOnJN2NYUg3kMqPomNQlkiSAg/5E=; b=RQgT84MSq5UiAcOtC/070PIm+/
	meHu1yfJtnGNVfn6wX1Scb1SWy0J3/ylnRFyBY+MmiVhcwu3kOKZUNC1cN+VnFyT3xU63KSfjwVI9
	Up0wYvASyikPEkV7gVNt6gZhN+SoPm7MI7Y7bBXk/HwdejGeo9Fyp53bffDvfVLcA3yV/VvFo2jVT
	DCBvW376SAAedn+1TZTeVlde/B4rXHJUDG8ZyOrrQw+/eJGnwgtPT+O7rlTPIU2DLcGLeyAAhrfky
	wF3nhiMlUBObt7ekiQjgaohM7bSskXXbSvHcvOLRvZgDPuG2qTtx3Q+cFEZ+VHbu4SWwFjmuYOBBr
	LzOvQyMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfYX-0000000FZtV-0kKs;
	Fri, 21 Mar 2025 16:49:13 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfQx-0000000FY4J-1DEd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 16:41:24 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac29af3382dso352027066b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 09:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575281; x=1743180081; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgqqVRk8zgVEKC8aOnJN2NYUg3kMqPomNQlkiSAg/5E=;
        b=tx0NYlkvnqniiuw9t4M8wv3OSuEObB4ks7A5S6rW7WGIU5Nd+98I7xnYhGCniexjYP
         RzVeXr77dadxrqffFgWoX3rXkAodT5WVuEw4m6PYTJ5+3EBFNAviatjnGmpA9xhfAJ+o
         YDTjxvffgzzh56se0YcfXAT0LanXM2MD3tIWT3wUeT9cthWft3gLcsJcf8krqBiRAbnh
         Dhb90j/VjZbfffIcoPlGvyir2HOdCRPuIhc3zKqezfXbAWp0kwMuKgtsKwrANggAPfz5
         MiFpxOtpxhWXULC+RHr+7jhBvriVfs07i9Gf4kvl3RJck7BcoZ2BjuCP8eZc3oT8zGcP
         G0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575281; x=1743180081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgqqVRk8zgVEKC8aOnJN2NYUg3kMqPomNQlkiSAg/5E=;
        b=jLxQ0fhFk3lrLqqaBcL6uWjy5w4HBrwIfJNOrX2L4dlUJHXYcSRsaiaUOpp6Pqs3kS
         nNStnmUWcHsrat3nt0BB2727srUgDDNLBtDGoDTiVazdd9GcTFAdQBFaaVlNZX5FESbY
         dEtqo8DK+OnfmMf4QJzSgJGWlPnbfZkIhTmZ/XQfrA2H9KCe2yUFT3w6bxBA+4ZMsoXz
         jsqlfRm7IuUytu1r9AEo8lzdMiThXqCrSp5TIRdx66hjIoglpXeftgm5D/keFYyG3F42
         pf3lccE5Eo4EnbNqgyKb3bnKoq5NukrBVHQzr8HhxHQd+4X0ggT8h+0k6LfJ3fRX3UKA
         z4Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXcqFC2XjooIdCxqpXbHFLLHSUKkLHi3+DfLGrNRNpEwn5EXACYUn1Stt+ZpUuJqlkzpKLB3FlJ9U82bQqJGV8C@lists.infradead.org
X-Gm-Message-State: AOJu0YzuDdYvzlj9njKN+cln4Aa4hclbxzOJFwMYawkoWTtd/OwZoQ+X
	i/sTYcvgxzmLYUKpjdbpy0iW/GKNuvkc1+KG6ucqbZpzrIo2cEahtgVxT9mOt9k=
X-Gm-Gg: ASbGncureZtmzHZHYYJ2ka+K1jNvGB7OUOCN+TuqOdgo1UY2zT1E2bqWWs6o4u4aaaW
	+4CpVfp3W7tlYAAcmG4N87RH42U8luR1/N0ZHzPvhNXOQdvbq+yVgEbGdXvFYKUR47Xp5hb6wlD
	Pdvti4bHNEcXkeN2zgbLlPPIxZ+vSHpCLGfeBP9nEme2IiC1z42AkVQWtqZR51Q/fcce0pIgbgC
	x1nEzbImbJY5U/dG2gLb72+AJvcsmxUqrnsVJXXAcvaHAs+9IkYSOZz+s2eax/u3H3iPcJOGVsf
	q9jlEsIBsVUv+fRhxmeiwDPp0D3thBnxXTppeM9JhMApbQXveQaZa5nshMNqTZq62rcCzWn1FYD
	Mjxn6mFUcm0GM3t5+Z+GHdHDe2XQO
X-Google-Smtp-Source: AGHT+IECXlewiRNaZcsT7VByFGLy8wa/hYDpGmKSUjf1tAtN9CwCl6c2v3o8DCAfvXOp8IgGjxsCNw==
X-Received: by 2002:a17:907:3fa3:b0:ac2:758f:9814 with SMTP id a640c23a62f3a-ac3f211101emr418514966b.23.1742575281409;
        Fri, 21 Mar 2025 09:41:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbdc78esm184015666b.134.2025.03.21.09.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:41:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 21 Mar 2025 16:40:58 +0000
Subject: [PATCH 2/2] firmware: exynos-acpm: allow use during system
 shutdown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-acpm-atomic-v1-2-fb887bde7e61@linaro.org>
References: <20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org>
In-Reply-To: <20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_094123_324416_4042D5B7 
X-CRM114-Status: GOOD (  16.05  )
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

We need to access the PMIC during late system shutdown and at that time
we are not allowed to sleep anymore.

To make this case work, detect this condition and use busy waiting via
udelay() instead of usleep_range() in that situation.

The code isn't switched over to udelay() unconditionally so as to not
waste resources during normal operation. acpm_may_sleep() was heavily
inspired by the I2C subsystem's i2c_in_atomic_xfer_mode().

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
udelay(10) causes a checkpatch warning (it suggests to use
usleep_range() instead for usec >= 10), but that's exactly what we can
not do.
Reducing the udelay to be smaller will generally cause the loop to be
iterated more than once, which I wanted to avoid.
I could reflow the code to hide the actual value from checkpatch, e.g.
with the help of a local variable if that is preferred to ignoring the
checkpatch warning.
---
 drivers/firmware/samsung/exynos-acpm.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index d7ed6b77a957af5db5beba7deecce13ac7b30fd2..33cde6e88e2c0773fdd36c80927c77d3bcb44135 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -15,6 +15,8 @@
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/irqflags.h>
+#include <linux/kernel.h>
 #include <linux/mailbox/exynos-message.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
@@ -24,6 +26,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/preempt.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
@@ -272,6 +275,17 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 	return 0;
 }
 
+/*
+ * When ACPM transfers happen very late, e.g. to access a PMIC when powering
+ * down, we can not sleep. We do want to sleep in the normal case, though, to
+ * avoid wasting CPU cycles!
+ */
+static bool acpm_may_sleep(void)
+{
+	return system_state <= SYSTEM_RUNNING ||
+		(IS_ENABLED(CONFIG_PREEMPT_COUNT) ? preemptible() : !irqs_disabled());
+}
+
 /**
  * acpm_dequeue_by_polling() - RX dequeue by polling.
  * @achan:	ACPM channel info.
@@ -299,7 +313,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 			return 0;
 
 		/* Determined experimentally. */
-		usleep_range(20, 30);
+		if (!acpm_may_sleep())
+			udelay(10);
+		else
+			usleep_range(20, 30);
 	} while (!ktime_after(ktime_get(), timeout));
 
 	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",

-- 
2.49.0.395.g12beb8f557-goog


