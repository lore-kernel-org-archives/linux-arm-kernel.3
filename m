Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84D6FA1FD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kYxQRmgWL10tNyaOHfasdqrNIaBKejXOgZBLd6p7uKY=; b=36TxmR+Eh5vV/+cU8om8nT4eWs
	p2idrcNkPVzPjF6DIV2cGMjMQTDMSXy0zyb2iwzq4vp8A/GDzbXwnLuocxUW1Aued/b5gocjsumRA
	J6YUYodBFfQbfoSm2F4bzDKto49HZkLl04Gr+CUDJpm1lE1alH1RnV1QJ/sLQ4Fg+U0qthdbiUEjd
	3+ca2LlpSYhaDo3zP0AHbaWPb/nQvT+GFfkF9EnOW41//cra4a9KtNp+G5q4FCEJ4+i/ePUkJm2Ix
	P3iMzsMo+LRoIRbAE2jYa242goVWIPkJpwSdms6q7BSlwy0fz20AVoowJGY+7H5gmEen4fwxRsPpD
	URZVD1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCT-0000000AYUc-2ar3;
	Wed, 22 Apr 2026 17:17:21 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCR-0000000AYSu-1h3J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:17:20 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48a5775d647so18601445e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 10:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776878237; x=1777483037; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kYxQRmgWL10tNyaOHfasdqrNIaBKejXOgZBLd6p7uKY=;
        b=SrFtEamZc54Cp1X6R5oh1vbehFc2Zi74qKQVg3pUrEmu2yzNoyBm9PvgpjKbY1iAke
         6n+CVgKijKQiYAN8cC3opSH039kRJ9w3PBkCjd1qP3swIwIPswA0fayPShiCNSI6EFM1
         7fuXaElAJkdNBSsme6AHezi2iHB8gHqu4T+KCwYwUIFWe78SARmn9SrF7jCzVNThFhEc
         uWU7XRoDn5XT9YEKbmcNSUuUz2+9BJjbIqvx8R9Hv1Ugd32EKjpq1NWbuMe/E1wtk40u
         8Ewp+ekikgRKZSJmNWJg+d4LjDGhGHuE6nKFYUitq8yetOviNZbngQLFy88H3RoR/H51
         svZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776878237; x=1777483037;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYxQRmgWL10tNyaOHfasdqrNIaBKejXOgZBLd6p7uKY=;
        b=G9bA0OHX2NmLkkRifilnR1EhC5nbYalDDZuvNIIZ69z9nkkcOdR2ZxPGp7tySZmfyW
         2tDrDnCI2V7Yjk0JHVlAEe2EWIT3zi783vz7/QZiA54z2mV+0YzthIONXVnp1SeDy/rZ
         H3D2873dj7tTD9YEwqRTkcR2N/0j84vwEOPRzQIWys0nel5rwwty1yDHsD1ONGHSEESi
         Tx+H26Dyu/dLy/U+w8ZfWXvN83VjJrMvIyqLn/3ENdEXGVn8akW02PDOFzgV0uv2MUbM
         OwOChpJntbQPdj6ort28W5BIubcPUA2ew163KbpbXtg3kkYY0UQa5nhqzn4K5Qm7JUFK
         y7QQ==
X-Gm-Message-State: AOJu0YyKZUFO1so+ryU95DHOc3KYhHIguusv4iS+krEZDeO87jY+2xe0
	RD1Z9AtQ78suyjSN2QcTc1ds56ef4LKvnZUyJUgdbnINnaMJK1X7w1C9V6UokYspwp9wB6FlvQ1
	dHIigyD6p2FxeceZSRPVVMoziVeuJ1bNuyWn0eNgDpC2FcYBMT51yEw2fZIF2K7TchM8rT+oybw
	XKPt1Eiy8hOrwxCV9nI/XlJwhr/990sA+8d4AUPQsa4oxs
X-Received: from wmdd11.prod.google.com ([2002:a05:600c:a20b:b0:489:2707:4020])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a305:b0:48a:53cb:85f4
 with SMTP id 5b1f17b1804b1-48a53cb8734mr116179845e9.24.1776878236564; Wed, 22
 Apr 2026 10:17:16 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:16:56 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3867; i=ardb@kernel.org;
 h=from:subject; bh=Sh8pW1uPCO2h+APBzbOrM5AIp7/bTjvvCSSkfDl1xjQ=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfMlU8fyK1ONpNMPPHw/afZpC+8Sx9/tOTyz5fJn/fO1r
 Olg+ruso5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzk0TFGhvbaFvPk+T7BW3Qu
 ib7R8PyeI/gnJFTdWC3MNS5ROfR8LyPDer/a+MlfnKbOiXvsI/JIYtWUH+FfInoz4m88+JI+OyS QCQA=
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260422171655.3437334-10-ardb+git@google.com>
Subject: [PATCH 0/8] ARM crc64 and XOR using NEON intrinsics
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_101719_498103_09E3B851 
X-CRM114-Status: GOOD (  19.16  )
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

