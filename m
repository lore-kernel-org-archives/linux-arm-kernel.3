Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C57EC88E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6nCFnRo60Hz1kYj5lfEYZyoVZHMCuWdakDyHVI37os=; b=rz0Xj2x4LyqSiCc/ADJzu5uO2b
	rLx/M7OoKVFR4oTCgXGrxxxtkiN5Z2f6Uz+usJP8ZbK1n84C7UGjAjhVPsStY+Ln/LZGc27PB+CXQ
	TKKolkOMg90Zm6WWDLf9b64cZoDXpQsyNFTh9sa9JSm4hxVIxI22w8fE35JpO7tp+P2GGqcDoWvxS
	QlcCl3fwJZT3klX3G/8Dzr52Qh9Vh3cs0djDkMmJa7ung7MLFvZ+hOmdnNhsVvxxbUMMYcdJzOOZg
	CGX6LmoHdw7GV6nfBw9ouY6h+o6BYscnJ4DWvNDmSKdCC787gA9rUgMOXd7AIASh4V92f/PtB02GZ
	NnI0Ct5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pU-000000036AP-3fPM;
	Mon, 14 Sep 2026 10:22:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63p1-000000035Rc-3UQL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:22:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D010E1CC4;
	Mon, 14 Sep 2026 03:21:55 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4C64A3F9A2;
	Mon, 14 Sep 2026 03:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381319; bh=ShpfkD2WtV2jC5Rx4yrA0QI6fczBgoHkJBl1zGfBvO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qiFg1WjHQOiGbxDZ0pLB7Lif9OtNcnwfqUIf5I5lI/Bgo+Jb7eXS9Si5ErUjYH7ob
	 7EPDZHf8UV5bou7wv+s79TkddZdUBAqXVBXkdKVMlli/zQ7LGPkImCIveAGc/hf+/V
	 OR5OmLOqMEzK5v4Nbt+vv89uYy9Cpz3HXwCkHm3o=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 22/38] arm64: idreg: Add an override for FEAT_NMI
Date: Mon, 14 Sep 2026 11:20:46 +0100
Message-Id: <20260914102102.68597-23-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032159_927631_3312A4F6 
X-CRM114-Status: UNSURE (   8.85  )
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

From: Mark Brown <broonie@kernel.org>

Add a named override for FEAT_NMI, allowing it to be explicitly disabled
in case of problems.

Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/pi/idreg-override.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index 274bc72ba98d..ccda6b2ad69e 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -164,6 +164,7 @@ static const struct ftr_set_desc pfr1 __prel64_initconst = {
 		FIELD("bt", ID_AA64PFR1_EL1_BT_SHIFT, NULL ),
 		FIELD("gcs", ID_AA64PFR1_EL1_GCS_SHIFT, NULL),
 		FIELD("mte", ID_AA64PFR1_EL1_MTE_SHIFT, NULL),
+		FIELD("nmi", ID_AA64PFR1_EL1_NMI_SHIFT, NULL),
 		FIELD("sme", ID_AA64PFR1_EL1_SME_SHIFT, pfr1_sme_filter),
 		FIELD("mpam_frac", ID_AA64PFR1_EL1_MPAM_frac_SHIFT, NULL),
 		{}
-- 
2.34.1


