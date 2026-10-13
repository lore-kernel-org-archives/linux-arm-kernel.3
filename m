Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0385ACC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 20:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CpVY6MeWJcdZtwhnTmqF4lxIQszWxkfvqL28C9V5KU=; b=gKwwjpcUmfxIqo9OnRg9HPLimV
	7L3fq4PHn+mozwE20Oz40yIL+VzHdFKspPFD7HiRT9ioISbaGZ1x4j4mr8H5k2bKbO8Lc/1mbFW3v
	RVdpFW+aOOMbCEsbjqFaxLwNq09jkJio1j1v/C/SIaXUsLpb5EGmPkx1t4dhoUD5ct5tAjZAgUpD+
	9LEoSY3R9Nx57EFDhnFxQnQgCK3CBXi7OW8qbmB7uyea7Y5XUIYFeUoz9LcqeteDfEAFBwzKDlS3l
	xemRbgpslE8zPcKXxwoXwjQSDL/YeuuvAt+t6GCFyRn4+eQbKMa+3AS387hAmS7mIq2LRfDjvzfMk
	1SfsmGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjAj-0000000E0eg-1wlG;
	Tue, 13 Oct 2026 20:32:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjAd-0000000E0aS-16L0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 20:32:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a16c399641so33916105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 13:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923541; x=1792528341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CpVY6MeWJcdZtwhnTmqF4lxIQszWxkfvqL28C9V5KU=;
        b=bORowX+aFwA2cURS1SJxi+Iq3TVuoZCjCvhMH3ZQ3drSfd9JYqZFKjzpnrBVMnpCT0
         2Uh6VksP/GA3JlcDQ5p2cJSFJP8XrmJc5LHLOS73vmVmZ60CePz4dS8U50vPb6d5jNBA
         JVV1UT5taPdHS1jEPDbrKgAmZtNRbtJgqd4BNhNNlvv2osaHoGerkIa1u8C5jGs3gAwl
         BFw8+nc4N/+h1Y7xTYsbH9eh33fjv79aNiqdFIc5Bhk/MgPI7s6q7OCGHqBTt7kReQly
         03o2KFcG5SWt+d6Uz7rgKBNZM7cx3UPPEVZRSTLZkh7svOtWPFNY2JHM5bVed6q6UzQl
         FaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923541; x=1792528341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CpVY6MeWJcdZtwhnTmqF4lxIQszWxkfvqL28C9V5KU=;
        b=CmW+571HiexWDEnUHH+okx8qVlOxN+wNvyljSKF8PMW8nB3FAqzLP0hb9k45Fbt242
         KT8OS/CFVN5gEVUxK3u4XgkOxAyb/pqqXhiDW+BQ2yd4XChvUjjosm4H0iZnlc2BqDCz
         3Ci9X/VfB2cz+5N3ikPlGCUPcoXYZT/oGmBK8WA/eJtqFvpd1xz6UhSj3Dvy7X05l6sj
         R0tU3OIhewzmpE4bGUtfewdXw4PzMBzKWVXuYa+fOP1Zl012qrxxki5JlG3PXZAGVimM
         BOtLkZ6wvr3FrgFYuPyyscFrI/vVQGI5W9MLflzcGrFyxXc39AjCmNVbz0MzgI+iTFJJ
         8h2Q==
X-Forwarded-Encrypted: i=1; AKwUvBz3uMVAdUTIK9UXFjdjlVhiG2lJiZbaOoFXVnHtWND5ccGFgKw0DhRsSEXaATZcu3hNdMzr/WFyPB2nxMQu/4tr@lists.infradead.org
X-Gm-Message-State: AFq9FYJiG7dlvOfYNQPbe/8Gt1ZEP/scHX6s/sevaVdFC0WTOkF67Uce
	EJHtpNB8BNL/fQk2hQoPKeXiXOW0zElQHfVD8Hr9tv7zIMAOWSUjk8zo
