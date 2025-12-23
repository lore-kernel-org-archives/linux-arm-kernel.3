Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB6FE6C5F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fal5Lt8Ujjh98Cvo/iVl7Sv7IWHmGFZ2hmLaXyUcQ9c=; b=tYa/0/8yWk7xoZ2rw4pCZTLBE2
	WMtAFuIza+ytgJ4+U05KpzZFVjsixRwxwGBg5FW/mDvNKot2SIKBXWAYZj5QpLz+k9an453qjMtYe
	LCMyB/LDMp0r23XHuHBN8OLiy6lznE+EKEGeyG6jgOixlQOnini4IooRaHghnzUg9mzDiWWXyTSAn
	jR4rv2FdzdvpqVYYUlSxp+2SoERUmkPzwtxdLbpnTW+avsd1dPGL2T0fecerTUwKwAa+o5e5iiTg0
	1YopuMed4aqtVP1esYGYCguC4pzfbpRoC+tekDu7YNfjoM+8elHGxsH/AlVX52qEe2ULluktoRXNR
	qEL/X2nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMo-0000000EcE8-1DSM;
	Tue, 23 Dec 2025 06:59:34 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMj-0000000EcAS-43as
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 06:59:31 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1766473167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fal5Lt8Ujjh98Cvo/iVl7Sv7IWHmGFZ2hmLaXyUcQ9c=;
	b=dMbBbCtJPAN363V9bWHRKHal43sPznzFhzguiLQR5kee2VlsH5FzeRxZeeBhNUGoVIFJXy
	JiAeERtfEIYgpNdmpjibcyJAsKSBkMhHCo7pORZ4dwpun8hTLvs4QIdNSLFrEQfLUrp0n3
	UVjmYt97DuX4FFA//5/ZJp3sVnt9c8lQnmeaYC1ikX7Eu3+K2ugpFaqAozZXHF58Vo5leq
	VcJ63NqyPJ8hmR//naAyOOhFco5wr0DmVlJy8UEGjGmwrWHtanQSX9H1Pt6RvZeoqX8FN4
	4mLFD3B8JNW4xquc4VEh9/HYon71GqK+N5+SlhakcOXJmilzWrxZ6AXUj2KNHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1766473167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fal5Lt8Ujjh98Cvo/iVl7Sv7IWHmGFZ2hmLaXyUcQ9c=;
	b=MSy4y5aYk0luzcuZ5fml8H0+lOtatthm2+rP7QBlAp6WCW01J2hsOahTjqzGZ2z2NMzdcC
	kp+W7OhQWnWIP6Cw==
Date: Tue, 23 Dec 2025 07:59:16 +0100
Subject: [PATCH 5/9] x86/vdso: Provide clock_getres_time64() for x86-32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-vdso-compat-time32-v1-5-97ea7a06a543@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766473161; l=1562;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=IvA+uiMrAr9HqJqYohodphYTHFiPNDzZlCh3LmEVNwY=;
 b=ryWMVgZE7OSgfUee0YnHDNFjRmfEX2J4YH5AvG6em4P29DD8b0MhuVsHOGOzVC6aJ6yp48/du
 u7hWc6Xkk4pAd8nIUvH/QKa/qTWBKThZk5+4uhx+GvgXI6Pv/BWqrXT
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_225930_151883_3BFD70A7 
X-CRM114-Status: UNSURE (   9.77  )
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
 arch/x86/entry/vdso/vclock_gettime.c    | 8 ++++++++
 arch/x86/entry/vdso/vdso32/vdso32.lds.S | 1 +
 2 files changed, 9 insertions(+)

diff --git a/arch/x86/entry/vdso/vclock_gettime.c b/arch/x86/entry/vdso/vclock_gettime.c
index 0debc194bd78..027b7e88d753 100644
--- a/arch/x86/entry/vdso/vclock_gettime.c
+++ b/arch/x86/entry/vdso/vclock_gettime.c
@@ -74,4 +74,12 @@ int __vdso_clock_getres(clockid_t clock, struct old_timespec32 *res)
 
 int clock_getres(clockid_t, struct old_timespec32 *)
 	__attribute__((weak, alias("__vdso_clock_getres")));
+
+int __vdso_clock_getres_time64(clockid_t clock, struct __kernel_timespec *ts)
+{
+	return __cvdso_clock_getres(clock, ts);
+}
+
+int clock_getres_time64(clockid_t, struct __kernel_timespec *)
+	__attribute__((weak, alias("__vdso_clock_getres_time64")));
 #endif
diff --git a/arch/x86/entry/vdso/vdso32/vdso32.lds.S b/arch/x86/entry/vdso/vdso32/vdso32.lds.S
index 8a3be07006bb..6f977c103584 100644
--- a/arch/x86/entry/vdso/vdso32/vdso32.lds.S
+++ b/arch/x86/entry/vdso/vdso32/vdso32.lds.S
@@ -28,6 +28,7 @@ VERSION
 		__vdso_time;
 		__vdso_clock_getres;
 		__vdso_clock_gettime64;
+		__vdso_clock_getres_time64;
 		__vdso_getcpu;
 	};
 

-- 
2.52.0


