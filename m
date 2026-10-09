Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F14FCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 08:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fAupYzt0RrKa5+FFuATrgv7+Shai6Gp5gi3ntJd9iuk=; b=E1ewpYnoOTjWpdYDnskJitx0MY
	1OtKHvsH/tDmOsYzIyc4wQopGZOWCJIeRyUgSmkY7TkNJQX83zwtkDN3bFwJgfgDmdPkXa4Wrs+40
	mmhiSbtiZjR82J4dzqXKvPBXPQuL5BNmJYLtorwlu2ijOPjQd/YJGKpFwQfFXHiwONgFHI2Z7alq3
	5QgLVLWb2B8nWBoGtlWfeuCuU+xFQpd4DCJXcu6+xNNapG5QtkZ/UNweZdUp3lGxOVHIiiSxhNhhz
	13MugYy9Ymc/LoAT1EanLdvBjNaag74vvd7ec1HsAkw5llSMBp/KLghDCixbjY9frQPetYYVYx1i5
	F3Jst2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6Eg-00000005qhJ-2zmr;
	Fri, 09 Oct 2026 08:45:50 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6Ee-00000005qfN-3kYC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 08:45:50 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a0761224e1so56414765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 01:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791535546; x=1792140346; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fAupYzt0RrKa5+FFuATrgv7+Shai6Gp5gi3ntJd9iuk=;
        b=mZaidWorQgnjwUfrolkgaSezgMY/Lvxp88yneZbcNowYNt/XS5edY3ehmfy+3UP4Kn
         AkeOlW06yxlvJ5nOqAP3zXa2C9ovZqS4vYmPAonZV7E69/aIhXOb3jMLIn4kuWAN2hVH
         hZCRAtexQp2AnyQhVM0BtOspKYY5x7PS3fpn/wYXdA9MW5rkeDpfQzkO7vX9AxOMIphG
         qs0RXEn+IU3wP8ADrfp077tJd8tVg7RHemlEnJWpxo/cdk4AUc0AVIzqGl8ObhHj2wLR
         HERyxEElN+7meb1kw5N4PsSRhSN4+vb2rSDhHa9BeRt1LaCZfRJbDu8PMarp9ChgWqhp
         DRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535546; x=1792140346;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAupYzt0RrKa5+FFuATrgv7+Shai6Gp5gi3ntJd9iuk=;
        b=Se4t9HCpGdIejq7DQCPJWMjjBAz07ARXbhMyEpO8Q1O9tqq1SL2sdPFj426svlBHfd
         x91clQ+/XLW31Np+AxHn1LRaxR2IIjHMCv8k3ZhBRCMfLGH9dWKLbUxWdoyAV8eFNBhj
         hwbCCDZgwJ+wvFuPJKApUueTMczkB7q1WWqrDa9jTUZ43Lvos4Z4kehXY+luZQBMBsIA
         UdXyMJicZVw6ZE+Mw3j3Oux6qNS8Dsp467YBrJPe1K1nE7q6CgwuK4sw8XcwrJGQ48FX
         j7o+1xLHxweTkiOR18yFQ8Tyh6gegfSDF7kgG61Ydt9ynaqIsxcAaw7vBi9jsoNfNcFe
         LMGA==
X-Forwarded-Encrypted: i=1; AKwUvBz5hEjR5xyy2pMvn622sMB5x2reNClROzmYp1lIA5n+L+rxqBzuEucY2KQKgFwZfx8MNivslfwIxbBvB+nztDv2@lists.infradead.org
X-Gm-Message-State: AFuF++lP+pRKHM2HvO4JjSfvEiJGlUkte5xKdHT8LS4W5Bk9mUGTIu3o
	kcsQWLpr0atdBrP+ftcbp2z7BN2VM17BTpDldoxv3OWUbX1+Cb0YeY8pmAKp52JyRyoCjifIkWR
	lKGBJ1eR9lVrv8vH2EK6KRQ==
X-Received: from wmpo4.prod.google.com ([2002:a05:600c:3384:b0:4a1:8075:39c4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e07:b0:4a1:8627:aec7 with SMTP id 5b1f17b1804b1-4a18e4987abmr19126105e9.5.1791535546036;
 Fri, 09 Oct 2026 01:45:46 -0700 (PDT)
Date: Fri,  9 Oct 2026 09:45:26 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261009084529.462577-1-vdonnefort@google.com>
Subject: [PATCH v1 0/3] KVM: arm64: pkvm: Extend hypervisor entering tracing reasons
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_014548_940967_4B1B0867 
X-CRM114-Status: UNSURE (   9.16  )
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

This series make the hyp_enter event more detailed by adding a "from="
field and by using the ESR class when relevant. This is interesting for
example to know when the guest has exited for an HVC.

Speaking of HVCs, protected VMs issue an HVC to share memory with the
host. Without this memory sharing, impossible to get logs. So if for any
reason it fails, debugging is quite cumbersome. Add a specific guest_hvc
event that will give even more details than hyp_enter provides.

Also, add a host_hvc event, so that the host gets similar coverage a
protected VM does.

Vincent Donnefort (3):
  KVM: arm64: Add ESR class to the hyp_enter hyp event
  KVM: arm64: Add guest_hvc hyp event
  KVM: arm64: Add host_hvc hyp event

 arch/arm64/include/asm/kvm_hypevents.h | 50 ++++++++++++++++++++-----
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  9 ++---
 arch/arm64/kvm/hyp/nvhe/pkvm.c         |  7 +++-
 arch/arm64/kvm/hyp/nvhe/psci-relay.c   |  2 +-
 arch/arm64/kvm/hyp/nvhe/switch.c       |  6 ++-
 arch/arm64/kvm/hyp_trace.c             | 52 ++++++++++++++++++++------
 6 files changed, 96 insertions(+), 30 deletions(-)


base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.56.0.385.gd3acb90ef8-goog


