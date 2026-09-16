Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C4EC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0dOkaG0OwDR9mA0cZ/v0JZWI6uiu5UK7Ue5qjXYjTls=; b=0TdEGg0dAGsoH8Px3CJYoDC46J
	+fj+R0x1PRm/tR61vTYhxQRHXYq1oT06vNZakJ00Z9pnKDkLobXcTAqOMcgMN427oqQba3kvGGq1D
	vV+HnMjxnyLhw4AGyQqzQiTROzuX2h4AvvkX7xs8zQt1d5pwRb0bDSd9pdDn1RsJoFPSb5R3cva0H
	P1hoMI8XFUUt7YjTk47SMTj4YYvMc0nWLI6V4bQw4H9+y+Shj3MM/WRoEBjfwDxaUC1d4Blf/AIpa
	3G7CVaFh1qQN/j/VfnI1vuQZeyPw/hxUiLdeBmQRP4QmOnuSjH3Jv0HigPkUnJ9d4/yCYS+n9BDTU
	YQcXW62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6iYm-00000008Pzd-3Qgt;
	Wed, 16 Sep 2026 05:51:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6iYk-00000008PzQ-3jLa
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=0dOkaG0OwDR9mA0cZ/v0JZWI6uiu5UK7Ue5qjXYjTls=; b=kOy3bxrHKFws5skJKXXsFqnx8/
	DVIyNXSbqa0QrHQFGNIkEmNdFEJ92OVhsCwRhGmRwneyG1QfVMmUxIS6HTVrI00BhG20uvUgHqb7U
	HjD2o22xj8a3xs9s3g0BKJCPSSp2aKipw7qVePtauSrVBSecI4KIpYdJbjUF4yN528Yyj7H8erMOP
	ThgExKSnqRpkMsi0L/OUZdrN7CAl63RwKtlY/s1zc+kIcFlfXDEFBIuZsW1e4J/c2V+UgKjmNj2ck
	6/uhEjbN6SIT8RBpMoMEZJjlloB2RGYgmWY5aP2cI2h5eN5GT64YVXt7RwoXKhaHugpppyixuNnc+
	4bojP93Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6iYh-00000007VsO-1W6c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:51:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DB6A152B;
	Tue, 15 Sep 2026 22:51:44 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CC653F86F;
	Tue, 15 Sep 2026 22:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789537908; bh=eVbFWNjui3f6RsC9RSFYFqpFfBkLBBW1TiTcOIGgLmc=;
	h=From:To:Cc:Subject:Date:From;
	b=W8dyi54hYTplNiTNQpahZzW3Bl+gbg9Pf9InR/Y9a+CEL6LSViuNxmZ8HkijYZnKv
	 0JMAe8CNESZ/6tqa8f+5MJ0jkGm88oOTN8PS2vFMi/2e5lwaokSRMVJ7PhPpw+GBbQ
	 mZWTcecaxyBPdvjHHDpfx0FV2i1TXzJFnTOr7b3E=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/cpufeature: Change description for ARM64_HAS_LPA2
Date: Wed, 16 Sep 2026 11:21:41 +0530
Message-ID: <20260916055141.2702145-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_065151_716164_0CE7DCD1 
X-CRM114-Status: GOOD (  11.04  )
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

ARM64_HAS_LPA2 represents CPU capability detection for FEAT_LPA2 both in S1
and S2, regardless whether KVM gets enabled and uses the same subsequently.
ARM64_HAS_LPA2 in itself is not really anything KVM specific, although the
description suggests otherwise. Drop 'KVM' from the description and update
it appropriately.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v7.2-rc3

 arch/arm64/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120..c63c1050a32d 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3068,7 +3068,7 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_bbml2_noabort,
 	},
 	{
-		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
+		.desc = "52-bit Virtual-Physical Addressing in S1 and S2 (LPA2)",
 		.capability = ARM64_HAS_LPA2,
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
 		.matches = has_lpa2,
-- 
2.43.0


