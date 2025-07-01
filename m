Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8E6C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 22:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xy5wn2mavZvmU8zNmHJvXJjwqv3xn9snutHnDM7E5sE=; b=M6vddISgtBu/geYCn8IagmM+to
	3DodVx4GfKR2HLKWBPFsRKs8vv/AN5bwS5e2PXewzA9gVHk8UIN5qmbUDzXmMU/xo492C7JbzKFnM
	dno/Ehvot2gKdW8nNJ1RFyjZDoBDonaRWA8GGRA4pBzcQK/D74hPdJ0w0aLIoVW6T5EmWT54R8+ff
	tq3q5Hn+KjWIih2QCnw5jtShJCaELeyjOTMaE4XM8jMtteWJFXYXh6wHjJTbqKDrFBXki+74cfvSw
	RmDklVyGo+AbRfkhh2Y+LwkVma9Z/R+yNTYT+EmQnzJFUjbs0Pmr8RuPRLCRC06Wm8BGawAHY/4MN
	hms1ZI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjH6-00000006leG-2jBb;
	Tue, 01 Jul 2025 22:16:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWj7o-00000006k1g-2T3C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 22:06:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6E83468A7;
	Tue,  1 Jul 2025 22:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C2A3C4CEF1;
	Tue,  1 Jul 2025 22:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751407607;
	bh=Hy1s1+7DoBD3FHcZVBMxtjRrk13K4R0eTQWvOyyFT0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UEShh4f7Yd6TXm/z3mtUsRgFdiLxNCQESiIRdkKNSU9aojoVlGwKkLSlSVhhkkR6D
	 qI/oma+AaYDzEvc1iSQmfuTO8pJ9OOhCyR2CdXC3IBtfUn88AhyufuzhlPqBYXks/f
	 Jn/B9hrxCmzLsT8rQLuRxW+nkeHw+hFEO9R2tE61zgqluRAuCPv4pX/SyZG/DsjY4m
	 3dpWbNCB6M8X5zucdjrHYUBPayGYPx3GsIKK5ctxUVUo4mlcdkGVRlKLRkUJAQGAX6
	 4g80jPXt4OwKVH1rHHQM75Y01NGjYjvNKISgVnU1O2hNPKsIB6klHpQC4odeKyXrnk
	 4Jzx9GVgQBCjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AD5C83038;
	Tue,  1 Jul 2025 22:06:47 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Tue, 01 Jul 2025 22:06:36 +0000
Subject: [PATCH v7 3/5] KVM: arm64: Mark FFA_NOTIFICATION_* calls as
 unsupported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-virtio-msg-ffa-v7-3-995afc3d385e@google.com>
References: <20250701-virtio-msg-ffa-v7-0-995afc3d385e@google.com>
In-Reply-To: <20250701-virtio-msg-ffa-v7-0-995afc3d385e@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751407606; l=1008;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=r9z6my3JAUeiJyyoAaVHQBDOJAVkijitymt3p9hEt6g=;
 b=GhtpikNRmTzy093EmL+2jycBtO99E2KOmwD5uhU5MgIsakYL1LIJrYOh35MHfpMxGs4qbniZ+
 iVGc03BtiMoDmu0KjAYsVfKexjQTzOHor1q82VSfde2DuEpyULX5jYT
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_150648_679749_9C8BA65C 
X-CRM114-Status: UNSURE (   8.45  )
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
index 65d241ba32403d014b43cc4ef4d5bf9693813809..5fd6474d96ae4b90d99796ee81bb36373219afc4 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -670,6 +670,14 @@ static bool ffa_call_supported(u64 func_id)
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
2.50.0.727.gbf7dc18ff4-goog



