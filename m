Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BFEFD5305
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxVvigSVkiA0ULS8sVET9zTxBqGaaQQOZYasgU53BKI=; b=G4j4e2sRhjBCSHJxKnATCgdf6p
	X6AgdszShZot8O4qjytugkEFQFIUncontRrmIS+0ePTKOnAV4xt4baMfl/qSCdwEDJL4h+GfImcE4
	/2eeL48M5QlOGmMRpQgNBfVK5YcDW6+AndKB+7MjolKmMItj9DBRWtOgjgJWXbKfkYp0caMcFy2hG
	3bD7GlfpXUDjvsAJjCtlvBq0/6kijV7u4Ln1EqOYeVlSaVegV2Uk+ersXJD2ZZguWlbphBSwcvPav
	ivMFsKtC5ZmyeHtq7wRE1kb2xz9RKc4vOKs8VqaeQTAU/WnxB+RG/AdbIFO+lSAZPIDeKEqRrX8Lj
	7mOypsCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrnU-00000007plx-04LC;
	Fri, 27 Feb 2026 06:58:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrnM-00000007pgo-0f94
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:57:53 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxVvigSVkiA0ULS8sVET9zTxBqGaaQQOZYasgU53BKI=;
	b=WM9sl9D45G4EhBesYUN6X9bIzF4n7UWbfaWPLcczKr48l/eUKEn1PBHanrMc2xX9qALzHb
	oWc4oZFtQMPFhMkDNuPPX4obMLby73fs3uSz8CytLuQqxeAJwo/99arRzwuwDwb/qPXkup
	cplvt7DNdlg8oqDICn1/Re3b5SdHMhnDFLwzexrVMztfajKYA4pjFe0WgvFTMJA/lq/caI
	e++XWrqL6s+rRoW+XnrVAuqTObPMyz+nECA6+JwZcnuQTMJy8IQhbOSD7Z7XF4/AZH9d9K
	MJKlDPtA78I4V+o4QIX+mCO06mmdFyyurx8iWRuYyjxTgISGekzmX+cKedZZmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxVvigSVkiA0ULS8sVET9zTxBqGaaQQOZYasgU53BKI=;
	b=97LPGIJ+SqRO5BCoiDwvuNzmWSD2Y2OZLcd5lia8oyY2WW1Hodb9e+KfCWyZzqdpsstEAH
	F6q5plVa/e4KTiCQ==
Date: Fri, 27 Feb 2026 07:57:46 +0100
Subject: [PATCH 7/7] vdso/gettimeofday: Verify COMPAT_32BIT_TIME
 interactions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-compat_32bit_time-v1-7-3f0286a7bac3@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
In-Reply-To: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175466; l=1692;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=cLipKDdg+OqB2lTcsId3exf9QOD1Z347Ahh8ryEqWfA=;
 b=E0vFBA+/8oxx+AiNSHHAbbL7OvIOo5Bn43vLxk0Bffm871HZFCm5mLjBLyPrKxdS2L+JikbEJ
 cnxOS5CW/3RA4cT6ZydiAjCUkTSMTDsFk6efPCwkKSdYgQIZ0a6ECwN
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_225752_346348_06FE6D96 
X-CRM114-Status: UNSURE (   9.56  )
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
provide any 32-bit time related functionality.

Add some build-time validations to make sure the architecture-specific
glue satisfies this requirement.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 4399e143d43a..0d134ac3dd84 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -6,6 +6,8 @@
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
 
+#include <linux/build_bug.h>
+
 /* Bring in default accessors */
 #include <vdso/vsyscall.h>
 
@@ -340,6 +342,8 @@ __cvdso_clock_gettime32_data(const struct vdso_time_data *vd, clockid_t clock,
 	struct __kernel_timespec ts;
 	bool ok;
 
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_COMPAT_32BIT_TIME));
+
 	ok = __cvdso_clock_gettime_common(vd, clock, &ts);
 
 	if (unlikely(!ok))
@@ -400,6 +404,8 @@ __cvdso_time_data(const struct vdso_time_data *vd, __kernel_old_time_t *time)
 	const struct vdso_clock *vc = vd->clock_data;
 	__kernel_old_time_t t;
 
+	BUILD_BUG_ON(sizeof(*time) != 8 && !IS_ENABLED(CONFIG_COMPAT_32BIT_TIME));
+
 	if (IS_ENABLED(CONFIG_TIME_NS) &&
 	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS) {
 		vd = __arch_get_vdso_u_timens_data(vd);
@@ -491,6 +497,8 @@ __cvdso_clock_getres_time32_data(const struct vdso_time_data *vd, clockid_t cloc
 	struct __kernel_timespec ts;
 	bool ok;
 
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_COMPAT_32BIT_TIME));
+
 	ok = __cvdso_clock_getres_common(vd, clock, &ts);
 
 	if (unlikely(!ok))

-- 
2.53.0


