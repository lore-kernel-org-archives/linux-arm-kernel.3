Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FECE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0Bh/8/p57GgUO0KFv6z2qw3B4ssWvPHnpaRRwgHkKo=; b=OkJF6i/sbwHNLButhMiJHnHkMP
	M+5YFOoWAFhZOJEmYJP/w24om23qN32DkKgkORSlmnIY/skxkgZQV+v6O3Xi++zpJlJIto/WxCZY9
	yCNUIDwRMrqFR1OE8dRfZo0IjL5j8lcpl80x2SUjbzIYlm8xFQDG3MVvix+jIf/+P1vtdSAKKrsSW
	SPl+Sga/e/gYi7HukIKQBMlOUGBTwR/JajtjPw3y5lvTkC2nQCnRvKoRf3YWgPRcLndbOhQGEfjFF
	eV8iVfkcIsxwDp7GcHFQzaEitMiQYOVEj2pU0qRETD8GCgnpnXtN6dZleYKMy4Sq5xMM/qvJX3cZO
	nSe3eD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuxO-0000000DfW2-3ayT;
	Wed, 04 Dec 2024 19:22:42 +0000
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIupM-0000000DdjJ-2bKF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:14:25 +0000
Received: by mail-qt1-x84a.google.com with SMTP id d75a77b69052e-466c499185cso1443451cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 11:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339662; x=1733944462; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D0Bh/8/p57GgUO0KFv6z2qw3B4ssWvPHnpaRRwgHkKo=;
        b=cSS/Krw9giEjzRvU7PlX4PKDWg8/CmQBzjSYgLBDRk+tRgPsW2fbMG8jB9NN6ogPmv
         Sn71qjxbg3Qql4qE1jE0fwCIGHSgAtpaKx+g+QGhRIi41bjCtJHU1xIJi01eWE8SJIfi
         61ofRct848wYrD/3jOz4I1CqXIS0uelboaXGPBZRQ8BzcXpUxKztac62Ih5ZikXXQ6oz
         0jiS4c7bUX/vcnRhfTx9fWXWUAzQQ+Joidnx7D8avRPrzdPHirIoiUttdeBiTHODm8rK
         ag8p7Hn5xkCBxPR5vOMW6bmsei3a0SmWYXhaY4xtc1Cy3G0IqIS2SQqbwk1Nj6/QVurB
         Ha4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339662; x=1733944462;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0Bh/8/p57GgUO0KFv6z2qw3B4ssWvPHnpaRRwgHkKo=;
        b=K56L4V+T4optuyMXzxnsU6p0GprNsTrEg0LOPKowh1It3FJAaGnRV7e4k8Lym1uqzN
         GSmaMdojz7fdJNox0mTigBUCP6w5c69bjF66q7JrjxXiTelH4tzB1kZ71C0kimQYqUwz
         G9mXiX6BNRvc6Mf2fGLoVhI1eBpvqFvYz3UDrbaHbyXVM/g2ezAGOR78ZjKZ0IJdeePA
         sJ2u6s/ge8PUA35OAXKV2rCf60543wx37ja0ViHh2uGNIvUU5eXbNjKm7IjLjLQ/dSC9
         bl/PYJ4NFZR3LlujzFqtQ/gyiz5IMnMnSEly9xuKoINgPzwV1xgHpDC8MX+hor0VxGPa
         Zd/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXozbc6Xb5+nEYvbQJLT+9Cia1FCF5v8uIp1SzZXxxco77s4cPoozD3RmdA2vVOePYQqPeZc8cgl4LSVtT7CcY+@lists.infradead.org
X-Gm-Message-State: AOJu0YxXsF9YwJRt+bAf1qs+1llzBHmF8GdAFAOdqVMXh3OYpRz7eDwE
	OsmTM5tyQtHR6vipgKv1vg+UxgBSqGmsDyRECMlx91muBGe5z9GQnud3fKgBAamDVbj6zPQgG3k
	IvDnipAXobWuPOuXgSA==
X-Google-Smtp-Source: AGHT+IFL6Yzt0JAsezCjVnC1Ege7Dcb8t0Na16LNTuDgarqYjisKQzOlRXRbl7knWaQbVhi5EaZ6me/AizxIjPXb
X-Received: from qtbcf26.prod.google.com ([2002:a05:622a:401a:b0:466:a2a5:c51f])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:7fc4:0:b0:466:7a01:372b with SMTP id d75a77b69052e-4670c0c1884mr95272281cf.30.1733339662158;
 Wed, 04 Dec 2024 11:14:22 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:42 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-8-jthoughton@google.com>
Subject: [PATCH v1 07/13] KVM: selftests: Fix vm_mem_region_set_flags docstring
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_111424_662670_4F01824F 
X-CRM114-Status: GOOD (  11.08  )
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
index 480e3a40d197..9603f99d3247 100644
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
2.47.0.338.g60cca15819-goog


