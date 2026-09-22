Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E87C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trFjpGYQm/7aTKy/U9BT2hK3u+qGHDDjAWvAmM0cDcw=; b=e9bSFbUxCybezjlA+B/uMvaET3
	R3xcQH5En955D5nSc4kt23bZ3lQyrhG++E4Ma/kSLSHo2eioNJhIJ0iN4uvJdKFVQyIkIkT6ZtG2q
	3vgbbwtKK4E9DkIB6VXvSTzWODwGJnstmmG0IeTOxSVSn4dv09BTpbWmoISJPe8M7cKKpmKGKMRUT
	XHFMjZMiEAw6Tkm0JNuHs6SQso+5dS6tJb8XTa7gwycnXdYONW/HZiF3vzKHHJclADxNX3zDSQZpn
	6ETReEPvNGt634sY0vzqlhRfUciM99pgGAz3Kq6Xwrz3frhJYdRsE1mHcRTmX7fdz9vOv4506smmk
	XWgFvFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Mt-00000006DBv-337j;
	Tue, 22 Sep 2026 17:33:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Mk-00000006D5c-0AQg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:33:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49DA01AED;
	Tue, 22 Sep 2026 10:33:09 -0700 (PDT)
Received: from [127.0.1.1] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 616B73F86C;
	Tue, 22 Sep 2026 10:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790098392; bh=PeJQ7fYXLGcw4P0kvfY82twCI/k6VJB344U1K7tkEMM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d3xeuRYT+klOzNDSyNdM3rcbkRZj3fdN5cBa1D1YwCIZyxd+7f7Sy8BgbNUmU5al1
	 3s/0EsafMWeY/ZZrmT+pw9w6TaZJeLQe8kr+7niH1ZmkhigzCVK9Oe/kkhM5HFTKdQ
	 LdRNH7rjihzI3dDQ1qhnr2R8GM6p9/Ohat1pmPv0=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Date: Tue, 22 Sep 2026 18:32:01 +0100
Subject: [PATCH v2 6/6] arm64: enable a distinct type for HW PTEs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-pte0_arm-v2-6-a3f1ddff0a8a@arm.com>
References: <20260922-pte0_arm-v2-0-a3f1ddff0a8a@arm.com>
In-Reply-To: <20260922-pte0_arm-v2-0-a3f1ddff0a8a@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Muhammad Usama Anjum <usama.anjum@arm.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_103314_123464_09707B9B 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

With HW PTE pointers and direct HW PTE accesses converted, arm64 can use
the generic hw_pte_t wrapper instead of the pte_t alias.

Select ARCH_HAS_HW_PTE_T to give HW PTEs and SW PTE values distinct C
types.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 2bbeded33da0d..42841d5e2ed26 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -31,6 +31,7 @@ config ARM64
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
+	select ARCH_HAS_HW_PTE_T
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_KERNEL_FPU_SUPPORT if KERNEL_MODE_NEON
 	select ARCH_HAS_KEEPINITRD

-- 
2.47.3


