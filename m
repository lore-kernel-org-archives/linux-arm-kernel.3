Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E8FCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VaOF3SX9PuP9+mnKSpoQErsfWZIENOxSHEW2HAnjgUc=; b=T7k6OKvqGmgtT4nijeR6TCKU1I
	zDIdoC1B6s4vh/ScQAYsZr38I5HlkRj5nM2cRAI0ptVyecOtFmhQsRODxFgzAb07qRLP+lkR2h+ic
	+/mRF91VLEuhIWEdm/RvhTjWDdzk3VTw7Sy1QqJqV5s/ulM1VPfX51gAd0ZAP2lPuOPn0KLTDgoPZ
	dgdedKUCIEuTfAvEMXNRlbygkaL/N1PNAD6SILO/fiRrP6GY1hTg6fbGFcMAuYttUOaR1jbBVRvOb
	CZpYWj8jYtV2NyliBRDYsbNCHRGLZWASYCXwFc7312ohQjEcSulQppBRaX2cd8DoCgsVblHghLes+
	oqj4xDxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHK2M-0000000025d-0u2U;
	Thu, 15 Oct 2026 11:54:18 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHK2K-0000000024n-1quE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:54:17 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6b1c2d36cabso4352036a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 04:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792065254; x=1792670054; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VaOF3SX9PuP9+mnKSpoQErsfWZIENOxSHEW2HAnjgUc=;
        b=VSWxlNK9wlAdVoEJUl0srCkQhl4XMuUtRf3UvVZQc/otTutylmyxqgUzQJaddIr5ZS
         AtdH2NbcQW+AiKnHY5DL0RqPUZeGNKy/JvDcZLyVWOJQ3Dz28IHIuDXjZ6PGkhHe88JF
         aR9RGkpobu8T3QrkU/MU0jumSqz8rJkLFCzIzZBx0Xk66zNxgW/rdSQL0UD5u7odUg3M
         gBSAX5nWhADkXMtynucwvj/JJeWo9C/pITjyCpNzGhf8R3DzHQzrQpXZ/jP8QcjTx7QZ
         DKosYM0CA7GrDC5tlxAcaBCCSeE8z9AFKjRAHHBQ9dfI4yXQNwpaj1prBYGSATDBnZBU
         gWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065254; x=1792670054;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VaOF3SX9PuP9+mnKSpoQErsfWZIENOxSHEW2HAnjgUc=;
        b=v/UvcDReayQsM383t97pGpz3RTIUHgJ2VyU/xuAU8lp+XR4GDAZNaqAo4fan7FTgV2
         Wzwe7gP2wJEVL5Afe5f82a2bj2IaC1Zzic6vDwg/oxvs6Z7HIV8T71BlvDUQOy9peHvW
         Aa0h67ZpOxOg9CR0o1PbsqmCIKx4srHJip0pj5ygx3gajfD6O9GODloyEEi+HTLBl2Me
         FKCLYm6HV0sToCRLkNe2iZJJJeX82tZ3Ahfhh2oXwYmsGTqUlhvC8AMEtH1stas7qCOK
         6gpQMNpqTy/dXPq00TcoJwHsST9hN/jWbUd1j6IPtLKYsTTn0loTWLXB0Butr3fPZhoU
         FQyQ==
X-Gm-Message-State: AFq9FYIx9j1im6vRvLa7NG7Lxgkxd1hoZguRR6ueGg8+w7Ap9HWTnl3T
	Qw2dYjkBlnTLWIZOPa/WhoK5fda6KaquU22OmDZYoT9I6ASikRHpdD7JHPQs1a6Ht6lG3rWjKg=
	=
X-Received: from eddy8.prod.google.com ([2002:a05:6402:2708:b0:6b1:d2d2:f82e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2b92:b0:6b1:ef16:1850
 with SMTP id 4fb4d7f45d1cf-6b1ef161c44mr6713554a12.43.1792065253599; Thu, 15
 Oct 2026 04:54:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:54:06 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261015115405.212211-2-ardb+git@google.com>
Subject: [PATCH] efi/libstub: arm64: Don't use the platform register x18
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_045416_490367_BFC05378 
X-CRM114-Status: GOOD (  15.16  )
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

The UEFI specification designates x18, the platform register, as "do not
use" on AArch64, so that UEFI code is compatible both with an OS that
assigns a fixed role to x18, and with one that uses it as a temporary
register.

The arm64 EFI stub and the EFI zboot decompressor only avoid x18 if the
kernel is built with shadow call stacks, as that is the only case where
-ffixed-x18 is added to KBUILD_CFLAGS, which the stub inherits.
Otherwise, the compiler is free to use x18 as a temporary register, and
it does so.

So pass -ffixed-x18 unconditionally when building the stub for arm64,
so that the image can be run by loaders that rely on x18 being left
alone, such as a kernel that uses it for its shadow call stack.

Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 564773c89d14..e13d4dfe27c5 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -21,7 +21,7 @@ cflags-$(CONFIG_X86)		+= -m$(BITS) -D__KERNEL__ $(CC_FLAGS_DIALECT) \
 
 # arm64 uses the full KBUILD_CFLAGS so it's necessary to explicitly
 # disable the stackleak plugin
-cflags-$(CONFIG_ARM64)		+= -fpie $(DISABLE_KSTACK_ERASE) \
+cflags-$(CONFIG_ARM64)		+= -fpie $(DISABLE_KSTACK_ERASE) -ffixed-x18 \
 				   -fno-unwind-tables -fno-asynchronous-unwind-tables
 cflags-$(CONFIG_ARM)		+= -DEFI_HAVE_STRLEN -DEFI_HAVE_STRNLEN \
 				   -DEFI_HAVE_MEMCHR -DEFI_HAVE_STRRCHR \
-- 
2.56.0.385.gd3acb90ef8-goog


