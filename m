Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AEECCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wVZ18kpXA+sZ/1GcViq9E5WK0vC57K4CnJbSROPZLAA=; b=ZIe5dlpPgpSBHl7kiLD8koQXGu
	X2is9U1+i9yDWH1UneNmUaVQan6iJaxiuaglDi390jFk+gyxo+5sg89oOipGbksOPSWfZOr7F7ONe
	v3CREbvWgx6ylOBwVgzrS94IG7VXjw4aGPe3GuIWU3BWgIQg7Zhj0VJmbkYufetrvpkFcdiFrjCTP
	S3Bd7StyvXbn/u4BHPHzqBxiaOpKXL28FmDZkabDABkPdaTLjgIBdfBNzCIu19uP1Lw1zirvPXZa8
	BS2SXHG8fCWEUMzxpyg/XBVONRLwE4virk4hLU+5hplJh2ol7V1Qm97LJBJWdasVgwMTJTKWPNFpx
	3iZ9tuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Dq-0000000FiSR-2B8z;
	Thu, 06 Nov 2025 14:44:22 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Do-0000000FiRh-2m7U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:44:21 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-475c422fd70so7862745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 06:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762440258; x=1763045058; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wVZ18kpXA+sZ/1GcViq9E5WK0vC57K4CnJbSROPZLAA=;
        b=ZtB4/oePX2SlX+25TAu528d7dY9WUSNSx/GON8tLJ60sIAMX5VRkXdW+pQ8y+rx+bd
         D8k/0iR00rVHCUZib7AnRNFzRa913WrfGOp/En+5k5+KCM/UVdxKzGP7oMTjPqT71JeJ
         rbCUuLYDEA8bX4ozTMwQOKlPU5NPKjlh3Q/z0UxYAHyZd81++0eIXaJtnSxFSz5Yh/S2
         j7Y9j7dBpJVMK56LVNZWlff3CFXLKGTsQtcZ1vYYzqxyUGM1Wr8/85kVW1wJs98WObTw
         jv7c6Gf0Pv4tRAxNrIVQipGBb9qOku4fAZUCBmsGA16ZUMJkCEvAn9aT86X4yg9daDN3
         XItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440258; x=1763045058;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wVZ18kpXA+sZ/1GcViq9E5WK0vC57K4CnJbSROPZLAA=;
        b=eVLq+B5Dr94a/1TcI+oYuhag55q4tGAlOHfTQRMmuRYPgPCzjXTMJFA5zCRz1booi7
         OIRwxyteNddfOpMM+56Bjhc8XYuZkG3B3JedT+VUnVtWzY4JpbFgBJ/zYG1J0AiPwPiV
         xnElqJBezKO9sUpEQp0m/zQm+pSPsqgiZMVawy16Rll5jr7cAAWgc67sX7qWN9xB3ien
         6d38Hq/AihP1W4aGup+D9O+72EoH0SBSyZYVyvFSHUosuc99JiXqOTEcktLR+A47Ypsf
         1s7d1O39hfreE7iA1TYKBsUmrYq1NYvDOdYpxJmKV+KywnDzp1XduzJ44AmXrJn3lkce
         0t4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUL4tm6zCAPmlUHJpA/x6vy12612Svu5i510S07nNL/0MxwlEnUI9cuhkpNBY181lba51gLOVQYdIc6QQgHwsfc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/6xUPcBh1ezd8x7hjpuMHJD8H6/MR7VKXW8BFXr9AKcII6oWZ
	OavW9OBCCmx7mln7wmr0eWACvgctj9MqgghbpKfJTCicfm/sFak8h43xtRkZlzbMrARdcndcujU
	DbQ==
X-Google-Smtp-Source: AGHT+IE1wTJDTcL3U3Capu0DU6sLOo3goS3UxDUA399EZH6RrCkjUuKph4GWp7KbO9M0TnI2osZb9t2bmg==
X-Received: from wmcm6.prod.google.com ([2002:a7b:ce06:0:b0:477:1716:3f2e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:524f:b0:45b:7d77:b592
 with SMTP id 5b1f17b1804b1-4775cdbfb6fmr59398085e9.12.1762440258657; Thu, 06
 Nov 2025 06:44:18 -0800 (PST)
Date: Thu,  6 Nov 2025 14:44:12 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251106144418.2847443-1-tabba@google.com>
Subject: [PATCH v2 0/5] KVM: arm64: Fixes for guest CPU feature trapping and enabling
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_064420_732793_A6CD5CC1 
X-CRM114-Status: UNSURE (   9.34  )
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

Hi,

This series contains several fixes for guest vCPU feature trapping and
enabling, as well as a bit of tidying up.

Changes from v1 [1]:
- Dropped the MOPS patch (Joey)
- Dropped patches in favor of reworking coarse grain trapping in general
  (Marc)
- Fix bug in Trace Buffer trapping (Suzuki)

Based on Linux 6.18-rc4.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20251104125906.1919426-1-tabba@google.com/

Fuad Tabba (5):
  KVM: arm64: Fix Trace Buffer trapping for protected VMs
  KVM: arm64: Fix Trace Buffer trap polarity for protected VMs
  KVM: arm64: Fix MTE flag initialization for protected VMs
  KVM: arm64: Prevent host from managing timer offsets for protected VMs
  KVM: arm64: Define FAR_MASK for fault IPA offset

 arch/arm64/include/asm/kvm_arm.h         |  2 ++
 arch/arm64/kvm/arch_timer.c              | 18 +++++++++++++-----
 arch/arm64/kvm/hyp/nvhe/pkvm.c           | 12 +++++++-----
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c |  2 +-
 arch/arm64/kvm/inject_fault.c            |  2 +-
 arch/arm64/kvm/mmu.c                     |  4 ++--
 arch/arm64/kvm/sys_regs.c                |  6 ++++--
 7 files changed, 30 insertions(+), 16 deletions(-)


base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
-- 
2.51.2.1041.gc1ab5b90ca-goog


