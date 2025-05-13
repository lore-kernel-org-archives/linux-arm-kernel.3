Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96BAC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 06:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NWOXYRrIXTbUiX9q6HHgH7fLR705mnJaD8oRIM1qYFI=; b=Wfxg05V22+emPME5/ctavm9VQt
	/CCl37s7lhsBwCOfZ/NgZfwdLJyqb5uIbfnwc4eRB3l6eumXX3ofBrbGmPdy8IhQj3Arsa/hfwq/A
	PFxMpS5GdrLEmSs7nz7onU/QCYW/CcbbJqLXASCKEijj+hy55/JSkcaBac45iOyFjTasecOVCw7e1
	Wkn2eDAix6yEj2owxJaGKvgSWGwsGtTHelky27TJVtIe1A/f1ea1P4tjvYZMXPNGs+LlprpHBWe1M
	3MdxsY7U7E5lyWSQdY5cObC4yVdzCIe2njN/MvBrMqf/jdDL9x6jXVrMidfzmslte/HSJNrj2qzCC
	O6faowyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjCN-0000000BViY-0C2A;
	Tue, 13 May 2025 06:33:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEj8Q-0000000BV74-2FXz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 06:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A7CE44D75;
	Tue, 13 May 2025 06:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F61EC4CEEF;
	Tue, 13 May 2025 06:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747117740;
	bh=4SKA5HPa9ZWoOTNyb/Gf9+n/i7cYSFTNHi/tHOeBnGE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nGZfiRM2uM6B4s9C1yNel7dnpkxLE3GcjwlI1vyKrsbMeM5iGmecFHCYOlEVacT28
	 2tW+j+Jcki/XhhTg4zcZteOWsOXmPv9kLfkWhIei9SNaG/sL7UoSLX2rwZ5xZZezXz
	 GqB2PdG/g6hnS1sTds1wgUeqH0us+cHaNsXf/cckhyeEaK9zFeQcIU/aLPKnXA3fkb
	 oDNMZgqAvxbrbuG0ihh8T1PAmKGDn47VvbhCdrNF1ovDZ5hqtOuEPNEq/XxHJeEB5K
	 tikenGLdR3zp8GzCUj34YG9ZQD2HykKvItI1QiSaOB0brlTrvQFKaT/ESJt9fSMV9x
	 XtqclChfNRLnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F22C3ABD8;
	Tue, 13 May 2025 06:29:00 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Subject: [PATCH v3 0/3] KVM: arm64: Support FF-A 1.2 and SEND_DIRECT2 ABI
Date: Tue, 13 May 2025 06:28:29 +0000
Message-Id: <20250513-virtio-msg-ffa-v3-0-d66c76ff1b2c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI3mImgC/13OQQqDMBCF4atI1h2Jo7G2K+9RXASd6IAxklhpE
 e/eKBRKl//ifbxNBPJMQdyTTXhaObCbYuSXRLSDnnoC7mILlKikkiWs7Bd2YEMPxmhA1OaK7Q0
 zJUUczZ4Mv07w0cQ23llYBk/6l0EZB7JKc8QiLzLIYCY/1mztc9LTkrbOHtjAYXH+fZ5b8SC/Q
 PX/Y0WQQF1VmEqq/FaquneuH+mkmn3fP4broG7qAAAA
X-Change-ID: 20250506-virtio-msg-ffa-22af72c92150
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, sebastianene@google.com, 
 lpieralisi@kernel.org, arve@android.com, qwandor@google.com, 
 kernel-team@android.com, armellel@google.com, perl@immunant.com, 
 jean-philippe@linaro.org, ahomescu@google.com, tabba@google.com, 
 qperret@google.com, james.morse@arm.com, Per Larsen <perlarsen@google.com>, 
 Ayrton Munoz <ayrton@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747117739; l=2845;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=4SKA5HPa9ZWoOTNyb/Gf9+n/i7cYSFTNHi/tHOeBnGE=;
 b=1iyk0OED6t5ZdZaQjVBHOGlvdab42TBPKVqb0E58bknYWEhi9P0ZeJCrXMVghFpYu9Dst8/1l
 ljpFFiAEcyVBxzosqMZpk7SUEY4132d7cjj0tjzJUKhYXOQ85+WsXOB
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_232902_619367_E776B768 
X-CRM114-Status: GOOD (  13.92  )
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
Per Larsen (3):
      KVM: arm64: Restrict FF-A host version renegotiation
      KVM: arm64: Bump the supported version of FF-A to 1.2
      KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler

 arch/arm64/kvm/hyp/include/nvhe/ffa.h |   1 +
 arch/arm64/kvm/hyp/nvhe/Makefile      |   1 +
 arch/arm64/kvm/hyp/nvhe/ffa.c         | 202 ++++++++++++++++++++++++++++++++--
 include/linux/arm_ffa.h               |   3 +
 4 files changed, 199 insertions(+), 8 deletions(-)
---
base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
change-id: 20250506-virtio-msg-ffa-22af72c92150

Best regards,
-- 
Per Larsen <perlarsen@google.com>



