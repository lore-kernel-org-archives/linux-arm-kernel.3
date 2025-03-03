Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90E7C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IQ622J09wSnJWNXssDApHCSJm6KRM8/tA7lFNZ5FTck=; b=l+sbPdQb5OU23c
	Ihv4ogFOu3HNyRVsYHRqWWndrWotxtAtf4F3GXn3JBISkkdWDp4xINd7MLCNLmV0+R6i1yeQ5SoBT
	PBx3WbnqCfI7+G5+cwbmfCjbe3a2E5RBeE2o476NF+i395/rzV7RngUix/bsMHBpSagvhmA3g0em1
	w6MkPrqMkn66QHVldZZsV5Hwqg5mebbDeDGr7/dO11Y5vq+Lj/nRz6B/Goej3vCbHQkLMoaWIPBHD
	i6GhQU9NHw5rv669bKKj2upL8F6VZ/boCSUJRd4KbO7CApEMIYAkyhPJqHH4mom/8YeQridyCBe08
	sXlKF92s1MjQV6y7LdaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp43q-00000000aD2-10Yd;
	Mon, 03 Mar 2025 11:34:14 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3hX-00000000Tm6-0dla
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:12 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IQ622J09wSnJWNXssDApHCSJm6KRM8/tA7lFNZ5FTck=;
	b=wLmUqqTwTEyy8MN+fvUkhrzIqy6uOM6lVHR4jNdAeed/O8S0iqujK3aI4lGi+I3tqudxPw
	s2kIvGZ/MXyYVsQ2TqmdwnG18vmfKYSXzOhf5Aw9fndCMClBY7UvTjVWEXtE3xS5f7RqVn
	PQf7QcpBStHo1rBnCeWDhILSYYwI7qMGPTS0RviAt1Oy2cNEs180RPDVdtyda8W1ns7Iy9
	F6Vnmc2BDvBIXsbn8MLerHwdRVwBXudM4h3rwx+UXEWi/LSPZEzXXnHpFdlZzAcnAwiUAP
	5Lj2VkmHFVjYjg3fvs/gqFY0Ct2mskGOlUZKpYaitXChC2S6wwZYvOmvbnkzNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IQ622J09wSnJWNXssDApHCSJm6KRM8/tA7lFNZ5FTck=;
	b=FEFBlftntzm1vKKKD24mat2WNu3kCRIaYgAe0BZIAp5Y/dJrf3bIDUHH00UOGa0SCDwvKB
	I30YLz81uY0Z1kDA==
Subject: [PATCH 00/19] vdso: Rework struct vdso_time_data and introduce
 struct vdso_clock
Date: Mon, 03 Mar 2025 12:11:02 +0100
Message-Id: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEaOxWcC/03M0QrCIBTG8VcZ5zpDZdrWVe8Ru1h6bIeGhi5ZD
 N89GwRd/j/4fhskjIQJzs0GETMlCr6GODRgptHfkZGtDZJLxaVsWbYpMDMH82BOcMfFybS3jkM
 9PCM6WnfsOtSeKC0hvnc7i+/6Y9Q/kwXjrNMC+1GrUffqMpN/LTF4Wo8WYSilfAAsE0v1qAAAA
 A==
X-Change-ID: 20250224-vdso-clock-f10f017c4b80
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=2911;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JRTZEJBPOrhvUumVmufXGEQ++pbOss4FsXl+ME7xP/I=;
 b=1QrxVPPkzlKNesg8VwMiDXqZyZeYfZHfZ0peP4IrutVSqOiCMC4+/wyQO3rgzJ5xf+SxSKr84
 +t7EqeEhu9OAio50sRM6KyHRpohlV/LcxVaombILHk3/QzfOiPs5F4E
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031111_472749_2DB2FCFA 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

To support multiple PTP clocks, the VDSO data structure needs to be
reworked. All clock specific data will end up in struct vdso_clock and in
struct vdso_time_data there will be an array of it.

This series is based on and intended to be merged through tip/timers/vdso.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Anna-Maria Behnsen (15):
      vdso: Make vdso_time_data cacheline aligned
      vdso/datapage: Define for vdso_data to make rework of vdso possible
      vdso/helpers: Prepare introduction of struct vdso_clock
      vdso/gettimeofday: Prepare introduction of struct vdso_clock
      vdso/gettimeofday: Prepare do_hres() for introduction of struct vdso_clock
      vdso/gettimeofday: Prepare do_hres_timens() for introduction of struct vdso_clock
      vdso/gettimeofday: Prepare do_coarse() for introduction of struct vdso_clock
      vdso/gettimeofday: Prepare do_coarse_timens() for introduction of struct vdso_clock
      vdso/gettimeofday: Prepare helper functions for introduction of struct vdso_clock
      vdso/vsyscall: Prepare introduction of struct vdso_clock
      vdso/namespace: Rename timens_setup_vdso_data() to reflect new vdso_clock struct
      time/namespace: Prepare introduction of struct vdso_clock
      x86/vdso: Prepare introduction of struct vdso_clock
      vdso: Move arch related data before basetime
      vdso: Rework struct vdso_time_data and introduce struct vdso_clock

Nam Cao (2):
      arm64/vdso: Prepare introduction of struct vdso_clock
      powerpc/vdso: Prepare introduction of struct vdso_clock

Thomas Weißschuh (2):
      vdso: Introduce vdso/cache.h
      arm64: Make asm/cache.h compatible with vDSO

 arch/arm64/include/asm/cache.h                    |   4 +-
 arch/arm64/include/asm/vdso/compat_gettimeofday.h |   6 +-
 arch/arm64/include/asm/vdso/vsyscall.h            |   4 +-
 arch/powerpc/include/asm/vdso/gettimeofday.h      |   2 +-
 arch/s390/kernel/time.c                           |  11 +-
 arch/x86/include/asm/vdso/gettimeofday.h          |  16 +--
 include/asm-generic/vdso/vsyscall.h               |   2 +-
 include/linux/cache.h                             |   9 +-
 include/vdso/cache.h                              |  15 +++
 include/vdso/datapage.h                           |  48 ++++---
 include/vdso/helpers.h                            |  20 +--
 kernel/time/namespace.c                           |  20 +--
 kernel/time/vsyscall.c                            |  47 +++----
 lib/vdso/datastore.c                              |   6 +-
 lib/vdso/gettimeofday.c                           | 146 ++++++++++++----------
 15 files changed, 196 insertions(+), 160 deletions(-)
---
base-commit: ac1a42f4e4e296b5ba5fdb39444f65d6e5196240
change-id: 20250224-vdso-clock-f10f017c4b80

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


