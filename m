Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38576C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0o6Svp2dEFPV2HQXgvhB9++WTcuVnyim/shB+kYoAo=; b=O15El97W8Q4j43Ltto5njCP6x4
	0vG86lvb+ZHBUUGkG/wF64XY6RO9+G7eVWDcB6uvKe3qGXXt97R4edHIvZMDvMaNvUiOSF2XwJAiD
	5TELwsbkKWvlCqAYyQn5FrlWx6d/6Xd9DwQ5DbN/CPUG+pzY5zk5Z7jhnQCdH+5PFNH1C13hH3Gq8
	f8QF15qdD5081MLdyJ7cua3CtzNUGQ/qOcdg6CD8KplrjTs3y7g6BE+FRcCSQ/MQOCnmP9yimfrjG
	sZOrynxYs1QS65kW0i7douWipzacBiRPnvzMYi9aojCLkwjk/PHn1FOLYK9wt8aHCqrUYsAN8o8x7
	N730jyuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLH7-0000000E8aU-2PsB;
	Thu, 19 Jun 2025 19:50:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHho-0000000Dap0-3fnf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 16:01:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3A591D6F;
	Thu, 19 Jun 2025 09:01:14 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C613C3F66E;
	Thu, 19 Jun 2025 09:01:33 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 2/2] arm64: signal: Remove ISB when resetting POR_EL0
Date: Thu, 19 Jun 2025 17:00:42 +0100
Message-ID: <20250619160042.2499290-3-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250619160042.2499290-1-kevin.brodsky@arm.com>
References: <20250619160042.2499290-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_090136_954990_61158882 
X-CRM114-Status: GOOD (  16.05  )
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

POR_EL0 is set to its most permissive value before setting up the
signal frame, to ensure that uaccess succeeds regardless of the
signal stack's pkey.

We are now tolerant to spurious POE faults. This means that we do
not strictly need to issue an ISB after updating POR_EL0, even when
followed by uaccess. The question is whether a fault is likely to
happen or not if the ISB is omitted; in this case the answer seems
to be no. If the regular stack is used, then it should already be
accessible. If the alternate signal stack is used, then a special
(inaccessible) pkey may be used - the assumption is that this
situation is very uncommon.

Remove the ISB to speed up the regular path - this should not have
any functional impact regardless of the scenario.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/kernel/signal.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 417140cd399b..db3f972f8cd9 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -95,8 +95,11 @@ static void save_reset_user_access_state(struct user_access_state *ua_state)
 
 		ua_state->por_el0 = read_sysreg_s(SYS_POR_EL0);
 		write_sysreg_s(por_enable_all, SYS_POR_EL0);
-		/* Ensure that any subsequent uaccess observes the updated value */
-		isb();
+		/*
+		 * No ISB required as we can tolerate spurious Overlay faults -
+		 * the fault handler will check again based on the new value
+		 * of POR_EL0.
+		 */
 	}
 }
 
-- 
2.47.0


