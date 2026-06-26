Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DC3C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQrCOvI/gGqY/5lmFouPkrLmKsRGpPhinpGyhSDO7Ek=; b=uviYDQIzeVJwP93CH53SB4yA5V
	U66lXbgvr+NdbyGIYcMUZUCqFyIry5IfBxwph9YKt49LZ5oGO3PRvqZtTi7XKBhk3ryFGxU6j4uLr
	uPysx+V/64eJV4LRic6XLlna59AG6Lwh/bzeu904+unlMGamrhU9xNJwdCizkjWsUugesWpgPMZB8
	c8/XjTJUMRHwqpM/YPTnxwcg03hV7h6hCn4iGAnVnop6eC7xEF7Fk+XDyg2xuJhKIVJB2O0Uh+9oV
	1GO44P6vKLm0FIUKiUSmxPWImWciTvL4H/weY6HVS9hQ2uyB8UiIWsYaUbKlxsTWs7LLlNMZ2ISZU
	56D6vU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDC-0000000BuHg-06E3;
	Fri, 26 Jun 2026 21:35:46 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdED5-0000000BuEp-2fzL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:35:41 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2c6bbd0afffso19441045ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509738; x=1783114538; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SQrCOvI/gGqY/5lmFouPkrLmKsRGpPhinpGyhSDO7Ek=;
        b=Wna6J7VqVX1da0xFw4+eOO8IPnpXeZnuCOqU1bL/KqIROoRDJk8JpaqYqtNbPrWuT8
         +cN/EJIBe0NdP7/aXqAVaJKefn7nzwk0OBF0A1ORC3txHPohEk4jEK9pKoH/EgClQGmS
         v+eoIgMvy/XJMqsiPWUuboPPrR73Hf2JgzSW5BrUPyYMjRi7IrxtnW0CNvgbWaj6ugPD
         SUId6eOq7LTzOEj3l1ZZqPOjLl8Yhd0avYIwRFok7oHBUxyjJAXmrcnGjukRstqoyP9P
         +waZ+rBcEsNUa2BI4IdOosJ82ZtgzIs6s7Z9TQHbaxwlhWrXd7Q2grV0Dz+LtCx1jWhP
         /CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509738; x=1783114538;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQrCOvI/gGqY/5lmFouPkrLmKsRGpPhinpGyhSDO7Ek=;
        b=M50B9k8svIaT8UNwTDhh0Icrw7IW7+oBCsIoDmR2kc5GpgbxbBeYgKJF7N8igwCNSk
         I8NvVFyKMyCuzZ2b8jYB5AqekLAuzikpNUrFynR0Oo+Txz7PSouQHBHXDPI9e28BTPS4
         F9XW1NDkImp3lFCfWWgu5h9i6eLJf+JY2mtDPqtmfL4Wr8ge8q4LcsOqgeE8WhB6cDOc
         pXIn36Iz714TxwqPYU5m5n+2sPgDtEy6slo/ExByRT12JA8Ix+HaoRFzos6HIm3XM9RF
         /47WvJH9TmRLl+lCrwLWupAxWp/LlgJE4d8iJm00R5BcR+Urua35+Mjf7c7Iz3uGM42Z
         vdWg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1/kHdhlm8HkfkPed5korO/rDAqqaajx43YDdg4KJpQv2+WewExXY0a/YhrtwM0iN/1TkN1UZ5QIz5v+vuwuWB@lists.infradead.org
X-Gm-Message-State: AOJu0YxYEx1qZJ85sYC6NMmP36gyB/LSCb3RV4YklM9CsmHA/0MKePqb
	RzDdvBxSNiZ6NviZNVCj8VopPJ9Swe3KHwWAn9dcEdY6fexC8Zh4I+Lwih1BC6MtmCVFf+4R9eY
	VD++ydA==
X-Received: from plq11.prod.google.com ([2002:a17:903:2f8b:b0:2c8:17d:91a3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2304:b0:2c0:d91d:c3e8
 with SMTP id d9443c01a7336-2c7fc65423emr78308535ad.4.1782509737490; Fri, 26
 Jun 2026 14:35:37 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:14 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-2-seanjc@google.com>
Subject: [PATCH v8 01/20] KVM: selftests: Build and link selftests/vfio/lib
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
X-CRM114-CacheID: sfid-20260626_143539_677875_07FE4D76 
X-CRM114-Status: GOOD (  11.10  )
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
index 4ace12606e93..ae0dfd67dd31 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -259,6 +259,7 @@ OVERRIDE_TARGETS = 1
 # which causes the environment variable to override the makefile).
 include ../lib.mk
 include ../cgroup/lib/libcgroup.mk
+include ../vfio/lib/libvfio.mk
 
 INSTALL_HDR_PATH = $(top_srcdir)/usr
 LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
@@ -313,7 +314,9 @@ LIBKVM_S := $(filter %.S,$(LIBKVM))
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
2.55.0.rc0.799.gd6f94ed593-goog


