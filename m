Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF15CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9eas+8o5MH+y6MgYV1i/0RO9VKyND+KUg4XjJ1gtWmA=; b=PnlPwDceDqW/fsucrzxPTyD0m6
	zZPOJ6kt8q/Lxr6fx39GkN/azT0EejNBbz/JBkWNpXnkp1TK/XyYD2bhHjrpbyGezeMrPP17cqYA8
	2cS9177V+frMtkMPdDpbIi6JHuwPFB+lhAGXL6iU2H8H1fMJasmI5mPnDmEC64fpDH5FUO5oGk+fy
	f5Th90vpdGNTwF6BWYjvHt/PBy/Uu3pjWr6uJW+cZrqlmg1GXccDK38oyBctGXlv4G8fQrEwpPx+T
	oz86gEPO6qTwrdsAiOM9UxrJlj0Lle+Dto0DBJqnjs5Iof8R7bfsGlRLOmTWcz4ImrqIbFg+TYANp
	dsMQofQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyWj-000000075W5-0rf6;
	Thu, 21 May 2026 08:13:09 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyWh-000000075UG-0RKJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 08:13:08 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-447f2ce5556so4634125f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 01:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779351185; x=1779955985; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9eas+8o5MH+y6MgYV1i/0RO9VKyND+KUg4XjJ1gtWmA=;
        b=Bww2VNGbR2J2nmcuap2cb+EXUYdIuOIyEBIVRAIyPAYaLhN7b+OsgV733M/L7hgdy3
         lKNoiKNt0QAmjDMeChcFD7SmhZ5KBiQwF3dEnDG4+GbDDX+o23ftYRHONKAzJGzaDO9g
         VgR0BIRCqeNZhe53PjuVRQWrBSuJuSxdim3YCAV2N/0e/gkhqvsNs8O2oFh9KKstg4rV
         i0gYcjoKVaOmTGZzwkqFaJPrvgJ4t+xFQcEaSYeB3POk33NyZqFiXSE+4Q8RuWWq2/5C
         cwTJ6Ybspa2fFblbA5ZjyIBykYaxXll+uOc79ebG9P3v37Z8z2VsTkIeD29kTVXgdQdI
         itkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351185; x=1779955985;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9eas+8o5MH+y6MgYV1i/0RO9VKyND+KUg4XjJ1gtWmA=;
        b=mTf91zvUDu7mU20lIATsLYRBKGY5ORaEp6aUxUQ1FDJw/f5GlObpLlwJuXW2gc6i6U
         8hESZin8gYJ5pGiyuhNt+8TJDNh3irImtsKDR2B4U5t5Q7e8oH1atkmoUVo3Hs3bIxXV
         1vxAE4PFfD4cTEl/nlVE9LjCXFCm4ah/vXkoEyo46hunjgYv6lGur7ivrGAJLazh6j1s
         fA+YrDQLbE35YlNFoTriQhPBvbkPH7QWJ33R1vM0KAh0oqCTP9qIB95Xj2ipuCJ4VFkN
         3CisGi3pQIn5MeK+HfG/LqjurIjGtiL/Rc185WMyoTddHoEElIi4CAmeZSEnTpKZQHoS
         nqqQ==
X-Gm-Message-State: AOJu0Yy9jQlvviAASzmXFKJq8yKsUFNFaw66/icoiy1s7zfN4H5Z3RQj
	URVEggH2fTenEMkTNkwXZ41as/BY19jcqph/0PAFBdK+iwSD0kzQok2KMesrWT+1Loq8ej281pt
	4yeVIA16WDTzCkAoghww4RA==
X-Received: from wrsx14.prod.google.com ([2002:adf:ffce:0:b0:44f:1ecc:c03f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:601:b0:45e:7418:a3f2 with SMTP id ffacd0b85a97d-45ea38ea8fdmr2814379f8f.26.1779351184592;
 Thu, 21 May 2026 01:13:04 -0700 (PDT)
Date: Thu, 21 May 2026 09:12:48 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521081250.655226-1-vdonnefort@google.com>
Subject: [PATCH 0/2] Fix __pkvm_init_vm error path
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_011307_184550_E2E78928 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
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

Sashiko reported a potential refcount leak in the unlikely case where
insert_vm_table_entry fails.

While at it, I have added a fail-safe to __pkvm_hyp_donate_host to ensure this
function doesn't allow leaking refcounted pages.

Vincent Donnefort (2):
  KVM: arm64: Fix __pkvm_init_vm error path
  KVM: arm64: Add fail-safe for refcounted pages in
    __pkvm_hyp_donate_host

 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 33 ++++++++++++++-----
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  4 ++-
 3 files changed, 29 insertions(+), 9 deletions(-)


base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.54.0.746.g67dd491aae-goog


