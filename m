Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0765CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 20:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSRlsCJ/5tvpWWe5VR84qQBeBhF4B6Pki9zDFnj6lNc=; b=AQGPtjiz2HRlzRFV3+Z5Wh/smQ
	F/MDtJw9gaCaZ+wDDc1iLh3cUdfGsxs3A9hBcu5uYFlT8gEklhwy1oiQN7Oicdxu9ghwuZuaaLOC6
	Gm4WoIBtPB7NrLf5i9PBPrlOd+OptI95EuJcYk+et9nQknITp/vTVoHqlLNY/plLXC/uC3m2cA4gu
	eToUpSrvT9qJKeWFe8/6DWk9EaKwdJ2NQVSjpntIdfWlwSmGbMXEH2hUqhOKUv4WklkSthc70o1Vo
	NHkMZ/6YVRF5DqhbTmsIXwZcbxsIxnUNpbDxh5NcerCmI6BBS34ESTWsjnu/CHUEfbcTp+DTsNty0
	dztMFduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjAG-0000000E0P5-2wA3;
	Tue, 13 Oct 2026 20:32:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjAF-0000000E0OF-04uE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 20:32:00 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a02718da81so27260305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923517; x=1792528317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSRlsCJ/5tvpWWe5VR84qQBeBhF4B6Pki9zDFnj6lNc=;
        b=Mj/PTmv8RAU+BcEV2Bj1pT5cXJTAjVS2CMilnsE0XwjtDfECo7oF6BsFJhxZeWAvMv
         QLgXysiw3QIeIRz91H6ZrdLZJ4DO6jkHJ5OxAnDHEt7fYDzNcqX1x5k21XcdWhMDrKIW
         goafl/fHNVqzes9HA5FJO/7N+6yd7hqJFiMKCR+4j6ujbGZXJyyCJu9+t1lt6nL/3Miv
         jwDHuU1DUh78q2Bc5jlc8BawPBZmIPL+28wbnQTG65pJ5j1dXf43gaX+cI3PoDsUDGHf
         ZqBZ71ITvURB7Yr7wdGk7kdoEGpV/50BdWxv5vtfaCOLQT4aMytXsWk619JLw5eZJ9sU
         j0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923517; x=1792528317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSRlsCJ/5tvpWWe5VR84qQBeBhF4B6Pki9zDFnj6lNc=;
        b=zGhzI69LLrwmDUoPWm/Ysn5fp3KZ6AEvXsBsdpDs2Ybq7wbf+5aSfwd9xObpZlDVwz
         Hwp02fX45JT6+aqXgFPv11sz0NsmgLVOXITkjx4ocbUB3irjWuwMbpJTFvjvzvTyx5KK
         XEJdxVezDoZDrblbVYL1SY9d70o4FDLGLb7QT3a16GyE2Jxndq+sjrQT7DQKK1rjfocq
         +oT0pSmEk6bRXweHoMpPfm4yjYlCvmkaSzjxs6FL5qgXGFx0yctzfQDMxxpKF3gwwY1Z
         dgfAglalEaU0/Y0jnwlAhMmd2B7hus50W6iAaOZBT1OXP/A2+DrmSBhaKVz/hR7gE+8J
         /DsQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3VBOLl0q6Qi+VEOOePYbNGa1J1TpGr+0lidF3Yr9J3m+h73vCV6sMp8rRid3X4a4UhFA9L/m+mM3Vj2sJUtig@lists.infradead.org
X-Gm-Message-State: AFq9FYIbje+veCAzREwIKDO7eE5t7UTlnpJ6HPDi35gO4rAeUmgAipBv
	zpps5fLH96pw1xWLHmpP3KMJ9YDNRBjmRQtIjIuH0iYbLCNYer1yF1yk
