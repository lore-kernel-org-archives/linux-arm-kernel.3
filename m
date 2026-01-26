Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5F9D74EFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qZ1xUJ54mMbB8pErA6j09+CFNiU+H8FmdGJP4FuLNw=; b=nK0YHFU8aXM/pPl1oSFWBJWHIP
	Sv7eVY6eu9g/hAA9KN/Gzdw1Izvl+0arAU1/ykmBhag6rFUE12hI1zVVJgVBb3i+NwfyT+8AwSyy1
	df+UdZ4vCfFhHD3dS+JfYJ7m2e7VC5B+eBRScSA4ETOFOOWg6rG+y9kZ4yo6IAe3FONEijHeTujTZ
	/g06Do0J2XrKYtz650x+IAlaXa03GKbW9hRD9hptTy4KkhReUo9SX6LipH0aS0GYWD1Qrjoum4M7q
	Jr8IUIgXZ3ptm7fsISK+VNpvF2g+csAdnf5FXg+0HESH7pmQE+yV38sD5C1a27M81rYr5yujabPeR
	AvwRUOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsp-0000000CC3F-1HRW;
	Mon, 26 Jan 2026 09:27:43 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsh-0000000CBz7-1aNM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:27:36 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47ee33324e8so32727175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419652; x=1770024452; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6qZ1xUJ54mMbB8pErA6j09+CFNiU+H8FmdGJP4FuLNw=;
        b=o/JFyzWHMNx3MsV2LBNPwUD/ZPHiufu5p8wTUwfvJAxF48WHf6bLehPMFVN9Qyp9yY
         aNmbkZIA/Qe9GrW4/azaEiUL9Wxn1lFKLAFe6OZi2adgPlr1f7KTkswezIFB/mH3LDWL
         oOtfCb/A+BKydYvLWt17JIvqwJvJVcoxJSMvqfwvydGPfC1XosDTZnvNuLr6qSPiNrAK
         Yyybm0QC2NZS8cLiXGuXITcMy4NcGYkca+0QNdi1y1eW+zgJ0enuYEALSrH7OaDMGPNC
         Gb4E/NaHODGRbjGHtDcMknYQRw4Af4KPoVxsbHl0kJqbua695lkOtbI8UqNmMHlCiS4T
         LzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419652; x=1770024452;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6qZ1xUJ54mMbB8pErA6j09+CFNiU+H8FmdGJP4FuLNw=;
        b=n0WY5/vz2IM8zRStpGF0ninEWbpvcpTSzXmmY6ssvmCd67d3ZtM1UGSUDRpe3wZl3/
         i7sopSGdHlBAchwjqWEhQ37hotrjVVuMDc0cxX9FW414bhJ+eNJczcn3eEBiUgRHt6MK
         TGsefJVxeDE3VJxW0IkxXyWEEFoE7juUKkZ8QL3MnS7Fi//Ayb7ZGIursrDynJZESoTa
         9+SYgLYmicf5Oo5FGyDGpFrtm2PPSJo5Bkr7sYtzUfJokqT9oB9ctIoyieJ87YjhRhtm
         hmQimbDVPAb6SHBwGjF3N13ifHYgDEkdQKgU9uvDSWzZYoXkTmn2b5C5mHj97fSCH0Kk
         zt/A==
X-Gm-Message-State: AOJu0YxfRdhffNg1Mwtq+27IjvZqPQnpMo5rr3G0Y0wHrg7E4ghSYJe7
	8kAk9j3Mq8V6TETtzMb5I6DQ9mbbKLF7+dzDg/kQ7epRRyWgf+SZa1q0AxkopcpRe/D9XJpM2A=
	=
X-Received: from wmjx21.prod.google.com ([2002:a05:600c:21d5:b0:47d:86c6:ebc9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:530e:b0:47e:de9c:92ec
 with SMTP id 5b1f17b1804b1-4805ce4e568mr62717135e9.14.1769419652622; Mon, 26
 Jan 2026 01:27:32 -0800 (PST)
Date: Mon, 26 Jan 2026 10:26:32 +0100
In-Reply-To: <20260126092630.1800589-12-ardb+git@google.com>
Mime-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328; i=ardb@kernel.org;
 h=from:subject; bh=yjZnKOVkP/d2XQBthJ6Tfy6lESqeO+RAZPKDjSMcLNk=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIbPc2P3RrmdrBB/NvJp+yD+g/JFb6zYT/Wk8p612/lZou
 XuN0cWso5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExkgyLD//JNB8KNeT646Wy+
 JbN44ZlbW3+dtXz0a8nSTb0s7nvXu3kx/LPunPdhadYT+SmCvVP9ZleuVH52kyW33TX8bkZFm5t YDScA
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126092630.1800589-13-ardb+git@google.com>
Subject: [PATCH v2 01/10] arm64: Move the zero page to rodata
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_012735_544005_D15CD23C 
X-CRM114-Status: GOOD (  12.50  )
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

The zero page should contain only zero bytes, and so mapping it
read-write is unnecessary. Combine it with reserved_pg_dir, which lives
in the read-only region of the kernel, and already serves a similar
purpose.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/vmlinux.lds.S | 1 +
 arch/arm64/mm/mmu.c             | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index ad6133b89e7a..b2a093f5b3fc 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -229,6 +229,7 @@ SECTIONS
 #endif
 
 	reserved_pg_dir = .;
+	empty_zero_page = .;
 	. += PAGE_SIZE;
 
 	swapper_pg_dir = .;
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 9ae7ce00a7ef..c36422a3fae2 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -66,9 +66,8 @@ long __section(".mmuoff.data.write") __early_cpu_boot_status;
 
 /*
  * Empty_zero_page is a special page that is used for zero-initialized data
- * and COW.
+ * and COW. Defined in the linker script.
  */
-unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
 EXPORT_SYMBOL(empty_zero_page);
 
 static DEFINE_SPINLOCK(swapper_pgdir_lock);
-- 
2.52.0.457.g6b5491de43-goog


