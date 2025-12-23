Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05769E6B25F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 06:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mM2FUnSVD45WvsERcA4Tj2tAAZnWuUSteOTQa2M4nbc=; b=hzIb9md/iKm8ZuiN7o+tIMj+lj
	CW7Y9xU1cEEjggMlynnpJTWRT9fcudVjXyTHl35A4HPcOANmgR1ryk9E6EEFKMSvxAQRuW6m/y65u
	058yXsgoWL1Qcw1R6mVpE6GfFHnxRLscngTMN1/C8bWg38vIaAI8tQeA9Sl142o4lmC7DJtXhbwm3
	jCrYfuyGPXEbdhEg/LT2AD4JzI2rRMotJXpmgqBJTxxrR4D2jY04ww4cHCYOiQXqgfkAWlJ71YX9W
	TaUgbTba1lFRxIz0zs755X40961kTxNGl1IRGwi/a/s8jufAQgPgrCBbJ0ppZIWn+QpqDndLSDz1w
	BbL6rtQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMq-0000000EcHH-3fRh;
	Tue, 23 Dec 2025 06:59:36 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwMl-0000000EcB7-1rlo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 06:59:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1766473169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mM2FUnSVD45WvsERcA4Tj2tAAZnWuUSteOTQa2M4nbc=;
	b=XC+dlZEx0hOWtTVhdiY1gIT200+4orY4OLW8hMT+k7m18wWJVaCcoQKTHEKQyuIyAF+rzr
	ykEATKYYMNDUSqd1YHXYZsTw45sBhGZ5hwPRiRygEq1bjNb9SHg2hyUe1OYZDmD0UM60wG
	+bsmBC5tDjIhvyl0fRDM5G6kvu7hbC7xLuw08kzbrP+Es9gCB9ZlXUpk9jebL/E1JvQbot
	B+Ma3layleeKbj0lFMowyi4gWvp09XSOQHKDgcN8/+9SzauRdohUwdlMf3bcPlOWgxXNp2
	2ZR1xfSYHw2BNUHOXBrF/fCOqJ6vGlkitwtnwi0+HZwvoPHjKUEaIvI6h8fMEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1766473169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mM2FUnSVD45WvsERcA4Tj2tAAZnWuUSteOTQa2M4nbc=;
	b=aQcdd4oK6OqxKV0iUCrlWPMUZ5iWlq0R4haZuSns4MDs+JY4k89d4sUXTdM13mP8NgkUja
	f74MfFbCgkiLkaBg==
Date: Tue, 23 Dec 2025 07:59:20 +0100
Subject: [PATCH 9/9] MIPS: vdso: Provide getres_time64() for 32-bit ABIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-vdso-compat-time32-v1-9-97ea7a06a543@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766473161; l=1324;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=RMI5k+F7krRakVS3hHkFucei6uZny6MTPLu5777RVD0=;
 b=FByXLnZDtqFeAsI04xGLObUsOOvjQRML1ATRv1MT5GgR20btjHvIoffIcSRS07gaXJejOb1Ou
 U7yhvSnzbP0AqwbnejJr7AWQjsKwDDviO1gh3dDeEK9TMplIHHd665C
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_225931_631894_5326CCF7 
X-CRM114-Status: UNSURE (   8.88  )
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
 arch/mips/vdso/vdso.lds.S      | 1 +
 arch/mips/vdso/vgettimeofday.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index c8bbe56d89cb..5d08be3a6b85 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -103,6 +103,7 @@ VERSION
 		__vdso_clock_getres;
 #if _MIPS_SIM != _MIPS_SIM_ABI64
 		__vdso_clock_gettime64;
+		__vdso_clock_getres_time64;
 #endif
 #endif
 	local: *;
diff --git a/arch/mips/vdso/vgettimeofday.c b/arch/mips/vdso/vgettimeofday.c
index 604afea3f336..59627f2f51b7 100644
--- a/arch/mips/vdso/vgettimeofday.c
+++ b/arch/mips/vdso/vgettimeofday.c
@@ -46,6 +46,12 @@ int __vdso_clock_gettime64(clockid_t clock,
 	return __cvdso_clock_gettime(clock, ts);
 }
 
+int __vdso_clock_getres_time64(clockid_t clock,
+			       struct __kernel_timespec *ts)
+{
+	return __cvdso_clock_getres(clock, ts);
+}
+
 #else
 
 int __vdso_clock_gettime(clockid_t clock,

-- 
2.52.0


