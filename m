Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0932BE6C5FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ayp3i9s7BDC9x4hTxnXWfTHnVTIsFOQvLKmvn+jnTBA=; b=M/Fp47DIXwTnsg
	BV16qBXQbYFQKkEByTvocJHqccZT9SmU9YQdUVT9cON7p1ADnzqQjuimWTVQ9mwUCCvCZV2kibBBj
	mX+YWh3EUSMUoL/cr20uPVofjZLOSP6KUfvqHEvZYV4Zc2TIikuLjcJEP7Vy/ez65bUuwunvAj0OG
	yPHjkGEVFMBMGn0KFRPKeK/qzDuk46aCE9J/q1sWxuMJVC2Dq0B5Wv35ZSWL6zdy096nNSWikEn6q
	G5ZKZaEun9t8Oz9iqyy9eLaIiXXCXeDxfMsFhfCBBkLgZU30tpBRREbA1d5M9f08bL4AxUioT66ho
	C1BnHzrcBaXBJVo5Qfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMm-0000000EcCs-3Df7;
	Tue, 23 Dec 2025 06:59:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMh-0000000Ec97-0GYq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 06:59:28 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1766473163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ayp3i9s7BDC9x4hTxnXWfTHnVTIsFOQvLKmvn+jnTBA=;
	b=qx2emp6AcoE/iRZCF+AQjiQqiaSI+h7BIY7Pz0OQRJsiPryNMbPcf5NQKo/4UfUhpEkrXi
	XR30A48OOgBD6gG4UL0k7wkfD7A16I/z1MlzssLS9HWYAkF9/GMg+MKqYe0Yy4e6lK5AQO
	R1xszn+I24MPGO2sxE/aHUmJ50OBwwsiDNuKr+cy9ykdEBZgNxixDCk7iIWinj41bmv9t9
	BNi9f6TeQ2cM2PwuVpJkP3zrcEfIbiJCc5IRXzuxkNxwalxU0c7Gkyt1MqnqzeNqAKF+Xe
	0iVbZu4+eTJX2EOKHjnlXnBBS8rRxshu0ZuM+2T3cGnt3ABL4/eQz0g/i+wrmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1766473163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ayp3i9s7BDC9x4hTxnXWfTHnVTIsFOQvLKmvn+jnTBA=;
	b=UZajqyzonuVXLs77wufO/1MI8Geqjmdsrf08ZX5xkMboDv++CueqOZlv61m8wAeiZgTgUT
	O1OoIRhKsGjggDDw==
Subject: [PATCH 0/9] vDSO: Provide clock_getres_time64() where applicable
Date: Tue, 23 Dec 2025 07:59:11 +0100
Message-Id: <20251223-vdso-compat-time32-v1-0-97ea7a06a543@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL89SmkC/x3MQQqAIBBA0avErBvQySK6SrSwGmsWZWhIEN49a
 fkW/78QOQhHGKoXAieJ4s8CXVew7PbcGGUtBlLUak0K0xo9Lv647I23HNwQOtP1xjlq1WyhhFd
 gJ88/HaecPz6ntL5kAAAA
X-Change-ID: 20251120-vdso-compat-time32-f4684ff250ba
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Russell King <rmk+kernel@armlinux.org.uk>, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766473161; l=1852;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=nczjxV6OWmkuLcjHG5boJWDUJPQIgRFXouBDrj7029I=;
 b=dvS9VqwRf71JdTyUUAt28L6LmZMazumZQNFfHH+8CiP0yKRfXkcnMbBFJvirOmlZ2u9wcrJiU
 fi0kJwWB4X0BPHUUkrP5+ntjOjHCHFIli44DVRgaSeTsxCD2jeobF5Q
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_225927_250608_760539B3 
X-CRM114-Status: UNSURE (   8.63  )
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

For consistency with __vdso_clock_gettime64() there should also be a
64-bit variant of clock_getres(). This will allow the extension of
CONFIG_COMPAT_32BIT_TIME to the vDSO and finally the removal of 32-bit
time types from the kernel and UAPI.
    

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (9):
      vdso: Add prototype for __vdso_clock_getres_time64()
      selftests: vDSO: vdso_config: Add configurations for clock_getres_time64()
      selftests: vDSO: vdso_test_abi: Use UAPI system call numbers
      selftests: vDSO: vdso_test_abi: Add test for clock_getres_time64()
      x86/vdso: Provide clock_getres_time64() for x86-32
      ARM: VDSO: also patch out __vdso_clock_getres() if unavailable
      ARM: VDSO: provide clock_getres_time64()
      arm64: vdso32: Provide clock_getres_time64()
      MIPS: vdso: Provide getres_time64() for 32-bit ABIs

 arch/arm/kernel/vdso.c                       |  2 +
 arch/arm/vdso/vdso.lds.S                     |  1 +
 arch/arm/vdso/vgettimeofday.c                |  6 +++
 arch/arm64/kernel/vdso32/vdso.lds.S          |  1 +
 arch/arm64/kernel/vdso32/vgettimeofday.c     |  6 +++
 arch/mips/vdso/vdso.lds.S                    |  1 +
 arch/mips/vdso/vgettimeofday.c               |  6 +++
 arch/x86/entry/vdso/vclock_gettime.c         |  8 ++++
 arch/x86/entry/vdso/vdso32/vdso32.lds.S      |  1 +
 include/vdso/gettime.h                       |  1 +
 tools/testing/selftests/vDSO/vdso_config.h   |  4 +-
 tools/testing/selftests/vDSO/vdso_test_abi.c | 55 +++++++++++++++++++++++++++-
 12 files changed, 89 insertions(+), 3 deletions(-)
---
base-commit: 15a11f3ffb629cbbf6efd272239c04a9eb3180e2
change-id: 20251120-vdso-compat-time32-f4684ff250ba

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


