Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF863D39417
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 11:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/wh742VMTWlWH+slgubSz+moLYFABAfaF0AWY39n6Iw=; b=onIUAcMZW8H0wSdbHTFmRbD2gB
	SY4hHmy+krKirKxN6gvOWFE15UGb5ajzu13XfXnF7neJwKKjvKkvPTqLlp+dJ8kTxItgOxaTzfLrL
	IkirWXzkVdoRpAvNkyz5Wh6NA8qZLtikPUglc1RySgvH5AQzG//Cy3+JDU0eBWhITutqMV/gIZHPF
	Q7IlGziTXrncFZwhWMsDl/Dv36mYdtKrt4tvNE96xEsl8bivEdyFK+/nuMrnk1ZyvhbbYiMTh1NwF
	CpdhlIFpXEL4QGUvUUSV7augptjcrETjaa42ATMPlQy0Zx6C+VOgI/QAfR2fNErOldjBuMsj1FC5y
	ms0ZN3Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GOt-0000000HXQe-025s;
	Thu, 02 Apr 2026 11:39:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GOr-0000000HXQV-2Wqz
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 11:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=/wh742VMTWlWH+slgubSz+moLYFABAfaF0AWY39n6Iw=; b=UghsYfkLma4cEYsE3mF5vplGh4
	h1eQbOPU9GFqofyMYoTEnGzO+uGQHg4yogA81nUOt25i7y6Q/fhLnTLrOd8mixbwJkhQPQ6TvHj51
	8+Af98SY7RcyfnYp8w1sOwAusx63V9QDuxZvozkrTaJCa/t8l7f3uVJzdOEbb/gOHQGK9pHWiNLhM
	RPEPGYjL8WGq9p1QO3XQiGxgvbho8ma7/bb5WE+9Ad+HPmlKoahytXVbfWVcRqMDHzkPG3+Y0egXQ
	NqQ8Dj5cLR9TFBeeDCLwWis7TEt1w88TfQGiRBn5mPym2qG8iMpoNsC+IdthKQog68tkl6BuHgRSY
	JKs0/1yw==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GOo-00000002LTY-1Q56
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 11:39:48 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-486f830f4e4so7654555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 04:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775129982; x=1775734782; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/wh742VMTWlWH+slgubSz+moLYFABAfaF0AWY39n6Iw=;
        b=WBUYyrdEkYdrfpUNJELPgZ1xuFFf0tahR3xZCje4VyUNBgrO8T6R9DNVxzF93xHxkU
         SWi9c/yfupr4/XJcH9aNjpDOIGpuqUQMaMgKgwhxPz+dAcDmFR2EY40CJyu022ZvbOeu
         eaBT3Tv27VhBZKBRgpUfRx7JW5LYYLBDcTGacvg0YedI76VjF+F01Hc0UboQvuKr1vQK
         bBEc/uVhQYdx7FfAjuBZFc/mPHm5gWGGl/9Lz1E0YtOYtFU+YEZ+xqfqYhATb2S2Y9QO
         QK4v8ActsO4jpuWsDbSrvgO40gYpyjMDDNdmufgY8C0uMIm3ZdBcE/HeHFqbHNCadSiN
         rT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775129982; x=1775734782;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/wh742VMTWlWH+slgubSz+moLYFABAfaF0AWY39n6Iw=;
        b=Mbc0JVifwpBAvhtVlQviSO9N6KVF6VLiuW2IqlCZ78GQ4G1M7RZSZ9uYbyHOkyoexm
         BryP4qFIjmgktU6FNA9b6duzHTF7qUHBRJ2k78MizucdiY0O74HJ7UhkYW2WQk3FCVVB
         OvJX0jFZWnU0qhxUBMBWj0isFWyYyzsAlxmM5JSw7s57SD+Qj1ByGr3ngEGY/5e2NEl7
         B1Sm8hBEksYApWW/ku7H951OwO6UszVXqH/vCeq8TEG0twc0ozfJoInZmOXymNVVlWIJ
         Bgefr2tD8OvXNyB5+VtB5rHu6WwtCEz0Lu5/H4G9vEibopvsdYYU8Wf8e1EGNISTmp7g
         vuZA==
X-Gm-Message-State: AOJu0Yz6G0lHqaAXK0Xro9MzILRg9VphFr9g24gd69hltC3XPlofFpqB
	hBwPD35p8HKnQlwZWpWeBR+BzEReamk1/vC9uAH22arjqbHomiAbzB3LaCX+kXEiN0CGCg0z/pI
	MFlkav4ocIWeSek8mkziiaOXNAJbPg2FTEGp0TbR4aX719edI5KeEngwOH501E/NplOTYxRJAik
	YEdrkNRxrbAO/ABl9R3aRSrkwj9QBe9rEUDhGgrlLRRWhFxo4Sw/+XtKC46Vue4S0yD/W8pa1Ax
	J0MU/ieDDsRB2o=
X-Received: from wmbjg9.prod.google.com ([2002:a05:600c:a009:b0:488:823b:4cf3])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3516:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-48883597ccdmr109213475e9.14.1775129981835;
 Thu, 02 Apr 2026 04:39:41 -0700 (PDT)
Date: Thu,  2 Apr 2026 11:39:39 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260402113939.930221-1-sebastianene@google.com>
Subject: [PATCH v2] firmware: arm_ffa: Use the correct buffer size during RXTX_MAP
From: Sebastian Ene <sebastianene@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: sudeep.holla@kernel.org, Sebastian Ene <sebastianene@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_123946_669762_1497996B 
X-CRM114-Status: GOOD (  13.13  )
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

Don't use the discovered buffer size from an FFA_FEATURES call directly
since we can run on a system that has the PAGE_SIZE larger than the
returned size which makes the alloc_pages_exact for the buffer to be
rounded up.

Fixes: 61824feae5c0 ("firmware: arm_ffa: Fetch the Rx/Tx buffer size using ffa_features()")
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
v1 -> v2:
 * use the correct macro PAGE_ALIGN when calculating the size of the buffer
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index f2f94d4d533e..eb2782848283 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2078,7 +2078,7 @@ static int __init ffa_init(void)
 
 	ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
 			   virt_to_phys(drv_info->rx_buffer),
-			   rxtx_bufsz / FFA_PAGE_SIZE);
+			   PAGE_ALIGN(rxtx_bufsz) / FFA_PAGE_SIZE);
 	if (ret) {
 		pr_err("failed to register FFA RxTx buffers\n");
 		goto free_pages;
-- 
2.53.0.1213.gd9a14994de-goog


