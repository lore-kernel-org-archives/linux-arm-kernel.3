Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7EFC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=reUNVFknWKauPO5wtoSWArEl3uNO/FMpDcLAwU7OX7w=; b=MFY94XWebVEUvAXHZU+coqKvrK
	pJarkC39w4tfjAeVuGVKAwxe0BhjKu3v2k8k+wSvgUFByvkzINOGr/vnrIctDbjYWmvEyhqHkKPL0
	lN+hx+sQVJ9gLGU6zttLpNF/NvmfD3gcHIwgZ7F4LB5KbCDmiqPtV9iD3dPgR9+XMEAd3MdvIDdJo
	sVGmQ9apOKxvp5ejwLj5nbpQtYiEKuDso8fcf/eU9hDEJLYXwIUEWdxD95+pgqlBi8NZ8kDUbn9WS
	fqFLTOwzBFMXHkioa43BEUb9qXdKqd+aAFRJQQddKn4HsZiehWR1XmVTTBdFwgUeX/Q94JYhVhxoS
	t5x6Inrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77HD-0000000ArtD-3DI1;
	Thu, 17 Sep 2026 08:15:27 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77H9-0000000Arqi-36bT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:15:24 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso4646025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 01:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789632921; x=1790237721; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=reUNVFknWKauPO5wtoSWArEl3uNO/FMpDcLAwU7OX7w=;
        b=QYzTbtn4P2EKR6pBh9Iqc1pxNQiN/Ph2HBLpJtc7P8Hb3e9tkGzBUg50rIMHZZVTDT
         EpLgn/2W2jrR+TJU6b3L/lMeL9wb5CvkEax4DOkI+TQk7z8oqSdGA+oR/TjDBElJRbCn
         WvHGnqFhtnTF3otCKdsJ1sBpAwIuK04lTIITKq/Bgl9Tp9Grr6B+LGQuNbmv9BkExsnI
         x9gug+dZ7fLrSDnZtMo2r5kRrLwFXS6WCyRiTcLRCkgy1k6TTMxjGl2tuUrvXBE2mPWw
         6dUId5brGZMNCS8NAWovcF1kD3gHfgjoFTAMNzCJtl17W9VCOeIOGOoKEklN/oOV2Wma
         X7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632921; x=1790237721;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=reUNVFknWKauPO5wtoSWArEl3uNO/FMpDcLAwU7OX7w=;
        b=1gIYbFX3AU9apputGzj6tQEMb+ZIU6H3GqPy2KzUbNN7MGM3x/QXRjP+XnC6OVjXP2
         yEdyDwCVD870AyfC6MARjtcAPeqRXS433huNKb/wRjeuwrwxERBOIshblPOQ6LVxhPK4
         dHnVaEN1O3gQ8lJQeXfuxg07l4MDjSQpza0H/fIvYBYLLX3NmxD74ZP7mJnn6UZfnvjB
         LHjR3WPLcBFwOhWpIkv+fSO+K298VFkZ++n4kf8FA36xjHfm3Bsj1pGYK7JtBW2nyDM0
         7a+OuAF6dYCrlViktluqCTA8Lcmo8QCSGAcf1ESCz5jugpiThXbj7p4DEy6Aq0AJ3sJb
         xBaA==
X-Forwarded-Encrypted: i=1; AKwUvBwTec/DtDlrRTML6R89NNYWk9681qfzwCyNqCC5WbY7L0V3ASk2Iw4obFCvCFGD+iMNLGY1RI05dcSLB8oUzG96@lists.infradead.org
X-Gm-Message-State: AFuF++maiWtymkZNxewxXZVUZSac0Kdjlyj5Iw6mLEGvK78kr9thsS5G
	usHYMUW4egqJhHhzrDQTJeAYsGnK7I3gJ/G9jnsNRiCwcARPMUeS4g1Jxk1CGo3o7rrxBVHIWFd
	2ep8nbE4pNzbBy16PEPYimQ==
X-Received: from wmbjv11.prod.google.com ([2002:a05:600c:570b:b0:49e:65f1:a3ac])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5486:b0:49d:1d7e:4085 with SMTP id 5b1f17b1804b1-49eb732347fmr68061125e9.22.1789632921225;
 Thu, 17 Sep 2026 01:15:21 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:15:10 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917081510.1539013-1-vdonnefort@google.com>
Subject: [PATCH v1] KVM: arm64: Disable stage-2 ptdump of pKVM
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_011523_787111_B48C9A22 
X-CRM114-Status: UNSURE (   9.62  )
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

With pKVM enabled, guest stage-2 page tables are owned and managed by
the hypervisor. The host's pgt is uninitialised.

Skip registering stage-2 ptdump debugfs files when protected KVM is
enabled.

Fixes: 7c4f73548ed1 ("KVM: arm64: Register ptdump with debugfs on guest creation")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
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
2.55.0.1082.g2b9226bbc0-goog


