Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55B9C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvXrACbOQaGlhym8epnVf2FRavXrOILN2RCY7mrPgRw=; b=nGFebcuA9LDUtdaHkaTj7/4IvL
	cAVH04XSZ6sP1oeKR8ekdELzVKF52445FKjfdHrb0G7VA8AFMk48hFTYFgJT2IAHZZWhD4YYACHJ0
	VfN8Z3/9TPLUjCwvFHELeVZC97uYE2eR1QPTYskpbku3+pXdnJG1JHkpo6VeXzQa15Jfg1z6ZDkJv
	7KTzbbhXRes4MVcDWyz+0AcPDjdJtugDBH45F3WoW2gJsT53EMuCxVn8nPfCrhmjD/rpOMEdr0m/j
	eM3J+Nr+3hSnsXTBfFClgBTKnANyUit/HNkCIef5yEA/ULgH0yjprk7LDrcqT19RL0c7YdCCJ1xYH
	Sq8+ZsBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z4u-0000000Echt-0t8P;
	Thu, 24 Apr 2025 16:05:32 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xKn-0000000EKcG-3H3M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:13:50 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1551212f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504028; x=1746108828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvXrACbOQaGlhym8epnVf2FRavXrOILN2RCY7mrPgRw=;
        b=xrL2PQXaR1DOppN0igldeZz6Xp1TGKQAjVA+Toii7SHex0NOV+aLsZQ4gHIbrSfnt1
         pFUMa14zitKcswmE+bWTX+ByAn6itW6TOnap6FpkIERvec+Aj1S80/6fwXqUYCtP8Xta
         kmQq4SsUCrX9T5hf08ceQfZXVZRr/TPY9Z1en+xOUgkJ5af4cC/A972Iu95nAZ/BhQzg
         MI4eomhhMhWyLST+uWor0oTnQWMIm7k+a/Uy2BS8cygE6Cl0Ogf3sLyzSjERgmRcnGq9
         9EplN03wlVRW9yRXOaY/SzMHUTFaBvpU4SRvy+n/Edlz/pt/SKPBgMjzCzAQ6sk6P98c
         UbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504028; x=1746108828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvXrACbOQaGlhym8epnVf2FRavXrOILN2RCY7mrPgRw=;
        b=Kukp3siZm/lhdoMJCmhUwDX0TczGByT//+wQXU4z3NB3qpduoP9JZzmWGzOQVsCjnw
         xw2Ef9bFcPiURob+gv7SOPN7jVnEW6A6SNJ+CeGps2t3CXo9/gr6cfqg/z2BSgGBV1qB
         NC0HXfoR7LXfqsNSp1CDv0jMT2+BtQR8Cv1KR1NVNVFbLGpPWeLaZQsAUIJS3Uh81U1w
         QRTdAmSuPHPX4QmD5Qo40Nz7fXll0QQCFqFqg4Gcbh4RdLiyvb/MxEgNv+5E0vWc8Cne
         LhhPCdM+1CNxonKkdSj3efQTEBcWneFpJI4+Ho1H4QYpJVEi4zLvpAv1kK6DbR0GXQFP
         KOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL2o/Ei8uCmXkNSq3YjC9En+GPepIgVwV8EVvk+g7JLLO8dXUcwblP/anQqyHXTUYaop+kBeJPip68HSzUOSUT@lists.infradead.org
X-Gm-Message-State: AOJu0YzRNPPajTaKV4zGClVR/bqX1yh5GeG7YWsWIbDHVdxCIWNhmY3f
	zduzBScl2BcL4WFoPt+SFkW+/Faod5VvaIieCBAOXKbuoYE94+Jn08lIkVbttdM=
X-Gm-Gg: ASbGnctuA/IWvtR9MqFPCYHGnepParZ4kIkSxIlDM2hvC8WcqRNL+EZ4dsuu9bpZUJz
	3uY4HfiR/zDvs0ZL8TtXfUtsStIQkTmQLznIU5KNkQBJ9aMM5LINkZqC9KLE2s+JbS9MpdTleMj
	ODqLQ3ItVxdS8fwibXdNFK7n981xnvIpJRLw0FMhXJRexRodvIYG/ggJks+gm3k4PQ+/mO4hEon
	ou+IAXqjDS6f+K4TqnC9JjNRE//i1UGN8aQDYGj1L9xML78/pEzc5HYvnsFkMFv0GOV0RMMAK48
	AezJ6caY5lvSUbs/D8oMTfe6TF+VKtP/74PzHBQdPwcK2HY/le/EmU95zW6atglc1Cw2dovUwl0
	8ntt40BhNiz9FaqqE9eBvnfDzll8=
