Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF71CCD186
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 22:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRjLOkLi9BSY1X/Dn5kuYV5Nji5pDR3uoMZxLkUFt2o=; b=XUv47ZacvjI4cH94j+HnPgFrQe
	WfXcGECLaZxUVZKb+UtSxSqG6qu7imGpiCmKiubdr+NVCrB7EhQpWE0aQXS+FUYkx0NwG3IEfiAY4
	mkLLrwSxX5kPxyix6bppIH90ojD3dAhttGnkFnWlsjEhZeCbwKLNaKl7lRY8y1H0XUou7afeMcsQI
	TzWhW895qnyo5lKCr1MVhVCOS+l46GbN4vx/ZkjFEfLkFok+bs/7wTkINwGZnAC44ywh4RzvxT5Hy
	1J3bTfjITKQ+DVMRRS5UOHknRP/iVwso/2IifutssCcqILP29H+hpNMLEUDOstnQBpcS0HbpEP4Xr
	qiDyIg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxN-00000002qat-1CT7;
	Tue, 07 Oct 2025 22:14:53 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxL-00000002qXw-0uqF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 22:14:52 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-77f610f7325so5371477b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 15:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759875290; x=1760480090; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRjLOkLi9BSY1X/Dn5kuYV5Nji5pDR3uoMZxLkUFt2o=;
        b=gaN+wIDpBAt7J1JqyZsIprKnUS0FpzfROK4wpB21ufymoHhgauGbS3/tH2n9wR8TFA
         b5hf2xg7ZR/RaxfvpOKD/vbZVEb2ONmCZTqWOUFbH/PErwViWpfNt+yFR6F3KUXGPG85
         1zRdQ4UKsoowH/tcy8O9h49U2jrGR5OoNm0a5VYb1NjOk9tvlv42ySLdqAxMb3kAHeSf
         gmNQc4qUM7dcBHrihlHoOkGMDXoPz0dLEs7604RPKR86nMeM2utbZKWSJloZahNebL05
         q9XO14H9Z9Q5oAOCoVKOZAozHDmH7AMl2JccN5fljK4m/nL4pZ146mMAgxoVO+1jlUBU
         qS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875290; x=1760480090;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRjLOkLi9BSY1X/Dn5kuYV5Nji5pDR3uoMZxLkUFt2o=;
        b=TJkdaj1jIX6y8FVhhFtMDe160ZsaI7mSSliVxSwplnfROCrtfKinqGOmowXumyHjWO
         w51l3sZp8bgH7vUzZIMknJ+1Ywey441sClyW0Rm3SUPA2Yp59fILMT9OC0r9/EXOso8t
         X7akizwVy687Ohf5U3n4XvEjH71ApaQFgwDc7ymNORR/x64Vayvn1gJdtvjlm8M3s0FJ
         Lnz1GiNLUEVLdXPc1G6nAV+2p6104KaWajWHWs9KN18mAdMbnV3Y7z2ZrVOFyUrD6os1
         UXZnlWqMfVmWCGgYetSXfE9cRC31yy/TMM3hk9ZQIgCR0rQNfF3ydI6kK6MbC+S7iIWx
         qulQ==
X-Gm-Message-State: AOJu0YwK4ejhE2I2SfnAUqIow1ERlmIDal5mD5bVHUvWlLHYwWdCvkum
	+bCsAL46tVCnsF4dXxdlVvg0EEBkTSkJbpn6Wjip0mlJSoPhaHnBemGhOxtVWu4KolGX7woiImX
	aUU5kig==
X-Google-Smtp-Source: AGHT+IEms4qpmxT3+KnDpQ4qOyqPi3vhEOg4w0WfOhks0tfRQIlFpS+IHju/WYm3RYsFn35p+Bdpiaz8XEQ=
X-Received: from pfbig5.prod.google.com ([2002:a05:6a00:8b85:b0:77f:33ea:96e9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cce:b0:77e:5c9f:f85a
 with SMTP id d2e1a72fcca58-79385ce1122mr1342534b3a.14.1759875289698; Tue, 07
 Oct 2025 15:14:49 -0700 (PDT)
Date: Tue,  7 Oct 2025 15:14:15 -0700
In-Reply-To: <20251007221420.344669-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251007221420.344669-8-seanjc@google.com>
Subject: [PATCH v12 07/12] KVM: selftests: Report stacktraces SIGBUS, SIGSEGV,
 SIGILL, and SIGFPE by default
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_151451_258904_AA0843C7 
X-CRM114-Status: GOOD (  12.55  )
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

Register handlers for signals for all selftests that are likely happen due
to test (or kernel) bugs, and explicitly fail tests on unexpected signals
so that users get a stack trace, i.e. don't have to go spelunking to do
basic triage.

Register the handlers as early as possible, to catch as many unexpected
signals as possible, and also so that the common code doesn't clobber a
handler that's installed by test (or arch) code.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 8b60b767224b..0c3a6a40d1a9 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2290,11 +2290,35 @@ __weak void kvm_selftest_arch_init(void)
 {
 }
 
+static void report_unexpected_signal(int signum)
+{
+#define KVM_CASE_SIGNUM(sig)					\
+	case sig: TEST_FAIL("Unexpected " #sig " (%d)\n", signum)
+
+	switch (signum) {
+	KVM_CASE_SIGNUM(SIGBUS);
+	KVM_CASE_SIGNUM(SIGSEGV);
+	KVM_CASE_SIGNUM(SIGILL);
+	KVM_CASE_SIGNUM(SIGFPE);
+	default:
+		TEST_FAIL("Unexpected signal %d\n", signum);
+	}
+}
+
 void __attribute((constructor)) kvm_selftest_init(void)
 {
+	struct sigaction sig_sa = {
+		.sa_handler = report_unexpected_signal,
+	};
+
 	/* Tell stdout not to buffer its content. */
 	setbuf(stdout, NULL);
 
+	sigaction(SIGBUS, &sig_sa, NULL);
+	sigaction(SIGSEGV, &sig_sa, NULL);
+	sigaction(SIGILL, &sig_sa, NULL);
+	sigaction(SIGFPE, &sig_sa, NULL);
+
 	guest_random_seed = last_guest_seed = random();
 	pr_info("Random seed: 0x%x\n", guest_random_seed);
 
-- 
2.51.0.710.ga91ca5db03-goog


