Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4783E6BF0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ah0eS4SkK+p5W7jb3OOf6k8LtqY2IjJqo0gqvKUDvkY=; b=AJ+JcysuvKXuUlCUXLUWf4b/Np
	TIof2q7r0m6dQFhvZELLrv54D227TSPGVmVR4aPLo7SY+GxAswLmJVNIkGuxLh6PRGXbTcLo/hSK3
	qR0svg5cs77SOZbEXGZQFvTm/16MptQI7DDLefSO/zXg3vQrEgUIvAgZiyTJ2gx7tySPd8q0Uj0ry
	0gndINekNA2b+y+DUQrEvIcDVnCwtrvDW8DX1xlB+h+Ck4z9Ksa49Aa2pLhvxU3DszX9FLHObMVW4
	titcS+KdPtj00TjB56bV2oBPzTr29Emk8aDewhHh14KZoEHVwil85n5n78P75h3C4dMoMhbA4TJAn
	5z1NsNVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloZk-00000001XDJ-1ViM;
	Fri, 30 Jan 2026 13:30:16 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloZe-00000001XAf-16ey
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 13:30:11 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48025e12b5bso35329775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 05:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769779808; x=1770384608; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ah0eS4SkK+p5W7jb3OOf6k8LtqY2IjJqo0gqvKUDvkY=;
        b=U5bt8UDH/UYphtvaEjf79sDoxWlglYG/FT72OluNY64hNiuXjmTNj/Vriu7rwnJMFj
         PP1vjVBGLnpuR0kz5VIMbHG/4PIIzJDWZTUU0yaQ6AG+c9aHl6Lt1NfKoIg5fcQfIvMA
         RJJhhKRYnQDYKx79jrmqHl3vPYtDbGaMxK9PI56xNzhv2Uu2udRChd4uzfbzJ6DmvGdy
         1ji0LaafRTofYGyqVKUMtt2CL+whgKWLQsTUxoh2+CuLo25qgbNmiDR5//99U/qmXrcG
         KzBRZ7s3Jdy6kFfC3IN4TsSvD/numbRKblAv0qBKfoWFYOfMoiNNbgtoSCSr1HvB4xoo
         D2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779808; x=1770384608;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ah0eS4SkK+p5W7jb3OOf6k8LtqY2IjJqo0gqvKUDvkY=;
        b=tlTLhyACY46EeL/6TFUG+fmSOS42arg5Uj/jTdelHlKrr69OG/awBqAj/3+FTCTVSh
         rRRlP38h0QnbJNgcuPazFCh4UceyPdSvE/QdykO7Lmu6efYXzCrXAdc4y8MR3VbAZADP
         exrjlIBgE0BPRFdYb3fW+ZYp6SkDAsbLyErWeazMXQ2pceWHKiwSiStWj5sM8UZ07qA4
         pKdphdfMl3jVMzpYqhZs/mtZkrheqW07RKqr3ApQWVEMw2O3I6Nlk9vu/RvQtCHLwVE5
         RTmx5L4ZWEzecG1CQQvdIsBE0mHHhIkxB8uW6uy8cSxa3+3GTp47F1Vgw1xfBQapydJg
         gocQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUnsylukss/f9QsPo0M+Pa87VkWzP92MtOs83x5lTly81zJbwYC/X6ia1wcECm79b0/tYXQBspe4UM7NeEDqjI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9R8ysII8ZRbQxPlQ+Jmq7L602ae5It39Il22AKryFFmD7ZfYc
	75h0W8i5edt0TFGID+ST2Ru1+b1gFtpA78+ibg1BOwNrglvy7UKj5K3P1gtL/XQTG7my1h8IR+H
	g+w==
X-Received: from wmby7.prod.google.com ([2002:a05:600c:c047:b0:477:a678:a39a])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b1d:b0:477:9cdb:e32e
 with SMTP id 5b1f17b1804b1-482db46014dmr37732115e9.9.1769779807742; Fri, 30
 Jan 2026 05:30:07 -0800 (PST)
Date: Fri, 30 Jan 2026 14:28:24 +0100
In-Reply-To: <20260130132951.2714396-1-elver@google.com>
Mime-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260130132951.2714396-2-elver@google.com>
Subject: [PATCH v3 1/3] arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	David Laight <david.laight.linux@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_053010_306560_953F671C 
X-CRM114-Status: GOOD (  15.04  )
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

The implementation of __READ_ONCE() under CONFIG_LTO=y incorrectly
qualified the fallback "once" access for types larger than 8 bytes,
which are not atomic but should still happen "once" and suppress common
compiler optimizations.

The cast `volatile typeof(__x)` applied the volatile qualifier to the
pointer type itself rather than the pointee. This created a volatile
pointer to a non-volatile type, which violated __READ_ONCE() semantics.

Fix this by casting to `volatile typeof(*__x) *`.

With a defconfig + LTO + debug options build, we see the following
functions to be affected:

	xen_manage_runstate_time (884 -> 944 bytes)
	xen_steal_clock (248 -> 340 bytes)
	  ^-- use __READ_ONCE() to load vcpu_runstate_info structs

Fixes: e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire when CONFIG_LTO=y")
Cc: <stable@vger.kernel.org>
Reviewed-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/arm64/include/asm/rwonce.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 78beceec10cd..fc0fb42b0b64 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -58,7 +58,7 @@
 	default:							\
 		atomic = 0;						\
 	}								\
-	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
+	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(*__x) *)__x);\
 })
 
 #endif	/* !BUILD_VDSO */
-- 
2.53.0.rc1.225.gd81095ad13-goog


