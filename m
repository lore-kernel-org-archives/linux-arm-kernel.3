Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F80109B492
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 15:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x2NhqZlEbP4csIZQcaYFum7ffnUCZ232qY6vPrwtv/I=; b=2QX/epz10QOikwukr7FoictIyO
	PMtevjGgVDvBqcHqVQGdrS5BV+OA9ghTEWeqtGalnzfQPAKfZO5aE/LZpyPHBdGJNITEikBr8EjM9
	l00mptilVKZLKOqZlAtvTLi/Rf7XooqKIJX7JUHa4X3D8R8ONBDSe8TM5pMwShgfRKV6DeY/RJ9db
	5P2WErmoSZJAYTCQOPrDdLEcaGqzcHq/CUta495hyaiZVv269adjMfIZuwcptohlOp+/RZ4tn4UMO
	3+eH/izogzdFy7BircJr+DUDa0vDgKpqEZQWTBK3OCYWXL07c5vaTGLJSijP2Hn3GWAZIh8+LD3Dv
	43RqaGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bNL-0000000DD2A-3i88;
	Tue, 31 Mar 2026 15:51:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bNK-0000000DD1h-0EvZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 15:51:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE85D42B85;
	Tue, 31 Mar 2026 15:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7CAC19424;
	Tue, 31 Mar 2026 15:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774972288;
	bh=5h/uBM2muFZOCKdtTFVzBEJDVsBTI93hti/zrJ4A0Zs=;
	h=From:To:Cc:Subject:Date:From;
	b=vD15Zsec7YKIv06fB6PSU9ZilFccjTHPkKbSw+EnLIdFOcoL9W/pj21x3l8hwKkKi
	 7dzwTzQzfr5lSsZ4P9BHAbuP6fNe0SjU0mk4/24Gl7C0RqISyau5MdwFVlzZqb2m2b
	 mMqGEXsuRaQAsds+8/L/Uft8eszCvUAo65B2kUsKDJJ63YyD8CIwAgrvP15XzPmQUh
	 2RhjLS30GvAu1F14D48MbBa9Y0b7tyPgd9IfBct7c5SZ3ksPymAVY7LZLtEaj3Sfy1
	 eAjXB9GjhXoX67AFKcZX/eNr1CSzFmuIdnKIoYgCD2lKeFUQDVCbqTixc/YTe47UNh
	 p6T2Ag6cqgDgA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH 0/3] KVM: arm64: Fix teardown of non-protected VMs with pKVM
Date: Tue, 31 Mar 2026 16:50:52 +0100
Message-ID: <20260331155056.28220-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_085130_116562_5D01F464 
X-CRM114-Status: UNSURE (   9.46  )
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

Hi folks,

Sashiko continues to throw rocks at me.

This time, it spotted that my fix (introduced in v5 [1] of the pKVM
series) to prevent taking a reference on a VM in the 'is_dying' state
also prevents unsharing of pages shared with a non-protected VM if that
VM is torn down by its VM fd being destroyed, rather than the usual path
via the MMU notifiers.

Rather than send a v6 of the whole series, here are three patches that
apply on top of v5 and fix the issue by (a) preventing teardown of a
referenced VM and (b) allowing some references to be taken on a dying
VM. As an added bonus, this simplifies the locking on the reclaim path
because now a VM reference is enough to stop the page-tables from going
away.

Cheers,

Will

[1] https://lore.kernel.org/kvmarm/20260330144841.26181-1-will@kernel.org

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Zenghui Yu <yuzenghui@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Quentin Perret <qperret@google.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Vincent Donnefort <vdonnefort@google.com>
Cc: Mostafa Saleh <smostafa@google.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>

--->8

Will Deacon (3):
  KVM: arm64: Prevent teardown finalisation of referenced 'hyp_vm'
  KVM: arm64: Allow get_pkvm_hyp_vm() to take a reference to a dying VM
  KVM: arm64: Don't hold 'vm_table_lock' across guest page reclaim

 arch/arm64/kvm/hyp/nvhe/pkvm.c | 53 +++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 27 deletions(-)

-- 
2.53.0.1118.gaef5881109-goog


