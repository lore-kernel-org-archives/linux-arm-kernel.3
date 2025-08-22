Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04C2CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L/zK7mkD8fhIY1XCicJNUFjtjYCKj9ei/cY2eINbo8s=; b=r+12oPjmuJVYNdd8KkDsXZHLdB
	mgKRO8ku+myHMxKGRmBg2twrPelhiyP4IRJPz/RSjeNIVBBrekwk5Ki08ZIlpAhP5/XeJKneylX5i
	tnuwLb52SNkFwqTipKOBOZXdKUdbL2h4uXnKewEVIlYvw9MFEThsuU8Ap5mDI8bkXslJdk2bpdjxU
	TSTEd+VGtuft6CdoIV90kX6mOVmOAKFG5Wdh050tzXbfBdfDeKu7N5tmpUYcuFx5FjqEWjqIo4dUj
	Yq6ZcuigKi4gifcf2CdGRtqeWtflsoTGj84d1pjcPB+SBKVBhcMY/F5vDhkXzaCmzzbzCxJlrge3Y
	p+gfGfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPr9-00000002IcB-2EIR;
	Fri, 22 Aug 2025 11:22:51 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIGi-00000001MOo-1mH1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:16:45 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b471754c159so1098748a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 20:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1755832600; x=1756437400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/zK7mkD8fhIY1XCicJNUFjtjYCKj9ei/cY2eINbo8s=;
        b=GeTneMm6B5EJ2X9W4Msa3NZdbJoRzW6ZAXYygcOeHJSNtfC/6u0KiARzUtgWf8d98m
         iZTXcexGEEhhGaQkH9xt6VDGaOBAm1PvKjgY/xezUjcm0KU0AKpK/nfW+2Xftr6Y7Iaw
         6Cj+I8yROEA8uM3yP9Boorhl14TdnkgO6Jos8hxwBl1Lw94AcdZ4jzwxW/7+Xh1DUyQN
         eV+Pjt0zBIhMYMdbySMl/c1vzWrAXFPJ6rAb83Q/5a042TkfwjYF1A1SkxKUuqY4ViWH
         I4vhWx14TYAnuxvD4dPatSdggyrYoNbYccFuayNlosjvuq+zPCJwamP1MChPIkzOX51q
         V/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832600; x=1756437400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/zK7mkD8fhIY1XCicJNUFjtjYCKj9ei/cY2eINbo8s=;
        b=fzUcL+lqWKn1C6Re7A6IsMmIxMmzErXpfXDn+6Eiz1R0ezotlB1O+z1AHNZwsThEgX
         yUJDr3pUXjSU2BOl9Yio9OaEa5F8azHFCLlZ3JYqc8nBR54KURWXg6D++qT9pKa7zDeS
         zpVt4c5CXJ7UI8hvciX+13TmWh9wnREMEoI2zV9CXY9gnsI+Yi1bhRgdxqchUWXJSqJI
         dBnCExOTKWrw0p0QH16TXjU7rRHDNUjFHsBJhBGUuYz5OmPTw9YtGPdlVTmH3zYxvlSI
         b2lPBsb4COg1Jg0m44XIbIr0+u8CjMEIkBvDroCaEr9dd9P70oaNlFYUzPb3sKXGXTUC
         eFAw==
X-Gm-Message-State: AOJu0YxcYVkNTJLzAQWm54VGl7PmZThGy2EO4iMG2bS1XCf7/L6nRgpd
	Is60KVBUc8LocQKZYega8eIVU97H3mps3er0ha1sx6xCMnGnL09kKQn/kjoBu91kbuw47i3GLxE
	4epbt6B4Z7Cl8UU7I13YUPj0Nrtqf9/SCLEu6wLRnQkNuh9HKjhpPMdfo+W4PW9lNzG+pAUMIlK
	aliG8eCW52bA==
X-Gm-Gg: ASbGncvBQJkbwxjrByZb0vaKgjvxx/3FGFt5Q0YDejv2cVAdPilB0GLw20GgcvH8tL6
	Vv9oyNSE7wNSFDTtG/hxkMgK3+S8j8Pwo4/Gd1LcjJU052Iknr6M3nsRgcFukyLI6Y6wXkKDlfc
	bLywwNlSS43KB3ApMK2Ly55K+yafCmMCjpu76HncWWWKvH6kWng3tUyTSrKlpFGseNLvVmWQ13A
	FGlcH4lMKq7ldYxs9c8NxKT73289OwXjB4l47K3QcPvOQzPMXjmgMoOa4EWoV112N9HudbNILQC
	Mk/BIuX4LLTFeFzXQu3ENCel+ugPV40kg0PMGUJRnogD6UPYbWhOVEouwoWNiZpOQu8t8khnskW
	pSHjPA4Q+6cSFa48TV1H7F5B8JNSg2neosHwen8EkPci8mCEo/fiZRm1BUjHc
