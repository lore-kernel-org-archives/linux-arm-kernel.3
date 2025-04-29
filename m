Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E24C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0g0kq1GJUBlyV/4mQJ3oyVCKLrTdBKzHhBh0h2Qg2mo=; b=aFQATRBSNlcpgx7xsuDj29XGUR
	+uN1ThAHgvWsdomTPHJDUAHaivgztQOw+7bOHisxV1MJJevNOqRECVRAGtFi3SRV/I5pFcXbQKENg
	kxiDK4WB553knsUMil0ePtvbO9Igfxpq1XH2AkkNCwKIu9ayeskh8c2D2umk9cDa/7E9V4k5P9tga
	33tBUoiV8tD6zn3AHFRyGfo1JBny/XyqikphM53r7coQoAOElAfR5EXFWCvmDqEWnV8SsRjxekjfZ
	DCWkeL/chpD1daymeHeEB2gIJDpoeLKeYW8M4zGrkG0aZJya1Ydb4q65JP+Pv0NQCJqaXfy1mvagy
	v8R1FHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mgx-0000000A4t7-0edX;
	Tue, 29 Apr 2025 15:16:15 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kVM-00000009hQ7-4BAr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 12:56:10 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745931366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0g0kq1GJUBlyV/4mQJ3oyVCKLrTdBKzHhBh0h2Qg2mo=;
	b=D83lzDxKEAZKLS4xvhsGKAkVZ2FickjGHV3/zzSVppOCWil0Tbzc8wufIlnJBVvuWYsyuk
	C8iU/e6zFpn8ZBPdEDk3grjFVTFOr3Sei/Le6LRc7T3cpYi9Hasga/O+D6cQNV2zM4bULR
	kZPbmKxFEjVeONu4cmYT0ds/CMFMyKilPUyuQp/ObDMg6hu1orxhWQuBiiVD9TuphEJDOY
	SCWByvzmGiyVJ0rC7Zy1xGukru3pBwY/X6NiR7kEvNaRXMsm1TOxuohBy32eFegUWyH6hS
	0AqpHeDkWwBiTTAAfITX5ZI92CyKnliNE0NnvbbTKF0Etr4y9+ksLsHW05Y/Gw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745931366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0g0kq1GJUBlyV/4mQJ3oyVCKLrTdBKzHhBh0h2Qg2mo=;
	b=ZzP2ctHOk/iRiYGC2HJzCvIlvid5mdyxGKtuWdGZmF4K/4eRWmqmwAyb8IOOgI8EvFysi9
	lBdHmjUTAvjfzcBQ==
Date: Tue, 29 Apr 2025 14:55:37 +0200
Subject: [PATCH 2/2] vdso: Reject absolute relocations during build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-vdso-absolute-reloc-v1-2-987a0afd10b5@linutronix.de>
References: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de>
In-Reply-To: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jan Stancek <jstancek@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931364; l=1750;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=9ioab1t8nXmZsDjk3HszCYql2zzBu0n7CbR97op4z8s=;
 b=GqG+9nPu7ZpzsSRTLeO2J+RE6AibS1nmAQY+eWO/BXhGhDl4ouHvQk/DiwhEMyISnB+xhLsVj
 EaQ8sXrRPAnBp0itVvNsR/q6jLtqLGyAfNgi6F8tfv7Q58pRYAmmuOb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_055609_179635_07228ABB 
X-CRM114-Status: GOOD (  10.57  )
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

All vDSO code needs to be completely position independent.
Symbol references are marked as hidden so the compiler is forced to emit
PC-relative relocations.
If the compiler does however emit an absolute relocation this will be
resolved by the linker and break at runtime.

Introduce a build-time check for absolute relocations.
The check is done on the object files as the relocations will not exist
anymore in the final DSO. As there is no extension point for the
compilation of each object file perform the validation in vdso_check.

Link: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/Makefile.include | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
index cedbf15f80874d4bb27c097244bc5b11272f261c..18fcc94e4d6bf7abf374c7a953349e7ad75f8a18 100644
--- a/lib/vdso/Makefile.include
+++ b/lib/vdso/Makefile.include
@@ -12,7 +12,12 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrand
 #
 # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
 # dynamic relocations, ignore R_*_NONE.
+#
+# Also validate that no absolute relocations are present in the object files themselves.
 quiet_cmd_vdso_check = VDSOCHK $@
       cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
 		       then (echo >&2 "$@: dynamic relocations are not supported"; \
+			     rm -f $@; /bin/false); fi && \
+		       if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " R_\w*_ABS"; \
+		       then (echo >&2 "$@: absolute relocations are not supported"; \
 			     rm -f $@; /bin/false); fi

-- 
2.49.0


