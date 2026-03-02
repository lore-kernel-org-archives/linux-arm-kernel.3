Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2D3E9B372
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+wSVvr2iY1iH7k3F0iPCSqLzNSvbTbj527LLEkOjHE=; b=YaA3w9s2kQISEyeB5HEQh9AeUw
	OicH0+Nf5EhQ9I6RDO20XrvWWuR3FDvHjX/eHBdLtRyqTKLrChTz7YmogNKLjx++0K7gdf/LGgysh
	AHi2hV73t1MGHxuZThb0JEHIgT7kjVO01BlDskz4oJug0YBEK4Mpy82EG9PgpOC4wg9UpJXITQTR3
	9RLMJZ/ega1I+5JJRlc+qu5SGmq84RVZi+oB/LPCMOZXADfvwKxy5WVvwDzAnKNDcdzMkld/xy+IB
	WV7xvnUrPtdZzGLeyfM3E4UVMoq849qyug5F0d60g0fDiXehyJ3V7EhpBz86GE6lXVBUSspKXhEH3
	Sk3hEnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LT-0000000Cvxf-15YH;
	Mon, 02 Mar 2026 12:25:55 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LM-0000000CvpC-3INK;
	Mon, 02 Mar 2026 12:25:50 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+wSVvr2iY1iH7k3F0iPCSqLzNSvbTbj527LLEkOjHE=;
	b=0ote18nbZ1t68zJyeexrdJSVHAZPwP9UOAsFgAAFR/fpqYcoez3egBK6lgBnGLIpBoYIKz
	byNNJflcxX/8kT7PsREcxt3F16BI7KnZB/m2IKc74GZSYeD2m3CHoAuFhIulLiNJ8gNHgT
	fEGJClPPwBHWhKwqt8bqeoHqX9DFdCRP2bHywf7Ar1A3BuZHm88vpLBma/whU2VfEjPu/N
	0AVHGyqtCyidsedREaPVbnXHovlkR1DKs3rnrmanu3HagPXtCHNl99JbLfJz39FsFs/Mnq
	gYBYIP+QlW6OTeMQ6Ptwvq/2BcQ8xXbDDHUKO8JYjy6dMfwBHZRxnLHMpnCOzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+wSVvr2iY1iH7k3F0iPCSqLzNSvbTbj527LLEkOjHE=;
	b=/aSPglB8AXbqg7opAXpO0/jUG+0+n3k3JqmDL/ll0iG0SJf+fha6jNyO8a0dtGc75s+t06
	2+O3rwMHLHMlBaCw==
Date: Mon, 02 Mar 2026 13:25:25 +0100
Subject: [PATCH 01/15] MAINTAINERS: exec: Add more auxvec.h variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-at-vector-size-arch-v1-1-a11f03ba2ca8@linutronix.de>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=935;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=BIlr7zgi66zD1ig2kTolm4aENXktO7wosOLcoYFwhtU=;
 b=0OWgCWYeIEIelNOmr0tEyiBwM5q6MuFfywVklpSmD0OLBHIs+3QQGBNYsmCJJqT5R/0oHxk2v
 IVHrY681uTqCvAuwCRegS2QuY8D2kC+ODREUKmQlpZd3Q/msGQ3Pvmv
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042548_960130_DF05811F 
X-CRM114-Status: UNSURE (   6.21  )
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
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..7a2c952d72bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9573,13 +9573,16 @@ L:	linux-mm@kvack.org
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
2.53.0


