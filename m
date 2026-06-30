Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E779C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OJzLaDJYkTsSZ24JLp6E5r3GjL3vXjqVNcTnlWofIQg=; b=xx2BD0b2broKqJH6rvAIKxX+dw
	WkVQk6Uwv6A4Vx01CnYlJTY92bYDw9+Qvnv0FS7n7N4+3yVFEkow9nAVMykSIWDpoFuBOpIrZl4vA
	FN2XjolOveGDmApS133D4BDwq2j+/uM4dnJXzhP+G0KRuQ9pEFVAblNcWmQOYXd987AZEdWCu+Nq+
	ZHpT0jHsHXHC6IgtlRIXRXg+2IXpT43TL/VSIqmqgwLsILg6nED4caQFaUdzuC9h1VCvzvmkVakUP
	a3WqYwdJfq+3BJCaT6ZYiGCxhBo39BfbWsoWx1ofa6HMvd4K2hLTY1PvFlglqLhzx+yQt/w8Ai6w3
	yUA6l28g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVam-0000000GcF8-0Q2e;
	Tue, 30 Jun 2026 10:21:24 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVaj-0000000GcE2-0vhR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:21:22 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4754fc5c021so448200f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782814879; x=1783419679; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OJzLaDJYkTsSZ24JLp6E5r3GjL3vXjqVNcTnlWofIQg=;
        b=hzHS/AA/nDUMJYGQGH5uvm3UpdR7TvtDJB4B1pg7tGP9vznir2bhXOz6hXqbnJ5pkO
         ItRkJ2jLtuR8LlGQc8DeXV7fu0ByjXb5AL2nTTSmfakVyWGRMtWL4wetRJhJBhld9DlC
         puWYtSTKr2D3oV0KLPft5z+ymV4zFhzQNjKVtxOaK/vjdzljeWQKQWzsmWwTXVHGe3e2
         U6rYill06I5jADbOF0qHzAo6eTJmh6CK59y/k9W5XC1VVpdeL/tsIKN1FtPXPxsvB9Z2
         dV3MSo0NJtVnmMWHk98llR8d4O1UmiDDcIOk8i1L/zMv/GLZh6Z2m9xiKryiFxnt2gmd
         oPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814879; x=1783419679;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OJzLaDJYkTsSZ24JLp6E5r3GjL3vXjqVNcTnlWofIQg=;
        b=lN1EMTGeeFp/XXmo+tOQ+MXbBc8Fr9qakl5um3Zw28/9/VCLhGPc4r7JxiIFB4aB0d
         kE37HyQn2ph9MVt5pM7fnWrZjy9OgEKjzhO+UKABe2Fw7pQRYg/RjWHSyf77igWjU6Eg
         4lF1ckAVk1iA0cUzKYj1qdbpDvSQnQiegVLjCKTwuvD4CHlJp7hx9RqgMLRja+bGZdr3
         QjfSoqu0zy90iH/2BxIvsOi2lrBsmhrkpjM0jnmIHOZ9x4hpsRbm5KCYgSDzYBGHxD59
         mfkHS8F4tLhWPmHeCpCEOAm9XR04bZzo+1FBliUOsLkhiew+g2IIe3WL3hqFKrWxwYYO
         uX/A==
X-Forwarded-Encrypted: i=1; AFNElJ++ghkrbKyN3jHIxXDJXUG6mhk0/5RP1Qi4UkzRNEMRfDB+jtQYXS0eXcG/Ujp2/eMRxGv+VRKpCzhO8p2fhygu@lists.infradead.org
X-Gm-Message-State: AOJu0YzIyqZGJsrkaxgeW4NE3Am4Ug1tO4jrczlvG5YG8rhWIOyXBonF
	J/Q4HdfdgCr2syavTwG+OyuOWyvL4aiTCsD4adibOscBYeU7Bdv+9Dbnm70HtEjzJbWqubRB+co
	hEPR1LPK01BlhLIlzQX4uj9CyPzQOVw==
X-Received: from wrux9.prod.google.com ([2002:a5d:6509:0:b0:46c:cc8e:4391])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3546:b0:493:2805:ae06 with SMTP id 5b1f17b1804b1-493b827cae2mr44265025e9.2.1782814878460;
 Tue, 30 Jun 2026 03:21:18 -0700 (PDT)
Date: Tue, 30 Jun 2026 10:20:53 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260630102058.3219867-2-sebastianene@google.com>
Subject: [PATCH v8 0/6] arm_ffa, KVM: Fix FF-A emad offset calculations
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
X-CRM114-CacheID: sfid-20260630_032121_275297_136E305B 
X-CRM114-Status: GOOD (  20.70  )
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
v6:
https://lore.kernel.org/all/20260527150236.1978655-1-smostafa@google.com/
v5:
https://lore.kernel.org/all/20260526151934.3783707-1-smostafa@google.com/
v4:
https://lore.kernel.org/all/20260520204948.2440882-1-smostafa@google.com/
v3:
https://lore.kernel.org/all/20260512124442.1899107-1-sebastianene@google.com/
v2:
https://lore.kernel.org/all/20260430160241.1934777-1-sebastianene@google.com/
v1: https://lore.kernel.org/all/ae9KN9nkOgDYJcGP@google.com/T/#t

*** BLURB HERE ***

Mostafa Saleh (3):
  firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
  KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
  KVM: arm64: Ensure FFA ranges are page aligned

Sebastian Ene (3):
  firmware: arm_ffa: Fix Endpoint Memory Access Descriptor offset
    calculation
  KVM: arm64: Validate the offset to the mem access descriptor
  KVM: arm64: Zero out the stack initialized data in the FFA handler

 arch/arm64/kvm/hyp/nvhe/ffa.c     | 45 +++++++++++++++++++++----------
 drivers/firmware/arm_ffa/driver.c | 25 +++++++++++------
 include/linux/arm_ffa.h           |  9 ++++++-
 3 files changed, 56 insertions(+), 23 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


