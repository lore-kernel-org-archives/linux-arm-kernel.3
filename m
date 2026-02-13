Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2523DEDF16E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UUp+ZPHGqL5Ruf8kk7PuU1fhAJIx8L0ts8JU7bSIkH8=; b=dWmaFl8q8Gv9y83pW+86Vcgugc
	v3y5xZoYCH1qF7w9g934UU6dz81ap52SmVS0yfU6zI6TN9mu32v44A8i8ADhvDZqsn9GvPPQ5XSpN
	AYWmoiHzSKGYOFYrG5AILoL84fEV6b7+qhQ3k4ytTCwTv710auefUeu30getFhAgRmME/rXYt1ZSA
	JChSW/9dphplyhWmYxPLbjvbPbsjMldE2tr8yrz2U3jRYnd+B30bGqtngdcoKCr6toNkqAlko750E
	XPL5vZZYuLqS4SCRXT+hKUXeuEXaoNrrHU7RnbU/jS9nX18ZQnUI+2TUVd9soWTxiE8q4sb5FU01w
	CkUqrggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquJJ-00000003Xtb-1xSm;
	Fri, 13 Feb 2026 14:38:21 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquJH-00000003XsT-0ij6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 14:38:20 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b8faf5f2b38so94087466b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 06:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770993496; x=1771598296; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UUp+ZPHGqL5Ruf8kk7PuU1fhAJIx8L0ts8JU7bSIkH8=;
        b=l/XHKHZRZAi57yZ/BKzDF1gfW2NHJyqMdu4v9VQDUvE/dEtmClqSpxbD8hC+p0okOE
         l+qtun6MTe6O2gaRwSXgeekIyLbYx2KvruPjLQgh6l31xDe+WGeB4davdvbLT34otp3C
         GYiX/7gZVUuJW7RWnElXluF678BAcP+lBcycqGZruPQXXDpi4Qb1V9JzKkKOhdORwUMh
         v67hQeJImLVVGys5a4TwQN02ssMFBIg45Z5H87jot9zErR8LivIygzKoKNmyKfj/ykgn
         VHlXqsEJZlIQx9wdrSk1DYndhOteBuz/6B5C1glc2L4CjfPNZmetZBNcSRacHJ++w8Vz
         6x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770993496; x=1771598296;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UUp+ZPHGqL5Ruf8kk7PuU1fhAJIx8L0ts8JU7bSIkH8=;
        b=gwLua1x21W9LQXE+OqtALGLIsF1XsdiV6BXw2ol4MIP4aHrGIMOK7vBt4tdiB1i2hJ
         s9iHCwIJjDfxlD4c0CBHKICiJGHla2eNjB8TJkbWCKDxkA6w124TfrFylbfFYg3bXwpN
         IkWKyYohxTPfUefno3+vN95hxJUuiNVUVGbh1naY2bw5+LLiYsZhfDgdsbUEQiZMl6Fx
         iW48SSPtD7VMX6PINViFsEW3aaF9dlQrrYxAHGpuoQ0hBxiU0qpespXQCuZivXRDg5hw
         zgsxTqPUtZPJexT8qgKdrsmUJWMgBXucui5X2j7YmSxiDDtuTJ6fPLs8oUrcF///s+O8
         gJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCXZEOhRlY3ClK58yL8G+Qxvx/BUDjXOOFOght8YK8yupR5/TqTvwS4ZNhgqqzYTmi/v8HWDsY4IHtGSqb9EE08N@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6kjAQIPLAdAiG3y7hC2Pwryy+9kuZCe3UdqXQ8H+J8vFKDBF6
	46ECy9m1NzkYAwS8I1WfNSncfKhVZVj2RJZIUYmnaP9hm4+P2un/Au2SimKh8hSwhS2R5Sk8/2U
	TSQ==
X-Received: from ejbme9.prod.google.com ([2002:a17:906:aec9:b0:b87:1864:34ed])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:728c:b0:b8f:848b:4456
 with SMTP id a640c23a62f3a-b8fb41937f6mr98615266b.13.1770993496347; Fri, 13
 Feb 2026 06:38:16 -0800 (PST)
Date: Fri, 13 Feb 2026 14:38:11 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260213143815.1732675-1-tabba@google.com>
Subject: [PATCH v2 0/4] KVM: arm64: Fix guest feature sanitization and pKVM
 state synchronization
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063819_218073_535F4754 
X-CRM114-Status: UNSURE (   8.84  )
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

This series addresses state management and feature synchronization
vulnerabilities in both standard KVM and pKVM implementations on arm64.
The primary focus is ensuring that the hypervisor correctly handles
architectural extensions during context switches to prevent state
corruption.

Changes since v1 [1]:
- Moved optimising away S1POE handling when not supported by host to a
  separate patch.
- Fixed clearing, checking and setting KVM_ARCH_FLAG_ID_REGS_INITIALIZED

[1] https://lore.kernel.org/all/20260212090252.158689-1-tabba@google.com/

Based on Linux 6.19.

Cheers,
/fuad

Cc: stable@vger.kernel.org

Fuad Tabba (4):
  KVM: arm64: Hide S1POE from guests when not supported by the host
  KVM: arm64: Optimise away S1POE handling when not supported by host
  KVM: arm64: Fix ID register initialization for non-protected pKVM
    guests
  KVM: arm64: Remove redundant kern_hyp_va() in unpin_host_sve_state()

 arch/arm64/include/asm/kvm_host.h |  3 ++-
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 37 ++++++++++++++++++++++++++++---
 arch/arm64/kvm/sys_regs.c         |  3 +++
 3 files changed, 39 insertions(+), 4 deletions(-)


base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
-- 
2.53.0.273.g2a3d683680-goog


