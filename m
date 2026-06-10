Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAA2CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 00:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3dsDf1mwPqE6CLqG/GF7U0hvBMIyZSe2b/ARirZzXU=; b=NesbUlHecvsA9lPi9g1MjDVASl
	RS9LN7ILujnRlz9F1PcurppbRXH6DPXC3FdjUDdbtkUtGFdnwryrl1E8+Tm3F1N000jySAdRGPo/T
	rmph7ZDFRLunzezjXqoqD1ARTPauOh60p+aiqMD2ywt8qO/42yYca/pAz+Ul+FhP+IKLnRkJVSarI
	mU5/DyL9W4RO9ZajOoSw1w4ZAptAVgpPviiWS4/DLFPhIftto873rBwQYsrLnPgnqil410Wtto7DF
	LM5a3SHfZ7F0zDv7JsmEv2kXZC1qARk/0LcadfqU9VEhiKCr1gdpMRGfiN2fvnAlU9r+FnTb20RZd
	AHT6G7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7CV-00000006ZPw-1AyD;
	Wed, 10 Jun 2026 00:53:47 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7CR-00000006ZOZ-46RO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:53:45 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c856470fe9fso3986657a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 17:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781052822; x=1781657622; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=E3dsDf1mwPqE6CLqG/GF7U0hvBMIyZSe2b/ARirZzXU=;
        b=TALOjphMKAbHLdxd69VES4miRspk/Ns9mxbTIRKbJ0iGLJtYyzALHNT4I3XkfQOVK4
         20GPLNT+c3cLvwY+13YAUMt4QqyBB6F5BEAHK+KsCkuoqS/eM1Y3Ffg+cDu9U6qBdEzK
         Ki+iBsyXz9X9NltFLREvy35l96SUX2me9KpqABezKXyCxXqrExFj81WHo1gyq9YukiCi
         lc3EPydgQZrq7UNSZL0BYh9OVdX9MHO/b6kPKfCyOqHT6dXGGlxfeYtEvWDycgASXphW
         scjTkMiooB3uUZydVPRdKD6dpAB5zgKiRGfM1gP9EexBusOt/GGWBTBBUNwZKnuPsV6h
         Nt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781052822; x=1781657622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3dsDf1mwPqE6CLqG/GF7U0hvBMIyZSe2b/ARirZzXU=;
        b=MQtR0PxcPTSkJsXRWZuAX8W2eoZZtqX8XEdGQnkuEZPE/Q/gwSZWA17nCUy+1ujMVx
         fNoUWsC+ZWzUaLhi7hw9AYdr+eV0dlAu1btH7adGvhui01KBL522z0aYhXFELmeua6Gv
         itXQmtDCHR/CxPf60eGOJDYXEd1XGaXH5FVHUYe0sr/lMcKvAn65cqbrZyPszmmnnuNK
         U9KbDpfOrCouB+sVgZBUr6U86HigqJPnf6Oeaa0s49Aus5X462CV/+K+6PCqfj2MME7o
         4HeWovXYNV50oSZoG/MFDq5wQ0h5AVxELS8D/6HBKvsdBS6Pl6kMhCHpFHlUl7rsl8Ym
         e13w==
X-Forwarded-Encrypted: i=1; AFNElJ+llI7w2XxdIFKjwpwrgrOjGtYd/94hGL31LYH614rBmdOUamyWFHlO2S0ysMqvEaAiMaAncbdSGQUhf9D4+Lq4@lists.infradead.org
X-Gm-Message-State: AOJu0YzPwwfwmykRNrm7ZUryarQcJv2mMWIH8xkmrT2apeRpRLYEXtY+
	u+1GE7R7hw8QAVZVSfGrqkgWKtV+fUzwyDw4v7t/9h+Qb8Uw1I3Iffqx5N2dBsuE0LenuiSSkVf
	bYC0R4A==
X-Received: from pgwa8.prod.google.com ([2002:a65:6548:0:b0:c86:2164:9671])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:b87:b0:3b4:8268:23e8
 with SMTP id adf61e73a8af0-3b4ccdf102dmr28032201637.21.1781052822397; Tue, 09
 Jun 2026 17:53:42 -0700 (PDT)
Date: Tue,  9 Jun 2026 17:53:21 -0700
In-Reply-To: <20260610005338.2967132-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260610005338.2967132-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610005338.2967132-2-seanjc@google.com>
Subject: [PATCH v6 01/18] KVM: selftests: Build and link selftests/vfio/lib
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
X-CRM114-CacheID: sfid-20260609_175344_044600_231B1EAC 
X-CRM114-Status: GOOD (  11.47  )
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
index e0ddd3ff9472..14316358fd9f 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -257,6 +257,7 @@ OVERRIDE_TARGETS = 1
 # which causes the environment variable to override the makefile).
 include ../lib.mk
 include ../cgroup/lib/libcgroup.mk
+include ../vfio/lib/libvfio.mk
 
 INSTALL_HDR_PATH = $(top_srcdir)/usr
 LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
@@ -311,7 +312,9 @@ LIBKVM_S := $(filter %.S,$(LIBKVM))
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
2.54.0.1099.g489fc7bff1-goog


