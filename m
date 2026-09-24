Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186A8C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2O5/B8XsB5AMjGVtBJTzj4plcOP6VCanhCNxSU42J2A=; b=t0LUUwHsFR8LAWDrrhIbAOmncK
	nu4HNAqYzadtdCCcXc0wFGEIGZNspErm0XqrHvicGxs+ZTg15Zek4Kx+e/3Fz4zI+lZQP/FDcGvp5
	S7xlNFJWimdkNxo/VtVUxruFpqv2kRFIi0vqXlxByz9Iq2WLjU69PKeiCwsfvXfep8wcGgc0S3Dka
	4eOyGuAJE7ZitqeknvUNpLj5vDLPHmkY2G+mRy+me7Att5o0XK5M+zLTmDuo3l+cqKzN5TYwGw9av
	d1uhKGdtbBFF7kErARKMm6uSoJ1gkvInffOiTep7A+KJT2LxxyOIWbcW90/183RudwLoCz1hvStmE
	8ySU2uHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gKJ-0000000Af96-21vL;
	Thu, 24 Sep 2026 10:05:15 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gKG-0000000Af8N-2nVC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 10:05:14 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-49e64b80b94so12667245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790244310; x=1790849110; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2O5/B8XsB5AMjGVtBJTzj4plcOP6VCanhCNxSU42J2A=;
        b=hN6lwpfig+vgtaHXfH0yrtvJEQPAWh435qCqhZdALGD3pRZeIZjuowJBIAmU1DwYYJ
         pfW/ZWESAxCsMpZHcyA2Gjehf/Mn7SKuAs/lYqDCOCXSu3qx6b+NWDleOwuRlaoOT4O7
         mxbVS9M+DQD5v1/hytwXezdehHl78bNRYpwJa/de1MNmEU5Q3IxSjJu9d336HJKELnrW
         BRY6rH6rhYSoDPb48+wAJuZ/czY7GSsg5E0Cg7BfxrdQxByvpRRBAnuHlj0w9l9DN9/z
         HQYM28pv31dVxrIV0wGEFtbFrxCqYL7MmoF10phCff0wfuy8xaabraQNMdF4QsegI70k
         AdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244310; x=1790849110;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2O5/B8XsB5AMjGVtBJTzj4plcOP6VCanhCNxSU42J2A=;
        b=RDi7zALPNDg+4f50yMulE32PNGU2C2g5MzuaOEABx9o5PfyrbenX59fOme/ED0y07h
         M/Wv29jKqoZwdWLcVAjHFLqrIAcJ9VufZEeOLEC/xPHU4mGaY45tqBWDc4+CMsoxgC23
         v92HQSs756cXo9OYWhbWzDupC1Sjb1tdICQNObaZmB0nYVAM0XvnAfzLvEcqqDbiMFBd
         WtWEhW6lJD+IYrX9JPXLUV4KmS9b368sw0aFaYXLedTPVxNoW+nqJnIH4FLXLoET+n0M
         72DUINDpBxSTi4zdmXOmMhhwu7aEfrgCgrRzZyqi+7Q6A4fITFq15HTqbJho7gN0bCTv
         nHlg==
X-Forwarded-Encrypted: i=1; AKwUvBzhQSrLiqh6XyGdcPeLb1CUCviURRAc6CPv3TI5mZRvGCkRroQ0R9oDhmbyh6TA1bKBMsH2pDhTBcPjM0V1DKDK@lists.infradead.org
X-Gm-Message-State: AFuF++n6om36Sx1xuSdPSxZBsw9oKZs2S/j00jBfdrGY3XtkLP3fS0b+
	iqS2p9Vx8hFfgGLyZBju7Sdu42tnoM23M/9naXdnwA4vzjmG+NnN270l1CjdFtzEz2hudb9WVd4
	h7m6bOyFGA1vIhCjBCv1L9w==
X-Received: from wmhp5.prod.google.com ([2002:a05:600c:4185:b0:49f:e3e0:4ca1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3494:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49fe66d0768mr30398025e9.12.1790244309273;
 Thu, 24 Sep 2026 03:05:09 -0700 (PDT)
Date: Thu, 24 Sep 2026 11:04:59 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924100459.831013-1-vdonnefort@google.com>
Subject: [PATCH v2] KVM: arm64: Disable stage-2 ptdump of pKVM
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_030512_727614_DD262C6F 
X-CRM114-Status: GOOD (  10.11  )
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

With pKVM enabled, guest stage-2 page tables are owned and managed by
the hypervisor. The host's pgt is uninitialised.

Skip registering stage-2 ptdump debugfs files when protected KVM is
enabled.

Fixes: fce886a60207 ("KVM: arm64: Plumb the pKVM MMU in KVM")
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---

Notes:
    v2:
      - Point Fixes tag to fce886a60207 (Fuad)
      - Pick up Reviewed-by from Fuad
    
    v1: https://lore.kernel.org/all/20260917081510.1539013-1-vdonnefort@google.com/

 arch/arm64/kvm/ptdump.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index 69899797dbad..87e5e7a4e612 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -300,6 +300,10 @@ void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu)
 
 void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
 {
+	/* pKVM handles the page-tables in the hypervisor */
+	if (is_protected_kvm_enabled())
+		return;
+
 	debugfs_create_file("stage2_page_tables", 0400, kvm->debugfs_dentry,
 			    &kvm->arch.mmu, &kvm_ptdump_guest_fops);
 	debugfs_create_file("ipa_range", 0400, kvm->debugfs_dentry,

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.56.0.rc1.310.g51773c2048-goog


