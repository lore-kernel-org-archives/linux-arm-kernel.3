Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96860CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KvxVLxua6Tw50aLhIwUcC7cdFZF352a+MrKefzPbwHs=; b=u9POhdZ6sK3pnzxyeN0rCi99a8
	/1D5H0hDDWom3R6dw5X7TTxq3n1EaMYrul4lPaezyOYTlH0AktXlqRg4hgJvvohTeTQuC5Y4SX6rz
	SLm40+UPR3+2mtTGyCoR+IZqE1LVBga4YQkOkgOVNTLFsfNmzFmlecaqOyVHIQy/YyhuhgYC9nI9Y
	AttVg6K79EicJjs2004kHShzeYz4J56yxyjMJw9A+B7xCGhsagjjlufFz4IxPNWacQMzXg4CwmToI
	zEi6ZMnrCAv/QR5H//xlYAWIs7lPyEm+PXfE2KuryDGRPjrCsFisIQAwhOGgPtuBsS+zeGKgHAOPX
	8KRsghzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwCT-0000000DILY-2UX1;
	Sat, 03 Oct 2026 09:38:37 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwCR-0000000DIKb-1xO9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 09:38:36 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso4505885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791020313; x=1791625113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KvxVLxua6Tw50aLhIwUcC7cdFZF352a+MrKefzPbwHs=;
        b=a7QSMAFWXFdrkQmi9nzC2Iua8OeO8rVx570bDIbw0lni6/emQfK7f0nYqW94fNdCpb
         frK61n1NlOHJw8L0tGOsUeqf7irJqsRWh+Gq+BdRstbeBUxLL0fwOtj+VuMYbqOKjofs
         ZvVkOkt9iJrag5V9zdfsk5F2vmkaaJ6W9kHxj22izZ6hcG16Puq80gVi2ye9/2yl/Y8B
         I31Z/kEB2qVOFsh88anGF7bSXeWIXWIETYeo1j0Ij7qlNAN5CmoEekc0YJ4Pels9jhxM
         iPoQHVYj4P+ePZI5g61Uw2libY0v147kkhbc5MA/jMvSQrGKaAqXyUQG3NurDcTc9ThF
         lNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791020313; x=1791625113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvxVLxua6Tw50aLhIwUcC7cdFZF352a+MrKefzPbwHs=;
        b=yEH2DxObqQcMz3aijuB3dbFuiDFT1B9MGesBsDjResQ0nBi2U61CLHccTeH14mbPgo
         iWz94CFxov1rRvr6uJjv7vXLP8jQ1cT1hKI7zP1SMdfHRXHzkfi4RQoP/zpjJerzn6h3
         wFKIqmb3WgHmEMDx+NTKlW6cdEaPFTVLKjOMmNiRg7ggloRsmhdjuOTUHr7BrdVXGZAK
         G3hFVtkgZ1oLCmFpvq9NZYxXeHLndZPR1yje2AyeTBO2isxpX0osDNEXTL6tByj2yYMQ
         SXfLErPkC32+40XjJ0lsj5nrPIBLH11zcas3IKNVJBYVc1mlSEVdOKo3ob0t12aKSGT2
         nrmg==
X-Forwarded-Encrypted: i=1; AKwUvBztRjwKtTqNB9fWoRJplNzsUCbMVdRqhIH32zggMNHLv9mTIVKO+AqDPZBcG9IOtciSl8N4hqu+aUCKSGStf+ZF@lists.infradead.org
X-Gm-Message-State: AFuF++lLakrjOgfgl/+329a23kumSdbTrcJZ3ST6Ph5JhQSyeQl9voBR
	4vfecDQqNYEVk6bAuj2ZrJRhQF9s7At1lXqGwgS0lFGTmX8tp3IFmGJJFPb2kqhZ
X-Gm-Gg: AYBFou0wJJxCK5/CEGiOfTmfZENJSowHFhh8ITYTwiQopThFbwj+C+BMXuoqPLrOStv
	CD6WkUOMt9mHbi/8JO/o+3HkkitatqtdDIuYSbsQEJlP9Irv1UWQLPnC3TN/U9+S1NWBLFJVNPo
	JwjnlZtDJfRGJiu2d+TRA5XL7XS3YNzpr5xs1eNv3mB6KJhoy4BykPn2kks/kfNnJiGZu77O3U8
	ODEla//axrcAjPX/4oUB7c6ebvuWptjaK1NeRg/QXXfyn1ivSEh/PC8FBe228Zpvk522fuDlGtB
	NbPmBo3bMXDpNR2P9D+/vGumfrkD6QeNnjrmepapYYuYWJ6h97Y3c4LHqSh1HsvGGIUlowXUw7P
	AejbjEr/vCdHm244PKVllAuuwHZO2eTMJ3zbb4HJf08MfwIfa2R6lHhWtycjPAgXdU3o1kPG5Md
	E4yPTWWgHKSTCCVgDQs86mJ69wqk9thEOimPppBc89bpTCdfSH4vMkJ4+GSeSZrzvto5wULerNw
	Zf65fFYwpeD1bSEr4k7A5SxZlAEDGn8hOOPKBfrdEqbgkpw0n4quwc4W+sLgEly/MtSxDzD12V4
	ztT8eL55pIiwZ9ihuFrrkSuOVXJ4mV+ceZ3345jBEdbfu2tWWeoM/aAcUhzY/zdHXMPA52wffJ0
	bnmOQ+vs=
