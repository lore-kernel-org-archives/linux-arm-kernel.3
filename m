Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1D0D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JB581+q6d8JNHOaG4/CmEZh7pybRjg32PuHi0tZmZIA=; b=d6ChZtMFbcsjgp+U0us+KK4gns
	pewqn6fWr7bdmmPl3I0I3o76et9n8qY5zKwnSjq3Zo8xQrjddVhDUSahrCFSwwBE3S2LdTgMZueW1
	xs6AQ6GX3G7zdfwee7g3f/cuCwwMZpwD4YuMTw3SDPAGJCG7wxTmRcmFIvAU+eruaRtRrfFIVaU0Q
	GU+cW5fEwyBnB7HGA7tXGZnxljricHfce12F0dbTPWy1U8zbxd0Rk3ZoQdy/C8ivGyzprcr93QXvT
	6DJzohI+NDB1M/Izp9gV9SRfei1kgwn1vQZM7bLmHdEbz0deDhoxZ993em8RLrXPzBa20z/W+h50q
	xMUtyGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYDQ-0000000GHhP-3B4J;
	Thu, 27 Nov 2025 09:23:04 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYDM-0000000GHcO-0ygC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:23:01 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47799717212so3901055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 01:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764235378; x=1764840178; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JB581+q6d8JNHOaG4/CmEZh7pybRjg32PuHi0tZmZIA=;
        b=HE2DtAVDv4sS7Vj7F5XvMn5qzSQW26G47Wv8peJYDqnkCnjKAPxWntiBRlTdhDwAcp
         8Rk2L7gA3+kjUwz4enV5ee4tCzPrXYBGTDPK8OPiGz4/1ebceDjYSgHzL3Gm5w2MjCEJ
         YZjgFMsZrCQ/CKdhAd9G4nCiCKFgytZLNII+lLiWhLrT6t2/cRGlpWTp8GO2D3so8g0A
         M9874c7S9wOf3dxqtMXkalK0G/Ng6IqiksrKoH0c/VOo8aoxRFJmsxzmHpz8qpChwaVf
         C9W1iaTgb0w4vDV1a+I6KUI79pgNiKhKHdGdRC8cumqGkEr4JGNnk6jb7RxyRMvT4OOc
         +wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235378; x=1764840178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JB581+q6d8JNHOaG4/CmEZh7pybRjg32PuHi0tZmZIA=;
        b=ikwdaJWiKmphLcW5q0kJI2gKVOaTrUbeRoU8QuOV6UU8j9Y3qFwHEUMPqyD8RWSSy8
         nglJfUtNiEcUiLgtCuvUJLtLzjJ2GQ1TJNJzCNT3Ts5Vskjx2SL86BLVZ7eRIDnU7ma/
         1fL7yKlScaf35wDfO01r3ZmIdlro4FDGFmVdcM+70c6WQErgWuN5D+j8MTwa7SW8Tv/s
         LF5g5viXjwwEWjSeHIkVopKb0OEkEZXx3pxuFBGnfM5aHBBFFi7BDe1OoMW2SsodGBcn
         zHeF/Y5OHy5lErl09UWoHCblCabGOGGbI+KINumZ0Me74uASBY3QGsFBgP5K9nyKJnAT
         AgVQ==
X-Gm-Message-State: AOJu0YxSq2KP1MffwuObR8R6aTjbVN8SbP1j6g48W58+OjCr7jmCevFT
	AEdM+DOyk0l8b5oapNzoL3XRBxPHJYNbD3agb7oa/X6tC499NhBxsGNVMN4HgIQ/aeB1DnH68g=
	=
X-Google-Smtp-Source: AGHT+IFYv0kogWxmcupk5m1hglVZfqkLWIq7UCyp+YAuGkotWUr1R/Sn1oljNF0wCvZqVj/2EKsscbj3
X-Received: from wmcn10.prod.google.com ([2002:a05:600c:c0ca:b0:477:afa:d217])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5489:b0:477:b0b8:4dd0
 with SMTP id 5b1f17b1804b1-477c1119c31mr210109105e9.17.1764235378167; Thu, 27
 Nov 2025 01:22:58 -0800 (PST)
Date: Thu, 27 Nov 2025 10:22:32 +0100
In-Reply-To: <20251127092226.1439196-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20251127092226.1439196-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326; i=ardb@kernel.org;
 h=from:subject; bh=RU3u+df4cRqtBp/zfgIcQz76smq5xWuDnV7q7Ms5D20=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIVNDIrr465FjPcfCXNcVfxHj4EvKbXd52VbuPb/gSv/TG
 XXn23d0lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgImUFTH8j/4n/GKfxT4FdwFR
 3ZtT2XVftd3pMVD/b7vd89W/09tYChkZzgTY/PHoy9xc3v9lheV8neWin38fWBntofx47Zr7DX8 +MgIA
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251127092226.1439196-13-ardb+git@google.com>
Subject: [RFC/RFT PATCH 5/6] random: Plug race in preceding patch
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-hardening@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>, 
	Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_012300_352137_52D2CAA3 
X-CRM114-Status: GOOD (  14.16  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The lockless get_random_uXX() reads the next value from the linear
buffer and then overwrites it with a 0x0 value. This is racy, as the
code might be re-entered by an interrupt handler, and so the store might
redundantly wipe the location accessed by the interrupt context rather
than the interrupted context.

To plug this race, wipe the preceding location when reading the next
value from the linear buffer. Given that the position is always non-zero
outside of the critical section, this is guaranteed to be safe, and
ensures that the produced values are always wiped from the buffer.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/char/random.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 71bd74871540..e8ba460c5c9c 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -547,6 +547,7 @@ type get_random_ ##type(void)							\
 	next = (u64)next_gen << 32;						\
 	if (likely(batch->position < ARRAY_SIZE(batch->entropy))) {		\
 		next |=	batch->position + 1; /* next-1 is bogus otherwise */	\
+		batch->entropy[batch->position - 1] = 0;			\
 		ret = batch->entropy[batch->position];				\
 	}									\
 	if (cmpxchg64_local(&batch->posgen, next, next - 1) != next - 1) {	\
-- 
2.52.0.107.ga0afd4fd5b-goog