This is a follow-up to both [0] and [1], both of which included patch #1
of this series, which introduces the asm/neon-intrinsics.h header on
32-bit ARM. The remaining changes rely on this.

The purpose of this series is to streamline / clean up the use of NEON
intrinsics on 32-bit ARM, by sharing more code, clean up Make rules and
finally, getting rid of the hacked up types.h header, which does some
nasty things that are only needed when building NEON intrinsics code.

Patches #2 and #3 replace the ARM autovectorized XOR implementation with
the NEON intrinsics version used by arm64.

Patches #4 and #5 enable the arm64 NEON intrinsics implementation of
crc64 on 32-bit ARM.

Patches #6 and #7 drop the direct includes of <arm_neon.h> and perform
some additional cleanup to reduce the delta between ARM and arm64 code
and Make rules.

It would probably be easiest to take all these changes through a single
tree, and the CRC tree seems like a suitable candidate, if Eric agrees.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>

[0] https://lore.kernel.org/all/20260331074940.55502-7-ardb+git@google.com/
[1] https://lore.kernel.org/all/20260330144630.33026-7-ardb@kernel.org/

Ard Biesheuvel (8):
  ARM: Add a neon-intrinsics.h header like on arm64
  xor/arm: Replace vectorized implementation with arm64's intrinsics
  xor/arm64: Use shared NEON intrinsics implementation from 32-bit ARM
  lib/crc: Turn NEON intrinsics crc64 implementation into common code
  lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64
  crypto: aegis128 - Use neon-intrinsics.h on ARM too
  lib/raid6: Include asm/neon-intrinsics.h rather than arm_neon.h
  ARM: Remove hacked-up asm/types.h header

 Documentation/arch/arm/kernel_mode_neon.rst        |   4 +-
 arch/arm/include/asm/neon-intrinsics.h             |  60 ++++++++
 arch/arm/include/uapi/asm/types.h                  |  41 ------
 crypto/Makefile                                    |  10 +-
 crypto/aegis128-neon-inner.c                       |   4 +-
 lib/crc/Kconfig                                    |   1 +
 lib/crc/Makefile                                   |   9 +-
 lib/crc/arm/crc64-neon.h                           |  34 +++++
 lib/crc/arm/crc64.h                                |  36 +++++
 lib/crc/arm64/crc64-neon.h                         |  21 +++
 lib/crc/arm64/crc64.h                              |   4 +-
 lib/crc/{arm64/crc64-neon-inner.c => crc64-neon.c} |  26 +---
 lib/raid/xor/Makefile                              |  13 +-
 lib/raid/xor/arm/xor-neon.c                        |  26 ----
 lib/raid/xor/arm/xor-neon.h                        |   7 +
 lib/raid/xor/arm/xor_arch.h                        |   7 +-
 lib/raid/xor/arm64/xor-eor3.c                      | 146 ++++++++++++++++++++
 lib/raid/xor/xor-8regs.c                           |   2 -
 lib/raid/xor/{arm64 => }/xor-neon.c                | 143 +------------------
 lib/raid6/neon.uc                                  |   2 +-
 lib/raid6/recov_neon_inner.c                       |   2 +-
 21 files changed, 340 insertions(+), 258 deletions(-)
 create mode 100644 arch/arm/include/asm/neon-intrinsics.h
 delete mode 100644 arch/arm/include/uapi/asm/types.h
 create mode 100644 lib/crc/arm/crc64-neon.h
 create mode 100644 lib/crc/arm/crc64.h
 create mode 100644 lib/crc/arm64/crc64-neon.h
 rename lib/crc/{arm64/crc64-neon-inner.c => crc64-neon.c} (62%)
 delete mode 100644 lib/raid/xor/arm/xor-neon.c
 create mode 100644 lib/raid/xor/arm/xor-neon.h
 create mode 100644 lib/raid/xor/arm64/xor-eor3.c
 rename lib/raid/xor/{arm64 => }/xor-neon.c (56%)


base-commit: 6596a02b207886e9e00bb0161c7fd59fea53c081
-- 
2.54.0.rc1.555.g9c883467ad-goog


