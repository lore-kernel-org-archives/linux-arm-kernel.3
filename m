Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6451EC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1E8OcPKQa3EfyTN7DtxgAyhHDdwMTH4+JtgNWA55MM=; b=GAlClxo9+88KNwP+Sb6b+QIvgH
	5wRTLwki/3P+B11cUJ7XwGCZgwPNOa0u1Ovi94y3wufDmdEW9nQ3Y6UoXWCuaf+lNxYL3tKeL0F3m
	hiemxb9mJja/Y6CdoFx6QThE44iV9eO3XLVRsuKymNIeB0nO2TEZS6/QBAi3B2BiNtxaaWi/hyf7w
	sHsywmjwVDMXJDE+NQA/TleVEnPqW2FOWT5Tu2aA6LITO/SqNBBEINKortTcsSsvvLowTzYJR3BjT
	zWhPip+m8X3KDFHb9QgNWxENU5Nd6LdLFV95vtoIiJEfOW5EjSrpYbIb+5Vw3m1FyOLQeZrjHkF5+
	txGbToVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSxj-0000000CPBv-3mtv;
	Mon, 10 Aug 2026 16:34:55 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSxi-0000000CPAa-06gL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:34:55 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6a1e3cfc8d3so1996803a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786379692; x=1786984492; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1E8OcPKQa3EfyTN7DtxgAyhHDdwMTH4+JtgNWA55MM=;
        b=NL4KV2V0ZBaKdbC8y1JLQXHfbN8fFGaSaBGA9JjlvnazVf0BNaOuWt21DLys1QyhsV
         bTIxFVAqWgfwgfkdl4R3EapZogCVTrw7akGKdwQdGtJhXxSclJ7wPQEvcgnRktPZM0qu
         d5sxmzDlhQRmc72bN2giXG1cChQg5QV85sPmV4p8UexeTffFbeUgkzvlGp4QD/cyz7DU
         QgkDUwJM+8oUMDG3V9RSNyM5co1dFyfbOSbDfCAsOCKIhM4iQNKng16iHQpqHWX0O/ls
         SAJSf622Eu9CBzzDf7+Ro9lhAgF2RNdvFXVh7uAoEaNHK6p2C2luvWV6nj5su5sIR3Qp
         xjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379692; x=1786984492;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1E8OcPKQa3EfyTN7DtxgAyhHDdwMTH4+JtgNWA55MM=;
        b=XooJ0nLQWaD8N2PrIrOplgB3V/dg2Rq/TEQbwm+fj66IPjqH9me+uFmIKfXcVpgPhs
         BjT9qfxwJ4Nl+AAGuZsFkCNbt5z0Qkok2N+sydjxgNkcdX3bENsRsn+bAL9bWncQi9xL
         FI6QNOw4toZzSao5GMRIU7xwQPSA+JQc95MkbCm4R5Svm2cnyIO9vN+U/cTsVF5ZPAZR
         qGHNOHdIGBlXawQuCmBpHmvimPcOK/Z9LT/XKXDfj8NpGHWMd304AX4TTs7Lo1pm0vQh
         18g056yBsOVn4gF5dY2t6Nyv0fViMB7tXYrN5JXHQLtc3AuObJKFkfNLsXx9UgBUaiI7
         rHBg==
X-Forwarded-Encrypted: i=1; AHgh+RoidwSIvS2m7g5KeNMVDpPV6nKp+jm/qj9IYhbnTd/dao5J5I+se9+QdwafHVc5BKaGltQgFl47VJJqk//7d9t0@lists.infradead.org
X-Gm-Message-State: AOJu0YzVCDl0kSbrlysV2ZMEJopOGiAszPzFy2BldvtnIwe0wlWlu6PJ
	shNo9sbXHKGMK6IuyzRCrDdUEQAyOziP25iHwP8RMzu5r3iDlwbMoQzB+JqvTE+7LMWIp+cHHSg
	KWAtUH1xTbq0n2DG4BA==
X-Received: from edzh5.prod.google.com ([2002:a05:6402:945:b0:6a1:c0a:e022])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2110:b0:698:6620:d988 with SMTP id 4fb4d7f45d1cf-6a355e1332amr1811578a12.15.1786379691640;
 Mon, 10 Aug 2026 09:34:51 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:28:11 +0000
In-Reply-To: <20260810162814.1398016-1-tarunsahu@google.com>
Mime-Version: 1.0
References: <20260810162814.1398016-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260810162814.1398016-2-tarunsahu@google.com>
Subject: [PATCH 1/4] ARM: locomo: use put_device() on device_register() failure
From: Tarun Sahu <tarunsahu@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geoff Levand <geoff@infradead.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, dmatlack@google.com, Borislav Petkov <bp@alien8.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, djeffery@redhat.com, 
	Tony Luck <tony.luck@intel.com>, skhawaja@google.com, 
	Russell King <linux@armlinux.org.uk>, stuart.w.hayes@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-edac@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_093454_067663_22BD6005 
X-CRM114-Status: GOOD (  13.00  )
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

When device_register() fails, calling kfree(dev) directly bypasses the
device_release() callback (locomo_dev_release) and leaks internal driver
core structures allocated during device initialization.

Fix this by replacing direct kfree(dev) with put_device(&dev->dev) when
device_register() returns an error, ensuring proper refcount decrement
and cleanup via locomo_dev_release().

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
2.55.0.679.g6767b8d81c-goog


