Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5359CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7NaUZ8NzgConcLQlWK2tCRyH0zU4s9BkLK3EWuec7V0=; b=Jx/QB5gZ19zSvXmXXJsKGJAZeS
	j8ATD/NDgdXe2VWuYrc+/ARtdnMLvTmvSRTA40ovXTI+ryTSRJu0AqrluKAlCQEGYTov8Wmp1eF95
	iEfXFzrhMJQqiYfktTrCgPQT76i8hQavGsrb0GgbWeSFwfyxujiEtjDZM60XhAtvYkn0aRRgKz1lM
	nmPFlW0Pgb3PHGMdKOlBLK2ER07qTalJhDdhmvUEu9z2F+7VT8EjSdu2zM51lwp15wLuGbdrpqsNS
	dP9SigC5SHFKWccx9HDMTq0yPNmBEDxVKcgS47neVZbaYt4ymQVMKAlsKA5U53dhcW32Hh/YZ747d
	kfTiLgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKZz-00000006Uiy-3BtW;
	Fri, 08 May 2026 12:45:19 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKZx-00000006UiI-3V5N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:45:19 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-40427db1300so1471459fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778244316; x=1778849116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7NaUZ8NzgConcLQlWK2tCRyH0zU4s9BkLK3EWuec7V0=;
        b=lpz7s386JIuqRldQisOAYQeqkPKWWGYwuuEs9YzDH3gZiQFCpmiiHWOuE+4YIKIjeC
         RHrj0ZQkIVOvu+A+evc9pffN7t1al7TpP+lwd1w1RKBNTyciiI/T0+NKj50qtpYwgF64
         w8pgPqm9o4kYoOfEsK5DK/NKt+04Jdr7FvWb6iAIfWh6Gv30qVMLfksncdaCSleqJLGf
         ZZXKzYFXUkyluraanFDkE93Xu6YofETuiq1wVCGcLNMuGejyLg3UEuLixwLTi+3QZ0QX
         zYs1VSTrvyFPt7hmRoUgR2VCie03DARLNT6+Km0T0Ff4hSHWwRQQ/qOZ26w5N7prv3uX
         3CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778244316; x=1778849116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NaUZ8NzgConcLQlWK2tCRyH0zU4s9BkLK3EWuec7V0=;
        b=om1q/QcaRJwakIflrOiTYKlFEof1uhnUs51JWqioGtiEOG1fSRmzGTAS+/BC3BI/DJ
         K5hOywa3Ol1IRid/AXIeHEk3upmV65diyeCYHU2/Q0J5YX5uMLk0ZkOH4W8pKzN/Ob6P
         lOm8uxCHk3j4phOMczmPfPONClAqJ4slZNiIJDwG/MkQf6D1FR4C2S/LKkZSib4uUz2E
         pHUdGy0PUKspB8HrdY50IZWHpCUKM2LVehJAPGBj8z8ACwMZWu1/FKq+bagvUdvkdD7B
         nHUBgGr5crw353rUgwozOoIvq5pOSh5NnnUQOTnylzszfbPgjUzGLRyExyPLYEvlBZ7u
         VLjw==
X-Forwarded-Encrypted: i=1; AFNElJ9vdQmI0ygTTTPkAfFqYz1EQ7J00LxDaUI1EpGyHKuq/qA5ssaKiInIbKVRy7/i7208ZvGl0BQyci5Cz72rGhGa@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3e4xsIIzYlmRespVi2IiqlkqyoeLA+wyHbtQWsE5NM3QwiD51
	tDfj2nuHOX3tPHqPK+FpDSFjUUOpfsV4yaUSg4PeZu66v2URyySsaLpg
X-Gm-Gg: Acq92OHIvzoA7heTSfElQrSHviV1ZhD3pUlXTwK/NnDnpxicIhj/hDs9DFQelw7QWB3
	r6CDRci8LFE7/wxjhEFvdkfSzwq21SS8O4yWepFVj5rwZmBhLFFPK4WEuZP28ICSPK6pYaaBKUQ
	IWCSgoKX/o2iyjafoLmINTiZ+KuBnW4YhU5VeqxuY+vulvHmXl+kUxPipsIxz4cXRGLxJpQD/qS
	390+fTG1thaw17RUb9m0ju8jSY6dLOI/J7mqGDIKJ7eAZ+zz3PUpngPRLTJmYgMqT+Ji4l9nv4Y
	CvDeJOG+UyJikSIOFRbj+Ix+26FP9UNZhCu4RXySTfpgCxadyWRQkYFm93j7JNHVnk0pvxl7YmA
	cdvUTmiTHNJEOuipUqXHvncfuBzLDrxhlm2jtcS1tEN/KLMjj5xR43DudziolhGYFCtIU0VH+7o
	I/mNhAEpN9a7BAseGfEE30Uaj/xaawTbfdByIOLy0xGS3y05udGNB9qUzzBQ==
