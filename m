Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB52C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rYY7gICYK6mnr7SZ0h8JVgwFO2ykA+NhgpS4kfMsPR0=; b=gHs5qfxMHEK6ohWSD1UwalBPI+
	+VShjbirr9spBIaF1CzR/FARzVDE/vD07SEHgm1NT87xGdGV1pR6TQbn4p6td+SOIy27TslMHvi8u
	ZHhPo/+hF732iD5iJSfQ/pQ3fUinQ2jNJOjq1qyVX36SeUZ+k7HCzoI1fLAOJ44+zxVF6iIQlQmsF
	2nMZ4foCZlPRKTdZUmquuWJHDCEx3PdZTc6uwzR2EKx1PNFfPgd63awbpAxGpns1TRTpI0P091HTR
	AxZAWPid35hTHBELJrLqJxMaHC9Nt1Km//7sWJXyvNrNJC9m8TbsIKNQs478ilqGs7pkH5JHCgzSB
	TVTTIgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEow-00000004BYn-0F8t;
	Thu, 02 Jul 2026 10:39:02 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEot-00000004BXW-0O7N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 10:39:00 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-c1260766980so182117866b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782988736; x=1783593536; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rYY7gICYK6mnr7SZ0h8JVgwFO2ykA+NhgpS4kfMsPR0=;
        b=bTVKmIg271eBvuvu4zCUUzkFVlLtDOzrPf2/eIor+QSscF3nZEbhfjiwZMrkRFf1T4
         dvqsoTJ/JOjpxEMJi4WWD/FbDHXf307PiNt2k3tASGANWUZxHySBkEypUerafd93vaqE
         VBBkKk4Zasl6YPYrc8o+3VhjTpDFsBtntZdZB1tZdfOkOvpnVPGI+f0C4LtENRw7JeEr
         +r/+/+mVW5PiAkdjzqITFbC2buaVpZwnryUHq/WEpkh8l7WhCXrLUicSrpdxh3cUfmQH
         EAOhQAcLRpyt0BoTvy6uOzxWwv+cpeKYQldL5ujW8ET1VLUPefZhJNxU/Rkb85Zbdlgn
         tYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988736; x=1783593536;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rYY7gICYK6mnr7SZ0h8JVgwFO2ykA+NhgpS4kfMsPR0=;
        b=i6NldkDxh7NEjM+Lvs/UZv99WBpB2QugsmrGAxj/uUlytJ8Oss1FzJ5fpBCBu71cQl
         ph21oeVq9i0wKXKB0uvCTOY23v+SiYqJJLOpILkd4y/oqAvBCj5y3LklMfKAJ9peiS5R
         kEzmJiNi8NfoFBt7LdfnUOSkPorl4du+sWIemhFhI3LXde15d7tsnFVGC8nLnpoLOSst
         3Y1ieUcaqqea+0hUlIlBpgUTde5QQorO0p/QZxlmF1pYVk18bpwcDv7C0PLGJ4Q+1X34
         QEjftZc5+poMHFCLsYvKpr+BuZLgkPSZT43hyB3UfnFIxxRZNaull/fyFPgq/60bxRHD
         SK9g==
X-Forwarded-Encrypted: i=1; AHgh+RrSsM1XiIUxeIYLMAi6tY+fqcvJoEBKgUaqsSudcf7neZ0LuyjztrPC0W592Ue50h5HToglHumUfJov3/RYrIYw@lists.infradead.org
X-Gm-Message-State: AOJu0YzgbiYIO+QcMqqnPIlaQwGj0wEd0PdwEtge4n7yaD4/oIUrRjCO
	V9S+QhRiJrhk8v+lJl07cewa4lP/emBNXUbsee8rnBEs3cA9+aK272HQC80bKS/6Vn7g8TzL/gR
	GIw7h3fn479jJ4gRmoIlQeLBjQoJdSA==
X-Received: from ejn3.prod.google.com ([2002:a17:906:583:b0:c12:a94f:8b78])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:46cc:b0:c12:93ed:47dc with SMTP id a640c23a62f3a-c12ae7bb5efmr165217966b.40.1782988735859;
 Thu, 02 Jul 2026 03:38:55 -0700 (PDT)
Date: Thu,  2 Jul 2026 10:38:37 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260702103848.1647249-1-sebastianene@google.com>
Subject: [PATCH v9 0/6] arm_ffa, KVM: Fix FF-A emad offset calculations
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org, 
	will@kernel.org
