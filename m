Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43555C624D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6KFth+wmNcPY6G4yAkPxQ/KQlcOGwTTAk9RODAHfTs=; b=KJV3zVt2PySWqFXLnbV78dOIor
	cD8rS1Kmb3uJapOMpQ8F8OEwhMXk/5HhrAauyujuI4AOOAocdPRoGlDTen/z6XJF8nTajwcYPjG19
	B+hCG4cibMuCJPPeQfy65lg0k+Abi+VgIlm8m5QTK3wJ72zfbAfbQOwS+30SmWTy0YyJGgk3ojyFH
	ZDpYh5gjIIYIcYqOkeBrNMI8HzgGT9765+fyVZn7Wef714I2S7QLVG/LG8rftTbVMML8SObGCnAq4
	aHJLmC1uC4h0Q6tJe6ea51QN8ps9qGxr6BB8p1qxdGgg6YCNvb1yVrONZKTkBLVv1vIhU4QD+dnxc
	zQ4DQojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o2R-0000000FFid-29A3;
	Wed, 02 Sep 2026 16:42:15 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1y-0000000FEXC-2rGT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:51 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1773343a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 09:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367303; x=1788972103; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F6KFth+wmNcPY6G4yAkPxQ/KQlcOGwTTAk9RODAHfTs=;
        b=TQI2ci+W6wYiWn7+qNKpeQ5PxVHe8tL91Ac20/V6h7SY32xdF3QEOnLQxN72k0khXF
         LQSbvO3MyMwgDrbTnQa52yDQDOBpZhMYPLy+xSMRuY8r/PEJvD5vG08+CjVzW6POXBvP
         NBZtRUrgUv8PNFFvK7uV08z0FV9uTXy33xrp+se+3+Bi7WkMpyI/2Fv7WUs9w8mmYYfC
         Mnhd24xRPXZw5SI+kqoWb40QLhLiSEBbS/5YAVtiOZbHFsoBTpODzZy6ToAQI7Hl12kW
         //bBI/rFWetiEk3O5gzfYGOiaZmR+B+CDW8A3lZ6bwA7qsDbff2TWJpj8wKjOJ/c2+qt
         Jjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367303; x=1788972103;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F6KFth+wmNcPY6G4yAkPxQ/KQlcOGwTTAk9RODAHfTs=;
        b=CKrtGSp3ODUopgVJqhObObZ4owlDttPc+MqrX5O4HBZM1KA/nuAmc1mf9JWP4XE73g
         fBgLA79X7hN1hrfCSEUeWPUC6vATUv/2NXpQ4SVcdAJL7m5/i09UIHCzYajB3DzZE5+s
         ElstEmbMx1AMvzU+BWxSJLRV/025D/b8iGfo/+8gYcsOEUxYBYLAiKqTHTlRFdbUFHMM
         qxeNcmv7E/OSVuVgIKhQvZurzeAej/bcRx2jxbbsHfxRF0Ut35NqPdWNhB/UmqCvoGOO
         /RuE4KmlPuGl1EhckzYcrchTLG5xkH+N24RNYQdVsBkhTY1+vF9ieSx8eO8GWzzDyRz3
         7sng==
X-Forwarded-Encrypted: i=1; AKwUvByZCCMvWO7I8xd7XgZK3BU6SzieTMJWg/DAj6NHZMbenHInsvVxpuGh8YH5Xm+dPv8eeroKbdO40IknjrVXuP8z@lists.infradead.org
X-Gm-Message-State: AFuF++m0qIZJdrX3e7Bq674iT/h81rp0fYSLFKPqAehdg+XENAoAlD4P
	Jl4oJoBWOBV5/t5QW2hh0RUr9Yvl9qbUIAIYwJI1JeMr9xZbBqrUqu+n42lV71hckMYSIjPxuJJ
	+KVYZnA==
X-Received: from pfux9.prod.google.com ([2002:a05:6a00:bc9:b0:847:82b3:aca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9295:b0:837:e9cc:d474
 with SMTP id d2e1a72fcca58-85ed1d07a02mr8719333b3a.2.1788367302673; Wed, 02
 Sep 2026 09:41:42 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:18 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-16-seanjc@google.com>
Subject: [PATCH v2 15/20] KVM: selftests: Use TEST_EXTRA region in x86's
 smaller MAXPHYADDR test
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
X-CRM114-CacheID: sfid-20260902_094147_565224_AE6D4157 
X-CRM114-Status: GOOD (  11.23  )
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

Use the TEST_EXTRA region/memslot for x86's smaller MAXPHYADDR test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_add_extra_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
index 3dca85e95478..b21798a385ca 100644
--- a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
+++ b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
@@ -62,9 +62,10 @@ int main(int argc, char *argv[])
 	TEST_ASSERT(rc, "KVM_CAP_EXIT_ON_EMULATION_FAILURE is unavailable");
 	vm_enable_cap(vm, KVM_CAP_EXIT_ON_EMULATION_FAILURE, 1);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
-				    MEM_REGION_GPA, MEM_REGION_SLOT,
-				    MEM_REGION_SIZE / PAGE_SIZE, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       MEM_REGION_GPA, MEM_REGION_SLOT,
+			       MEM_REGION_SIZE / PAGE_SIZE);
+
 	gpa = vm_phy_pages_alloc(vm, MEM_REGION_SIZE / PAGE_SIZE,
 				 MEM_REGION_GPA, MEM_REGION_SLOT);
 	TEST_ASSERT(gpa == MEM_REGION_GPA, "Failed vm_phy_pages_alloc");
-- 
2.55.0.966.g6673acef38-goog