X-Gm-Gg: AYBFou3D17IRO4bEt+jEV2Xl4qpDrtYPtGNtavNuJ4Gq/6M1hDJTKrERrPbtMf97dAm
	HI+KgiOFFQLTWXBnAmlc8WW0r9amMDzwDjB40JB5nZa3XvglaDOwszHrJZQl0s1cw7+Svx/gFqB
	D+iRKyh3SOsmzEjohkjULnG7KReO+xdCqYBjzRBBSQLQwubpraB2/dNad3jNyOf8fVtI6FYNnA+
	VWSm4iFUxpwr+s1KBUz+IzJa6bRmyaKvuR+gxjUZ1LKjq5F8/wgaam+jgIFy3xFpgZ/kTYmXnTH
	CtN5a46xIY0fL9W54Q9vV18jCfAX6o5ZyNm6+cemISg8kr8TS069snE0kJXcBuAohsKeEp4jAKX
	RhAeDJLZitGnNC0AFNEWWSxyF8iWrN6JDp+fRXsDHA18WYmpvLffTPfoK4yOacAOxTQebUM1NyG
	UVx+iRr1EC4M0cPHm3haEXa6IYWDxTrc0mT/0UmDxo7P07fprHkfutmobxDEjlILAXnTIH6Bd7T
	2LAIKoIebiAfIgz6NfOC9mS8j+wfYrbgX1lhphTRfS8sIJuc11Z37AiU4ms7GaPX1SDrzZZ4uLZ
	Vj9jRLngOhmamiir83r0jTQvDf5FfSj+2B21Fdr8SCYx0lqx/t6+L01hm9XRUgA44tLvTi5Zye2
	s5ogte945mK3M3JMjLQ==
X-Received: by 2002:a05:600c:3f1a:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4a1ac667160mr69814455e9.26.1791923541329;
        Tue, 13 Oct 2026 13:32:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.32.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:19 -0700 (PDT)
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
Subject: [PATCH v3 6/6] ARM: rust: Build Rust code for ARMv7 on ARMv7 kernels
Date: Tue, 13 Oct 2026 22:31:40 +0200
Message-Id: <20261013203140.31741-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261013203140.31741-1-kmehltretter@gmail.com>
References: <20261013203140.31741-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_133223_369503_94C2675C 
X-CRM114-Status: GOOD (  12.98  )
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

The arm-unknown-linux-gnueabi target builds ARMv6 code, so ARMv7 kernels
cannot use ARMv7 instructions in Rust code.

Use armv7-unknown-linux-gnueabi when C is built with -march=armv7-a. The
target uses the soft-float EABI with NEON disabled and permits unaligned
word and halfword accesses, matching C on MMU-enabled ARMv7 kernels. A
kernel that also contains an ARMv6K CPU is built with -march=armv6k and
keeps the generic target.

In the tested Raspberry Pi 400 configuration, Rust text grows by 1.9%.
Six small benchmarks range from 10% shorter to 5% longer runtimes.

Tested on a Raspberry Pi 400 (Cortex-A72, LPAE) with clang 22.1.8 and in
QEMU virt (Cortex-A15) with the minimum tool versions. Rust modules load
with the movw/movt relocations.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a72843890241..28eb8484ff82 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -73,9 +73,11 @@ arch-$(CONFIG_CPU_32v4T)	:=-march=armv4t
 arch-$(CONFIG_CPU_32v4)		:=-march=armv4
 arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 
-# The rustc target fixes the instruction set. -Ctarget-cpu cannot remove
-# the +v6 of the generic target, so older CPUs need their own target.
+# The rustc target fixes the instruction set, so pick it like -march above.
+# The generic target builds ARMv6 code. -Ctarget-cpu cannot remove its +v6.
 rust-target-y				:=arm-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v7)		:=armv7-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v6)		:=arm-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v4T)	:=armv4t-unknown-linux-gnueabi
 
-- 
2.39.5 (Apple Git-154)


