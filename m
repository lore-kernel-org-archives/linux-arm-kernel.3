Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D23EC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sC8+6J9OLUakbA4e+Ap2B6uuZE9Tl7PwTVwk0psJD7w=; b=1kaluqf/cLqltHYun3LMw3EbCC
	pfrdh7FAwjbhxoMRxv/HMdAp/UioyR4IyE8IBaERgbdYxPrkVDV1uH5e+vXrgkXTTaut+rtToIOGU
	biAR1sChku+sV29HidxMaelgKJn3/NuibZDv7ol1Gs5Yu0nC8VI1uq7yEhPkjabD7sBlbmjOdk2U6
	C5IMPMao9feNoX+jtkBvUbewl2yw72UCw39B5rKAxjnR1ZJmbFElaZvxP1rPk32vwgMOJIECVWtGJ
	OB5WegdHya9CNLV4Xo3uOLHyiuEiyIBxZpGl8YnjfUJn6NXUBW5N+3W1+N8yXrorPVCgRJFbv7dd1
	XxLKII2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E23-0000000BAd3-3gsr;
	Wed, 09 Sep 2026 08:51:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1l-0000000BAG7-33rl;
	Wed, 09 Sep 2026 08:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sC8+6J9OLUakbA4e+Ap2B6uuZE9Tl7PwTVwk0psJD7w=; b=CwJq9ggv9Vd7Krbf8xhoNyufVi
	NGriF9r5HAikkiNzykHuCyarcbl+t0lw4RQ1qDQkSgFcNU3vuLPx/0trwNVRwDCzuES2kyuZw7kot
	eoaCbeuHQmnH/Wk9F7WqtghAXTCQ2zXICtkqRyqEJSP0q8MlzU9QLVu6O+o3VtMQ5iJV3+5Yj+D1S
	//CuLXNQ5jWBeQJ0yWt6ss4SiPzp+AoD29yWswYhyCcBg1zRo4Fp8QCc393j3Kzk4j3kTLvFwrHNF
	qVtuO4P7hjr4s3u4e1voMo1H/kHFjTisr0FpMzNI4rLI/Q1lJRPnOffNVIYnee5vZWZwe8J7hQlJe
	BbdNvuGQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1h-00000000wHa-0Pbm;
	Wed, 09 Sep 2026 08:51:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sC8+6J9OLUakbA4e+Ap2B6uuZE9Tl7PwTVwk0psJD7w=;
	b=18ypzormw89rOzBf6uIIHYH1wJOPorGI4jxdXBGhkEdBQPZOLIVTm3KlRtbdVDtdGj9VG7
	Dyjho9sIcBEasT5u31Y6tYFz04xKu20FzftA5gy6Id8NhHbhfJut0d0PS+7ZjetZKmijCh
	u/3olgtjrDEgB4C5ITT4CpG3VJZ5DK2VcHCG/wOlxBKI+jSGLQNOi+m8a9Y5OivTRfFyAs
	2pKxnMgQ6QXgcLRV+3MsRlunL77unXFK+hIJ7P2eCY8PBRsZctieqL2rbr4yWOsH/yijps
	0oceS1P/fPh3YWLS+ARzngBQRl6bCpKYgOPJXYvTIYdpTZN4WO39XXP4Yc9OKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sC8+6J9OLUakbA4e+Ap2B6uuZE9Tl7PwTVwk0psJD7w=;
	b=V9tYUFNzgGBunIsna6vZfNbVMtIIjvl+n+kfHtNDv+819iutT7PUqChs4OihB+GRdxuasV
	MJxc+Wzwhfj+biBw==
Date: Wed, 09 Sep 2026 10:51:22 +0200
Subject: [PATCH 09/15] sparc/vdso: Delete asm/vdso/vsyscall.h inclusion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-9-63ae856cc659@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=516;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=p+b8xoqSRp+BaXpuv6UkhI9jSr9haopNWgF+UmEOVQk=;
 b=M4PnWWjB8PtId1XPU1zVCslJBTDHYh9V/L0XSbIVM9OptHzq+tq0jklWaWwKlEoUCNwkyM6tW
 rJ+WK8pnGurDoAd2fM6SfaNEA6DETxYOyV8t6MVuFm8YlCVyu8Tziow
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095129_359481_86509C9B 
X-CRM114-Status: UNSURE (   7.11  )
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

The inclusion is unnecessary, remove it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/sparc/vdso/vma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sparc/vdso/vma.c b/arch/sparc/vdso/vma.c
index 60029d60f4d3..ab6626c1ee61 100644
--- a/arch/sparc/vdso/vma.c
+++ b/arch/sparc/vdso/vma.c
@@ -23,7 +23,6 @@
 #include <asm/page.h>
 
 #include <vdso/datapage.h>
-#include <asm/vdso/vsyscall.h>
 
 unsigned int __read_mostly vdso_enabled = 1;
 

-- 
2.55.0