X-Received: by 2002:a05:6870:312a:b0:42c:ebc:7f53 with SMTP id 586e51a60fabf-434f657b535mr7417665fac.37.1778244316057;
        Fri, 08 May 2026 05:45:16 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-435573e7254sm1630055fac.14.2026.05.08.05.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:45:14 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: salih.erim@amd.com,
	conall.ogriofa@amd.com,
	jic23@kernel.org,
	michal.simek@amd.com
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org (open list:XILINX AMS DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] iio: adc: xilinx-ams: Replace spin_lock() and unlock() calls with guard(spinlock*)()
Date: Fri,  8 May 2026 07:45:13 -0500
Message-ID: <20260508124513.17752-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_054517_877490_299BA374 
X-CRM114-Status: GOOD (  12.33  )
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

Include linux/cleanup.h to take advantage of RAII macros.

Replace spin_lock() and unlock() calls with their RAII macro
counterparts, which modernizes the code and increases readability.

Remove "flags" variables where spin_lock_irqsave() has been replaced
with guard(spinlock_irqsave)().

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 v2:
 - Replace guard(spinlock_irq)() in ams_unmask_worker() with
   scoped_guard() per Jonathan's suggestion.

 drivers/iio/adc/xilinx-ams.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 124470c92529..05bf1444ca7d 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -10,6 +10,7 @@
 
 #include <linux/bits.h>
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/devm-helpers.h>
@@ -414,18 +415,16 @@ static void ams_unmask(struct ams *ams)
 
 static void ams_update_alarm(struct ams *ams, unsigned long alarm_mask)
 {
-	unsigned long flags;
-
 	if (ams->ps_base)
 		ams_update_ps_alarm(ams, alarm_mask);
 
 	if (ams->pl_base)
 		ams_update_pl_alarm(ams, alarm_mask);
 
-	spin_lock_irqsave(&ams->intr_lock, flags);
+	guard(spinlock_irqsave)(&ams->intr_lock);
+
 	ams_update_intrmask(ams, AMS_ISR0_ALARM_MASK, ~alarm_mask);
 	ams_unmask(ams);
-	spin_unlock_irqrestore(&ams->intr_lock, flags);
 }
 
 static void ams_enable_channel_sequence(struct iio_dev *indio_dev)
@@ -1060,9 +1059,8 @@ static void ams_unmask_worker(struct work_struct *work)
 {
 	struct ams *ams = container_of(work, struct ams, ams_unmask_work.work);
 
-	spin_lock_irq(&ams->intr_lock);
-	ams_unmask(ams);
-	spin_unlock_irq(&ams->intr_lock);
+	scoped_guard(spinlock_irq, &ams->intr_lock)
+		ams_unmask(ams);
 
 	/* If still pending some alarm re-trigger the timer */
 	if (ams->current_masked_alarm)
@@ -1076,16 +1074,14 @@ static irqreturn_t ams_irq(int irq, void *data)
 	struct ams *ams = iio_priv(indio_dev);
 	u32 isr0;
 
-	spin_lock(&ams->intr_lock);
+	guard(spinlock)(&ams->intr_lock);
 
 	isr0 = readl(ams->base + AMS_ISR_0);
 
 	/* Only process alarms that are not masked */
 	isr0 &= ~((ams->intr_mask & AMS_ISR0_ALARM_MASK) | ams->current_masked_alarm);
-	if (!isr0) {
-		spin_unlock(&ams->intr_lock);
+	if (!isr0)
 		return IRQ_NONE;
-	}
 
 	/* Clear interrupt */
 	writel(isr0, ams->base + AMS_ISR_0);
@@ -1099,8 +1095,6 @@ static irqreturn_t ams_irq(int irq, void *data)
 	schedule_delayed_work(&ams->ams_unmask_work,
 			      msecs_to_jiffies(AMS_UNMASK_TIMEOUT_MS));
 
-	spin_unlock(&ams->intr_lock);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.54.0


