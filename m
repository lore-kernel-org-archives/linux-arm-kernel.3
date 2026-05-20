Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7A2CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 20:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pLV0D8OV4jhyDEJovr2ZsBSnuczUGhYNsjjzP+Stc4o=; b=zkrT6gb9H7E8SWRVR/buL57C5+
	VqdGnAJgr4eQex5xwjxw+H5MTNkuUJc2ex0VJhRWkyNhSLXCYhKbnpoHXOR+CLdGULmxlf4OpZNZr
	eIIVBTaHz3B+7xkCiOqj0EvvPypqlYZzcdRcOe0AixfE56LvYh+Dq8mbEpE+tMDtpGMtEsHaHTQ06
	/2knFwTmOKDde10YCEjkj6cJM7k9bOlDbbxKPmVqI4HXgoPHLmTXz2D5bZM0bEvxazkwvm7o8En7D
	uJgO+f5W4RLbxZL9T3GkhijhiLm+7a7Iz+UM/jhx5KjSevyf/2o1krIhJ0uYL7rSvAhknrJkZ7koB
	LelWBQMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnra-00000005lHf-0IaT;
	Wed, 20 May 2026 20:49:58 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnrX-00000005lGO-25Md
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 20:49:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48feb0298d7so42053995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 13:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779310193; x=1779914993; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pLV0D8OV4jhyDEJovr2ZsBSnuczUGhYNsjjzP+Stc4o=;
        b=s1rGtqQCFp4iFKTsPzDMmJE4Uy+yGB6aUfQ49zOTKmFomrX2yRgXN80FZtymQ2uPRR
         G37D+7w/GoWdIbd2IpwYdYl8EcIy5xDCNkf1NuVEq9D/gxjB7VckJud8+9S8xh8JfKkt
         zkKkVwkNu85NQeqkCYWV0P391kkmh2GMqMzJvmwxIBWlS9MWp+x08P1Wxxc+uyiGnzlt
         XE52CAjbFQyeVGTQoBDheO9gmn2JlBeH0l6OItJihOgOMPD2FdMo960q2viiY6lr7cZv
         qOtHQcm/MIJmSZAW2cbT4M3dsCBUkTBuFmZK0VUuVa7Eyj1g2xoI+PTK5+gUl6G2/xwR
         86wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779310193; x=1779914993;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLV0D8OV4jhyDEJovr2ZsBSnuczUGhYNsjjzP+Stc4o=;
        b=ZXItQJv7olzuH4Eect1zE6z1EUfbqCL74vOjRNjgfNcvK3oacCc65hmFKYyyKYNbcf
         VFFRqSS0plxHM1wbhvmsqhc/gSotjoi46uAd3s9iX7ALkB9VhOjEgmffr9qA5YzMUnqK
         +qG2qI9t/JA6jQ39nAsRP4lO+n2FOjCac38xgvHYGCuQfLAeHeZkrUM7mQuxghISDI+X
         dwNo4jEqKDq0AZW9ArMaklydYnTG87h0d188yjhR9fzQeOPfvlSKeYd/F2b5j+pnZmoz
         DyGkNequz3+5/7LWEAWn/jeXqd9yyO62irXaD27b4Y28lK5pzzgSMtJeKG1VzddtHUf5
         Yu1A==
X-Forwarded-Encrypted: i=1; AFNElJ9UQahBXElKn+s1ejvqfm7Naq3Nr+Hd6mJPxqHbfQ+KhbZNxDAC/2v1amRqdJxaF3LGZa06tvAMyFyM7SomoHvf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc3MUK9vGXIqM+LSTWmhnFjYamlw4BX08mh26UT+/Abla8sclB
	aQVqt1Row8W0syXhbA6RmgyfLLZRvyMeOoCHlW0dsErgUwtU8r8JTkKi51RKqCLiRowu5aWRcba
	6h/kPFKSKv5smjw==
X-Received: from wruh9.prod.google.com ([2002:a5d:6889:0:b0:444:bd72:fec6])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:138f:b0:488:ae6c:42c6 with SMTP id 5b1f17b1804b1-48ff4f4f44dmr311573965e9.14.1779310192858;
 Wed, 20 May 2026 13:49:52 -0700 (PDT)
Date: Wed, 20 May 2026 20:49:43 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.669.g59709faab0-goog
Message-ID: <20260520204948.2440882-1-smostafa@google.com>
Subject: [PATCH v4 0/5] arm_ffa, KVM: Fix FF-A emad offset calculations
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_134955_549405_6F4775C2 
X-CRM114-Status: GOOD (  14.46  )
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
1. Updating the core `arm_ffa` firmware driver to correctly calculate the descriptor
   offset using `ep_mem_offset` rather than defaulting to `sizeof(struct ffa_mem_region)`.
   It also introduces bounds checking against `max_fragsize`.
2. Enhancing the pKVM hypervisor validation logic to no longer strictly enforce that
   the descriptor strictly follows the header, aligning it with the driver behavior
   and the FF-A specification, while also ensuring the offset falls within the mailbox
   buffer bounds.

While addressing these bugs, Sashiko uncovered other issues that were
fixed in the same series.

Changelog
#########
v3 -> v4:
- Address review comments and fix Sashiko bugs

v2 -> v3:
- Fixed typo in nvhe/ffa.c (missing sizeof)

v1 -> v2:
- For pKVM, removed the strict placement enforcement for `ep_mem_offset` as it is not
  compliant with the spec, and avoids making assumptions about the driver's memory
  layout.

Link to:
########
v3: https://lore.kernel.org/all/20260512124442.1899107-1-sebastianene@google.com/
v2: https://lore.kernel.org/all/20260430160241.1934777-1-sebastianene@google.com/
v1: https://lore.kernel.org/all/ae9KN9nkOgDYJcGP@google.com/T/#t

Mostafa Saleh (3):
  optee: ffa: Add NULL check in optee_ffa_lend_protmem
  firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
  KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()

Sebastian Ene (2):
  firmware: arm_ffa: Fix Endpoint Memory Access Descriptor offset
    calculation
  KVM: arm64: Validate the offset to the mem access descriptor

 arch/arm64/kvm/hyp/nvhe/ffa.c     | 30 +++++++++++++++++++++++-------
 drivers/firmware/arm_ffa/driver.c | 21 +++++++++++++--------
 drivers/tee/optee/ffa_abi.c       |  3 +++
 include/linux/arm_ffa.h           |  2 +-
 4 files changed, 40 insertions(+), 16 deletions(-)

-- 
2.54.0.669.g59709faab0-goog


