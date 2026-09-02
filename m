Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A44C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcKMUlmJ0lq2oBOCUrCto8mVZjPEk4eBpEgiK6nEFRg=; b=BPrsEAs1CIUARJqVUPFS0NzX/w
	ZAuMMNoxkXGYrRHf3aXU7AxxctONPqWtoNwlJkE/3n+JADfPJoVmwsNSNPuCHdWW7UTLmFGT1+tJ0
	Di42fRJh/Jx+l8JFLWYf3tsqwgdeLDwVXzeaqdgNKSrhZ0BDY/wZZeWqytED56xOsownn/ZD3hKnY
	fzrNuDf4j65ZAuNHXfdpD84MOmsVKf++UgVwG/jjnKp7OzMWSLpWcogDqa+zAYOvnHBog3Daw6bij
	W/N8QUlDgYo+1jiUfp2o253UaHw51gcGe40kr2fDflykZ2/MjTokPRjsf6x2dC+zPWhbdPKiDhCxE
	e+JcfFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o29-0000000FExK-2a4Y;
	Wed, 02 Sep 2026 16:41:57 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1p-0000000FEH9-1m4Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:40 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-8553305b7c7so1048645b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 09:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367296; x=1788972096; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wcKMUlmJ0lq2oBOCUrCto8mVZjPEk4eBpEgiK6nEFRg=;
        b=em5rSUvRvwwfoJkzPx88faHU/CG9fhOvDjhO7YbhLtZSiI2Yz6DYeVejfR7S82Pzg7
         Ex2t7/ZvxbfOx4hPGODlSIZPp8go1CKZSnyj1PaffTUuFdOKVwg03msMmjxvQo634i97
         QLQnB7SJBTnwpbzo5lG6+8dPHGbe9j9rlQPbgaJ+4hybPCrGhmsex6IuVOeH9vnPXN2p
         W5rI7bT6YZ9zQBZcPnPOEFTCZ1HoLUzWazacmsQQT+/r5lCmZLXNU+s/vBTkWg5vRMuY
         B9cqEvrkFIbMpwEV9a37+WmQpx17ngwNhyWgdfXOyoub5gmD00cbrfik570IH4Du6a7L
         6woA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367296; x=1788972096;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wcKMUlmJ0lq2oBOCUrCto8mVZjPEk4eBpEgiK6nEFRg=;
        b=rV9CYUcv+QEGIxn3+lXw1ay83QGPKy9+hxoMsg6pTZpPF7hyfzphNI6GuI/GVEbHQr
         4EULJpChmyxwM7MLk3nI1FSDxSfhFQSTP/FwmArtpKW0IIfZ2yg61QMFTHoxdNMgZB3u
         7qQ1vsBU8C6XwqbJN1O9aaYFBK9Y47bHdDzG2sLAvj9ZCwgTYxyOBrEbcRu5oPEMAI55
         cMmCuiX0VfMmrBoAD0uPndVyJ93TdMhZboTWeJlzIwFvOHa1u3/xabaHCkbaP+jhZGI/
         UFk8lDysuwhAeb/6b4DOrJ5QGabOzOyDzb0QlpbNpRa5nzlOC3eHa4Mj7fO7IanL/jPS
         GVyg==
X-Forwarded-Encrypted: i=1; AKwUvBxtm8hLTweNp7V90ZVBhVyyHtBHQzg0HcoOB9kcGTHDOAJHb6IHV5ttGavNEfm5zdsca2JHSl97f5loeAGfNqJx@lists.infradead.org
X-Gm-Message-State: AFuF++lt/eRcNWe14Rwuyo0Zmwpq39pAxf4/AV04MRA6Jsubfo/jbWXh
	VSq78SS5tIjjsANcYvUda/2QM4sp2BiAgfz0mOFk1QeYwgLKdD73EMURRTbnEToNdEOBbPgqc4i
	chFEkyQ==
X-Received: from pfbeb17.prod.google.com ([2002:a05:6a00:4c91:b0:847:87ec:2a9f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:997:b0:84e:f90e:492f
 with SMTP id d2e1a72fcca58-85ed25e06efmr8429625b3a.7.1788367295680; Wed, 02
 Sep 2026 09:41:35 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:12 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-10-seanjc@google.com>
Subject: [PATCH v2 09/20] KVM: selftests: Use the innermost page allocator API
 in s390's IRQ routing test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_094137_679334_3E7FFB95 
X-CRM114-Status: GOOD (  12.37  )
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

Use the quad-underscores page allocator in s390's IRQ routing test in
anticipation of dropping the @min_gpa param from the primary APIs.

Note, it's not entirely clear that the test *needs* to use a very magical
@min_gpa, i.e. it's possible a more elegant solution exists.  But that's a
problem for a different day.

No functional change intended.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/s390/irq_routing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/s390/irq_routing.c b/tools/testing/selftests/kvm/s390/irq_routing.c
index f3839284ac08..cd26cc1aed80 100644
--- a/tools/testing/selftests/kvm/s390/irq_routing.c
+++ b/tools/testing/selftests/kvm/s390/irq_routing.c
@@ -36,7 +36,7 @@ static void test(void)
 	};
 
 	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
-	mem = vm_phy_pages_alloc(vm, 2, 4096 * 42, 0);
+	mem = ____vm_phy_pages_alloc(vm, 2, 4096 * 42, 0, false, false);
 
 	routing = kvm_gsi_routing_create();
 	routing->nr = 1;
-- 
2.55.0.966.g6673acef38-goog


