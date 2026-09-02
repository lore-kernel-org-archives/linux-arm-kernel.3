Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A609C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLFvTuC7gXbjk/rOLKK/p7bC02ttHAq/6LyCTsnQIyk=; b=KBS1JMWffq3hFT1tRiUFy035Gm
	Jx7z1UPf7+uNxCYZomzCBKhgCOG11ec5+SZrySdk7sxjyFu2Xn60gz/89xOeOiZ4cXCk9BtBJiZG+
	yNhieYis7+wBFjYtUqtMlUz4612ROr/Hz7TJ4+DN6tS8G06X8pwABvgQSd2LAtVWmXv9HfHI4USkx
	TWsVmL80x+5pRe1wPPIcpOfT7kPbwrYABJFKTZ7WDfD2f9ADaTHh62xlji5qaEffVDiJX8oFvxAwT
	e/dCrLu8gJSueKCzB2pnXxy+j/OGNA21cCSidx93ViTmz7st7CAS18LZp9vGx6J6yIpMJDtMXywk0
	l1BKpZPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o2A-0000000FEyK-0Ass;
	Wed, 02 Sep 2026 16:41:58 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1p-0000000FEEG-1lLu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:41 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2d932ef41c4so895725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 09:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367295; x=1788972095; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gLFvTuC7gXbjk/rOLKK/p7bC02ttHAq/6LyCTsnQIyk=;
        b=Li+FwmLKfEV8wrUAr2yqI9bFEDReDvApqZ6Nn0EbE8XOOHFVZj0e63A8mEHfOPYYIU
         YZzQXsQU4yG65zXACyT4gVYjXetdi2dIljFGCsx4U5U5P7tJP8fDqD5gC8t4ANib0XsG
         EcJTdwVxZRw8pmUTdD+0G/BNvaGujmPu7j+vlUPVZcpeZHiFsmkJImJgEw8Qx6vg42sz
         39fIiSxOWTsri8YRcrDYQTkkwYx7AiU790Lds+eQWtGaV/dGUkDApYVKBex8dMFGj1Ab
         8cB7Tp+e/xXeBUrt5l5CaCCrLiWv0UclD8LCeoW7kCqFNYOalvwD7VOPdZKC1xoPFRNX
         tp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367295; x=1788972095;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gLFvTuC7gXbjk/rOLKK/p7bC02ttHAq/6LyCTsnQIyk=;
        b=hdFpgajUZCh7faQxBDcpgYY9KB/cswF1xk3u+mkA+0uiIBA6BZf9l4WK+tskckh6Ql
         WYyYUCHMKNX0gfLkUVsafmzyR7dxI9yzFCtEZYR5A1/yvh8It5K6Q94CaxgpcJJH8HAD
         hkkXT7iJXWD2ljZ4ibXFbSEWOcmeKjRU9EwqKUV15EJu8fv2/pgrof1bFDGKb5XhF51j
         H89CkoyzazAidCxu825isETccUkA9kJw+whrtpbNhG+xGYESfcDNrxjHh4t3rLBhBiiB
         aGVuWkbMrhwbEMimsG8pVeSRfbIPoilOJr+W+3ZuH6xNXDBKFml1bDeDWks8X4O4Bz2+
         dR/g==
X-Forwarded-Encrypted: i=1; AKwUvBya/vr1E3QXNFVEckTUNX5W3gC+xRm6gzg5WJoMNnMdxH1tCRqfunGpOKMiaSp6r8CgAubpLepZ2Eudytl9t6A1@lists.infradead.org
X-Gm-Message-State: AFuF++kJd7La+PVo825tag66LOLLLOhFPy2Wx5KJ1ghU9UCB+McI+6g5
	IR2ZEEhD6ivDNUHKaMPBJ71LIXheUmY29gFfEpko3b+F6mQXDvDu2obs7A4RBNy7lSrDL4ByT6+
	WmFEe8g==
X-Received: from plpf12.prod.google.com ([2002:a17:903:3c4c:b0:2ce:9b49:d497])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:946:b0:2da:fa62:4aee
 with SMTP id d9443c01a7336-2dafaef6574mr4292355ad.1.1788367294564; Wed, 02
 Sep 2026 09:41:34 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:11 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-9-seanjc@google.com>
Subject: [PATCH v2 08/20] KVM: selftests: Use the innermost page allocator API
 in the memslot perf test
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
X-CRM114-CacheID: sfid-20260902_094137_706747_9824A10D 
X-CRM114-Status: GOOD (  11.62  )
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

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
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
2.55.0.966.g6673acef38-goog


