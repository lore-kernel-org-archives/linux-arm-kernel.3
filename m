Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC7BC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d925zDAc2kwfRYjdGcNdtwZzRyVS9rKiVQOcUxxA/Rg=; b=VsNb7A5IpLOPRy0oWs5+qmNKW9
	ZlYcmmtwlbiabXCnTn8ludYMHL6JoVIH1aRwlDR3cjuQ8boXM9grk/TN5mhGQP8iG0O2U9Fr0ENHr
	hS1vYWyP+ocUfe2vZ1jos/isRLxzLwa2m4Tr7Xtchj81KkjmHerjz22wJTfkNwys211djux8XDoPZ
	5lI1suV3DLcRkJlvJcHIiU03lBxlDJtawwMpIFVi2pidWjJnjslfFkqUStNQpmnxYsNxpUOk9dE5J
	V3ttaSbau6JX6xOabRuZrejq05QleQzk3rnc3mbFatEX48HVT8GHpfxIBHLgKw6P+1id7RGN8PYhC
	ES/L1d7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3hl-0000000CM1e-1axh;
	Wed, 30 Apr 2025 09:26:13 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3c2-0000000CL1t-06Qx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 09:20:20 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746004816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d925zDAc2kwfRYjdGcNdtwZzRyVS9rKiVQOcUxxA/Rg=;
	b=odcvcYZnuikNZQL0qcN0xJ5CtI02ZNWkKxiWWPa0Ad7N18LkC3CQ+FetrC+UdScYC//i5U
	mCL7lk/8CRdvYdd4YjL1sb5d5hM3LHEAdngRZk67EXt8S40C77f180yRkk4GG4QH+cgmF4
	DEcIsEuKyxXxG6apDTwGtyUdpk8UqKr38z553TQO9tPRqm4zesGaPIbpOr1bgbngNcc31O
	5QlShvanxG2utzLJmJHyFXTh2Fibee6CawliBrKfHUpCwg3zBGLibEAC/r75KRxzDBlNy5
	aDEcljcmJiHauNHdz5tBfZZUBdZuOOZ7U5buJENEl/B5XcEi3YGxJQr67wB74Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746004816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d925zDAc2kwfRYjdGcNdtwZzRyVS9rKiVQOcUxxA/Rg=;
	b=kquq+QO1AjUAsdKV+uxn/kzOsqePcd0L/V0SsrHjdlllIgJyjm459NiDdDAo4lmWXoLQnf
	L90sE0YSHNjk0BBQ==
Date: Wed, 30 Apr 2025 11:20:14 +0200
Subject: [PATCH v2 2/2] vdso: Reject absolute relocations during build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250430-vdso-absolute-reloc-v2-2-5efcc3bc4b26@linutronix.de>
References: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
In-Reply-To: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jan Stancek <jstancek@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746004814; l=2113;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=4XMu6PmWiKJtEbyVlX4KrB4GS+s4XTABtUWp9SpHQiQ=;
 b=Cqd1NFTPQfdv48z6vCZlhE04UKM1O0irx1jjUv8xwS3PLV6Of9e/QUlOWgHhTkT7jW2dZRCDI
 52v/1nA3ol5BBV5d+MbucP1kLfF+rFw3wczVF8rUcdcblECAskVVrgd
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_022018_204599_89810FDC 
X-CRM114-Status: GOOD (  10.49  )
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
Symbol references are marked as hidden so the compiler emits
PC-relative relocations. However there are cases where the compiler may
still emit absolute relocations, as they are valid in regular PIC DSO code.
These would be resolved by the linker and will break at runtime.

Introduce a build-time check for absolute relocations.
The check is done on the object files as the relocations will not exist
anymore in the final DSO. As there is no extension point for the
compilation of each object file, perform the validation in vdso_check.

Debug information can contain legal absolute relocations and readelf can
not print relocations from the .text section only. Make use of the fact
that all global vDSO symbols follow the naming pattern "vdso_u_".

Link: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120002
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/Makefile.include | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
index cedbf15f80874d4bb27c097244bc5b11272f261c..04257d0f28c0ed324e31adbb68497181085752f8 100644
--- a/lib/vdso/Makefile.include
+++ b/lib/vdso/Makefile.include
@@ -12,7 +12,13 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrand
 #
 # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
 # dynamic relocations, ignore R_*_NONE.
+#
+# Also validate that no absolute relocations against global symbols are present
+# in the object files.
 quiet_cmd_vdso_check = VDSOCHK $@
       cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
 		       then (echo >&2 "$@: dynamic relocations are not supported"; \
+			     rm -f $@; /bin/false); fi && \
+		       if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " R_\w*_ABS.*vdso_u_"; \
+		       then (echo >&2 "$@: absolute relocations are not supported"; \
 			     rm -f $@; /bin/false); fi

-- 
2.49.0


