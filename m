Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF24C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 11:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TyfcqbggFsVMkhQ3/vS33VSK/7m2OBGtht93BA9q1Nc=; b=feuc5lca1BXNMTSG2x4CBMX9Uj
	pEE1QZdoQ4BvT9pdP2vB3fAmKv6MX2EtgmlOJ8YZ5JCEUjUfmPYjWOPbjTCqgn/HGodKKyUy7Y7Ka
	yAOyHjsGE6riAsEhfis7R1kNh4uJo+fQKmaKYyXcZvpbWwfiKxXHV9DRNkzwYVjCNaXAr4L1kxThR
	LK2tWad4oAksrzzTP8kL3Gv+88p+Jnfa5VvL0d3R9slkuUeX0F+WdQp7Nr5vAnQFI4+3iDx5T64jG
	uZYkJs0rALxQJ5YIsZrPbz26CwHOhCF3vaErcpFkQ4BAA/jF+FfcdwpEIuZAUdtYrNcS1qjNZ/SKz
	sqIwDxUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc06T-00000007X1B-3NW1;
	Wed, 16 Jul 2025 11:15:13 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzzF-00000007VEB-0gi1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 11:07:46 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-ade6db50b9cso712870666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 04:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752664063; x=1753268863; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TyfcqbggFsVMkhQ3/vS33VSK/7m2OBGtht93BA9q1Nc=;
        b=xsEogw9Kf880xcV+jjbva17xgXMHmCKtgZY0FJn4NSf3g6PqVbb7Y3Cy98gVhnWCTa
         RD65CCW9j3tTOrDCe//GRsSQL+xU82hWo63ZwHialxm7i/zF5qQm5DLlCoF4yTleM3nW
         fTMdeof4JDqfIsAaM0aazea3Xe1/cbX2WTPnjS6Wd1XTPstEFd4x08wOiE5XBPa46JIM
         WZLD1Bfac6PBBPC7V/0kzjMw7g0WyKEobkdsn+SCCrovKGHJnYGvPGchlDjsRg4S4/cV
         +iXtCNOqagJzysFKVTb4yB5y2b3HQGCkJJ1sGldNJyf9T3V8/8pdLZX2LdOqaXFRulLK
         /4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752664063; x=1753268863;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TyfcqbggFsVMkhQ3/vS33VSK/7m2OBGtht93BA9q1Nc=;
        b=t6+YI40cdV2p9UpwSBz9sysTD9omn8hLOIm0wDVG7wNPUYo7GUDkC3BrmRQveaPgFX
         malVx27auHZ+0UmPBsPDK7ji0Gs0jzUWp6NqlndKCM/MRlwttfS0HbmdrceO0OJvdwru
         tCGm0+36B5sNn6POGF4/i/Z2fdoO7rMY8hp4U2jE7ucCVjtj4OG4mS9DnXjtZxA9ld4Z
         s0xo74kXJ7i8fUOzJIvCqldLO5WuRFH8xSOVUHvEeYxmB6cm24ce/AFd2/44QQz1Itlc
         q6VLaCiGnkcv0YRwPZrdVxLRQmPz+/GjC+5q6Jh17rc/cldMu2Vs2d5/eCM8xoT3JfC3
         2Q9g==
X-Gm-Message-State: AOJu0YwWer9QOyH4chKBg/cUMCzchMcxxvTJjc9qUXCwDTtVufmiCUGK
	Et4jL1YIR71M2kuYkggjj4/zBnCbLAsJuYcFPUMkndlutMg4g9fSDu7AZLx7Xs/h0Hib+Iy8kJP
	wOu2aEpoSIqDgDCalkp0CHgoV8olInQCtq+awu4ojAujcXsIT8lRfazfJC8a+JOeZE4tRdbhOTi
	4vCbJSEO9CDat9+5o8SqwBRLY60hmOiJ4Wo12GsW3ABmAfvCtLnw==
X-Google-Smtp-Source: AGHT+IGeYAejknlz7cV/1SlSOzPhNdhatcheR1F0bGDRmruI6xm7M0czw9xzhGPfq4CQ3wRKJ1YDvke/1g==
X-Received: from ejae12.prod.google.com ([2002:a17:906:44c:b0:ad8:9944:a34])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3f95:b0:ae3:5da3:1a23
 with SMTP id a640c23a62f3a-ae9c99c0d2bmr228038766b.21.1752664062975; Wed, 16
 Jul 2025 04:07:42 -0700 (PDT)
Date: Wed, 16 Jul 2025 11:07:33 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250716110737.2513665-1-keirf@google.com>
Subject: [PATCH v2 0/4] KVM: Speed up MMIO registrations
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_040745_234815_E7FF59DF 
X-CRM114-Status: UNSURE (   8.69  )
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

This is version 2 of the patches I previously posted here:

 https://lore.kernel.org/all/20250624092256.1105524-1-keirf@google.com/

Changes since v1:

 * Memory barriers introduced (or implied and documented) on the
   kvm->buses[] SRCU read paths

 * Disallow kvm_get_bus() from SRCU readers

 * Rebased to v6.16-rc6

Thanks to Sean for the review feedback and patch suggestions!

Keir Fraser (4):
  KVM: arm64: vgic-init: Remove vgic_ready() macro
  KVM: arm64: vgic: Explicitly implement vgic_dist::ready ordering
  KVM: Implement barriers before accessing kvm->buses[] on SRCU read
    paths
  KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()

 arch/arm64/kvm/vgic/vgic-init.c | 14 +++--------
 arch/x86/kvm/vmx/vmx.c          |  7 ++++++
 include/kvm/arm_vgic.h          |  1 -
 include/linux/kvm_host.h        | 11 ++++++---
 virt/kvm/kvm_main.c             | 43 +++++++++++++++++++++++++++------
 5 files changed, 53 insertions(+), 23 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog


