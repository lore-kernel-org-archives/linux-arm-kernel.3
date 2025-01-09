Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CBCE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jDqHEv7geetsXAPhiE7vHc+NbQmOip57zkXZiw1WEE=; b=pgFlvJd41BI/8tHt0dsAb0qe31
	tV/qVJmH5J9kayRlZu9g38FtDCNA6ITofTytMNFV/4vHhbgMcWpjRAd7p4tjyFDMFIsRrrEh5Fjgm
	yKhXKr5giF8RQnzLM3HTgXhI/GXG5UDjZtITX3i/uAOCzeyxgsfOEuScm4kk+kKV8QMJsKZz72ZMs
	k/kdCXin2WzN8B4CVb6qtctDPdBjuP658H6wGJqrR17JgYhfOrekuMaZP6eXODhq+VnhIdD6yatHy
	n/qX0TmPqDJ6vjFXPCaCFLaHAZ1vqkORzM61SkozPAggZTaF9lpPumR4Niy4XKjl8OrbdCoWxiPMH
	Y76rC1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVze4-0000000DIyp-1GVZ;
	Thu, 09 Jan 2025 21:00:48 +0000
Received: from mail-vs1-xe49.google.com ([2607:f8b0:4864:20::e49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzTe-0000000DGYa-2YhV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:50:03 +0000
Received: by mail-vs1-xe49.google.com with SMTP id ada2fe7eead31-4afd9b88ac2so195545137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 12:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455801; x=1737060601; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9jDqHEv7geetsXAPhiE7vHc+NbQmOip57zkXZiw1WEE=;
        b=ypmyAaQmBF1tcM940kT7VDZvMg3ooQFkjpBztUsjyJwk32AdJ2FvXujjaez56tkYB7
         teJS9fytBdnB2+22n8YW1WIgK0K/BFCoNDzq22m3Uc7y+/I/l9xma0kNVeAoZXzQgwEo
         evhNjLssVpS2Ep5bV1RFCIyrO07qOo6EF1nfp77gM+G35JUKzRtPDVH1b3P5+yjz+HAl
         bZR5SFFN842kuD4g+1iOqKGg0ym3Xr0+bq8uot3qELl8SBc8TGzEXAe+tdTijEZ5Y/N1
         nS+oLRmTKdnMQajMLROQwST60PB0KA9Xj73QUC24lBle8PWvtIIvTpMEkd3XWl8OlxCd
         rZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455801; x=1737060601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9jDqHEv7geetsXAPhiE7vHc+NbQmOip57zkXZiw1WEE=;
        b=UcTJ/3/SJka+g5Gl2Uhi77tntGrDkjd9KuvDCexX+/eHRv3CvIv/GZisFZwYb3lhb2
         dA1SpQoLc8lz0NdYxJqB/Veu3NotQScu73seulz/7qxztxq+myyVwjgV1Ewfc9MvGrZe
         bMGtjn3yvtYhTnuE2uEPyXjwlOvLbZCgXK0iPSXiqnM30QGTtGzgmDfazJJjR0OJSV8D
         rxn+EmalcHmxwO0ZHJk7yyXXElB/NUsckY3nCjDMDjC4yUmToIdQh/oCk4u5WkxyHJQW
         a+R8DFvXrx0A7c17/3T1o4RcmFNp8MY6dEezWmuUHhZ7n/18IoUcqZ4uqmzJwj9Gsj5z
         qd3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhLy3Y/PlGJeTtSqRb0/XNCkf7IDV5lfAl8vf02NpyLJHQ+N31PG9PMNA99lpWooH4BYVNrwG3Cweh5v1wzzuR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7FyVK1r/vLCdf5dc3PUEWebxPTC0OQwEV+mkv+nX+t+N1q1Aa
	DiT2NqiixNn2xzfByn1VM9NKE+LtUiG5cPT/hJtYepXfcD6/ogZqv4vYZ6u4VlLR6G7ZIcqFmCb
	IbcelnWEcBX1p6Kx76Q==
X-Google-Smtp-Source: AGHT+IFNTRpr21NUpgVvBV6RDqL9+2vcXAZWltadh1brmBLANlrw+WVMeHKDcwijSskNQ4NVBvhEHS4SPdBJrOsp
X-Received: from vsbih13.prod.google.com ([2002:a05:6102:2d0d:b0:4b6:1ac7:43de])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:3c8e:b0:4b1:1a9d:ecbc with SMTP id ada2fe7eead31-4b3d0fb68c2mr7939857137.20.1736455801194;
 Thu, 09 Jan 2025 12:50:01 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:23 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-8-jthoughton@google.com>
Subject: [PATCH v2 07/13] KVM: selftests: Fix vm_mem_region_set_flags docstring
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_125002_644212_C8DAAD48 
X-CRM114-Status: GOOD (  10.67  )
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

`flags` is what region->region.flags gets set to.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 33fefeb3ca44..a87988a162f1 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1124,7 +1124,7 @@ memslot2region(struct kvm_vm *vm, uint32_t memslot)
  *
  * Input Args:
  *   vm - Virtual Machine
- *   flags - Starting guest physical address
+ *   flags - Flags for the memslot
  *
  * Output Args: None
  *
-- 
2.47.1.613.gc27f4b7a9f-goog


