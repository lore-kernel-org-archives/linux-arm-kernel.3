Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BFCCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 01:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcF4PwLP5VcpRmEhZSAoOgcUTDgtlD4T7Ps8OecF1SE=; b=baEqdql52j6+mgRY0QkQiYZhzq
	nAK0BSfgbLlkSSufdn9fPoEkTZUBaNSwMzJzZcwZrYE3pu75ZM34hnObKcslTnDRAXJYaPodoP8+I
	/SDFQmybdhJzKNo0YicsNn7lTRObMhKlbnxo8Ltus9NK8aA23/PtvBOB4ilCz2yV5prpy4hu5AECU
	ObHaLTS3TnzsdPXufriGV10mJGNEwU4/h6/MCMPnPo43+XmqsT6EyIfqS1mc828fYDVrvbsmHdzDG
	CCw7U4EaKcPaCaJWwXRTmYzfBdZWubuAq6S+EXSvJngcMTvB8LvMGq7LxN3Pg3OD3RSZmv1VDTssz
	vAypMx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXVl-0000000C4hC-0CKQ;
	Wed, 20 Aug 2025 01:21:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXLJ-0000000C32Z-36Z9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 01:10:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1718F61429;
	Wed, 20 Aug 2025 01:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5769BC113D0;
	Wed, 20 Aug 2025 01:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755652212;
	bh=Lqqq7AHyYOhfOqe+nhs+g+PzDgeG3Hp9HuWcnnqQIrM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CItM7Ul765E1Xp/k9mRT7Ksn/+E4FHx+QYzinYL4ACrVWs5Rl7a3dbh70tVuGhG4s
	 Z6eaJ7xcxwXqzKjHvoUMv7dJ0aK1DyRvZ18Gkp42jQa0SuvsYx8dNR/AO7ZDwvt6fo
	 4h3IsOxwMndLGxjgUZYEdxlHS6l09F6I/4+92tcGeNJez9RFI08Btaw/hgL/6RX6DF
	 swOs3UvNQR1sHEaSOe0DXdHe/aAyW8pQifcZMOkO/B8XBOuEDtv8BL1up6q3cgdKaU
	 CsBq3wwIEpevbvsokE5XLsVKyazP1XAvWllWb0kUOBVBWsj+taF42hQqbf2g9rER+M
	 sR6c+uNSw/ITA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CD8CA0EEB;
	Wed, 20 Aug 2025 01:10:12 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Wed, 20 Aug 2025 01:10:05 +0000
Subject: [PATCH v11 1/6] KVM: arm64: Correct return value on host version
 downgrade attempt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-virtio-msg-ffa-v11-1-497ef43550a3@google.com>
References: <20250820-virtio-msg-ffa-v11-0-497ef43550a3@google.com>
In-Reply-To: <20250820-virtio-msg-ffa-v11-0-497ef43550a3@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755652211; l=1403;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=icYN+w/jF5WdVJR00f3pzlkimt49rPtFfXuyjLMlXDQ=;
 b=1EPqnBTa/1TceSMEuVU5TKitB9kFXozlMZcxvaAA1uSkv3dL54Jzz5mGAaogyCkzDugtN0Sck
 r77haJhtvrNBaqhQxOOLoc0sLTmzfNDXryw8+/Bm99QL/04KYZhA0go
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
2.51.0.rc1.167.g924127e9c0-goog



