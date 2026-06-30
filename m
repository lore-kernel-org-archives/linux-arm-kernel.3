Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AFDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4jNR7IvW42yw2Udss8oMjXgT07Ci6ORkUJxbmsVFdo=; b=l0UfbWteSxdTFBr961QCBwzQ2a
	VTEwJcylVXhYhunDkmRpeg0b4uZ8v4k18bhgZnyMtdOQ4xV9mlns83Ow0KuchH380+aBaZjEVfbi/
	yMlvtmFx+caTaoaG2GFTmP1pmco98itPbK+nduH6DcJc8OwqI+Cf2ELSJirWb2LlW6PWNSdvm240b
	OXMQmOpMiYJF/zaGXK1pjLhxEaWSpI6iIYNqG52f3joAe6Mp4NCNKO2OLdp4hDozYzS7l5vbpgxtw
	sHPVQFJxQC/V0LsY3WzvItzwW8yQwNDMT76vSCdKbIeBwxLzFhOz75OVVuD+9JW6en8mZu38BNXy4
	fb+j9EAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT3x-0000000G7j9-3VEt;
	Tue, 30 Jun 2026 07:39:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT3R-0000000G7Jf-2hYH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 07:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=J4jNR7IvW42yw2Udss8oMjXgT07Ci6ORkUJxbmsVFdo=; b=EPlSVeePYNqEs5Pu7aI3UChnWi
	wpKV4U0FfuitCkytF5kOolwOOq9bz16Z7HHKxlSOmfMIYa+BEC/PbHE3d5btZXq2jsD3wDNfvreik
	79ES/qb43sLL6tnLDWHuiX88JQmcwahLxkBtdhHzoeq5OBx4mNENETyJcnwUbO8IpAfe15g5I2/uC
	qV2yvpXVD6woo38CGIrSxJBdtP0bPT/YAG8T9pcpUpg9ccxXFw2jNYVNoKOa8j9l63Rakby4ux1p/
	Pfvk/Ta3v7ecQCR5xbDCEukekCi2D2yK8MEpWaT1GJC8prZ8d8PELT1IijSSbBpYkLGhrRK5UaC32
	7BDX1mug==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weT3O-00000001c64-1F5p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:38:48 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782805122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J4jNR7IvW42yw2Udss8oMjXgT07Ci6ORkUJxbmsVFdo=;
	b=2UBKjP6ZHy3CRwMmUBUaL4kxEI/lQaVcZ5OwMsP2rjGQK+Loprr1BGaBZhBw4YAEi9z7dU
	M6igmNLI6dzAbCY20DEcphw4Q23zX7ya0jVLPy1lAkYUxtq9SepZP+OwypzPhHcj32BEhW
	Ezr2rAUK9JSOMiHtPCv7BzToplrlEQpPvrHeE2TEtb61dJiWT68d19hF+dfZil7Tmxs6Lo
	ddgnosAdzz+yq40r9sqRL3jnyJsPKSGU9rlv4WRbs43teWKh7R6DXeWYtUWhV2ir4tXK7v
	SNGZToUOxEBZII5zQxuMYa2cAOzWQOtElc3AGWQuRNgVxxh4O9E7EEVOj7u1FA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782805122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J4jNR7IvW42yw2Udss8oMjXgT07Ci6ORkUJxbmsVFdo=;
	b=f83Sn6qIhsaRZ/jxhSBKO89iQ/va46I2A9tQdntRDGvOCFXzAvYqPM/0vGIBMq5yP/ZOjK
	szz6xhbpCi37U5BA==
Date: Tue, 30 Jun 2026 09:38:38 +0200
Subject: [PATCH v2 9/9] vdso/gettimeofday: Verify COMPAT_32BIT_TIME
 interactions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-vdso-compat_32bit_time-v2-9-520d194640dd@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782805116; l=1853;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=12QPBY1A1qwsYzo0GG6Ngj7WiSTW+DNwVbPq5hDEyT0=;
 b=iLniktrStdEyXZsTH8ubljifMoWZxQv7NLjjYBM7Yr1YVx3xlPUy0sysk+14qkrzN0NXTK1Vh
 udMagMcO4uOBheZv2oJSUM8e5CtprPBwpBd6EQbpcV+gSy6NQKJfUGS
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_083846_556121_4DEA799C 
X-CRM114-Status: UNSURE (   9.84  )
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
 lib/vdso/gettimeofday.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index b8c1fc85eb74..f7a591aba59f 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -25,6 +25,8 @@
  */
 #include <asm/vdso/gettimeofday.h>
 
+#include <linux/build_bug.h>
+
 /* Bring in default accessors */
 #include <vdso/vsyscall.h>
 
@@ -325,6 +327,8 @@ __cvdso_clock_gettime32_data(const struct vdso_time_data *vd, clockid_t clock,
 	struct __kernel_timespec ts;
 	bool ok;
 
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_COMPAT_32BIT_TIME));
+
 	ok = __cvdso_clock_gettime_common(vd, clock, &ts);
 
 	if (unlikely(!ok))
@@ -354,6 +358,8 @@ __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
 	BUILD_BUG();
 #endif
 
+	BUILD_BUG_ON(sizeof(tv->tv_sec) != 8 && !IS_ENABLED(CONFIG_COMPAT_32BIT_TIME));
+
 	if (likely(tv != NULL)) {
 		struct __kernel_timespec ts;
 
@@ -392,6 +398,8 @@ __cvdso_time_data(const struct vdso_time_data *vd, __kernel_old_time_t *time)
 	BUILD_BUG();
 #endif
 
+	BUILD_BUG_ON(sizeof(*time) != 8 && !IS_ENABLED(CONFIG_COMPAT_32BIT_TIME));
+
 	if (vdso_is_timens_clock(vc)) {
 		vd = vdso_timens_data(vd);
 		vc = vd->clock_data;
@@ -481,6 +489,8 @@ __cvdso_clock_getres_time32_data(const struct vdso_time_data *vd, clockid_t cloc
 	struct __kernel_timespec ts;
 	bool ok;
 
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_COMPAT_32BIT_TIME));
+
 	ok = __cvdso_clock_getres_common(vd, clock, &ts);
 
 	if (unlikely(!ok))

-- 
2.55.0


