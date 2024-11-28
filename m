Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838B6D69119
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=khn7hS+L97wWEkf+qZmLW9FxPYu9tRvP0eTp4rFXqec=; b=S68VHutdLXjqVGklpeYtSjsxAN
	5J8b0NGrV1w+x0sB+AOmTU8MAKXZgqWuTDCDucS3VPbC6+OxAhQKGpqbh8s8J77xXtm9veWZ0Ajfe
	+v9zc/w+SVtUFuUIaN2JrbSWEKA3HQwSwYI/IQRO+QDrH5d8l5nNRQSwpfElFToSUfdmWFT3zyGRb
	yPMuM1TkLr3fN/BroMZ3WRsOAbLro2zlVg0xHvn9Q296oi0jzT1W2WYqNTXP4w+D/1b7wpU6Puh2n
	M8xNojhVmTq6gFc2y6iVNZ+Srq0o0YOypxMvStqhYr4eR1PBI3lScemCtPX4/oKs3xxD6qUSx5z4p
	lJT1HCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGghc-0000000Fv4d-3sFK;
	Thu, 28 Nov 2024 15:45:12 +0000
Received: from mail-lj1-x249.google.com ([2a00:1450:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgge-0000000FuzH-0o4Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:44:13 +0000
Received: by mail-lj1-x249.google.com with SMTP id 38308e7fff4ca-2ffc0800f02so7923841fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 07:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732808649; x=1733413449; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=khn7hS+L97wWEkf+qZmLW9FxPYu9tRvP0eTp4rFXqec=;
        b=bj4xyK1aSZNKWZ9VgCcyh9cFUj+ndaBr7/dOXcmusf0GKDyMlAQceUsr+cqs+sEFl+
         idD8mVVroTw94+4rSN3e2E8F6RVFx6Y7plAU9C+8ZSCHIEHSDEZclz48xc22NWoSx+TV
         DDNCl7Js4IAAr5vfzt832R0VqTUBMELWrViOmkEjRjg2C/yh2fKMhocwnaxTivkyhb+d
         Zx9fKVnCvSm6tGG8Bj1iuUBXICHrIEgbFxFmetgUDigVs+l+FLyuL2xZN/G6DqcXuMKn
         TTpQdp3u9WNN9ki7/QGcDPKM3EaTGW1UuuHdVSgSlCI0XQAdgkwskYeTWJOXzBfJvgU3
         /+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732808649; x=1733413449;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=khn7hS+L97wWEkf+qZmLW9FxPYu9tRvP0eTp4rFXqec=;
        b=ZOyM64bTWD3ggTcLthj+yr4dG7EtyKtDSFh3if/Bandr4/tv74CLreRMNhBnsb8COK
         aaYty0qz90KcBwy4cXzNm7uvNxaAFqePSxXaLkCAs1mJ/LR5vdUNmmSTUKNb7QayQU4a
         Gp0xETmMlKfKGXpSAzu688TtzZuOsBU6ghw8F+qkH7AcYUPuK8TDUM8n9gaZsjWnNpNX
         e/ArTdOA4wCBD6Eip1A2wZgqS19ZGVLG0iDOBoQ6XTIdxUvV/3/KdaGJi0COV6iANX6n
         QKCpgRZJaC5fAeUSeYgJyBqAVTA1dhEpKm7VwbGUaQCCoUEy7XfXbMVsSXs09AQWe7pG
         ot9g==
X-Gm-Message-State: AOJu0YzjGmQSFk1S78gW2P/wBD7ll6QnFyCFdaXfEGjr63TICeYPUoig
	A2qmN885RLXfNcCqYm0bIzPLAjIdiJ27pPYQstHGq5jHs5cA4XwbF1PhwCeQ0EnNfZp51wVcxdj
	dRAeqoA==
X-Google-Smtp-Source: AGHT+IEA0vqV24/H61fVxAlPgPYdRuvNXFKWFHK/tbHMkyqpm9uAL9gzQ7g11kF30kEuklavdgUcHm1MkzJh
X-Received: from edso5.prod.google.com ([2002:aa7:c7c5:0:b0:5cf:e1dc:7d98])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a2e:be0d:0:b0:2fa:d84a:bd8f
 with SMTP id 38308e7fff4ca-2ffd60cf809mr40534651fa.30.1732808649614; Thu, 28
 Nov 2024 07:44:09 -0800 (PST)
Date: Thu, 28 Nov 2024 15:44:06 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128154406.602875-1-qperret@google.com>
Subject: [PATCH] KVM: arm64: Always check the state from hyp_ack_unshare()
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_074412_259589_9AEEEA63 
X-CRM114-Status: GOOD (  11.82  )
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

There are multiple pKVM memory transitions where the state of a page is
not cross-checked from the completer's PoV for performance reasons.
For example, if a page is PKVM_PAGE_OWNED from the initiator's PoV,
we should be guaranteed by construction that it is PKVM_NOPAGE for
everybody else, hence allowing us to save a page-table lookup.

When it was introduced, hyp_ack_unshare() followed that logic and bailed
out without checking the PKVM_PAGE_SHARED_BORROWED state in the
hypervisor's stage-1. This was correct as we could safely assume that
all host-initiated shares were directed at the hypervisor at the time.
But with the introduction of other types of shares (e.g. for FF-A or
non-protected guests), it is now very much required to cross check this
state to prevent the host from running __pkvm_host_unshare_hyp() on a
page shared with TZ or a non-protected guest.

Thankfully, if an attacker were to try this, the hyp_unmap() call from
hyp_complete_unshare() would fail, hence causing to WARN() from
__do_unshare() with the host lock held, which is fatal. But this is
fragile at best, and can hardly be considered a security measure.

Let's just do the right thing and always check the state from
hyp_ack_unshare().

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index caba3e4bd09e..e75374d682f4 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -783,9 +783,6 @@ static int hyp_ack_unshare(u64 addr, const struct pkvm_mem_transition *tx)
 	if (tx->initiator.id == PKVM_ID_HOST && hyp_page_count((void *)addr))
 		return -EBUSY;
 
-	if (__hyp_ack_skip_pgtable_check(tx))
-		return 0;
-
 	return __hyp_check_page_state_range(addr, size,
 					    PKVM_PAGE_SHARED_BORROWED);
 }
-- 
2.47.0.338.g60cca15819-goog


