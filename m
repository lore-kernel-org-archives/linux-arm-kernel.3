Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E27C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bp5U5FjsUuqmG9kVHnnc4OFrEREB6gXomJ8tROC/Nas=; b=GWB+BGRVB7VnE5aMj9H6DAPNzZ
	jfEiQGUa5ktLlWI3tZs48rXucu2x787kTg14s4lK/f/xQXGXsuqrnsGP7WSoa5m6OiXCFl5Im/TZc
	HsYTF7nUdbQMjpvnNgUJGdktLZ6aR2guPrPhnXhwkKMNNxVQwMJM4w1AGgy1+O89/pPuwmRXo5dWn
	d6gsC5WXTcHCS4KNN405VeiPEY8dKDiY8shybs91rUYlwdVT+amJksiU2SsE62UmzOEyZ1xfsC2sn
	/OMLXYapL0G/A6IQ2O+7NBmBl+QMOfvoK1Pm5QOINwVh5epi/cq1xtSasNoKfVOmpLrQB9E7xmt2A
	CxIHI/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCfz-00000003q6R-0tIK;
	Thu, 02 Jul 2026 08:21:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCfw-00000003q4D-3sXs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:21:38 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782980491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bp5U5FjsUuqmG9kVHnnc4OFrEREB6gXomJ8tROC/Nas=;
	b=0GCsaEzzXtV7+3pSgVu9W2HrlZjfXko73xUrILYZX8Hk65mqDlFZEcg3Z2VAMx6ukZ+DDy
	Wat324S+35nUX42kcvzdaAwDQy8WBw6ZJEdnBfXqoohiReiMrfSbXXmVUgNNOWRezi1EkR
	8LT/Znewzn3A1jiQhQzLJcbaEmw019bz06/Ukrkr5jcag4AmPMB0FUCjvHSNv8IdtZO+sD
	Ua+kEQBFi980B91go75YCUM1V4tdBOZDY5jyPhqhnnwZrm+R6MFRdTPTBO9OORMFDGeoKz
	xhOAujq7pNQ2b0xxFi1cFkcElqF8sltuKFCUaQQyqR/1UuobVLJ4Z+mxFo/yxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782980491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bp5U5FjsUuqmG9kVHnnc4OFrEREB6gXomJ8tROC/Nas=;
	b=2M0y1mYMX8Z+I87ZrS2dXnaMyc8xPFYBq11TIrfERYXTp+SGGC2fbgWqvHNdfBghCnzSFj
	GdgbjETZOUoqjoBg==
Date: Thu, 02 Jul 2026 10:21:26 +0200
Subject: [PATCH v3 2/9] vdso/gettimeofday: Validate system call existence
 for time() and gettimeofday()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-vdso-compat_32bit_time-v3-2-db9f36d8d432@linutronix.de>
References: <20260702-vdso-compat_32bit_time-v3-0-db9f36d8d432@linutronix.de>
In-Reply-To: <20260702-vdso-compat_32bit_time-v3-0-db9f36d8d432@linutronix.de>
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
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782980489; l=1392;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=cec3xwnXWZBQQGbv42GU6QmpPz+8AvRAz3K8EdeOBsQ=;
 b=fzIbY2wUHyepDnlJz2y76h3VjJzYpEMenwXZ0eQfbLg9z5MtsLMJicYf/IxYkFJWtTT8ssPeF
 JUjxzIyuUxbA0DywLtasjndTd8qdcR4KZDPqER7EA6QrYk5LgyY3miX
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_012137_125419_5D9981E4 
X-CRM114-Status: GOOD (  11.18  )
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
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


