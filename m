Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC62D41C1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 11:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CckZrUPb46HYjW9q/J8GG7tJwmYowZwvL5Toejifz2s=; b=c3ioxNBRZCD0pxfEFd5OINKyr9
	MMz5oboqdTnMPJNb7bMawdNZ4rXgiBHom61bPlV/tA4RSJmIONF8ScMnAFWDPM1eUMO9FMG8NU1Ye
	aRFIU04KD8840htazzH7ks9Wx2nTXL5uV5PkqRAKPR2hJ52b9AH3SoCef7QIDmklDJjocgVxWWyS6
	TJ2zZobVeceoaSJJeqscSdfZzNEsv3bRd1+jzkFKLOYBok1z6CcMmWMiBjqOQ59LKzU1gRi/FLnee
	Ox4V+vZ5ajlIl/+be+sL4L7jAfeyAn3HvaYprpB91E2jhMuhZsmnvpZDSTrMt8mocaIKV+HHjhmW9
	wCYkDgcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTf0E-0000000GY9W-1WXa;
	Thu, 11 Dec 2025 11:38:34 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTf0B-0000000GY7o-2jtS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 11:38:32 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-42e2e50cfaeso587206f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 03:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765453109; x=1766057909; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CckZrUPb46HYjW9q/J8GG7tJwmYowZwvL5Toejifz2s=;
        b=BsASBGPMb2/wXaZgAx0r4QExsOr13NBB/PSPdx46j5XmfVtxGzfKUxRSNmBuWMSq0A
         FP7zpP8YZFUsbRew4b+9olP0WPwXp0bWVWEUuGJouWUXn5BIFne6P9JUIHH3HM6hBYpn
         3Mfa04/L8njnR04IueDWntcQ1eC708w3RlzvFLMJXTEv44YyQBCaYn41WSxNAQ2SB4N9
         nB+nfayLAqDxTskw2rjFTBPKRNG+2g1s41rP6wxY/5J/mwi5N9mRDJXlRKsrWfunJYKz
         pSj0/yaJ2mI/JF69Tk27TXoUkyvXfj0xRYmCcgvqWwRuD3LWDLSRNqt1kbuegNBQa9Dl
         AlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765453109; x=1766057909;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CckZrUPb46HYjW9q/J8GG7tJwmYowZwvL5Toejifz2s=;
        b=vR/3HxzXIJYXPxFQTVO450kVghxdqz40h3yZGWrN1n2SCevyilSmU1RysiSN/opGLc
         i/5FG5iEOeFLnOA2QR5clxl7sbZ9SOqLojDPl+io+OswPinXNLaBjf/yWm5rzgLem0wU
         ziyVrZHvURqJmHKhcS22XQZCBxRJRK9Fm/nB284ReJ2F8J1jgzwAkv31ySyEPQggtm6d
         w0/FOr5+Yf7qSHrjW5j+f3GQo/aSr2MRlnbh2Jhb2LAEukSN0SJ9Ee0JScjgrgiBvY4H
         KWk8RxxQe2nbycvz4u3/Z4I8Rs95ic1Mtem8db/CGfEzySt5246tZQijA2GSfyOEbhnu
         8XNw==
X-Forwarded-Encrypted: i=1; AJvYcCV3oxg5qCUUkbMvVSsFjHbigOUFHRLHoDdrX9TUQOt6lGVGwTDQlPuNVBU9W0/v0naKPnr4kAlBhcBwMvQktS/r@lists.infradead.org
X-Gm-Message-State: AOJu0YyyKd6MwOcIAt35Yh+xw2I7zLxK71AKTpzWwQ8fX3OQAM2b95jG
	/N9Ez8iHR+sbjTB0qVgZLMSs9I0huYo8xgh6b+VVKVW26m1iZZSONztoumucwYJDIffPoMx9PvW
	h/g==
X-Google-Smtp-Source: AGHT+IHGT/x5KyuVOljq6fzfjB0iRjK178XSlQN3GeksKcr8VmbWiVYNPeYgJhy+9wL3xLSwnbIaeT020w==
X-Received: from wrbhg14.prod.google.com ([2002:a05:6000:1e4e:b0:42b:2c97:16d9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:adf:9bca:0:b0:42f:a8bc:813
 with SMTP id ffacd0b85a97d-42fa8bc08bemr2137499f8f.5.1765453109288; Thu, 11
 Dec 2025 03:38:29 -0800 (PST)
Date: Thu, 11 Dec 2025 11:38:23 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211113828.370370-1-tabba@google.com>
Subject: [PATCH v2 0/5] KVM: arm64: Enforce MTE disablement at EL2
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_033831_723101_D749D6CF 
X-CRM114-Status: GOOD (  14.88  )
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

pKVM never exposes MTE to protected guests (pVM), but we must also
ensure a malicious host cannot use MTE to attack the hypervisor or a
pVM.

If MTE is supported by the hardware (and is enabled at EL3), it remains
available to lower exception levels by default. Disabling it in the host
kernel (e.g., via 'arm64.nomte') only stops the kernel from advertising
the feature; it does not physically disable MTE in the hardware.

The ability to disable MTE in the host kernel is used by some systems,
such as Android, so that the physical memory otherwise used as tag
storage can be used for other things (i.e. treated just like the rest of
memory).

In this scenario, a malicious host could still access tags in pages
donated to a guest using MTE instructions (e.g., STG and LDG), bypassing
the kernel's configuration.

To prevent this, explicitly disable MTE at EL2 (by clearing HCR_EL2.ATA)
when the host has MTE disabled. This causes any MTE instruction usage to
generate a Data Abort (trap) to the hypervisor.

Additionally, to faithfully mimic hardware that does not support MTE,
trap accesses to MTE system registers (e.g., GCR_EL1) and inject an
Undefined Instruction exception back to the host.

This logic is applied in all non-VHE modes. For non-protected modes,
this remains beneficial as it prevents unpredictable behavior caused by
accessing allocation tags when the system considers them disabled.

Note that this ties into my other outgoing patch series [1], which also
has some MTE-related fixes, but is not dependent on it.

Based on Linux 6.18

Cheers,
/fuad

[1] https://lore.kernel.org/all/20251211104710.151771-1-tabba@google.com/
[2] https://lore.kernel.org/all/20251127122210.4111702-1-tabba@google.com/

Fuad Tabba (4):
  arm64: Remove dead code resetting HCR_EL2 for pKVM
  arm64: Clear HCR_EL2.ATA when MTE is not supported or disabled
  arm64: Inject UNDEF when accessing MTE sysregs with MTE disabled
  KVM: arm64: Use kvm_has_mte() in pKVM trap initialization

Quentin Perret (1):
  KVM: arm64: Refactor enter_exception64()

 arch/arm64/include/asm/kvm_arm.h     |   2 +-
 arch/arm64/include/asm/kvm_emulate.h |   5 ++
 arch/arm64/kernel/head.S             |   2 +-
 arch/arm64/kvm/arm.c                 |   4 ++
 arch/arm64/kvm/hyp/exception.c       | 100 ++++++++++++++++-----------
 arch/arm64/kvm/hyp/nvhe/hyp-init.S   |   5 --
 arch/arm64/kvm/hyp/nvhe/hyp-main.c   |  44 ++++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c       |   2 +-
 8 files changed, 114 insertions(+), 50 deletions(-)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.52.0.223.gf5cc29aaa4-goog


