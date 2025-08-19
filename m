Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFD9CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xSaurBdtkeatTy6B+DotbAZ9znHLVwGVjALlNHAHq3k=; b=u4wCC1+vGJSrAC5uobHnPzpmPu
	7NT84xy46w3heugtm1gyMbz8lD9Ljn2IMRVKObjG5s8IDmBhLYaIAafTKSt42s6I5kpL1EXppmhOp
	CrsnqAiMez/HBuNX0W7blkAh76FIAX26kjoJiBLzczBshCYrYXuCn70Y2TKbjt6lDjwhoBM+R57UU
	X6iI3WHHT1wApHBgS0Kt0yUXyhl5xgFlyro9OR7hIJOPnGlw2zOac7xhgSUjMKVkcflQL5eBH5/58
	fKG6iZCGw/nMfJGOkUiSJuvkgDcb+jWOKl/qRkxOsKFNznOfejTTPchOteOBif/1Zl1+SbnPIBTF6
	izRGo6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJRu-0000000A6v2-3ggj;
	Tue, 19 Aug 2025 10:20:14 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIKx-00000009tkD-3vWl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 09:09:01 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1ba17bbcso21890785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 02:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755594537; x=1756199337; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xSaurBdtkeatTy6B+DotbAZ9znHLVwGVjALlNHAHq3k=;
        b=VHnmCRUtgxDY0S1aC6Qx0fL1+jWQzDFUD3moAc+iuNvMHpRxSd8l+sjXUXLybuuJG9
         4kmZPFTj5U5Nxmm65Pz8KtQAy5Ya7pq9lbovlN7OMRQfyMC04T+9myun+XndST0VGe+L
         aWOaPV3a3o+Jo4Ii5/C0xv0Cr4kGEC4rKyNkTfN9vhIaSexSlBzuquEYI8xaxQ3+aT2W
         pkqWmDTrMKCzlp2uZK3SrnXm7XW/T/tu9fQuqCwOmgmcyRNdAxu+FdPG1Nw7jLOMTIP/
         Wy8mcsSFizaE5JRTka56ddrelzq5JQwGei+wP0aFzhO/7PHIA3iFHvNNTOhjR+XKUWCh
         Ok/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755594537; x=1756199337;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSaurBdtkeatTy6B+DotbAZ9znHLVwGVjALlNHAHq3k=;
        b=EM5ynZmoCUohfvMw1dNhN1VTSj750jUqCMV4O7PRxTyL1TQh1zDlgyQU05XmzNCQSj
         mdmw7fbCrIM3ty8R7NyhbAgaQHhGnuVdfBuSMgkqLc7CzhJHEd32sD0cLQu4K5NQPKTm
         nWLvpdeTXUKPZT3LK42MhadQ50u3pGKfyW+UoMcpA6F81su6YFx8yMXpCjYtXeGtusZZ
         ESNhBhJUiBhJlX4uD+LV0xlNAgpP6pWolpZSzxcJH7/LFmrrHOWXIZXuhl8dZagADMce
         R4Gh0nWllFSoZlq/r4i8NSbwJ/ZAE5qP8dL66RYNt84ix1tVZhLpOUOOycu8x4LM4p6+
         8i0Q==
X-Gm-Message-State: AOJu0YwEdzjRYtNkQjl6Gv4C0UF7bAtlp4iddKzy8Iv4wUeVa0SgBzxg
	1IJQ9NxM0k1lr63qIoo3giuJNfC/bOzkmwXLC4MVtqmc9W33cRVUMu0CsR6JWG01iH4ThVkhVpb
	BCK0vraq1w81sMlASAP4VMIDvabjRK3NKCS/mP2y6KxLz0lpEdvHAj7koe+P5vINNSdTdDSP88l
	DlSWiBf6WaCD+z4PjJ0xVJexx9zXrLHpSD+MEPKC2nytGEZI6Tsg==
X-Google-Smtp-Source: AGHT+IHFzh5SplXqAOBrKAfeyO99AyDuMMskBj43Avq17S+aAskX3w24CpOWJaJWAvu7y8AaSea+fSpu8Q==
X-Received: from wmqa2.prod.google.com ([2002:a05:600c:3482:b0:458:bdde:5c9b])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ecd:b0:459:e35e:a90d
 with SMTP id 5b1f17b1804b1-45b43e0bf28mr11429015e9.27.1755594537022; Tue, 19
 Aug 2025 02:08:57 -0700 (PDT)
Date: Tue, 19 Aug 2025 09:08:49 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc1.193.gad69d77794-goog
Message-ID: <20250819090853.3988626-1-keirf@google.com>
Subject: [PATCH v3 0/4] KVM: Speed up MMIO registrations
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_020859_974382_455A309B 
X-CRM114-Status: UNSURE (   8.15  )
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

This is version 3 of the patches I previously posted here:

 https://lore.kernel.org/all/20250716110737.2513665-1-keirf@google.com/

Changes since v2:

 * Rebased to v6.17-rc2

Keir Fraser (4):
  KVM: arm64: vgic-init: Remove vgic_ready() macro
  KVM: arm64: vgic: Explicitly implement vgic_dist::ready ordering
  KVM: Implement barriers before accessing kvm->buses[] on SRCU read
    paths
  KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()

 arch/arm64/kvm/vgic/vgic-init.c | 14 +++--------
 arch/x86/kvm/vmx/vmx.c          |  7 ++++++
 include/kvm/arm_vgic.h          |  1 -
 include/linux/kvm_host.h        | 11 ++++++---
 virt/kvm/kvm_main.c             | 43 +++++++++++++++++++++++++++------
 5 files changed, 53 insertions(+), 23 deletions(-)

-- 
2.51.0.rc1.193.gad69d77794-goog


