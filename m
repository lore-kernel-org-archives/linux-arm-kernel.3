Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7DFE63CB7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 00:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+0aVR3neN19eb/78h0OkLoTFjYmtJx01fQbpzy1/E0=; b=uzBITshoB9SaJfB/M1sSod4ZyA
	1cnlps86sKvUL0fy/J8uYJBydODAlKXct/kYZRGg3uA/CWiXXNt3a0TQzLI5jrVMJUvH+09eOq4s6
	UVGmTMToKILf/3TqjJUdFFronQHimU2Ze9166cJqzvRui7QVBlMewhjB+VAEGoq/3PVRWIRMEh8Xy
	hYaDIZ32xML+jVSDjnhNH3HcnI2V9wk16Z9w/kHchXAz3VTZpvbElCpI+aVYdw+X9vCta/PViIlVV
	bLHxqQ7WG+UlCcoe24UmZ92XRALzkYAmzvsJvNnZQXSPO/vqnfI0Q1/Bcl2uEUxhdb27YW39zn5QM
	GmiqeEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkAXY-0000000BiNi-250y;
	Mon, 26 Jan 2026 00:33:12 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkAXV-0000000BiMk-2kHi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 00:33:10 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4804157a3c9so43412915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 16:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769387587; x=1769992387; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y+0aVR3neN19eb/78h0OkLoTFjYmtJx01fQbpzy1/E0=;
        b=0XsUFIdKwbmb+AjBX/xKbcuHbNwblHR4/u33L4yxDHadS8hdIx4SzwBRhD827tX4g1
         Iuop07BBGMVw7a4NdHNSP9G4VT7gUlTKa+Diz0mDeDlRwSXzywa5Ynrq9h3gf2yhIOri
         kOU+zhzHXW4ntL3rzxL73Ken+aXa3L89IUoz713LnnEWCxXYHBR16ZeHVESIe+WAOhG+
         qj3srGb526jg8FN1AU1LvQwY5IkeGxQgbsFH5e6xdc9bw2DGxZUNd3mYaYcAYXBvRhr9
         LPNT1BMwjTnwSIkuvUmuC/K5Jt69+q1C0bRMYrJUKgKw2xvPyr2/c2uFUwIJqYB7sjKo
         L7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769387587; x=1769992387;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+0aVR3neN19eb/78h0OkLoTFjYmtJx01fQbpzy1/E0=;
        b=loQmXrcjpw5XVp2YI01XmvM4rvxLyOaJxd/zXNt4ndW1NbrVzR+KQucF+HwgbXqoKP
         sdTpXhIyhkvNDlTxTGD80kofWNUrLcI/Rd9O2aXrEeTU8rvZZ/HuH0uYAtNVnA7INR8P
         DiH2ayE+KuRuVcGTYhsUpylgC/3EoxuLgEch4Ccok4UbHuRSiWyz18BDknkmsqKkUgfR
         Kxw9JnONLQAeXtTm+/iY/Z1NO1VVH4v3mMIRKdOnsscR9Be78ObSCyIGa7I5NInuVF2h
         rxe3Q/MCK+B/lD66xTCUE0tbiMpfDfgXXt0NlbcLTxUW1PyaMoocDWnAS3d8I8b78ebK
         FTFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa5QkOjOuVRm0SyFJR8ZpMPP0OiwoN69QvjbeJoHoeMvHQeWzVQAA1k3c9YubBBbGVmQB3xjzrkxQGiHPAt/iz@lists.infradead.org
X-Gm-Message-State: AOJu0YxGCdUbDt/BuSIxhG+uJ01kNpfA46/+/qxFDfIFFs6WBfU4BKDq
	UsLvSEDdaXIZ2EJTTbNcr9rhADr44WYRHWf/n+q86sM2tEnYhGOeBW24mYUrEGvVyx9lMdXV5oD
	d3g==
X-Received: from wmne21.prod.google.com ([2002:a05:600c:4395:b0:477:a181:1922])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:6405:10b0:475:dde5:d91b
 with SMTP id 5b1f17b1804b1-4805f624d56mr26596795e9.17.1769387587598; Sun, 25
 Jan 2026 16:33:07 -0800 (PST)
Date: Mon, 26 Jan 2026 01:25:10 +0100
In-Reply-To: <20260126002936.2676435-1-elver@google.com>
Mime-Version: 1.0
References: <20260126002936.2676435-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126002936.2676435-2-elver@google.com>
Subject: [PATCH 1/3] arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_163309_722454_5D7CA9F4 
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
2.52.0.457.g6b5491de43-goog