Cc: jens.wiklander@linaro.org, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, maz@kernel.org, mrigendra.chaubey@gmail.com, 
	op-tee@lists.trustedfirmware.org, perlarsen@google.com, 
	sebastianene@google.com, seiden@linux.ibm.com, smostafa@google.com, 
	sumit.garg@kernel.org, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_033859_147160_AA780B10 
X-CRM114-Status: GOOD (  20.95  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi all,

This series fixes the Endpoint Memory Access Descriptor (EMAD) offset
calculations and adds the necessary bounds checks for both the core
FF-A driver and the pKVM hypervisor.

Prior to FF-A version 1.1, the memory region header didn't specify an
explicit offset for the EMADs, leading to the assumption that they
immediately follow the header.
However, from v1.1 onwards, the specification dictates using the
ep_mem_offset` field to determine the start of the memory access
array.

The patches in this series address this by:
1. Updating the core `arm_ffa` firmware driver to correctly calculate
the descriptor
   offset using `ep_mem_offset` rather than defaulting to `sizeof(struct
ffa_mem_region)`.
   It also introduces bounds checking against `max_fragsize`.
2. Enhancing the pKVM hypervisor validation logic to no longer strictly
enforce that
   the descriptor strictly follows the header, aligning it with the
driver behavior
   and the FF-A specification, while also ensuring the offset falls
within the mailbox
   buffer bounds.

While addressing these bugs, Sashiko uncovered other issues that were
fixed in the same series.

All the patches aside from the first one in optee are urgent fixes as
they either impact the hypervisor security or kernel stability.

Changelog
#########
v8->v9:
- addressed Sashiko double ffa_rx_release in "KVM: arm64: Fix bounds
  checking in do_ffa_mem_reclaim()"

v7->v8:
- dropped the patch "optee: ffa: Add NULL check in
  optee_ffa_lend_protmem" from the series as it was queued by Jens
- rephrased the commit message for "KVM: arm64: Ensure FFA ranges are
  page aligned"
- introduced a helper macro to get the size of the ffa memory region
  based on the used version.

v6->v7:
- taking the patches from Mostafa and sending a new version with the
  collected tags
- Added overflow checks when doing `ep_offset + emad_size` in the arm
  ff-a driver
- Move the length check before the ffa_mem_reclaim
- fix compatibility break with ff-a version 1.0 reported by Sashiko
- add one more patch to fix an issue with the FFA_VERSION call
  that can lead to leaking pKVM stack un-initialized data to
  a host when -ftrivial-auto-var-init=zero is not used.

v5->v6:
- Add fixes tag
- Small clean up make variable declaration reverse christmas tree.

v4->v5:
- Collect Sudeep Rbs
- Add extra patch to check base address alignment.
- Remove WARN_ONs in KVM code
- Use ffa_emad_size_get() instead of hardcoded size in KVM code.

v3 -> v4:
- Address review comments and fix Sashiko bugs

v2 -> v3:
- Fixed typo in nvhe/ffa.c (missing sizeof)

v1 -> v2:
- For pKVM, removed the strict placement enforcement for `ep_mem_offset`
  as it is not
  compliant with the spec, and avoids making assumptions about the
driver's memory
  layout.

Link to:
########

v8: https://lore.kernel.org/all/20260630102058.3219867-2-sebastianene@google.com/
v7: https://lore.kernel.org/all/20260617145130.3729015-1-sebastianene@google.com/
v6: https://lore.kernel.org/all/20260527150236.1978655-1-smostafa@google.com/
v5: https://lore.kernel.org/all/20260526151934.3783707-1-smostafa@google.com/
v4: https://lore.kernel.org/all/20260520204948.2440882-1-smostafa@google.com/
v3: https://lore.kernel.org/all/20260512124442.1899107-1-sebastianene@google.com/
v2: https://lore.kernel.org/all/20260430160241.1934777-1-sebastianene@google.com/
v1: https://lore.kernel.org/all/ae9KN9nkOgDYJcGP@google.com/T/#t

Mostafa Saleh (3):
  firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
  KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
  KVM: arm64: Ensure FFA ranges are page aligned

Sebastian Ene (3):
  firmware: arm_ffa: Fix Endpoint Memory Access Descriptor offset
    calculation
  KVM: arm64: Validate the offset to the mem access descriptor
  KVM: arm64: Zero out the stack initialized data in the FFA handler

 arch/arm64/kvm/hyp/nvhe/ffa.c     | 44 +++++++++++++++++++++----------
 drivers/firmware/arm_ffa/driver.c | 25 ++++++++++++------
 include/linux/arm_ffa.h           |  9 ++++++-
 3 files changed, 55 insertions(+), 23 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


