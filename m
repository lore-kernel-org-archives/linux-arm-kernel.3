Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B147BC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 02:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gGnBH0JUMzyPu3dd9hYfJ7ZyZxE1z3RVWLOS62okldY=; b=od8AnN/JcNBlfmd2LEngsTR4wS
	V9wLp7BXo5JoaKBb8wbuWxg7KjXqSAJODXegTXSCvJKN2iLpLCrgSgYf2hd2WWQkPn7dXUJUX8Mh0
	ASj1Zzw4Nw66Z3eIAyzugsTHEUmbDVVzsCC3mR2PsiK/tgB1U4zB7GvEkkRPhmRdckAiPjKRtgUJ3
	q3RIIaI3vAplT41vAp0jCnWBtu0Fu1R3FCv9K46YJQGC3OvESpuVDYfkQQEok5UdsEhEChwj9UU0u
	yXg+MkNhLRzYg19GWoSbXitTjl5Rw5VQ+SH/5j3AUZf+50AZA5T0D3/F75popJPRgvAsZXQlUu8QV
	ToUA1XNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OcY-0000000DLJL-2Uyu;
	Fri, 18 Sep 2026 02:46:38 +0000
Received: from mail-pz2-x2b.google.com ([2607:f8b0:4864:3b::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OcW-0000000DLIx-0vzy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 02:46:37 +0000
Received: by mail-pz2-x2b.google.com with SMTP id 41be03b00d2f7-cc515bef69dso122109a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 19:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789699593; x=1790304393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGnBH0JUMzyPu3dd9hYfJ7ZyZxE1z3RVWLOS62okldY=;
        b=f9XtbWSxYn+kb7NFuz6AfJDvBEgCWwcsJ14AVi0Dhyroq280SwLNNQ6ulkInWaj8ZQ
         Xzc7sKLEAjUj6RdYX4xBtFVsfdZqeAYZFv0VAWew7LjVRt8+rM538mBXKGIcYgLvQiaJ
         4XBcYve9fRBY9npml1/oR3h6vFggaPqmPQl2qDQ0Rwv5ON5jFhJjQXP7P6sG1IhdUFtN
         ue2Zm7Gy3NtEdGSZBeTyqgE/ZzMKHQIfmWVJ/SG1qF90u2QdWCqo1n5qAcshqvnbq0Qt
         BrockumJifCXY8MoO+ChXfVWFdcviPQyDEt1lq86ZFvJph8cXIv5cqSuws7ivwNv1cua
         sMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789699593; x=1790304393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGnBH0JUMzyPu3dd9hYfJ7ZyZxE1z3RVWLOS62okldY=;
        b=Y09GT58OsHDN1/GI8wdZFOz6o+T/q8mtcRt2tPRKmEk9x0MzIt3LLTvnFBE4aTmxjn
         d1qAX4T4AnHLNufX9edGO2Ex1X9vMK5d6Zgccev+sQkcNZ8tjq9yY0S7DEMz3LUD8m6m
         sqj6j2Lb3pibx54Hylo+z3BEd+QdqryUO3cYe1h0TpEfDwSkEsTJLT0KZb+M9pyFAju7
         mvnobb4A5QvsTHN7dyuy94ctZfsPVmX2x/C3UnCHlULq7Uio3dm9ahX3uXhF2chBmS0w
         4BbH3Kp/ZrjfIkJYKSU5C6N/GFQ8kMJyeRAkws+7NC1qhYKUWk0RlhJoy68E/hUb4i1P
         XYtw==
X-Forwarded-Encrypted: i=1; AKwUvByagTqYtxSVAuyAR80MFapNJUE96D6H8iwTTcEyXU6HfjiIPh++ExYtD6PPZ5yiK6k6GwVgrAtDHkNVP50BvqUU@lists.infradead.org
X-Gm-Message-State: AFuF++m7miQPudBSaYmqRFgUYll1otTBDu8ytBEkT3icrdERbA/Gcuza
	Jfy2viUpio76HbGkrD5nBwfW2/eoxosBvRqiStndYeSQQiKzgdM1go/CLYxmYGeG
X-Gm-Gg: AYBFou1As4/WXOvjSJqblYtC7XNuDYz97le5N8hZOs1EsRlySJcMqaHgy9lujSNEaAH
	7HWuawOUNibYaZlCvWLnpIBZX26Tfw5zT8lBmrbuimM1CIdAJjiK+csVGhemQWpwsin9/eH5ESv
	VFuC7b8D5Khsv3I4vfSPRjFvzsg3ygXzV1GQTvtwOg0+P7eFDVLSlh/lFtkCZdi6F4Sl9+UeXci
	mtQHoSSvygqeB5Pdu5hK7HTr7Ak+jMMcasyquHMJ33rL3Hi/SaIcmFM+Kxid0su+yW7zeKv3jzj
	0R8MMlCtt5bDShaM3L1xkdTxl1DyuCVMcpTl6k6/j66qNAfpfKbSsRha78cuhqqwK6QHdjK2PwD
	SeotLaHbNaltKyfW7quX/kp+nypN9SJkY8sqbDGaz88WZ2vWygppW3+7JxiF2dMt18Um62g//UF
	3c2+nIsPwwExHWL32btrjOgsL20HAoGkx7cdjiXODpjOFhZjSqKQK/O24uT9s09IjDYmjuDV7/N
	LFcrowrMvw6air2RMoiCE3vpr+lPQUHiJFZXJ8=
X-Received: by 2002:a17:90b:3c05:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39e54af0c87mr2618598a91.5.1789699593167;
        Thu, 17 Sep 2026 19:46:33 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:ec74:2ce6:f939:d0ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c287b0293sm349521eec.24.2026.09.17.19.46.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 19:46:32 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 0/1] KVM: arm64: vgic: fix UAF/crash on remote LPI disable
Date: Fri, 18 Sep 2026 10:46:19 +0800
Message-ID: <20260918024620.83869-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_194636_285566_3029B527 
X-CRM114-Status: GOOD (  12.01  )
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

From: Yuchao Zhang <ndaugoing@gmail.com>

Hi Marc, Oliver, and KVM/arm64 maintainers,

By code inspection of commit 6da5e537f5af ("KVM: arm64: vgic: Pick EOIcount
deactivations from AP-list tail"), a race condition exists when a remote
vCPU disables LPIs while the target vCPU has an in-flight LPI in a List
Register (LR).

Specifically:
- vgic_flush_pending_lpis() unconditionally unlinks all LPIs from ap_list
  without checking whether the interrupt is in an LR (irq->on_lr).
- If the LPI in the LR happened to be the last one populated, the per-CPU
  pointer *host_data_ptr(last_lr_irq) on the target vCPU is left dangling.
- When the target vCPU exits guest mode, vgic_v3_fold_lr_state() starts
  traversing ap_list via list_for_each_entry_continue() from this unlinked,
  poisoned (or freed) last_lr_irq, leading to UAF or an immediate panic
  when locking irq->irq_lock.

Solution & Scope:
This patch prevents unlinking LPIs that are currently on an LR in
vgic_flush_pending_lpis(), ensures *host_data_ptr(last_lr_irq) is cleared
after folding, and skips the ap_list walk when eoicount is zero.

Note: this closes the primary race (the last_lr_irq node itself is no
longer unlinkable while in-flight), but the fold traversal can still
race with a remote flush unlinking a subsequent non-LR node in the
ap_list tail. Fully closing that window needs the fold side to take
references before dropping locks (in the spirit of the prune-side fix
in commit 7258770e5814 ("KVM: arm64: vgic: Handle race between
interrupt affinity change and LPI disabling")) and is left as a
follow-up.

Any feedback is greatly appreciated.

Thanks,
Yuchao Zhang

Yuchao Zhang (1):
  KVM: arm64: vgic: Do not remove in-flight LPIs from AP list on disable

 arch/arm64/kvm/vgic/vgic-v2.c |  3 +++
 arch/arm64/kvm/vgic/vgic-v3.c |  3 +++
 arch/arm64/kvm/vgic/vgic.c    | 10 +++++++---
 3 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.53.0

