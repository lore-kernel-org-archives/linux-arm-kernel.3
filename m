Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF4606D812
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u9WuoDyc;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WIicy3wa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JW2nYW4eOEsIeuR3Jj207bMvgKycyIZvpAyiF56kn2U=; b=u9WuoDycCVPKazvjgzxC5bqrJ1
	RsnRUB/UYe0jiaeC0HNu7VcOm1K4oQShkAMLwdBNa92tdc779gzpeMuc451wp5vCvVy1F6eqoYAEj
	omv0V99GhT7FcQNpxWik+E8n/SFczHMksKr0pFOM0Vd2nWb0i0j8AaL7l2ORp2nfL+6Ae1rxgr64U
	I1U/h2Lrh+e+rPNND/1CvQRnKPV+pPCpgMV1JXe2Ib5LOsBfHAQUmv/rVKSRv1lZ5pulYAnOpWi67
	Do4tlyunIzznTfIbjBg8Vm/vJc4IddA4snoe6O44qkz73e7xiiLXDd2fjxVjXWCMoogcOouKO6g1g
	z7B8Zt0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIeO-0000000CFLO-3PWJ;
	Fri, 06 Nov 2026 12:02:32 +0000
Received: from out-4.mta0.migadu.com ([2001:41d0:1004:224b::4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIeL-0000000CFKl-0XUQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 12:02:30 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AXr6NWeXxU15tKhtULr0QMWsvA7Q82fZbvuPp93piN4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793966546; v=1; x=1794571346;
 b=WIicy3wag5nLiSrcs2gqFMnRyjQlIluJyg4AgcYRZz+gz6uBxEOWboGEnu6fqSVhf4KagGWD
 cCBJh4nphd1LFnLJY7yjMgmTqRjH/shFSNjROleEpwMqUu9MnaqWseXCUa2UZOTAVYZHcDErjLf
 I7VRb3kEvSPByvIDJWtMd48Y=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 78496ee2bd9dc1ab;
	Fri, 06 Nov 2026 12:02:26 +0000
X-Mizu-Trace-ID: 78496ee2bd9dc1ab
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
Subject: [PATCH 0/3] irqchip/gic-v3-its: Fix how zeroed table pages reach the GIC
Date: Fri,  6 Nov 2026 12:02:18 +0000
Message-ID: <20261106120221.347309-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_040229_364539_31026F8F 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Three fixes to how the ITS driver allocates the tables it hands to the
GIC, which turned up while I was working on the pKVM ITS series [1].

The first zeroes every page in its_alloc_pages_node() before
set_memory_decrypted() can share it with the host. Every caller
already did, except for the LPI property table, which was allocated
unzeroed and filled after the share. The second orders the zeroing, in
the same function, before the store that exposes the page to the GIC.
On a coherent table it wasn't ordered at all. The third cleans the
GICv4.1 vPE table to PoC when the redistributor is non-shareable, as
the driver already does for its other tables.

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261102130133.3684226-1-fuad.tabba@linux.dev/

Fuad Tabba (3):
  irqchip/gic-v3-its: Zero ITS pages before sharing them with the host
  irqchip/gic-v3-its: Order table zeroing before the GIC can see it
  irqchip/gic-v3-its: Clean a non-shareable vPE table to PoC

 drivers/irqchip/irq-gic-v3-its.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


