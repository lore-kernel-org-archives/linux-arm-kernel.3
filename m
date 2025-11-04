Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A76CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bkXH7eosyb2JItJ6a+jHxlEQOajEabKKXGhxw0oKMn8=; b=QQu19IeWIsLBMSeruvBU0sC7B9
	pS33Pyr4dnhyFbAkyl4xiKDFBz/OsYMPXXov8J9P5iQa43usauFxXb0XCxafksdA1dkelRc6AjIPg
	FY8eW4nk035H0ZXitM8XaUhSIuY4TCKCZKbGR42oAncsEocY+tvJTFuXC3m7LjaaUCnnLKVOUB3R0
	G687tfGlJ9ESUXn288KwM0+rpkhDbe8MEzTo/WL7zdPiSS8jUUbeqSMjravL5rIaNX66hwbhbf3uK
	aoJk4BPOLlmebigQsb4RmzP6C8bEKHsbMyA2d0feffujvUf1jJPC3CeYLypfDbbFbwZzlbSNdVSva
	uRn0dA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGcy-0000000Bp4X-2UQX;
	Tue, 04 Nov 2025 12:59:12 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGcv-0000000Bp34-1usZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:59:10 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-475de0566adso46397685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762261146; x=1762865946; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bkXH7eosyb2JItJ6a+jHxlEQOajEabKKXGhxw0oKMn8=;
        b=ZaOgftDR9u+mJ77DQcsES9tDVXEsr4MTX4V0DOvYzakCnspWlnJaBuyhoQwVRvW0nJ
         KOvbktmDzSupMxyDERnM2IkHnDxstyI3SenWVZaVE3XCUEvwIv06zGMWFHXEi4yip2tD
         CID6znYjvmaYuOEEYl76FVumfIAGHN4bllE7jr6NhZUyrFk4BDk1D2lsn+480byGANmy
         /nRw6z9H0f9ZHjRyONHtFPjQUXDZmf35a4o405hWyuRv9pfYy2L2Anro+gcB6FQVtvPl
         eEytZ9yfj3z5sB/rFD9oDq/yLln1mOVHu2k6uhvuUIXxsuKvacyB84Otb0S5LkKEw/uQ
         GW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261146; x=1762865946;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bkXH7eosyb2JItJ6a+jHxlEQOajEabKKXGhxw0oKMn8=;
        b=IzDjVmbckMLpTxQxLmlS37tIY1U1UWah9ot/1nXeeGZEXLgMszWAr8Gd3YtA67ch6e
         2fjeNMV0tQ0YFdo6JKfnZA45bMS2sGoMFwfJCeU5PzHwgu0g78SoH92nM9ofewK96KD0
         KUaomLe4+aXD8rTDTmk09eL7gamlEDhBL7+cK6eSe351RfrtG5gpeZDXQx6kUcmbb6rL
         kZtr5j5TSCzJ9kb7LtjLzudhmgVEHxYKGRPXrqUzi9QbyY8gdxzjqwY0FrBvL9uiuDXt
         9A9yKWCEqLEPG2kX+9SXVO6EAuYTyt+8x+wHEd0A0s86nxRy6yVLfeucoEa8SbPDUwXT
         v8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXFR1E78/51du4Ks+HhOt2XOyJ0cKrweKKkO1QLFNDTk4frKEZT27KO4DuRBV72ufsgqep8jiy4P27pvop55uft@lists.infradead.org
X-Gm-Message-State: AOJu0YyAEZWxMOSh0E6wBEmqLJeyKgI396nNF28YBxWJIu5OVfAeur8a
	i1gzXLxAYZoGRaXx5xTRtDsDyCJZnT3h9J3MsepPyAbDfxTlSGobQvnog8MdabaYvsoGxHVTydh
	JBg==
X-Google-Smtp-Source: AGHT+IFgYT4bLPXRk9AhJP2mOSaIQSkoHLrXRLVjVTxY3d2ElH76yRZQ1l6Yg9mlWEQgXIjTMp8drNDtYw==
X-Received: from wmcq3.prod.google.com ([2002:a05:600c:c103:b0:476:4b14:2edf])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:8388:b0:477:3e07:217a
 with SMTP id 5b1f17b1804b1-4773e0722b7mr66876485e9.36.1762261146749; Tue, 04
 Nov 2025 04:59:06 -0800 (PST)
Date: Tue,  4 Nov 2025 12:58:58 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.2.997.g839fc31de9-goog
Message-ID: <20251104125906.1919426-1-tabba@google.com>
Subject: [PATCH v1 0/8] KVM: arm64: Fixes for guest CPU feature trapping and enabling
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_045909_544589_5F5C6E52 
X-CRM114-Status: GOOD (  10.99  )
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
enabling, correcting logic for both non-protected and protected guests.

It fixes inverted logic for MOPS exception routing and pKVM Trace Buffer
trapping, and add missing traps for features like FEAT_NMI. It also
ensures that supported features like FEAT_LS64 (LD/ST64B) are correctly
enabled for the guest and not trapped.

For pKVM, this series also ensures MTE is correctly detected and enabled
when it is on the allow-list.

Additionally, a simple refactoring of vcpu_set_hcrx() is included to
reduce indentation and improve readability.

Based on Linux 6.18-rc4.

Cheers,
/fuad

Fuad Tabba (8):
  KVM: arm64: Route MOPS exceptions to EL2 when guest lacks support
  KVM: arm64: Trap access to ALLINT if FEAT_NMI not supported by the
    guest
  KVM: arm64: Enable LS64 instructions when supported by guest
  KVM: arm64: Refactor vcpu_set_hcrx() to reduce indentation
  KVM: arm64: Fix Trace Buffer trap polarity for protected VMs
  KVM: arm64: Fix MTE flag initialization for protected VMs
  KVM: arm64: Prevent host from managing timer offsets for protected VMs
  KVM: arm64: Define FAR_MASK for faulting IPA offset

 arch/arm64/include/asm/kvm_arm.h         |  2 +
 arch/arm64/include/asm/kvm_emulate.h     | 48 +++++++++++++++---------
 arch/arm64/kvm/arch_timer.c              | 18 ++++++---
 arch/arm64/kvm/hyp/nvhe/pkvm.c           | 10 +++--
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c |  2 +-
 arch/arm64/kvm/inject_fault.c            |  2 +-
 arch/arm64/kvm/mmu.c                     |  4 +-
 arch/arm64/kvm/sys_regs.c                |  6 ++-
 8 files changed, 60 insertions(+), 32 deletions(-)


base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
-- 
2.51.2.997.g839fc31de9-goog


