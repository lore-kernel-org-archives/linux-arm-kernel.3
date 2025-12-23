Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBA7E6C5FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIQm5LcPW4i4G7+h/utBT1F7s6FgqfydzlSs5Y7YPiM=; b=mDleZ5tiuGvmGo3O17/E3UdIld
	goYj4+X4Mly5oDpYtUzSd1r3wkaXNmzbyHEztWnv5YGoKIUUUyIRuDvXvyj/h5uTwGGu+gAPvAfUu
	h3lXccDetd8xFf9Xcd5tYcfgj8SrkXB5D5ZtQXGuT3Xaa1dE+UoSuH/f6u+sgpFHEo/6gsNrscSdR
	GkWFAoqLbJ248GW0MUKMD20olAHKst0VCYBCBPezDMlOXnZ3mXm8JheJwRzoNfqhqXEGRQ2/waQhr
	Jo6yf5G10XTeKu+ArGr8mt94eYM2Jk3BvSGw0jbPnkwNmgmW2Wio9Qav9qHyj7or570UBuBvQjBki
	eSZiS1Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMp-0000000EcF8-1YjU;
	Tue, 23 Dec 2025 06:59:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMk-0000000EcAa-1v2B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 06:59:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1766473168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OIQm5LcPW4i4G7+h/utBT1F7s6FgqfydzlSs5Y7YPiM=;
	b=v0XPcIRJ1Se9VWcrfikZ8SiUMqYy3NIC9jGeLIKDjV+4S8qjjReSNxUZdjLmIeXDlSB8HG
	6woEZ7kPsqJG2LZluOjiYMxc0FxtIRWYm2iPmYblur8Rpnu7LE8AABtlXMABxHcrBalDjp
	pMEfdwJ13TOmbV4sw/Rnp/Y1E+4h0yBXm81lzNDIRMQeExLQsuyc0j1FiMvE+GrKm2ZJbK
	qk8D/WFRyppCewOe0hPRhJ1mK5u+5+2t9jg5WC/RF1M7yNa2csSwbBJCqsQcVM5Hwt1vC1
	qBZmMBIbVU5OQBWql3z73dicscAhvNP/5366gNjKEXr6RhyaLg5PTRJtt42ocA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1766473168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OIQm5LcPW4i4G7+h/utBT1F7s6FgqfydzlSs5Y7YPiM=;
	b=mjcx9Ik8vkbaK6t0OpQYxk1r9PLVVep7H1cDDK24He2cDIuq9wrtzQv0/Rk9mL2FxKeVzk
	rpElHTWJVOY61jBw==
Date: Tue, 23 Dec 2025 07:59:19 +0100
Subject: [PATCH 8/9] arm64: vdso32: Provide clock_getres_time64()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-vdso-compat-time32-v1-8-97ea7a06a543@linutronix.de>
References: <20251223-vdso-compat-time32-v1-0-97ea7a06a543@linutronix.de>
In-Reply-To: <20251223-vdso-compat-time32-v1-0-97ea7a06a543@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766473161; l=1457;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Z9yCCabeK7jaWFUWKtoNtsuOTpJwxt6wFaVjSU0iZHI=;
 b=8IHbebF9ZQt0Il3apsZmxynrbfbdJv1ROO2ft36v1vYuVLRlXzwnOY562A9kyn3RCXEsfyJFR
 cuMTyK0BTyID8hPsdYaw2hU185R2LxwVSs3mOhjbSNQPY8dCpBhEUMy
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_225930_658841_53B832DF 
X-CRM114-Status: UNSURE (   9.04  )
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
 arch/arm64/kernel/vdso32/vdso.lds.S      | 1 +
 arch/arm64/kernel/vdso32/vgettimeofday.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
index e02b27487ce8..c374fb0146f3 100644
--- a/arch/arm64/kernel/vdso32/vdso.lds.S
+++ b/arch/arm64/kernel/vdso32/vdso.lds.S
@@ -86,6 +86,7 @@ VERSION
 		__vdso_gettimeofday;
 		__vdso_clock_getres;
 		__vdso_clock_gettime64;
+		__vdso_clock_getres_time64;
 	local: *;
 	};
 }
diff --git a/arch/arm64/kernel/vdso32/vgettimeofday.c b/arch/arm64/kernel/vdso32/vgettimeofday.c
index 29b4d8f61e39..d7b39b0a9668 100644
--- a/arch/arm64/kernel/vdso32/vgettimeofday.c
+++ b/arch/arm64/kernel/vdso32/vgettimeofday.c
@@ -32,6 +32,12 @@ int __vdso_clock_getres(clockid_t clock_id,
 	return __cvdso_clock_getres_time32(clock_id, res);
 }
 
+int __vdso_clock_getres_time64(clockid_t clock_id,
+			       struct __kernel_timespec *res)
+{
+	return __cvdso_clock_getres(clock_id, res);
+}
+
 /* Avoid unresolved references emitted by GCC */
 
 void __aeabi_unwind_cpp_pr0(void)

-- 
2.52.0


