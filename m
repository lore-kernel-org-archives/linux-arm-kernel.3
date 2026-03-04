Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09CAEF9002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=23c+ROMNUk5Dd7yUKgLUSdTwchiyCsLiWmB8a96IYHQ=; b=UPtSAjovgC/Htf8FCwss0+EVXP
	TSleqGMKnyUaMOcWLaZw1ErSHT3gcsffrNgMIzVt/w2BoFob1iVqE4gYI4MAiEj5sd2+jOGJ/Pqjk
	FO57NXpzzg/dfsi/m8lxkuupFlgSz7AjUvwXPyNzrYvNV8D7ZtTf3sAln84v6gg+e8AxpnqtgMTTd
	f7sI2eHj3O7seKgyVWKgePpxzQy7t3G+8dvBbuRhNaHXO1FkCfqxDcnw8xWGSV6oOZBk0Rn5+TRkX
	yzgw8MFifj2ZIDdDPwBsk68cRyFh5ytIan0G473Ttqec3R7Qx6LVXfq/7XWwTwTGPRuueVRvI2b94
	SxnsPzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxozU-00000000407-2Woo;
	Wed, 04 Mar 2026 16:22:28 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxozS-000000003z6-13z3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 16:22:27 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-483a24db6ecso79539505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 08:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772641344; x=1773246144; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=23c+ROMNUk5Dd7yUKgLUSdTwchiyCsLiWmB8a96IYHQ=;
        b=BES33x1Bwjaq2rUkMqRUN2LGwU1yp11arMqFe7RGzGVbLR6jZ8ARJ6OGeUEMkNX77x
         SwsSPZzh1yIfsS5TAt/w3XYeWfamRcslOlJYeiw+n1w2rt6JQlhlXnsQVqiBs28j03zl
         6pdg+bmutcgLKgl9LWQZfHIDkEsZbRb5I3s72VP79ZvJx6E5yZNoe4CJL4BEzlsyjqHB
         N9y9YtPWG45hplASASB+H7D5fKun9pmuHsVD/MwwQKQwd3F2YriTyPWKekXG7fdszc/l
         pfSGbuT14WOh2n3PKmGqsQdolnF70EyQt3WffZ6X4zKuMkU+p3Yv7pDO7rrowpNPWagB
         DC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772641344; x=1773246144;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23c+ROMNUk5Dd7yUKgLUSdTwchiyCsLiWmB8a96IYHQ=;
        b=wTkuL97Foipej2K83GieRKAflpTC0FWlQdsZCxAL1cA0arXP3GQ7kUrjPwjedjD4V7
         MXHO6ploEtKpImRtpFzC41S5mK8aRLqtt95NhkKRX+M6KWWyNIK9w4vyhnt+x5cETKJ/
         XGlYWKPTKzVFftoJ/KrPtC/TQY7Pb8MF5vb5tAY5WoAp1XkrXToEAa7Oa+q4/KFUHlX4
         SIxvwxjNaFnPVc0mnIVXIV8JwbGmPFzv1tkE/I3/whybQOYr4yn8VmfdHc+CqjEokNRP
         BnxTsiYDnUJF8nxOVgANQ995HAbt1G1mSJTgyRnI3ZigjZ12IHAVNnseJwK4zS4zj3fJ
         92qg==
X-Forwarded-Encrypted: i=1; AJvYcCVCNkDUTxiYIvuGdqtmKX+H50s0VQ1Kuwy1/qPb5kClioOCuB+ZBy3cwqudgok7leUwDVY/gvtYEAmivCCxljLn@lists.infradead.org
X-Gm-Message-State: AOJu0YzbwwT/ohhl9AuBEYRkH9TxkpPCiCfzs5kK2xkRVu/Q1PL4wiP/
	75RYWVubrg5gLbOeKfkGcyH2d9sQ9K3q/w+qAUqbiVuI4hB05TKvxwlBBKHwmqwNL5rYQktMJc0
	I6w==
X-Received: from wmo14.prod.google.com ([2002:a05:600c:230e:b0:47e:dc0c:276f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e8a:b0:483:c35d:367f
 with SMTP id 5b1f17b1804b1-4851988a6f7mr43226855e9.21.1772641343626; Wed, 04
 Mar 2026 08:22:23 -0800 (PST)
Date: Wed,  4 Mar 2026 16:22:20 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260304162222.836152-1-tabba@google.com>
Subject: [PATCH v1 0/2] KVM: arm64: Fix a couple of latent bugs in user_mem_abort()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, yangyicong@hisilicon.com, wangzhou1@hisilicon.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_082226_303587_AAE8593A 
X-CRM114-Status: GOOD (  16.31  )
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

While digging into arch/arm64/kvm/mmu.c with the intention of finally
refactoring user_mem_abort(), I ran into a couple of latent bugs that
we should probably fix right now before attempting any major plumbing.

You might experience some deja-vu looking at the first patch. A while
back (in 5f9466b50c1b), I fixed a struct page reference leak on an
early error return in this exact same block. It turns out that another
early exit was introduced later on (for exclusive/atomic faults), and it
fell into the exact same trap of leaking the page.

The fact that this keeps happening really highlights how dangerous this
"danger zone" between faulting in the PFN and taking the MMU lock has
become. To stop playing whack-a-mole with inline `kvm_release_page_unused()`
calls, I've routed all the early exits here to a unified `out_put_page`
label so they are handled safely together.

The second patch addresses a staleness bug with `vma_shift` when handling
nested stage-2 faults. We currently truncate the mapping size for the
nested guest, but forget to update the shift, which results in us sending
the wrong boundaries to userspace if we subsequently trip over a hardware
poisoned page.

Finding these issues just reinforces how fragile this 300-line function
has become. We really need to refactor it to make the state flow easier
to reason about. I'm currently putting together a series to do just that
(introducing a proper fault state object), so stay tuned for an RFC on
that front.

Based on Linux 7.0-rc2.

Cheers,
/fuad

Fuad Tabba (2):
  KVM: arm64: Fix page leak in user_mem_abort() on atomic fault
  KVM: arm64: Fix vma_shift staleness on nested hwpoison path

 arch/arm64/kvm/mmu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)


base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
-- 
2.53.0.473.g4a7958ca14-goog


