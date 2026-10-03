Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3744CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrelwCgc63us5GOG6C+qGomuUs412KLBJjKZV/Gge/o=; b=qUuRjhfPfY1m904chCIJ/JVC/7
	NGDLXwkFE484WKiq0K/AWxy9zWz37e7nMoffYE2rIf08XZ7TyzkaV8XF5Q6+RMZuhHcaWrYogrO+s
	Qm9W+9tZ5Fck0IA1JGkJDrlH6pyBG4AVDNlrw9mNppbriwGwSkDBUFaWnCN3OyAKy3J+yby2OebiF
	VSOPPmjjkAOfXNhpGcg/Yia7HxT0QjFDxfAazlaNoemH+gW2GXWYinZJG/+NFwxccmuTPxVYv3Al+
	eJxnLIcduI8Z3WPF9bzBd3mk8A3ECKkvvQgiVBjXfFcMYnkkIRPUCpTkQYdeWvvNMOXQ13ZGtsuw/
	2AyxfvdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwCV-0000000DIMU-3uIp;
	Sat, 03 Oct 2026 09:38:40 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwCT-0000000DILD-0S1E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 09:38:38 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a01ff8c098so3423795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 02:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791020315; x=1791625115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrelwCgc63us5GOG6C+qGomuUs412KLBJjKZV/Gge/o=;
        b=jgFaIFItidf0qm2JpOjv7IdsaC9ZXz25O6Kv/76vm0LUkERynwqxU7ztYSMCpMSZUn
         /fQzWWol2Zo3fnz9kkvwr7Qtgiq7QtwEW9XIYoI7K0CfKssIUaF0x3C4jgSKIYObNi9j
         N2MbL9HS4hzvQpuqRAfFjRv9EaK8z2+MYa0Nni2LuSipd3marFVylsgNOy31m2gO4Y4s
         42QlcIpiFBPZEhN1Yap8imxqlbHdTcNlXJdn6FupL9EasWxB6zfVCGBMi7hBIFuVLosi
         xw4taa1x44s/PX+gyg4qZvJZzpliSavW3gd5akgYvBXE+cte96KOYVsDWiIswgVYdpwV
         2ziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791020315; x=1791625115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrelwCgc63us5GOG6C+qGomuUs412KLBJjKZV/Gge/o=;
        b=1WKt3LR0sdtb9SPV9N7JIAXmZff6M9KojcjTkCEd1RQEPo4/YjsG96dfh08ZEFh4Oa
         iLhcG7UPGYVQsLW5TWck9huvRyLsxekU0vxzRJy4WQwGgzNVX8Hy8TRgurE1xIpTJxAz
         rqpBPK6kwL62E1hqFNF/cyMZ9zhtf+aDimrd1Y6hrQsa5qdww6oshgmnePu6PzpcYwZw
         WUvqX3y7pLXD965dmVKS8VGsPrgQIEYdvssm0v11Bix7fBjOHxxQgAPqRAqxLqQDRTY/
         1FbJ0lGosEH5fZmNP+ue8Pkn+2fF22QfAdBSS0nX6cWE9j8WqDecl1UcqgM6d30YYfQU
         8tYg==
X-Forwarded-Encrypted: i=1; AKwUvByvQtE+C+tWiJTUIbWrjzbTJ4tJf3PkqQmQ6HzIEEaQAnVaN9Dr0G7svSZM6Cncprt4h6wmPXrubbw/dZNb8Rsn@lists.infradead.org
X-Gm-Message-State: AFuF++ks+6TAmH3nxGzvkYrEgAeB7iN/SvHB9W6/P95TuGOvdEFVp5HO
	0D9A08j4ZYCgd3FYY0B41hsI5mnyUqchx0WPz2mXiOj5fnGwUtJ2f079
