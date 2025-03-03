Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4C2C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xj+izrhaOcxy+xihfquH+xNLp8A7/ytMiHjX9X2ba9M=; b=k1FtoJdKecvPjslditED3W4MEc
	AMswuUfQs6rJXnzySmV0XsUXYluSNU41kujAyoLTGjOqCxOKIO1Shi6mqpMTyIaqKTK0TUXOZuMqo
	lYqZqIIsJESjmpUeJ5WqHVWVA2q8p7sugwonatPNkkxZ2o07e4mAl0v9g/i7BGgvLhKnuofbbN/Rx
	CLekgL7lt1fLEFeaA1Ipe/+XXm1Sff/pbFULjXNtjeDY9fDWGTl8eLykF9UPbxD4JAkLEOvsw8Bzq
	QhAT8hh4MsCRa2GiwW6jI9xkI1Hwq1mYFM92XEaKTV0JNvTrCynGyhRaeN0GmRCrQ/acT3b/ablZf
	Fg6vSUWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp46v-00000000aqd-3GuQ;
	Mon, 03 Mar 2025 11:37:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3hY-00000000TmD-0gAJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:13 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xj+izrhaOcxy+xihfquH+xNLp8A7/ytMiHjX9X2ba9M=;
	b=Gxa5GXG1996oaCjjYl/Z6sgMF1KOjoNvxpBXX6w6eKXnxd6/0bfYOFDRsivWanOVtA+9ZS
	BBwK+7G458P2Js+w8bvhlXENVl5k+2TIZXozC+NmmvNazvxFNgIk+1zOETFD/uugMTBBNl
	B8Sxwq3Z+dwoi4PBPaC/yr+sruV7ytzkG44m5fG7jEU76o6VjSPGkYFLJb2OWiTIlwv5bp
	vY2yEkOXk8/iMBBnMHPoYEDip2ucsdf/Q8NEoc8VK8ZY63A+XBuuQjmxEw5Gj+HK0Ha3WU
	ky3nR1pqfPdC4avJQxL3yuhN/Pg3YEKdEWmHhSG6XD/KJ37oGU+Pi0rsHxUxfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xj+izrhaOcxy+xihfquH+xNLp8A7/ytMiHjX9X2ba9M=;
	b=xuensp3Pa9Pm0DfWFv6ec0Nb8Q78eETUCr5ghIogZLmzP2K+5tv9Q5qn7Km2/eZ0HMuvAZ
	V25m6gork9ijLVAQ==
Date: Mon, 03 Mar 2025 12:11:05 +0100
Subject: [PATCH 03/19] vdso: Make vdso_time_data cacheline aligned
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-3-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=1329;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+SD6yGnIFUmAVcH8siXM+pCjZMZm4i05faOszoaQfnQ=;
 b=3rnVtk2piKjEr1OX2HGOUwEZO6XTwkuvMBS8Th4Zl1Fyez4RcpeNoVQ+iQsPawv+KjUBtwrnC
 bR+EZ/DXucmA32/wVjS994HjsSLCu3iMbAMPCOkUa8SH8VgkE3QrxuF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031112_345725_0F826553 
X-CRM114-Status: GOOD (  12.53  )
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

vdso_time_data is not cacheline aligned at the moment. When instantiating
an array, the start of the second array member is not cache line aligned.
This increases the number of the required cache lines which needs to be
read when handling e.g. CLOCK_MONOTONIC_RAW, because the data spawns an
extra cache line if the previous data does not end at a cache line
boundary.

Therefore make struct vdso_time_data cacheline aligned.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/datapage.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index ed4fb4c06e3ee6423fe68ccb476565213f234863..dfd98f969f151eca3c551c3e90f69af9ee8f22bb 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -11,6 +11,7 @@
 
 #include <vdso/align.h>
 #include <vdso/bits.h>
+#include <vdso/cache.h>
 #include <vdso/clocksource.h>
 #include <vdso/ktime.h>
 #include <vdso/limits.h>
@@ -126,7 +127,7 @@ struct vdso_time_data {
 	u32			__unused;
 
 	struct arch_vdso_time_data arch_data;
-};
+} ____cacheline_aligned;
 
 /**
  * struct vdso_rng_data - vdso RNG state information

-- 
2.48.1


