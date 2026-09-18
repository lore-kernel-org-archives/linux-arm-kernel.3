Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CFAC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R10EWAoqeqiwKYs38V4/eu87hmfK6YBmKaV1HjMgWDg=; b=rPHDJdLA3cD3F+vSnbtOBI3q1/
	hJwLBig5OwYVxNjMjOO9Dqr0qf6NdD/mXPTHcWqAOSmKanRX5GeKdTU5MD6MISTqmiNscYVOv3pKA
	DMlxLmRDbXmwMOUcDkOPlrGx3M2ycpqv1qr4eE1+VLMmI1E/tsn2cpBKBnoJjGq5SEvSQVPhLfiEY
	SQ7bXLRfc7Yt6Z9Bu4Xlt0ZCxxztTJzmTludQfPgMm7eP4ZZx5T9AoXkDfgt9gtJGCT/4Bfni/hHV
	Qe3Qp0wYugjibZPv+0LRzca0jCwbmtG6QsgItHPjbZ7vw9Dw4bq0r9F0ioYQRyRkJ/fzGaBu/jQb1
	VQkOOTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YUh-0000000EUEd-48KJ;
	Fri, 18 Sep 2026 13:19:11 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YUb-0000000EUB5-1RyG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:19:06 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4955e865174so4565435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789737543; x=1790342343; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R10EWAoqeqiwKYs38V4/eu87hmfK6YBmKaV1HjMgWDg=;
        b=TAjtB2L6ts3EwTd6IaNqAaSTlmtFMANPR1TxUbVSOjq00/dZLvhUZHddqECJx+w4Qh
         6o9OXf872/YQbbgjFPwizwYrQ2J2ao7m4E++9FWMI1gyQSFPsY2UpEp+bb3UPKN/pycd
         zUkKg1FjrsuL6RQzbMiJp8OKqXVe8Oj0m9RqSirwj8vhPk2cn4Lk+xwhrAny/2uDfg6D
         Bb7V9MNNMhfZFVMtUd2wOvTNbO0a/HWn2UW9oebptzLhL7xWpyTXGlabr7VbZztPpTbg
         SCG0Spxg6GngIhwrCZRox8y6VXNLac+btY4NcHESVwPWax6/U2BVEZvvV25kItAoCez+
         v4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737543; x=1790342343;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R10EWAoqeqiwKYs38V4/eu87hmfK6YBmKaV1HjMgWDg=;
        b=dfc7TmeFo7kXh0ep8vROxChPnGH2wCdDeYRWZiUa/55VxUiQXxWNBpXMr8bYqKgaeo
         b1rQpIxPjO8h7QZyNqTMp33ZKI8nOI3JIq6KaM9VgJgsS0cXOIf38mVgdUCcc7IkSBmN
         IWbsRNxmb31ocBxSIhaRFJ58LEZo7Xu8TtmRTUb3qOMkQPXPQbVpdNwQjiNHZ79bc3au
         6hhZXJyssafN8RV3dRcbYNJTviPVgGji6wdmLPRI/f88KRhs5aI1CP5t3wFknBRXTgNw
         PTWV16SSMkKR+TDhEf7NzRC77P1qotEtlwA5lMMZH01tpLn2uGJRTuH9uH2NH++XSC/i
         eUlA==
X-Forwarded-Encrypted: i=1; AKwUvBzy/lzEvwrQigRTzmcS5bK7R6wDEx2Qe3dR3zW3j4J4289raB0IEQIlqXh4Pckg2FiU95f6krs/8CKK8M1j4DNe@lists.infradead.org
X-Gm-Message-State: AFuF++k2DEG4utrD+yXqVzJUg6kvv2Q4MUa6NYE+7cZbCtZMsf42+sy9
	fRVOsT5Co4sSaQLxhGY3xh9R4Lk12qE+wMIMX0Ztyf4LNmJJeds4/MD0srr85TxvuaAi+UaXedx
	U+Q03DopsyuKZIGfmd0f6rA==
X-Received: from wmsl26.prod.google.com ([2002:a05:600c:1d1a:b0:49e:6680:860c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1993:b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49fc56dbc54mr34667275e9.3.1789737542981;
 Fri, 18 Sep 2026 06:19:02 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:16:54 +0100
In-Reply-To: <20260918131656.3710047-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260918131656.3710047-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918131656.3710047-3-vdonnefort@google.com>
Subject: [PATCH v1 2/4] arm64: hibernate: Use fixmap for hibernate_map/unmap_page
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org
Cc: mark.rutland@arm.com, lenb@kernel.org, pavel@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thierry.reding@kernel.org, rppt@kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_061905_399488_AD33865D 
X-CRM114-Status: GOOD (  13.57  )
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

The default implementation for hibernate_map_page uses the direct map.
This creates an unnecessary limitation for BBML3 enabled systems which
can split linear map blocks and can enable memfd_secret users regardless
of the linear map mapping level.

Block splitting acquires a mutex (pgtable_split_lock) and as a
consequence is incompatible with hibernation. We know hibernation would
only call set_direct_map*() on a PTE-level region since it was
previously split by memfd_secret. But let's avoid special casing
hibernation in split_kernel_leaf_mapping().

On hibernation, do not modify the direct map and instead use a fixmap,
better suited for a transient mapping hibernation needs to copy the page
content. It removes the need for handling atomic context in
split_kernel_leaf_mapping() altogether.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/fixmap.h |  3 +++
 arch/arm64/kernel/hibernate.c   | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
index 170c3502d723..c8a65fd8584d 100644
--- a/arch/arm64/include/asm/fixmap.h
+++ b/arch/arm64/include/asm/fixmap.h
@@ -73,6 +73,9 @@ enum fixed_addresses {
 	FIX_ENTRY_TRAMP_TEXT1,
 #define TRAMP_VALIAS		(__fix_to_virt(FIX_ENTRY_TRAMP_TEXT1))
 #endif /* CONFIG_UNMAP_KERNEL_AT_EL0 */
+#ifdef CONFIG_HIBERNATION
+	FIX_HIBERNATE,
+#endif
 	__end_of_permanent_fixed_addresses,
 
 	/*
diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 7bf117427777..bbd0779081fa 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -21,6 +21,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cputype.h>
 #include <asm/daifflags.h>
+#include <asm/fixmap.h>
 #include <asm/irqflags.h>
 #include <asm/kexec.h>
 #include <asm/memory.h>
@@ -213,6 +214,17 @@ static int create_safe_exec_page(void *src_start, size_t length,
 	return 0;
 }
 
+void *hibernate_map_page(struct page *page)
+{
+	set_fixmap(FIX_HIBERNATE, page_to_phys(page));
+	return (void *)__fix_to_virt(FIX_HIBERNATE);
+}
+
+void hibernate_unmap_page(struct page *page)
+{
+	clear_fixmap(FIX_HIBERNATE);
+}
+
 #ifdef CONFIG_ARM64_MTE
 
 static DEFINE_XARRAY(mte_pages);
-- 
2.55.0.1082.g2b9226bbc0-goog


