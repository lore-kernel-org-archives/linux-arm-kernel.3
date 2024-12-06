Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA039E77170
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 01:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E69J+2d2iF7wp/ivOT/6vtBgFfFDMf+WrmT04fDpQV8=; b=AMsUUCuoSXboNtNdlPWKWDDktm
	W7RET2/0O3tlbURvih7qCgMaYwfwEmVU0cJ5LLDmKgSWZOjt9YW2P5ARA+Z5JqsaKyL/CArdmmT0q
	37ptozkWK2BzVAlMx8Sm+GkYOZ0SDDzMrsnKmU8HAv+AUS1Jd6lW7rNOL0FTkDm8JWHvoj4Sbsn9S
	GRunIlx5Eq0D2CVWmrByityV8uFGV9Eo43v7pw+0ciGFEksbYKDGZPkdLbzwA123OGrDJidPiR40L
	/nDXkf7K743aBuMIumWeYXiXlXaFGVze2x4ZV2XWPEDNuOlg5nARR/um7EjWHrC2S/AeVwIFxIxId
	9lU60Uhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJMoc-00000000AOb-3eR4;
	Fri, 06 Dec 2024 01:07:30 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJMkD-000000009eu-2h3k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 01:02:58 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ee5668e09bso1746362a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 17:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733446976; x=1734051776; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E69J+2d2iF7wp/ivOT/6vtBgFfFDMf+WrmT04fDpQV8=;
        b=aBvc4cY7DqgROTYhAnpyhcqAdTQivN+0+i8f7EHrnSM2J/c8xpbMfB6VkOGgV5HNp7
         LxM97g5BJ1nXnvXjKrBkK3wyKJSkCa3asJObbE5TAblCwu6Edeci3rRgZD/mo3LA8EIa
         Y7diPfPGIA0/KmqmpdWbXgu/PYM2NbrlUIgn1Dysmp7I0KF12JL1+KRzWu3r1hhj6WAL
         x2RqPJxRlAxBhO2gLdBQbWcet06a7XAyxhgVOYWFpcldJcLz8y+J88hgZlz82EgUwAuz
         hMnZKjWC5zOExQMiqsJIowMg1Vq0/B3MSlgbh9bbknQqj9OchQyDCx0waI1i2dfvmyOv
         PAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733446976; x=1734051776;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E69J+2d2iF7wp/ivOT/6vtBgFfFDMf+WrmT04fDpQV8=;
        b=VW1tq0xk3c06h0d9cWhbZ2EKmv5ilCQt63haefCfjwa3JOoA3Et+Z/vxNdF00MbKF8
         3uopcmzCBkrU1MIu4uwentCLwb4EFSp7jA+41r7+nlsyqkyQIWTJDR/yhsqbR5ggYLG2
         s/j7AAHQ01S73UUhU6uD5CuJkEHrDnPZbfXAnywJrtXWKYFX3iGjM6IFarZ5PxXLMyoX
         2/1fQwCqYvCTnOjGobo8YDC4iLVL+A6ZxqA1xtoxah8kukVlgf2BVwAPOa/FEtbPMCmm
         qXPWLMHvdNTD1ZI6Ge+hDVaLvRGyGKKnmkHpvZj2XLcDkAqUrR1GoA4lldBYZZ1JW+3S
         kGEg==
X-Forwarded-Encrypted: i=1; AJvYcCXHoLrr/kHW7/9f07BBvuR5oLHA3a2bztP7FEo9eVI/R8HBQ4ls3YrpJhTSCcAzHFI7TYpvkovcyc0INZi1rr0V@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj1fTpXPOj89OJVG/a6oa/iGN0YE4MOcCMPPWOOdnBYeLhUetk
	dDdCl36d8R2P82vKOubqbSc7M8xLQ2FpUFYaukfMp6D6ooLWXTDWbj7D9y9ZDsgMx11/I0SHKCc
	x+CkEvF354g==
