Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7668EC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 21:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLhuX3WqHGqDPHnjMwfKMrQmjQHl9qZ27YSOQebjgFs=; b=DFLrYtSiYKeerBtpTs73TtBAyU
	H9JVnM5c4bAasI7wGFrgVQlSdEyOY1PJNqO1b4QXTspo38d/hhPK4ooFz4D5t5hEdxO7xhory0G+D
	bpqMwR1+ZSmrw6cxpJwJ+F5SNxPUOWgoFkZvuS1TlXtksBg6sMMe7VD+QjX0QpS2X0WsMM1BqQeG1
	J3emDq6SFB/ej4/n1K0blGjkxhG8O+nshhZ3V6WGcoqRrLz2TjgUKsRc8xPGgAw74mE8ff+4BglcG
	qzGXWgTfMslvzWBEYJR72gMUobq7G1vg0KUYVwv2p9i7c93drlzopW2TPSVzwpUEgRbgz/QMM8soe
	QRbs1a2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhEEt-00000002TYY-1vJR;
	Wed, 30 Jul 2025 21:21:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhE8s-00000002SrS-2JgT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 21:15:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE4EB601E1;
	Wed, 30 Jul 2025 21:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 140DAC4AF09;
	Wed, 30 Jul 2025 21:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753910117;
	bh=hh98tLlJXCvRgiyG81K7JCiTYqxoYUgJDKnikV3MUPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JiU80DVrnhKarGT98QOx797L8u1EqeYqSj2HwYDQVy/a7rTmONWpYjAQNCb49j8zD
	 zk4I3hdwRZ6AX5JpqJgG9D0rklk1/sDoI6cu9+Y0rMOuWGPBBB2HqIayoUJDFTRVSP
	 qNIYiF2pAe2eI3TdjVYTtvfPaTbnA7deQZVDp32WbBJkLNUAbCPqQwFlcCaKNIfHJV
	 8DzqazuGUg8kXF+dPvGs0udZPzcFwCEk7HE6jvYMOotgPqj+a1ORBznoE6klT7AUOY
	 uY0p/OTDZqtVb475fl4I42quUbhBBFmbMFwHhNhvU6SWxmoGp5IXV6kx3vfCxPHBwx
	 paopgyEyLemOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06924C87FD2;
	Wed, 30 Jul 2025 21:15:17 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Wed, 30 Jul 2025 21:15:07 +0000
Subject: [PATCH v9 4/6] KVM: arm64: Mark optional FF-A 1.2 interfaces as
 unsupported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-virtio-msg-ffa-v9-4-7f1b55c8d149@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753910116; l=1210;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=vsxUjiUKITemxut7aihGZIJXjAQ850iOOIHve4ASG3E=;
 b=gKWwH6ozG59iqR56sr71aowlsg5jb48PB7dhsPM3n2+nBl+wpjlo4dJv8qRVxTZz7bvHNPEDt
 uDKRggaQq+mD4c4yB9+43JIcp2dm573jv1UsAVQbkMgyDHO60vkhUyg
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

Mark FF-A 1.2 interfaces as unsupported lest they get proxied. Also mark
FFA_EL3_INTR_HANDLE as unsupported as it is only valid for physical
instances.

Signed-off-by: Per Larsen <perlarsen@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 48183fa78014e420372c4fb5e489519bc652bf53..7fe96fe626d630a9009551e8dec1683617acafbd 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -674,6 +674,13 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
+	/* Optional interfaces added in FF-A 1.2 */
+	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
+	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
+	case FFA_CONSOLE_LOG:			/* Optional per 13.1: not in Table 13.1 */
+	case FFA_PARTITION_INFO_GET_REGS:	/* Optional for virtual instances per 13.1 */
+	/* Unsupported interfaces added in FF-A 1.2 */
+	case FFA_EL3_INTR_HANDLE:		/* Only valid for secure physical instances */
 		return false;
 	}
 

-- 
2.50.1.552.g942d659e1b-goog



