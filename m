Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256E8CCA463
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 01:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z1IfMfNgxmNnTVwhoMZ/I9bCV5F2hA5W5b2zHBAEC4U=; b=Ewft3OEbD1N7z00nPa9rtkMGXV
	G8sXlm5atctHqKtTufmZiqPiKe+ISrCleJfQ/YsvwGNbT87r15WJuT+/gb4+nu697P3pOD1MHsW6M
	vbM19WjExRfy0aBW3lxVr7yHdJnlJSsshRsDN5yF1JVkmApa5kXdSMwGnr0sFlm4XT7kMA/VT2kmf
	3f573IkFjPBmMh/q4NSynmwmbZb6xIiRhG+fLdtbA3NiAc3+nnqMxEFU4pwpREyE+UrDjmzI7B/D9
	3x2tWCciFnqCqhuIg9LjXMpxvwjK8jrKyBQSb7aBkK0bToVSp902gz7z/+rUUNhZPQD/N7l/h3zfn
	MChlMP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWur-00000001hoM-1Ve7;
	Fri, 16 Oct 2026 01:39:25 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWuo-00000001hnp-3KII
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 01:39:24 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-5352a876d5aso73903971cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 18:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792114761; x=1792719561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z1IfMfNgxmNnTVwhoMZ/I9bCV5F2hA5W5b2zHBAEC4U=;
        b=KjQHKsBpHXYzIYh/fOo1X9kOw8EnOYYM8w/BG5RjFG2KImPREVvi4qbCITjgqgqkQu
         eb7AEJmFGY4lLXwSr1TN2hmCOdK3w5AHobzcTT4U/2QYClN8WBitj7vxZSLVI2KqJs1t
         xsOioMcN5nVUzTRtLUQoMy986OefJ7IA8p2N8668CHTQzKOKpKcPpRG9ZUoF93wnnwx3
         vN0SnpDzsEEfKrDTVr0vkilTOif+HpmeXU4n5N8/z5p3imdUNrrohdTQY7NWBCIW0Ihn
         YDzrjQh2smjzNgfWsQbjkTs6Z32Zf/74WO29FcC1go0XTZYLc9irC77AjAS/B/t/Ddf/
         25sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792114761; x=1792719561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1IfMfNgxmNnTVwhoMZ/I9bCV5F2hA5W5b2zHBAEC4U=;
        b=lk7XXFiFmAI0Qyw0OK9ZkLIbnzR4dHhRf1yeOWyapV35J0k7JwAKyKUlY2wa92v0Ke
         LSU6nBHIV+xsxXpJwEe+pSuiRWa0m31rnxYK4X2FbN7RpU4kneGbopsSf0elt7CiJdwP
         t3MES2n6jTqziCNpwQamjE0/mHUnk2Xs9k4jYKgzioSUahA8xyGeM4jGYW62VwwE+Mc3
         2iIMakKo02m1vXetM6jy3E7zKP1UjxU9WrwGDtwGKq7wNiMFBNnXes2pm1iWKSMShNFN
         0bmSMF3rhvJx+5pOZvOrVtsk4IdazE0a0yuXc53Krb1hzfcAHFx1Kj12sZKnIGFCPDe9
         eNyw==
X-Forwarded-Encrypted: i=1; AKwUvByW0KpK16qGguR2VsgZpNP7jbBYSO1QolvStuap3e+5CpdxJ68pKlOdyTrxX2cOZ/attsrzw14QMnj+VL+a4Yx3@lists.infradead.org
X-Gm-Message-State: AFq9FYLW25FP07Q43qfFn7icWerLdVCYMn6fu2cFksi8RjWh+/YndpjJ
	dfDE0f+SqeHzf56EEOS1+Wp1Txrf/uCDPu2uEgvhMoI09zeVa0/Jjiey4SeK7qkHJg==