X-Gm-Gg: AYBFou0TyJb+KlVErh4/ZMKZNFBDC7qZ5tm2Nph+yuicXnUDNi1QK0PIAECowmxpmsT
	NBKGGOcn0+0E7lRA5vAPnPbyzBjOALd5sNts7RUVxXGEyuyoBI7S6cll+5Jr3ufhOvcMlGX5dIc
	JvoWOu1QfSLrab77sd2QoY6MDy3/UnmeLr0zJjoLTp0auwQBA9NaQMJrJ5jHX/vZMgp1FTZzaMN
	+riOgagp/k5AFXrn0rSSv3kn+b9xtvg40OUzaEgEOe9z7DxExAQWIe/xthXPLkgP/xCprYNhYd6
	cnxYsLqEjWyZKkMEinaMCV4fUpJUITX/BJIMVfDkRHgLf5yS2rMp/o78gddVGBRNnJKgN8y9AYX
	Ysj0OzRZlbhJelUTao7MX+AWWMkYjywHRZ8hPY0W2nOzYI5pYB/bM50cEhch3w/wAlCXlpfPZN2
	JVz3WEBjq9F99MQdXM8y7IPNCv4cVgOzcuB3zejtC+4YCow9nEVXFUW7CGhxt/K99PAs3v2/pA9
	y0/nT/UPgMh5NwWzdfZg6DoUx1FomaKpxroBuBBy97lcifXmc6kSZShnAS9QQC45wSTqyeipfKR
	Be4TaxNEJDCRo4YIeFfadRDN029BHcXnq0GIhq32rtQ3+nf0qXjAfM4Ln6tBzIdgNF26axv6cBC
	5IXLxWf8P
X-Received: by 2002:a05:600c:8b88:b0:4a0:258a:b25c with SMTP id 5b1f17b1804b1-4a0276abde3mr84502655e9.29.1791020315095;
        Sat, 03 Oct 2026 02:38:35 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770e8f2sm136528375e9.6.2026.10.03.02.38.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 02:38:34 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
Date: Sat,  3 Oct 2026 11:38:26 +0200
Message-Id: <20261003093827.77857-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261003093827.77857-1-kmehltretter@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_023837_170845_8E15A7A7 
X-CRM114-Status: GOOD (  13.85  )
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

Pre-ARMv6 CPUs have no halfword swp, so __arch_xchg() only handles 1-
and 4-byte exchanges there and turns any other size into a link error
via __bad_xchg().

No C code needs a 16-bit xchg() on these CPUs, but the Rust atomic
helpers in rust/helpers/atomic_ext.c provide xchg() for Atomic<i16>
unconditionally, so building with CONFIG_RUST=y for ARMv5 fails:

  ld.lld: error: undefined symbol: __bad_xchg
  >>> referenced by helpers.c
  >>>               rust/helpers/helpers.o:(rust_helper_atomic_i16_xchg)

Implement the 2-byte case with interrupts disabled, as the pre-ARMv6
atomic_t operations already do. This is safe because SMP requires
ARMv6K or later.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/include/asm/cmpxchg.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 9beb64d30586..3077f7d7f520 100644
--- a/arch/arm/include/asm/cmpxchg.h
+++ b/arch/arm/include/asm/cmpxchg.h
@@ -31,11 +31,10 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	extern void __bad_xchg(volatile void *, int);
 	unsigned long ret;
-#ifdef swp_is_buggy
-	unsigned long flags;
-#endif
 #if __LINUX_ARM_ARCH__ >= 6
 	unsigned int tmp;
+#else
+	unsigned long flags;
 #endif
 
 	prefetchw((const void *)ptr);
@@ -106,6 +105,15 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 			: "r" (x), "r" (ptr)
 			: "memory", "cc");
 		break;
+#endif
+#if __LINUX_ARM_ARCH__ < 6
+	case 2:
+		/* swp has no halfword form. Pre-ARMv6 is never SMP. */
+		raw_local_irq_save(flags);
+		ret = *(volatile unsigned short *)ptr;
+		*(volatile unsigned short *)ptr = x;
+		raw_local_irq_restore(flags);
+		break;
 #endif
 	default:
 		/* Cause a link-time error, the xchg() size is not supported */
-- 
2.39.5 (Apple Git-154)


