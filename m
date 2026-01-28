Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FE9D3F083
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S3QlHqlhG5snnD54r/ty/Upcu15CQJsVNvjmcANqrMA=; b=WriaJ+epUaw+koMBfFcOfMipzI
	96gaxS+y/1es/WgbByAfxe55rGBNKDv/n0nwh3V+iOZKvXda1y0z727NVIOuX4CP3C9phUZCbyH0b
	BgJOB3W1eDiPRWbksdJCRNiqOa1gtPLoaSI+NaKa5S0tzD91HoHic/zdkI6FQUiKascBXHQ49ocAw
	A4QX8DhvODDIs9VbWz2xcdOzk5CENJKxneAYegb8M0DbsaZySXgl3yZbA9h0w9fl/ceXSAkaxm6AI
	EL34ieF5NizMsYNA6DXStkWUm313EvLZOX8wkbgcjsyMUq5X6/ReL4/POf1fa1r5vEJJevQPCbVeI
	krZs4DCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7mR-0000000GJjt-1jH0;
	Wed, 28 Jan 2026 15:48:31 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7mO-0000000GJjL-1vbt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:48:30 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47ee2715254so37004625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 07:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769615306; x=1770220106; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S3QlHqlhG5snnD54r/ty/Upcu15CQJsVNvjmcANqrMA=;
        b=NYwO8O4G0ljpevNO/DIUV44qUQ2uw6IQg2ZQRQk/UYUoP3j1E4oTHFG5fD2Uwq6UY2
         aAMlv4Q8qOjaKybOJ3g8WSrGNyswKzAQKUyCqSrnARf5+w+2nWzmE2aj9fC1iyyoURsN
         x17XhrjZSm/4jzwEZotxECR7yTrCP6cFBQWyHlUeiCfoU3F6mZ3YzRfHzQf2ULsH97FH
         WgX/cyZdQkAK0t9/pZvaxZi/hRMrnCdQLsd09KGPu5IlXTeSLxOBp9/NdgU4zOGn02n0
         VTo6uD8BRe69zW8HjHHz4I9ApD2hzW+XfVfsYhssxi0Kff4njQsq338uhLBP5RvAFnm3
         Qc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769615306; x=1770220106;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3QlHqlhG5snnD54r/ty/Upcu15CQJsVNvjmcANqrMA=;
        b=Xc3Uq141tlB4S+F1ui4jCu11r3R8K/Q8mh/BMOFNlINjwYVwsv5NfOShK3QTsdcLCc
         2o/ivvsB79Mrb3N2XRmu1nQpDqP/hJtgRSFmw9oTy6INxAMrsiZvtdnhfnXVwM8PVryN
         PPwU9RnSkHLBRf7uN+gREVAGZGeynLS4oD25w0ZSEEJ5EF27OhdqbtvFiigvxcoV24z9
         ENm2kz3kHXDPzjg0LgZbe8xQnUOw3I7vO6sn7xg4EO5VGr7ISWSdDMtElYn9fc0V00WI
         fuZJQej0bpwY1LJf37YRjQnBID/5+YZ3x7v2CpZAjc9DkRPaXYGTeRTfz1PCmdVgilo2
         Mb7g==
X-Forwarded-Encrypted: i=1; AJvYcCW2xKcV2NKwMs9S1tUG/lJuS1mXG1Eq5x3L+C2hBj44zgzagWkxmByXdcGD8p6Q7nMaGafz9C+mq7vqYQfK2ryZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzsIg1nXfC9m3WkNOyTJ34xHKIa3AOmAmxxFP0p0lbAc0busej2
	QFfugFNzGTmHIWqw8L5ygDzQ8CkrzkuPEA+M1lo45t3q8yisj5XpaSlTZBgk0S1eSCU=
X-Gm-Gg: AZuq6aJqvg+1D/nEQNbdz98TrmU/gAEE4QiJA1I05PWW61/6NdLrgcniNgmBXAN4wpL
	U+0d+wiVKYxakRy0iyT0ynCj8AKND7TA2qt+T6VhCAQP8rzI53nIe0SZEwMu/3FVI4YTRBXrz1s
	NMKvbv+mQyEx83VOPys7PDjSsYsG1hD+YD+FWi28YP+USDEsnIpHV5SO11rju5FXPimy/Rrt1Ui
	QgDXtmD/sDFqOafoitco+cytsPp2WKZbOOnWVz1NrS3l5yEXDhYhZT7ESkXFR7wvXmvASOzx7RI
	NFzOz/+Hjckeu8DTxvL5GvTbJQy6LPeK30ElxM7IuDuXp0DGtCXs679wrBZFpJk/LoNq3YWMH95
	2KX9CBiELUEfZtVKCmBb923C1zVu8gI6nbNWWPJw79+RhygAAJ5LfaoNIO5JWhhg83mz60rTsGJ
	kLhKmux4VEy99ZHzwbwAO9aEn7zcUqilWjNH7OtMK/KsGZ32zNdcI0GveKmR9Sg3qPuozQNQm7w
	qR4f7H3Kg/3u023TPixhim8OXp1KemiXEGsx9XREOOXZdYzyXfJY7OXAkPGVDH5eF4rRry/
