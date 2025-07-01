Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DE7C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 22:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vbqnfkYItbdAehv9dqB0oNHifmQ3nkJQ+igEsJOZV/0=; b=n7Vr9HQu4Noh5szYmULqTRRynl
	ZO0Atl6pcpOOcCs20vbDS6f573+l2niqbj90EuNzeDaK8PSCnb8AVEKhu1FmkCDJxs5ZHGNv3vDIQ
	a8ZINEbINyTD4H+LVq2I/cT/R0YXFRj+Dq2sU/eBLqesWdm9KksogwSWC3FtOZKjgpYAiT6t5L39J
	nY3aZJqQx+8eJe6AZhod4gzNEItmLeQrbhexPXO88yt/6NkHGdxP8CjcTk3Z7uxzlFrXiMd8DQaHv
	rlG9ZvSpJZXh2RQaaQP2o33YeRB8MTcSA49jFxiIVqstH9weMytu2g4F/wfY66MYU3VUFqOBWFdGH
	FyzXmf3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjJP-00000006lwc-1sYR;
	Tue, 01 Jul 2025 22:18:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWj7o-00000006k1c-2G9S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 22:06:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FDBF46824;
	Tue,  1 Jul 2025 22:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57F6BC4CEEB;
	Tue,  1 Jul 2025 22:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751407607;
	bh=43NY+bSRhhxrEVankUIT3L/lBrk/enLMCS3BGcN1ccs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JbH3fMvJzqXep0BUBXCHEUrODtBIrRsLKawPnOUp0LCNqC1EUSdjVLqKjnqjemcXe
	 RZBMxvyQyQ1hrskJ8ZvVSUgah94/SslreYO7CrYgDyBYhlJgto8aCc0sfi3qRHQz62
	 fZl+bTunt497HewR1aQVPoFBJmVCUKnOe+MLT9g/owgLZvBvht4TEK6Zmqc7YC/ul8
	 k9erj/1uhs9b1DlUDlomw5Z9dtYFKX/CMZHFAVhqVo93i3c/r2yJhqmJgumg8Quikw
	 R/v3I0vDNi5gK31XbAy7AvUwt0D+1QSRobTFd7nbWXYad749rxggkeN5Y6a8kvbBK/
	 uHLHyL0XYh13A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F3DC8303A;
	Tue,  1 Jul 2025 22:06:47 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Subject: [PATCH v7 0/5] KVM: arm64: Support FF-A 1.2 and SEND_DIRECT2 ABI
Date: Tue, 01 Jul 2025 22:06:33 +0000
Message-Id: <20250701-virtio-msg-ffa-v7-0-995afc3d385e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOlbZGgC/2XQTW7DIBCG4atErEsEw6+zyj2qLigeHKTYRNhFr
 SLfvdhSVbcsZ/G8+jRPMmOOOJPL6UkyljjHNNXDvJyIv7lpQBr7ehNgoJhimpaYl5joOA80BEc
 BXDDgO+CKkYoeGUP83IOvb/UOOY10uWV0xwywCpg9CwApJKecPjDfr3EcPyY3LWefxi12i/OS8
 tc+rsCW/AnY/zsKUEaxtzJYpkSn1XVIabjjntqGFHHwXDReVN9r7Y0Ogb+Db7w8+uYPRVavLEM
 0DOs+3nj16zXvGq+ql7x+0iplLTON1wcPpvG6eusZhL6T2Lu/+9d1/Qbf1se+6gEAAA==
X-Change-ID: 20250506-virtio-msg-ffa-22af72c92150
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751407606; l=4826;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=43NY+bSRhhxrEVankUIT3L/lBrk/enLMCS3BGcN1ccs=;
 b=Qgpxzv+DgnfrsxQCvMNmnx3G57BbKoi+b3bENsB7/bxqi1aBzL7rU949iVXZFfjZTezXJiBCW
 wFGOpbgzwZbC+oskhHyOXp/R4tnZxEiaI5hZeM7v6DODM5H7rLfKT7S
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_150648_655125_081957CB 
X-CRM114-Status: GOOD (  16.09  )
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

Hi,

The FF-A 1.2 specification introduces a new SEND_DIRECT2 ABI which
allows registers x4-x17 to be used for the message payload. This patch
set prevents the host from using a lower FF-A version than what has
already been negotiated with the hypervisor. This is necessary because
the hypervisor does not have the necessary compatibility paths to
translate from the hypervisor FF-A version to a previous version.

Support for FF-A 1.2 in the hypervisor is added as a precursor to the
addition of the FFA_MSG_SEND_DIRECT_REQ2 messaging interface. Notably,
this patch updates all smc calls to use SMCCC 1.2 as it makes it simpler
to support interfaces that need to accept more than 8 arguments and/or
return more than 4 values. The list of optional/unsupported interfaces
was updated to reflect additions in FF-A 1.2.

