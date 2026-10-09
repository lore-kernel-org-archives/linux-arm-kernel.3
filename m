Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BE4CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 22:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAOBHMNpurSLKSiNEPriUrzOlj7tD6EdY9xQFSASZpw=; b=MUg6tUA/IkymYTCEmH2CSGAbxU
	OIqggUvCVo1XCM/1LU5bHFxzFbNES7HVvzcKOf+6fmEsEdaqMOsW4JmlA7wrrkMV3YZm+jsWPAihA
	Q+ZFr/gzJzYJF8f0I3ZN0sN1oPsxgMZIyfWKt4b1ou9EaiUI3QnnY7TyRNDxEU8g9OQ3NdTy/kU6s
	4ko7IAIjJGdxCa63sVje5ZTQJLsZrGQtS1pIcsciQCpzO6l8U342VS6Y2mae1s6AkxYPgmeS3iICA
	KMt1wamR++fd0H6Sq2Do/llhefH1QQeN3WWmJWxJrVkn0PZRb0PyQIPTL8UYzlXv0VjIFA0c4AFJh
	xNwSz7HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyn-00000007HMJ-1pow;
	Fri, 09 Oct 2026 22:22:17 +0000
Received: from chamillionaire.breakpoint.cc ([91.216.245.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIye-00000007HFQ-2kR6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 22:22:11 +0000
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025; t=1791584524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VAOBHMNpurSLKSiNEPriUrzOlj7tD6EdY9xQFSASZpw=;
	b=HOzel9O8u1kt2VLByEKmKpNNfL8q8TBUdvTad0DZgE5KgnL3+du65ofsKN2jw7hDoYhdyM
	Ys06KZ3FkGEJGr+lKY0F/Pf1L/wVMy9qcqQamlZC/CjdOJSX9bBfG0FaUoNLSKLH8HCNdp
	Ik/ovIdGdsziLMSu5apCgSL3YHyvy/tcNrYSulRLAUz+Izt3ya1KLJxN7cFQ/4wIveqIgc
	9wVycV6lgefplRPZhWHZHVEggZEDgr6A+mbWnFskakiz/wPenARAHoO5A4lL/xWgiCL73G
	x26lSxKEyIu4cqnJBleNQQMAcK3jGCQcofNp10ebPeNWn/zknW0J8fDYGRKiSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025e; t=1791584524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VAOBHMNpurSLKSiNEPriUrzOlj7tD6EdY9xQFSASZpw=;
	b=CDm7gBx/uUPDuwYaBQAzKCbssbjx9088wgwf6Q8GqTjMJAzcjO3e11wdqY7wDXbqhC7k3v
	av4KNVKUvL/2qqBw==
To: linux-arm-kernel@lists.infradead.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 11/11] ARM: BUG: Add WARN support via __WARN_FLAGS()
Date: Sat, 10 Oct 2026 00:21:18 +0200
Message-ID: <20261010-arm_warning-v1-11-ddf4be42ae0d@breakpoint.cc>
In-Reply-To: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
References: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_152208_835970_E4C27FF7 
X-CRM114-Status: GOOD (  10.34  )
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

the recent rework makes it possible to add support for WARN_ON() and
friends by defining __WARN_FLAGS(). The __BUG_FLAGS() macro needs to
pass BUGFLAG_WARNING as option to distinguish it from BUG() entries.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 arch/arm/include/asm/bug.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/include/asm/bug.h b/arch/arm/include/asm/bug.h
index 963365b3158b9..f9c093bac432f 100644
--- a/arch/arm/include/asm/bug.h
+++ b/arch/arm/include/asm/bug.h
@@ -65,6 +65,9 @@ do {								\
 	unreachable();						\
 } while (0)
=20
+#define __WARN_FLAGS(cond_str, flags)				\
+	asm volatile(__stringify(__BUG_FLAGS(__FILE__, __LINE__, BUGFLAG_WARNING|=
(flags))))
+
 #define HAVE_ARCH_BUG
=20
 #include <asm-generic/bug.h>

--=20
2.55.0


