Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A40C79FA9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ETxX+Ovhc6XcQfH1JJJPmgYMOVMu2SBJPq49n1St2c=; b=0YIg+kV6xRZVdq
	4gpo3wX7tEXekLJJr6TX5U+4RpCJQZ6Wcdcy9WzENMtr62beQ7hgSNa+w1sV692EkjksVBwica+Jo
	4KfWF/K/Ph/yakYG7G1Agoj9lXO6/DH+c6GVy6ckp7MM/mssM1+maoQ8wP1eJ843X6H4XtvuX3AKk
	HJIcMdeRGJwIL+SjXeGiBICF0o3fmfY3X3ofZTviKoyIrkllwj/VrVSTGrDLD3H7rTxmyTiJ34QIL
	HBmmwaSUchS9AoeYthcDFUR4JujA5Nyv8Vo8ApkoPhzHgYver+Gku+aqozTFNj5fCVCcEzg9HQ0Qd
	GGD/iaXRdVmFXzy+BJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRJ-00000007N6H-0qmi;
	Mon, 07 Sep 2026 16:43:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRI-00000007N5T-1iNW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FD2643876;
	Mon,  7 Sep 2026 16:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4AB1F00A3A;
	Mon,  7 Sep 2026 16:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799404;
	bh=4ETxX+Ovhc6XcQfH1JJJPmgYMOVMu2SBJPq49n1St2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CQjhS6Sh5LSuVnGsWrDayRTZgrnPSjn/2w2PspnGGYU3yy8jYWr/hPpLTJIWqbeeY
	 hfUqIVnGK2+URINnFL9/KY7CqBv/xbZJ9UEHqoowMEuiIDJSaJCpItwGvC6AefkS1Q
	 sDxWiP8Y6kuHvD9HF+wCF9XNDjUXG+9B0gL4uQZothEMg/0npy6quZk7wEFsXZJKuR
	 LfCCKrYX2cKijc3EhIih9HZ9nD3BaKmdYlhkoTkgc5M7IT9ZKMaTrY/TXEuxkIaZEK
	 KA6SNzMyZeJIyqmAUWaJbpk5rDVwBsATbTc/CkqoXPeK7Em3cLjXr86OoBlSC6YWWS
	 mvZlROZs55LqA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/21] selftests/bpf: arm64: Use TPIDRRO_EL0 instead of SP_EL0 for 'current'
Date: Mon,  7 Sep 2026 17:42:32 +0100
Message-ID: <20260907164247.17223-8-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog


