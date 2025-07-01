Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF245C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UWqa3o/KH1fxq5ngNTN1gEpoaEETkdHSnWpn0ajyl6w=; b=Pp/2xfKCxkuWtd
	dSQXwQRwP4incKApCtg+01qF/qh1GQNANz4/6iuHs9HGhowKO5enqafz8Yuor5nsDlh4D1Rb7UTCd
	MrqqFFDdu2Pkne7e6p1bXTg75LW8GdMU5CQUSG7DVnZdkTM7NmUe9OzpyFDYiIjOJUaDiwI39r/mF
	bJxkYXZXKwBybbX/CCMac+BgQhWHMMihWhywO9Imu4zCfMTFV9Y/+4UPiv4x6vzBdpadI/W+uw5lu
	Km35CM+S7LHQ5AIdTzKchA2GHRSUDStHwqegDJjiKKEIVCCUNKre1Dsw/ZDJwbUX7Kn8kpgugGOsX
	IxFQlXa1YSEGjMkOVoOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXsD-00000004glV-1DfV;
	Tue, 01 Jul 2025 10:05:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWor-00000004WEO-0gRu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:58:26 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UWqa3o/KH1fxq5ngNTN1gEpoaEETkdHSnWpn0ajyl6w=;
	b=l7iG879WE8+uil1trLDqTYeE4L9pM5Rf+pCxkms/shlWot8WLot8/sNpSdtNPVsnwrr6Y4
	0/lkK/S1N/msIkgcDAUfBzAzjoo1QzvYBuAbM7redimuKHm4rfriBoa3eKMe6+qY6iA80i
	gEYcERB04n7G5BSAAc2WF/07/i24sw4ClAXulcHGD61dPykQnd0RP80jrD6A3IOWEhKAEN
	jigB72kmBcTvAsgSBuy9WSP8k8r4MXuazT6rS/YBgPVrN98xdXJTx5s2LV+MohLdjGHTfS
	BGptH77ybmk7gX3RAWAQGAQZ7HXdTbBcxzHQ09Topg0XuTMypXkn8xDUl0H5fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UWqa3o/KH1fxq5ngNTN1gEpoaEETkdHSnWpn0ajyl6w=;
	b=P93PkXHfKtHE62vs4BQWz1RAY3Uy++kBAAQbK9eCyc5MEUvNgJqebMmyPiuXGZtGEdYZ/x
	wE1u/oTSisTMUCBA==
Subject: [PATCH 00/14] vdso: Add support for auxiliary clocks
Date: Tue, 01 Jul 2025 10:57:54 +0200
Message-Id: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABKjY2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM2MD3bKU4nzdxNKK5Jz85GxdS/PEpJQ0i1QDE6NEJaCegqLUtMwKsHn
 RsbW1ANOskK9fAAAA
X-Change-ID: 20250630-vdso-auxclock-97abdf8e042a
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, John Stultz <jstultz@google.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
 Richard Cochran <richardcochran@gmail.com>, 
 Christopher Hall <christopher.s.hall@intel.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Miroslav Lichvar <mlichvar@redhat.com>, 
 Werner Abt <werner.abt@meinberg-usa.com>, 
 David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, 
 Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
 Antoine Tenart <atenart@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751360285; l=2895;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=xIfkmx4pDxXevXPAx1p1JGHwhxJQ6cisMgo/fbdsq6s=;
 b=2ONxPG8pv+6YEU4JGQr/Cz0X4Yw33GMIFt1iZdAqeec5uo7jeOJouKKyrYKvl12fEyvfryPDt
 c2oLZ3iKm+XCT5R5Ibl/1mJbmxQgOg630sIJLuIcvqObiNdarbzu8KB
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_015825_346398_039E1706 
X-CRM114-Status: UNSURE (   9.91  )
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

Extend the vDSO for fast-path access to auxiliary clocks (CLOCK_AUX).
The implementation is based on the generic vDSO infrastructure and works for
all its supported architectures.
Namely x86, arm, arm64, riscv, powerpc, loongarch and s390.
No changes to userspace are necessary.

Based on timers/ptp of tip.git.

This also depends on v6.16-rc2 *exactly*.
The specific dependency is commit 11fcf368506d ("uapi: bitops: use UAPI-safe variant of BITS_PER_LONG again"),
which is available in v6.16-rc2.
Unfortunately that got broken again in v6.16-rc3 by
commit  fc92099902fb ("tools headers: Synchronize linux/bits.h with the kernel sources").
Another fix for this is pending [0] and should make it into v6.16.

[0] https://lore.kernel.org/lkml/20250630-uapi-genmask-v1-1-eb0ad956a83e@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (14):
      selftests/timers: Add testcase for auxiliary clocks
      vdso/vsyscall: Introduce a helper to fill clock configurations
      vdso/vsyscall: Split up __arch_update_vsyscall() into __arch_update_vdso_clock()
      vdso/helpers: Add helpers for seqlocks of single vdso_clock
      vdso/gettimeofday: Return bool from clock_getres() helpers
      vdso/gettimeofday: Return bool from clock_gettime() helpers
      vdso/gettimeofday: Introduce vdso_clockid_valid()
      vdso/gettimeofday: Introduce vdso_set_timespec()
      vdso/gettimeofday: Introduce vdso_get_timestamp()
      vdso: Introduce aux_clock_resolution_ns()
      vdso/vsyscall: Update auxiliary clock data in the datapage
      vdso/gettimeofday: Add support for auxiliary clocks
      Revert "selftests: vDSO: parse_vdso: Use UAPI headers instead of libc headers"
      selftests/timers/auxclock: Test vDSO functionality

 arch/arm64/include/asm/vdso/vsyscall.h    |   7 +-
 include/asm-generic/vdso/vsyscall.h       |   6 +-
 include/linux/timekeeper_internal.h       |  13 +
 include/vdso/auxclock.h                   |  13 +
 include/vdso/datapage.h                   |   5 +
 include/vdso/helpers.h                    |  40 ++-
 kernel/time/namespace.c                   |   5 +
 kernel/time/timekeeping.c                 |  18 +-
 kernel/time/vsyscall.c                    |  70 ++++--
 lib/vdso/gettimeofday.c                   | 212 ++++++++++------
 tools/testing/selftests/timers/.gitignore |   1 +
 tools/testing/selftests/timers/Makefile   |   2 +-
 tools/testing/selftests/timers/auxclock.c | 406 ++++++++++++++++++++++++++++++
 tools/testing/selftests/vDSO/Makefile     |   2 -
 tools/testing/selftests/vDSO/parse_vdso.c |   3 +-
 15 files changed, 683 insertions(+), 120 deletions(-)
---
base-commit: 4e83b31e48cf2e62aeaed5cd9875c851e36a90d9
change-id: 20250630-vdso-auxclock-97abdf8e042a

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