Tested by booting Android under QEMU and loading Trusty as the guest
VM and observing the SEND_DIRECT2 ABI being used successfully during
guest boot.

Changes in v7:
- 0/6:        Revised cover letter slightly
- 4/6:        ffa_call_supported: Clarify optional interfaces
              hyp_ffa_post_init: Sanitize MBZ bits in x2 and x3
              address nit: use GENMASK
- Link to v6: https://lore.kernel.org/r/20250627-virtio-msg-ffa-v6-0-8c02fd94edac@google.com 

Changes since v5:
- 3/6 -> 2/5: Merged with parent patch as they were closely related
              Don't rename variables from "res" to "regs" to avoid churn
              Update and clarify reasoning for condition added to ffa_set_retval
              Adopt style suggested by Marc when passing regs to arm_smccc_1_2_smc
              Fix inadvertent duplicate statements in ffa_{map,unmap}_hyp_buffers
- Link to v5: https://lore.kernel.org/r/20250619-virtio-msg-ffa-v5-0-412c98558807@google.com

Changes since v4:
- 1/5 -> 1/6: Added Acked-by: Will Deacon <will@kernel.org>
              Reworded patch subject and description
- 2/5:        Dropped patch: zero x4-x7 in ffa_set_retval
-        2/6: New: use SMCCC 1.2 during hyp init
-        3/6: New: use SMCCC 1.2 in host FF-A handler
- 3/5 -> 4/6: No change; can revisit denylist design in later patchset
              Added Acked-by: Will Deacon <will@kernel.org>
- 4/5 -> 5/6: No change
- 5/5 -> 6/6: No change
- Link to v4: https://lore.kernel.org/r/20250516-virtio-msg-ffa-v4-0-580ee70e5081@google.com

Changes since v3:
- all:        Remove Signed-off-by: Per Larsen <perl@immunant.com>
- 2/5:        Split out from 2/3, zero x4-x7 in set_ffa_retval
- 3/5:        Split out from 2/3, Mark FFA_NOTIFICATION_* calls as
              unsupported
- 2/3 -> 4/5: Drop ffa_get_hypervisor_version, access hyp_ffa_version
              directly when version negotiation is complete.
- 3/3 -> 5/5: Call ffa_to_smccc_1_2_error directly in
              do_do_ffa_direct_msg2
              Push call to ffa_call_needs_smccc_1_2 lower down by adding
              ffa_get_func_id and ffa_set_retval_smccc_1_x.
              Drop ffa_to_smccc_1_2_regs and ffa_to_smccc_1_2_regs_prop
              as they are no longer used.
- Link to v3: https://lore.kernel.org/r/20250513-virtio-msg-ffa-v3-0-d66c76ff1b2c@google.com 

Changes since v2:
- 2/3: Removed files added by mistake.
       Add and use ffa_get_hypervisor_version to access hyp_ffa_version
- 3/3: Use ffa_get_hypervisor_version to access hyp_ffa_version safely
- Link to v2: https://lore.kernel.org/r/20250508-virtio-msg-ffa-v2-0-ed84f8053965@google.com

Changes since v1:
- 1/3: Simplify commit message; drop long comment in do_ffa_version
- 2/3: Correct use of Co-developed-by: footer
       s/arm_smccc_1_2_smc_fallback/arm_smccc_1_x_smc/
       Always access hyp_ffa_version w/lock held
       Remove superfluous comments in ffa_call_supported
       Add and use FFA_FEAT_RXTX_MIN_SZ_MASK instead of constant
       Add FFA_PARTITION_INFO_GET_REGS to calls that require SMCCC 1.2
- 3/3: Always access hyp_ffa_version w/lock held
       Correct formatting

Thanks,
Per Larsen

--
2.49.0

---
Per Larsen (5):
      KVM: arm64: Correct return value on host version downgrade attempt
      KVM: arm64: Use SMCCC 1.2 for FF-A initialization and in host handler
      KVM: arm64: Mark FFA_NOTIFICATION_* calls as unsupported
      KVM: arm64: Bump the supported version of FF-A to 1.2
      KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler

 arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
 arch/arm64/kvm/hyp/nvhe/ffa.c    | 244 +++++++++++++++++++++++++++------------
 include/linux/arm_ffa.h          |   3 +
 3 files changed, 175 insertions(+), 73 deletions(-)
---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250506-virtio-msg-ffa-22af72c92150

Best regards,
-- 
Per Larsen <perlarsen@google.com>



