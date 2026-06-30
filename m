Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEEBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJlJzdmoKaPgYs3XkyTM2uOkRwW778HSxBnDi52Vm7M=; b=4GlGrr7FX1SJEwi8IdY7WyfonQ
	dPkqOt+HDcPwPtAIgBGOad5EyJCn3BDSbCkDgRlXTDBjwg4iY+aVsT/5zPXgjcYK4RiEyPRpredoc
	Q9d+tzavAwyATqT96qyXpdIL8isRJojjMF4Ir1YX+dVyc4FoUhqipucOC6X2kfQE5ri7xH9Ua+Dbj
	/mr8hzz1aSrsB4Pre2xgoNMHmqk5nTgLMHUFWNCKZqs9886/HzsEuoODG3iOwRpm/oRN4QG1mWdw/
	Wr2rQ+2ABJ0Khj2+DQcNe8NRsvp8VeyNKdHCASvSl6whr9CCUYbh/5DgBtp+zzCCRQ1SxRHO/iflr
	ifbZlV4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT3x-0000000G7jT-3uQO;
	Tue, 30 Jun 2026 07:39:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT3R-0000000G7Je-2WC4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 07:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qJlJzdmoKaPgYs3XkyTM2uOkRwW778HSxBnDi52Vm7M=; b=i3DsDos6YiWazBFzkFevyiRu/M
	Y/PlNxjqooC9I24okIRB1s49w4aD1MYBZ9a5rpIAg52h+OrKZIoN5ibHHETEvAJhcUCqmet6tmDmM
	ThLWZ+NLc6EjupuVtxxzLiFjFs+ILaTwWrawCX6w51vNAQ0LQobH1rRxr7pz16WzqZhYKM0qx87Mk
	nfZOeONwmtj64viAZjM1ef+8LCkqCIo2A0tVuCb7y8VaNO+nP3LDiAoOvKfKFBCdibbaNA5zeKow6
	2hO0pu5QQ9/APsOI4UOmL5Zghl2l8lBPxOx1/R28N7DSLCC9gsJpwSAM//4YXz7z0kAA1dGGj69YB
	aJDpl3xw==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weT3N-00000001c61-3qu9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:38:47 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782805121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qJlJzdmoKaPgYs3XkyTM2uOkRwW778HSxBnDi52Vm7M=;
	b=0r1pz1IRmEhdi1svwnFqxKbPu7TzeFCZMZpxFJJtm4Jp369U/2CcU9knvHDp5DNRtK59Vl
	f0O5a5AudG+1wHY6G2DO/HgF+Zwgj2MdpHfs3kqaSlKLvdI3LXqT/KYhjhkJ3elJUHz/zY
	UxTfh2NHPeWR8MdqxAtAn8W/b8+JVdQnKHQqcwY5dSdx1NT03FF0MRas7ucBqCcFp+VsiA
	hJnfJ7XcnUH4QCWHhZAPKgwBx5wsr+8VMqXBiByLydBjTyMEvDJnP4ANdCpAeHpyuOIur/
	LyvxxLBvn3OPf5g1yHh0ChqIntL6X4nxNSqfja7pnMPZ2mDv9JgwUFIuRX/F6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782805121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qJlJzdmoKaPgYs3XkyTM2uOkRwW778HSxBnDi52Vm7M=;
	b=dKF5P0SH7UeBCiEd4D0aAsr0LulQkFMW+XNL13e04TGw0dDaT9TShwqRXWOUV8Z5QFOTHZ
	CMq+r1b8UtedgFCw==
Date: Tue, 30 Jun 2026 09:38:36 +0200
Subject: [PATCH v2 7/9] MIPS: VDSO: Respect COMPAT_32BIT_TIME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-vdso-compat_32bit_time-v2-7-520d194640dd@linutronix.de>
References: <20260630-vdso-compat_32bit_time-v2-0-520d194640dd@linutronix.de>
In-Reply-To: <20260630-vdso-compat_32bit_time-v2-0-520d194640dd@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, 
 sparclinux@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782805116; l=1716;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Y3HmBsDyRXYMBklzibJJx8Xw8D+NzjIxpzvmQa5/92I=;
 b=pvdSGJwi0a8pc2utGGLPCI1gG+1BwWkeRAfn5FRxIp4bwh/fT2JRVhxqz22oPde4hijoOrZD3
 nigKZNlG9AJATsm5boBYD8nY2NsJK+JPbqfBa4ZvhYg+mi3+dC54V5I
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_083846_178283_DD342D7A 
X-CRM114-Status: UNSURE (   9.58  )
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

If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
provide any 32-bit time related functionality. This is the intended
effect of the kconfig option and also the fallback system calls would
also not be implemented.

Currently the kconfig option does not affect the gettimeofday() syscall,
so also keep that in the vDSO.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/vdso/vdso.lds.S      | 2 ++
 arch/mips/vdso/vgettimeofday.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index 278ab6444e98..b11ee493c67f 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -97,9 +97,11 @@ VERSION
 	LINUX_2.6 {
 #ifdef CONFIG_GENERIC_GETTIMEOFDAY
 	global:
+#if _MIPS_SIM == _MIPS_SIM_ABI64 || defined(CONFIG_COMPAT_32BIT_TIME)
 		__vdso_clock_gettime;
 		__vdso_gettimeofday;
 		__vdso_clock_getres;
+#endif
 #if _MIPS_SIM != _MIPS_SIM_ABI64
 		__vdso_clock_gettime64;
 		__vdso_clock_getres_time64;
diff --git a/arch/mips/vdso/vgettimeofday.c b/arch/mips/vdso/vgettimeofday.c
index 00f9fcfc327e..a1fb06b8973e 100644
--- a/arch/mips/vdso/vgettimeofday.c
+++ b/arch/mips/vdso/vgettimeofday.c
@@ -12,6 +12,8 @@
 #include <vdso/gettime.h>
 
 #if _MIPS_SIM != _MIPS_SIM_ABI64
+
+#ifdef CONFIG_COMPAT_32BIT_TIME
 int __vdso_clock_gettime(clockid_t clock,
 			 struct old_timespec32 *ts)
 {
@@ -29,6 +31,7 @@ int __vdso_clock_getres(clockid_t clock_id,
 {
 	return __cvdso_clock_getres_time32(clock_id, res);
 }
+#endif /* CONFIG_COMPAT_32BIT_TIME */
 
 int __vdso_clock_gettime64(clockid_t clock,
 			   struct __kernel_timespec *ts)

-- 
2.55.0


