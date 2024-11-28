Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D4DD6D251
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 01:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qp0x5jmf6wCt1OmSFixie+OQOct6OMtePnY0hHC3FqE=; b=nnS7ESs23cW1Jhv/PHUExGxNGT
	py3HfVO6Is9XeSwWPBTsBNpq/MIc5+Y46A3nw6aMsA946kusK923EQt3gV8iCOdUwROIOCRVmtK7j
	OB06X1Q7VqC2YaEz3qTFTgHiXRn1hs0h9fdOXLWJi+hLPWH5gLAK6g2wlVVPPuauHmQq/1YW2aRFX
	GiGoHS1bdpyJ6vXzLx24ID9MYG77bMhYZwCKtetp7CrA22TdyehzY3DZ74Leqp/CWwA+LA0pp4IQd
	JIih0QOgmu/4ZqQAzfw9xngpMNuu+/+Pkd99YQFvTQbZiDOARBZKh5v/LZb9TqtYs8kJHi9X9kB2x
	VRCKIQoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSum-0000000EO2G-0XBo;
	Thu, 28 Nov 2024 01:01:52 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSp5-0000000ELqT-2bQd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 00:56:00 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7251d37eac5so392275b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 16:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755359; x=1733360159; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Qp0x5jmf6wCt1OmSFixie+OQOct6OMtePnY0hHC3FqE=;
        b=vXG1TsEY4MyTtnSbC7GZOYIeuRF7oNuAcr8WdHNvClitQaU3tfZjM8qzOc5w4C9i/x
         YCmli0SswK+FliO51jWVuAeCGK05tQfIVHBC9eXv9QnVzlQ5g/oe92YYRALr1l4dokzV
         klAcC3swn5qQsJ7MFXMLPu4sefW1bS7wV6oFbV2DKwjTZp8IXFsx0MURp1s2EncmTxhw
         iGGa4riwrsOhhg7tYTHhJ36wGHWMknnlJp4Gab87XDgXFDEDUFo0x1u/fINg7/mpm/cy
         /Xs0bHN32vHHU+OpxGhsS0mUiqYzZuE7WQS0azINZN4aZtmRrimKTpkZb7emkL6i7Ce9
         /nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755359; x=1733360159;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qp0x5jmf6wCt1OmSFixie+OQOct6OMtePnY0hHC3FqE=;
        b=h3HrSdqqaRNmyJ9uLZeBE09kxyG9sMcR+DxatsoU0aKhiMasZNCzs7ZQt6BnS2ZPgv
         3KzkRSwhFbaZ4ruMb9xeDLsoJFxGGIyt88k8YX0Uq+5whNour4hpadYEq6c6G5xS4B13
         uMTk+IW+un4vtEYkZ73tfOkl440daOZQoPybyhHwTwFNw+zNAREZDo2le0UBITc7cynJ
         KNpr+mQxKtpQP/9phb2ogq023WaJBi/KNVt5FLRtxI2TwBVMOKVZK+qzEm2/MiwhgcXA
         OoHTP5vPvjlA4RUZuu05YUYHflypa4it6zZv96B4QFMidx3bcApW9ALVauEtHg1XGIqh
         WwhA==
X-Gm-Message-State: AOJu0YyWES3CTJolhYMomg28staMrpVojHCpbAjvI+X2EeXd7XodjWc0
	Rw7EFFfZylDMNSxcT0uDogo2jtV1LIp7CQTFH6smvcg6/VuuPBhRlObR4ZZmI2Cairh3U+liCcN
	1cA==
X-Google-Smtp-Source: AGHT+IHRct+tg9si6FXkj3XDfvATucfZZx/pmM1rsyJ2yuaIieXkck617uTZGF3kPo5jFFwMAZ2X8QIv/Kc=
X-Received: from pfbjo14.prod.google.com ([2002:a05:6a00:908e:b0:725:325e:59d5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1492:b0:724:f404:7101
 with SMTP id d2e1a72fcca58-7252ffcbf80mr6785726b3a.1.1732755358707; Wed, 27
 Nov 2024 16:55:58 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:36 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-6-seanjc@google.com>
Subject: [PATCH v4 05/16] KVM: selftests: Rename max_guest_memory_test to mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_165559_707534_9FFC8E61 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

Rename max_guest_memory_test to mmu_stress_test so that the name isn't
horribly misleading when future changes extend the test to verify things
like mprotect() interactions, and because the test is useful even when its
configured to populate far less than the maximum amount of guest memory.

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile                            | 2 +-
 .../kvm/{max_guest_memory_test.c => mmu_stress_test.c}          | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/testing/selftests/kvm/{max_guest_memory_test.c => mmu_stress_test.c} (100%)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 41593d2e7de9..4384e5f45c36 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -140,7 +140,7 @@ TEST_GEN_PROGS_x86_64 += guest_print_test
 TEST_GEN_PROGS_x86_64 += hardware_disable_test
 TEST_GEN_PROGS_x86_64 += kvm_create_max_vcpus
 TEST_GEN_PROGS_x86_64 += kvm_page_table_test
-TEST_GEN_PROGS_x86_64 += max_guest_memory_test
+TEST_GEN_PROGS_x86_64 += mmu_stress_test
 TEST_GEN_PROGS_x86_64 += memslot_modification_stress_test
 TEST_GEN_PROGS_x86_64 += memslot_perf_test
 TEST_GEN_PROGS_x86_64 += rseq_test
diff --git a/tools/testing/selftests/kvm/max_guest_memory_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
similarity index 100%
rename from tools/testing/selftests/kvm/max_guest_memory_test.c
rename to tools/testing/selftests/kvm/mmu_stress_test.c
-- 
2.47.0.338.g60cca15819-goog


