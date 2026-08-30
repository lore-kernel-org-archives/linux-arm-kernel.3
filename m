Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC31C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 23:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yn9MKouoRb2KcdBSTQw15t8VOn7fiY4wIjYrwdyj/XU=; b=EAj5vKRpbQ/Kcco0Sd02Ltv/XH
	/0e90W6ez36JQ6L94um444vYE0WuImik7tRM+zWpdQZ86sT8QM79ijE+Y4rhwG/zcWTwHHB1ZwjJo
	qcU+zrVjRsweHwyt84GqDDimIcCEVQuwzvA/dLo9SwaScWJM7sIA1jHYC4pORLVuEAVG4yMjTUpzV
	fQws4fi87/Lw5h3pxnbC5Ky01oKMlphJFqDC+lUvcMLzc3EWBQKLdLqNupOtqvHrlYuavgq01Huy4
	JH9VGmbm7r9brcNkoyaLrLfK5mb3UFtuEgfGsX537G1NE6H00hqogJNHuD6prHMpEwf4JS0KNPJ9R
	bhQz9miw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0odi-00000008Cl0-11tV;
	Sun, 30 Aug 2026 23:08:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0odg-00000008CkZ-2j7j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 23:08:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10AC2438E7;
	Sun, 30 Aug 2026 23:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3C5FC2BCC7;
	Sun, 30 Aug 2026 23:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788131315;
	bh=l87EwSkD1CEn4+bfwgv4gal/kTthTgQXI2kg63rlZWc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uMCCsS8rxAF/ezIWIHWUeleVrebJa3nbQJutor891GhCEPYozvXC3ab2VM/YDhTCh
	 GhRsMd7W5i3BE0/djdtjGtC2eTk5X1egg2Lp7HygfXVO2u0noF2lQ+7VkWFgcoCZJF
	 NfSDgmVI3220s3sLUWW2IWTKN9WWD4E3JtR9oGtXaEZzTWKIRDnrXB6zsw8rqqBJpD
	 TxA897DqQ2cHO8FUJnPRwKc8JFf56jtnXgQl3FswXYLroD7QD2Wtk+3YbvB7A3R6bN
	 h/T9q1ffj56Y6D37y9Qqw1KXrwLkv/r+2N3hD53yGiRDK4IU+Y05H+M/hCgpXKuOqr
	 hRwSn8i8mIRSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD00C61DE2;
	Sun, 30 Aug 2026 23:08:35 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Subject: [PATCH v7 0/3] KVM: arm64: Support FF-A direct messaging
 interfaces
Date: Sun, 30 Aug 2026 23:08:12 +0000
Message-Id: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANy3lGoC/43PwWrDMAwG4FcpPs/DkmU72WnvMXZIbTkxrHWJQ
 9goefc5ZaMbWWDHX6BP+q+i8Ji4iKfDVYw8p5LyuQb3cBB+6M49yxRqFqjQgMJWDrlMMqSR/SR
 PXErXc5EGFQQXjemOQdTVy8gxvd/Yl9eah1SmPH7crsywTr9Arf4GZ5BKktVsXOPAN/G5z7l/4
 0efT2IVZ/yPglVpIzrPUVun1UbRdwVgp9ysq+IdBUUt0RHtRqFvxSpQewqtv5jQESIEaLaK+aE
 g7CimKujBAvmWuNk2snfFqD3FVkVH6qJDx6Exv5RlWT4Be75FAhcCAAA=
X-Change-ID: 20251029-host-direct-messages-5201d7f55abd
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Sebastien Ene <sebastianene@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Per Larsen <perlarsen@google.com>, 
 Fuad Tabba <fuad.tabba@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788131315; l=3303;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=l87EwSkD1CEn4+bfwgv4gal/kTthTgQXI2kg63rlZWc=;
 b=4SU4ydR/4qW466dgQe0E/kB7YR/oY/pH7E6YpEreh01jPVRt6qHZCHbII/Fta98o+wdMra1sK
 Uyh2G9hx720CsqhyEWBEwXwGdG+h0nH/Y+kMUUzNml5CjdMutvfBenz
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

Block host-initiated FF-A direct responses.
Support FFA_MSG_SEND_DIRECT_REQ unconditionally.
Support FFA_MSG_SEND_DIRECT_REQ2 if hypervisor negotiated version 1.2+.

Framework messages (FF-A control plane) are filtered out. For
FFA_MSG_SEND_DIRECT_REQ, we look at flags in w2. Messages using the REQ2
interface are always partition messages.

The third patch was part of a previous patch set [0] but was dropped
since the use case was unclear. A clear use case has now appeared: use
TPM device with CRB over FF-A when kernel boots with pkvm [1].

Tested by booting Android under QEMU.

Best Regards,
Per

[0]: https://lore.kernel.org/all/20250730-virtio-msg-ffa-v9-0-7f1b55c8d149@google.com/
[1]: https://lore.kernel.org/all/20251027191729.1704744-1-yeoreum.yun@arm.com/

Signed-off-by: Per Larsen <perlarsen@google.com>
---
Changes in v7:
- New patch 1/3: block FFA_FN64_MSG_SEND_DIRECT_RESP. Only the 32-bit
  variant was denied, so the host could send unvalidated 64-bit direct
  responses to EL3, including a forged sender endpoint ID
- Use hyp_smccc_1_2_smc() so the call is bracketed by hyp_exit/hyp_enter;
  the pass-through path already traced these calls
- Declare endp/flags as u64 and reject a non-zero x1[63:32]: these are
  w1/w2, but the raw 64-bit registers are forwarded to EL3
- Pass the canonicalised func_id to do_ffa_direct_msg() rather than
  re-reading x0, which still carries ARM_SMCCC_CALL_HINTS
- Link to v6: https://lore.kernel.org/r/20260501-host-direct-messages-v6-0-3f4af727ed85@google.com

Changes in v6:
- 1/2: validate that bits 31:16 of w1 is HOST_FFA_ID.
- Link to v5: https://lore.kernel.org/r/20260121-host-direct-messages-v5-0-2c1614c94e80@google.com

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
Per Larsen (2):
      KVM: arm64: Block host-initiated FF-A direct responses
      KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler

Sebastian Ene (1):
      KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in host handler

 arch/arm64/kvm/hyp/nvhe/ffa.c | 44 +++++++++++++++++++++++++++++++++++++++++--
 include/linux/arm_ffa.h       |  2 ++
 2 files changed, 44 insertions(+), 2 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20251029-host-direct-messages-5201d7f55abd

Best regards,
-- 
Per Larsen <perlarsen@google.com>



