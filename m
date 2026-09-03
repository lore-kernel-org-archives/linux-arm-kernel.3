Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE72C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lkcv/qW5P2wXcqdkS4YaEOXwLUoklB1MYpDe2x8Dm1s=; b=dJegQGKkkip72SW+1T2zisHbkh
	RzmR3pp0him9pT3EDfNxzob8rJjsS4nIgo+/lm9WozJmXrCuSFY/ibT0Gi0pkAJIL81zBWeF94Mjw
	z8oFOXsHIW1TpPlQF1+g1hB43f/nSONs026fCV33hOgspWhSL9+gratbVRgN0E3JUNrcVrmWRlNgA
	BlyVJQahY/ty2nQ6lIv8M+01v+dn5ZshrUMzKxgfnyCn1ApqiyyUHu5YFFPJuvgdnsB8D2itenB+L
	d9QTbb6l64DvRO7Df+GzcT5N990CO+QLaffONBoehhuuG4Y5Eld2BYtgzZ/UpNbPU7DZ4jX0nXaHL
	bhNnQKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xb-0000000050C-0Tr7;
	Thu, 03 Sep 2026 16:06:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xX-000000004yU-35fd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:06:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D56351650;
	Thu,  3 Sep 2026 09:06:33 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C29F53F673;
	Thu,  3 Sep 2026 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451597; bh=VxTzA25wjumB3+f3mjAuzTrnWqfe4sUlBMNEnKhLDPs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=K4WbhN5zlcBSFyrVzluRZ5FkRynRdz8ifU/6SYnsipqn8DICTmH0uTvLW8Z8OJPZ2
	 rN08aJIm0LmX/VFDaCRzl6iGotbU0Nr7ggzv2gpPGHdjftet6a3csg+e4mUd+i5zJ/
	 GaCES9PB68Rk+l2yqZUve+uVc6nsGwVPfDFqAk/g=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: [RFC PATCH v7 01/28] arm64/sysreg: Add the nVM field to PMBLIMITR_EL1
Date: Thu,  3 Sep 2026 17:05:56 +0100
Message-ID: <20260903160623.315525-2-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090639_813776_474256E4 
X-CRM114-Status: UNSURE (   9.17  )
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

Define PMBLIMITR_EL1.nVM, to be used by KVM.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/tools/sysreg | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 94bf065c8ac7..a11a968eb707 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3106,7 +3106,9 @@ EndSysreg
 
 Sysreg	PMBLIMITR_EL1	3	0	9	10	0
 Field	63:12	LIMIT
-Res0	11:6
+Res0	11:8
+Field	7	nVM
+Res0	6
 Field	5	PMFZ
 Res0	4:3
 Enum	2:1	FM
-- 
2.43.0