X-Received: by 2002:a05:600c:4592:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-48069c5b97cmr75909105e9.17.1769615305735;
        Wed, 28 Jan 2026 07:48:25 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806e2bd243sm2394135e9.11.2026.01.28.07.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:48:25 -0800 (PST)
From: Daniel Thompson <daniel@riscstar.com>
Date: Wed, 28 Jan 2026 15:48:01 +0000
Subject: [PATCH v2] iommu: Fix NULL pointer deref when io_page_fault
 tracepoint fires
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-iommu-io_page_fault_null_fix-v2-1-de047be6dd3a@riscstar.com>
X-B4-Tracking: v=1; b=H4sIALAvemkC/42NQQ6CMBBFr0JmbQ0dsSIr72FIU+oAkwAlLRAN6
 d2tnMDNT95bvL9DIM8UoMp28LRxYDclwFMGtjdTR4JfiQFzVLmUSrAbxzWtnk1HujXrsOhpHQb
 d8lu0pWwKKptrgRdIidlT0kf+WSfuOSzOf463Tf7sn+FNCimUxdwiKbyXt4fnYMNi/Nm6EeoY4
 xdRcdl9ywAAAA==
X-Change-ID: 20260116-iommu-io_page_fault_null_fix-f81b4e8b5423
To: Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 linux-arm-kernel@lists.infradead.org, Daniel Thompson <daniel@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758; i=daniel@riscstar.com;
 h=from:subject:message-id; bh=CA4ugjQ1IEjW+6kqAc+hYZuO43p3F42A6CJda++BPeU=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBpei+7xn8ZZiBl8xCqnIgD+Ld8t+5lgqTfxVf8h
 b0Z17Jume6JAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCaXovuwAKCRB84yVdOfeI
 oUZND/9RY6F29ijnSmDBq/dwsNlREV122MJyeYlx4yZcygd8sC8B9fW7nagoG+zm9asqd6Q/ziS
 Qbqy8zqxoSs7BdtyvqAfKJkfGw5eyGxI9XTwVUqB/yskBEM2JsNzWrNID9Wm3DK0ciLG9mSwiyO
 EJu1ql1Fnfc/oPvMFs/xIvweP1qM2RT0ka5n58k9tSBdrkMcc7AtURdHuMzAjMqRJQEgDAp3gB2
 0In2j5f3rmL6xSCcsnpMzKdfbO7hAhQREgqhVVhZZh6evXyCIjySls7oKz4Z/bFqgsahNWHJn2i
 qZY2ck6xR/AssS7XW9MgR622bTQukQwqRhBcuVTkf47jGUr2Jygbh5uBs1l+JnjQRi+mU2gJ3L0
 TNO6/iym13M0gYr/4lsOKlfGWHI+2UWnvN2+ZHJdnbzZ9eRN1c55JjWm7d3NoM1wC4kFQGKNfau
 lFoKbRRWK9V19X2k5nSH0wWBMHC+YL5dX8nTN6LDprE6bRQO0dsT/G1aI4RX0te4gA+6Uw1je2z
 6RBWq6/GTYwms8r/AmRNf8BYnf5CT/rJlD9zlT6J39JyKVilRh5CbaCGDJSv1lTwPluB7mZABlJ
 a7zaK5FMnNesIsc7YwPA/LndTRCDl5A/Ads59baINuKBjxYB6aOJexklSQmdAG/FZ+gPB5t7pC+
 jD/6TD1uwuuG7uw==
X-Developer-Key: i=daniel@riscstar.com; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_074828_790428_1EA02F3D 
X-CRM114-Status: GOOD (  15.80  )
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

The arm-smmu driver is unable to allocate the blame for a page fault to
a specific device so it calls report_iommu_fault() with the dev argument
set to NULL. Normally this doesn't cause anything catastrophic but on a
system with the io_page_fault tracepoint enabled this results in a NULL
pointer deref (resulting in a fairly spectacular crash on the hardware
I'm currently working on).

Fix this by adding logic to the tracepoint to safely propagate NULL.

Fixes: f8f934c180f6 ("iommu/arm-smmu: Add support for driver IOMMU fault handlers")
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
---
Changes in v2:
- Add a Fixes:. It points to the earliest point I can find where it becomes
  possible for the tracepoint to be triggered with dev set to NULL.
- Link to v1: https://lore.kernel.org/r/20260116-iommu-io_page_fault_null_fix-v1-1-6c20c2e62987@riscstar.com
---
 include/trace/events/iommu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/trace/events/iommu.h b/include/trace/events/iommu.h
index 373007e567cb827458a729b8200bbcc1b7d76912..1315193f13b8812ad4e29e6b0c0c66ca806ce08d 100644
--- a/include/trace/events/iommu.h
+++ b/include/trace/events/iommu.h
@@ -131,8 +131,8 @@ DECLARE_EVENT_CLASS(iommu_error,
 	TP_ARGS(dev, iova, flags),
 
 	TP_STRUCT__entry(
-		__string(device, dev_name(dev))
-		__string(driver, dev_driver_string(dev))
+		__string(device, dev ? dev_name(dev) : NULL)
+		__string(driver, dev ? dev_driver_string(dev) : NULL)
 		__field(u64, iova)
 		__field(int, flags)
 	),

---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260116-iommu-io_page_fault_null_fix-f81b4e8b5423

Best regards,
-- 
Daniel Thompson <daniel@riscstar.com>


