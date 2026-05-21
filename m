Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E69CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D6BscWoRfoF5G2iEIlMgQxNFZ2Pew7ZRjTmGHaq5Wuo=; b=F95mdeFlQw/TLkTDxeICSoCoh3
	JoTi1wKBjWTiMt+cvnvFsMKhrwhrm7ix1xBQyMzoxLxP/GbPeun3/iN+5vaLAX2Sn9k3RYS9lqIBk
	KKlN8ehf3pv5QJ+tJRUfSgRX+124ULxrKb90rDGsrOmuQ+K2J6iiwHm55KLxbuXcYNlFuKm6JCgpo
	Uf3fJpwwGm2aqDPygR43KDXJOYqjIuStEYdXJKPEy8DGhTAZKiq6nbL0Mpv47FbZLE+bFHWkCgL11
	PselNLP8AM7M42/D3ytWb7Jejec2enBylR/8JsNQoZmAkR4sVwcnWT1E0WEZPv8f3sYmc2yRk9nh8
	+O9/E9yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Sk-000000084qL-2ZJj;
	Thu, 21 May 2026 14:33:26 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Sh-000000084ox-49Eb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:33:25 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-680ff5fbf99so6941613a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779374001; x=1779978801; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D6BscWoRfoF5G2iEIlMgQxNFZ2Pew7ZRjTmGHaq5Wuo=;
        b=QWK6mlZMFV10UwQKha7ubV5g9fCXXcTIqc+6kTW9Q1KdmbcyNk/JWL0aafnjHNLpww
         Pl+Zai6qR6EDzS+iJHYL6Ip6IZkgV5P+0eYG0WI4VMWqxuSnXGFQjvC/WK4ogMxNLVu+
         nBeqj7ICs6seUpRKseRusjUGRTSy2VSsKyrXII74sIZXcdkDxlEVR6zmESGfWyI0mCTL
         aTUWAabAFMw3SYXq2dD6cs40T2lfJgoWlgERNyK30S74IpNG5GB7oRT5k44FGKvtsYjC
         Xxx+BHjs4seUDpv49wgDO0M5XljCzAzUZRIvtiLbZwYU4xfHgl1Qyzxryc0tbIfkFjUG
         jsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374001; x=1779978801;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6BscWoRfoF5G2iEIlMgQxNFZ2Pew7ZRjTmGHaq5Wuo=;
        b=asI4m1puJW4FAmOAZDqLqkkhsAhnHrnMYHA2bTCNgsdny0Ee0FNyX3dDTwh2UcVBWs
         rgvHY2FdwHAvu1gRi9FGCbO1oHgrrtNq2BDt4mn8jBJ7faagiRcDc0t9D8RukThTZpc2
         gNnNkge2uvSfEaBNpHrKiH0xAK9uSmQ9yFdn6eUnEuRlKVtscCe+a2e8IdzvGZoxeoml
         oUwMT5GESzXqKFxhcq/bcGB3mHRFDBZWd13marShKFuQbgrASOGYJ2jPamAS3nOaajyM
         pBNRfpPcBTSKZxzSUJyCU0LB05ZygLcL7ny6eZdRDo8msiFBmyzkk833ONQss7P9b3nK
         X73g==
X-Gm-Message-State: AOJu0Yw42N5Fr39zUrZQbinURR0jxsaGHArgtBEMDNK6sco45shqFUS1
	9ZZzidMH+YwV4HSW27z18GmwGrEVOdt4VOEfSzZW41wtcY872FKfRUtGmnw6GF+u+//P0q8AGAm
	l0WcXpfdfKwC7W41U/kLYcA==
X-Received: from edyc13.prod.google.com ([2002:aa7:df0d:0:b0:67c:3c95:d0cf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2694:b0:687:cfde:ddb2 with SMTP id 4fb4d7f45d1cf-688361e0fc2mr1758793a12.11.1779374001206;
 Thu, 21 May 2026 07:33:21 -0700 (PDT)
Date: Thu, 21 May 2026 15:33:15 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521143318.1002172-1-vdonnefort@google.com>
Subject: [PATCH v3 0/3] Fix __pkvm_init_vm error path
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_073324_035394_2111D21B 
X-CRM114-Status: UNSURE (   8.24  )
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

Sashiko reported a potential refcount leak in the unlikely case where
insert_vm_table_entry fails.

While at it, I have added a fail-safe to __pkvm_hyp_donate_host to ensure this
function doesn't allow leaking refcounted pages.

Changes since v3:
 
  * Enforce order-0 for external pages, making the vmemmap ->order field
    completely private to hyp_pool.

Changes since v2 (https://lore.kernel.org/all/20260521102149.804874-1-vdonnefort@google.com/):
  
  * Proactively init hyp_page order field in hyp_pool_init  

v1 (https://lore.kernel.org/all/20260521081250.655226-1-vdonnefort@google.com/)

Vincent Donnefort (3):
  KVM: arm64: Reset page order in pKVM hyp_pool
  KVM: arm64: Fix __pkvm_init_vm error path
  KVM: arm64: Add fail-safe for refcounted pages in
    __pkvm_hyp_donate_host

 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 35 +++++++++++++------
 arch/arm64/kvm/hyp/nvhe/page_alloc.c          | 21 ++++++++---
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  4 ++-
 4 files changed, 45 insertions(+), 16 deletions(-)


base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.54.0.746.g67dd491aae-goog


