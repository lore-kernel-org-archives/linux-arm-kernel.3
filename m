Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE06C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 05:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VZfi/Sxd7xOeiYk5Wi//9/5DpiE7ZJVjm+HEr4xMvo=; b=wm6urRqK9tdKRTsFnLiW1RD4pN
	Sywq4sSULMQrJus8AHgp2/qgmWGAnabIybfGNJEs0b4aWn/obwXunTIBwt750sSMuBg6qvE1JDqwd
	jCuyfn7r8H/APEifsBmxSPLo3mIs6OvUy5EX5EBXkig1LxQs9wyKxYM5FCXjtc1gHJ78IVjtb0H2g
	X3zfDesHMZYR0n+kMH757TZGKJlbfGdaklgUuTBjF1VqiP2ZzqpqlmNd0i9dPFgF6wQ9XUp+WeW2C
	fxIjrcMSF8WprlPlChYp/r7V/KTz0TOyDcyH/+ZGJqeeUl8aOukjAefgP7mkstQ/XFBPeNw5PO+SI
	QUlSuf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsGj-0000000DoLK-3X81;
	Wed, 15 Jul 2026 05:34:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsGd-0000000DoHH-3JKS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 05:34:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A9C0339;
	Tue, 14 Jul 2026 22:34:41 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9BF4F3F915;
	Tue, 14 Jul 2026 22:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784093685; bh=nxgV4VVUbFhBk+TSn4RlaqR9wD5zcYBXwUNgBXrhO6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lxmjtZV/C65aumSvmajIJK5/sM7r5TRB0kEGQbMsY+jG+DOrcAUeWRYgVmDN3O2e0
	 K51weK32F8bIozpvYHiaZ2tS/Oos1mv936uBDjmWNbhMOlyH6Dhv90r7xnJP+YdxTP
	 0bB33lhe+jSbaK/+IHKnJCqo/BKLqnYV6oHi+XG0=
From: Linu Cherian <linu.cherian@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH v3 4/6] arm64: sysreg: Add BBM_3
Date: Wed, 15 Jul 2026 11:04:06 +0530
Message-ID: <20260715053408.1950475-5-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715053408.1950475-1-linu.cherian@arm.com>
References: <20260715053408.1950475-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_223447_981588_0DB60A1D 
X-CRM114-Status: UNSURE (   7.09  )
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

Add BBM_3 definition for ID_AA64MMFR2_EL1 register.

Signed-off-by: Linu Cherian <linu.cherian@arm.com>
---
 arch/arm64/tools/sysreg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 7cb61aca3797..e070ada06196 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2259,6 +2259,7 @@ UnsignedEnum	55:52	BBM
 	0b0000	0
 	0b0001	1
 	0b0010	2
+	0b0011	3
 EndEnum
 UnsignedEnum	51:48	TTL
 	0b0000	NI
-- 
2.43.0


