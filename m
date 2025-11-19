Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B7ECF256A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 02:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BmU83mtwNbd4ta+oA6B4iglhXsRhKpUg367i+j1TYmE=; b=NMuwwzaoHZoJOPQHjZuLgsgtiV
	w1vbpSvsG8yCtCetPeRX2esfnmydtllfuRry018e9jhmLTMHgQ26ots4O/Qh6bhrJBAObdbUTsjw3
	9MNQY7hVxwi7RxLhTr6QwAMWa57lGCYK/IpBON+WDnIuTIyRTqq9BPWLhW1+3zXYtHwZDC36qYfPS
	wTdz1szbjw1ltjHoNUJywcCOMVC5XX9seSxFdHgnIDICaa9131+SjXqUhiwLAahjrHXC/mx0XckMi
	AdLpi0sYNTC7NqWSFW4kcHFIxs1AjKfNrhDcTSYy4SaEEj/mKfUGnusxiCqViXVfBbDOtRl1EuEdc
	oP5D8ByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXcG-00000001N2B-2m1U;
	Wed, 19 Nov 2025 02:08:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXcE-00000001N1r-3lPY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 02:08:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF74060132;
	Wed, 19 Nov 2025 02:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D301C116D0;
	Wed, 19 Nov 2025 02:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763518093;
	bh=mNMEmJgEYNIBOSgKfDnjr28WG1m9XhnWBodP8OCCvxY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Gx1jlkT600yGc6Yfc7/HoAy3FABVGIz799McJl+zOkcnbis0U4worhN3oySvwho0P
	 0KEtfAaAIeYtwIHxMHxDMqGM9zy+v3IAgYOabd0/iY9NTgWNZ8FNY1ZEmoezKImVir
	 XftMMnSnNDFHNCy+EorOLwJTGD8ueXJ+nsuPM9+fk9XWFLsHk0bw3+Gnz1qaNEgBPB
	 GAhEAEtUIIL5wLt00J7fGtCrjWGbx+iFIeQeADeiEMCi8MwKQxE7L7rLf48AwlLCO5
	 ET8nObUKjBbpPF5K7VzxYigjPoTpK0jb4pDE4yEIgz6Rket/u2tF2VbTAObaGVwg3z
	 fZtGaHoETOQUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150A1CEE35E;
	Wed, 19 Nov 2025 02:08:13 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Subject: [PATCH v3 0/2] KVM: arm64: Support FF-A direct messaging
 interfaces
Date: Wed, 19 Nov 2025 02:07:52 +0000
Message-Id: <20251119-host-direct-messages-v3-0-c74d04944b26@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHgmHWkC/43NTQrCMBCG4auUrI3kxzStK+8hLmoySQO2KZkSl
 NK7mxY3gguX7wfzzEIQUgAk52ohCXLAEMcS8lAR03ejBxpsaSKYUJyJlvYRZ2pDAjPTARA7D0i
 VYNxqp1R3t6ScTglceO7s9Va6DzjH9Nq/ZL6tH1Cy32DmlNFTLUHpRnPTuIuP0T/gaOJANjGLf
 xRRlNYJbcDJWkv2pazr+gb36vfl/wAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763518092; l=1768;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=mNMEmJgEYNIBOSgKfDnjr28WG1m9XhnWBodP8OCCvxY=;
 b=wtFY4QBdUD08j2qc1AJqDZSKK1OvUYEL6zlb1B48v3NdUfiw3eaGLkBm3PmsQLp5ST/sXvDZn
 qF0op+1cQv5CWqUEDSHGTRU2gk4NuqL84Q5cOcpxdYeJ9UoRGQtVk4A
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

 arch/arm64/kvm/hyp/nvhe/ffa.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/arm_ffa.h       |  3 +++
 2 files changed, 36 insertions(+)
---
base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb
change-id: 20251029-host-direct-messages-5201d7f55abd

Best regards,
-- 
Per Larsen <perlarsen@google.com>



