Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8CCC55175
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BfMO7lDi/jb9f6SoYoHXqiGNPLVG4w0N20HXOwKIiI=; b=O4OFunbTPdprzR1lgYBjB80sB8
	yGzBxzmySsMQGRo39EDm9nNTAZeK+sPImnJaUr5d1kc4JE46f3uC7affSxiC1xxL6mFmBd4KvEta+
	J2Y2CL64zsEgJfZij572FADlemqKyAp55dtrvr0QUg7LRBTo6PCN7CD11jzVObkA8WWn3lXM0kYvk
	g2wIsg6KPH7jLx4O6ti3oxuQD0ROJPv6XMBWsUjKPCYSyuWZudoySUYbrEidMHfJPzNT6DbmDb923
	7GE2EhC2dGfetgVIOZoOuvb5BOXcjSaODqxFSSxsCw4FWnen5JZKHqY1rTwh6XXibP1MY2a85TruZ
	3GrCoERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqh6-0000000DDix-1qb4;
	Fri, 31 Jul 2026 17:06:48 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqgp-0000000DDbJ-15nW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:06:32 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so22488745ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 10:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785517590; x=1786122390; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9BfMO7lDi/jb9f6SoYoHXqiGNPLVG4w0N20HXOwKIiI=;
        b=JAhZOhOIMmXxKNri3356voq1YbyFH2PoEN+w+z+F1fUSjd15wYW6MzG2oggeYPIHhG
         UOJRLABU/m6rLpf1OLYmxc+W80GCkHnOW4FcWKJMbOJ9NsUKfOo9uqCYemaLgWtRu0cb
         Q2oEDz7O1HA80MaTt+jHcVD1vdzRn64W5Lx+OxyjF4Akv5eACCyFi37X0QsFMu4q5Y/p
         ah/ltTZ8wg+lIMtxy4goEMYEVPhQ49p2pRifyT7Z1KHvRQMiz8N7K2xwe0QucaJ2SYP3
         Na3AOkFxe+zTWxbWDJIBo+ReHpJ5GcW9jWNEwjlEhTF9ZsiRNlEvfomnQPDBXzI7qviO
         vQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517590; x=1786122390;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9BfMO7lDi/jb9f6SoYoHXqiGNPLVG4w0N20HXOwKIiI=;
        b=PFKsd5pi/ve0k++BBE06kXA2D8Fh8Uq70fq6sFsP2yHCYww5qNXlYvL5Q/jnIRF5Ai
         KOXkaKuF2l+DU3XINxYRQYNLED5IL0A7Ixg85DEXN1AOH+mwMIfkkzjYyrbMxHTfvhUa
         ymHTf+X0B0eUb+NHpua6YP1xhAGchckxZOEURKBFJzHimSV3TDzXfaocZ2KfOZH3bCgj
         NSMDcPpgOR7hW+j+V7eIYdZiN+t9aDmx9BgmaTx5Y71XCnWVysjQGIcKoKAjik7dHgvx
         V1ygLEpY0+/IPk62cBPZ58BZsmBCf8CG8U6f2UMi6k6bynG2Xa10TbpWQkwyxbihTiQB
         NBdQ==
X-Forwarded-Encrypted: i=1; AHgh+RoF4BIOXlN172qLl74mT3sOUuHf4EQpZ1Z1UgNvfyA4COdX+MMBJ1D7GYcdRU4PgKb43WrmTY1L+b5Sl53s5y0d@lists.infradead.org
X-Gm-Message-State: AOJu0YytrsRyZMKYHOgEa1p/BxoZjl7QFMYOtfXMqyjBXPRVqq1nGTt3
	vJtoS/fE62eUWLTZ19za+28pqeP/XXujXo5nNGTyF/cUfWdmNUzrJtjLkpmpHrAb0zzu17bR46P
	wQBptTQ==
X-Received: from plje10.prod.google.com ([2002:a17:902:ed8a:b0:2ca:e62e:eb94])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2d1:b0:2cc:6817:d9bc
 with SMTP id d9443c01a7336-2d0523e6ee5mr6994735ad.38.1785517589951; Fri, 31
 Jul 2026 10:06:29 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:06:13 -0700
In-Reply-To: <20260731170619.2620845-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731170619.2620845-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731170619.2620845-7-seanjc@google.com>
Subject: [PATCH v2 06/12] KVM: selftests: Affine threads to random CPUs in
 hardware disable test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_100631_309880_1DE4AE1C 
X-CRM114-Status: GOOD (  11.32  )
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

Affine the worker threads to random CPUs in the hardware disable test, and
honor the starting CPU set in the process.  Hardcoding to CPUs 0-3 is both
wrong and less interesting than running on random CPUs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/hardware_disable_test.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
index d8288147b0a6..bd23c1300370 100644
--- a/tools/testing/selftests/kvm/hardware_disable_test.c
+++ b/tools/testing/selftests/kvm/hardware_disable_test.c
@@ -149,12 +149,15 @@ void wait_for_child_setup(pid_t pid)
 
 int main(int argc, char **argv)
 {
+	cpu_set_t allowed_cpu_set;
 	u32 i;
 	int s, r;
 	pid_t pid;
 
-	for (i = 0; i < VCPU_NUM; i++)
-		CPU_SET(i, &threads_cpu_set);
+	kvm_sched_getaffinity(0, sizeof(cpu_set_t), &allowed_cpu_set);
+
+	for (i = 0; i < VCPU_NUM && CPU_COUNT(&allowed_cpu_set); i++)
+		CPU_SET(kvm_pick_random_cpu(&allowed_cpu_set), &threads_cpu_set);
 
 	sem = sem_open("vm_sem", O_CREAT | O_EXCL, 0644, 0);
 	sem_unlink("vm_sem");
-- 
2.55.0.508.g3f0d502094-goog


