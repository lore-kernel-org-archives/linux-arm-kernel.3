Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5916EC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgkXR8Ms7wQS05VGAhqJOHjZc2vDa+KQurvhzWf1zv4=; b=wUJ3tgmKpeOu5m2d1qE3mZl7Ss
	pMTZv+yBvEgBhrqezDkEvZh6Cs0GNcuAmurMK2cSaVICdE6+UCdlZdHSfN3nDH0DuCWXd/1CqwVjf
	iXDmqYJXQto6yGONwASE7c6uElQXzIxRQ56VTW+fyEjWWv3emQ3LxZz6aF5zOXYbzi7YvbHaqEjsn
	FO8d/rUUN/Tft4/w8VmXVY4DCg0k5nj3jE4//DpZgZD7re7+CuLUfYhVQa+xK6xyAOTMYDmkxijeT
	+Rvo520VzQvaxmFEZzVMrkDe8CQlYvIylfYnDheOkG8pbmNt31LC78ejw8FTKSrGkOiAhYv6+BhH3
	b5An9VSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4SU-00000000fLE-3HiK;
	Mon, 03 Mar 2025 11:59:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3hf-00000000Ttk-3A2Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:21 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HgkXR8Ms7wQS05VGAhqJOHjZc2vDa+KQurvhzWf1zv4=;
	b=qhBdyCjxtiKLWvOc1plokn7HfcVzmwf+d4glPAKt3DEO52YztEmLk02vb7L3VZogzU2A+4
	kTs/E5ByKXP8uxQAXoDvY2FzGgDTE/UwbpxuKNixzQm5PoM/G7f8h9l/K3TWY8YtJv6qIE
	6zEkYZnS+jXRTBXgB/usq3SvKKk97lqoryzHUq0M63j6tngeCcCLtVeZAPDdVHBVuKnm+x
	GOK8rRB+IXVgo58Xt7K7XisPKf3Ikmf+bDcbXUTqt709HU9avzv7ceji+wiU9dlaSgDlpC
	rM9eQEz3o52fHaITdsZRgMUYFGF5zkCTogNt5Phtjl5yY1MgwrKjP+SarcanYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HgkXR8Ms7wQS05VGAhqJOHjZc2vDa+KQurvhzWf1zv4=;
	b=BMb3X3SY4t1L7AJIV4rv6PFcxHgHInWR8mh99SkR1hwnPPvG4cImQh/oz7XKHSBifrGyMb
	AArbHGlpDvR3nyBg==
Date: Mon, 03 Mar 2025 12:11:20 +0100
Subject: [PATCH 18/19] vdso: Move arch related data before basetime
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-18-c1b5c69a166f@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
In-Reply-To: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=2232;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+5uVvlPBOccXpBrllKubuXiCPd0eBucGi0zbF33gT3U=;
 b=X+HQHN+N5jVKZbjCjgYkbSkIIE7aQboC/nbk/mfHTATXfKThuTtUk4+181IgylalZLiBJjY7y
 fSrOanqYWacAJNG8ttNOKFyoifVvtbJU3lYM7zULF1yjrqrrAfTAZQe
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031119_962104_DEFE8E3A 
X-CRM114-Status: GOOD (  12.94  )
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

From: Anna-Maria Behnsen <anna-maria@linutronix.de>

Architecture related vdso data is required in fastpath when acquiring
CLOCK_MONOTONIC or CLOCK_REALTIME. At the moment, this information is
located at the end of the vdso_time_data structure. The whole structure has
to be loaded into cache to be able to access this information.

To minimize the number of required cachelines, the architecture specific
vdso data struct is moved right before the basetime (basetime information
is required anyway). This change does not have an impact on architectures
with CONFIG_ARCH_HAS_VDSO_DATA=n. All other architectures could spare
reading unnecessary cachelines.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/datapage.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 1df22e8bb9b31153546b72b1e8b8c8aeaed7d9e3..bcd19c223783be7c22f90120330e7dddd0496f1a 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -70,6 +70,8 @@ struct vdso_timestamp {
 
 /**
  * struct vdso_time_data - vdso datapage representation
+ * @arch_data:		architecture specific data (optional, defaults
+ *			to an empty struct)
  * @seq:		timebase sequence counter
  * @clock_mode:		clock mode
  * @cycle_last:		timebase at clocksource init
@@ -83,8 +85,6 @@ struct vdso_timestamp {
  * @tz_dsttime:		type of DST correction
  * @hrtimer_res:	hrtimer resolution
  * @__unused:		unused
- * @arch_data:		architecture specific data (optional, defaults
- *			to an empty struct)
  *
  * vdso_time_data will be accessed by 64 bit and compat code at the same time
  * so we should be careful before modifying this structure.
@@ -105,6 +105,8 @@ struct vdso_timestamp {
  * offset must be zero.
  */
 struct vdso_time_data {
+	struct arch_vdso_time_data arch_data;
+
 	u32			seq;
 
 	s32			clock_mode;
@@ -125,8 +127,6 @@ struct vdso_time_data {
 	s32			tz_dsttime;
 	u32			hrtimer_res;
 	u32			__unused;
-
-	struct arch_vdso_time_data arch_data;
 } ____cacheline_aligned;
 
 #define vdso_clock vdso_time_data

-- 
2.48.1


