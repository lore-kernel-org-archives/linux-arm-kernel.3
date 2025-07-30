Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D25EC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 21:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QLdaaK5B14oyHOCUaC0YummXXoh3gUHtd5FWQxXuOk=; b=gan74g1dDRMfB3H5iUAOaYiHYW
	rzYgFUYoMmitccMHSIPSozhCgMOw80w3olZ3r4xPw0fD+vwBmKFfBcF9j0J04hbTr8ttM/WpSGGsN
	9BO1G47qJ8dskRQpfzh94aj7ojOR820OPJSCJq/G0bY/38ck6FjvJdzrqjqcQKcu/kqAe+0CFs3YP
	LZU1vbKPrQupHauOdLchcCKTHxJsVrxyN+c54fddI71e4rUfi+QuBBXSJLvDWuvnxGWSecPrg+kC8
	/TFUU3JZy2iyJVRMGUk2jskJXU++LPIVOV8jZV4RxlxhZoTCUVE+uyWur7jh2oVSLahbRmFBZNJuC
	8CPnFYqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhEME-00000002U71-0ijQ;
	Wed, 30 Jul 2025 21:29:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhE8r-00000002Sqs-3usT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 21:15:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F3705C6208;
	Wed, 30 Jul 2025 21:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDF5BC4CEF9;
	Wed, 30 Jul 2025 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753910117;
	bh=nR3zHOT/qM6CUnGwkzXLNAPxSF2YXcCdkZcpI7GttFI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a7HNXXSwQvg3xjqGM8Gso4ihQpmqL0CcqQs1zrq1eaORXpiZXRJImvKcY5bNc8FEZ
	 9tf6owXYALXBMsFEPlNdbcXLkouZbvt6vEOtBo7VolwjhodtDf+G/V6aA60yEb+uKF
	 G1NL9WdkUSj9AVgMy8NN93g2AluCQCtNkUTKXqneIQfddq2KuQlb1/VnQ68S5LtQtg
	 FIGyAGZo9OzH1AAvFubwJtkymPSNwL7IetgcYWam/mPrJJfxej2Cgu71+NcP/chGqg
	 XdKf81lR8Bu6vvrAUm7bg2BSMFMOlW49Tj9q25BG734Fjwki8DBnPMOBHLy8uHPbi6
	 tkIKN/4RSZgWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E412AC87FD3;
	Wed, 30 Jul 2025 21:15:16 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Wed, 30 Jul 2025 21:15:06 +0000
Subject: [PATCH v9 3/6] KVM: arm64: Mark FFA_NOTIFICATION_* calls as
 unsupported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-virtio-msg-ffa-v9-3-7f1b55c8d149@google.com>
References: <20250730-virtio-msg-ffa-v9-0-7f1b55c8d149@google.com>
In-Reply-To: <20250730-virtio-msg-ffa-v9-0-7f1b55c8d149@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, ahomescu@google.com, armellel@google.com, 
 arve@android.com, ayrton@google.com, qperret@google.com, 
 sebastianene@google.com, qwandor@google.com, 
 Per Larsen <perlarsen@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753910116; l=1008;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=dUX2vyR3ZYQTFCHxhGWOxmpso/rDJ5XMeBkqofPaNOY=;
 b=9/jRFuS4Y3XNatuiRkzXiXqpRC+uPigr09Vqyv18VORTYqnGJQpijGtTKZuhxX7hDvnOHoECE
 /x4THJF+hHTC7QrEN1MAs/d37ORpJ45CP15iBecf4sUh0q2q5GWTjgb
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_141518_058398_95D19687 
X-CRM114-Status: UNSURE (   8.24  )
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
index e66149d40c967c14742087d9b45970435d3f2c75..48183fa78014e420372c4fb5e489519bc652bf53 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -666,6 +666,14 @@ static bool ffa_call_supported(u64 func_id)
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
2.50.1.552.g942d659e1b-goog