X-Received: by 2002:a05:600c:4505:b0:4a1:62b8:9e8c with SMTP id 5b1f17b1804b1-4a162b8ae34mr55253055e9.33.1791020313486;
        Sat, 03 Oct 2026 02:38:33 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770e8f2sm136528375e9.6.2026.10.03.02.38.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 02:38:33 -0700 (PDT)
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
Subject: [PATCH 0/2] ARM: rust: Enable Rust support for ARMv5TE
Date: Sat,  3 Oct 2026 11:38:25 +0200
Message-Id: <20261003093827.77857-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_023835_537073_0FDCADFD 
X-CRM114-Status: GOOD (  16.85  )
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

Rust is currently limited to ARMv7 on 32-bit ARM. This series extends
it to ARMv5TE.

Linus Walleij asked for older ARM cores during review of the ARMv7
support [1]. Christian Schrefl tried ARMv5 with the armv5te-none-eabi
target at the time [2]. He hit missing core atomics, missing
__aeabi_mem* symbols and a floating-point helper reached from
pr_info!() formatting. None of these show up anymore. The kernel crate
now implements atomics through the C helpers, and the
armv5te-unknown-linux-gnueabi target used here keeps the Linux EABI.

The only remaining problem was a link error. Pre-ARMv6 __arch_xchg()
has no 2-byte case, which the Rust Atomic<i16> helpers need. Patch 1
adds it the way the other pre-ARMv6 atomics work, with interrupts
disabled. Patch 2 enables Rust for ARMv5TE.

Bradley Morgan's two-byte cmpxchg() emulation series [3] does not
overlap with this. Its ARMv6 part was dropped in v2 and it never
covered xchg() or pre-ARMv6.

Tested on v7.3-rc1 with clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2.

- QEMU versatilepb (ARM926EJ-S). The Rust samples, all Rust KUnit
  suites and 355 doctests pass.
- Microchip SAM9X75 Curiosity board (ARM926EJ-S), at91_dt_defconfig
  without the ARMv4T AT91RM9200. The samples, all Rust KUnit suites and
  356 doctests pass. The Rust sample modules (rust_minimal, rust_print,
  rust_misc_device, rust_driver_faux) load and unload cleanly.
- Build test with every Rust driver, abstraction and sample that can be
  selected on ARMv5TE (rnull, binder, the two PHY drivers, cpufreq-dt,
  the DRM panic QR code). PWM_TH1520 is the exception. It uses a native
  u64 division, which does not link on 32-bit ARM.

As a further test I ported the Atmel PWM driver to Rust and ran it next
to the C driver on the SAM9X75 board. The port is not part of this
series. The comparison found a prescaler bug in the C driver for
periods of 2^32 clock cycles or more [4].

I plan to get a Raspberry Pi 1 Model B+ and then add ARMv6K support as
a separate patch.

The ARMv7 enablement went in through Russell's patch system as
"ARM: 9441/1". Unless someone prefers another route I would submit
this series there after review.

[1] https://lore.kernel.org/rust-for-linux/CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com/
[2] https://lore.kernel.org/rust-for-linux/b13d37bd-ec68-4713-94e5-e9ed4d6a6354@gmail.com/
[3] https://lore.kernel.org/lkml/20260922173354.14404-1-brads@mainlining.org/
[4] https://lore.kernel.org/linux-pwm/20261003083036.21584-1-kmehltretter@gmail.com/

Karl Mehltretter (2):
  ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
  ARM: rust: Enable Rust support for ARMv5TE

 Documentation/rust/arch-support.rst |  2 +-
 arch/arm/Kconfig                    |  2 +-
 arch/arm/Makefile                   |  4 ++++
 arch/arm/include/asm/cmpxchg.h      | 14 +++++++++++---
 4 files changed, 17 insertions(+), 5 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.39.5 (Apple Git-154)


