Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA92C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dh9qulnswx1j1FlmkTaeTvjknLatfqQKPRfu+p9haN8=; b=GtyP2PF9Hks1kVezU+TC7oCukL
	wIbml4z+RMX0W80rDBLtzCfEek2/A8mEz6i3LD1y2It34qwJTrdRZwGz2ozflUEXJLH/YHKDq1Ho8
	Tsvhn4XGB7J6PXfR2qCLNU5mDoXp/AgjllMpWqYQJ/M67WkGramybfwEg3EiRextzH1JzAfMe7OQ/
	6z/Hy1R4m1BbLlZT9q547aXY30JygOvnj6J4W/PX8/Uf1qxDYu2kgeUhgr2N0/cifLcUnLLpE+v2u
	canWcwQPRYasG0jahhqSQ6Lxinc9rfbvULh3KK0Gm6rwxfyRbXShEQZdncMZFJM+k2me7gIRk5uR6
	bvGDO/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTYg-000000055lJ-2awB;
	Wed, 21 Jan 2026 08:27:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTYe-000000055ke-2ETW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 08:27:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 832E960007;
	Wed, 21 Jan 2026 08:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32A6EC116D0;
	Wed, 21 Jan 2026 08:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768984039;
	bh=cQzCdOlysfcwSAXig6FKFPi8qbVKzsFXGYR1TM3D2sM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lT6jnocmKaTUTUIUSaR71vM51dCqr5y0XS/hX8kz41bkQsLsbUEEamUN6t/IYdE21
	 7tE6HjKfS6mtPfbzvGOrxidWDyE+1f/ia/trWks1zd9lE699/6MOImxLvibJmjjSWa
	 a4LdNGdo6APOWAMbl7QYoe0UaADzai44BXCNLZJ8o/TP4jkUTxDFBekxFZzkC+6Qgv
	 dLcFFauRoOBso3vQdyp3hVLR2cFyt7URypTM0YTzyNAM5C5jhcfk3Gb/nfRMdJfZjd
	 nmdmHuIVqOlCur4saqMhO5N9iuRMFEsfVR880LU+WKreq/C+mzI0DMPSZSd04ovfhs
	 EKSxRLaQktw3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F37BC44502;
	Wed, 21 Jan 2026 08:27:19 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Subject: [PATCH v5 0/2] KVM: arm64: Support FF-A direct messaging
 interfaces
Date: Wed, 21 Jan 2026 08:27:11 +0000
Message-Id: <20260121-host-direct-messages-v5-0-2c1614c94e80@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOCNcGkC/43PwWrDMAwG4FcpPs9Dku042WnvMXpIbTkxrHWxg
 1kpefc5ZWOMrrDjL9D3S1dROEcu4mV3FZlrLDGdWjBPO+Hm8TSxjL5lQUAGgQY5p7JIHzO7RR6
 5lHHiIg0BehuMGQ9etNVz5hA/buzbvuU5liXly62l4jb9AhX8DVaUIHWn2NjeouvD65TS9M7PL
 h3FJlb6j0JNGQJZx0F1VsGdon4UxAfPVdUUZ7UHPWh9oO5O0d9KBwiPFL3dYvyoidBj/1tZ1/U
 TYrxToYsBAAA=
X-Change-ID: 20251029-host-direct-messages-5201d7f55abd
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Armelle Laine <armellel@google.com>, 
 Sebastien Ene <sebastianene@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Per Larsen <perlarsen@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768984038; l=2274;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=cQzCdOlysfcwSAXig6FKFPi8qbVKzsFXGYR1TM3D2sM=;
 b=tbWIPz2+0mSpsec3Xa3QoVglkBclxYCItvNgsUk21mpl9u7YjOgTnHoVxhKwd+Rz1XkEVsTsA
 3tEGoyXf7EwCFP5X0SfvcVeTrifAgIygwdr8/RQgY1zrcCx1dWrnp4i
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

Support FFA_MSG_SEND_DIRECT_REQ unconditionally.
Support FFA_MSG_SEND_DIRECT_REQ2 if hypervisor negotiated version 1.2+.

Framework messages (FF-A control plane) are filtered out. For
FFA_MSG_SEND_DIRECT_REQ, we look at flags in w2. Messages using the REQ2
interface are always partition messages.

The second patch was part of a previous patch set [0] but was dropped
since the use case was unclear. A clear use case has now appeared: use
TPM device with CRB over FF-A when kernel boots with pkvm [1].

Tested by booting Android under QEMU.

Best Regards,
Per

[0]: https://lore.kernel.org/all/20250730-virtio-msg-ffa-v9-0-7f1b55c8d149@google.com/
[1]: https://lore.kernel.org/all/20251027191729.1704744-1-yeoreum.yun@arm.com/
 

Signed-off-by: Per Larsen <perlarsen@google.com>
---
Changes in v5:
- 1/2: do_ffa_direct_msg: validate that sender is HOST_FFA_ID.
- Link to v4: https://lore.kernel.org/r/20260109-host-direct-messages-v4-0-95da4221d186@google.com

Changes in v4:
- 1/2: do_ffa_direct_msg: check that flag in w2 is zero; drop unused vm_handle parameter.
- 2/2: ffa_call_supported: simplify logic by reordering cases.
-      do_ffa_direct_msg: switch polarity of check and update comment.
- Link to v3: https://lore.kernel.org/r/20251119-host-direct-messages-v3-0-c74d04944b26@google.com

Changes in v3:
- Filter out framework messages as suggested by Will Deacon. Update cover letter accordingly.
- Update trailers: Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
- Link to v2: https://lore.kernel.org/r/20251030-host-direct-messages-v2-0-9f27cef36730@google.com

Changes in v2:
- 1/2: Drop support for FFA_ID_GET interface in host handler.
- Link to v1: https://lore.kernel.org/r/20251030-host-direct-messages-v1-0-463e57871c8f@google.com

---
Per Larsen (1):
      KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler

Sebastian Ene (1):
      KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in host handler

 arch/arm64/kvm/hyp/nvhe/ffa.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)
---
base-commit: 6c790212c588fddeb0d852f2790840753bb604b1
change-id: 20251029-host-direct-messages-5201d7f55abd

Best regards,
-- 
Per Larsen <perlarsen@google.com>



