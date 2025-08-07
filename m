Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28099C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 12:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NJvDev6JiarMJWMxcbrKmT0EeRzHRecrSUf9b1TXS7Y=; b=yR/lfHauo59uEsnmP3Ij8LzNTy
	xk3tFnXdRkOxOS1gu6ZoV6XXGK96jro0d3kEb/vse7ATBHfAJsSnks2NvfD4q4IpyFP/VzZpXtCvb
	RpEFP9DdGpKhhZvA/vBj3oGZuby43XenslN86xkytcHJfdoqCIULbs6gIFlpPevKj6eJbqPc1HoSe
	J3refBBTXjgQcYNlm6oCcY8u83arMUPpUc6OyfWR2eKGTF1fCbS/NIrp6n+qG5dQX3hQDfXfI2tQK
	sv8F3i0nLOaxN01sXxoikcBzNJTJK+EdBuJn5NwJvyOi8RPDRIeMiS5r09GudynvX5eLNsQ00YCpf
	yyv56oOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzLu-00000000T3D-24g3;
	Thu, 07 Aug 2025 12:04:10 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzJP-00000000Snj-44tR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 12:01:37 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-459e6c564fdso4075655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 05:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754568094; x=1755172894; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NJvDev6JiarMJWMxcbrKmT0EeRzHRecrSUf9b1TXS7Y=;
        b=E2hsuxrZ3WqeSiFs/R+dzNp19g0wUUO/p1gIs/OAmpFwrhJIxdIVY++g4PGke/amjX
         vbZatfWHjq54sQh90mvFVVUh3Zge+P7+mpJAtTRm7qIWIiEyQ0mxx3LyeIYOTl6Nms4t
         RQ00MwjKgN6wkP0fo8xtMfT8eAKsWi4MImq2CoaFDfev25aCxYQ/0lSCGzubVpRYZunG
         nQF7ZwymhGwBfNiS196I1DmzDQ5H/DprzxQNYwC5KrxphXtsgqWsK/vmvVL6arViw+18
         pJzX6QVJsuZgG1e5BKwc4P2VRqF830hIGBDyeuMa8V7WU7+VKgghzWV338B7gOmpmMzk
         VU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754568094; x=1755172894;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJvDev6JiarMJWMxcbrKmT0EeRzHRecrSUf9b1TXS7Y=;
        b=TGbcus7eNur3HEnivhDzZPFY0UaDEBuho4i+zg+1uGGn/NfCtzqWBXIigYmF/BLKWM
         MfQpbiO6qojE2sNv2w5O5unOLbOelKOc45xcRM3PDYsx4zetCk0PAbLZKAC4Tp7t5MUv
         xagEG6l7UYkCrZK+jIMybrM5KtZFEapUeCyQfSGXFO27ticHDVOQ3k+CiJjUDJdlZBpu
         a1Uekmppb472feeGUy+YmcBesUELc9KhUpOv+Fpfjxrx9A9OUhh/np8F62fQooxogyOc
         GoZK1VWjEj5VW0KU1/B1GcXC2/OLr3Y+zkzn6Q/GEX5ZLWuEzxVQnRQeEHsmgXiTQsWI
         ALVA==
X-Forwarded-Encrypted: i=1; AJvYcCUcARGCQ8xPPd4Wbqj+GEIaylxpx27CvJEHRL2HAziFmCIFX7x1BifRdKRw6yHYh7KwnjnPFy/rakHGoGBzZ+/N@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6RlKV6Pe37BGki08BFJzfyBnHliNhsHE2rLneuGLnXke1kXCI
	tq/jPH1jkr/AT69FZiYLQGoC3rBBlO/UeisSHhR1zGRLhifeDbFPqeuvLRpfAmcBCgfGZ+cjcJ1
	c2w==
X-Google-Smtp-Source: AGHT+IF1zofXBCVZFK4r7lqTfARStajWiSiUpki2EYDcpjB2YB3WeHi7UsQXh6wQgWjdJzGmiZaDkDz8vw==
X-Received: from wmbdr26.prod.google.com ([2002:a05:600c:609a:b0:459:df20:248e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c0c3:20b0:456:2698:d4d9
 with SMTP id 5b1f17b1804b1-459e73a9797mr46541875e9.3.1754568094066; Thu, 07
 Aug 2025 05:01:34 -0700 (PDT)
Date: Thu,  7 Aug 2025 13:01:30 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250807120133.871892-1-tabba@google.com>
Subject: [PATCH v2 0/3] KVM: arm64: Fixes to handling of restricted registers
 for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_050136_011710_AA6F6700 
X-CRM114-Status: GOOD (  12.04  )
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

This patch series mainly fixes issues we've encountered in pKVM (in
downstream Android code), related to the handling of protected VM access
to restricted registers and injecting undefined exceptions into a
protected guest.

The last patch in this series isn't pKVM specific, but a fix to the
vgic-v2 code encountered while fixing the issues in this series. The
issue it fixes was indirectly introduced into the code with hVHE.

Changes from v1 [1]:
- Dropped the refactoring patch.
- Added Reported-by tags.

Based on Linux 6.16.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20250805135617.831971-1-tabba@google.com/

Fuad Tabba (3):
  KVM: arm64: Handle AIDR_EL1 and REVIDR_EL1 in host for protected VMs
  KVM: arm64: Sync protected guest VBAR_EL1 on injecting an undef
    exception
  arm64: vgic-v2: Fix guest endianness check in hVHE mode

 arch/arm64/kvm/hyp/nvhe/sys_regs.c       | 5 +++++
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)


base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
-- 
2.50.1.565.gc32cd1483b-goog


