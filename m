Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A824DC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 10:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ya05U1e/yJiV3hxrHGSxEVptndcX3jEmx3HUVbLbCk=; b=t728gXzur1zyQYb1WIsPpjDgfK
	PlPF8opXejUutvWYOztuy5aQto1nEZdI6kV2XO1BgStWO036EWHRpJh4EsYrMymUcfPXgdSWNFQqj
	saTj0wzH0Xmb1Tt+2qEXZ0NX/U6Yon/nRfxUyV2C/116/2rzNLw5kMCjv/uSJz3Ov+4EXxN94DYJ3
	YFCn+Q0Vyp2gEtKVq2gyxNEtc5rYcx8/uMsUnwi1aybvhkXcu8TqrLzUb0GFhAiA1rE3kADMwUu9A
	NS/UxiuVuYika9Fk3f1ukN0pFWW4MfK+H/nP3F2+sZP3knhYBWC/JZLAGxfDZabWKHsvPPtsEy70e
	QF9tRg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSCg8-0000000CljU-2j0W;
	Thu, 19 Jun 2025 10:39:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBBB-0000000CY0B-0r52
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 09:03:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A9FC45060;
	Thu, 19 Jun 2025 09:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 169F5C4CEEA;
	Thu, 19 Jun 2025 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750323808;
	bh=JDMcRyLLeYcFRVBAt6QvueCzaPAy/7MNgWJNDM2A3wo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NQwIMTLGePLZCpJ6SD5ZnIRsdpYpKAnrCPMWJ6C+5nJYk1ssfxat6imk5Ig5Cwe1d
	 YROHkJ3EZzpuewS+PVZQwCuvOAj6CkEHqUg6ibP2Qv5icY24qliCdQvO/4pM9ozslz
	 FIznZvzA4mle4Rp+yy4Wav3GFUt5mFox922cgg9+bmU1nNNLMBdgLVUINc8Kd0A680
	 cL9qfdNtLsWtJD5AIU8iAGx7/v7uE6myfSyItDFHl9kY6FjxzK6NHAmA8Q5+tzJdoA
	 ONHSFjruidFOmiWpHXOvHC5V0Ic5mzEmG+1LZ23mW0DOzhpuQnkqfW2d57kGd8BEmk
	 Eg44TDqikthdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047B3C7115A;
	Thu, 19 Jun 2025 09:03:28 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Subject: [PATCH v5 0/6] KVM: arm64: Support FF-A 1.2 and SEND_DIRECT2 ABI
Date: Thu, 19 Jun 2025 09:02:53 +0000
Message-Id: <20250619-virtio-msg-ffa-v5-0-412c98558807@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD3SU2gC/2XQTW7DIBCG4atErEsEw49JV7lH1AXFg40UTAQuS
 hX57sWWKrn1chbPq0/zIgVzwELeTy+SsYYS0tQO9XYibrTTgDT07SbAQDHFNK0hzyHRWAbqvaU
 A1nfgLsAVIw09Mvrw3IK3j3b7nCKdx4x2nwHWADNnASCF5JTTB+b7NcT4NdlpPrsU19gYypzy9
 zauwpr8DZj/OypQRrE30humxEWr65DScMcttQ6pYue5OHjRfK+167T3/BPcwcu9P/yhyuaVYYg
 dw7aP//HLsvwA+P8cZ2oBAAA=
X-Change-ID: 20250506-virtio-msg-ffa-22af72c92150
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Per Larsen <perlarsen@google.com>, 
 Ayrton Munoz <ayrton@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750323807; l=4385;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=JDMcRyLLeYcFRVBAt6QvueCzaPAy/7MNgWJNDM2A3wo=;
 b=malgCl1TuMWj2eQg3bYUOakJFv3JTuy39cNzNEoqz2BENpNeCbzMdEneYwr0JG/zh4bHHjFef
 5ZaYt1YbG+mDZEbNZcyaAG+MscMgOv3/v8Qwb0RLnX1YRZ8sBoCzc8H
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_020329_298192_0ED7AD6B 
X-CRM114-Status: GOOD (  14.36  )
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
addition of the FFA_MSG_SEND_DIRECT_REQ2 messaging interface. The bulk
of this change has to do with the upgrade to SMCCC 1.2 required by
FF-A 1.2. Additionally, unimplemented FF-A 1.2 interfaces are added to
the list of unsupported functions.

Tested by booting Android under QEMU and loading Trusty as the guest
VM and observing the SEND_DIRECT2 ABI being used successfully during
guest boot.

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
To: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
To: Joey Gouly <joey.gouly@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Zenghui Yu <yuzenghui@huawei.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: kvmarm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---

---
Per Larsen (6):
      KVM: arm64: Correct return value on host version downgrade attempt
      KVM: arm64: Use SMCCC 1.2 in hyp_ffa_{init,post_init}
      KVM: arm64: Use SMCCC 1.2 in host FF-A handler
      KVM: arm64: Mark FFA_NOTIFICATION_* calls as unsupported
      KVM: arm64: Bump the supported version of FF-A to 1.2
      KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler

 arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
 arch/arm64/kvm/hyp/nvhe/ffa.c    | 373 ++++++++++++++++++++++++---------------
 include/linux/arm_ffa.h          |   3 +
 3 files changed, 239 insertions(+), 138 deletions(-)
---
base-commit: fb4d33ab452ea254e2c319bac5703d1b56d895bf
change-id: 20250506-virtio-msg-ffa-22af72c92150

Best regards,
-- 
Per Larsen <perlarsen@google.com>



