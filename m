Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D313F483DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvFV/sENwdGTW4IuMAnR3v5SRp3rVtVMFXWSWmq9Pi8=; b=tf1hSYUGppba0CZhjrQmhMeKdR
	wwOmyTFIYnhisFkjvGbboao5KPq3Qhx+rmmOGvgeGMFdsYXslAo1mUfCCtS7b6bYuAtDjC39EAqqP
	e/VKb+BGB1jcPElYcVojSBS0BWo7nkjQj+X4DIj5u4NbKsjnKeqCp40EjBoMKtaX5as0hG3wWF5xA
	PKp7VxX/B7BGg/kj8OT73ierEgrJT6oBGiV9MZ5Rfgdf06hs+IR/4Ez/PNjJ2fTrh3k8N6M4kW6wO
	c82Y0lJurLsnFqUflqWRqrNDErsf+aYhrImNxk7A1KaBP8mnlqOsEX3u2PWCJYu7oSKC0wp3QVm1K
	ZPbGObUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jTg-0000000HHA7-13vz;
	Mon, 23 Mar 2026 17:54:12 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jTa-0000000HH5N-2Oqi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:54:07 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7d7df10ae0bso31706497a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774288445; x=1774893245; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QvFV/sENwdGTW4IuMAnR3v5SRp3rVtVMFXWSWmq9Pi8=;
        b=WzMJc4Aj1inj5S3xL7ZtB7IkmxDq7zIa9RwYZHse8ysCEKRqLve/MIB7H/nNVOv940
         LBHp1dbhZ7zwjgDpj7oK2n31AzfaQe+S5B9y2aAAVMIeYJChG4Y1ZpgSXZ04UBAzOrJT
         QSAF5PTBfvHz1hUtzgu0ryWyqQsdRXAcu/auSVZkKpVcYJAiywZ+zd/VXd0fXQlos73K
         YeZL1kmKH82Ymyi/ZcwLABRkeAD9yhGnAE8PIqyuG95y5PA4A52OrcCwrBnf53HmHh+C
         p1DWDyQw3OILBkIt+Qq9xBs1NaCOxbfABL5CKsAjrJSFEb4KDxahDwCTd/qNkJnNsCtH
         s1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288445; x=1774893245;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QvFV/sENwdGTW4IuMAnR3v5SRp3rVtVMFXWSWmq9Pi8=;
        b=NWH4PkyHQNfyxXMLE0DDuburtKOMDVBQj4M4yCAl6hQ+5L8dckNfK1LgCiQGG0ozKf
         3DZO9RFjOE+uQqopWjqkytKI8cDg2RUtXjI52/Q4LDm9ynM1wOwVyrwbqC/3DCwIcBWI
         hJ6XFtnaAG/fnwEnjj0kpRfHiV8GB6soStR3ebMs2XYo3gfmOLD8BYGo9G5dvrpAHvvJ
         KJt9G1qteb/EkVlZDj/Qji4foLKJ6QbVLuGTv6ywOAvNp7yp+Uiv1q6Ryn8PDdYwsxMm
         CFZoCMZZV6C5oeb4T9tmlKNGCS4+46pj3wLXn1CffaGOn3Apo+9Qav4gIxh/742YfnN+
         y6jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSJ1bdpms9J0kc2P9QufY4DQ+n3a3ky4oHSt/leSDFu65opixtaLBtUTjrCe02duB4j24wZn+9HKLGiExmnB5l@lists.infradead.org
X-Gm-Message-State: AOJu0YycDKdpHd/VkplIwNkLbsOMUVSM1g2X0+89CpUQtagf7++3XQeO
	JYaJ3aIJG0vD/Vst+83QvC88cbElWMIhK/mdPuvQ2mTowx/YQqGGhfrT2gaH91WWMZhInCli/ri
	7T55qEw==
X-Received: from ilbbq1.prod.google.com ([2002:a05:6e02:2381:b0:4f8:6375:8930])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:174e:b0:67b:d754:9524
 with SMTP id 006d021491bc7-67c22f4ed5dmr9551868eaf.36.1774288444594; Mon, 23
 Mar 2026 10:54:04 -0700 (PDT)
Date: Mon, 23 Mar 2026 17:53:38 +0000
In-Reply-To: <20260323175340.3361311-1-avagin@google.com>
Mime-Version: 1.0
References: <20260323175340.3361311-1-avagin@google.com>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
Message-ID: <20260323175340.3361311-3-avagin@google.com>
Subject: [PATCH 2/4] arm64: elf: clear MMF_USER_HWCAP on architecture switch
From: Andrei Vagin <avagin@google.com>
To: Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Cyrill Gorcunov <gorcunov@gmail.com>, 
	Mike Rapoport <rppt@kernel.org>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, criu@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Chen Ridong <chenridong@huawei.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Eric Biederman <ebiederm@xmission.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Michal Koutny <mkoutny@suse.com>, Andrei Vagin <avagin@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_105406_619196_9BE39027 
X-CRM114-Status: GOOD (  13.44  )
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

The HWCAP bits have different meanings between AArch64 and AArch32,
so HWCAP inheritance is not applicable when switching architectures.
Inherited HWCAP vectors can lead to unpredictable side effects.  For
example, bit 0 in AArch64 signifies FP support, whereas in AArch32 it
signifies SWP instruction support.

Fix this by clearing the MMF_USER_HWCAP flag in SET_PERSONALITY and
COMPAT_SET_PERSONALITY if the architecture is changing. This ensures
that create_elf_tables() will use the default kernel HWCAPs for the new
process.

Signed-off-by: Andrei Vagin <avagin@google.com>
---
 arch/arm64/include/asm/elf.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/elf.h b/arch/arm64/include/asm/elf.h
index d2779d604c7b..2049d42e2e6a 100644
--- a/arch/arm64/include/asm/elf.h
+++ b/arch/arm64/include/asm/elf.h
@@ -160,7 +160,10 @@ typedef struct user_fpsimd_state elf_fpregset_t;
 
 #define SET_PERSONALITY(ex)						\
 ({									\
-	clear_thread_flag(TIF_32BIT);					\
+	if (test_thread_flag(TIF_32BIT)) {				\
+		mm_flags_clear(MMF_USER_HWCAP, current->mm);		\
+		clear_thread_flag(TIF_32BIT);				\
+	}								\
 	current->personality &= ~READ_IMPLIES_EXEC;			\
 })
 
@@ -223,8 +226,11 @@ int compat_elf_check_arch(const struct elf32_hdr *);
  */
 #define COMPAT_SET_PERSONALITY(ex)					\
 ({									\
-	set_thread_flag(TIF_32BIT);					\
- })
+	if (!test_thread_flag(TIF_32BIT)) {				\
+		mm_flags_clear(MMF_USER_HWCAP, current->mm);		\
+		set_thread_flag(TIF_32BIT);				\
+	}								\
+})
 #ifdef CONFIG_COMPAT_VDSO
 #define COMPAT_ARCH_DLINFO						\
 do {									\
-- 
2.53.0.983.g0bb29b3bc5-goog


