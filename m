Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3379C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnYb5yQh4YrVkPPKmGo89y52fD6x5pIfdugujqZykdA=; b=pT9BGxtglIZBfT
	EMNzGbkl9jSM1Odv2PCLs0V9WHY0JihgAzjkmK+TTxTpvfMbhoELgSpDjalF4vNQaF/8kh97t1IzM
	8Uo1uJxgnUZJS+3didF1Ms5ingHnNoNoYgdWsATdPZrZ+5CEDoOrtNtEI0fAlL6VUUb54V932DfMe
	Yy6uWqRj8jqSjFQKl4nExS1AsrX70Bktn+KPyih9usr4YrR/g2mopIWY78DaHYfrac/wAjs74Tf5F
	Ut/BRZ/RSXdW03/b+AphTmssZ/D1FJIaYkVQOk7RLqGTrHaIvOvCRwRIclDRTtD7l1MbQwHtwHiIY
	GK0vHdD8p61bvALZWsFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneR-00000002LUo-1jdy;
	Thu, 09 Jul 2026 12:14:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneE-00000002L6S-1Awo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18B041476;
	Thu,  9 Jul 2026 05:14:29 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 203A83F66F;
	Thu,  9 Jul 2026 05:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599273; bh=AWgYMmX9nOG6DEWzjbVLL9XqYD+rFlZHUfJvM/c72Og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MPTmpmEzzq78TJCbie7dK1R29jaIc5i6KTs6gU+lbd0ZSzpgSnktZsT+6OkErpFyN
	 Oo/pZ3ygaEaqhNMSIROFH791ATDIYPBwIDO0YegtSwJ6rGFZ5aoGbMwTi6poOHRvH/
	 AwGNn6cJvqDnylXQXsBeyNn6yDU5JUrp1AS/QiKs=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 27/36] arm64: idreg: Add an override for FEAT_NMI
Date: Thu,  9 Jul 2026 13:13:24 +0100
Message-Id: <20260709121333.23507-28-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051434_378187_4874BD4F 
X-CRM114-Status: UNSURE (   8.79  )
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

Add a named override for FEAT_NMI, allowing it to be explicitly disabled
in case of problems.

Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/kernel/pi/idreg-override.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index bc57b290e5e7..e5ea280452c3 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -154,6 +154,7 @@ static const struct ftr_set_desc pfr1 __prel64_initconst = {
 		FIELD("bt", ID_AA64PFR1_EL1_BT_SHIFT, NULL ),
 		FIELD("gcs", ID_AA64PFR1_EL1_GCS_SHIFT, NULL),
 		FIELD("mte", ID_AA64PFR1_EL1_MTE_SHIFT, NULL),
+		FIELD("nmi", ID_AA64PFR1_EL1_NMI_SHIFT, NULL),
 		FIELD("sme", ID_AA64PFR1_EL1_SME_SHIFT, pfr1_sme_filter),
 		FIELD("mpam_frac", ID_AA64PFR1_EL1_MPAM_frac_SHIFT, NULL),
 		{}
-- 
2.34.1


