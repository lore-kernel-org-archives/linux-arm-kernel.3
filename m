Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547BFC624D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uF6pAPbrtpXX8UslsPQ/1ObXO+PhRH6Th7tQ+yPzjrw=; b=yOeRd2m9Hlf3cTdturchG6oX8/
	9Xw6ne5i2PQCwwfmBFE4HeJayNHWZ2Pk1xjYVvCMu9OL3vKGNSYWBgMaW3plkqzFWLoI/OljsEO8W
	KqYVotmxHwiirBx1GwqCbDY/Jebxt9z6kBs395Bl1L7XgfzgBIx+vdQZ8H+OE2V8jR4yR07m620/I
	Vd6kOcZiCXtzEard2z6UttDYd1Q8etyFSIcZzyId+8iKPsFNSuoLh9IHH/rD3tyxpGKZ3rp9HJhOJ
	imxQGtgb5drPoNbLVulzXLQv9WbOuj8+r5qFXin4sZ6azcQ6rRm33g31+B3HmsG55HR7T0YC23i0X
	De2tPshA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu4ue-0000000Gb4M-0HAW;
	Sun, 22 Feb 2026 08:34:00 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu4ua-0000000Gb41-0LaJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 08:33:57 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-43624564fc9so2927709f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 00:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771749233; x=1772354033; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uF6pAPbrtpXX8UslsPQ/1ObXO+PhRH6Th7tQ+yPzjrw=;
        b=YFV78f/yWYAJ5cL90KQMbTzX7JYK7gluHJArDwuKNzmT1rl0RqLfES8n23x3mJ3H+L
         uds61YLv8HcbRL79T7ulnyhx+uX3cGvEfwsTPur7VWm8lvFxD3Fsh2l5iH2KvDrNfMlT
         5O/1t1SDuVge+ECdGazOEmzq6LXzlpygaBTsgYlSshwDtwxwRhjT3eg2VHF9/NkEMpnG
         pxdAecPZtBDrTUGBmYZskAzKV3ICwxoxWQo/pZTWNTdkIPv+NQ4N3obtOIPuxHP5EjV8
         Qxd7VAqxGPGDCSuDA37uQU1H2CxJnIUXJu4vIXv80UXpJOw3+nqLJdmuy1BvR295OHSG
         e/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771749233; x=1772354033;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uF6pAPbrtpXX8UslsPQ/1ObXO+PhRH6Th7tQ+yPzjrw=;
        b=aq/DtzfUsuOLfq4Y+5/F0AtSgzUexUkIcLtspCh4wMZqqVP89Q9vHvipAXBXVl1eSl
         D1ZrTmKAAeR7Y2kZksEC8jkybAX63BgrFQTJpVSG8+WlCNDNHENw1sMZMwNK9ooHkRz2
         AL6NXVKWGaA7sqY0Y5b2Lu8oGFmzhyHa7VoN/AOiQgo8LSDYboGv5M4mVZY/WgYRjPE0
         g6XRCRQUiW/wgbawxkfgUqmdugVW4nF/0C19HsSdshESmByOzqvAqBjaPlQ9cuCnxpHp
         tf9dyp+l//bC6HqcL7xB/lDaSTozfeYTn7Dhui9TJdXnn+rDi/pcDO/2hcSjbYI+cq6W
         eXtw==
X-Forwarded-Encrypted: i=1; AJvYcCUnAj+hWZddSU7tgPcO/CT+G5Wf37v9ruf0+85dLpXyJmP6kTJATuZIBL5qRfw3q/dF78aj+HBLJItNF0Aj9pDS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0z5gDCCSP2/zwI/AhAnA33L2OQrPH2qzgFKUtnjF8iHlIcQaX
	IjxFPrETs45qcrqZBW2LmY/j+A5XFr4OgIX5/uW5QUBSrZoattICDOoLuO+TExgt6YJbEdsR5Qx
	p1A==
X-Received: from wmqa20.prod.google.com ([2002:a05:600c:3494:b0:483:1069:2eb4])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:828c:b0:47e:e48b:506d
 with SMTP id 5b1f17b1804b1-483a962e003mr93985975e9.16.1771749233335; Sun, 22
 Feb 2026 00:33:53 -0800 (PST)
Date: Sun, 22 Feb 2026 08:33:52 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260222083352.89503-1-tabba@google.com>
Subject: [PATCH v1] KVM: arm64: Revert accidental drop of kvm_uninit_stage2_mmu()
 for non-NV VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, qperret@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_003356_166965_A5BA0303 
X-CRM114-Status: GOOD (  12.54  )
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

Commit 0c4762e26879 ("KVM: arm64: nv: Avoid NV stage-2 code when NV is
not supported") added an early return to several functions in
arch/arm64/kvm/nested.c to prevent a UBSAN shift-out-of-bounds error
when accessing the pgt union for non-nested VMs.

However, this early return was inadvertently applied to
kvm_arch_flush_shadow_all() as well, causing it to skip the call to
kvm_uninit_stage2_mmu(kvm) for all non-nested VMs.

For pKVM, skipping this teardown means the host never unshares the
guest's memory with the EL2 hypervisor. When the host kernel later
recycles these leaked pages for a new VM, it attempts to re-share them.
The hypervisor correctly rejects this with -EPERM, triggering a host
WARN_ON and hanging the guest.

Fix this by dropping the early return from kvm_arch_flush_shadow_all().
The for-loop guarding the nested MMU cleanup already bounds itself when
nested_mmus_size == 0, allowing execution to proceed to
kvm_uninit_stage2_mmu() as intended.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/all/60916cb6-f460-4751-b910-f63c58700ad0@sirena.org.uk/
Fixes: 0c4762e26879 ("KVM: arm64: nv: Avoid NV stage-2 code when NV is not supported")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/nested.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index eeea5e692370..7f1ea85dc67a 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1154,9 +1154,6 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
 	int i;
 
-	if (!kvm->arch.nested_mmus_size)
-		return;
-
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
 		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
 

base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
-- 
2.53.0.414.gf7e9f6c205-goog


