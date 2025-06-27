Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0212C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OImC4e+bHaBpta0R8//SAtNjdBU1s4tM3DuLCvPZmE4=; b=m6k0lR109yik7dc8UDfPZo0T13
	NkhcJAoJbOR8Qj9QswiD84A+s9g+lXCrqwoTa1kKFrWGDcPgR/J60YBj1pYoMZx/KMTzyf8+SjSoy
	d0+u4TTfxXYDGikvHeLoSKGMphaY7enGP2YqNCuIy6Wi3DI7v/QRbeF96pEwlRoSToMWlTd6Pk4CT
	90DsxzxyJUysWaIpef0kWF3p4D5tbmszf5YirWMvzARSqq/C050mxQbqgxAHL7NJqttyy/LPUkDgN
	kbGH/Hx6KO20qbqgrka1ehQy6PpO4FNVw+ys1X+GC4bqWjsEwURskIKHBRvenKyQH9TUXGkkLkgRn
	lgP0ZfEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3M7-0000000DoQx-2Il6;
	Fri, 27 Jun 2025 07:18:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3Gf-0000000DnhH-2sdr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 07:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F23CE61129;
	Fri, 27 Jun 2025 07:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1E84C4CEE3;
	Fri, 27 Jun 2025 07:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751008380;
	bh=vacyOvH9yiqinENGzTmGsKooNswCrtZiKq9q4IMB0VM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hwoiTNxXnZxp+3WDWqDnX1S9La0EcUnSMotlqKJGKmw3hGdYMANeLwFciZbQKvm3a
	 oSnF1VxKpXBmS4RJezt1f/QFZ2jM2TKXeUL87PDWMSDhOI/7mGYxhBoaMM1oEuFNZk
	 JGaFeIWYH4AK9oI7h4yGD1ub2TR4Tky1iwh1PVwB7CpgarwkAlAytWjA6vcpvfU3kD
	 hkp0LFnxwJMs0BLK37pXa9hFUrxq8jBdhr+vGLryf0JGa68IZix4vWLgDnI+er4GYu
	 ZEG2fY2Vsrf27PqPM8ZXf51i5HJCI9i3cnsCT0GKpwsBToQ+Hl0PwB9oedVZLXUq1C
	 ikUdHb/MDIbLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9069AC77B7F;
	Fri, 27 Jun 2025 07:13:00 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Subject: [PATCH v6 0/5] KVM: arm64: Support FF-A 1.2 and SEND_DIRECT2 ABI
Date: Fri, 27 Jun 2025 07:12:24 +0000
Message-Id: <20250627-virtio-msg-ffa-v6-0-8c02fd94edac@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFhEXmgC/2XQTW6DMBCG4atEXtfRePyDySr3qLKgMAZLAUc2t
 VJF3L0GqSoty1k8rz7NiyWKnhK7nF4sUvbJh6kc5u3E2qGZeuK+KzdDQA0aDM8+zj7wMfXcuYY
 jNq7CtkahgRX0iOT8cwu+38rtYhj5PERq9hmEAsCeJaKSSnDBHxTvVz+On1Mzzec2jGts8GkO8
 Wsbl3FN/gTs/x0ZOXDqrHIWtKyNvvYh9HfaUuuQLHdeyIOXxXfGtJVxTnxge/Bq7w9/yKp4bYG
 oAir7xMHrX29EffC6eCXKJ63W1kL1xy/L8g2E76xxqgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751008380; l=4411;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=vacyOvH9yiqinENGzTmGsKooNswCrtZiKq9q4IMB0VM=;
 b=w839cQqnyWmglZ8jeIakq6lQsI/V5KMO1oi2OfuHqE9mO6UhcjWBbFmuCcycaP6cYfyRQG9q8
 GHwRQfWcpAvD0cvudfVz7u2XI1hFHFqwbk0aou+S5Jfof7UREVGVbC9
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
 arch/arm64/kvm/hyp/nvhe/ffa.c    | 240 +++++++++++++++++++++++++++------------
 include/linux/arm_ffa.h          |   3 +
 3 files changed, 171 insertions(+), 73 deletions(-)
---
base-commit: 67a993863163cb88b1b68974c31b0d84ece4293e
change-id: 20250506-virtio-msg-ffa-22af72c92150

Best regards,
-- 
Per Larsen <perlarsen@google.com>



