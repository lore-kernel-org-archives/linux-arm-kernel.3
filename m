Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3F1CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jTA/E6KagxCsXAcjrRnC+iKPqmNPE9H/PtvqQ3MoRHU=; b=SjZVSjk1IIHo5DiF/4AU4XeFFv
	8DW+IhlCtpj29vrtrLUO3sJmUMD2ar5+ucygO3KtfC3UZeO1l9jw72ZvwQLJm3aSmzmviCaKmWBcz
	2BbrUZ6EzdugC7cYJkmsOGEcsdGrSxGdfJaBLevGI8xsG7dxojjyB9QXaVsGdZ6pxuYkP3hW0OgsV
	LRjArVSuz6nP3F3B8CwQrOQ73UH0W0r7IBEXh+IP2FPAYbbcdOsG5zH1HlwUJxU6T6fmSyOhZl6TF
	RWILk61zgWJmvqwib5TF3SSUt4LFp7CdVIiYKoswy3qqXnonzKrhMukqnRNvclRM+vRbIGwV6zjat
	unwW1WaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdEC-00000002KE8-0vZA;
	Fri, 16 Oct 2026 08:23:48 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdE9-00000002KCr-2cp1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:23:47 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso48217925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 01:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792139023; x=1792743823; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jTA/E6KagxCsXAcjrRnC+iKPqmNPE9H/PtvqQ3MoRHU=;
        b=Kef6wS+KJRed8g87IZaswPvzNZKLqfcRwrZd26L2enA82QFIXc8/5xx/U3H9eSne7S
         7GerZ1hBklmGG3W4x7BxlbxAbe1ybDV/Ypd3xQVEchaHuFyYbeWpWaZjE6TtZZ58Fn1Q
         ZVFZj3bESng7opw8yHOarevVXmFVhksAONuZRJHaU8h5nm1aWbsPDQacmeIPWtPK96Gi
         oomEnNDbnGSuCDIXIBFvm9fH1m/+zhW93sC2SRl0YB+sJLQfWg5kcyilOvmyfYu3jMQo
         0Xb/+0zsreAhXhqkNo4j8F1CvWaJxnEpAofvqOofNiZYeT5TPp0KToh/NrMEOvuCo0I8
         E70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139023; x=1792743823;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTA/E6KagxCsXAcjrRnC+iKPqmNPE9H/PtvqQ3MoRHU=;
        b=EEmg8BRVhHaXrdz3Yqw+7dgCKhOheGsJiCKuqhIarjGZwbWa9LXVoVYz12+V8yZU2F
         1tEu9sok4H7PXaFYFlVbm9m7gakFMcLRxSN8R1fLiPiyBTnCU/pcgu8oeLAROw9qHvf8
         rxZPSUdZye49GRVIpz9Ra34GPruIjn7NkblNpL4DTKHLI+upfKt/n5TqQJ7n3Gq6R+06
         CfmMY/GAS9fSSiLqvQSUoNsgse/wBoj1BVncb/LtBILzsKr57UO4sG3sUNyuTyv3+Zoj
         L+sVWgXVYWMzMpakb149f7Dem0vUdaeNtxw+HYByQPWR56RK80pklzRHWBczppRkMVyT
         GxJA==
X-Forwarded-Encrypted: i=1; AKwUvBzgv8QVC8/TZP+0V2F1eVweyZ3o2C+M5H05vUIY0KwYSq3wHjFbiY6fmw0YUGyz/xjeqdKVuR5GMKkXTjlb5yuU@lists.infradead.org
X-Gm-Message-State: AFq9FYJ0kSqFeS7Fl2hHMXX8bJztcipKM2sc/Z9BnHbYQWK24UF1OM4j
	zETToeSTsPvhiaQNYIwz6dp+X34LvwNFHFU0cWfVOWdhWaLJzr6tY0Hn4a+DvxZ3YzTI2Asepte
	Qj00N8D83TJBqW0oTxb0L1YLBsg==
X-Received: from wmsz15.prod.google.com ([2002:a05:600c:c16f:b0:4a0:2a5:ce1a])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:310b:b0:4a1:813f:2a5b with SMTP id 5b1f17b1804b1-4a18e4a9da8mr407450355e9.14.1792139022921;
 Fri, 16 Oct 2026 01:23:42 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:23:39 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261016082341.4030770-1-snehalreddy@google.com>
Subject: [RFC PATCH v2 0/2] KVM: arm64: Support FFA_MEM_RECLAIM2 in host handler
From: Snehal Koukuntla <snehalreddy@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_012345_681686_394153BD 
X-CRM114-Status: GOOD (  10.07  )
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

The Arm Firmware Framework for Arm A-profile (FF-A) v1.3 ALP5
specification (DEN0140 rev J) [1] introduces the optional
FFA_MEM_RECLAIM2 (0xC4000091) ABI.

Reclaiming large memory regions with the existing FFA_MEM_RECLAIM ABI
can take significant time, or relies on a stateful time-slicing
mechanism in the Relayer. FFA_MEM_RECLAIM2 allows an Owner to reclaim
exclusive access to a subset of pages from a shared or lent memory
region by passing an array of constituent memory region descriptors in
its TX buffer along with a starting descriptor byte offset and initial
page index. The Relayer returns the number of 4K pages reclaimed in
that invocation without maintaining intermediate transaction state.

This series adds the FFA_MEM_RECLAIM2 function ID definition and
implements host proxy support in the pKVM nVHE FF-A handler, unsharing
the reclaimed pages in the host stage-2 page tables upon a successful
reclaim response from EL3/SPMD.

As the FF-A v1.3 specification is still at ALPHA, this series is
posted as an RFC and is not intended for merging until the
specification reaches BETA.

This series is based on kvmarm/next, as Patch 2 uses
ffa_check_unused_args_sbz() introduced in commit 3e9df0b0ebd5
("KVM: arm64: Enforce strict SBZ checks in the FF-A proxy").

Changes in v2:
- Mark as RFC until the FF-A v1.3 specification reaches BETA (Sudeep)
- Rename FFA_FN64_MEM_RECLAIM2 to FFA_MEM_RECLAIM2 (sashiko)
- Check total_pages against the sum of constituent pg_cnt (Vincent)
- Simplify the flags and offset alignment checks (Vincent)
- Rebase on latest kvmarm/next
- Link to v1: https://lore.kernel.org/r/20260921164748.2958578-1-snehalreddy@google.com

[1] https://support.arm.com/documentation/den0140/j

Snehal Koukuntla (2):
  firmware: arm_ffa: Add FFA_MEM_RECLAIM2 function ID
  KVM: arm64: Support FFA_MEM_RECLAIM2 in host handler

 arch/arm64/kvm/hyp/nvhe/ffa.c | 126 ++++++++++++++++++++++++++++++++++
 include/linux/arm_ffa.h       |   1 +
 2 files changed, 127 insertions(+)


base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.56.0.176.g3575e65682-goog


