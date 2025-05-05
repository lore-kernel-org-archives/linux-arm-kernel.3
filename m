Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6791BC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JjAxyTaB2HZtvewgEgyYKDE4ThQVrWuUNuivvsqnLN4=; b=pOQZDQyJTw+pBjA/s4QPKV5EPC
	TAHie26z4+2mC9l+QbGal05XTv3C0y75nTE8lbfOkGWuMQwcmJsQj+T61tkJwZn3CV9KTQwZ/3dSP
	jJfz7YVJrFxC4qRt8B5K3uNONhSyxiqfypm4bcdNYiZN0Y9Jtkw+9zl3QoZv+nuf3ZO7YAUVeeY1e
	JxcQKAD1ehWK7uRFg83aWvICLU7YUbsXadq+uYDwpWsuX+zEZGsImRP3fVt/Y88OSflH0JmsRV1AH
	mw1LAJxgAc/T+6QsoTQH7fghdO+97zp/PctwRbVNCYsduTIWVs/htekCzxqbfXVYvwVztFYLYKv6r
	SdgsGncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC02e-00000008EFf-3Nfg;
	Mon, 05 May 2025 17:55:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzfv-00000008AE3-15vm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 17:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746466338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JjAxyTaB2HZtvewgEgyYKDE4ThQVrWuUNuivvsqnLN4=;
	b=Zf3UjH1yQHbgrRyjBi5sqFOup7pSQs5APv11W6irrhfof2nOTBfJ0mThjCS+hl6wg0mjAr
	f+TTbtCCiYNVs5X1MryyZkbBdRojOeVjKPMxznIq8VA3b+i9GpKo/UJPBYASw+NfVG/5vB
	Egu6ITJOPHljpEPqV9NaWffCKR+oIbw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-4yyw1-QzOZm5QI6MFE9JjA-1; Mon, 05 May 2025 13:32:16 -0400
X-MC-Unique: 4yyw1-QzOZm5QI6MFE9JjA-1
X-Mimecast-MFC-AGG-ID: 4yyw1-QzOZm5QI6MFE9JjA_1746466335
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cec217977so28113365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 10:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746466335; x=1747071135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjAxyTaB2HZtvewgEgyYKDE4ThQVrWuUNuivvsqnLN4=;
        b=OeKPzJ9agh7kNrqh1Nj0TWBKQ8vtdB9WLW/AtNpl/Tm/CLfbIg9gRmCacAg2EsAmtn
         dN9mHNvQeeUIM4maEZx0SrXR47VCeRgRiXKUbL1k8yBPQNEbYowyVMt9xVZ431FKwrhX
         29fTUQZE33UAPPIRJOx3918jsiAQ8Ie8JGqGcD79ICU0+hqMxD0lfnZ2gBq4+sEKFMCQ
         vv7uvS9ciu8pnns5qHrT04/lCJqLQwwRaiCNjbo+uoSeFoFp5zMQFxsbeYFSxn20jkXi
         7Y3oYYYqGBNkBYD6XrsNoMoJoTLGRQpXVHVmrqZTRRur1+JnOGQRRB/iaZgfQO0HxlzU
         hv7g==
X-Forwarded-Encrypted: i=1; AJvYcCWvSVtfFHm3H6+e3bDGSrj0/og8w8W4WAOFytKEM7Hu+eiQlVnVoucsBtsZY4UlgvtQuDnijukEoSvAlskeTakz@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzjjh717iOMB1ebMsEV3w0+I+ANmCveydAmmbSLXxIFzZQ8PMC
	zSJ9m3eLrd+W5oAqMN+y4QF3FMjpremYBHAqSYxk+CobYiULV/LxDulKumsisiikqSXSaRABSb9
	spTapyKxVRBFSe231VokQRtpICwmIrl1+3k6GaX9wElb8hmFyCKSKCbb6SZugFGsQofHEfgah
X-Gm-Gg: ASbGncuHcUvMBkKDA7SBZhCjbSvetw7hgPiXqw3eyB7+GYaKlbInrMHI3Nzpl7OJtZz
	e/aSUnhrT+2eZH6dEMy0eJ0GO0u1pHocgEmaoMHxs9Y6Y2zGeK5vmy2Bj6CWbJXEDMTvQfgKPug
	Kn8xsOvCmDJrCCfkiM2e+MZ8SOh8n0bEGqp5oNPJ2twFE21fS6b1M7NSWenTTPYcfcelNRtNy+w
	330OLt7n1Fzb8WrPoqYThADgRrwV1jpwRdthvKMME8S/GFdcZOZ0qW6vfGnCf2wNSGU8XhmpIbk
	dseRv7CENcd/bcTSBDGI6AsYaaFyUR/Q62uIwQaOvIbYy2+IDkD30eFWoAE6Ny335zikMhQxfw=
	=
X-Received: by 2002:a05:600c:a401:b0:43c:e2dd:98f3 with SMTP id 5b1f17b1804b1-441c525facbmr56096325e9.21.1746466335026;
        Mon, 05 May 2025 10:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFILc2vKI3/xP04PnDAD0gBqfLoTJ7gk5HkYL4nRmV2jGTs1rwbkDQtRYRRFH+l5ESk0GD4dg==
X-Received: by 2002:a05:600c:a401:b0:43c:e2dd:98f3 with SMTP id 5b1f17b1804b1-441c525facbmr56096055e9.21.1746466334623;
        Mon, 05 May 2025 10:32:14 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0c3dsm11343310f8f.12.2025.05.05.10.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 10:32:14 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sebastian Ott <sebott@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: Fix uninitialized memcache pointer in user_mem_abort()
Date: Mon,  5 May 2025 19:31:48 +0200
Message-ID: <20250505173148.33900-1-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: My2sM3O91qqDSChIdipjvc1FiSP4cf9D_inolP9uzfs_1746466335
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_103219_368441_7A8AFE22 
X-CRM114-Status: GOOD (  14.43  )
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

Commit fce886a60207 ("KVM: arm64: Plumb the pKVM MMU in KVM") made the
initialization of the local memcache variable in user_mem_abort()
conditional, leaving a codepath where it is used uninitialized via
kvm_pgtable_stage2_map().

This can fail on any path that requires a stage-2 allocation
without transition via a permission fault or dirty logging.

Fix this by making sure that memcache is always valid.

Fixes: fce886a60207 ("KVM: arm64: Plumb the pKVM MMU in KVM")
Signed-off-by: Sebastian Ott <sebott@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/kvmarm/3f5db4c7-ccce-fb95-595c-692fa7aad227@redhat.com/
---
 arch/arm64/kvm/mmu.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 754f2fe0cc67..eeda92330ade 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1501,6 +1501,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		return -EFAULT;
 	}
 
+	if (!is_protected_kvm_enabled())
+		memcache = &vcpu->arch.mmu_page_cache;
+	else
+		memcache = &vcpu->arch.pkvm_memcache;
+
 	/*
 	 * Permission faults just need to update the existing leaf entry,
 	 * and so normally don't require allocations from the memcache. The
@@ -1510,13 +1515,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (!fault_is_perm || (logging_active && write_fault)) {
 		int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
 
-		if (!is_protected_kvm_enabled()) {
-			memcache = &vcpu->arch.mmu_page_cache;
+		if (!is_protected_kvm_enabled())
 			ret = kvm_mmu_topup_memory_cache(memcache, min_pages);
-		} else {
-			memcache = &vcpu->arch.pkvm_memcache;
+		else
 			ret = topup_hyp_memcache(memcache, min_pages);
-		}
+
 		if (ret)
 			return ret;
 	}

base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
-- 
2.49.0


