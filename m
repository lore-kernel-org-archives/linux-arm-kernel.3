Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8B3C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbYLgua3LTRCkHC2dRvKQSbxhGctAFKekAK0EDDmZSU=; b=hE+k408LJYo27U
	ZO0rLQig32pdvZe3wGYuGIYAnFkabAKIJN9ZfaeDYK6rljM2CnWx1Bt/8D6GGlN+U2jE6MVeI/UDm
	elc0m4t7qoQeiqpy7yoTmyJvQ7lJ3omeKXC+/CBPqpmk+o6KEA+EAkOC5wnwGOm4SBHiWaBRHXEeJ
	7yoqvdhQeuGW2wdv7EE/QFykiJ0Qz4DHy99Jg5Z2Ty2N23IFEKDIhdtQWSP/PAurYGEV4frAmvKXF
	ng8HLL4WUWtFeLIIW57fmvIoIZiMV2W7Kk0VvG5Ff5nOTgNsYZ/m7f685h8y0tu66oE0mx5OiAZ6T
	y2tMz7VdRZGN5vUd4uug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEl-0000000Ez5z-24NI;
	Fri, 18 Sep 2026 16:14:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEW-0000000Eyvz-2mz5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:14:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D37044030;
	Fri, 18 Sep 2026 16:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6397D1F00898;
	Fri, 18 Sep 2026 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748080;
	bh=QbYLgua3LTRCkHC2dRvKQSbxhGctAFKekAK0EDDmZSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UMSBMPqO8Wnq9czmGejil4XXGqU+RtD33pykqoNceiGbGOR3FhEfWGsEdR6/+YYp5
	 MvMwHsljDqr5Ym7RSNgHZtmw/Wf4B9ErzLVO7yq+CIHY6GQtMTr6Wz059JmuCyB1Dj
	 isxtlJevCFivSWcKZcPW8KsZvucON1RxNznHLSdIiYVB6w+ocxv6RlLZLSww7/tlus
	 /3Em1SfAUDKdy0UVnLR9/ZaNNWgYGDLcMFWrHXaa1/mDQWEmbtXPmNPi/n5VjN9Trg
	 2JOmMon8k+7OSoUD1jQtJSB/juWVd40zsEeQwtaOt08SWCD6AD8mGz164psJ6qTA9C
	 4YdkwCHepl+/w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 07/21] selftests/bpf: arm64: Use TPIDRRO_EL0 instead of SP_EL0 for 'current'
Date: Fri, 18 Sep 2026 17:13:51 +0100
Message-ID: <20260918161407.2300-8-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The current task pointer now lives in TPIDRRO_EL0 instead of SP_EL0, so
update the bpf selftests with the new register allocation.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 tools/testing/selftests/bpf/progs/verifier_jit_inline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
index 02e562f56f9d..a3d6c095acc3 100644
--- a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
+++ b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
@@ -9,7 +9,7 @@ __success __retval(0)
 __arch_x86_64
 __jited("	addq	%gs:{{.*}}, %rax")
 __arch_arm64
-__jited("	mrs	x8, SP_EL0")
+__jited("	mrs	x8, TPIDRRO_EL0")
 __arch_riscv64
 __jited("	mv	a5, tp")
 __arch_loongarch
-- 
2.55.0.1082.g2b9226bbc0-goog


