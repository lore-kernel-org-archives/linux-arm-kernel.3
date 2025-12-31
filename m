Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FB6EE642E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 12:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REYT8YJ/dkSr2Ie21SxZFTWd8sKfplhaWYQ+TaqETKQ=; b=KcCsUHDRydMTniDXuIg80V7O+a
	cnNr6p1QYYCi6/afL95bMg0dLoNZ3BZjsqGIPKtrfEd/JhWXbAZnMswdg1yvMRerzW+4JhZn4edTA
	pZ5A9eQf1ASgSuLc/nrWhjQRuXc8iOsjcVSiY7e26eTUiaNzSdd9hvv/mFpAjhfS6cS1QtQGgzbTf
	0X1zs7VzH5foP8OeH3Y/f9yT1NLZCpNvSmhF5c6dJpussSB9rxwFtXiOj/81gIvYT6d++yRYpqJEN
	FAmAgIqOmIdJ0SP3Pr6lq+RFH9YT2u/pWAo1JceBtcC1lU+yCU1keWlByO0EnNJzJLKK3ibDKjM1V
	8jWAepdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavDz-00000005y1x-1XI1;
	Wed, 31 Dec 2025 12:22:47 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavDt-00000005xyI-036r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 12:22:42 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47d5bd981c8so14239735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 04:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767183758; x=1767788558; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=REYT8YJ/dkSr2Ie21SxZFTWd8sKfplhaWYQ+TaqETKQ=;
        b=xbVkv1OfzaXK2+eSNWZkG48UYyNmsKE9hfvp8pg7QYnJ2xFuDYEXuO+zaSU4/5qd8z
         ctJhnkq3t6Zg/2tzon9IR+lpCd0eaOa05A3Vw9Fz1hgtQlYnJuaoX/KlbKvAj+4e3lpq
         TOSZTrplCGYBq5k2L6i7q9nzMGhS+RsQXS+MoStngud+EPQl6/+duVWsS4ttZVGIY0Ts
         GSAQdoio0DjKAftHdXg5JZGBu6WrhCumXzlR8pvB0Ran6AtiOGeemncwzpbympDo1TjZ
         +1W12LawhV7Q1hTEZurg/IWglMWFCgAsvBebxzLLZymzhXDbH4kOv/zGin4dfZwRfj6n
         RfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183758; x=1767788558;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=REYT8YJ/dkSr2Ie21SxZFTWd8sKfplhaWYQ+TaqETKQ=;
        b=dSptP1LEMkrqlJMzU5L1Pbrp0na1sF2tcz98bonB4t0ze/DNV/Q5p6XNd+DOXwIZOv
         A4Yrl1vj3o3958alvec7XQuelSeLQewUahuuKFOZw1tyLAIQuxqttbVdnbITskZBABde
         czx6Icw0l4htqpQMZNo551mOrv/iwwtptujkm6Ddk1bQqeTAl8VLlRGyuOihyouGFGT2
         5AdP+9zuZmcVo5n7tQLYV9jDHd1mhXZ9lYydUiA0pPuo/KwTkC3mh7yy6ONo1r0oYK4x
         mSbzVBTNY1dZt2xlShkGS6+0h2PKB6UYp8BGrX8Nl0qpKNr6w7HDTep5kbCYs6PLNTcH
         R2CA==
X-Forwarded-Encrypted: i=1; AJvYcCXoxFtUo6I06tDffJCirQvFLm+kY43LqDfx3dd1jL1bIwWr6v84goKx7K2QvpHWtnBuhm+4z5D65PIRevTyvbSh@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ9pGUW0UgeWQGsTxSvzKVsudl2WiNkCUSG9HVFaXU19ErAUiM
	B3nSxeX80VwlCE5xAQv+5Aqnx9XL09SSfrMpbKnXOhJrOG7xSTJbv9Ag9ZBVqTLIXUpK4+zVC3C
	8kG43oZOZkKqlik2lnw==
