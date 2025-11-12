Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE21CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQotLZ7bYQhnw+F+e2EgZGDV56Lv1I3QeSzBHAS6ry4=; b=B+JmPNFcSwNmqC8A5ndPRXUoQl
	w6AoWtiRL8BMZ/8b+SKR16/Ifjp3SYUs6P7MzgepZw62YWgYobLCbgpghtdBwyImERo2K03uFzPln
	FOlvBr3QMUv3IIAxXKQWfQgshnbJyCQgioJALRb+Dj7cEEsdubCu6Vv79aHR5k5jaNN4cLXLucyB2
	IsZckIfQfivuK6Z1T/0tzBuUhv4cfkUlQiGSIKHc2KN22Ht1eVzqBoSAuI9T/BgXvJ8fKuGkgbO9Y
	upGKRs9yDbVe+hCg/g7L2Fr/PMHKU9RvGwVY54Ni0QtBMjGtu12kSOfhLlce25lhqvAkpY249Ub1M
	CNLAcPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ72C-00000008Rqf-1q53;
	Wed, 12 Nov 2025 09:21:00 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ727-00000008Rnh-3ztL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:20:57 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4710d174c31so5254555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 01:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762939254; x=1763544054; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQotLZ7bYQhnw+F+e2EgZGDV56Lv1I3QeSzBHAS6ry4=;
        b=C7znL1x7485TmZXf2eIA7yPRg7L6pVKJ7dBSp+Bp0rkBqaPESUdHGRVSGekRczf/YH
         fVcnOaDyg4bNebnzTebUlVdqJcqtEBviXTziq/f7oRBiOHBOcNjVik41BUTrT88xKluV
         FDZezFDApEx5+CIs5qpCxQiZlagz+qMl1kD/U7c6/QGmhakkUJ50FMZcp+/YXgKfZf7t
         tOcP5Q0irjmzfjCTW4+3JgTCYg//Ro1LG+yBRhIZ8xk4nKTpHytI2Y4850nQtv71DqC4
         GiVL9LwrWnD4sFphEcyxxqn52Kj2z04Xt4mg4bqrK12+o3Vu7ZuR8JoTD2jNN82s5k2O
         vMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939254; x=1763544054;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQotLZ7bYQhnw+F+e2EgZGDV56Lv1I3QeSzBHAS6ry4=;
        b=luoc42mm3gp7dR+8v2kmnn6IeGWZtooOf0RxX9bQMQRU4VFVYfK+Wd6rhtDZpiYFV/
         NP3xOfAPyvyNmotG7Uc1SYvKzmPTpmASnMKxZmctI3hQJ3IO348nx7v67uWovJcJJYdH
         KS0xobodYkngHtW6Bep6+/9tSDNiKl4D0vkovSkBln6PotcZ8O2M5Yv9Ul+E+Hsl1gzL
         755kRDf78GvgRI9qWUWR+n/3tbMJDREWjOSBuGnRGApOiZuQyzieXp/HZP7DLQEDtpO5
         C7eXz7qj9Z5D/As3qAQbf8d0o/s5J86haAWmEPFO6QSrR06SMT4hpYiqFfDMVBNRT5xY
         V64w==
X-Forwarded-Encrypted: i=1; AJvYcCU+BWJSeq+6MmIFPsgLSMqQfB9KG4Nx4cVCEL53QRW4mEyhqoAw7sBxYVwkeI5WRdFgADqt3OL30Y6mTyisHNsG@lists.infradead.org
X-Gm-Message-State: AOJu0YyVLJP2w2SOe0PJkBjpcJcfeTGLgV7TVUz7I8MRhYCW1K6fgQya
	sPQlW4cLlAanhl8vP3oIAby48MQoYc6pDzxyAgBYbHL1v/ThNd1nV6KJlCEQkQGfhYX26wV5JY7
	Wkw==
X-Google-Smtp-Source: AGHT+IEdhQH8jlroYKYvxsaYTlWqQTwHspf9KNTFXBGWy9dvL6TNub1QcuZfnvQ1vjy2EWftQq8lAjgPlA==
X-Received: from wmqu15.prod.google.com ([2002:a05:600c:19cf:b0:477:1022:3342])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4583:b0:477:54cd:200e
 with SMTP id 5b1f17b1804b1-477870718c2mr21893365e9.1.1762939253822; Wed, 12
 Nov 2025 01:20:53 -0800 (PST)
Date: Wed, 12 Nov 2025 09:20:45 +0000
In-Reply-To: <20251112092051.1376245-1-tabba@google.com>
Mime-Version: 1.0
References: <20251112092051.1376245-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112092051.1376245-3-tabba@google.com>
Subject: [PATCH v4 2/8] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_012055_991115_19599815 
X-CRM114-Status: GOOD (  12.90  )
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

The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
register accesses. These accesses are trapped to EL2 when the bits are
clear.

The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
had the polarity inverted. When a guest did not support the Trace Buffer
feature, the code was setting E2TB. This incorrectly disabled the trap,
potentially allowing a protected guest to access registers for a feature
it was not given.

Fix this by inverting the operation.

Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 8d06a246dfd1..f6f8996c4f97 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
 		val |= MDCR_EL2_TTRF;
 
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
-		val |= MDCR_EL2_E2TB_MASK;
+		val &= ~MDCR_EL2_E2TB_MASK;
 
 	/* Trap Debug Communications Channel registers */
 	if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, FGT, IMP))
-- 
2.51.2.1041.gc1ab5b90ca-goog


