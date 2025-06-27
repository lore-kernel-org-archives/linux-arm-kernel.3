Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E38C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xy5wn2mavZvmU8zNmHJvXJjwqv3xn9snutHnDM7E5sE=; b=HYnm5rVWWFbu3RvmF/IGFxlC/1
	sc8PohR259Oyl0ilwP4CcEl47L6XyDvYEgdQS1VzhIjj7WUCsTlmop0AFtV2HujwKXnvtMkpblLKG
	AXWOF/U0lZKjxLFNotK4xjyr/yoQoo705lHaI/LtYE3vvXPbOdtA7z52j8APGJx4hfHsbQytvjXfU
	gOgql2h+SILcjBeuClzGuHyW1IPn2VYQ6KdYPlBZzDN68gxpdrroaZpxUSLWejSfYAu4uaz66VIXi
	QfbzpT9NgvRn/OJeGUYfoK1FzbB5sj+7mcg6BafXTHSTNg9UEV0ttgkjWJlryCWg9vzEdV4kc/xsC
	6wT9rgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3Qg-0000000DooS-0Ejf;
	Fri, 27 Jun 2025 07:23:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3Gf-0000000DnhI-3hm4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 07:13:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03FCF4625F;
	Fri, 27 Jun 2025 07:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7D0CC4CEF0;
	Fri, 27 Jun 2025 07:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751008380;
	bh=Hy1s1+7DoBD3FHcZVBMxtjRrk13K4R0eTQWvOyyFT0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aJuiG4YMBOnUYy6Bf7lJDa7qxDSRvmdgAKOn4B7iplx2Fy+oduR2dEnRtg+qJUpxi
	 kaVMIC+9HFzEzfylCWBrOTqHyp5TIbPCQQ8oE9GU+TYpiQSNMS6GyUsiPYOfQDYjbQ
	 epjXvfmu/m+6gxl090tMsN9F501nGuh0V0bN2y7Pqf3BqiaPZMvGLLH4FfwWIN8tJ4
	 oH0G0lARu2ynDmTwMWyo+07hPqfMFUkKvIv9l2dlSE8T0hL4+XVn3zjFfHpew6NOre
	 yRAusC8f76bYf2s1No8jrwfQm4s31u6sSnPumP2rdLWGsZtLRYum9YqBf1F4X6rYhm
	 bz3EEldMOyzNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC77BC7EE3A;
	Fri, 27 Jun 2025 07:13:00 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Fri, 27 Jun 2025 07:12:27 +0000
Subject: [PATCH v6 3/5] KVM: arm64: Mark FFA_NOTIFICATION_* calls as
 unsupported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-virtio-msg-ffa-v6-3-8c02fd94edac@google.com>
References: <20250627-virtio-msg-ffa-v6-0-8c02fd94edac@google.com>
In-Reply-To: <20250627-virtio-msg-ffa-v6-0-8c02fd94edac@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751008380; l=1008;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=r9z6my3JAUeiJyyoAaVHQBDOJAVkijitymt3p9hEt6g=;
 b=kSubU6hZxrun/Kj2M/soW1+JuFCU4uyHFxW4AbQLs9mrWTMeJ9SV9po1gQ77fETVLFj6YN6+5
 gNhinik24APBQkzgpGRWnGeITmQ8tPmxwcO08HGPkgg3laRlxti4t9g
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_001301_952081_6BC1957A 
X-CRM114-Status: UNSURE (   7.99  )
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



