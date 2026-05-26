Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43771CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lrWlfTK5Lutt6aW80bi7cx4j7i0TUVnce7pHBOYoWwo=; b=NKTaPlqiwLv5WJvsfZZGY/jkqv
	sNKeuvYnujX4jTonw3ksHO/I/FmhC/w322iDwoQzmngmgpuuF0b6xWJQ6wbRU9ugCDhDFrmZzBmek
	/CjXWRQIR898Zcntx8REE4A1GlPPW0CWSedqZugNloOdeQisLS1T9xjaB8JGE6xqMk/wXo4YnQfBt
	cw1JvwYBLWlyIFf0fY6b4ObvJajjvtzlS/n5Gx4isSLS0tG3105iHhYoYnLm4jvcioSe3HpNdKacI
	vVlJRdCAxENhuJ3Yr43Ud+4RgvzMJIT+OlB3ZhqRc837T3ABlfFnmOv/FKQoot2E60FEyYZrKZP+x
	13v4q6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZO-00000002LXU-0kdC;
	Tue, 26 May 2026 15:19:50 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZL-00000002LVj-24UB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:19:48 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fe44ce385so83260125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 08:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779808785; x=1780413585; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lrWlfTK5Lutt6aW80bi7cx4j7i0TUVnce7pHBOYoWwo=;
        b=fooSfYQ6DfO7amoEWO584PoHvMUel0ULyGlrfgxq3DnuxkjTfwHBEqfrkXBSh7fVxR
         o6b0MoFi8Rb60F+zccpdhOpK5W2aY/nHvShjOv2fIZ8x9pMik7SMqcEsBMjRgOnGFxEO
         jGxMWQSYnJSn9RogRP/ee2N41V9AR6t6v8p6/2BNAE1vkZ35VhiDycds27zUyF8CfHFD
         Ul2yrqiMi2QWdeYYmBOETvHuNT3X5/9OdwGZlf13RnBwqjEs6z7w/vkJu2Nx4+Y4RsFy
         fABAV3JcfY8iWBJsRxIP4KUkFgjlvYBLYRi+E+WZKJigq8psMo9nYsx+fvvo2ZK0jIcT
         s0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779808785; x=1780413585;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lrWlfTK5Lutt6aW80bi7cx4j7i0TUVnce7pHBOYoWwo=;
        b=AjAKJf4/kFF8D0AvLOnQjPfljADfoq3l5kwoETQJsmInJJg3qk9Xul+94XOmf1oZ7k
         BkmBcjZuBR2uQsWa8tYYZVn5cm45rTNJ3g73arJg+RtrzKISCot/qz+DKwPa+rb+7xkq
         pHx1nWZwWbwAEr8XnbSMxiAawV73Nv5rj+dRZ61K6WWDollMECDuLhLDkau58TTb7r2s
         zPR8HZYOaFa5Kyxv/OQE0gCSnIuCIzdDe+5DmPD5vDcK3DRuVzu2WyseQprIPRzEgoo8
         6m9c5EvwOrhdFgoJ1zPZBU1ID1EnN9IQgQRytvOhJ8Az8+QNeVmynhIexkIphOLJLzca
         e74A==
X-Forwarded-Encrypted: i=1; AFNElJ8Gb1Laod/2hTTiqms0AxgMc6aCJt9i7qqYUXwiC2WWEsq7RbHMDP4zp9yxm15w8Ibcqy/kXoPEWF9LtD8jPAXL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1Jx35tLRZYI9Q1Ri1olJAnJ/k/aZL+Rj/RG7fU1dl3Xbjzx9V
	57b/TBfz/ddGD6rQu4BsqV08fYWwctcAcOX9X7Slg21fIqG4MW3g8juD3uUDrzIj4xgwFSHOPFv
	bLjFVBa0Tr6WUjQ==
X-Received: from wmbem24.prod.google.com ([2002:a05:600c:8218:b0:490:51ba:4f8])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4511:b0:490:6869:46c3 with SMTP id 5b1f17b1804b1-490686947bemr126353045e9.30.1779808784404;
 Tue, 26 May 2026 08:19:44 -0700 (PDT)
Date: Tue, 26 May 2026 15:19:28 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526151934.3783707-1-smostafa@google.com>
Subject: [PATCH v5 0/6] arm_ffa, KVM: Fix FF-A emad offset calculations
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_081947_553434_615474FC 
X-CRM114-Status: GOOD (  15.87  )
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
- For pKVM, removed the strict placement enforcement for `ep_mem_offset` as it is not
  compliant with the spec, and avoids making assumptions about the driver's memory
  layout.

Link to:
########
v4: https://lore.kernel.org/all/20260520204948.2440882-1-smostafa@google.com/
v3: https://lore.kernel.org/all/20260512124442.1899107-1-sebastianene@google.com/
v2: https://lore.kernel.org/all/20260430160241.1934777-1-sebastianene@google.com/
v1: https://lore.kernel.org/all/ae9KN9nkOgDYJcGP@google.com/T/#t


Mostafa Saleh (4):
  optee: ffa: Add NULL check in optee_ffa_lend_protmem
  firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
  KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
  KVM: arm64: Ensure FFA ranges are page aligned

Sebastian Ene (2):
  firmware: arm_ffa: Fix Endpoint Memory Access Descriptor offset
    calculation
  KVM: arm64: Validate the offset to the mem access descriptor

 arch/arm64/kvm/hyp/nvhe/ffa.c     | 38 ++++++++++++++++++++++---------
 drivers/firmware/arm_ffa/driver.c | 21 ++++++++++-------
 drivers/tee/optee/ffa_abi.c       |  3 +++
 include/linux/arm_ffa.h           |  2 +-
 4 files changed, 44 insertions(+), 20 deletions(-)

-- 
2.54.0.746.g67dd491aae-goog


