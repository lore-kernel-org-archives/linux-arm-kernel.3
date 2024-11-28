Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74646D6D252
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 01:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3N0I2xWsrfV4i9nnr3KT1Cpmm4B4GrEhZX0cF+2Gqk=; b=Z6yu2JYqsIvwr97vOiLddWEjhW
	e72Neoi6NpqJ7dWiBDu28yUjt5toTmZ8skQtui6NYBAX7sQcGey5U3PDZ4Y6rCNtUDkA4OekJKX2Z
	3g4UT2Byi3dw+fASnpGNTQByhzGuqDVYDfTm80OEaVTan6fMOZ6vZC3PxXediDrIvlHIoj+zs1hXR
	RocqCJb4u3RL/Jk9Kl/kfqvpXuTzuXnStwquX6yPCBCD0dHo8VM3EVosGOz/g8/ZLTNu0LvSQfXbx
	4sDfWeUZc8jmdjtpjhOa3kd9RdcQFy2EjOH1v03moAGww3cgnldRI4KmWy2VrsePa8cjOdC0TfDnU
	mGzI5Rvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSya-0000000EOqp-0BeH;
	Thu, 28 Nov 2024 01:05:48 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSpC-0000000ELvV-26oy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 00:56:07 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ea5447561bso309261a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 16:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755365; x=1733360165; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=m3N0I2xWsrfV4i9nnr3KT1Cpmm4B4GrEhZX0cF+2Gqk=;
        b=gpwYmPBqOJqb7DV54cDcRy44ky391zaidr5gqV1nM958cFcXMYOHFzwpI9iYwZzmGy
         EPT/21vtyvbvSQ9jAZv3ZOCwb/Exq4UmHyBvD5qJqnWZC4UZSVEqlnWWxTRxqkCcgw0J
         N80malAxY0NojwGztsIQkThRC5SDK928pUlPJODx1x1vm4wIu281Tx1AeiMjV08QnOJ6
         Gnu6xATk57YIKHn3fC4Co/EoLs5REeyPKWz2WSAMZ2qBLE1sFIflYS3NQe8KTmr0toj/
         XV7EFCECNaZdrC6LBkLri1aLsCsMW7gNzB/lOVsEGe6wJWJIbyA3zKArHcUzdNlswwKE
         ItCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755365; x=1733360165;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3N0I2xWsrfV4i9nnr3KT1Cpmm4B4GrEhZX0cF+2Gqk=;
        b=UaaO+YQbCnfNbcEbOI8BvHby011dh9RxgR31C0YE4qZzVJFdNCujfaywvP3R4ArLPO
         BY8PE0GeflENJDcTjqwkvoPFJFDnYziEYHBc77zHFlVmk9c81JbChkvBXBF+UBcynxR4
         2r/byWyiZVDQXpP0GSiP9kw/TJyVwnw8ME45FzNa66RtB4v7DC/iNP/KGG2dLhRAa8vn
         Me97rz7UryH+htsWXSt2zR9vtRQfgZvS+WxkZGNS6mwuzSgCMJX6zc4FLlAXQa/LG3Kp
         JpWkiKm6o8g/90CYMrkqpgPBXlFdpHWd1TaDC/zCLJSGCpL8pS/puqHcJf1NTGZCKfoI
         FOlQ==
X-Gm-Message-State: AOJu0Yzv4xDmXq0c2ehYUHUKqc3S2TksxYLE8VgCt3GoGUQJSFtTyVED
	HOyouXx+EGr105PdDiFXd/1QZuK+ISzL2rSoIdjgZnx5R2vrbnFQ2V1x83HlGLSl9FBSqBx+2lX
	ooA==
X-Google-Smtp-Source: AGHT+IE4OA2YWpjZt4cUyGKEolrSn+wbKfMl6eazhCePp/W8mIleK1HW5p9Pm9svs3J06p9qg41Q+800XRI=
X-Received: from pjbsn5.prod.google.com ([2002:a17:90b:2e85:b0:2da:5868:311c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28c6:b0:2ea:6f96:6504
 with SMTP id 98e67ed59e1d1-2ee08e9c7a3mr6508990a91.1.1732755365479; Wed, 27
 Nov 2024 16:56:05 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:40 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-10-seanjc@google.com>
Subject: [PATCH v4 09/16] KVM: selftests: Enable mmu_stress_test on arm64
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
X-CRM114-CacheID: sfid-20241127_165606_545214_BEBC34B2 
X-CRM114-Status: UNSURE (   8.78  )
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

Enable the mmu_stress_test on arm64.  The intent was to enable the test
across all architectures when it was first added, but a few goofs made it
unrunnable on !x86.  Now that those goofs are fixed, at least for arm64,
enable the test.

Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>
Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 4384e5f45c36..c59a337cd4da 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -180,6 +180,7 @@ TEST_GEN_PROGS_aarch64 += kvm_create_max_vcpus
 TEST_GEN_PROGS_aarch64 += kvm_page_table_test
 TEST_GEN_PROGS_aarch64 += memslot_modification_stress_test
 TEST_GEN_PROGS_aarch64 += memslot_perf_test
+TEST_GEN_PROGS_aarch64 += mmu_stress_test
 TEST_GEN_PROGS_aarch64 += rseq_test
 TEST_GEN_PROGS_aarch64 += set_memory_region_test
 TEST_GEN_PROGS_aarch64 += steal_time
-- 
2.47.0.338.g60cca15819-goog