X-Google-Smtp-Source: AGHT+IEBkZ1IBJCII/ywyTdMC0fLKprAp65skAqA7s+zC8i8AN1EGINZeECW9VcRyNwMhKCFTJTxcg==
X-Received: by 2002:adf:fb4c:0:b0:391:1218:d5f4 with SMTP id ffacd0b85a97d-3a06d698d62mr2225510f8f.23.1745504027803;
        Thu, 24 Apr 2025 07:13:47 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:47 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [RFC PATCH 02/34] KVM: irqfd: Add architecture hooks for irqfd allocation and initialization
Date: Thu, 24 Apr 2025 15:13:09 +0100
Message-Id: <20250424141341.841734-3-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071349_821109_2147F3DD 
X-CRM114-Status: GOOD (  15.53  )
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

Some KVM backends, such as Gunyah, require irqfd structures to carry
platform-specific state or setup logic. To support these use cases,
introduce three weakly-defined functions:

  - kvm_arch_irqfd_alloc()
  - kvm_arch_irqfd_free()
  - kvm_arch_irqfd_init()

These allow KVM backends to override irqfd allocation, teardown,
and initialization logic. The default implementations simply
allocate/finalize a standard `struct kvm_kernel_irqfd`, maintaining
existing behaviour.

This change is required by the Gunyah backend, which uses these hooks
to associate irqfd objects with Gunyah-specific bell resource handles
for IRQ injection via hypercalls.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 include/linux/kvm_irqfd.h |  4 ++++
 virt/kvm/eventfd.c        | 31 ++++++++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
index 8ad43692e3bb..e8d21d443c58 100644
--- a/include/linux/kvm_irqfd.h
+++ b/include/linux/kvm_irqfd.h
@@ -61,4 +61,8 @@ struct kvm_kernel_irqfd {
 	struct irq_bypass_producer *producer;
 };
 
+struct kvm_kernel_irqfd *kvm_arch_irqfd_alloc(void);
+void kvm_arch_irqfd_free(struct kvm_kernel_irqfd *irqfd);
+int kvm_arch_irqfd_init(struct kvm_kernel_irqfd *irqfd);
+
 #endif /* __LINUX_KVM_IRQFD_H */
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 11e5d1e3f12e..5f3776a1b960 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -32,6 +32,24 @@
 
 static struct workqueue_struct *irqfd_cleanup_wq;
 
+struct kvm_kernel_irqfd __attribute__((weak))
+*kvm_arch_irqfd_alloc(void)
+{
+	return kzalloc(sizeof(struct kvm_kernel_irqfd), GFP_KERNEL_ACCOUNT);
+}
+
+void __attribute__((weak))
+kvm_arch_irqfd_free(struct kvm_kernel_irqfd *irqfd)
+{
+	kfree(irqfd);
+}
+
+int __attribute__((weak))
+kvm_arch_irqfd_init(struct kvm_kernel_irqfd *irqfd)
+{
+	return 0;
+}
+
 bool __attribute__((weak))
 kvm_arch_irqfd_allowed(struct kvm *kvm, struct kvm_irqfd *args)
 {
@@ -153,7 +171,7 @@ irqfd_shutdown(struct work_struct *work)
 	irq_bypass_unregister_consumer(&irqfd->consumer);
 #endif
 	eventfd_ctx_put(irqfd->eventfd);
-	kfree(irqfd);
+	kvm_arch_irqfd_free(irqfd);
 }
 
 
@@ -315,7 +333,7 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	if (!kvm_arch_irqfd_allowed(kvm, args))
 		return -EINVAL;
 
-	irqfd = kzalloc(sizeof(*irqfd), GFP_KERNEL_ACCOUNT);
+	irqfd = kvm_arch_irqfd_alloc();
 	if (!irqfd)
 		return -ENOMEM;
 
@@ -396,6 +414,13 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
 	init_poll_funcptr(&irqfd->pt, irqfd_ptable_queue_proc);
 
+	/*
+	 * Give a chance to archiectures to finish initilization.
+	 * E.g. Gunyah needs to register a resource ticket for this irq.
+	 */
+	if (kvm_arch_irqfd_init(irqfd))
+		goto fail;
+
 	spin_lock_irq(&kvm->irqfds.lock);
 
 	ret = 0;
@@ -452,7 +477,7 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 		eventfd_ctx_put(eventfd);
 
 out:
-	kfree(irqfd);
+	kvm_arch_irqfd_free(irqfd);
 	return ret;
 }
 
-- 
2.39.5


