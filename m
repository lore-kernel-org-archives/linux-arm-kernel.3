Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC93DE6B25F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8E8Ivu99/HVuC0LZwh9B42Hwzqh7mGm8g9MZgjeErS0=; b=WdjDrkrS2XWRxbyiSxGIH8Un8b
	OKQHP7Inz4WiZ8vLAdJhuQHXN7f3WZ4nZJYZNrZzDomo9eZUQhiiIVrM20H6rkL+AdlFNbJ2ZQ16K
	tsdg+yVRID+UCRgNL7ISh9eWiG83ykQ6O9OcyoJA4/H0q0LAH2fzGg/IvRj/ERWyZHW+9ker4hZVO
	fCfm5fqTetpKPIGC1tDslnXQNoghQ+hBQQOV5mpQOtYhHhRxO2ZkYi5Q2RTN3MI7itsjx03JXis9U
	/2bAAm7GxNFu76+2dzgkz9hYhqGeQDp8ZYH4/GVvHuNCQTdC7kiusulg9L/IVnkbkFr34u7YkTjb6
	OkIm7q2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMj-0000000EcAZ-1T45;
	Tue, 23 Dec 2025 06:59:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMh-0000000Ec96-0JUW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 06:59:28 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1766473164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8E8Ivu99/HVuC0LZwh9B42Hwzqh7mGm8g9MZgjeErS0=;
	b=EoXm8aC55tPTBXK/gCo2lxmTsv/A6ohpOKDAsy2GpS6bsMK0F8g4blnpIr9npv3ziGeTYN
	CL6vT5zL208usp8hRLLHVLGZ2NdMnRYibOlqqKrLQGaA70fxf3WiXmdPvLRJRaH8ub7PhM
	rAW8ByxEH5Fz6uSNkhQdZfUE/6SNYnDHOA/3Hu06rH3TPnRdyV2ZfLLm5Mp4zpDbZy9LU/
	Pca3jvTqBYnJtd/2UXHGd8itL2yL9WUhIf4XfTpBz6YBMahB8fHWzmfZjt0bc5v0h6zw4q
	qN/QTyYslcJ7F8jbOBRkdCGN+zmzcWc6V4d7m6vo2MOzccaxmp5hkjyYGXYhlQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1766473164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8E8Ivu99/HVuC0LZwh9B42Hwzqh7mGm8g9MZgjeErS0=;
	b=NsAYVGKe6DQvVeQdirLy9LxIA1vyd6cesbtD3Xkk2DJhNBvdNXzQryrumcjnwNTy6UTqZK
	b4R6zZBReHFT4UDA==
Date: Tue, 23 Dec 2025 07:59:12 +0100
Subject: [PATCH 1/9] vdso: Add prototype for __vdso_clock_getres_time64()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-vdso-compat-time32-v1-1-97ea7a06a543@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766473161; l=1264;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=K4wy0s4CBq0/Oz/7KIB2b4pnhTCd4YJf0KADDSnMZSU=;
 b=Ipjk/byTy8QYXnH5TqmDxb6BDi4gwx7RLw3Nonfnjc2lw/87OQyuJRuYaYanY8bb3n/Fth7bO
 WA1HeouZqZxCr4cvwyepl0r4aycsRVwYkSUrUlijSIWlwZ4y4bJ5QyE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_225927_253546_15095F7A 
X-CRM114-Status: GOOD (  10.21  )
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
time types from the kernel and UAPI. The generic vDSO library already
provides nearly all necessary building blocks for architectures to
provide this function. Only a prototype is missing.

Add the prototype to the generic header so architectures can start
providing this function.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/gettime.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/vdso/gettime.h b/include/vdso/gettime.h
index 9ac161866653..16a0a0556b86 100644
--- a/include/vdso/gettime.h
+++ b/include/vdso/gettime.h
@@ -20,5 +20,6 @@ int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts);
 __kernel_old_time_t __vdso_time(__kernel_old_time_t *t);
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz);
 int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts);
+int __vdso_clock_getres_time64(clockid_t clock, struct __kernel_timespec *ts);
 
 #endif

-- 
2.52.0