X-Gm-Gg: AYBFou1ZSv0paeuhnZ8TXtqGVFbjEVQrTQnOpN3pMuPMCICWDJ6VFKZnSsBvAUkLxIF
	VEdj5AQ5YUqwJfw0Fzffpwlb8et/6nIS1sgA88i7WRyWeCCZ9ItfJ+KIbHTqMlElezNv6v3PkWj
	BxTYsxic66TQMppiNSCHtVjebOh4w8uZ3sicN77fa99qQ5lgmJ7ActGodp50hOPJL+9Brh7nXtj
	OFfw1OcmDsaxDB1PfwGfTQ3HXmbEM3zHtun7yv5DX5tPFYWTqtvM8L1nA1Cl4VR0xVkZaaDKL/n
	0KUUyFdZxmRXXLoSqP/vz1S/19178HnR4/F/MFEug7YDiga1Twd4IodtiqgcrJIFCnb4Ritek9Y
	gtPu5ok9PzGSHf/Nc27H2P+T0VvslXmOmoF/JX59RxHT23X1+oZneP+bNlY/01HdcE/e1d1f2gK
	AmW0uva+/yIpNP4pPdLG/yQ0z+7V8ftBED1Yhe/On6a4tvU+jHJjibe+ClX+EQ8WH3PNIP4uRNk
	ApKeXnQGy+8joi092vUzJhQ729joI+HTJDDlQvz4fof44cyJ6yaKCip4LNQqbOWavfoOVTjpNUq
	+9cf+b6VLpTZqESYoCM42EB7Q2iFryXQKouyzMWgqMAbSKzv/72DpruEGTAo8LA82eTEb2VNvZm
	WYeiN0eqk+V39uyt9
X-Received: by 2002:a05:600c:34d4:b0:4a0:108:3b54 with SMTP id 5b1f17b1804b1-4a18e4d67d6mr260625985e9.32.1791923516977;
        Tue, 13 Oct 2026 13:31:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.31.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:31:52 -0700 (PDT)
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
	Peter Zijlstra <peterz@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] ARM: cmpxchg: always inline __arch_xchg() and __cmpxchg()
Date: Tue, 13 Oct 2026 22:31:35 +0200
Message-Id: <20261013203140.31741-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261013203140.31741-1-kmehltretter@gmail.com>
References: <20261013203140.31741-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_133159_076592_3243D24C 
X-CRM114-Status: GOOD (  13.84  )
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

__arch_xchg(), __cmpxchg() and __cmpxchg_local() rely on inlining to
remove their undefined-function calls for unsupported sizes.

With gcc 8.1.0 and CC_OPTIMIZE_FOR_SIZE, bcm2835_defconfig with RUST=y
fails to link. The compiler emits out-of-line copies for the many
callers in rust/helpers/helpers.c, retaining those calls:

  helpers.c:(.text+0x424): undefined reference to `__bad_xchg'
  helpers.c:(.text+0x4ac): undefined reference to `__bad_cmpxchg'

Mark the functions __always_inline so the compiler can remove the
unsupported-size path for each caller's constant size.

Fixes: ab717dd98bee ("rust: helpers: Add i8/i16 atomic xchg_acquire helpers")
Fixes: ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
Cc: stable@vger.kernel.org
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/include/asm/cmpxchg.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 9beb64d30586..0ce5225af442 100644
--- a/arch/arm/include/asm/cmpxchg.h
+++ b/arch/arm/include/asm/cmpxchg.h
@@ -26,7 +26,7 @@
 #define swp_is_buggy
 #endif
 
-static inline unsigned long
+static __always_inline unsigned long
 __arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	extern void __bad_xchg(volatile void *, int);
@@ -155,8 +155,8 @@ extern void __bad_cmpxchg(volatile void *ptr, int size);
  * cmpxchg only support 32-bits operands on ARMv6.
  */
 
-static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
-				      unsigned long new, int size)
+static __always_inline unsigned long
+__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 {
 	unsigned long oldval, res;
 
@@ -220,9 +220,9 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 				      sizeof(*(ptr)));			\
 })
 
-static inline unsigned long __cmpxchg_local(volatile void *ptr,
-					    unsigned long old,
-					    unsigned long new, int size)
+static __always_inline unsigned long
+__cmpxchg_local(volatile void *ptr, unsigned long old, unsigned long new,
+		int size)
 {
 	unsigned long ret;
 
-- 
2.39.5 (Apple Git-154)


