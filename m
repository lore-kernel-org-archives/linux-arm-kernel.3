Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AB5D41C20
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 10:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mu4tnUPCP3eMMJ7r4B7pF06/VroDz+dRR+cVn01z+uk=; b=mgDxBTgKLECAqPfLGIjIOVUn4W
	TqSlUTU8fC2OF0WPrQcZFlzpXWzoo5Ed/XWXwi9TPui4TluKz7WnsObZIHKcBP0m3kXV2zH4wnh55
	FNwSsnN0JohRJpL9fLJmkZ+QrY1W7Zx7nMvAAIy+iECcUkeJIV7S3RDBJ+ICkA2kQGW/EogLs+mJi
	Nv8qZvmN1NtZnRFCSjqv+qlIhhNIeIkyTHiKT/TBY77Ib7SGohc5TXFkzEUryuxy7yP4aZhfbEM1h
	4j+5FFccnOh43kT59eBZNJFI/Unln6vbk2tNYE8qe7rYdj+nTANwZdpo1i+rs77pFFEd83p03K6xi
	X29CqZog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCZ-0000000GUoS-1DaR;
	Thu, 11 Dec 2025 10:47:15 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCX-0000000GUnC-0EPF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 10:47:14 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477c49f273fso5914895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 02:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765450030; x=1766054830; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mu4tnUPCP3eMMJ7r4B7pF06/VroDz+dRR+cVn01z+uk=;
        b=ubxfHPk2DJ5Uj8pZENP74kl6ufddnTFn3h7BffAr+eTf1vI7GT2r2/eK4Z0YzC8HrY
         VOHoG8VHRI5jCbOfOiDIaDwKd02G42yDVKwHFsWkUkt73Z5gx/aqYPZLy3TT/9VL86sH
         tMhjnCk+UZ7gtB499cjXzNugIDuBogDlEHdD+DA+09OfgHA1/n/AB5Xx1U0cMLXHVFEX
         +btjgGgXfYbMi0eenf2iWHzlnOWCRu6e/UfaQLfHtTpNfB9xg/fjiGNMUkXBWKrYWEWi
         XPX3v+VkI4Qy0zmxr6EOqJrzFDK6ifs5K5uB56S8htrELDNOYjkGv3QDQjH55bytnmt0
         Wt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450030; x=1766054830;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mu4tnUPCP3eMMJ7r4B7pF06/VroDz+dRR+cVn01z+uk=;
        b=lp8WsZW8X2q+QxjhoC6s43gXe1thlrQszRxYprx1ueKsDpms+M5Ggwuv36VvT7Bqna
         8uDE6UoFpnNA5sfBiBdOxNGNsvzFPoWLbeQqG7WOHIFdjZuXZSYIeEaJ+AE51wqzzqZ8
         GmE4eklABw6IkJUAXdM6eyJaP9F0x2AczD5B90k5XJXLsskns5UKBqlN2N5e8IxBoV13
         eoHYTkUP41/IemLorAQ0wrCTTS3t9NUmQYjn+jn3NYC7a9qLiOm6mPt71yEadME8hTy3
         7zy9V9hCszoTEotuu8GKTcXNJgismI28a4eLga+4hPsrx+pBTq6z4Rw1dTWfVDXgX0Ut
         mgbg==
X-Forwarded-Encrypted: i=1; AJvYcCWITCYhALtLe+kyZORWrX+goDufPeFJe3wzGvbNY8evEjdbai9WAu8Pq994TLlkaFJcTfvLvPDwa26LQuIjPUTI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt6I6A7nRcJdqDcD228sIshTCsO1rtCpQQrzRUoZfZAoS7ShfN
	WqMPJxigZLWb4o2tqPKf4k42G8IJ9Njb8MTg/GWIEqEJ+M5A5zyV4mNOk2TgOneZFNsl/Wl86U9
	DcQ==
X-Google-Smtp-Source: AGHT+IHc1x4pEN8TyM6QeYpLvJgYc1keTk/0h7stJTpOa4NQXbSqrXLawJVqtiBF+zdbLMz7/t4wRg9Cpg==
X-Received: from wmpc20.prod.google.com ([2002:a05:600c:4a14:b0:477:9dee:b5d5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3512:b0:471:21:554a
 with SMTP id 5b1f17b1804b1-47a83814519mr52189595e9.13.1765450030559; Thu, 11
 Dec 2025 02:47:10 -0800 (PST)
Date: Thu, 11 Dec 2025 10:47:00 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211104710.151771-1-tabba@google.com>
Subject: [PATCH v6 0/9] KVM: arm64: Fixes for guest CPU feature trapping and enabling
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_024713_102126_BB8A73EA 
X-CRM114-Status: GOOD (  11.51  )
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

Hi,

This series contains several fixes for guest feature trapping and
enabling in pKVM, as well as a bit of tidying up.

Changes from v6 [1]:
- Fixes to the patch that tracks KVM IOCTLs and their associated KVM
  caps. Move static header data and function definitions to arm.c.
- Introduce a capability KVM_CAP_ARM_BASIC instead of KVM_CAP_CORE,
  since it is ARM-specific and that it only checks basic ARM ioctls.
- Tidying up code and commit messages.
- Based on Linux 6.18

Cheers,
/fuad

[1] https://lore.kernel.org/all/20251118103807.707500-1-tabba@google.com/

Fuad Tabba (9):
  KVM: arm64: Fix Trace Buffer trapping for protected VMs
  KVM: arm64: Fix Trace Buffer trap polarity for protected VMs
  KVM: arm64: Fix MTE flag initialization for protected VMs
  KVM: arm64: Introduce helper to calculate fault IPA offset
  KVM: arm64: Include VM type when checking VM capabilities in pKVM
  KVM: arm64: Do not allow KVM_CAP_ARM_MTE for any guest in pKVM
  KVM: arm64: Track KVM IOCTLs and their associated KVM caps
  KVM: arm64: Check whether a VM IOCTL is allowed in pKVM
  KVM: arm64: Prevent host from managing timer offsets for protected VMs

 arch/arm64/include/asm/kvm_arm.h         |  2 +
 arch/arm64/include/asm/kvm_host.h        |  2 +
 arch/arm64/include/asm/kvm_pkvm.h        | 33 ++++++++++++++--
 arch/arm64/kvm/arch_timer.c              | 18 ++++++---
 arch/arm64/kvm/arm.c                     | 49 +++++++++++++++++++++++-
 arch/arm64/kvm/hyp/nvhe/pkvm.c           | 18 ++++-----
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c |  2 +-
 arch/arm64/kvm/inject_fault.c            |  2 +-
 arch/arm64/kvm/mmu.c                     |  4 +-
 include/uapi/linux/kvm.h                 |  1 +
 10 files changed, 107 insertions(+), 24 deletions(-)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.52.0.223.gf5cc29aaa4-goog


