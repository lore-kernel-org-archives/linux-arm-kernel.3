Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305CCCD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idqKYw3C9fQUWgn5YL9zH5EFYBbK7uzwznRnT9U94JI=; b=1IbRBX0VncoDnNjf2cVarclYk8
	H7uyxm11X5ZrfuQPFFVw/jfkvwQLj6xgenw230QVEzt2KaHgUWFAK6zQ8UQForAD+pRnN32RfKX4X
	k3j0SGzquA3HnyTdrekRf1D2BCz2gh3YoKbUtFZJlgxA9PRjA4rS09CGLmAtiWFwzeK2ust3L+0KR
	ByXiWX1Twl1u4E/4lNj1L1imCzZEFjRjKWldPKx0V8oK/YjLdUbtoDYTHxXTf9CyJOWByk/n3TkgN
	ibxLtMRpWHLngPtVgQQWEzwB/lixJxhcyOvef6RT86lEmzg92Yi/cS/xUMnzcb/1qlz7ZUAPo77Qo
	tuZTHamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF0v-00000001W5g-3kjh;
	Thu, 18 Jun 2026 15:50:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF0q-00000001W1p-1bXH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:50:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5284D491F;
	Thu, 18 Jun 2026 08:50:32 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 918A63F62B;
	Thu, 18 Jun 2026 08:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781797836; bh=Ko2VFee+16pvwP91baMpmxl8dSwJJTNI/GiDgni5tAg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FbOJbtQ6uvaSmA7sqJTrUyCaIgJp0iIB0zoWhwFEu3FK37bHmNHFTNRF4m+BuZrhP
	 lsTc8Uy3M5p9eJjUMch7mrMmtJ6toeOffA/4eFXXDzLycAtMkVOobYoUEnoXGIHT75
	 AuHZ/GawB/49b3bRMM7zmwFkhOQNQ75OVt4UxMz8=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: will@kernel.org,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	oupton@kernel.org,
	jean-philippe.brucker@arm.com,
	andre.przywara@arm.com,
	suzuki.poulose@arm.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH kvmtool v2 1/7] x86: Define bioscall only in 32-bit mode
Date: Thu, 18 Jun 2026 16:49:55 +0100
Message-ID: <20260618155001.226266-2-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618155001.226266-1-alexandru.elisei@arm.com>
References: <20260618155001.226266-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_085040_455262_7CE20E4F 
X-CRM114-Status: GOOD (  11.62  )
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

The gcc online docs define the behaviour of the regparm attribute for
x86-32 targets [1], and there's no mention of the behaviour for the 64-bit
version of the architecure.

gcc version 16.1 throws this error when compiling for x86-64:

x86/include/kvm/bios.h:91:43: error: ‘regparm’ attribute ignored [-Werror=attributes]
   91 | extern bioscall void int10_handler(struct biosregs *regs);
      |                                           ^~~~~~~~

but there's no such error with gcc version 14.2.

This patch author assumes that somewhere between gcc 14.2 and 16.1 the
compiler behaviour was modified to treat the regparm attribute on x86_64
as unused. Fix the compilation error by using it only for the 32-bit
version of the x86 architecture.

[1] https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/x86-Attributes.html#index-regparm_002c-x86

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 x86/include/kvm/bios.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/x86/include/kvm/bios.h b/x86/include/kvm/bios.h
index 6f4338d50717..76beb2e0a46b 100644
--- a/x86/include/kvm/bios.h
+++ b/x86/include/kvm/bios.h
@@ -62,11 +62,15 @@
 #define MB_BIOS_SS			0xfff7
 #define MB_BIOS_SP			0x40
 
+#ifdef CONFIG_X86_32
 /*
  * When interfere with assembler code we need to be sure how
  * arguments are passed in real mode.
  */
 #define bioscall __attribute__((regparm(3)))
+#else
+#define bioscall
+#endif
 
 #ifndef __ASSEMBLER__
 
-- 
2.54.0


