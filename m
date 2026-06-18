Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA0CCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSbfsSuF8XQoOBhzJ79rNhpPjL/Yakp0GnQrnvhxx5s=; b=JDtEpwToPr4eM1frDld+lHlpeN
	vBwxAjQiuWzOSuEH0tJzVloZi8Z6TrfykmzD/csdgvKwfCIhfh/0ywBRd1pfaGkLLa/7H1XG85bW/
	AXqoxZ4JYQFB3fCxY9a1EycztY46IX8Ux16LNvV/vHHCVnswWgf959uLsYBySwjA8EY8sV/pEUrHv
	pIo+g90VAuDQVPYLQPtufY6tywfkXKARHQ7PdSw9Fka3MwXXoig4cFDytihvGL75jwFdhuAx7xYgz
	3mANxxZUS6SlEX7n89hqI3Ujl65AQFtMeLD1lEqoF4RibXh8Z7oiPOmHzUJn8N4dCxzFBQ/ozQUUE
	+U4zQ8Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8d1-00000000tE4-0l8a;
	Thu, 18 Jun 2026 09:01:39 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8cy-00000000tC3-1pVD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:01:37 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490e547f3cfso5997505e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 02:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781773294; x=1782378094; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vSbfsSuF8XQoOBhzJ79rNhpPjL/Yakp0GnQrnvhxx5s=;
        b=e4b77n8a8i36DFZD1JD8IfiVDeL+6gqpWbp8+LA089md3brY5yttE1y+ytMLXgb7ud
         c33JAHvUULBYagsFner+z8xBI1XZ82YV27uffzX04nBwNjHVXnHQ85vOcugcjlIFur3S
         ZgvIZbh95wN+DTMyUpAe6Q1KE80aLhHAV0HJSU4tCXoFo9WMaz6eI39S0x5K3gscZJTO
         wKUeT6NbikIW8kyHnWQtRb4jEu2BpaVGZJ4Y5XpckK5+giugYvF1Mdb2EGowaYObwnmU
         YmqqsuOG1CXgYf8cUBqhYL7Zxw21v8WwmBPWlDtmCX5wldJo/oasf1BoNzmdD1l8WDkO
         6BEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773294; x=1782378094;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vSbfsSuF8XQoOBhzJ79rNhpPjL/Yakp0GnQrnvhxx5s=;
        b=e7JVmR7J2pqoQY4/649B0eH1d7+7b8USch/dZVR2KvmTWIchVItiyPJxBAMjkh/J8G
         4nQZOxKB9APYo/GGpRd9+k6AgsXvClE+2Ld7eMUgpytHLYBOhfD9SxIVILQq8qYhIo6V
         PP59UADdhWAkoCxv40occV6Cph1+cHFr8PM9v407GHjb/+6YaIG65RaVqqXgjnpc19wb
         GggCGNzqOdJAQUSJ8L22RiAcPi2UUjofIFRTKwm9f5mqQsCh1DFNXE/GK6MEWi31F4RD
         loi4TTnvZDuBd+fnroM4/S4T+EXZ9Lm7GIFfSRdmu+1amIKUh1lrdCa+wfHJkTBWOk0n
         ob6w==
X-Forwarded-Encrypted: i=1; AFNElJ9cxS3EI/XrN7jPKAmb3ZjwBtGvYFfQHESSE21Qr37lyGPX5u8xtHglWmSPGKNMIm9pp7kzaoHb4VRSF2Tb+HYr@lists.infradead.org
X-Gm-Message-State: AOJu0YxxVQaf4vecJ4GRYheU2ldqhQ+PIhvf4YYpzmnIvhnjoGNvpo7H
	Q2gkXVeDQcYDYcFlYC6jztA/bkeiMmu3/bQiCdQessI/a41U2enT7TVUXi94gv1dBi/Re6uT7bZ
	Hvw==
X-Received: from wmim8.prod.google.com ([2002:a7b:cb88:0:b0:492:2b56:8534])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:6447:10b0:490:c2a3:23cf
 with SMTP id 5b1f17b1804b1-492333dfdbcmr103923175e9.34.1781773294140; Thu, 18
 Jun 2026 02:01:34 -0700 (PDT)
Date: Thu, 18 Jun 2026 10:01:28 +0100
In-Reply-To: <20260618090128.3913688-1-tabba@google.com>
Mime-Version: 1.0
References: <20260618090128.3913688-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
Message-ID: <20260618090128.3913688-4-tabba@google.com>
Subject: [PATCH 3/3] KVM: arm64: Drop redundant READ_ONCE() in pkvm_hyp_vm_is_created()
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Keir Fraser <keirf@google.com>, 
	Hyunwoo Kim <imv4bel@gmail.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_020136_557946_48239D78 
X-CRM114-Status: GOOD (  11.77  )
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

is_created is written under config_lock. Every concurrent reader is
serialised against that write: pkvm_create_hyp_vm() under config_lock,
and the memslot path (kvm_arch_prepare_memory_region) via slots_lock,
which the creation writer also holds. The teardown-path accesses have no
concurrent writer. The read is therefore serialised, and the READ_ONCE()
is unnecessary.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/pkvm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 67b90a58fbea..008766273912 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -185,7 +185,11 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
 
 bool pkvm_hyp_vm_is_created(struct kvm *kvm)
 {
-	return READ_ONCE(kvm->arch.pkvm.is_created);
+	/*
+	 * Serialised by config_lock/slots_lock, or by VM lifecycle at
+	 * teardown, so a plain read suffices.
+	 */
+	return kvm->arch.pkvm.is_created;
 }
 
 int pkvm_create_hyp_vm(struct kvm *kvm)
-- 
2.54.0.1189.g8c84645362-goog


