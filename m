Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EAFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jg/Wh4RVlcGrE6Wa1eMp9aCyVAjW1OJpvCqAyR9yWrM=; b=mPRsmTJRKnm/ICeES+0sUhgNtW
	CUYZPHYWxtBHpyzxOCeWiCS94IoDWG3Gs6vWqdV+KikdsbIDboMLoxtCOqc6kOXHRUBAlqOVNeje0
	jExAoqaRjDWBwlCqFJfxe/8THZlRfrPSB9BP+8uYxjvjTct7XiV3v7FTd3SHhg/3RIN8EefJyLIYw
	shB6DUxwxqA6jCiraa8NNV/haflob7oRwl/NtgkOqsYNMXp6PTjNu+sglDqXPzl+Zg0a8N4I6am08
	nSKdAiRZ0arxStU2bxygExq0oTkm7PI7wamgqvWBs4GZ4SDASs5TFEx1ViyBGxp4C0kfLZeBzIGQX
	vDXDBl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weESt-0000000FA2k-16MC;
	Mon, 29 Jun 2026 16:04:07 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weESr-0000000FA1e-1E8x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:04:06 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-806449d108aso42342287b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 09:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782749044; x=1783353844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jg/Wh4RVlcGrE6Wa1eMp9aCyVAjW1OJpvCqAyR9yWrM=;
        b=ROrBrZhVGavfvOSR1Q4nJ5U02t6HBn4KIZxBP9Wa+FYMJVKE+wV42Yo0om6xMdcOx6
         CaipPNbczodbhuAL0nEDrqcP4+g7WcbZ9OzDr8DXyqM7rbubdIkxixM4kaIX6Qjl5Hmh
         wJgybjXgYMKai0yQqjWy7agYs8cwbVByMYh35/WhM08YffsG6HU5vaoJkJd9NUVFg8+O
         qfZIM/aH57eCU2lDnzvJC6bts9brR0fo7UTbXkX8fn5eYCd81D3e3Jfo0Qi0ZmsQ6YqX
         p6BZQbl79942zT4VVgS6x9FnCkVoOeu0XC+7yRU3qo/9Qjal30tWG1Cm2aNw28j+H1in
         ptlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782749044; x=1783353844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg/Wh4RVlcGrE6Wa1eMp9aCyVAjW1OJpvCqAyR9yWrM=;
        b=JqQckJLY+3JqGa6ZsOvtZ3Asi5t4k0SwmqsJ4e3xHr/t/LHOpuPfsxYCwBhQqR4euv
         FTsMOGFnfcEbjy3pESVlAu39g/OKxzXmtKsYvY03hp0psB328d2ZdofFwnxAfpd4keq0
         bP0qpPC0MHu8z/+4QHXi7ZzqhZnHyQq3q/5q+xj8lpy69y/SwS3qct38zTWCicgUFCXM
         NIqPX7tea7JnmWt2D/suMgCbnTcymLGT4aBPZv24CADpvLUvPlkPGD3UkuKerl5xdXFb
         fEKGA63ayJNNOTRnVxb4NwNHaKDsd25MVa2OxEVPLYB4vusTXOlyED2v1JsimmdXkLAc
         Xfzg==
X-Forwarded-Encrypted: i=1; AHgh+RqvEFttZxAl+Lb9/R1+/oTG1ywz8ST7tHyQlE50GtncVYrS8svIwMcIzvhV9aoI+SuAV12lTxg9wj0zmRpt56Vj@lists.infradead.org
X-Gm-Message-State: AOJu0YyECuoo7fi+/wyqOwXIcnJYsxbdEJRmL3DqoFPZDbKO3RC2Z9Ig
	qdw6MxomsvD5cRIbyrzL5OAtuFasmBWZq9KKeo0HRtOV1ecCP0WJSJkg
X-Gm-Gg: AfdE7cljkoRrOQcpjIShxWywy0dIfRWE20lBCom8zoom2JzAxbHvC28gwyD/eL3Lfwd
	z/GEsy7dXw2rMjCSp+Q12JKDZcuy4ez7VLPCXmMxsz7tmUYdO1OFhzRp8JNETV30n9c3Zo6jZcj
	rbhsFmhl01d/gY++p81CPML8gmnRnKl0Giw5TCtjKfrMMa/lARZYUlqCq5lEfFMux/Bq3sGxeG9
	R5A7gcYLs/ZkGJWgES3lgOOHYcu0zYlCDWJtX2i6y5cohe030jknQ1yEz2NKUQZbpwJgpqBBcnI
	mhviokg9cmHL6kYqYQ8N6IzsTodE9TD+Tu9JCcO2kX72bXIQv7sV7iyJxlT+wyOMtqD31rVOcAU
	UU91Z2I4sr+sO7AGK/n8hOkSh67Jylr4d85eVWZExcKxLwhc6Q0O3LYObSXp3QMO+QzblgBUPot
	XnyBNrzwC0khC60ur3xSUkDSwxhA==
X-Received: by 2002:a05:690c:6186:b0:7e1:fbf:aa7f with SMTP id 00721157ae682-810d9d0aaa9mr1518877b3.34.1782749044039;
        Mon, 29 Jun 2026 09:04:04 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80e3ca61016sm20914017b3.32.2026.06.29.09.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:04:03 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] raspberrypi: vchiq: free recycle buffer on thread exit
Date: Mon, 29 Jun 2026 18:03:24 +0200
Message-ID: <20260629160324.29221-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_090405_331610_772BFA45 
X-CRM114-Status: GOOD (  11.53  )
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

recycle_func() allocates a bitmap used while processing the free queue,
but returns directly when remote_event_wait() fails. The normal
kthread-stop path also exits without releasing the allocation.

Break out of the loop on wait errors, free the bitmap, and return the
saved status so both the error and stop paths release the per-thread
buffer.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
index 48d6b1d74329..f8b2d4b1a30e 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
@@ -2346,7 +2346,7 @@ recycle_func(void *v)
 	struct vchiq_shared_state *local = state->local;
 	u32 *found;
 	size_t length;
-	int ret;
+	int ret = 0;
 
 	length = sizeof(*found) * BITSET_SIZE(VCHIQ_MAX_SERVICES);
 
@@ -2358,11 +2358,12 @@ recycle_func(void *v)
 	while (!kthread_should_stop()) {
 		ret = remote_event_wait(&state->recycle_event, &local->recycle);
 		if (ret)
-			return ret;
+			break;
 
 		process_free_queue(state, found, length);
 	}
-	return 0;
+	kfree(found);
+	return ret;
 }
 
 /* Called by the sync thread */
-- 
2.54.0


