Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6D8C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 00:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjMNjs+bdNtZTb3Wdy6sSLCs56ksmcfEkIHqJR2gBFc=; b=4Qnd3uwTEZnJ3xsxIdn2WRN8+w
	TDWCgONy67HO6rCUdb+rdtDRgWtKiy6cQz8hCjnSge2PGszlLvJBSKRAYRXpMQiQfbpTDYYNv7kCL
	xKtY+co8hTvhsLVeDuuyM2vIgpZJ+EcaoOa8iG0BVXf+M2q77NhotuK2yoH9uw484gG9kc29rLbdb
	QIlgBqnxbWJP/MpMwIMd6f7g77EPq3WfAV4pB32iD0ZX/nuJtMx6jb+SYzXjWtVAjcKTWR+1wsD/v
	mb9+lbwnAoWr9mDEE0LtdxkI3pnD2dQoVPZlwDxobxk0vnupAXnEu5vOCUbhp/EW6yqkoGCpC23U9
	z8Ly/21w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIG4i-00000002ZYk-37Su;
	Fri, 23 May 2025 00:15:48 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFiX-00000002VtQ-3TRe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:52:54 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b240fdc9c20so8800087a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957972; x=1748562772; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jjMNjs+bdNtZTb3Wdy6sSLCs56ksmcfEkIHqJR2gBFc=;
        b=2aUu3bA3Vaq/bvEKPIiYZqQWoG0iVKcI4a3iWJ/QuLxHKo5frF/hjcuRhNGFNq/T//
         2Ay/cnw8TWDKY4FDM37xawWCZM/oN0+4HWfbDQlXvqsdRy38r0U5awJblA/3MkB5cXxx
         Xd2K5SutaaZioD+IzY4cClj9MuUNqlHPgxa8OdB4B28xQwWE8b0ASTWqC+dvNVkUN7Hr
         WxutuM2fORlrWjqWHdJtEV9KCzl/dWm8/3ho6rYaXuFddFjImMk8RwKf1MB9yatZX8AN
         O5G79qsPRNPA/LCkjAe/sPkXmjiuNJj/2ZvAm4bBdTcZVqzgf40bzwFc9nEjAoQG6XU9
         Dfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957972; x=1748562772;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjMNjs+bdNtZTb3Wdy6sSLCs56ksmcfEkIHqJR2gBFc=;
        b=o4IQnlji8K67u7RR/VntyfDQryux+nb6aWzq2jziCfjBqgris9jtOW2ina9bOSu0WG
         DUfxaC3Ih90pgxfl7s8CLvNOW8ObvsRnEZR7/FZo3puTORuxZGvrIU6CyabulbaBewiu
         Wt4zd985PVycPnGh43oHNMYHYo4ZWe2RCfaQj09+6fCZ3mG7zmMESp/gGgyAP9mWvRUd
         MH5Lz/g0T/ZYXqezkaWzadKiUYVGfUngsyAVCIY7KgRTXfdnZ3BTTBk8nIXH0Cp855E/
         VjC93O6bpm2M2p4HrWF2pIMMRpgqeCSZsq68MjjbyqkuY0eY990zIvWEdAdmElVihMpx
         ZaYw==
X-Forwarded-Encrypted: i=1; AJvYcCVZNun8bnDO2X4KgXiAV7qaRu0q8bTcZgKBtlYbdtWi3fUKyr1xIhKjeCvoqZGEEn+VeB12a6/fBaJKWVANud7m@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcyxn6l6GGLO35d7+U7JXNYN3LWnQ02TC64gfBAphOFtH3vRKN
	+8mP7O9TiyHQRWOGVDdc4LI8R119mK1TaJvVMEU3ImV5V74RKmIT0CZetXto9FJHVdup4TXSCNT
	EAcNH0A==
X-Google-Smtp-Source: AGHT+IH+y/4Vqk1KMF3LjOCFUbppIPh5ZUErAvUoiEDW2SE/2hXGiqyTLKxlZ9Xh8ZuSjxO0WF45GST49oM=
X-Received: from pjbdy5.prod.google.com ([2002:a17:90b:6c5:b0:2fc:1356:bcc3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:510f:b0:2ff:58e1:2bb1
 with SMTP id 98e67ed59e1d1-310e973e510mr1311217a91.32.1747957972660; Thu, 22
 May 2025 16:52:52 -0700 (PDT)
Date: Thu, 22 May 2025 16:52:21 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-12-seanjc@google.com>
Subject: [PATCH v3 11/13] KVM: selftests: Assert that eventfd() succeeds in
 Xen shinfo test
From: Sean Christopherson <seanjc@google.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_165253_876181_FEF0B416 
X-CRM114-Status: GOOD (  11.73  )
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

Assert that eventfd() succeeds in the Xen shinfo test instead of skipping
the associated testcase.  While eventfd() is outside the scope of KVM, KVM
unconditionally selects EVENTFD, i.e. the syscall should always succeed.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/x86/xen_shinfo_test.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
index 287829f850f7..34d180cf4eed 100644
--- a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
@@ -548,14 +548,11 @@ int main(int argc, char *argv[])
 
 	if (do_eventfd_tests) {
 		irq_fd[0] = eventfd(0, 0);
+		TEST_ASSERT(irq_fd[0] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[0]));
+
 		irq_fd[1] = eventfd(0, 0);
+		TEST_ASSERT(irq_fd[1] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[1]));
 
-		/* Unexpected, but not a KVM failure */
-		if (irq_fd[0] == -1 || irq_fd[1] == -1)
-			do_evtchn_tests = do_eventfd_tests = false;
-	}
-
-	if (do_eventfd_tests) {
 		irq_routes.info.nr = 2;
 
 		irq_routes.entries[0].gsi = 32;
-- 
2.49.0.1151.ga128411c76-goog


