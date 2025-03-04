Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56818C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uj43tHXd4oUvGh93mFvuqSAi4hbUgB5iGKnK2cXXgbo=; b=gSon4YK03EU7yUEU5rPYPirAJX
	F+qWYLmITyiMTSVyr/5kJBkzHUVPb3dWTqbHAg14U2Xlh90LTiQLrBtZFcNEX9c8ET/Ytmj+Mir4F
	Y64X97SPiRTnmeKHhNZs98He9rylx1EE+T6tto5TN9v3bETtZdYudi21jYjSP9qZ/7ys6US7F0UlO
	BhujqWc1AFWsZbBjrQPSXgO14tXu20/a20GRo3UftkqCGIwggI9QWnQq/pMlfFmvo9VGLfMkkhdhB
	4xYVluQ2efHqs7sHc/12ZMkKXmiQYmBGfy75ALJMPR9NnjuFs3b1alNvhvF3ff4l8pQwx9mvvjNw3
	yfQA1PMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSaR-00000004pUy-2KYU;
	Tue, 04 Mar 2025 13:45:31 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSYr-00000004p2p-0bqQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 13:43:54 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4393e89e910so31194665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 05:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741095831; x=1741700631; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uj43tHXd4oUvGh93mFvuqSAi4hbUgB5iGKnK2cXXgbo=;
        b=w7rZBmBfe3dZe03zHLAORsJI1vXtC25giQHHx5DayzCfc/AUg8JuFMzi4f3ndVKGlg
         g1g7R0Q4Fu1n2JlKJ39lWLKECno/5hWlGrxeq8VawUuV7k3B2J7KWoFm7dzasRxwYGuE
         +rxFW0qh/0z060t9K4Rj5Kq2p8ygeygJ+efkAZYl8B9gGFl72ahzh09wYTRmOinTyPDZ
         C2P9DKbC7p/MwFPrDBlIvrEHHwLjYLLxNMu6lHvdcLY6XcoQA/aHhJwXChojKp6IsYhB
         VWkg5G6i9A2OVl9doCEsjSKjaPNCeWuf8YLbKoVsNm2thobWI2UCleJy0cZCP3WK0mbb
         678w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741095831; x=1741700631;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uj43tHXd4oUvGh93mFvuqSAi4hbUgB5iGKnK2cXXgbo=;
        b=NKolVqaeWIFp0j64nMePcUBIZD+g04raxKBEaWDsWzSffDJR8GlVk7nNyzHMg/9kss
         HmPnteNyJUjlEaeUHeaADptG1uAB7sNhX8ZU3ngf0kj8TdbUJHkJV+fFhVRyhG0aSozA
         1UfwhL9coc7a2L/WbPObbIwGAkaAuG9iAnoCdZt9bbuRmMbWBcjfwCBPwy71TcH48Vr1
         Rnr1C8mfBd8sbTXi2t2gQVnDSanhytHC+gtXKJbQQSA0Fdy6yokTilb1bfuVdmdsBaK6
         8r6zwxt4IWjwavvB8ma/WHKWrBMzrZYqwOs5S3SSwE0M2uBztCwYD103lNryBcPAZD7c
         4PYw==
X-Forwarded-Encrypted: i=1; AJvYcCVlikXW8IdSQmwPUl9p2I28nDcBoIR6JRUDp03+FJ4YoOMLND6ezO+CtW0/Q+eNyhwjqUPbBd0BDAJDeVNxdHh+@lists.infradead.org
X-Gm-Message-State: AOJu0YxFT+wKGBlXuNE37aOEn6MObdll7FUtVTBtAFrXBRqm8PJ0fW7i
	QrmoF+mJIgqkltNRVadEO27lgg+Qe8dKoyr5PmObVG46WIcmlDjBdpHVs3kQcai2lsXl4MoVyyQ
	GBEDbNLPxjglZeVY4nw==
X-Google-Smtp-Source: AGHT+IFG5YXAtgs7Ad4x4+52R1NyxCiNTd9hIFuV0gbUB92z2vGjINs/6+xkAMSQEv2wr8uDuVNZWAe24g0ESfG4
X-Received: from wmij20.prod.google.com ([2002:a05:600c:4114:b0:43b:cacd:235e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c8c:b0:439:98ef:5d6 with SMTP id 5b1f17b1804b1-43ba6766cddmr131565855e9.22.1741095831304;
 Tue, 04 Mar 2025 05:43:51 -0800 (PST)
Date: Tue,  4 Mar 2025 13:43:43 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304134347.369854-1-vdonnefort@google.com>
Subject: [PATCH v2 0/3] Count pKVM stage-2 usage in secondary pagetable stat
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_054353_189472_637DF08B 
X-CRM114-Status: UNSURE (   9.01  )
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

This series allows to count stage-2 related memory when using pKVM. The
value can be found in the /proc/meminfo field SecPageTables.

Changes since v1: https://lore.kernel.org/all/20250228121355.1377891-1-vdonnefort@google.com/
  - Flags to kvm_hyp_memcache
  - Separate stage-2 memcache
  - Account for PGD

Vincent Donnefort (3):
  KVM: arm64: Add flags to kvm_hyp_memcache
  KVM: arm64: Distinct pKVM teardown memcache for stage-2
  KVM: arm64: Count pKVM stage-2 usage in secondary pagetable stats

 arch/arm64/include/asm/kvm_host.h |  4 ++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c    |  7 ++++---
 arch/arm64/kvm/mmu.c              | 18 +++++++++++++-----
 arch/arm64/kvm/pkvm.c             |  5 +++++
 4 files changed, 26 insertions(+), 8 deletions(-)


base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
-- 
2.48.1.711.g2feabab25a-goog


