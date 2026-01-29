Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243EBD46C01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0NjJX+kK82UqSM94A1K+UHi4bU7NWZzsNdcUlluZDA=; b=ZKqXxAIMxhSZt4jgcB4CP537RM
	3Uwtfxah7pTXA64AxQnOqYsjNFymNUpLISw9k+joiiYB6UdJ6sjyTkDSYS5dMit1QCR8dQSdFejtf
	xYJMt+TWxasMahjYR0qD7l7FMEL1GAZaHAUK8t9POJ2uemdQhOZF4iDqk2IZ5wsfxAWE9FXuTyLMo
	6Z0RV3+u6cKQLd6C1LOa3dKaYiJ7wjOmRnhh7ypAvy/lSvLPpE31PSJMqn5kduFmV9QP5TKCq3vG7
	OCa6Z6XqExJO7Fy+qHsqQtmnWp/qvuo/xw4jVxemhgv7Rr19EQ7sMy6ySazW2DcpH+TUihg6zHNgq
	mMOk8uyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGLM-0000000H0RO-24bw;
	Thu, 29 Jan 2026 00:57:08 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGLH-0000000H0Q2-2S9U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:57:04 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-480717a8e05so3485705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 16:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769648221; x=1770253021; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t0NjJX+kK82UqSM94A1K+UHi4bU7NWZzsNdcUlluZDA=;
        b=kWdxAQfm5IUX2N4ICc3ujFtL/YhSK+KioMgp5ZUpd5YfXAulz2j+YzA6d2RJn5UqFu
         U0BiCwFl6tbGNPIbqXR4Y5rr804m/Q9UXdcdaUY7W9RsXlkTsXPgAoVAqwZTZ/O9kM7l
         +TSMDqz5AyK86Sgvl+iG1Ca1ymlcaF9fgyUNELKFLYSQMeVsjJ/O58wzSuN6ZURiKQQV
         1BZKcPMLM/AGS2nGAd6WQi3tvZci3DxuemvtheZKQXDfCP9CsMJsBuJBiowdJk0KKP1w
         H25E9G9FvHC19J7V7u+816mQrrc+xaXY9IIdXCT15xVR524e9QldK+5+bZjhEPuS+JDC
         o2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769648221; x=1770253021;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t0NjJX+kK82UqSM94A1K+UHi4bU7NWZzsNdcUlluZDA=;
        b=S21OG9k8e72GZZtxjvW1ph1bJKDYTukneB5JpE1hAW+p7vuRVOPfT7Y/NDua+2NF+D
         WRBmb6lM6qYbfO1/LAXqOv+C0hhX3CKJRFNa0Y5iL+/QvSFlZHlMyukWmHLoesMOCHU1
         HI+w/0g06TFkyxGYrqnAPRUsf1hVLxBZOaRSNwj+DEVJJ1IpoO5kpLHL486nCcS2E+/L
         HW5/s5YM7Bm1vSY64q3k4ol4if4G+F3Y3I654re++0TJx+HRTBjO2rxXpYOeRBRtowqt
         vPRy1QYktDUNW4YcAa9wk9G9MPDGZIcdNH956AFGd/EJwKywp7vF1/s2ABUc1X0ARYgC
         O+1A==
X-Forwarded-Encrypted: i=1; AJvYcCUq7P9Sf/z7QOf9ESB6xOwe6dBVQdt9oyt15F9rPp1EILsC/MPcMxJ1EaGpfO9Q+3gtppZlX53hLNIKZifJ+Q8l@lists.infradead.org
X-Gm-Message-State: AOJu0YyXN1gdeeJYDNM97pOx7Pgyco+zILyVUI1L+EDLecRKisbb2Zyt
	pUi1RYpi+aMXivLexxfvPq6V+sG14Dj+CtWQnM9grO36v6TRKtyhrErxzfWBl9YzKEDEG/w+MJH
	VgQ==
X-Received: from wmna1.prod.google.com ([2002:a05:600c:681:b0:480:694a:dd63])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b13:b0:480:699c:abe9
 with SMTP id 5b1f17b1804b1-48069c86f58mr73598185e9.37.1769648221236; Wed, 28
 Jan 2026 16:57:01 -0800 (PST)
Date: Thu, 29 Jan 2026 01:52:32 +0100
In-Reply-To: <20260129005645.747680-1-elver@google.com>
Mime-Version: 1.0
References: <20260129005645.747680-1-elver@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129005645.747680-2-elver@google.com>
Subject: [PATCH v2 1/3] arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
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
X-CRM114-CacheID: sfid-20260128_165703_647453_73DF6B8B 
X-CRM114-Status: GOOD (  14.62  )
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
2.53.0.rc1.217.geba53bf80e-goog


