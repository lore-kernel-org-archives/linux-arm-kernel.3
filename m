Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6B2C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 00:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAJVlL7V3Svw6ebZPQuFtG6AvhLc+t5u5Nl4UBUE390=; b=27leSo+4bBqDKCMVXRO1MBDOv7
	BoyPKYvwhgPCl8peMH6JdamO7DTci94y0v5kygD3nrQPUrCMhgObeQXKmDcCFK1DcayCgfDNMrmFt
	yOJa3brHBb2PVQqSha6u41TdH+vgFEO/2OWlGSUgc3pepB2Cs4mG7BMJ1JtJieuHFLEgz0oj6Jqar
	GXVCUzIZ2E/c8l3jszqjis5p+IZCTOIjswiacx4KpmIW5t6S3eqSqRWjL8X5iYTm+Bv7MIJV2UuO3
	fuTNm7boL/5FQ5f6W54KThhwxqGvr8ITMuB30F/rx6BqKKX7UJ7rdAgLDjQrdX7Hwiq2nVcs/UW0k
	o57spHRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7MS9-0000000D1Wp-2COC;
	Fri, 18 Sep 2026 00:27:45 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7MS5-0000000D1VO-423l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 00:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=AAJVlL7V3Svw6ebZPQuFtG6AvhLc+t5u5Nl4UBUE390=; b=DGgTvue0enzvlX3BmKWcCiF8LK
	RRQ+UBBCuqUVMaFZsWn9M8ob8JJbON6YWl9/kR7+lmO6Rtu/2VHdHVODbQih6o0TRj2PmalaldDuh
	bkxnPqdwr393dG7G3z0dxw4b5KA5sOLkMKBDCuq3l7BQsGkHbgR1zyPUjipyThRx42yuQFS2WvLPl
	saSP3K5cBabKp2xztD0RKw1kwTcknJKqwE2CseeOO4rV58LsPpekCP9u00kSbgckEo8zoV8tINNGr
	H+tyBzofp+10Ww0uXhey4KwixnZi5WmhziYlKuSiA2B1N335dyY5NqAgW73+f6WsQo6ba/IDm+A4J
	tv4XIa6g==;
Received: from [177.172.123.214] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x7MRl-003iDv-9y; Fri, 18 Sep 2026 02:27:21 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 17 Sep 2026 21:26:59 -0300
Subject: [PATCH v9 1/3] arm64: vdso: Split native/compat mremap callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260917-tonyk-robust_arm-v9-1-ab082b1b4c4b@igalia.com>
References: <20260917-tonyk-robust_arm-v9-0-ab082b1b4c4b@igalia.com>
In-Reply-To: <20260917-tonyk-robust_arm-v9-0-ab082b1b4c4b@igalia.com>
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
X-CRM114-CacheID: sfid-20260917_172742_613663_4895F88C 
X-CRM114-Status: GOOD (  12.89  )
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
index 592dd8668de4..089a70d96220 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -58,7 +58,7 @@ static struct vdso_abi_info vdso_info[] __ro_after_init = {
 };
 
 static int vdso_mremap(const struct vm_special_mapping *sm,
-		struct vm_area_struct *new_vma)
+		       struct vm_area_struct *new_vma)
 {
 	current->mm->context.vdso = (void *)new_vma->vm_start;
 
@@ -162,6 +162,14 @@ static int aarch32_sigpage_mremap(const struct vm_special_mapping *sm,
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
@@ -174,7 +182,7 @@ static struct vm_special_mapping aarch32_vdso_maps[] = {
 	},
 	[AA32_MAP_VDSO] = {
 		.name = "[vdso]",
-		.mremap = vdso_mremap,
+		.mremap = aarch32_vdso_mremap,
 	},
 };
 

-- 
2.55.0


