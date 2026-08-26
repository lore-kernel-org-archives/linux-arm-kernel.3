Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F32DC61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 23:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkGDVNWv+E37i1qgZxGANcWGk8EcR4uX9VZBG0WIwSA=; b=h+dp+KrCMyLZuqDTdVT4I58bv/
	9HkvYPtPOcqridUkaTqKtWxuZ403FCW9z84bI0THJYaZ6ne1A1tbUG8hFnarVm0AwRphI1ljjIlXX
	oZOBjSfpTKa63Sc+SxV3z+tzdyt0h/DelSbt+5U6s7ykK9QpoCGdRdZnQ8yJXumaZbe/b8YAmxWFm
	8IIBG5dOJCLt0ZFfZQp+zTZXH+BTx90CE8+FpzXXTvwH09tRRpbzY3PyVCtB6Rm4oHCGF03PnmBLH
	E443ewXrQmXL8/acxIv82x3lrmOrZaDJYtX08vGACCyPDSY9OrWTUIkUhqalItAiZV8YbP9sEfWge
	fENdZM1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMi5-000000038VH-3LIZ;
	Wed, 26 Aug 2026 23:07:09 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgS-000000036D6-0bi8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:30 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2d7151120d6so1673525ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 16:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785526; x=1788390326; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nkGDVNWv+E37i1qgZxGANcWGk8EcR4uX9VZBG0WIwSA=;
        b=LEXa28338ZYb8xUZiUlUTKQnVz2oymalPRW1AxNlcvZTLDZEd0cLbGCJQiltH887Mz
         KINMhUpV6xKmzu79XDfk4q/QFfAeY04H5DFTG4bvpR1CKvI6otxoHI+qA02biotU7jiE
         zpKflUHJJRZFz110fTVZITWS97qWrFBUPKdachZZ+wmoOjq+GpzYZ+AsvLQ54qiAzlZ0
         pGHAn92+CAo0lrrxgoB+uI4bj5EuZBv1U4fn0gmUNoZ4MLu/rCJZCe+YbBpcg/5jaTyj
         +QtZULKCiBZSxjWnvQ2CC5JHW4nlt08t670G4G9qCLvoMc9Fr9NA5XcbycHva5DL1zFn
         Ex5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785526; x=1788390326;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkGDVNWv+E37i1qgZxGANcWGk8EcR4uX9VZBG0WIwSA=;
        b=CCZs9L93++bzbpQo8KMP4Zwia/YYFzcXXQ/zSNChajUEDhD8khAyl8zMHhOnzyWiAy
         sJ6qMjRR6L8m1i1oy0nVEjdsWlyxSCDDu+8D3QfqsnhuVtdfCotdiId74Fs1LOF/ODbn
         yCeoKW5MjFW7Alc1FbCga/tpNFTV4ArwNI9zY0RgyiDAPJRYXDC3IXRSBB5NL/1wOrCh
         n4AHaISFr64/FSrLSVzsG5XEl9OQ5wcgLcQ2ZG1XthKCma/I8lPJmOJrGnWLeSc6aYya
         Kc2y9FM1g3CnFGdEzLg8MtNvZwHm800IZy5HvjOfxjvVj4+9EdbJxE4/Orj4OM4VVOUY
         2yTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIhOuG8Qorn7fli/j2zuv1MvAG1nZ8f0ccIfr0ADZvr30H85XYweapsb6DBKPwNvQwKKh6p9yG8q157aTPJAoN@lists.infradead.org
X-Gm-Message-State: AFuF++n6pm1b4ElFhT3U//8r/e1iJppRPK9bVNa2Yb1iuDlpgxDRtf26
	X+RLYkBoTLVuSVO7ZzuQR7FbM6DdKVbUHBJsqVPEl0G0bTAXudlyl/4wgVUnYyW5CA0Job9NBeR
	ZxHV5mw==
X-Received: from plblc14.prod.google.com ([2002:a17:902:fa8e:b0:2d5:62cd:db79])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19ed:b0:2d7:107c:917b
 with SMTP id d9443c01a7336-2d7107c934fmr164734915ad.0.1787785525359; Wed, 26
 Aug 2026 16:05:25 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:04:59 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-9-seanjc@google.com>
Subject: [PATCH 08/20] KVM: selftests: Use the innermost page allocator API in
 the memslot perf test
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
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_160528_238354_EE38C72E 
X-CRM114-Status: GOOD (  10.66  )
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

Use the quad-underscores physical page allocator API in the memslot perf
test in anticipation of converting the outer versions to take the memory
region type instead of the raw memslot.  Stating the obvious, the memslot
perf test creates and allocates from multiple memslots, and so can't use
MEM_REGION_TEST_DATA to communicate which region/slot to allocate from.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/memslot_perf_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index e1299611be32..844ea9b7bb41 100644
--- a/tools/testing/selftests/kvm/memslot_perf_test.c
+++ b/tools/testing/selftests/kvm/memslot_perf_test.c
@@ -339,7 +339,8 @@ static bool prepare_vm(struct vm_data *data, int nslots, u64 *maxslots,
 		if (slot == data->nslots)
 			npages += rempages;
 
-		gpa = vm_phy_pages_alloc(data->vm, npages, guest_addr, slot);
+		gpa = ____vm_phy_pages_alloc(data->vm, npages, guest_addr, slot,
+					     false, false);
 		TEST_ASSERT(gpa == guest_addr,
 			    "vm_phy_pages_alloc() failed");
 
-- 
2.55.0.887.g758fc8c411-goog


