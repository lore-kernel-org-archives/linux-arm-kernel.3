Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C733DC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svZAfnlSTeaMolfrtcaOq/xEYvu0qCBcCbJ0k6qFXts=; b=jexMQdCf1t7ASEOJIp+uWQrxDs
	qrRiKx0ANlKY4MY9LJtHbPG4RXoeSbiVeKFS2kBc26gOjgjrCrc24WBZwBDqrjSP5P6E6JVj5y+gK
	8mqhA8ZTO+PFHC8lv8kDIluP0i6/gn1C/Pm4nfL16ow3sXbkB7LaLSjt9hZ1NZh4u6Dmk15RXaipY
	X9Z49Amk4SQhdRfUfWBkInmxhMtOoBjj1OSvakMB2zjr1vmpS3IqfY0OZY8yqwg92Lar80gyM6DdB
	KWpefgdjIav9UmsBZxxX48ndoCKCkDxSSTb2ruzSxGPDuOTCwPOCfl34hdzNtr5QQJxkzkpXtzueB
	U4bkAOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6am-0000000AIut-0HMB;
	Mon, 19 May 2025 19:56:08 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5eD-0000000ABU1-1PJJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 18:55:38 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-30ebf91d150so2731156a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680936; x=1748285736; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=svZAfnlSTeaMolfrtcaOq/xEYvu0qCBcCbJ0k6qFXts=;
        b=UTmbo7ZWjUjiGi61wZEBdqq4BYTB72+bob1rX4ekrAAb4kx7/O+GssWys1ylyeXM5r
         7lIJl5SL5tcq0RkiGXy9PGZrzI2EKt1ODAOl+YAtCFHLRjkeCwT+QaWf7X1/fYTSgnRS
         UBFEA53nq9HtTeNKBWGfCwbrKaGmyoy8NyoU4++aiOHYiR2NrcQT+bYyGcixcX10FMN6
         rqsUYPOUU/meAqQV8G/74hR0dtMEcMJ4/DGnmKEDQryr1iLczBoDJczSo+X2UgVP1W2H
         gPnIMmmIQ+LessB2WjeQfLl36Xez+sU7dkSeh91clOimoaLMYPDqvVVDaLDwyXpkIaaL
         d3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680936; x=1748285736;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svZAfnlSTeaMolfrtcaOq/xEYvu0qCBcCbJ0k6qFXts=;
        b=AH4jVQ7R9XN4PMH4wwCSLOlsJtKZ0H+Qmq+aikVGOd7jVo/u1N12QxCIkUZwZz2SNy
         Yry9ONV7d3ZPYbpqLXDag+12y0StFWiT4XXOdqeJiX7QLwnzpyxS4G/pn69cdb55cObv
         qAL2SPeTp1++07kazcg2q7hpgoKVZISLJH9H/wRB2JwKmVKUO93S8UlabQF9WXSpIXeY
         9e9efl//r/89tkxD7xOtIrPIeDnKcksv7aKRZwn3pugSU0z/D4jT3/ctZGXAlM4jmxf8
         cOSGVyPV23frxREETs10DbsvvMxHdgj8Q3R78k3T4PsyI1XZzAJg4QdtKOw8JHM6rQIQ
         Lv6w==
X-Forwarded-Encrypted: i=1; AJvYcCV8bBeAoHCw2IxXfRpS64NC5h9v02ZEYnoKPrjAc0uEpw10F9VCqrr3I2GSdsnoype5OlYMpD/VcsGEjn61ufub@lists.infradead.org
X-Gm-Message-State: AOJu0YzQAPFNjEZ3s5GbZ+/V7OlW5hUp7iKaFe4sIvhbVzgqHQys0zkO
	+k951Dh8opuL/v60QIOOC6cWYRJgLPVcaxig2vBED0iuVXlgQhWdGkO3jj+jsTjE21ZP5Ib4at3
	7VDWY/w==
X-Google-Smtp-Source: AGHT+IHFHSV2Ke7uVRMojNlgnegTrMTQP9GQqHVO1VwR0CTBk3daaqGT0xYoclFSkFU0/yQOifv0EZ0lYtM=
X-Received: from pjbsb5.prod.google.com ([2002:a17:90b:50c5:b0:301:2679:9d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d604:b0:2fe:ba82:ca5
 with SMTP id 98e67ed59e1d1-30e7d52221bmr23752952a91.11.1747680936483; Mon, 19
 May 2025 11:55:36 -0700 (PDT)
Date: Mon, 19 May 2025 11:55:12 -0700
In-Reply-To: <20250519185514.2678456-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-11-seanjc@google.com>
Subject: [PATCH v2 10/12] KVM: selftests: Assert that eventfd() succeeds in
 Xen shinfo test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	K Prateek Nayak <kprateek.nayak@amd.com>, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_115537_382002_427FEA9A 
X-CRM114-Status: GOOD (  12.24  )
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
2.49.0.1101.gccaa498523-goog


