Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C369FCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IHvbo6SnYwSsQd+ne/bFLjjWVF4qCjyFEL/r++b9u/M=; b=ffMvu+29UPFareGGooJBEYTW3X
	bIiYPtJVuAQd9Oa1hdFHqmN/vouii0Aarw+tuNPjtNiliz1rc/YzeagFY3+/acLlM4sgQuMq6Lv8H
	OcmhIxIdkvkItu3BXX2mizfEMqe5flSWhQ3ar0v/NlxiPg5Bg1557u963pQ8gZ/WXNZ82rFHrnXi/
	mm/OAMV5SJfCth4UNb5hAjpTw/f9AUXPOzST33BLi7lXzh1MUGxUY3jCEWTC6d5gbkTs0X+6OJCfK
	p/eLyQVNwPrcgVunBs8cFJPUFA1wlMcce6vRpoyCAnRdo6/ggSE9f4I5DxVQ+R/yEnHeaiyPJfwf3
	VbYP1Umg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISD6-00000005Vpw-0rHg;
	Mon, 10 Nov 2025 13:45:32 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISD3-00000005Voo-0sCt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:45:30 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b726b7d1f1cso222913866b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762782327; x=1763387127; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IHvbo6SnYwSsQd+ne/bFLjjWVF4qCjyFEL/r++b9u/M=;
        b=YOVBnCQz6SqqtolA/Iw2KbCduaTSARv5NPsdXj2q8iUJRDMnKFG1kJ2lsYeP9c5x/w
         vGblFawjuS5gYafXWIdnlEnNjv3FQBMVO/5hNFbJx3s459yiaj3uLb3UoBd0URQGW/oT
         Wt+qlvKNiHukpqr9nD8txZq1JHm09xO9jYB3PLI5u5lEfF/XdQpHbefUFrgNPLmGJbNw
         C3ACgchH5ro3m1N3ZogU9n9h5+lcGCmfVQmzJYCnnyHMvBaHFlBkkOzs0F067Yvuif2C
         Pdtzos3PzDL817QNETeL2Dhr5zAO2p7eOpJ1dYfeyoKqzsK+l770/PHzW3jByOctxSm+
         T3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782327; x=1763387127;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHvbo6SnYwSsQd+ne/bFLjjWVF4qCjyFEL/r++b9u/M=;
        b=vnvdT34UrCTb+dG70zz0rOuCowIM5p0S4q6+XL/jtK4aJgR7xyEiGy4JWRwJq7Vj/7
         9JxcEfCyPTu+ae9r+Q03b5oUBPSwfwSlF70awzKoB501kx5NbWpGHmby6/rK9QTuL649
         eu01pzQcChQpAM+TnndYsah07sj+vg2Redlt7bDaRtgsf06Sq5azqmg06ylmPnjg9pPO
         nVIi2DMzi2CV9B3R5OTeMV8mz98CiaYPuo1EMCOqfHwi0HmM9zVQV3sjOnVgRqipYoDx
         sTwzy93ifgHX2Hi4bmFlFOodIWQ5epvkRWpOB1CTmeDCa+uDtfsK0Gh1o8vFZUg0pB6d
         6KUA==
X-Forwarded-Encrypted: i=1; AJvYcCXJnKVFChgaE1VxpaKdpBuUXCGQXxRaA6fiElaf1pYxnax3smJ1/hTvxktmL00z0TDhyQsp0Fw39OOmBgXh9oIK@lists.infradead.org
X-Gm-Message-State: AOJu0YzVr68kKVnbS/BkehIA/nKIg/i1hirav7AuXurfOsQ60gMepDR9
	s/WyJw2IMVYiDp9ewvuXJV3fq8PuMh5QdayI36UWZUJLsAcsWMbb8Cw4KhY3kfOG7y7GBOjWuEc
	WTw==
X-Google-Smtp-Source: AGHT+IFvfbA62aZamyfGa4Rdc51rYmcB6jnaOM59MZ66aybSKMWuythr1PeqI/zas+fnnP1SNWeNo+j6zg==
X-Received: from ejcuv8.prod.google.com ([2002:a17:907:cf48:b0:b71:4b98:8fe3])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7b96:b0:b40:fba8:4491
 with SMTP id a640c23a62f3a-b72e0310d6fmr936142966b.17.1762782326602; Mon, 10
 Nov 2025 05:45:26 -0800 (PST)
Date: Mon, 10 Nov 2025 13:45:17 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251110134525.3768197-1-tabba@google.com>
Subject: [PATCH v3 0/8] KVM: arm64: Fixes for guest CPU feature trapping and enabling
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_054529_275527_E2E4A30C 
X-CRM114-Status: GOOD (  11.18  )
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
enabling, as well as a bit of tidying up.

Changes from v2 [1]:
- Instead of a FAR_MASK, introduce a helper FAR_TO_FIPA_OFFSET() to
  extract the offset (Oliver)
- Expanded capability check in pKVM to include the VM type, since
  certain capabilities are restricted for all VM types in pKVM, whereas
  others are restricted for only protected VMs.
- Do not allow KVM_CAP_ARM_MTE for any VM type in pKVM
- Restrict which VM IOCTLs are allowed in pKVM based on the allowed
  capabilities for that VM (Oliver)
- Remove unnecessary checks for VM type when setting/getting arch timer
  state (Oliver)
- Based on Linux 6.18-rc5.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20251106144418.2847443-1-tabba@google.com/

Fuad Tabba (8):
  KVM: arm64: Fix Trace Buffer trapping for protected VMs
  KVM: arm64: Fix Trace Buffer trap polarity for protected VMs
  KVM: arm64: Fix MTE flag initialization for protected VMs
  KVM: arm64: Introduce helper to calculate fault IPA offset
  KVM: arm64: Include VM type when checking VM capabilities in pKVM
  KVM: arm64: Do not allow KVM_CAP_ARM_MTE for any guest in pKVM
  KVM: arm64: Check whether a VM IOCTL is allowed in pKVM
  KVM: arm64: Prevent host from managing timer offsets for protected VMs

 arch/arm64/include/asm/kvm_arm.h         |  2 ++
 arch/arm64/include/asm/kvm_pkvm.h        | 33 +++++++++++++++++++++---
 arch/arm64/kvm/arch_timer.c              | 18 +++++++++----
 arch/arm64/kvm/arm.c                     |  7 +++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c           | 20 +++++++-------
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c |  2 +-
 arch/arm64/kvm/inject_fault.c            |  2 +-
 arch/arm64/kvm/mmu.c                     |  4 +--
 8 files changed, 64 insertions(+), 24 deletions(-)


base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
-- 
2.51.2.1041.gc1ab5b90ca-goog


