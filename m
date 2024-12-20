Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D34E77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 01:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0bgCVLlKE2bsIas/97mE7OWeLqD3b90q0/zRCnz1gQ=; b=olVvBf7D+t5usVqjNE1XUPCmzF
	VY1rulBuNqXEeKHAJIznvc1anL9Z7bS7TKpWD3OtaRyEFHZWTO4wAYMvzNe0PceeMw/d6e3Um0fYZ
	uku0y8X+znv5CP69EKroCocgjuDNkiw5+BredzQh9HQzjed5vpgOVvS3ge6YGiyo0trL46+NIiFt0
	WDBq1+CVOpQZy7+B/ZW6yiN1QF+zjDcAjsNM5giygC/DW190fxvjqMYEgf2zoy0bVxRaUSP6icHcv
	CtTEWuX+0eMis54JY/alL2VmHf7Xw9E2EzHv8oesFqal6MWvTImWONl9qiatfc9N57TzlFNomztja
	VWPu3RbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOS3T-00000003eVG-3bPJ;
	Fri, 20 Dec 2024 01:43:51 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORz1-00000003cxi-0VOs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 01:39:16 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-725cf25d47bso1339403b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 17:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734658754; x=1735263554; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=C0bgCVLlKE2bsIas/97mE7OWeLqD3b90q0/zRCnz1gQ=;
        b=yQHwZOwiLTSu24wt9+PED1v3hweTkB3Keuh6taUrSb98kszSmFh7vQMYgDA9c88lVc
         8SomardDSt+3xtIBN0OxHOQwypTqZPQV1LHBinFZligJDJj3L90nFIjXA0EJZ6/sG9Bg
         cKqigGqod9pvk99AlWYjXa/XXKh4S9Kd03/BrZa3IEIeZx48JQEZSh4RWZPyDiMfJvt6
         XvLFEdtwL6zbp7qTTtJgbaHhAXTPsxvSPieYok02I8Xr5UgMQESqsNtV2fxHf6/tevJ8
         0FzKU5hHnU09JJE7lq7ZV4oA0vv3bdpOv9vnt1asOtZUO68c0cahX300ImLm8H5lUao1
         65ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658754; x=1735263554;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0bgCVLlKE2bsIas/97mE7OWeLqD3b90q0/zRCnz1gQ=;
        b=BXY6TEtQFvZybF4mBGk1eZBzWvq/MH6Mcqmfmi9xTMuTfKAZX4XHfS0HFSDPe1pQFi
         UufjWRdj/cwWzhyKd89PHhJXNADoRzcJXJpxjSBRqsJakAlzh8t5YpGETax6ST2xhhUg
         Ek5FJTMfd1sCTACvaQDR5+GiqW6H84dVoArYOno0kiVoYSrO9Ni931YRRjKG8tO6Lc8Y
         2PHeuDEF9zSwf+L93D8SNQrfOW2FmUsmNTyWrUK5gx8wpclznhRTVsz9WoasUe8JpQsL
         yTSYh4jpBg3VuSYbAqifh69UIQxzgRR6cfDh20RuLYGDfpSD9ToefhAIrV+Dp1mp5SPC
         zPvQ==
X-Gm-Message-State: AOJu0YxMa9Y3RgmBYknUz+tw3JVnytfTNtVoZKA2fK6/skgVaVfDlZ7X
	SKtmACdhJN69KApUDzpFxNGxLJu8uHkJtpK/wlUd4fvqu1gi+4/ybMT84fRuONwtRa/YqfGDJGK
	wiw==
X-Google-Smtp-Source: AGHT+IEnCf3mHfBvLfwshZ15Q9EpX1HZcjdF08kZ2lrJwSlTx89Hx0AQSr2Fy6V/QWuDYbh+JhZtgEK5cgY=
X-Received: from pfbbd38.prod.google.com ([2002:a05:6a00:27a6:b0:725:ccfc:fd85])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1942:b0:725:cfa3:bc6b
 with SMTP id d2e1a72fcca58-72abde404b0mr1283201b3a.3.1734658753719; Thu, 19
 Dec 2024 17:39:13 -0800 (PST)
Date: Thu, 19 Dec 2024 17:39:01 -0800
In-Reply-To: <20241220013906.3518334-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241220013906.3518334-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241220013906.3518334-4-seanjc@google.com>
Subject: [PATCH 3/8] KVM: selftests: Assert that __vm_get_stat() actually
 finds a stat
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_173915_153623_A676916D 
X-CRM114-Status: GOOD (  11.07  )
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

Fail the test if it attempts to read a stat that doesn't exist, e.g. due
to a typo, or because the test tried to get a stat for the wrong scope.
As is, there's no indiciation of failure and @data is left untouched,
e.g. holds '0' or random stack data in most cases.

Fixes: 8448ec5993be ("KVM: selftests: Add NX huge pages test")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9138801ecb60..21b5a6261106 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2238,9 +2238,10 @@ void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
 
 		read_stat_data(vm->stats_fd, &vm->stats_header, desc,
 			       data, max_elements);
-
-		break;
+		return;
 	}
+
+	TEST_FAIL("Unabled to find stat '%s'", stat_name);
 }
 
 __weak void kvm_arch_vm_post_create(struct kvm_vm *vm)
-- 
2.47.1.613.gc27f4b7a9f-goog


