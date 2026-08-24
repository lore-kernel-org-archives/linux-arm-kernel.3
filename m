Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49874C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tsHM56Af+xS/wSTkYaeejENR/tdpIY/K0Iqzm/97eo=; b=j/H8B2oKraZd/B8Dt70uGi7tPm
	VKLMFBnolE5TwO/EGOZi+0eETWvOBeQ7CQ5ugdw0CTkYXrzq4LZJ9XA9LTLQ5XNjzbJ14bvQbyS40
	SSiz6pgLeln2G6YXW68RWtog1SuWe7rb5sqzmNsqhAzpngwFy8HKe4pfw2yuUSXghDf0v0ocbd/98
	hRiZSdZrMWUkoDVAe08/CPb8zbGLfVChJ8ZeL0Lq3eMtxo4KAn4Qc/yfaR2YLjUPLlTvlHrqDo5b2
	e3t7ZuGKXltEzgQN8g6z6Cs050Y6guPyE8JN7kEInugMgrMdW/OYS9koY4eLjrNaRQwXuom+6MeCn
	nZf67aPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXBN-0000000H0C9-4Aat;
	Mon, 24 Aug 2026 16:05:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXBL-0000000H0BG-1Hmo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:05:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57321176C;
	Mon, 24 Aug 2026 09:05:50 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E50133F85F;
	Mon, 24 Aug 2026 09:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787587554; bh=mAnn8lCC8CIaJdHDU1rhT42Z2WA5jMjaMEMo8Y0pB/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KXcATGYiblCFLHpkpJ3dWLchgVGcO9Fkn7aLt+0hDsnP3bpXXPHFXftjmt7pR58vR
	 2bXx6QlmsEr8OZamAZdP5OCw7v/hT+jfDQRoSou7GvXm1ImM5oCovGMfQyOGW9P/Gn
	 em69FAcrIUlVaiYSuADP1SL6CUzdUrdZlVbQffZ4=
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
Subject: [PATCH 2/7] uaccess: Add scope guard for bare kernel nofault regions
Date: Mon, 24 Aug 2026 17:04:47 +0100
Message-ID: <20260824160523.3907021-3-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824160523.3907021-1-usama.anjum@arm.com>
References: <20260824160523.3907021-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_090555_401232_629718C6 
X-CRM114-Status: GOOD (  11.21  )
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

A batched nofault region must run its end hook on every exit. Pairing the
hooks by hand makes early returns and error paths easy to get wrong.

Add a scope guard that starts the region on entry and ends it when the
scope is left. Callers can keep their natural control flow while the
architecture state remains balanced on success and failure.

No functional change until a caller uses the guard.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 include/linux/uaccess.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 7ae1854673471..b25e778ddc38a 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -653,6 +653,10 @@ do {							\
 #define __end_kernel_nofault_bare()	do {} while (0)
 #endif
 
+DEFINE_LOCK_GUARD_0(__kernel_nofault_bare,
+		    __begin_kernel_nofault_bare(),
+		    __end_kernel_nofault_bare())
+
 /**
  * get_kernel_nofault(): safely attempt to read from a location
  * @val: read into this variable
-- 
2.47.3


