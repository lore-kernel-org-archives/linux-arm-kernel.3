Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F336DC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 21:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aK7J6AcpGztaA9Nq9FXa09dUqj/F3kduzaNhASPndOY=; b=pr1axPdJTq2Qtfx7OT+X6DE6RW
	desgh0jYJ2w9LZFUByi7Xzy4QmYyXmyNG1FEqJ6M3pOd0cradd13K5D4l+j86hL8Jdq6LzeeakMlc
	EA47hzERBRaaumb/0mEuv1kSfuHw726/rUvenFbH26nN1OxmSO5Bmv8OuBr4R+PLR0+uIHWcefLwW
	MPF/Xnp1K9L3E974wm6B787ijDK/Fkw58nDbFRGJfaPUl2ZKrJYDHT10NAGufI7hi4HHIuet+VNOU
	du4G8xAlqnw8VfwBmujv67Ql7oDDayTh95YkL4P80rinsADXyOIAj7UoHAP+ndbg+qUBVWOeHdXSP
	SO4iHzMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhEHL-00000002Tmj-2NO8;
	Wed, 30 Jul 2025 21:24:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhE8r-00000002Sqp-2oYN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 21:15:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09CC145BF7;
	Wed, 30 Jul 2025 21:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6E45C4CEEB;
	Wed, 30 Jul 2025 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753910116;
	bh=p7eZsxpS3vtI9tDNOoEZiy9hk5CJI4f8gTmOSqmh174=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YmTqUVtxYpaNhdbkPogckhsBnYFGwmR0Vtdaf//I6za5TKQ0VnghxjOVegG/jG2Ny
	 zsRQNR3aRGs4zFphKpbQlySpGdfweQZ+0EbP6RJuy0e/hITMX6Pir8Y3gpAdkbyB+g
	 rxo6xRfN0h47InrLEAReQI2Kr9fTPUh25Zzbzv+w7o7V0CE22LxZhfxLdvD4DH6JcR
	 0XschW/Zj3zQ/i3tpLe2bc4ZyHWHQgj5BhC07F/Qn2nF7+Tu7eaXE97yTsw+DUe6kT
	 f7SaYYtkDnVoQ3B9sXXxTl42t3bO8TC6wqeZdVuP5IBwZ8OR9wJV4w+HWYmG15Kwoq
	 fEun/NOLKGOdA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F76C87FCC;
	Wed, 30 Jul 2025 21:15:16 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Wed, 30 Jul 2025 21:15:04 +0000
Subject: [PATCH v9 1/6] KVM: arm64: Correct return value on host version
 downgrade attempt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-virtio-msg-ffa-v9-1-7f1b55c8d149@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753910116; l=1399;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=P+lmb3sotGE8m34PBEfN/prSolKXtIpxrlMSQIy5CgE=;
 b=VKzFYOmcY0g8SQT9dFrjRsgwYo/TQGIlpS1AMrLT5Fz0mUdsn2nlcFi9n9U8XRR0V/4CPVnn1
 9X2bF0wPHL4BHihowB+PK5QTAl3dw8KfYS5jViTtx1u6yIQGIVfJnUP
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_141517_759913_CCFC190F 
X-CRM114-Status: GOOD (  13.93  )
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

Once the hypervisor negotiates the FF-A version with the host, it should
remain locked-in. However, it is possible to load FF-A as a module first
supporting version 1.1 and then 1.0.

Without this patch, the FF-A 1.0 driver will use 1.0 data structures to
make calls which the hypervisor will incorrectly interpret as 1.1 data
structures. With this patch, negotiation will fail.

This patch does not change existing functionality in the case where a
FF-A 1.2 driver is loaded after a 1.1 driver; the 1.2 driver will need
to use 1.1 in order to proceed.

Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Per Larsen <perlarsen@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 3369dd0c4009f84ad3cf9481c747bdc57a162370..2c199d40811efb5bfae199c4a67d8ae3d9307357 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -712,7 +712,10 @@ static void do_ffa_version(struct arm_smccc_res *res,
 
 	hyp_spin_lock(&version_lock);
 	if (has_version_negotiated) {
-		res->a0 = hyp_ffa_version;
+		if (FFA_MINOR_VERSION(ffa_req_version) < FFA_MINOR_VERSION(hyp_ffa_version))
+			res->a0 = FFA_RET_NOT_SUPPORTED;
+		else
+			res->a0 = hyp_ffa_version;
 		goto unlock;
 	}
 

-- 
2.50.1.552.g942d659e1b-goog



