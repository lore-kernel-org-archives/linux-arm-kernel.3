Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A36C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 15:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRWYwpfb+Qm0/LZ29AYhcqtDsg2o5q/MxVz554Yo+yk=; b=49hU1KYG/DItziuRyMYYvCcuMk
	eA9i2xQv8w3LAioA6n0fCAdX0k35hNaPWueIcu57fJeACP/+/hxOR8alWfTVD81JlQZXWJ5Zs6CS3
	pdja6GDVn3/w0YgBDIkRz01+7U0Zww9yO2iBtHS8rBg0mK/2TpvG8q5GgJW3zXx6+FI0RPwJTgNRv
	m6LKTNX2gqIfRiRISwxOukyBFMBZP7erg5dYCX6GNxdRkjKm3UgcGaI/k7rb8mmkTwPh3bfFhfxqH
	3TB7QSOHAxUKalaDhyWuNJg72gyf9lRGWwWgN1asMlpQubnAnOTlmVOjdwW1jNRwxkrsix3m7JvUJ
	kz8XbLHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twjtj-00000003XaP-15XA;
	Mon, 24 Mar 2025 15:39:31 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twjod-00000003X7R-3EQl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 15:34:17 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso917504366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742830454; x=1743435254; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRWYwpfb+Qm0/LZ29AYhcqtDsg2o5q/MxVz554Yo+yk=;
        b=IGW2zDwVQHeCmOhrITvXgrpI6kM1TEgAOT5Qx4XA/eZrVsOarWjaV1+VD45oiyLEiL
         /oU5vgd2vvxmYv7u+TBQVv7iaHFBTVO1SOwqvMPJQbMrFzXMXF+citP0CfHfD8IrfrLF
         OVzWYoIQzLZiIAJwEn95IhhnvxXSQ4m93oyvx5qNwz6g0HGdPLFdXmBM0vp3mNnBKpVr
         GDTdz9vfVl45jBoT/kw+nE6GysfrnnAqZkfNAalwXa1TGp4NAlJTizC2UfzrMlZqTWFL
         u6i0mA+Bq1JyKnsFbMDEZYwbx3sYyXeNN2tMtrsQBLHUggJ9Ir5MEHVRG0ac/JcQGaen
         sjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742830454; x=1743435254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRWYwpfb+Qm0/LZ29AYhcqtDsg2o5q/MxVz554Yo+yk=;
        b=fsoBUYvgq2ux7CtXN21cOPH5CttlhjKv/9ov0cPPF6saBMwW8wK2M5L7degTtW0dJ9
         PR20Do98oHNYgdZQ/45lZ/VzywltuoAfoQSvU2YZe5lQWNGHZpcjWjpoO+KlYl2V/IpT
         n4iHnNa4sPXqYtqPUE5EMOkkF9Aq5lgIQkDHzEp7/uQ8PiGg3+wmzYQ87yc0ua8wBAT/
         rBKLG+8EK+qUCVYyVLqySSy9RVAgd/j9e2lt4gZGCl0fNz5dCH6OAj8GFHZDZ5kIMYCL
         PnRqcJYM/rz59ZBbxU1r7RKyxfzRH6g5rXEClr3ANV4mqSHVYfO0GeBQurHHBzI9arzN
         bHQg==
X-Forwarded-Encrypted: i=1; AJvYcCUU/M8v4AykBkVV49tyDiekeI5xUuWvrAmkIDjdGfS1Ll9yqaUiGgulXrhKFXsFfujq2pKPnjbRIGUg1cDQNhTd@lists.infradead.org
X-Gm-Message-State: AOJu0YzCCa3rTwBbZsCZzzoSy770YsFLWpfyhqxMeGvcRzQsNFWiFwGk
	QPkLgdp3kewglowakYoca55omAz/KFdEvkCDjDtlnJfqknrzNKrr0PtIZrlQIxt34Sx+o+UdSoP
	7PYw=
X-Gm-Gg: ASbGnctOC40e6mdzMusGiyaLuk/GP1nfLVXsdUhOTl6gNCrokw1C/6jvd1zUSIVh3Jr
	JuHgvj7iuryK9Qwa7V3F0eK8RRJz50KpUKBMiYeAtOi9F7ryTczeIBKu+1gdGkzqt6VWxtyYjrV
	ldJ8lf4BNtlHbabpqaa/MxkBYF4vhsIUgjpLdLzVNmswdTtlIdnzf4BjhdvqlpHRJe+Cq0BRGYJ
	NZg6ilFQAWt18Vj0RVCBsgz1CPM4GLqUj0NSQ3IFUcZhSsaOvcayXFbpTAcs3YnAR8/riyx16Mk
	z3+N4ZxPHyL+kt7EToK2XKqIv8wEZTr3UUR0IFqr4Ej+ShW//L+4i50pNOCab5vFk7lyBmkPdka
	JVorTb20848U9n2PUqS0YSh7QfMO7
X-Google-Smtp-Source: AGHT+IFWUzpGuHqazl0dpTOmipY8A50S66wW8ZDj1rQKEydjpZVDbROVxeCvHwm+5oYARuqtOVEg6A==
X-Received: by 2002:a17:907:3f9b:b0:ac2:63a9:df0b with SMTP id a640c23a62f3a-ac3f251f206mr1143189666b.35.1742830453945;
        Mon, 24 Mar 2025 08:34:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm690219466b.31.2025.03.24.08.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:34:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 24 Mar 2025 15:34:10 +0000
Subject: [PATCH v2 2/2] firmware: exynos-acpm: allow use during system
 shutdown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250324-acpm-atomic-v2-2-7d87746e1765@linaro.org>
References: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
In-Reply-To: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
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
X-CRM114-CacheID: sfid-20250324_083415_806907_CE12DF7F 
X-CRM114-Status: GOOD (  16.41  )
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

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
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
index 542eaff03f9e39422a8c5345ca75e05c1710a9ee..4f65f7ef39b5fdbf5bb10f6ee9ffb78c5e34d8b2 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -15,6 +15,8 @@
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/irqflags.h>
+#include <linux/kernel.h>
 #include <linux/ktime.h>
 #include <linux/mailbox/exynos-message.h>
 #include <linux/mailbox_client.h>
@@ -25,6 +27,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/preempt.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
@@ -273,6 +276,17 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
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
@@ -300,7 +314,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 			return 0;
 
 		/* Determined experimentally. */
-		usleep_range(20, 30);
+		if (!acpm_may_sleep())
+			udelay(10);
+		else
+			usleep_range(20, 30);
 	} while (ktime_before(ktime_get(), timeout));
 
 	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",

-- 
2.49.0.395.g12beb8f557-goog


