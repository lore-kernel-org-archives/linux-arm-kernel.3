Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C49C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 02:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qhxkRUKCXYL/6OjNKW4QxXGZhlrgYaduMTj0vLFlD8=; b=v9YA2einvCQNsAQHuUi9xEGf++
	Apo45YVDyGOK8FWzHv9h7gYG1Qrxozzn6wyGXkWznuBeoZy2m71iBC747fEdmzOJU7oYwTO8GGcX4
	wI5nBBvGT2x9CgP/8yfsCZfYi2ImpqwLjLw6LgvQYrvVvAW24FWWK5brOqYLGtu451cM3KAbB4B6D
	Q9un02yFVKTd5ZffK/6ZF18aqH2+UaD91rMwRdm9Q/QncL3lPNx9zoI9/Gpg4Z3vGYVP6yY3wVAHD
	LOrDussLp4yrLZluRgAMtReo8cL152XiX+lOi5ZhqIvoPVjhFfnOxeXWJ+5/Ubw9ZgVEqn/Zv1HMg
	pH/P6eeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucx5m-0000000DjeN-0Omv;
	Sat, 19 Jul 2025 02:14:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucx3L-0000000DjJT-1YZd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 02:11:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5ADF260205;
	Sat, 19 Jul 2025 02:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB13FC4CEF6;
	Sat, 19 Jul 2025 02:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752891113;
	bh=z9zKqXOSztmepElhFfcFd2r9dFNNAVlWOFmeg8346cA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FfDonPwyTC2Vyi3OA/+yHSTNM5VcNAmFnRbfzYriv8wyrt/BTZgzYSzuveG6qgiXK
	 JWQbc4FWknlEvm1+Qif9urxFj1yf8JX8pWUb4WHwmEpmHLZgHWhsGdyCNlcIJNyvcl
	 ZyAAF8eBc9W/FQvQinThwYu6IpBxzKHDSa20oXh2NDF7Udm9nvScEnEhEXkESKH/hg
	 +O40X+G7qj6byZBmsOL6R28TtPJ4c9cp1Vi1oZLxlZ5DxJi9nAME3RruzI3NEjqxUN
	 q6cpJIEduMKEjq3tsN/qOm7y8cNMQd4IFMzXdKIpqXBi8ClF7bg777VGGrLr3syTHE
	 tG6cLODrRRFKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B086AC83F17;
	Sat, 19 Jul 2025 02:11:53 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Sat, 19 Jul 2025 02:11:25 +0000
Subject: [PATCH v8 3/7] KVM: arm64: Mark FFA_NOTIFICATION_* calls as
 unsupported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-virtio-msg-ffa-v8-3-03e8e8dbe856@google.com>
References: <20250719-virtio-msg-ffa-v8-0-03e8e8dbe856@google.com>
In-Reply-To: <20250719-virtio-msg-ffa-v8-0-03e8e8dbe856@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752891112; l=1008;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=eQvexLnYoTcxsrnl0Pu9EhkGFuUrJCQc4aSj6eFtezc=;
 b=ApBsC/BlD81Hz0BWfbZYdBl0BwB/z9CBGvXFont7uPFbpjiEcaQFLI26mF0x2FqaERmhWlMst
 2ouZvB9XsInANbSCy3Islp4cVzYEtein+r3ifjM3lFZ9DUUuhiBshV3
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
index 52ac3e2689f0c200ebbb57ec564f71a37b0ddc8f..50ec52bcce4b4443c2f3ffeda455594733f3a5a0 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -663,6 +663,14 @@ static bool ffa_call_supported(u64 func_id)
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



