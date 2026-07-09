Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC207C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fzVKBqOy2snTHSXzj4nsxZIeZp6bFOxLjFewY63u1b4=; b=kH8A6R/sN49dbr
	1g+t3Mv/nZMgWObtrq3Y3Xipz140n5UpmtSKKOOfua7l6LiRB2HNo6hdWQhg9muB5IlAwxKIOdX2y
	nTTXKxvawetvkup86vG5DRyxaFCvsWUJ8c/fDuhCESQZVD8ax+oXU99Pae94sXuODxB9vG7KD8XB8
	HdssUDWYuJfYxuTLCph1GWf1cJG/0QHvPFkhFY8+Z7+rYcfKbYZjuQ8C4YZQ6FSy6sf1obliFZ3h8
	+2752wEsjJjj2PF1A7QXqM7O62x/slkZSy7XkCBQSH1MZspddygXAfsNisxdPzwILqd++KZBLfZ7t
	vpq3Gtbr0MWQuSr1lUvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneP-00000002LPW-1fPa;
	Thu, 09 Jul 2026 12:14:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whne9-00000002Kan-0fiz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7498A3569;
	Thu,  9 Jul 2026 05:14:24 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 790AB3F66F;
	Thu,  9 Jul 2026 05:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599268; bh=QnT2TWIvJ9VKFvNsrm+OPKX4qt1Uku2gKIWzUfXxsTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QEmPJVV3dnBCadzAQLbRwnpyp5f646ARbj2sOOc5HAnLkdID+11OYQveLrlHbdkJT
	 z4gERZSRWYDgJRIvDTDxcvOe+QFvHf+l5NxB5+vdJY8ZlvnY0FwPYMXjkba7xYKD35
	 UZeB5mvxrYb9SJd+W+772Q8qFBp5QkI1fHTls2XE=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 24/36] arm64: booting: Document boot requirements for FEAT_NMI
Date: Thu,  9 Jul 2026 13:13:21 +0100
Message-Id: <20260709121333.23507-25-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051429_311664_C82E665C 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Mark Brown <broonie@kernel.org>

In order to use FEAT_NMI we must be able to use ALLINT, require that
it behave as though not trapped when it is present.

Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 Documentation/arch/arm64/booting.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 13ef311dace8..3170b26ae981 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -568,6 +568,12 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HCRX_EL2.EnASR (bit 2) must be initialised to 0b1.
 
+  For CPUs with support for Non-maskable Interrupts (FEAT_NMI):
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HCRX_EL2.TALLINT (bit 6) must be initialised to 0b0.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented
-- 
2.34.1