X-Google-Smtp-Source: AGHT+IG+d3dn97mR05G1vfxtVGQCjvCQzYBGJ5XjDQkL2U/PB1Ft8yM2WWn+7k6yvU3vRGKPA72nmhH58SjTDVY=
X-Received: from wmsm38.prod.google.com ([2002:a05:600c:3b26:b0:477:a1f9:138c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:818f:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-47d19538725mr450831265e9.3.1767183757851;
 Wed, 31 Dec 2025 04:22:37 -0800 (PST)
Date: Wed, 31 Dec 2025 12:22:25 +0000
In-Reply-To: <20251231-rwonce-v1-0-702a10b85278@google.com>
Mime-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3744; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ho7sEa3sHiw4JAsNigwc6kC7aT+CIvKjmsF0WqyxYeE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpVRWLKHPgRt7fOS19l2MagjlWg0LGc+wVA9YRb
 5uR2DA3RfaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVUViwAKCRAEWL7uWMY5
 RhplD/91zkdMMSGPLFlUxmye1zAnivnHlCVwGrBjDg+IhGKnsT9ZSGq9/ZSv+0HBjouSoFXO/gS
 C7rCtFQgHg1EQ2RCW6jzt70ph9bv8lh3ob+cOuLf167GMhNEpDTTtbgSkqUQiidmnH4arv17iLr
 C9n72wGxhQbLJgGSouTCXPyCjUTg9Z5YSY+tT++gPbdLApvL10aoophFoOf7gEZyHnIOLPBUqxh
 QbxWhIubQMig97irk7zNGgUMvWSn0oU2+4zFhNe7MVOgQL/M3oNZ8FRqsOiRTZY/SCEGf5i2GLN
 pJTK/AarnDFWPuJsZ6UYhZeN9ZQSDkoWeZdLWOVtKrEvU11Nx5M7Ss7989CfRAeoLAUw0MrWvMQ
 zoOrU5wALF/6YNktCRdDFmpXg6nPzG1q5B1CRlzlc8sxxcjwRD/lgoLMSu6guiI5ls/AButpJiu
 sMZFGqgCtR3p4FmX2ch0ecWN/kK4lFRU/oiTY6fUwAo2EdtdN1HO8dss7HPbpSoUqCwl085YgWR
 TMq88vxxwiddr7umQrgL8YQIOeGPUkHEJCIcUZ8RZJP8cCXWi3wiTufRFv3nU8joLUfvQBXts3E
 dVkAqZ0IPWv/nX4/sjoXpJ//15qdnZOrGa/yh79ghXgdg3FNlmtFDgE0FujYtkUWSJBf17JcRYo e6fQY6LvRgmu/Aw==
X-Mailer: b4 0.14.2
Message-ID: <20251231-rwonce-v1-1-702a10b85278@google.com>
Subject: [PATCH 1/5] arch: add CONFIG_ARCH_USE_CUSTOM_READ_ONCE for arm64/alpha
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_042241_076192_1FC57D1C 
X-CRM114-Status: GOOD (  17.22  )
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

By exposing this variable as a config option, conditional compilation in
Rust code may rely on it to determine whether it should use a volatile
read or call a C helper function to perform a READ_ONCE operation.

This config option is also added on alpha for consistency, even if Rust
does not support alpha right now.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 arch/Kconfig                    | 11 +++++++++++
 arch/alpha/Kconfig              |  1 +
 arch/alpha/include/asm/rwonce.h |  4 ++--
 arch/arm64/Kconfig              |  1 +
 arch/arm64/include/asm/rwonce.h |  4 ++--
 5 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 31220f512b16d5cfbc259935c2d3675b60c1e25c..683176bb09e50e31f398bb92678283e5de66b282 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -229,6 +229,17 @@ config HAVE_EFFICIENT_UNALIGNED_ACCESS
 	  See Documentation/core-api/unaligned-memory-access.rst for more
 	  information on the topic of unaligned memory accesses.
 
+config ARCH_USE_CUSTOM_READ_ONCE
+	bool
+	help
+	  Some architectures reorder address-dependent volatile loads,
+	  which means that the default implementation of READ_ONCE that
+	  relies on a volatile load is not appropriate.
+
+	  This symbol should be selected by an architecture if it
+	  redefines READ_ONCE to use a different implementation than a
+	  volatile load.
+
 config ARCH_USE_BUILTIN_BSWAP
 	bool
 	help
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 80367f2cf821ceb4fc29485b7b21b37d5c310765..1d5d48153ba0087554221e9412a6af0c672d3f5c 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -11,6 +11,7 @@ config ALPHA
 	select ARCH_NO_PREEMPT
 	select ARCH_NO_SG_CHAIN
 	select ARCH_USE_CMPXCHG_LOCKREF
+	select ARCH_USE_CUSTOM_READ_ONCE if SMP
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
diff --git a/arch/alpha/include/asm/rwonce.h b/arch/alpha/include/asm/rwonce.h
index 35542bcf92b3a883df353784bcb2d243475ccd91..c9f21aa0764625b24e8957923926d09a2eb97e7c 100644
--- a/arch/alpha/include/asm/rwonce.h
+++ b/arch/alpha/include/asm/rwonce.h
@@ -5,7 +5,7 @@
 #ifndef __ASM_RWONCE_H
 #define __ASM_RWONCE_H
 
-#ifdef CONFIG_SMP
+#ifdef CONFIG_ARCH_USE_CUSTOM_READ_ONCE
 
 #include <asm/barrier.h>
 
@@ -28,7 +28,7 @@
 	(typeof(x))__x;							\
 })
 
-#endif /* CONFIG_SMP */
+#endif /* CONFIG_ARCH_USE_CUSTOM_READ_ONCE */
 
 #include <asm-generic/rwonce.h>
 
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 93173f0a09c7deb07b46ab4f16a1a0e4320dfbf1..cd16053c8302479458a05c23ba9cfb73ee50232c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -89,6 +89,7 @@ config ARM64
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 	select ARCH_USE_CMPXCHG_LOCKREF
+	select ARCH_USE_CUSTOM_READ_ONCE if LTO
 	select ARCH_USE_GNU_PROPERTY
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 78beceec10cda47b319db29d9f79d2a5df35e92d..5da6b2d6a12399a520f7a3310014de723baa278a 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -5,7 +5,7 @@
 #ifndef __ASM_RWONCE_H
 #define __ASM_RWONCE_H
 
-#if defined(CONFIG_LTO) && !defined(__ASSEMBLER__)
+#if defined(CONFIG_ARCH_USE_CUSTOM_READ_ONCE) && !defined(__ASSEMBLER__)
 
 #include <linux/compiler_types.h>
 #include <asm/alternative-macros.h>
@@ -62,7 +62,7 @@
 })
 
 #endif	/* !BUILD_VDSO */
-#endif	/* CONFIG_LTO && !__ASSEMBLER__ */
+#endif	/* CONFIG_ARCH_USE_CUSTOM_READ_ONCE && !__ASSEMBLER__ */
 
 #include <asm-generic/rwonce.h>
 

-- 
2.52.0.351.gbe84eed79e-goog


