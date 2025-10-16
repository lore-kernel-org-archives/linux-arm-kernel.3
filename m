Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B1ACCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zq1tgXWhdaEPjv5XRrUDfAt6UbT40u8GeEVyLVyfpR8=; b=TdKxsisP1ukMRA2A4KRb+O3Kzk
	0lwHCd3fudOw7l2VHrQ6bFtR1SnJB7kJCXVK1R4T5FAhynlXzAHV3i5fDnaOFmgqZrzegRXMY6rHy
	MasYMct1Wn0pbQtX5BRyjMy4x+uS6VythFKuxQynOADs8vP9vOiCFw0XJW5K02Za025MK3URpqCP/
	MRBrA4Z86rGLpSOYthOLAIzK9/0OUvV1UnaXDs5bww+pjnrZpwnh2E92aDdplRPedE56L6mipcq1h
	J3cbjxf603N4H6R3wvqqPHwC9TjtWaooiPbpy3msY5w38UHwKjQCpLHEkVKxz21yYCcVk8ebo823A
	Bnl4j+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RoH-00000005Zsk-0NOJ;
	Thu, 16 Oct 2025 17:30:41 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rnz-00000005ZdX-0wqy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:30:29 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b522037281bso722217a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760635821; x=1761240621; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zq1tgXWhdaEPjv5XRrUDfAt6UbT40u8GeEVyLVyfpR8=;
        b=Dc1Y77zs26kvHte4KSJUeygLCIWVnzWkQve0G/dgrG5/5XaV3nT9/sCYbADwY9O7Lg
         O/nz/tXGset9M2OqCil9PDHes4D4afy0iWji1QD+A3eH2SbkyVnLkubUI4msHElMwi1l
         kXXVILpOgjv6Yd6rD36rXc0QjvbObNYVH+EQCpsX+EpkiRU9Fr/t+tK1Ni9k/DdnK8no
         RbgLEj2um+SLTbiVDv5zeX3twMd7soY1sZ4L94J8h46wiuXDTkp4apdySAl8a2/UNCNR
         6iFSvTX3T6acjsJwgYkPnzmgkm9jqfruZVNobxazzqPriozTZSkAPnqzwRlWrfUk0UYN
         I7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635821; x=1761240621;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zq1tgXWhdaEPjv5XRrUDfAt6UbT40u8GeEVyLVyfpR8=;
        b=cIruyi7lY+lMW+h+dbEzen3P7ff/Ls2HjK1pgY9H++I7XKcwkp5irdqkgvp619RKH1
         9qykRTfNL2Liu5whsjC+xzTTlnFkCVw9pMMUGYhN65f+VAB0zMvLE+JH2fmX+0oROzvF
         G1ZvOxzWWk6F+rE5352v2mfBVWRs101I1eQ81hM/F56nupVJcnTw69/56VhQ30usw6oD
         8mlyV0b5wLyQZ0QpyLqfPudw9DVHWz0yK2qi3BMFgrjrwNOHeYZjQwfkP6y3XVGrdAVS
         L/UeCBoAGHAzBnpqauWfWjBqEb+RYAMX51vUTsw8izUbC8erpKSmSZpR3MSbVpAp4E4n
         ddzA==
X-Gm-Message-State: AOJu0Yx3kny/QOHDC/5tOjdnXOd0Sa2jg2OyvK20t2ZOyP3xI+5F2B23
	9Va0SZbSpoUIuqTNt+pvFbuhyyyosymjakQ6pruvnM3R1KlS5asZCvukChO6QJC56kwqEaSxH/n
	inKxfCw==
X-Google-Smtp-Source: AGHT+IEB/z+VBtg6OE+012RtMrAcNLRkjMeLsa6vSWEgt3UDRue4tkCjjeMMCGdXCD5ilhuA7eHznquW6sA=
X-Received: from pjzh17.prod.google.com ([2002:a17:90a:ea91:b0:32f:46d:993b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c0e:b0:33b:c5de:6a4e
 with SMTP id 98e67ed59e1d1-33bcf853711mr677585a91.5.1760635821102; Thu, 16
 Oct 2025 10:30:21 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:28:48 -0700
In-Reply-To: <20251016172853.52451-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016172853.52451-8-seanjc@google.com>
Subject: [PATCH v13 07/12] KVM: selftests: Report stacktraces SIGBUS, SIGSEGV,
 SIGILL, and SIGFPE by default
From: Sean Christopherson <seanjc@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_103023_284201_7A03B518 
X-CRM114-Status: GOOD (  12.09  )
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

Tested-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
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
2.51.0.858.gf9c4a03a3a-goog