X-Gm-Gg: AYBFou3FLX3i/+w3ch0dh5hyb/s//RNc6qiNIxIM5IzxzjC0FmNeiKuxezWGfZdkSIs
	pSMmBn6jqrIhdvWav4C4NyoOb+cxLUdIsFW38v1CkUeVXc2y0OGCvUiUbM/Pj8jtdeqzAGv2+GI
	mbqGOBKNGcRdsvCnwbf8wDIuFm7luNkdwuJMbyA1k/N1K6tcvIYmgoGpJwSzwK0dS8suvU8URgF
	TWggG9rFwtR0WnBhPESBg2HgyHlMfdr2ZQ+qt7f0clF9EFKxEIu58LdQ66C/pIyvmEugJY2FZ8I
	Sm4WUxOeLRYtkDymyRLRMY1WhJZTkiIqpN1LSpr6ogdX5HYVahMy1tKUZGs0C9G4567mps8A3RA
	gGAe6WTlE24AfNdbOJlRnlUaFI6rAhfrRy9pBPdcFEgZaRZieinH+ExaD5eijQP3ldZ1msFU2CB
	ft8qGwKezgxrEhfFxbGFIUzox0LOhzBzjcKAplhJTsZfcUdk6FsYLzRHzFlpu4bd62JMKH5rJCt
	s6msw2WcWVOEGc7iZuFHJOmuzUAkiGsuVzB2aem8bDIJsFQ8/hYPb4FcnW8JYfXPAK4bJEzkVU8
	tpU/gAcDkijqkVMK8RthWb9pEwmFxg==
X-Received: by 2002:a05:622a:1441:b0:535:864d:b821 with SMTP id d75a77b69052e-5359fac48aamr342803671cf.17.1792114761291;
        Thu, 15 Oct 2026 18:39:21 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a9c273esm8981861cf.20.2026.10.15.18.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:39:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] platform: cznic: turris-omnia-mcu: stop button emulation producers
Date: Thu, 15 Oct 2026 21:39:18 -0400
Message-ID: <20261016013918.3492835-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_183922_882167_EFED0164 
X-CRM114-Status: GOOD (  17.15  )
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

The legacy MCU IRQ thread can requeue button-release emulation work
after its managed cleanup has canceled it. Since the IRQ is still active
at that point, the newly queued work can outlive device teardown and
access freed MCU state.

Use disable_delayed_work_sync() to prevent further queueing and drain
the worker before the IRQ action is released. Keep the parent IRQ active
while the worker completes. devm_add_action_or_reset() also drains the
work if action registration fails.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: dfa556e45ae9 ("platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 31 +++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
index 4e430d6c3fc4..8f43bfa92373 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -11,7 +11,6 @@
 #include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
-#include <linux/devm-helpers.h>
 #include <linux/errno.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
@@ -841,6 +840,18 @@ static void button_release_emul_fn(struct work_struct *work)
 	generic_handle_irq_safe(mcu->client->irq);
 }
 
+static void omnia_disable_button_release_work(void *data)
+{
+	struct delayed_work *work = data;
+
+	/*
+	 * The IRQ thread may requeue this work while the IRQ remains active.
+	 * Disable and drain it before releasing the IRQ action and the MCU
+	 * state used by the worker.
+	 */
+	disable_delayed_work_sync(work);
+}
+
 static void
 fill_int_from_sts(unsigned long *rising, unsigned long *falling,
 		  unsigned long rising_sts, unsigned long falling_sts,
@@ -1082,21 +1093,9 @@ int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
 		return dev_err_probe(dev, err, "Cannot request IRQ\n");
 
 	if (!new_api) {
-		/*
-		 * The button_release_emul_work has to be initialized before the
-		 * thread is requested, and on driver remove it needs to be
-		 * canceled before the thread is freed. Therefore we can't use
-		 * devm_delayed_work_autocancel() directly, because the order
-		 *   devm_delayed_work_autocancel();
-		 *   devm_request_threaded_irq();
-		 * would cause improper release order:
-		 *   free_irq();
-		 *   cancel_delayed_work_sync();
-		 * Instead we first initialize the work above, and only now
-		 * after IRQ is requested we add the work devm action.
-		 */
-		err = devm_add_action(dev, devm_delayed_work_drop,
-				      &mcu->button_release_emul_work);
+		err = devm_add_action_or_reset(dev,
+					       omnia_disable_button_release_work,
+					       &mcu->button_release_emul_work);
 		if (err)
 			return err;
 	}

