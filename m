Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93079C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HKU/uJy0IuunrWhxLM2EASE6yRF5K6bEQO5QIgY2ek=; b=ouWDOJx3Ni55hvxUzA0fNC1T1S
	AQPONL6Pbc8Il9zxFWDkmepplWcuV9ol2brGz9BzoMR3sRwmPOYn1BC4wisT+g9aGd593wKye5nUV
	L2ClBdDPIEcWK/MLRIEkeeYxuyLNVHI/Tca63CAhPtsu4TBlMBKpHVzus8uItJBeOgd7B+3t1wJfP
	uw3Qnly6R21qdyQr4aS//6pw4VKZt76zLTAajt2slpRL3szMYei5G03wnQOzwwi+tSWlIUmOCW4qB
	MC4f7X2/2wV0QVEdaA9TUDGiTCREqQ19rKgOSpKYWTmMY0zWPiJ8eFHIgbnXTfjYqbOKNkkd3Tw4b
	pu4NqZqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXNf-00000004c00-39NH;
	Tue, 01 Jul 2025 09:34:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWp4-00000004WRt-2lJU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 08:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1HKU/uJy0IuunrWhxLM2EASE6yRF5K6bEQO5QIgY2ek=; b=eRbUmK9kmbVc7tbqrYZPOWmrU9
	AkagGnpOXsznPa3NrPFscd+pBmZO5z675aBJuJH7ZB8tMp/WCjTFFy6Rt+u//g8ketWjPlyN5uWRw
	r71UWF9oaUARMaolNlz9YtP+aaK8R2M2rqoOCfZtYRRoOUoWymRM4Bj5xKoxMTmCITISyHpMiDMpM
	a/DuFuI/csjDWJmLXNfNh3IACZSxRYvFc2jYcBx3/RoVFba2vgy9A5oO/2s1BUEHOjuwGUMSe4GTN
	XGnf2/RdtvFejdH4tmMhLt4zT+gzXDpf4RXM9wvji51exISqntFmwvq12J7fPMQGQ28Zc9pPbjx1M
	IxHZn0KQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWp0-000000070ns-2v7T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:58:37 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HKU/uJy0IuunrWhxLM2EASE6yRF5K6bEQO5QIgY2ek=;
	b=K9BaqrOYFqnofn5P2Mt2X6g2ua5GThBRPRyNjGUZC4scdamlJpMYD5gNN573zW/J2bL+31
	wrLYKUQpeAfHswC7nPzAEKWEd6XAVCW3kVbu1T6D+uYTW7WgYNtPK4NtQpSkbFVCWJqpMy
	ygVkULpruELUspdcQEvyIkXrAnToczefld2yN7H0pLbwgtp4nnbtEMOQMc3QZGaurqw3bQ
	qO0ZyF9ZSvMxNQeF0XVc7Di9v3BFriVSCNqStPIV1b2RsYJWpnldRVtrPYyKk+vinObRtd
	twC+cM+VJqsIInUsqht9j/u5wZ85mC4SuS5B0eTP5RxHC9bJIYPVTDAbhztbNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HKU/uJy0IuunrWhxLM2EASE6yRF5K6bEQO5QIgY2ek=;
	b=0ld+FVHvitgzjdEPmJc5YG8pha2EOVxZLZQXEFjdJHO/97hXtm+rM1dRcF9PN9MjtFmFHP
	psvwp2Ok0d2zy6DA==
Date: Tue, 01 Jul 2025 10:58:07 +0200
Subject: [PATCH 13/14] Revert "selftests: vDSO: parse_vdso: Use UAPI
 headers instead of libc headers"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-vdso-auxclock-v1-13-df7d9f87b9b8@linutronix.de>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
In-Reply-To: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, John Stultz <jstultz@google.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
 Richard Cochran <richardcochran@gmail.com>, 
 Christopher Hall <christopher.s.hall@intel.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Miroslav Lichvar <mlichvar@redhat.com>, 
 Werner Abt <werner.abt@meinberg-usa.com>, 
 David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, 
 Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
 Antoine Tenart <atenart@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751360285; l=1843;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=bpk3KAQY5N8I4k57sZludGnIuWomX8iO/06DkAxXS9U=;
 b=hKaFZYN5LZWjWFdnd5ob07pCwqSWQ1FiB4gHtjSVxkxW6JM6TYu4NjNH4o5Qpcii7niW8wMfN
 4gEk5rzDT8rBZPxvq/KqzJIjggVPd3ZFDJYgqFRkH1+mkuMlafKiRVY
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095835_161513_BD54B4A1 
X-CRM114-Status: GOOD (  10.73  )
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

This reverts commit c9fbaa879508 ("selftests: vDSO: parse_vdso: Use UAPI headers instead of libc headers")

The kernel headers were used to make parse_vdso.c compatible with nolibc.
Unfortunately linux/elf.h is incompatible with glibc's sys/auxv.h.
When using glibc it is therefore not possible build parse_vdso.c as part of the
same compilation unit as its caller as sys/auxv.h is needed for getauxval().

In the meantime nolibc gained its own elf.h, providing compatibility with the
documented libc interfaces.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/vDSO/Makefile     | 2 --
 tools/testing/selftests/vDSO/parse_vdso.c | 3 +--
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vDSO/Makefile b/tools/testing/selftests/vDSO/Makefile
index 12a0614b9fd4983deffe5d6a7cfa06ba8d92a516..67ead1ba6cb9c6d6088680a9c4d24a9d19f7231f 100644
--- a/tools/testing/selftests/vDSO/Makefile
+++ b/tools/testing/selftests/vDSO/Makefile
@@ -20,8 +20,6 @@ endif
 
 include ../lib.mk
 
-CFLAGS += $(TOOLS_INCLUDES)
-
 CFLAGS_NOLIBC := -nostdlib -nostdinc -ffreestanding -fno-asynchronous-unwind-tables \
 		 -fno-stack-protector -include $(top_srcdir)/tools/include/nolibc/nolibc.h \
 		 -I$(top_srcdir)/tools/include/nolibc/ $(KHDR_INCLUDES)
diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
index 3ff00fb624a44b964cc54954f1f088cabe11a901..c6ff4413ea367ae57bc6a60073314b29f938c99d 100644
--- a/tools/testing/selftests/vDSO/parse_vdso.c
+++ b/tools/testing/selftests/vDSO/parse_vdso.c
@@ -19,8 +19,7 @@
 #include <stdint.h>
 #include <string.h>
 #include <limits.h>
-#include <linux/auxvec.h>
-#include <linux/elf.h>
+#include <elf.h>
 
 #include "parse_vdso.h"
 

-- 
2.50.0


