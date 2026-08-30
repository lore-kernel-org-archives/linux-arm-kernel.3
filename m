Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3E9C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 23:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngv3GVQd75m2SBaSY4Q88mqjuopFDqdeCVisxiXV4I4=; b=lxF7tIsS+48zaKhkgb5wjjBzPD
	CB91NnJ09FyDmrFkDma/loC5ny1dv8Td7kEMcR44HxPBwFUJB7LvbmUc760fa5tFGXFqrSNcrdAQo
	wLTY2tkPG3IawHKTvmNSOzvd5yQssXnt8UPxKU0O5MlXbY+7FGgnpdn2m3Ad5OVoVS2whMYa6O/r5
	9WoP17RAXasUEQjaNkldXQXa4Lk14+tupOVdaXG+4zazmgNmtx76pNMJYJa4XjxpHj/EJGssXLOL3
	xhpZwxnPL0+1l3nGkHf6SGODLADgyMb++qF8dGt4vSe7E3DAoyx8H0fziy5D+pC1vZQrPjk4dSZ2V
	+wQf11Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0odi-00000008ClC-22wF;
	Sun, 30 Aug 2026 23:08:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0odh-00000008Ckb-0fN3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 23:08:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AC2A6013A;
	Sun, 30 Aug 2026 23:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3ABDC2BCFB;
	Sun, 30 Aug 2026 23:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788131316;
	bh=jDp+Nw6b7h22SFzKZLUIEWRF8HaZpA2JP2JZBw82m2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Cl3pey6VkNICIFNuLMkHNbav3N80r945qbrQLuAUxxSgr0HgnmaCyNth4fu9MbqS1
	 d7TBxmQWJUcCGy8sI/MkNKdttmdJCIVzXDeTSgGip3sn+i1lP9LXDvVdCTGOpUGDEd
	 NMEZ/AVzA7Q3Q77n3NYfG9NemQ7rz7SSDPJS/s3tMhzP44sE5cmapcxZ5HNni9X/kC
	 GTp8w63IuXJBbLpr6f6CvLhAm01F6IJRMApdelrETswFaT5Erm/NiKoF8Xo68OIOun
	 D54NEAIhC3BOy0axKm+ad1FH8TWruOHLmUcX0oKqcqkkSFWeYeehxEAQykVp7vJWxA
	 hVdgl2sQLjU5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1762C61DD9;
	Sun, 30 Aug 2026 23:08:35 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Sun, 30 Aug 2026 23:08:13 +0000
Subject: [PATCH v7 1/3] KVM: arm64: Block host-initiated FF-A direct
 responses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-host-direct-messages-v7-1-45f6e6db72c2@google.com>
References: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com>
In-Reply-To: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Sebastien Ene <sebastianene@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Per Larsen <perlarsen@google.com>, 
 Fuad Tabba <fuad.tabba@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788131315; l=1110;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=8AHoa5902lBdwgQQj0S5IoBZHdWqjlLxCvW0VZ4P46k=;
 b=lVUR0IW9heVYxTkTzz63UFlzLz6FnS5mvT3oqFqrWvLIISaAwADTyK2fdfCHeMEb0Dcc0DLSR
 Bm6c5qGAe/fD27T3Z1wSu6KT8UK27gtIO7zVbMh/0xrLlI66QcOW48n
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
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
Reply-To: perlarsen@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Per Larsen <perlarsen@google.com>

ffa_call_supported() rejects FFA_MSG_SEND_DIRECT_RESP, but allows
FFA_FN64_MSG_SEND_DIRECT_RESP to be forwarded to firmware.

The host is never the target of an FF-A direct request and therefore
cannot initiate a direct response. Reject both calling conventions.

Suggested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Per Larsen <perlarsen@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index a327c2bbb6b6..9e8bb95e8845 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -686,8 +686,10 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MSG_SEND:
 	case FFA_MSG_POLL:
 	case FFA_MSG_WAIT:
-	/* 32-bit variants of 64-bit calls */
+	/* The host is never the target of a direct request */
 	case FFA_MSG_SEND_DIRECT_RESP:
+	case FFA_FN64_MSG_SEND_DIRECT_RESP:
+	/* 32-bit variants of 64-bit calls */
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:

-- 
2.55.0.897.gb25b4bd76c-goog



