Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E990DC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWRrS3x4cauUfBmtdb7CWhXFgQlJhhYmJ5IHCDodbtg=; b=KajfbPvfRpzrTKIldFiaP1P2Z1
	1It16Q7E/X4B2oZj7N/3K2iTALRDaz1zz4y3QCb9AVLVU8LODFdjo8Ywb4o7k6aJNHynYm8/h8mTF
	Usd9R7ZSBfEb7JCrcq1YyfLWKySIz67jSXQkg4YfNoTFBxfxfjIqXnyuPbAXV+jgfQ4kI4Ri0RuPv
	R+Yod8yBK66589Rj1bCGYTrYA8oZIt9sddjUwREwKnMaz37ubMBXhEATNwbMSQdGQjBRkKo2n90yx
	ZIhL/sGP9LSWxQW5dvAZTKeAQJnFNxTMSDBZsda1Svt0IhOuJqDngYtacCqSwpk+m0He0GjX+3aTD
	pgwHZWXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVzk-0000000E4Mw-2oSa;
	Fri, 07 Mar 2025 11:36:00 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVy7-0000000E41x-1ppw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 11:34:20 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43ab5baf62cso11955495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 03:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741347257; x=1741952057; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gWRrS3x4cauUfBmtdb7CWhXFgQlJhhYmJ5IHCDodbtg=;
        b=XHBQEHEJEWTTm6o7NB99M0DApXSctws9OHUOOHIcSVPmRQRfG+ObpCqLE7jxXY18v1
         /fQriB94TiqFZeyhAR7MA2kpOCXZGDPUTpWVUMDG6vZuwpLwV1YN6UOPsB+gfkteUCzj
         Mb96RtVyioW1qoeWXhRPAe66emOELQ2hIsTx5fWf5wn1JmSQ81I3nqOwFhf57eFHKC4K
         CWsMWwjUDpQuWlPXbUcVPtSSNc/CRuVmWHu9dfPD9HnNZO96sTv4ho7JrT0JUNqzpNA5
         7/wdkVtcGAZmYr/F/8HgSQXhiaz/ku+8c/pbEdJXvtNCtmyi9AIAVBHdyk7MJpiWjI4U
         03Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741347257; x=1741952057;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWRrS3x4cauUfBmtdb7CWhXFgQlJhhYmJ5IHCDodbtg=;
        b=f30uS7roNc1nKzUyCSzJF5/SPE7KiXuIyUs9mIwM40NhH91EUy5MrPEwiogLNKJSrb
         XztN3aaPSVuK/odeA58l/qVms7g8KF1LW6VMuALpvf4BfeLBS9inVylW71Ey6hDiHeVK
         NqW3EWFGmQjX0QpcOVvmpMz6UVmhUN9TiW50TgQ77dDFHLXkjrmcpAM9JiWDMtX8lH3e
         zQe0XBs/KNB3q7EyCWMqyxC7g0+0Z9e9nWbaqOGlAvG4rWNDfUbOnx+CRsMkoGoWBABQ
         CZsdwvcey1DAdyLWrlybI8FSL+kYpSkn0z0JIRW5qMQxIW+EDLEPlaMX53c5UZ4NFTo+
         AcMw==
X-Forwarded-Encrypted: i=1; AJvYcCXL7Eu38LPwnah2laUfMKHwgW+z7t5DLJV4Q+gwxAqCFsU7WjVUp0AXdqfYmRJxFqtWIkLBUR++mS4N0gDSO03g@lists.infradead.org
X-Gm-Message-State: AOJu0YwJjH3S/b9JM4yiYMUebnBuWZuK4BhZ9xKfqYxBOp7dvxsV8TTE
	mdMRijmqsh1iyFQdL0WCl+q0K6xyxa9tF/fW96TQVDlKZ2Dn2fon2aFYwtOMR1Jf6nY1McqYkNZ
	EmRU0xHcq3g6pFVmcIw==
X-Google-Smtp-Source: AGHT+IHPB/BavFeiIuU4jP5ze2ourrXrXM89F+RxMJStp6R8CgJywz72d2FJ/8Pyx4rbvot/9rkDeqVmllP9YyEi
X-Received: from wmbhc25.prod.google.com ([2002:a05:600c:8719:b0:43b:d212:f974])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:198f:b0:439:6101:5440 with SMTP id 5b1f17b1804b1-43c5a5f7050mr20681135e9.8.1741347257113;
 Fri, 07 Mar 2025 03:34:17 -0800 (PST)
Date: Fri,  7 Mar 2025 11:34:08 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250307113411.469018-1-vdonnefort@google.com>
Subject: [PATCH v3 0/3] Count pKVM stage-2 usage in secondary pagetable stat
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_033419_476090_9E593F41 
X-CRM114-Status: UNSURE (   8.96  )
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

Changes since v2: https://lore.kernel.org/all/20250304134347.369854-1-vdonnefort@google.com/
  - Pass a pointer to kvm_hyp_memcache instead of just the flags
    (Oliver)

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
 arch/arm64/kvm/mmu.c              | 22 +++++++++++++++++-----
 arch/arm64/kvm/pkvm.c             |  5 +++++
 4 files changed, 30 insertions(+), 8 deletions(-)


base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