X-Google-Smtp-Source: AGHT+IF8Xr3ZU+SUR6OpvZcjlpe9CogaDlgckw7I+MWP1P15dWO/yWLOygkWrh/pIlrxSKbsRGZqKXsI9AbbGA==
X-Received: from pjl16.prod.google.com ([2002:a17:90b:2f90:b0:2ea:9d23:79a0])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:33c4:b0:2ee:8430:b834 with SMTP id 98e67ed59e1d1-2ef6945f076mr2087792a91.4.1733446976124;
 Thu, 05 Dec 2024 17:02:56 -0800 (PST)
Date: Fri,  6 Dec 2024 01:02:46 +0000
In-Reply-To: <20241206010246.40282-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20241206010246.40282-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241206010246.40282-3-jiaqiyan@google.com>
Subject: [RFC PATCH v2 3/3] Documentation: kvm: new UAPI when arm64 guest
 consumes UER
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_170257_677859_FCB946C3 
X-CRM114-Status: GOOD (  17.53  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the documentation for new UAPI when guest consumes uncorrectable
but recoverable memory error (UER). This new UAPI enables userspace
to inject SEA into the guest.

Tested:
make htmldocs and proofreading

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 Documentation/virt/kvm/api.rst | 46 ++++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 454c2aaa155e5..67645bdb66fe5 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -1288,16 +1288,48 @@ ARM64:
 
 User space may need to inject several types of events to the guest.
 
+Inject SError
+~~~~~~~~~~~~~
+
 Set the pending SError exception state for this VCPU. It is not possible to
 'cancel' an Serror that has been made pending.
 
-If the guest performed an access to I/O memory which could not be handled by
-userspace, for example because of missing instruction syndrome decode
-information or because there is no device mapped at the accessed IPA, then
-userspace can ask the kernel to inject an external abort using the address
-from the exiting fault on the VCPU. It is a programming error to set
-ext_dabt_pending after an exit which was not either KVM_EXIT_MMIO or
-KVM_EXIT_ARM_NISV. This feature is only available if the system supports
+Inject SEA
+~~~~~~~~~~
+
+- If the guest performed an access to I/O memory which could not be handled by
+  userspace, for example because of missing instruction syndrome decode
+  information or because there is no device mapped at the accessed IPA, then
+  userspace can ask the kernel to inject an external abort using the address
+  from the exiting fault on the VCPU.
+
+- If the guest consumed an uncorrectable memory error, and RAS extension in
+  Trusted Firmware choosed to notify PE with SEA, KVM and core kernel may have
+  to handle the memory poison consumption when host APEI was unable to claim
+  the SEA. For the following type of faults, KVM sends SIGBUS to current thread
+  (i.e. VMM in EL0) with si_code=BUS_OBJERR:
+
+  - Synchronous External abort, not on translation table walk or hardware
+    update of translation table.
+
+  - Synchronous External abort on translation table walk or hardware update of
+    translation table, level 1.
+
+  - Synchronous parity or ECC error on memory access, not on translation table
+    walk.
+
+  - Synchronous parity or ECC error on memory access on translation table walk
+    or hardware update of translation table, level 1.
+
+  If the memory error's physical address is available, si_addr will be the
+  error's host virtual address in VM's memory space; otherwise si_addr is zero.
+  When userspace VMM is interrupted by such SIGBUS, it can ask KVM to replay
+  an external abort into guest.
+
+It is a programming error to set ext_dabt_pending after an exit which was not
+KVM_EXIT_MMIO, not KVM_EXIT_ARM_NISV, and not interrupted by BUS_OBJERR SIGBUS.
+
+This feature is only available if the system supports
 KVM_CAP_ARM_INJECT_EXT_DABT. This is a helper which provides commonality in
 how userspace reports accesses for the above cases to guests, across different
 userspace implementations. Nevertheless, userspace can still emulate all Arm
-- 
2.47.0.338.g60cca15819-goog


