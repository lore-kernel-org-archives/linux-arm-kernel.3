Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F63DC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcMZPcEqwvVMhaVCt8MkUvZh7YAwKSLLYydvmnNx69g=; b=FubEYEThFbQaWS/Rec/A+DiZdT
	doyTOX2rCOa35kDdfQAEdILdY3qtWkozZzxW1bpZAAZ9f1V7pY4qNnyov3lOVbSJkPf8Tfh76vTHX
	uiSs+WhzlzVImCjMAuKpSF6u1zf6fX48LxyXPNSFDLyUxcZGVlTh4xth7ClihaPrYKPbakNZAvnKF
	+vUU+B1d7nfEUo/k/PP+PggC1DIB0WMeDmA9Sm3ETcMSOPUTbR9Jvh1Hhz2NvEszrUPCGhu8I3aDM
	3OSGCsVBbNLJGzqtC28OD28mi+DOFeATvbOP2vTc5QWx6bGoaBmJk80ZxbTO9gyBgEXE7f2psE127
	qT0kSJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224m-0000000Gckm-0DYD;
	Thu, 03 Sep 2026 07:41:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224i-0000000Gchy-2YB2;
	Thu, 03 Sep 2026 07:41:34 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HcMZPcEqwvVMhaVCt8MkUvZh7YAwKSLLYydvmnNx69g=;
	b=zc+fw1vPS28yXzWhjuVq688bLTlDJP+PQOO2TZg5QcxVNPZStsrnS4EMvXTkuI9WChAUF6
	e98Za95kruhvUKHM3/b34Kuksc7kVeCyI/v89gq/la6051sO7iVJiyemzT0SlIcVMLtp3V
	LBVntQcEnLcQP4mEFAOmRCGnVFjObZYQoy8t1OzlP6lakHcsrKvjUzVXe8XXr5xuJfGQOC
	1qK1oo84uH3RvHqkEN4CnRtgprm3+1bwVoDYK5JM2mCOVa3NMbngliORKzy3gImZ0p3Mdn
	KA4/eGPfFEVefv27hiUMV5YSZZf9/EbNiLhBwaHSRIcgEWjR+hD3IjTxfTw0+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HcMZPcEqwvVMhaVCt8MkUvZh7YAwKSLLYydvmnNx69g=;
	b=rh+ETLVcunE+DHaXRlcjbRGQypXlRas7Gz8RSxyOEQznbIdmSjOOp7xhZp8qA1klyLJlHr
	4QVBYU6drJOyTJAg==
Date: Thu, 03 Sep 2026 09:41:16 +0200
Subject: [PATCH v2 01/15] MAINTAINERS: exec: Add more auxvec.h variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-at-vector-size-arch-v2-1-5bc32a71e3d8@linutronix.de>
References: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
In-Reply-To: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=977;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Nm/6hJEAPks30y7LVA2Wwufq3vVlMHx1IoW0kUFRRys=;
 b=qmIl+ksPTFbWALcvC6gLtF0MRDI5uk7fAOGtmCm6fQ86AWfo/5KOuP/P3VXL2cXkfCyJKwCbQ
 KGGjiCPlRFCAaRujs1d1gu5uZskagQtGmtcqSJJWjBWfEVKN728cCnc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004132_800744_636898FA 
X-CRM114-Status: UNSURE (   6.58  )
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

There are quite a few auxvec.h headers. Mark all of them maintained
as part of 'EXEC & BINFMT API, ELF'.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..42715aea210b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9808,13 +9808,16 @@ L:	linux-mm@kvack.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
 F:	Documentation/userspace-api/ELF.rst
+F:	arch/*/include/uapi/asm/auxvec.h
 F:	fs/*binfmt_*.c
 F:	fs/Kconfig.binfmt
 F:	fs/exec.c
 F:	fs/tests/binfmt_*_kunit.c
 F:	fs/tests/exec_kunit.c
+F:	include/linux/auxvec.h
 F:	include/linux/binfmts.h
 F:	include/linux/elf.h
+F:	include/uapi/asm-generic/auxvec.h
 F:	include/uapi/linux/auxvec.h
 F:	include/uapi/linux/binfmts.h
 F:	include/uapi/linux/elf.h

-- 
2.55.0


