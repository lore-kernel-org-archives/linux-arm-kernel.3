Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B258CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uk5VtD5Dd7LbENAYytw7INJT4NVu+9j4B2UId8tkh5M=; b=imyFg7FqgCsgz5oUK+qgD0YU7j
	D5aFdofcnO78V2VBZK4foJfF+B8ipaVy2kluaqe4v4X/wpcNaBLwaKIixGCC/qiq3aro4dvp68HUz
	cWxHjd8qTGMJUwpr/xSZCu16uZxJ8KSQ137nvqxNV6YMVlbqdvedWQ3FAqmnilDMkbOP5a5E3RNQI
	kQJSZDyCaO0XwfkfEA9JePISMMVW19zNW6pX+x6nIViKm/Zs7GjfsEGESFrtSJhlRABGpBFdW/ck3
	PFZ7XbB854OX5uvICti/EKXXkqpBf/BLZfm9gzDn3Td9yZ4nSefiJD7s2AQKZLgcEdgqjx0Ad9sRS
	LbDtplbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGd5-0000000BpA5-0Wcm;
	Tue, 04 Nov 2025 12:59:19 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGd0-0000000Bp4I-35eJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:59:16 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4773a7dc957so47104855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762261151; x=1762865951; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uk5VtD5Dd7LbENAYytw7INJT4NVu+9j4B2UId8tkh5M=;
        b=aVHofgwmafJfUY8CAN6PNG0Nk3gLyicrhHyzFVw1Z/pSB4EZIXElekjVjE8JeSZODG
         KTIbmRYc7Cfx7BNgTinVpzmV+NouELiMy3VjX0smZXvigL2xxmx+TtxWexsEEILio83G
         cNE4k7Lt37gjlhWdcFsUftieFZkV2u6vnJ0/WgoRCEPAdDZTLbm9UWA8+pB7dJLXTKnS
         dJpVUx9ftP7kFbKDoz/kOFgN2LS5Um9icx2osFnl9K9FwvnQm7UEQjQoK0vX9YqICSbJ
         +MOOswqirSUHoaA8fZM+0hMkoMf0Y1ZQ8qh4ZXiWnAA0ABh85iOyMb2K9Hg4YbfwyEmx
         Qcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261151; x=1762865951;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uk5VtD5Dd7LbENAYytw7INJT4NVu+9j4B2UId8tkh5M=;
        b=B9wBsABvGL2aRNJ+omqjknRAxEk2dKmBL6/09JmgXTowG5MOA5pKjTpbq75wCE7Ej1
         bNVdW4o1mlwyZccxf9ZIbG5FabRuy36A2sbm/ErEZdMo1NxF4dEJZucxF4aywDWSX5tb
         9wqThoyjq7lof1S4fMtfotaqVxhVdSdTKmYTeMnPme7S0ZJrB4jlI09HhHwGglmaiiZr
         DGUW/9+p3zU4I/YJDptOOHeJk21+jYa+3bMAGkcxAXXEcyej1ntGwaACI8G9419lX7ej
         rxxdJpYs4vr2/23KCZi2K8hSbDUM88t9Qxw2pXjMZXFtjDRpRAI/FwdVX3VR07IDs9mH
         tjhg==
X-Forwarded-Encrypted: i=1; AJvYcCV2NNCrzPNQZU8E6uM4GCt/2hk1EG+DHDbzgnDmApZd1zqLqrKfSzQdsu73nU04S1QOU91qbqPMiSn2GDyU77dx@lists.infradead.org
X-Gm-Message-State: AOJu0YzIfpNfTHQYKfpGh0IfnqQbEBGfsPY7D18qnKxedNQPZYLlrP3l
	+6zOkCbyYmZZLiUcUa8hW1z6Tpi4F2+RggHbUYZAlFTTwibiU5d0aCBGKmxxr+OihYliwwzBgFS
	Qqg==
X-Google-Smtp-Source: AGHT+IGism7LbQKy6ZqLAEKd9DnR+1VbuHstFtUryMoMnYhRFZtVWfFSLXUMcBJb/XR+uSkPEq7kurVWiQ==
X-Received: from wmbd7.prod.google.com ([2002:a05:600c:58c7:b0:46e:5603:f679])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b6d:b0:475:df91:ddf0
 with SMTP id 5b1f17b1804b1-477308ce089mr156752655e9.33.1762261151514; Tue, 04
 Nov 2025 04:59:11 -0800 (PST)
Date: Tue,  4 Nov 2025 12:59:03 +0000
In-Reply-To: <20251104125906.1919426-1-tabba@google.com>
Mime-Version: 1.0
References: <20251104125906.1919426-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.997.g839fc31de9-goog
Message-ID: <20251104125906.1919426-6-tabba@google.com>
Subject: [PATCH v1 5/8] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_045914_936042_F5924C65 
X-CRM114-Status: GOOD (  13.10  )
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

The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
register accesses. These accesses are trapped to EL2 when the bits are
clear.

The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
had the polarity inverted. When a guest did not support the ExtTrcBuff
feature, the code was setting E2TB. This incorrectly disabled the trap,
potentially allowing a protected guest to access registers for a feature
it was not given.

Fix this by inverting the operation.

Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 43bde061b65d..df0c59a29b35 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
 		val |= MDCR_EL2_TTRF;
 
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, ExtTrcBuff, IMP))
-		val |= MDCR_EL2_E2TB_MASK;
+		val &= ~MDCR_EL2_E2TB_MASK;
 
 	/* Trap Debug Communications Channel registers */
 	if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, FGT, IMP))
-- 
2.51.2.997.g839fc31de9-goog


