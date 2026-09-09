Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31366C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzQOMxzxshTh4wmqEu29Gu2VPX+xEoLqk1yFbDrb8uM=; b=mxv4nbOGxh8z/kMis7bWl4Dxn1
	PFP8H5kfUtYkqYwtFNlYRrVq+Ljx/RwjYeWz7j01AfGGhHYhSSljvu0sR7aT/Yq928GMGyRHNsU7v
	JW1m0KEWmiV9TRRNwR+3QCAAskydyGOlyHDt+1x9Hqc67n6TJLnkZfut1TfwD6jzEppdEETz0sMeu
	XddC8TPNd6TWlkU2mr0v2bI7xiv0/0DMTuUdVn6uF7MZ2jqQ3WLrPieENlsC879/pULJx028nqRiy
	1WH7yEFTRyi7DVEAqyTX7g0ZDQw4E2EQOQxnMH2Uhd42M5DN8dZ91TCQg6g3d97JqPRRmmQqeDGFz
	MtNqFWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1h-0000000BADd-1vwy;
	Wed, 09 Sep 2026 08:51:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1d-0000000BAAa-2yt5;
	Wed, 09 Sep 2026 08:51:28 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XzQOMxzxshTh4wmqEu29Gu2VPX+xEoLqk1yFbDrb8uM=;
	b=X09Yejo/JqqKtXCBERrNnRAYA35ImQKVCAF+aSCtG2F6PKrzCaElWrLHCAxGtzr7vC7OOu
	w0HUGAq/x4Pq3gNZtO6+iPsEvOwxvPbU1eDFXpf/ovbFERZB00bGkzZGvYmYJW9ldJ+TqS
	QLNVMEHKXIz5pnTCub3fdLep8HnNx+Lwy8VwNv++2kJBMAasTB9ZIDMciuBfKiHjHkPOx5
	tC3004wXfoTPdEjwfIlJE/qyREnrsnkGz8wj1Jtp35FtBZ281kpRX+N5IgSTM4LnIdUKJV
	xZiars5kzubb+8wkquYE/jKHmF25JTco2ilJeYOEa4VaT6+D19ljJZA18zrpnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XzQOMxzxshTh4wmqEu29Gu2VPX+xEoLqk1yFbDrb8uM=;
	b=cYA/s1bWs/UKgyEP7Ti0e2vw1WhICfuqGpLaEZeMxwrx7+M/smOGJv8avR0BVCzMnxs/GQ
	tXZzBptfzYAlvhDA==
Date: Wed, 09 Sep 2026 10:51:15 +0200
Subject: [PATCH 02/15] vdso/gettimeofday: Define fallback
 __arch_get_vdso_u_time_data() in gettimeofday.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-2-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1583;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=5Ojd0VZyBuWlT1Vlm9OCcvjNe/c3y4B8B7OiZI04IfU=;
 b=VGAO2rm1dloGKPPn6fG5mfwo6sz2glPNKl5GoEyuD+WCr61o80au+loFA+6grZFSc94CCx300
 8Gh0V0u0lq7CxoWtxOpnah08gZTdMGr+JgfY05geFzjXERrVbBldpxr
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015125_981948_FE52150F 
X-CRM114-Status: UNSURE (   6.72  )
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

__arch_get_vdso_u_time_data() is only used in gettimeofday.c. vsyscall.h
has become a dumping ground for different kinds of fallbacks.

Move the fallback function definition into gettimeofday.c,
similar to other fallbacks.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/asm-generic/vdso/vsyscall.h | 7 -------
 lib/vdso/gettimeofday.c             | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/vsyscall.h
index a6b03cfba0e2..fe12fb1fb442 100644
--- a/include/asm-generic/vdso/vsyscall.h
+++ b/include/asm-generic/vdso/vsyscall.h
@@ -4,13 +4,6 @@
 
 #ifndef __ASSEMBLER__
 
-#ifndef __arch_get_vdso_u_time_data
-static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_data(void)
-{
-	return &vdso_u_time_data;
-}
-#endif
-
 #ifndef __arch_get_vdso_u_rng_data
 static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_data(void)
 {
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index f7a591aba59f..b867c2301d5c 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -93,6 +93,13 @@ static inline bool vdso_cycles_ok(u64 cycles)
 }
 #endif
 
+#ifndef __arch_get_vdso_u_time_data
+static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_data(void)
+{
+	return &vdso_u_time_data;
+}
+#endif
+
 static __always_inline bool vdso_clockid_valid(clockid_t clock)
 {
 	/* Check for negative values or invalid clocks */

-- 
2.55.0


