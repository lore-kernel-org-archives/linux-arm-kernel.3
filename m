Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD179C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZY+qAPOicOUq8p2LK8IeikgixBi4lx8HxmpqAWAHnA=; b=pXl7K5blIApjodFlkWuOT3Klr4
	iwFGUkusfaK3AfL6xX3dBHQu//Ss4S3MnOXIvxAyGrpKMqFzPWd17i0U22ij3dDBIYCqt8eNOqo7A
	Ik6Y+gthB2g14aZU0ZG63sKaClgASs4q33wauLQnrcexGRzzFYBfBmQGRrj8L6zzH5YAOmwHbw6zs
	ruYgxRoSaKAPP8GjLiurNtLx0P11tniZ7uuA8FEOUUo3lNuoEY/qPNFG3zMZd74ft5wOApkGXFMoo
	CGNbw7w2Q00wKDnD4QCy5eBqD/5lKUIjHDpIxM3W0qmUJNH+tvNifoVEOapSPGCV1kOSOhOaci8d6
	0DYt5rkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlG7D-00000003Lzz-0m9a;
	Thu, 20 Feb 2025 23:37:59 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFzd-00000003KEy-11Eo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 23:30:10 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f83e54432dso4989128a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 15:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740094208; x=1740699008; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tZY+qAPOicOUq8p2LK8IeikgixBi4lx8HxmpqAWAHnA=;
        b=yWbQzmpesgbb6Gnwt34k898Um36hELbFn33muZfTpQTvgeBscHfAdlzAVmLOmKbjYN
         C4qisOUiwL2Fd+YXlbIpqwCqPeHjSIKqdrYdTCqpED4HtGhtAXgvDzhyyqh8GdoqBkqa
         fXZT2OZlUOXbk9bsCrst+g/8yj8iCCAkvHOTyt0BfUfXdQuT1OYCJgNclV9T3YIVATdq
         d25aX6yHDWCfOM3oyICKmpjYgnEmFrsUPwcgRyK4tU9PViNTK4U4ndl/ENzMGJOmDKRh
         5IxEz9uN7jwUrdmtjLYSP+YtONLfv4B4JrVIjUsRc5oblF7becG8IQjyG3H2I65WO3iQ
         IC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740094208; x=1740699008;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZY+qAPOicOUq8p2LK8IeikgixBi4lx8HxmpqAWAHnA=;
        b=hGx9lekPqzIt9LsoXJBgd4ZmFJ5fJoyX149KaC/Yd+vPWQsKBWLdUg86C91uf1zR+i
         qXC1w2YJP/mewb2Xnp1HDx2jABorcPzMRHffHw2ppviAuc6MSdKVRiVFtDglgT+bsEc+
         8dMLy7Wn3/10eMGmA+4ZMrK8ESH5Ulmo5WN7Zb1zP1mC8GlKwPgEilWB3k2fMYK1CeIP
         3wRzOlBHz5LkJBUgBYJ2kc2S9dDZcjr0wMSjP5VVUAcy094MWaEmKwHghxWUFXzVddYW
         vFcEvoFF/bP/74bNqlsbeLZ5cNykXUgkSgTTD0TbSZs8Dx5J7W+IkDh/wfAkiiTggfdd
         Ua0g==
X-Forwarded-Encrypted: i=1; AJvYcCXAgHErxo9rixs5L7thhuDQ5ERP11Vjm0XIru2o9SiAS3CaQ8swPvTb0+hIMfZpwdFto4xDfqOy5CjG+zENHtbU@lists.infradead.org
X-Gm-Message-State: AOJu0YxiBXvmqKuKhsuhtKwcwCLhFAtIywp+anPKC+P1Fv2ZnJ3M/mvI
	c/bza4rPxAWg/dNLibHVXTb+jHminIeXAvpAptppOQQThqYve/lFvcXZ+9BXA3EkKnG2BfqEd6A
	19wK0wc/okA==
X-Google-Smtp-Source: AGHT+IEBaG/uVrgEVEadJS5uoF6GF3zEvxqFSthLZ+KCQQjV/E6qlAa7wWQxBxQYuGn6ZWD8KVd4x5+IgTERjw==
X-Received: from pjbpt3.prod.google.com ([2002:a17:90b:3d03:b0:2fc:13d6:b4cb])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2e4f:b0:2fc:b40:339a with SMTP id 98e67ed59e1d1-2fce78a95d5mr1872440a91.10.1740094207918;
 Thu, 20 Feb 2025 15:30:07 -0800 (PST)
Date: Thu, 20 Feb 2025 23:29:59 +0000
In-Reply-To: <20250220232959.247600-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250220232959.247600-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250220232959.247600-3-jiaqiyan@google.com>
Subject: [RFC PATCH v3 3/3] Documentation: kvm: new UAPI when arm64 guest
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
X-CRM114-CacheID: sfid-20250220_153009_283116_1574CF3A 
X-CRM114-Status: GOOD (  16.95  )
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

Tested: make htmldocs and proofreading

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 Documentation/virt/kvm/api.rst | 38 +++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 2b52eb77e29cb..20c7049508484 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -1288,16 +1288,40 @@ ARM64:
 
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
+  - Synchronous external abort
+
+  - Synchronous parity or ECC error on memory access
+
+  If the memory error's physical address is available, si_addr will be the
+  error's host virtual address in VM's memory space; otherwise si_addr is zero.
+  When userspace vCPU thread is interrupted by such SIGBUS, it can ask KVM to
+  replay an external abort into guest.
+
+It is a programming error to set ext_dabt_pending after an exit which was not
+KVM_EXIT_MMIO, not KVM_EXIT_ARM_NISV, and not interrupted by BUS_OBJERR SIGBUS.
+
+This feature is only available if the system supports
 KVM_CAP_ARM_INJECT_EXT_DABT. This is a helper which provides commonality in
 how userspace reports accesses for the above cases to guests, across different
 userspace implementations. Nevertheless, userspace can still emulate all Arm
-- 
2.48.1.658.g4767266eb4-goog


