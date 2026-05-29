Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE77CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a4SS+MLrRfo7JjMGlt0hzA5ZHD4Vfkl52EAZVg4EXVU=; b=3Y1hZkWxOlAPgJkyEj+HTb5/07
	ufFnl+lKQfFBK4TwB6OoTkcvLivmVTVnjAdZRUTMyA/SEkXvRiZ4/GmOP05c4Rm2Yfw8thfUr4PK4
	RVG27IKB+iOoe6ekQDDVNIHb2djfRnxM1GWQUdZqbNkyHQvth5dTYjVyVnU9NIfNttLZYcdwbl/6F
	ULnE5rmd+5DnJ9wo1Js36B+qWXOvIEf8X4cvBfTmqEdOb35XqwI3e047fSTngwIo+FnKkSw+7i/+1
	VszIKFA+ktLNXjTrtu1eF+/59Zky3d6nVjYNkUAMgJ7Yb709uIZt0NrrzCsr/qVcmTn8627HFTkDE
	aWvZSTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwA6-00000007MIF-1BrY;
	Fri, 29 May 2026 12:18:02 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwA3-00000007MGx-31Qe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:18:01 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-45e80183514so9768322f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 05:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780057077; x=1780661877; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a4SS+MLrRfo7JjMGlt0hzA5ZHD4Vfkl52EAZVg4EXVU=;
        b=m4P+6kdwKaUPZod+QyuQVeAGpfG12aPZ+kpFf7s/y4YVdA7/XZLqt1im8LP1/SoX+m
         Q8UK2Sj68yGyPUEmV1jFzMlFFlNAYopB7biip+Xv98gSgrNbdTLLWEFMWSpkaqQjp5Ge
         YaRsy44LC3lCFrd+V8SQAwqho4y97baMVqrnjYbvEE4JX9VajHmaoTmYpHrZJ/NAJMS7
         M6vBH+rmuH3A0DnKdgCBuOEiJxtLDeH7w3oMi48nmT4MQyN7UvaIUnBBt6l0bBeeyTNS
         cqZNz5dk+nIEpk+CpekqlEK8WjefF8+ixLfPjBOJ3QVrC86M9gzdoG9kuMWNCYIb4Yn0
         h0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780057077; x=1780661877;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a4SS+MLrRfo7JjMGlt0hzA5ZHD4Vfkl52EAZVg4EXVU=;
        b=E1ktx+gLcNyb+S3k1qKPEKtC+oS27csQe2bfkRK4ed1LL4YM77fIFBRP4tsPEuSdrQ
         3OFO4zCHiamjjzob6Egum1TpdUcj6/tvoh+2W42/um2aZd5li0sX/8tesj735DLW66jm
         49uF2XQBtZ1kUtzNpPP6iUNNvbDWyHKCothyfukiNY9lIYM6Y0Ly5EABA6kmiQJsqshp
         /JXkMDo1F+FbUbuCwPP9Pg4JJv+5ordls2kGgHh0sRBpW71ezzQs8iB8o1NXn4c12/SO
         TZEwiMPtUMYLdcgvppXJl7dLSZKKkYGXiZKp6Kc/axLzRjl5cJ9KxZrVN/9WwrL5iun1
         zmtw==
X-Gm-Message-State: AOJu0YxtABkPFyT9kvT/7QDHtIUvX2seM+HTHOzhZ76H1/c8HPTxvKF7
	yRlPps95ZLBLOuJ9Pq1tJvo0GcjaOAcRDysFGGvyWq13P8JaqlVbg0YjhFQpPFqOQcz1xq4cqH0
	Ftg==
X-Received: from wroz13.prod.google.com ([2002:adf:f1cd:0:b0:43d:732c:5800])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:468d:b0:45e:ed7e:f8fc
 with SMTP id ffacd0b85a97d-45ef142a676mr3373752f8f.12.1780057077301; Fri, 29
 May 2026 05:17:57 -0700 (PDT)
Date: Fri, 29 May 2026 13:17:52 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.929.g9b7fa37559-goog
Message-ID: <20260529121755.2923500-1-tabba@google.com>
Subject: [PATCH v2 0/3] KVM: arm64: Fix host/hyp tracking on share/unshare
 hypercall failure
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_051759_807425_699F6BE1 
X-CRM114-Status: GOOD (  12.26  )
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

Hi folks,

The first two started as bugs I found testing Sashiko locally with
fixes to review-prompts. The third grew out of the v1 discussion.

share_pfn_hyp() and unshare_pfn_hyp() in arch/arm64/kvm/mmu.c maintain
a host-side RB-tree mirroring the set of pages shared with EL2. The
hypercalls they wrap can fail (page-state mismatch, EL2 refcount still
held), and neither the per-pfn helpers nor the multi-page wrappers
cleaned up correctly on failure:

- share_pfn_hyp() left its tracking node in the tree on failure,
  leaking the allocation and presenting a phantom share to a later
  unshare (patch 1).

- unshare_pfn_hyp() erased its tracking node before the hypercall, so
  on failure the host lost its record while EL2 still owned the share
  (patch 2).

- kvm_share_hyp() returned on the first per-page failure, stranding the
  pages already shared by that call: the caller treats the whole range
  as failed and never unshares them (patch 3).

As Vincent and Marc noted on v1, none of this compromises isolation. A
page that cannot be unshared is simply leaked: it stays shared with the
hypervisor and is no longer reusable for pKVM. So kvm_share_hyp() now
rolls back on failure, and the unshare WARN_ON()s are left non-fatal
and documented rather than promoted to BUG_ON(). The system keeps
running, and only later pKVM reuse of a leaked page would fail. We do
not expect any of these paths to trigger in practice.

Severity is low and this can wait for 7.2. Patch 3 builds on patch 2,
otherwise they are independent.

Changes since v1:
 - New patch 3: roll back partial shares in kvm_share_hyp(); document
   the deliberate leak-on-WARN in kvm_unshare_hyp() (Vincent, Marc).
 - Patches 1 and 2 functionally unchanged (patch 2 gains the call-site
   comment).
 - v1: https://lore.kernel.org/all/20260529074341.2271950-1-tabba@google.com/

Cheers,
/fuad

Fuad Tabba (3):
  KVM: arm64: Free hyp-share tracking node when share hypercall fails
  KVM: arm64: Avoid host/hyp share desync on unshare hypercall failure
  KVM: arm64: Roll back partial shares on kvm_share_hyp() failure

 arch/arm64/kvm/mmu.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

-- 
2.54.0.929.g9b7fa37559-goog