X-Google-Smtp-Source: AGHT+IGRHO829XEsXzh+WOPZNk1WyYwE7h4SZNk2NBxWmhF3KYYwHSWfii8nwJe2Ho0aEwY27Tlw2A==
X-Received: by 2002:a17:902:db01:b0:246:1a33:d9da with SMTP id d9443c01a7336-2462ef85803mr23044175ad.42.1755832600100;
        Thu, 21 Aug 2025 20:16:40 -0700 (PDT)
Received: from zenbook (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32514c4b722sm1089459a91.31.2025.08.21.20.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:16:39 -0700 (PDT)
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] KVM: arm64: nv: Allow shadow stage 2 read fault
Date: Fri, 22 Aug 2025 11:18:53 +0800
Message-ID: <20250822031853.2007437-1-r09922117@csie.ntu.edu.tw>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_201644_760101_FB3C3081 
X-CRM114-Status: GOOD (  16.91  )
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

We don't expect to ever encounter a stage-2 read permission fault,
because read permission is always granted when mapping stage-2. However,
this isn't certainly the case when NV is involved. The key is the shadow
mapping built for L2 must have the same or stricter permissions than
those that L1 built for L2, hence opening the possibility of mappings
without read permission.

Let's continue handling the read fault if we're handling a shadow
stage-2 fault, instead of erroring out.

The following illustrates an example, vertical lines stand for either
L0, L1, or L2 running, with left: L0, middle: L1, and right: L2.
Horizontal arrows stand for traps and erets between them.

'''
L0                               L1                               L2
                                               L2                 |
                                               writes to an L2 PA |
|<----------------------------------------------------------------|
|
| L0
| finds no mapping in
| L1's s2pt for L2
|
| L0
| injects data abort
|------------------------------->|
                                 | L1
                                 | for whatever reason
                                 | treats this abort specially,
                                 | only gives it W permission
                                 |
       eret traps to L0          |
|<-------------------------------|
|
|      eret back to L2
|---------------------------------------------------------------->|
                                                                  |
                                                   L2             |
                                                   writes to same |
                                                   L2 PA (replay) |
|<----------------------------------------------------------------|
|
| L0
| finds mapping in s2pt that
| L1 built for L2, create
| shadow mapping for L2,
| but only gives it W to match
| what L1 had given
|
|
|      eret back to L2
|---------------------------------------------------------------->|
                                                                  |
                                                   L2             |
                                                   writes to same |
                                                   L2 PA (replay) |
                                                   success        |
|<----------------------------------------------------------------|
|
|
|------------------------------->| L1
                                 | for some reason, relaxes
                                 | L2's permission from W
                                 | to RW, AND, doesn't flush
                                 | TLB
                                 |
       eret traps to L0          |
|<-------------------------------|
|
|      eret back to L2
|---------------------------------------------------------------->|
                                                                  |
                                                    L2            |
                                                    read to L2 PA |
|<----------------------------------------------------------------|
| stage-2 read fault
|
'''

Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
---

I am able to trigger this error with a modified L1 KVM, but I do realize
this requires L1 to be very strange (or even just wrong) so I understand
if we don't want to handle this kind of edge case. On the other hand,
could there also be other ways to trigger this that I have not thought
of?

Another thing is that this change lets L1 get away with not flushing the
TLB, but TLBs are ephemeral so it's fine in this aspect, however I'm not
sure if there are other considerations.

---
 arch/arm64/kvm/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1c78864767c5c..41017ca579b19 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1508,8 +1508,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
 	VM_BUG_ON(write_fault && exec_fault);
 
-	if (fault_is_perm && !write_fault && !exec_fault) {
-		kvm_err("Unexpected L2 read permission error\n");
+	if (fault_is_perm && !write_fault && !exec_fault && !nested) {
+		kvm_err("Unexpected S2 read permission error\n");
 		return -EFAULT;
 	}
 
-- 
2.50.1


