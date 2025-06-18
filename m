Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81038C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 04:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIb2ZAeP1IApX8KajcoQdMg+K+X03gdKKVOXgy4uxAM=; b=uRu3ja2Hg6aGuRU5KVaLe4wTek
	dnfJWWH5Ov93fX1TwTvOoRxM7qd5s4DlpR8FMbH47G9z10phGFRoLOk1vnraJYNzNax5WAvBgww/N
	Hf1mg2wgYxA1SQnrPohSHerHB2XCSFV2FQCN0X65q6XYQuuv1RlSGqLY2Wdl+YL2Z7+AuhD8t0WLq
	+rKUKSIY+lP/5wC6Xdk4YKT8c/dBirwu9IKVO5N7ydunOPZIMUUnwOR05DXtFnMo5Cy9EakHtRxi8
	VMXitEuE9kmAI/5PYrW7OVFJ1gm8YQ8RSbk5fk1Wmm1fBr89TvY60uaaXKAfZepVhXxtPJIYwFiCr
	Xr+4xDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkhl-000000092d8-3tCN;
	Wed, 18 Jun 2025 04:47:21 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLp-00000008zsE-3q3e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:43 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-235e7550f7bso59124305ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220681; x=1750825481; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mIb2ZAeP1IApX8KajcoQdMg+K+X03gdKKVOXgy4uxAM=;
        b=fE8piR1qsHpC7Kbpf7i9xSO9VLAWv6q7OYH0RBLWhQPE9MLU0tiOCyK6YCOkDN6V8y
         kux5CiTuoJJWjl6YS3I9S+MeYRUCSFN72M4w/fuQBUlSpuyNgNRFDHpEA9dZux/v5BVT
         qVdFOGo8RxD7mDmet4/SL5MTgI2wPyo5rwALaG2zVbP3UrrOHvt5H2/ldvUBDqsZNgwh
         5S8OdQHcuYLv85GRfVYfKemAqLDl0c474N6+cKH3E0ot4guBTVo4bh8pxT2JQ7CAVTwT
         U8dC356qkDdfenEXCPwUtUmQ8czSwNEY9BZHKFzSjbkqmb0yCYUiUnwbdw8epkBNlEuT
         Igdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220681; x=1750825481;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mIb2ZAeP1IApX8KajcoQdMg+K+X03gdKKVOXgy4uxAM=;
        b=c3sKAON1O/wWPPNEdxYqWv1b5+AcYv+02fVstTYziVgWw0/0t7WacRkQh1mRi/ijpS
         sGqXmzlKoFEnwEy/6m6KkT44cQo1EMFLJh+fDEslo8JxIZ91Diy5nZeZlVT0FqxOX0zf
         T3ZdlFsqO7GGZBrTJs2jVaipPvqqhtp82bpj7vVcMUfM5azxetyF9+1guAeOJyi/TKmS
         PuyJQCEPJtj93yqxEsm0ed4wjwy0H6RlcFgn3op2uN6Ii1K4qPcJWp1dAiSnI/ZA5zkO
         pIU2WeX9MZPvWQV8Yof3+kcDHeiwzJnIYCfR2N3PYd6fAYSnDMpd1lk/JFCmHerJRLTr
         fB+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzvE/i21icbdF4AhVk6TFrtuncqJ7mxMqosMVexUppYzN2RLuoN5IUklCSvOTc9JGXGyzgfRoGC4+ZwQTcV/l5@lists.infradead.org
X-Gm-Message-State: AOJu0YzuDHEiLMvo1LGUQR7ONKZWo/X4fE+tv4gwuYNdLVkoapOsEvQe
	ek7dvaoIY3U8N08UGV1h4ZN2uNcBXNCnN3+3hlBo/R11Wm8mbZxM/eoglpTPyXh2f4fvZWO4rhu
	SPONK+s0rtz5lQVB1yCbMAw==
X-Google-Smtp-Source: AGHT+IHIvgUZR0zBF5d+sewo95QOsT/HjDVkEn+tDLrOgLskqZ9xDvbZRR23CwdW2Cit9o8BMVaShYmHas3nnjqN
X-Received: from pjbmf13.prod.google.com ([2002:a17:90b:184d:b0:312:eaf7:aa0d])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:228b:b0:235:655:11aa with SMTP id d9443c01a7336-2366b17b16bmr234970365ad.39.1750220680638;
 Tue, 17 Jun 2025 21:24:40 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:18 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-10-jthoughton@google.com>
Subject: [PATCH v3 09/15] KVM: selftests: Fix prefault_mem logic
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_212441_952882_854FA8E1 
X-CRM114-Status: GOOD (  13.96  )
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

The previous logic didn't handle the case where memory was partitioned
AND we were using a single userfaultfd. It would only prefault the first
vCPU's memory and not the rest.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/demand_paging_test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/demand_paging_test.c b/tools/testing/selftests/kvm/demand_paging_test.c
index 0202b78f8680a..315f5c9037b40 100644
--- a/tools/testing/selftests/kvm/demand_paging_test.c
+++ b/tools/testing/selftests/kvm/demand_paging_test.c
@@ -172,11 +172,13 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 	memset(guest_data_prototype, 0xAB, demand_paging_size);
 
 	if (p->uffd_mode == UFFDIO_REGISTER_MODE_MINOR) {
-		num_uffds = p->single_uffd ? 1 : nr_vcpus;
-		for (i = 0; i < num_uffds; i++) {
+		for (i = 0; i < nr_vcpus; i++) {
 			vcpu_args = &memstress_args.vcpu_args[i];
 			prefault_mem(addr_gpa2alias(vm, vcpu_args->gpa),
 				     vcpu_args->pages * memstress_args.guest_page_size);
+			if (!p->partition_vcpu_memory_access)
+				/* We prefaulted everything */
+				break;
 		}
 	}
 
-- 
2.50.0.rc2.692.g299adb8693-goog


