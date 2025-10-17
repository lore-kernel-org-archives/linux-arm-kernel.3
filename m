Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11214CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 00:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ylyqozer80U4wIAhCrbCm8kORDI60jP8QTvjhJUGpZY=; b=xCw8Ocp4upAbDyoDhgkb44xiHd
	Z2yg8JTvgGMrAQx7OMu1J6z+6bdBb0kqea2LbsCrSehLtupcQdRPpNd/bcgVy0wDjgUwGwkamd8nY
	ZA/x6z4MMo1fXiQMReqvLVajXM+CSFGS6i4j/iLYyO584K45FQykSwDVs5bn5zF/52AzzZQQCtbIS
	UFtlL2dgAsqwIlN6kUAJYMQzdlAbywIaZgmwpShvQgsd8342kUlaJq3NUJxT+rXZ24Aj5YFBopV+w
	sBgoQtkMZcTgEqB9PBdlXBqt9oBp9QmJXBhIRdxMZ9AttQSPisremIXlxNKeuZCUw+NM96ez4Wvmm
	aNTngY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPz-00000006E88-3t8r;
	Fri, 17 Oct 2025 00:34:04 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YP7-00000006CuW-0itg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:13 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33428befc5bso1886092a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 17:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661188; x=1761265988; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Ylyqozer80U4wIAhCrbCm8kORDI60jP8QTvjhJUGpZY=;
        b=r9maMDmJcUPDZnSH0yeF1sTspO1Ld+K/mjAZSC4NKityJ+wxtf29m1QV53lYFOe4zp
         RfhMygkXV65IIUOipNUM+lscmKdIEE5UKyIjcfZP639EJ5SbMOeYW0IsfwUEPBuKNwoj
         6oeC+ZOkGiuJvUZGNiIrcg4AqHQ2V3LxxBNXBYt5InCewi5ff7Kp+BH2JWXLCvtYE6cT
         TFHqIWoHHtqbOET89EKz/eAGffeMNl08+8HENSDYz7hZyYqbtGrYsG9Cz6TTjVzuxYQR
         zXKRb8d1KmFbx+rrkPSPUqEOnvTVTmne7Ozs7QcO2UxR/0Bg7MAosAft+cnnPDUw9tfN
         pnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661188; x=1761265988;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ylyqozer80U4wIAhCrbCm8kORDI60jP8QTvjhJUGpZY=;
        b=ig/MuFi7jCmgqw/4ezcL7R98Lwr617QySqZTrFIqk0aQj+iqbxnc4OWrFYCi4QHdIe
         kJnbv1qxszAdnZlVbsM3wdRCFiW2OWNN6giYqrsc/BYZtMBgP3j3JsVFUuIx6t1xZD3C
         Z65iMAXqhpiA7NV/KLpM7Hiuxum2W4OJsgqkqSQWnwx762oC7HhJQ/U4iqlC2os7EB2U
         7UJuk1E68EaQhxRw23+wZ79Oj7cyH+qjiuvKcFUexTZpSMmPcVud0eVFp4BSrSirMhB7
         TSFzlyfgKKndRTYXmsXOnwchalIWqOPxJL608qjwBozCeHGPN//HAcgRGHV+tHiLJdtq
         lLvQ==
X-Gm-Message-State: AOJu0YzMTbwgbllA1zvF7mRHsVjk8mDgRmfDAebuB8Lltv6qHdCVa2Qw
	ZkK0ypaQtF8hsv2pGa/dfcH20Az9yzLiB2+ChsKBnPcdpNS8MmObLtD2fL/vNwVUc2ByqjzvepM
	WcT5bVw==
X-Google-Smtp-Source: AGHT+IFv5wQBYU08VlWSJ3YEyBvWx6CUl5P/6vzeOVA3OyqdlNjTdwYkeUoBdZlGjRBJoj7p6GD6I+E30lo=
X-Received: from pjbnc11.prod.google.com ([2002:a17:90b:37cb:b0:33b:caf7:2442])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f8c:b0:32b:a2b9:b200
 with SMTP id 98e67ed59e1d1-33bcf87ab38mr1930441a91.13.1760661187797; Thu, 16
 Oct 2025 17:33:07 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:29 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-12-seanjc@google.com>
Subject: [PATCH v3 11/25] KVM: TDX: Avoid a double-KVM_BUG_ON() in tdx_sept_zap_private_spte()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_173309_378862_0AE1B2D3 
X-CRM114-Status: GOOD (  11.39  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Return -EIO immediately from tdx_sept_zap_private_spte() if the number of
to-be-added pages underflows, so that the following "KVM_BUG_ON(err, kvm)"
isn't also triggered.  Isolating the check from the "is premap error"
if-statement will also allow adding a lockdep assertion that premap errors
are encountered if and only if slots_lock is held.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index f5cbcbf4e663..220989a1e085 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1721,8 +1721,10 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
 		tdx_no_vcpus_enter_stop(kvm);
 	}
-	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level) &&
-	    !KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm)) {
+	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level)) {
+		if (KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
+			return -EIO;
+
 		atomic64_dec(&kvm_tdx->nr_premapped);
 		return 0;
 	}
-- 
2.51.0.858.gf9c4a03a3a-goog


