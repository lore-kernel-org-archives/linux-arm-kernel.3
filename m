Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE29606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 02:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ogsk0Q8;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=EB1bixiQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EqPr/ub5T0mzU8emv4xapSnt/P45Vwy++DCDHCbXLNg=; b=4ogsk0Q83Twb9t
	fuITtSvWVqcAeeTb/pDXyKX5OT0p/1n6w6j5rK29PkSNECe0pLuqORD0L/DVvV86p6dU24ZaN4ar3
	2zKRfiv+8k6zgKAjocoF+q/BL0hvkCHKGFIDBoSy5yH4EM2A+eT48Lb5xxWldoDJ9duP6D5SC6nmy
	ct0e62rWj6cC0t0WjAuceQvxpKlBojWGdYSaw4Nv/G/GJqzYsItzMXN/5c2lYk5k/Kb/qOpeepcPj
	Z9tG0IjUExK5n1K+naKjVyRbHQ0UfDWooP/Hc/IzoT/epDAP2nXpegrl4gPPJOg7M82qiY+PnpaMP
	jRrxN3YfprToBNIcT08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9cZ-0000000B3F6-1orP;
	Fri, 06 Nov 2026 02:24:03 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9cX-0000000B3E0-1ZWp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 02:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=EqPr/ub5T0mzU8emv4xapSnt/P45Vwy++DCDHCbXLNg=; t=1793931841; x=2109291841; 
	b=EB1bixiQQfQ1uogjNna0TTPcKvC3TfC+FDM6WS3F2WDAT9y4arHQs7tESNhCJJ273B58hQJ1BMJ
	RqoHpE4aj35MrE/qoPX2hPvCX3VeNq5TK8XK8HoC2zt7IbLjcVbMVtTnrxesQwPetErZB9qj32pp7
	wbr28ySncqdzCDcCEUjcGrkvBC5dl6zcJRhrLmHfJz2Qub4zWiBhvg3ayG6vX4VIGf2haVN/gcSpk
	h6KNYlfWCSkBgOEmpBZXB808W3ixM6WYcrhXKPo7+YkxpM5dfc+TJeddfp96kOgTfhfqKsJ73oh42
	SGLT9e85QBommPGdvc4uzVS6CLaS42MJT0jQ==;
Received: from [177.172.122.137] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xP9cF-003xm9-4Z; Fri, 06 Nov 2026 03:23:43 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 05 Nov 2026 23:23:42 -0300
Subject: [PATCH v10 1/3] arm64: vdso: Split native/compat mremap callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-tonyk-robust_arm-v10-1-366ed4a3435b@igalia.com>
References: <20261105-tonyk-robust_arm-v10-0-366ed4a3435b@igalia.com>
In-Reply-To: <20261105-tonyk-robust_arm-v10-0-366ed4a3435b@igalia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Florian Weimer <fweimer@redhat.com>, 
 Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>, 
 Uros Bizjak <ubizjak@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, kernel-dev@igalia.com, 
 LKML <linux-kernel@vger.kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_182401_437478_F3CE3481 
X-CRM114-Status: GOOD (  12.98  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mark Rutland <mark.rutland@arm.com>

Currently the native and compat VDSOs share a common vdso_mremap()
function which is used as their vm_special_mapping::mremap callback.

In subsequent patches the native and compat VDSOs will need distinct
mremap logic, which will be easier to manage with separate functions.

Give the compat VDSO its own aarch32_vdso_mremap() function. For now
this is identical to vdso_mremap().

At the same time, fix the odd whitespace in the vdso_mremap() prototype.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/arm64/kernel/vdso.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 50596dab23f9..7cafa8208ef1 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -57,7 +57,7 @@ static struct vdso_abi_info vdso_info[] __ro_after_init = {
 };
 
 static int vdso_mremap(const struct vm_special_mapping *sm,
-		struct vm_area_struct *new_vma)
+		       struct vm_area_struct *new_vma)
 {
 	current->mm->context.vdso = (void *)new_vma->vm_start;
 
@@ -161,6 +161,14 @@ static int aarch32_sigpage_mremap(const struct vm_special_mapping *sm,
 	return 0;
 }
 
+static int aarch32_vdso_mremap(const struct vm_special_mapping *sm,
+			       struct vm_area_struct *new_vma)
+{
+	current->mm->context.vdso = (void *)new_vma->vm_start;
+
+	return 0;
+}
+
 static struct vm_special_mapping aarch32_vdso_maps[] = {
 	[AA32_MAP_VECTORS] = {
 		.name	= "[vectors]", /* ABI */
@@ -173,7 +181,7 @@ static struct vm_special_mapping aarch32_vdso_maps[] = {
 	},
 	[AA32_MAP_VDSO] = {
 		.name = "[vdso]",
-		.mremap = vdso_mremap,
+		.mremap = aarch32_vdso_mremap,
 	},
 };
 

-- 
2.56.0


