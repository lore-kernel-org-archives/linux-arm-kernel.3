Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8702DCD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Iw6k9IvS6YCS0467Ck1NDjfIZOkbT+wEKpbw8XzGD0=; b=bkw5+bL0Mhr6caEN4FLCseqnO/
	yNTx5uDhr6FtWcWU73KYifC882GhrC3Dr5IW8JObaMGsB9EC2TgPUylaAZBUDulAd25CPFeBeT2D8
	OomgRixN52v1JfeGXvujcKPgzIGOLWClOm8aZ3yK+amqvQI3uvuDh49hxfNkjumhzjtosZKNJMr8g
	ZlcZPzBECteLzt3md9jNz25FVi77VuUXq6WJJRzvFKI1sqUu5SmsiHMj9BziYTxTpv1TFoqxdtqT/
	q02ovioZw+qbKDnHWVesGwhbiy6F+MrP9ULxYz4C1IQLJus5IEs7e4qZnxGRr7BzxRsMwos3QyYpu
	oDAS32AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC77-0000000BnY2-1fwe;
	Sat, 13 Jun 2026 00:20:41 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC72-0000000BnVY-2nvc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:20:38 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2bf1845bddfso16086065ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310035; x=1781914835; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/Iw6k9IvS6YCS0467Ck1NDjfIZOkbT+wEKpbw8XzGD0=;
        b=a9F4m8pJPaAp1fioCdodRZ6WiXhWJMZYrcaJ4B7Tl1BEaZ+rA8DZFMp+gZjxQLpw5M
         /W+R95o6o3nh/iTpk854xvSeZpNWhVMWk8++F6LNf2RYzyYGUqgjpGZdUiYLTQLN++U0
         FQ1whzs6/cq8i043U/GLah5QkjWkLAYIplzEmZzODPxI6lxONy3vz+PSKhogeQvBXasp
         SpEU5pd41aphJNVz91UEyayWUimKpEcmVGld+oyNXl66UY5sMRmLK6Gc1q232Zp6SSWn
         JP5JUamZEeDXa45J25yEq3XM74zTh5WgGiIaS4eO2UMu4mHSqzsl3lVtpTBj3f4/dDYj
         if0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310035; x=1781914835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Iw6k9IvS6YCS0467Ck1NDjfIZOkbT+wEKpbw8XzGD0=;
        b=QBu5lmFBgWRoaIH9zFPyA36+twVWVj4OlCGmKTktj+WZjvFezjfj0uSyRbKYD1q18K
         R2Q96HNcXVI+UZJ3uzCO4sFoYRTlbFnUzg6rUm6BfIvG5Vd1nft6xuFSy8uO7YzO9MpK
         v62Mq7tQIz9Xw/XDRfRvSjR6O8hkq9BYm8mg6/Gb9yL6cLZRkpceCg1Kw6uo0dnVWBP3
         MqOuoi1b+RKH1/ANLbzuwpxLSCVq1LyMlGU407iGKgiah2T44HLM/+jIZUoRwuG+WHkE
         cDIC+LNe7T5WRmbWWiZbQnnmmEl+NNohIicjaC4eLR3ThfuEHWfv3L8CFZWawuddwf5b
         ehiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tOMf4hLV6XqPVFKB206GN3yH/Qst/pqLyoUYvqkNkis3FFCMGXX5gr3qexkrhpIMq1tuGSbCLr9nKRe0XqI13@lists.infradead.org
X-Gm-Message-State: AOJu0YwEdPPUThLmD0yFo4SLcZ3oYp4k9IRYBb890zry9DiGCOnbpfNN
	IHmre1rFiRSivmGXkDE+jYs0QiBfCB8zVkRe5LhqHHk9G5/htWOqjVI0gZRLT76ixZSWR9Zc5J7
	CH97mug==
X-Received: from plbmf15.prod.google.com ([2002:a17:902:fc8f:b0:2bf:14c9:866d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea07:b0:2c0:d91d:c3e8
 with SMTP id d9443c01a7336-2c41050b2aamr61506165ad.4.1781310034931; Fri, 12
 Jun 2026 17:20:34 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:12 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-2-seanjc@google.com>
Subject: [PATCH v7 01/20] KVM: selftests: Build and link selftests/vfio/lib
 into KVM selftests
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_172036_713800_D7746F8B 
X-CRM114-Status: GOOD (  11.11  )
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

From: David Matlack <dmatlack@google.com>

Include libvfio.mk into the KVM selftests Makefile and link it into all
KVM selftests by adding it to LIBKVM_OBJS.

This lays the groundwork for future changes to utilize VFIO devices to
verify IRQ bypass in KVM selftests.

Note that KVM selftests build their own copy of selftests/vfio/lib and
the resulting object files are placed in $(OUTPUT)/lib. This allows the
KVM and VFIO selftests to apply different CFLAGS when building without
conflicting with each other.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 9462919d2660..59ec232b1e93 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -258,6 +258,7 @@ OVERRIDE_TARGETS = 1
 # which causes the environment variable to override the makefile).
 include ../lib.mk
 include ../cgroup/lib/libcgroup.mk
+include ../vfio/lib/libvfio.mk
 
 INSTALL_HDR_PATH = $(top_srcdir)/usr
 LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
@@ -312,7 +313,9 @@ LIBKVM_S := $(filter %.S,$(LIBKVM))
 LIBKVM_C_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_C))
 LIBKVM_S_OBJ := $(patsubst %.S, $(OUTPUT)/%.o, $(LIBKVM_S))
 LIBKVM_STRING_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_STRING))
-LIBKVM_OBJS = $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ) $(LIBKVM_STRING_OBJ) $(LIBCGROUP_O)
+LIBKVM_OBJS = $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ) $(LIBKVM_STRING_OBJ)
+LIBKVM_OBJS += $(LIBCGROUP_O)
+LIBKVM_OBJS += $(LIBVFIO_O)
 SPLIT_TEST_GEN_PROGS := $(patsubst %, $(OUTPUT)/%, $(SPLIT_TESTS))
 SPLIT_TEST_GEN_OBJ := $(patsubst %, $(OUTPUT)/$(ARCH)/%.o, $(SPLIT_TESTS))
 
-- 
2.54.0.1136.gdb2ca164c4-goog


