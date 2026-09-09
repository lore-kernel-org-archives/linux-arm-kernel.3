Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2210BC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BSSPIkVsfUiGZ/2/7JQoGktT3Bg/qW3vWeVl3H8t4I=; b=uxjnXMDyEW4b+4R414JDuVesUm
	2Xlk1fTL9Ser1gGvG2YvOa4G5VuKWfY2q73kqszzmjXfxR1WJgm7+HABN1v8Mj/ahdfGDmB8ustCR
	+1pj+rF0nca4zhSmWAWggu4I9ftbsMi1aT2+dkdNVZWziePORE5eK891BEUmndrQiEzd4v6F3c+F4
	LuhWsQblrJBbuA1u4aj4+4ryZN3EQ4l7ViYdZ5sHlaneJPML2ux8HuiO0WPnxPZrqSbBaIGauhX3W
	U+FN9i4N+mDYEr0rgr/JTOz8SxrgSz3Ut8VVXkxaC9QD1r2gbFfhcitwKY2N5qQAyuJ/Q99eXZEJE
	56373wpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E24-0000000BAef-1Wjb;
	Wed, 09 Sep 2026 08:51:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1l-0000000BAG6-2t2O;
	Wed, 09 Sep 2026 08:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+BSSPIkVsfUiGZ/2/7JQoGktT3Bg/qW3vWeVl3H8t4I=; b=d8RQ4kO9N5NXJwEBZv9tmOB2zk
	VfDzNDsNT0319Aa2wXvPuv3cOaKKq5MF1Z0nnAx5liWYjYWzRVpfRsR03Ozwk7WA04mkJLImZs6c0
	bZ/ygmHgb0S/bob+nKCckaI96EgkcTpJsBPa6zdUksi9lMNZzDr/1LNRR+yuVpAd9bHCexArbo7aP
	7i455UaQt/OUEnMGI2k1/ZVOYexwLpkCI5sxaXrUsyIr4ARKqFNOG1YL8v7uqK3701nfpCd0sokHO
	z8t5TPM7QQsZHvxwudctZPtCRs7YvSniPVZpOoQ1JgAIcu0DEWZC5cYLE0CHmDg4M+thi6o/xzhj/
	F3J1e42Q==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1h-00000000wHm-1Trq;
	Wed, 09 Sep 2026 08:51:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+BSSPIkVsfUiGZ/2/7JQoGktT3Bg/qW3vWeVl3H8t4I=;
	b=JaOyz+GffrY14/vqZR3mc3aRHefVc9sKFST/Y+iv6y2dWE5XkrXmA9ZJsAgqJ018f/vug2
	cBMChuc7FaXyUAF9yQKOHxlkPemVJ32YoyN5tLBaH5C5wxOmAtxy0Ukobemx+5ORO7uFfy
	Wiu0MtImMa+hOKQRUZBdB84qZjgFlKRYR7h4fdWiycJ85XrjCvCyV1y6fITwXy11WldYgg
	+vgzkpMELO8vXyECyskLAnuY5vVpDRCTsaR+01bT+hpNKuUJVRHkC5wWfCgNEJWMjBkGqg
	t+9mVcjwwU/JEljjnrLJ3bJK/1yy+XyvUm48H3zRCFfkamQLKNoJ6UlylCYASQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+BSSPIkVsfUiGZ/2/7JQoGktT3Bg/qW3vWeVl3H8t4I=;
	b=y5gKHnSvh3NyUEy73IKx6RfvsCL+Ha6mwmh698IzxBvPV1anfbtnSec1fGWt7Tg3vCMaSo
	l6Cb8RNPcUh7xvDA==
Date: Wed, 09 Sep 2026 10:51:25 +0200
Subject: [PATCH 12/15] riscv/hwprobe: Include vdso/datapage.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-12-63ae856cc659@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=814;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=WJuW0vHAzgVK65zYpMsMpkIoWVAhRqBIQ43ugL+Vfgo=;
 b=3v9PIQWIfY59Utoqf3u0a+2xyzC3K3qFiLXNZMe7AgOtEielmjn6RIPlrTTQkKqzrYA4P+N4f
 jrwA4Hzlo03Cus2D1tSaBop8ClV4dFKjXJ96j2IsAFgQehGy3G3Rb0w
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095129_545306_DF47AD42 
X-CRM114-Status: UNSURE (   6.55  )
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

The symbol vdso_k_arch_data is provided by vdso/datapage.h,
which is currently not included explicitly. An upcoming refactoring will
remove the currently used transitive inclusion.

Add an explicit inclusion.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/riscv/kernel/sys_hwprobe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bd6ca7d769da..0f42101ad935 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -18,6 +18,7 @@
 #include <asm/vendor_extensions/mips_hwprobe.h>
 #include <asm/vendor_extensions/sifive_hwprobe.h>
 #include <asm/vendor_extensions/thead_hwprobe.h>
+#include <vdso/datapage.h>
 #include <vdso/vsyscall.h>
 
 

-- 
2.55.0


