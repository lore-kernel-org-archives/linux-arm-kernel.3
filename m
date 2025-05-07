Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F29EC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Y9rpyN4yLEJrlewSRVGRCn2URs38bBszmjv7HdQYkM=; b=zmipgqMFhXNe+7vhJcIhzXPSED
	VfR9u+agd22PfADIIIBYfd0rIp1ZCJYwyOvWGrdVdFIpXc3tzTEMkK9MMdhiG+4PyzcvjItNtTGXe
	Xf5k6ulAwjjXnrmQ99QA17tjdgvHiSnas2E1DG12fnmtDehTgcAiDzVHIHT7Q8m94h3vNHX6AUo7p
	rGbWnxAJuj9B2vGC/VRgEOwiv4It32cFSwJToRfM6430fZ8vFBo+j1GsaJa0aRt+sWuvOp2GqouAR
	FiaPSM2JWVosz8D4/8YXm2cWtF0hVQqxQUhs6kiGQvArs/Ptc7wznkCVLO6AO557uB59sEfuLLPE9
	pgXqXccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeo5-0000000FZS4-3NF2;
	Wed, 07 May 2025 13:27:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeXZ-0000000FWGU-3LJm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:10:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so8096115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746623424; x=1747228224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Y9rpyN4yLEJrlewSRVGRCn2URs38bBszmjv7HdQYkM=;
        b=Prm1FIqhzfZJY8spXM8FSHVkkHhDsJveR05qge4sA1HJFEKbKU0LTRNFnLfaHPljB2
         OiLrSO8+81LxC1OerF0ORal+jlD71PezT+vuD351FyYQ84WOEFu+exzaJnG17rfv5pJr
         vXg3GC4w+wKZsxAQSdt/9L5grc+4blk6PkX9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623424; x=1747228224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Y9rpyN4yLEJrlewSRVGRCn2URs38bBszmjv7HdQYkM=;
        b=ejjXob49YfSabeTOkI9FAsBxaEj2rdyqrIIaGuPTilTEYsduEbSmjmXsAFW77fNPup
         DJcaX1X+32KFrzn3+0XuJB4wBvjuGfzLPrsfhaXoM0tDE7Ox5JB59Jz1z2OZKxSuUKKb
         VrVoW4gYs7Wt0Pq70BS8I/bmkCNLwp52Ix9nb8Jc8oHfvyefxJfLnQvi2mBz3JPrEwcL
         FNIyjrj2n9n02pkZti6Q11DIsl+YqjBmmCC4m9Dughb1Bke1J8/oV35FH8NjANJxVmeS
         CyHhbx7PILu86WW0woDLBE+pHxde5SrSfPuJC2nkafmpE3l9utEgDyF0s1zGbggSTcr7
         fXEg==
X-Gm-Message-State: AOJu0YwfoPvtU26z8kKEUI3zOYug+8MxEDo9HUAalRzAECSPTlH7GMUS
	r8RfoF2K9dRh11TkWz9YTwxR41s6Ot597+4QQlzVky3TTNJ6odIR+R6n5m/nvgsdaJacjlqvWFL
	E9Q==
X-Gm-Gg: ASbGncvYsQSoL+Ybv6cEBO1wKmUhQuALD65UlD4nof6ypFWjMy2auxOMi+xY+U3TSp3
	YzWM7uvDjF+iRqWDZfmWAgjAhJZmZ40hojFTw0jifyxjA5+Q3HVaG0KoROT2nprh7g2ss2W0qLL
	/ORx54nXK6woyulOaCf8qz9uw8wDSWN2jV+hAkGgFlDQaQdluO+pVVL0sCaEDelQxHOPJmGxtsz
	wGTRyo3lmXXe1sxps4FvgQpECxJLmRTQ6uLGsJehcirR0miQoZobogcH7VVwqVh8mXvULkfxK5S
	5pGYr5VpBQrjEpM2KDnpDj95bz3kBPBuB50I1FxH8yU88Kjsr0bvfKJB
X-Google-Smtp-Source: AGHT+IGAHrJrwAiLSC3RwdUM1dYZaf33fAuwlrAULQijJUqxqu70I8Scjch/eI8CbDwOeg7SeJPHZw==
X-Received: by 2002:a05:600c:4ecc:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-441d448cab2mr10128165e9.0.1746623423817;
        Wed, 07 May 2025 06:10:23 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:558d:e1fb:c2ec:7513])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32adcasm647435e9.6.2025.05.07.06.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:10:23 -0700 (PDT)
From: Florent Revest <revest@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	thiago.bauermann@linaro.org,
	jackmanb@google.com,
	Florent Revest <revest@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] mm: fix VM_UFFD_MINOR == VM_SHADOW_STACK on USERFAULTFD=y && ARM64_GCS=y
Date: Wed,  7 May 2025 15:09:57 +0200
Message-ID: <20250507131000.1204175-2-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
In-Reply-To: <20250507131000.1204175-1-revest@chromium.org>
References: <20250507131000.1204175-1-revest@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_061025_834080_EDA54205 
X-CRM114-Status: GOOD (  14.43  )
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

On configs with CONFIG_ARM64_GCS=y, VM_SHADOW_STACK is bit 38.
On configs with CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y (selected by
CONFIG_ARM64 when CONFIG_USERFAULTFD=y), VM_UFFD_MINOR is _also_ bit 38.

This bit being shared by two different VMA flags could lead to all sorts
of unintended behaviors. Presumably, a process could maybe call into
userfaultfd in a way that disables the shadow stack vma flag. I can't
think of any attack where this would help (presumably, if an attacker
tries to disable shadow stacks, they are trying to hijack control flow
so can't arbitrarily call into userfaultfd yet anyway) but this still
feels somewhat scary.

Reviewed-by: Mark Brown <broonie@kernel.org>
Fixes: ae80e1629aea ("mm: Define VM_SHADOW_STACK for arm64 when we support GCS")
Cc: <stable@vger.kernel.org>
Signed-off-by: Florent Revest <revest@chromium.org>
---
 include/linux/mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf55206935c46..fdda6b16263b3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -385,7 +385,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
-# define VM_UFFD_MINOR_BIT	38
+# define VM_UFFD_MINOR_BIT	41
 # define VM_UFFD_MINOR		BIT(VM_UFFD_MINOR_BIT)	/* UFFD minor faults */
 #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 # define VM_UFFD_MINOR		VM_NONE
-- 
2.49.0.987.g0cc8ee98dc-goog


