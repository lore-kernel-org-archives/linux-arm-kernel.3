Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88418CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 01:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oI8Pa37auHHXRCkWIrUgf4WLzCZU7IXJu5Qi9IoxqxU=; b=DWQKq5WJ5TGoPfTYPweTueZYxk
	F6Ke590TY1tajN6XPDoy2+FM7iBNMy9JgDQPgJMHySxpid13vOVBqTSSWjFskkDGKDa8/iR5sdEdj
	QSiVd1siVzREmz5ZjRR4M5BzAxhsIPZ3mS6tzphEFCbSxA880WMHtZtThun1LxO4Z52xv0Mm5BI2+
	EmP5iKhqhLBwBxwLxDUcRPoMk866m9pw7AF6KtGFC2wGpvNQmSc+2dbyiJlNHx4/JGEaw9v6pTjV2
	Jo9wPXvU5VvxcpLb5mumN/yEYU2GPSdhf9MzdwyDRFg/+AOqC67pv1cZC1c7a2yzzeZv+fxx0k1si
	8PEN/b2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXdc-0000000C5V7-1p28;
	Wed, 20 Aug 2025 01:29:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXLf-0000000C39t-3dCq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 01:10:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D32561430;
	Wed, 20 Aug 2025 01:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74CCCC19421;
	Wed, 20 Aug 2025 01:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755652212;
	bh=tOLJC4XmErVOk1Sghyu21V/WaFzS/sTkdBmrgl3W6yo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W10m9GeiBephdiYEc/sT08pqz2c8zw1eaF/xmzWAhyzdmrgeQRkAcc+jcYIRbdnEq
	 /qN2oMr2e31JSJ4YPPHS71fj0k7d7hGZcWvBYpNy1z55PFabtbO8LkBYuxRtBCTcWO
	 RW9HKgaud+FWXrWCPsuX+bsa8jMvivtVSva/qkan5UXjHPKhQ8kSi+Ir8pdL/0O60O
	 kzCe1NhMIjvTfdz9wk9QS84NlFFsBTUzitCNhByWizXZuEd8pnlUxmhREUXmDQfUGQ
	 PdjcPDqxYMVRVTTZ/aCnKMP7fM7HY8bU8OB7xfLdvkDBM/WCSLT3RkQRKa4NNoHPQb
	 X6hO7wC/Wx/BA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67600CA0EE6;
	Wed, 20 Aug 2025 01:10:12 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Wed, 20 Aug 2025 01:10:07 +0000
Subject: [PATCH v11 3/6] KVM: arm64: Mark FFA_NOTIFICATION_* calls as
 unsupported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-virtio-msg-ffa-v11-3-497ef43550a3@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755652211; l=1012;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=+NnU5kbTyzDsIIrdmhBCiy1drOF1PzOEKH5ncvoLdR0=;
 b=lN3fWnDz8MMhIOGVf5N0OsE4YlgyP2zM3y+yQNZk0pus91GZeGMXsH8yoy3Iklu6aIPMj4rm1
 bgaMrfDrNVLCktM0Ff1IcsgQPl+HUwMvwA4zQOD9qE1xCItiCnAxJLH
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
index 8290396384a2a3294fd64bc0378459829941a64c..40a785b6ed063f9de31f51f1e82ebd9c70b13de9 100644
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
2.51.0.rc1.167.g924127e9c0-goog



