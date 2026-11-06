Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F574606D81E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qvM9hg01;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ipnaVFMC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tsd9j7DQmVwsk7vQj7YFqkd+QENwFYwyAFiOo9ajOok=; b=qvM9hg01hP5sq9
	fXnuegCnyy1WoCphzEdO2rdAe/z5dBia1SZbXfxXIdD8O71elWsXMd0BvGBP0L82T5FaJ2mNkM1RZ
	YzU5cvd9wkz8MFvAqJvteHbr1b/5pwl+Mzqdu6IwwKF4Sn/zDkPd6rfSWNIGRc75LiQStLl6QLFRp
	87cz7n9IrSAfRhxtgtJfBSjMWKM0ygki97SkoBWbMeHD9mFWpyJAa1Aeyvdyxwu8da9NiAMao2P69
	jW04k3ifuLLMdVSfYds5B7yeKVJjx5bXEwY/CD0GWNrDtipXZR3LDObLd3C63sO/IA3oyQIu+pBCv
	hRlkuzGsIDFDQ1b+NGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIeZ-0000000CFQx-0UmQ;
	Fri, 06 Nov 2026 12:02:43 +0000
Received: from out-15.mta0.migadu.com ([2001:41d0:1004:224b::f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIeV-0000000CFNP-0ddm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 12:02:40 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=sqSqTyRpszyGBYB7Puxj95eSOJmKiJOqpyoy1g3EpU4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793966557; v=1; x=1794571357;
 b=ipnaVFMChFK/kP0xFApf1PWsAKEE7nb4SvQT99mJIZEPPVoEuYjZEieb52tWCsT49enW0aAG
 N+TSEvwQpKrOYxIhrsM9g01AMQQIGYTmyMjdtMnkAfwSGaQLt8AEqxy5JXTVRfBC3KQDTnnyfLm
 6wD2GBYLo2+k3ukrHoTjyR0I=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ff037b2ff7a2ece4;
	Fri, 06 Nov 2026 12:02:37 +0000
X-Mizu-Trace-ID: ff037b2ff7a2ece4
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	lpieralisi@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	tabba@google.com
Subject: [PATCH 3/3] irqchip/gic-v3-its: Clean a non-shareable vPE table to PoC
Date: Fri,  6 Nov 2026 12:02:21 +0000
Message-ID: <20261106120221.347309-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106120221.347309-1-fuad.tabba@linux.dev>
References: <20261106120221.347309-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_040239_327674_9AE93C4C 
X-CRM114-Status: GOOD (  10.36  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On a GICv4.1 redistributor that doesn't support shareability,
allocate_vpe_l1_table() points GICR_VPROPBASER at a freshly zeroed
vPE table with Z and Valid set, but leaves the zeroes in the CPU's
cache. The redistributor reads the table from memory, where it may
not be zero, and the spec makes that UNPREDICTABLE (GICR_VPROPBASER.Z,
IHI 0069H.b 12.11).

Clean the table to PoC when the redistributor is non-shareable, as the
driver does for its other tables.

Fixes: 846297e11e8ae ("irqchip/gic-v3-its: Handle non-coherent GICv4 redistributors")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index badc3843d90ca..5b3273e0dfc79 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3012,6 +3012,8 @@ static int allocate_vpe_l1_table(void)
 	if (rdists_support_shareable()) {
 		val |= GICR_VPROPBASER_RaWb;
 		val |= GICR_VPROPBASER_InnerShareable;
+	} else {
+		gic_flush_dcache_to_poc(page_address(page), np * PAGE_SIZE);
 	}
 	val |= GICR_VPROPBASER_4_1_Z;
 	val |= GICR_VPROPBASER_4_1_VALID;
-- 
2.47.3


