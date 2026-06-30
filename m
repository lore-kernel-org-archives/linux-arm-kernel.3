Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84C1C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVID/t0qaW7VypBPiJtjpPrhFqRi5Mo116w2nu1OqvI=; b=n2tlmjDL47qYVX//M5gYP3aQFt
	EXU5PKL0OBCowCBLDZBcvvMf1b0YgXrcDGfg+x0DFkt8F8l/HD1+sc1/Al5EpId2BIhWUzDa+8gpI
	cy5WeL/Gf41wWSOvnT4GXSlyKmBN3seIpAlmH8S1V2GSO6IBAsPArlrytaHBS5cIDo/N5d1ZWvv3r
	a9XCVdDTUotqHP2GftK+z+k7dxZ9ZE/IfvVj6506slRLso2hlHR0XHYjYVhjxfOnXmt/iVRpzEanE
	L+yJWFEnguaRhXsBX8bzeeIUdffImMkV+5WqdnbIampdYR/IsA2EH70sVz5lPl038fqx94oeS7uEn
	VSC+SNVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT3R-0000000G7Ji-1QeB;
	Tue, 30 Jun 2026 07:38:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT3J-0000000G7Es-2owd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:38:44 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782805118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVID/t0qaW7VypBPiJtjpPrhFqRi5Mo116w2nu1OqvI=;
	b=RbOA0FabMmwkH0ETPAqTm8Bkw+WY1YFlatQVCCczvntdUcP234tEMqb+9zMZT7CFk9/8gW
	UuRXrafcY1XD6hMcJBWy2VOEraSpm7/OreDOBrkRKgEr7TfJfji6QLUuhjXuCO/aANZUmL
	9hJlG6dj3PbWk623bqWdKsqX99138cZp1utC2bMBA6zbnyxkFqlkgNTpUqGDm/HBGBWpj2
	vXauaKNypXTtGKEtuwDfjnu0S2Xm/fV7HHheM7qrzc6OSBs21IdeRattIObztMsOtaNpeJ
	sweB4YV6GMk6LUoXkW3lGrl+esFVDdKw37/5sw+Vd5ld6Lv8Z6g65o/nTv1a6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782805118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVID/t0qaW7VypBPiJtjpPrhFqRi5Mo116w2nu1OqvI=;
	b=M/J6OBdNY+/auBdTuVPbjXT7fKuYYOmlFPuYgS/s/BNuPXvfW62YNCL1QgeLo6+SGpE65T
	1Bo0NxBSKbe/VKCw==
Date: Tue, 30 Jun 2026 09:38:31 +0200
Subject: [PATCH v2 2/9] vdso/gettimeofday: Validate system call existence
 for time() and gettimeofday()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-vdso-compat_32bit_time-v2-2-520d194640dd@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782805116; l=1284;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6IjQwZ36LCC2tu6Rbkgy6M8Qe+F80ooiDk/V0b5/cPg=;
 b=MvautCTPrf+MHg7V1Qyx6eZ2mFaotGr1QoK7VQAj1+oc+8OwJcD4eLwKPNP2/NGjXDj3pLlon
 XRdROlWK9goDBywLWyspXabx3LLpZsa9yMN0f8yBMirgFFiywsPaDWU
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_003841_849114_55719EF6 
X-CRM114-Status: GOOD (  10.76  )
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

Not all architectures have the system calls for time() and
gettimeofday(). When the system call is missing, the vDSO function
should also not be present.

Validate that.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index e0f289d3d110..b8c1fc85eb74 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -12,6 +12,8 @@
 #include <vdso/time32.h>
 #include <vdso/time64.h>
 
+#include <uapi/linux/unistd.h>
+
 /*
  * The generic vDSO implementation requires that gettimeofday.h
  * provides:
@@ -348,6 +350,10 @@ __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
 {
 	const struct vdso_clock *vc = vd->clock_data;
 
+#ifndef __NR_gettimeofday
+	BUILD_BUG();
+#endif
+
 	if (likely(tv != NULL)) {
 		struct __kernel_timespec ts;
 
@@ -382,6 +388,10 @@ __cvdso_time_data(const struct vdso_time_data *vd, __kernel_old_time_t *time)
 	const struct vdso_clock *vc = vd->clock_data;
 	__kernel_old_time_t t;
 
+#ifndef __NR_time
+	BUILD_BUG();
+#endif
+
 	if (vdso_is_timens_clock(vc)) {
 		vd = vdso_timens_data(vd);
 		vc = vd->clock_data;

-- 
2.55.0


