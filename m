Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A84C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHu65GRGtE9tAA3U30k5Ff4J4ZEkOWgVLpTedANrfZQ=; b=4t2+1o3DiAefRmVzG95PT3+KHk
	8rNzQxJ4HwbI/wCpKVyeQIgiZ+Vx5jhbpVrgzzoVBNQja2xCdKLd7LHiJrao2hU35Gm+ow6HxvoIp
	NLghW4g7EiTXJ3GAGjzLYMINT9FI++E9U+ZJGZTjiSra3iF1H8QpMs9RdzhYfk5QQuAo29OQhEkru
	TD7HP/jFoQXXy5j/UE0FnPoSNyIrTBVQtZymzHW8+PXh32EbkKBFqaYr7behWNXQe5NVN2T+EFDEu
	wu1TTwFaT/UJbEZ81a0AW0mvGfgECjGV41GUbTMW/GGGKqZC4fNTgPaRxvWMcXLbA04EUkO7gG9ys
	61ejvdsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XWX-00000002qJe-0M2J;
	Fri, 04 Sep 2026 17:16:21 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XWS-00000002qHb-2Fak
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 17:16:17 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c2580a59d0dso110570066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 10:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788542174; x=1789146974; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lHu65GRGtE9tAA3U30k5Ff4J4ZEkOWgVLpTedANrfZQ=;
        b=f45WquygeANs/t2qAXfV+mkOSV7GQN73e/f5i0hql60UY+KFMfBgShXBY3AVAV71dj
         Pn4SGBXQNBj59xTChohTxm0YRJcyjmZfKm5UgXlNjParthXqqGOFq3utFnP5/OK4V90L
         4nljyTfcTOSpKtV3Y/MCppM5cjk/V8qop94iPSzST/XPd+6ZKGx9dD6mLfu2ul6i2Rtg
         crRrBMnGQlCFeHrp3Trmqp6m3+u/zq60aC+i/gktBLrVSil7x9dlsnUotpB1XHsfSWnB
         LaZ5/C5jVcbYkrRtNA1r0H2MX8uCEu98ekQGnQgGPZ+Os92vNNjn8sgHIAvZbmtAktoe
         odzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542174; x=1789146974;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHu65GRGtE9tAA3U30k5Ff4J4ZEkOWgVLpTedANrfZQ=;
        b=AG3w8gsrpcPn+4kTT7D2fR/JnmkqHXZsj4ga13geClaQctTwwJHaliwFigT/mXx+bN
         D+lM2hvBmOjwTrUh7W0nSP0CaD7Hid8CwqhuEAmwXsxIrMXtZCpSFqrbMgP7omigLULJ
         fePZcSn7sYK69N7yiYodKNaAkIS5eIQ9tQksT4wXTIDhrlcS32OXs0rZWV05gBz4S3+m
         0spEt/aHT4Ky/8+MSBzo46uq3Xro15IdahYst0WH0L4b0OVgyZN48M2S3VX+Y+3L/YAa
         FBAn1jUcmDJ0IuUppzFTeCGbe7pRbfBpuqe3N60WIevOrgbNkd+j8hbDGkecxvJqxJhd
         jw+w==
X-Forwarded-Encrypted: i=1; AKwUvBzqneWRXE1SiBYT5QpzvtPZy2j0dC8YTcITL5aRNA+IK1MbyQy3hb8M3fC4Oqmrz4LlfufE64YoSWlYjOqVXhJU@lists.infradead.org
X-Gm-Message-State: AFuF++nz/+Ba8elFWGtKZrrwnSNhlIBjgvIEdCwTBNVaLKprW6avFTUy
	f7JREARF68fZmwc1DTx8fmZv0ygGWkN82zcPNtjI9vKm2LebvDrI3EHJep2cC/E92aUYzLRd1hQ
	6wC+tVQEf8TWNI+7R/w==
X-Received: from ejczw3-n1.prod.google.com ([2002:a17:907:e003:10b0:c25:d60:eff0])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c16:b0:c1f:e9d9:64d4 with SMTP id a640c23a62f3a-c260c9cb978mr352987066b.11.1788542173879;
 Fri, 04 Sep 2026 10:16:13 -0700 (PDT)
Date: Fri,  4 Sep 2026 17:16:07 +0000
In-Reply-To: <20260904171610.3342398-1-tarunsahu@google.com>
Mime-Version: 1.0
References: <20260904171610.3342398-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904171610.3342398-2-tarunsahu@google.com>
Subject: [PATCH v4 1/3] ARM: locomo: Fix device reference leak on registration failure
From: Tarun Sahu <tarunsahu@google.com>
To: Russell King <linux@armlinux.org.uk>, Geoff Levand <geoff@infradead.org>, 
	Masakazu Mokuno <mokuno@sm.sony.co.jp>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Paul Mackerras <paulus@ozlabs.org>, helgaas@kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	sourabhjain@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_101616_577623_537B565D 
X-CRM114-Status: GOOD (  13.72  )
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

As per device_register() kernel-doc, calling kfree() directly on
error bypasses reference counting and skips the device release
callback, leaking the reference. Even in case of device_register()
failure, Calling the put_device is advised.

Fix this by calling put_device() on device_registration failure
instead of kfree().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 arch/arm/common/locomo.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
index 55e360452828..0f6689d343b0 100644
--- a/arch/arm/common/locomo.c
+++ b/arch/arm/common/locomo.c
@@ -223,10 +223,8 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 	int ret;
 
 	dev = kzalloc_obj(struct locomo_dev);
-	if (!dev) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!dev)
+		return -ENOMEM;
 
 	/*
 	 * If the parent device has a DMA mask associated with it,
@@ -255,10 +253,11 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 
 	ret = device_register(&dev->dev);
 	if (ret) {
- out:
-		kfree(dev);
+		put_device(&dev->dev);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 #ifdef CONFIG_PM
-- 
2.55.0.979.g7e5102b832-goog


