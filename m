Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7D0CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 21:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mrvQD6GgPgoo9WdJOzGFB8vI+DJYjKJmIgf8+ynX7Y=; b=p+scXHFt+o7wVCHx6VPyhdWLGG
	S7u+8ijjxWNVJ1bv3vnTxabx71ElJiH4TZFB890M0NuVCCSVHAhfWkRhGMQgRHWMmzTWkDgELXnXU
	h33pZQooAVR7r0Uth6bSIB+L5GA4Z5AhliFUD8pDs8xuyBkE7j35lwmG+5X6AAzLnP/jeVO370HFP
	uaak78XK1fCRehObQsF5+mdjNfdKf6hmdSdgZCrrLfPff6TX2vSMf2rmFYPfMRvZeNn1DJghT9yj3
	J5Trg4LrnoOMwdI/oLE62Kntin5yWvcrEVBAmx9wcW2qZOjaG4as4A4SaYoKq45sgdQh21s2wlYNy
	sR22/ayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSM42-00000004lex-0Aye;
	Wed, 27 May 2026 21:45:22 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSM3v-00000004ldY-0aZZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 21:45:16 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-304448ab58cso6418934eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 14:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779918314; x=1780523114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mrvQD6GgPgoo9WdJOzGFB8vI+DJYjKJmIgf8+ynX7Y=;
        b=eYuxy1yCbZ7q8+2ashCR4MsQyy0HMWe5tteLIPU10fAoutp4/mfX3EI5ofG6x3kvI0
         4SSPKxEPRQGx2gIb2DV7/Tl60LH64pkBtq+7RoxXe1SVTrQ51Qam+E/1VnfDHYZInCZb
         nw7Rxt5+haQjuxybMRQUhgv1TbHE0i+J0FWpAMJJhVvrsZHTxG87X++S7bpghYly+yh9
         V7Ubh9ykgpPy2/eXpvwVYHFRuQar1t0Jaku/5Z+dczYKw5bt3FN3Bd9rhKWcuqeQ3YHO
         85KolG8fk8/nWk6qlg4rGqdpLn03IDh/plv5wNx6r2+EVFyl6eUvGdthIM8az3hbfQyB
         satA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779918314; x=1780523114;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6mrvQD6GgPgoo9WdJOzGFB8vI+DJYjKJmIgf8+ynX7Y=;
        b=aLKNa+lLWASNndamUbTasQtKnB4WE5bP/Sii0IVP44ZXtv3XKkoaExjqGlNuEy8Jx3
         kEO0OPR+MVy5sknW9eZOBxr1DEP3hX9bebPjvBUnxsRaCSxR3k1jXCVK1u2bSbCdT2sX
         VRuVlUn0+5U27505BjwdBoVij3niC9XHPZnIetrPykfIQFjqFRwxPVT/l4WxKZz/2yFE
         b6ah5nPd+gH/+83phiupjoL9xixVMc79yq2AQ9djfIC9iMyopSYEH7Ux7t0FvYlI5BQP
         ytz015ilHledSbMBeR/1TTUkvfHO6BfiMZjQ0ZW3rimDvGY38Zw0S7/NcPK8eVapXRvr
         czfg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ym2A7UFMGfMkxV5XUMoKO/NdvwbxmtKkWcMNottAo5nZPVrcOrvcE5il6yOV2fLFX23QfFUsAJ1u082fb8TVp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4R9BzQVWcBF9XjJpe3fa4E79JWHDqj6qkUlv1Fa5mNvAEpEZJ
	rtGcopUCtgKYwAtBYyDbDsgSRGK/nWlWX49yF/FhwZQO4mFb2D+1gUWwB/xWRTFhtsmO1g==
X-Received: from dyvs21.prod.google.com ([2002:a05:693c:42d5:b0:2f7:767f:edc0])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:6417:b0:2ed:7e1:975
 with SMTP id 5a478bee46e88-3044903799bmr12307194eec.1.1779918313261; Wed, 27
 May 2026 14:45:13 -0700 (PDT)
Date: Wed, 27 May 2026 14:45:07 -0700
In-Reply-To: <20260527214510.3907973-1-xur@google.com>
Mime-Version: 1.0
References: <20260527214510.3907973-1-xur@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527214510.3907973-2-xur@google.com>
Subject: [PATCH v3 1/2] kconfig: Remove the architecture specific config for AutoFDO
From: xur@google.com
To: Yabin Cui <yabinc@google.com>, Will Deacon <will@kernel.org>, Han Shen <shenhan@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Rong Xu <xur@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Helge Deller <deller@gmx.de>, Ryan Roberts <ryan.roberts@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_144515_181718_1EDC3F14 
X-CRM114-Status: GOOD (  12.01  )
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

From: Rong Xu <xur@google.com>

The CONFIG_AUTOFDO_CLANG option currently depends on
ARCH_SUPPORTS_AUTOFDO_CLANG, but this dependency seems unnecessary.

Remove ARCH_SUPPORTS_AUTOFDO_CLANG and allow users to control AutoFDO
builds solely through CONFIG_AUTOFDO_CLANG. This simplifies the kconfig
and avoids potential confusion.

Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Will Deacon <will@kernel.org>
Tested-by: Yabin Cui <yabinc@google.com>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/Kconfig     | 4 ----
 arch/x86/Kconfig | 1 -
 2 files changed, 5 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index e86880045158..e510c585ea84 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -863,12 +863,8 @@ config LTO_CLANG_THIN
 	  If unsure, say Y.
 endchoice
=20
-config ARCH_SUPPORTS_AUTOFDO_CLANG
-	bool
-
 config AUTOFDO_CLANG
 	bool "Enable Clang's AutoFDO build (EXPERIMENTAL)"
-	depends on ARCH_SUPPORTS_AUTOFDO_CLANG
 	depends on CC_IS_CLANG && CLANG_VERSION >=3D 170000
 	help
 	  This option enables Clang=E2=80=99s AutoFDO build. When
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f3f7cb01d69d..10bf3984102e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -130,7 +130,6 @@ config X86
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_RT
-	select ARCH_SUPPORTS_AUTOFDO_CLANG
 	select ARCH_SUPPORTS_PROPELLER_CLANG    if X86_64
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if X86_CX8
--=20
2.54.0.794.g4f17f83d09-goog


