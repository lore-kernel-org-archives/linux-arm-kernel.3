Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE3FE9B365
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1wiRSMAnWsiFldzChCPC3YmaizXVdixv7oH9cuIYZo=; b=B9AVxL5hgwxv8JEfbMoPQbjrLq
	9QQbUjKgoZ1pgUUpoc+s36ctnpWHfLo7BVyDZ6Yius/csIDF3W1j/JORzQSMXRfOsGhLjmD8HcImW
	6/8YsZgjxtb8tsaeEXXOV0DmWkwA4z6iUy0SYjUBGFHeuIwACvBHBCBPokdG0ML21IJRT5zcWcAwO
	tY9yIhvBr2wa48ycsIgPtXIr4Gcek6VDAeymYCP2UMohYc+0SFuq+ahU4fValxg5xd6CC4ZnHwwsx
	H0PLs8UyoimJ0Ow5B68Lei0LCW/4KmwHkGofXF4sLjRddt1YZrLGOVnN7gcrDAM22PSdNblXkDoFA
	aIfhhSkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tp-0000000CsPa-3cYe;
	Mon, 02 Mar 2026 11:57:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tm-0000000CsKK-1HYW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:57:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E4A3600AE;
	Mon,  2 Mar 2026 11:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22290C19423;
	Mon,  2 Mar 2026 11:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772452637;
	bh=0NKj1xsMfzoojLz4OrS8obtJgA9ZMg+TGGATcRFcjHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eiBVZUUlnq8zGVinPS7sPQ0gGmuiCUZLHUsXkUDBRT57uGcDfnkf6wjpI+Qy8z1tc
	 YwqPUK9m5tE3s1FnVZvlism6SculbxHpdYpb/tnoFzoGjXcoLLoCGlR+bw+j67ixya
	 8+apRvgfkPY8ZEHYMFdnUpjhBwKtPfoFlesQ8k+o4hzvSoVQ/wJxPnoWxwnEjRZUrS
	 RCEwhKIpH3mZRttfAQ5yo5QqNgXB8tUxaSjC8+QVMegCJYWQc2eS/TeOUidXLBjl47
	 FCFiPa0mpjx384jsAdFuAd1/5FMNOzyBSTY5G/pDqisvctPvyUYO9M7Z+zK93tK4Dt
	 DpmKgJhPA1oEA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx1tj-0000000FDFJ-1VAX;
	Mon, 02 Mar 2026 11:57:15 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 11/11] arm64: Remove FTR_VISIBLE_IF_IS_ENABLED()
Date: Mon,  2 Mar 2026 11:56:52 +0000
Message-ID: <20260302115653.1517326-12-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302115653.1517326-1-maz@kernel.org>
References: <20260302115653.1517326-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Now that FTR_VISIBLE_IF_IS_ENABLED() is completely unused, remove it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/cpufeature.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index e853a0ac7db38..d8accc9c94fab 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -62,8 +62,6 @@ enum ftr_visibility {
 #define FTR_CONFIG(c, e, d)				\
 	(IS_ENABLED(c) ? FTR_ ## e : FTR_ ## d)
 
-#define FTR_VISIBLE_IF_IS_ENABLED(c)	FTR_CONFIG(c, VISIBLE, HIDDEN)
-
 struct arm64_ftr_bits {
 	bool		sign;	/* Value is signed ? */
 	enum ftr_visibility visibility:8;
-- 
2.47.3


