Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15826C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHdnrOMTEMmVzp+pvECMhkQzT5sYapzKlQc+uABWu9k=; b=AxEeKoXbp4Uk9ZHnwR6IYhDtOu
	5C/uEY2YVXZXNy9pcFce6qr4dPeSS9PtzVgH7eVpXbNUiCqN2HrMJzRh/P2ofqM4PYJJe9L0nhDru
	AIX6IDd1vVf8F3I8HXjHbqiSADnJqE0xPZNF/izErmDt72r1F6zNpyRmCp+dFiGrxAdvzygN2rvHK
	cPOCJcJ9bCQ4nkHwOynRi12fUEo7rMOOUT0Dj4ZGm66comxWtKxIxVdNJ1gXlUB4u9eqTYNXU6P5R
	w8tyI0UjrKNZjcYbDE9HVgAHU6UWbJlScSo0U6dX3sX7tIlaZjL4r5cDvg/B/+9ail1TAG53Y4FRD
	oAboO82w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXBp-0000000H0Wu-3cIz;
	Mon, 24 Aug 2026 16:06:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXBc-0000000H0LO-1SjT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:06:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E38FB176C;
	Mon, 24 Aug 2026 09:06:07 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 885403F85F;
	Mon, 24 Aug 2026 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787587571; bh=Rwi4AzekxF8PcB6UHH8vOzSHeIKlfPuKVBoBNngyqjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dJsvLuXExRZfSJVbv3K6HCiW3BR7TJXaVrPv1IYrS8GDrZipSySzPSoKX1sDg/TLi
	 rcgwUtzijkwFuJ82JRFRbQoUfk2VhTL8yreQOzRe8wWaiRJ4JRUZTANWfRepEescVY
	 U3NBHGGKRha8TpysreQuCpCiYPx/pdEPgbg4PJ+s=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kernel@vger.kernel.org (open list),
	bpf@vger.kernel.org (open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT - CORE)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH 6/7] bpf: Skip setup for zero-length string kfunc operations
Date: Mon, 24 Aug 2026 17:04:52 +0100
Message-ID: <20260824160523.3907021-8-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824160523.3907021-1-usama.anjum@arm.com>
References: <20260824160523.3907021-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_090612_459259_958BB837 
X-CRM114-Status: UNSURE (   9.76  )
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

A zero limit is valid for several length-bounded BPF string operations.
Their loops perform no load in that case, but they still enter and leave a
page-fault-disabled region.

Return the existing empty result before changing page-fault state. Keep
address validation first so an invalid pointer continues to return
-ERANGE.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 kernel/bpf/helpers.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index b3cc5c8fc8756..3574a9a5721ec 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -3738,6 +3738,8 @@ static int __bpf_strncasecmp(const char *s1, const char *s2, bool ignore_case, s
 	    !copy_from_kernel_nofault_allowed(s2, 1)) {
 		return -ERANGE;
 	}
+	if (!len)
+		return 0;
 
 	guard(pagefault)();
 	for (i = 0; i < len && i < XATTR_SIZE_MAX; i++) {
@@ -3837,6 +3839,8 @@ __bpf_kfunc int bpf_strnchr(const char *s__ign, size_t count, char c)
 
 	if (!copy_from_kernel_nofault_allowed(s__ign, 1))
 		return -ERANGE;
+	if (!count)
+		return -ENOENT;
 
 	guard(pagefault)();
 	for (i = 0; i < count && i < XATTR_SIZE_MAX; i++) {
@@ -3956,6 +3960,8 @@ __bpf_kfunc int bpf_strnlen(const char *s__ign, size_t count)
 
 	if (!copy_from_kernel_nofault_allowed(s__ign, 1))
 		return -ERANGE;
+	if (!count)
+		return 0;
 
 	guard(pagefault)();
 	for (i = 0; i < count && i < XATTR_SIZE_MAX; i++) {
-- 
2.47.3


