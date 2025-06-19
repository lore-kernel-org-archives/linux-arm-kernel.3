Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ABDC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHE8BJ9pjNFsAIvgYL36RDOveJ/ZdYbW9+U1u7hihgo=; b=H8GWTQCUpj07+c9oBHL4xVixgK
	MXwMpiod7bmOnf6gPAMxRfl40vNwxk8vBALGQ1Z7HBpeslE7zLypxbiF00U73Lv5HtRyprQKOzTho
	qdxqkSGKcRQIUqQMY17yOPwTpPPRgVQ19Sl3nRSRABq5V634Azc7xOSw9NUyPxYfYo3BxUSk/qlNO
	SpTQDpoeZRcEBvDIG3wz6QvXHgRh+5dS1N0ctQnocKYc1tZjg74xW9dmPhUX1IY9dVbOYfgEswSQm
	TBWZuQpE0hlYQcfLuMCWzBT6i2wuWFeQp6yz0q9MKIJVtqv0pJH/OxadKj9gjZAVDZkNk5e6F75kM
	KNpWkhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDjP-0000000CwBs-1UBI;
	Thu, 19 Jun 2025 11:46:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBBB-0000000CY0G-2Mls
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 09:03:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BFDF662A34;
	Thu, 19 Jun 2025 09:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AE19C4CEF0;
	Thu, 19 Jun 2025 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750323808;
	bh=TQleIpVqxX9w9y+oNAtop5bLIFbXUlUOvBs+KyP0ZR8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o7L8NF9NOcsympMD72nGSsnIOax9GF/SqHr4lHLcDv6e+/q3kXvV/jAQdq2QJcYuS
	 G/TocW/Ge14Hkzo0GKxK+MUXEagYH71pSQnmNXPkMdKN6BoWYmR7br/NPVnyDEcVxv
	 YwUBCfqSfYoGXBy7wsKavCtrVO9ulVgotcsa1AK8TY3djtW8kk/m0vw+3I9g1uhr3F
	 ZkLlcpqpCjs8VbeRP/q6k1Ue7pe2kIpSsFi81Z20qe+1lFxxnp5kc0IAyf3kj3D6MM
	 wUc27fqxsETtuHHwBzKWSYQ4kuvTh44yFOJfILWhDqh8zdrirCq2uR0TIAl5M7iccV
	 eX67FLeGyIDog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414A9C7115A;
	Thu, 19 Jun 2025 09:03:28 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Thu, 19 Jun 2025 09:02:57 +0000
Subject: [PATCH v5 4/6] KVM: arm64: Mark FFA_NOTIFICATION_* calls as
 unsupported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-virtio-msg-ffa-v5-4-412c98558807@google.com>
References: <20250619-virtio-msg-ffa-v5-0-412c98558807@google.com>
In-Reply-To: <20250619-virtio-msg-ffa-v5-0-412c98558807@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Per Larsen <perlarsen@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750323807; l=1012;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=Qis+O0P+EgX/jX8E8VR0D/SyhX2jCqrXBKwBh6kK8LA=;
 b=owTK3dNtjpqdVYFwLQpJgygVZi0v1UFmK/ckwYhyoMUDJT3aHG0J9frH7mg1/ZBvkhych1K8x
 I8eWPG0jIqrCiQGY9atRRA7H998+kDveRDiZd7m9NaPUXVb0z549ydB
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

Prevent FFA_NOTIFICATION_* interfaces from being passed through to TZ.

Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Per Larsen <perlarsen@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 23b75b9f0bcc62724f0d0d185ac2ed2526375da4..6965aa947fb4529c35872ee3976ab8d0b02becca 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -669,6 +669,14 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
+       /* Optional notification interfaces added in FF-A 1.1 */
+	case FFA_NOTIFICATION_BITMAP_CREATE:
+	case FFA_NOTIFICATION_BITMAP_DESTROY:
+	case FFA_NOTIFICATION_BIND:
+	case FFA_NOTIFICATION_UNBIND:
+	case FFA_NOTIFICATION_SET:
+	case FFA_NOTIFICATION_GET:
+	case FFA_NOTIFICATION_INFO_GET:
 		return false;
 	}
 

-- 
2.50.0.rc2.701.gf1e915cc24-goog



