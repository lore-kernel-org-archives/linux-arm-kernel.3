Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06161C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSDDoR+RslpHc3sFyno+iStW5FaTxNYMSfnwl+S1QGs=; b=acu4BN8G7J0Sl2OHHQNamnoc7W
	sZkHzx0aop4FvXnGY4SmCvGyWHCVOqQA+ENiIqn6T9mJUSxjD4f1kE+0v/m0zqnrvEOMdeoC3HAko
	j0bOoOM/yxsblm+H7Tjz4w0Gsl0OrpzXBpFfcxBA1at7vmagrf8RiBLk7eY0tRbi0Zip7r46A3esx
	w2lKz9aGPAA6X/bcDlGuKZwjDW1gBA7CXemnY4wovF1TFsAUOHKQ081BaNAOyRjyPjsttuNjP+LEe
	1iEvusS+6nbLz9QhDTGNeK8VUJEecIP3VckRRcE9NBxfizYLULOiWHDiffhH+f79QDO4vi9fC2cRB
	ujqiccTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPW2o-0000000BoHe-3kUb;
	Thu, 12 Jun 2025 00:43:50 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUE9-0000000BXC8-0e1I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:26 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b115383fcecso117756a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682044; x=1750286844; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zSDDoR+RslpHc3sFyno+iStW5FaTxNYMSfnwl+S1QGs=;
        b=c9PufKDOllvI5+IHqEV772QFo/gYMUs8EDLJKwAmDJfT2mTs38sFqBrx60wIexxd9l
         VKookK57D7dIj1UoL8keakslDUo1kTjwkPr9oclWX/mni4UGCXa0fzbZMs/MrKHstP39
         r+bYzIJdOqoXcyePa7DBARxRFukFDzHseoc+TkgUplySgThnMB5cFiNc76lE5FcBMso2
         eHwbRpUmHkVHBOPRJ6pI5jXQlX7mIccVgXsBjKHgCkC75MdqN/rNqnWx3zmZs2/OrVyL
         mbK3WKK75QkzogSrnCOpgtKitKd0To9tZEmBNuThJ5CaLp9h7MyF6HoyEwsHW5gwiJwH
         hWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682044; x=1750286844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSDDoR+RslpHc3sFyno+iStW5FaTxNYMSfnwl+S1QGs=;
        b=W7nGjoZoQSbTKNo9j9sACvh3YC3Xe5i2h3OITDY4xGJaxh53hK2zd9f4SjFYnYSwQU
         xccBEChcFR9uJza61mWJQchAIUGr4eGuKYqI1JrjKmk2fj0gpFuxJIMcdm6XavwYadBS
         3+XAQqzmuUc8sDMMdflZf/dpnKn/ZNvUh9bOW5DUxDYtNxagiDXpr7aspfWly/7xkjCU
         Y0JdEqC48Ee2YsgIe/BnhPOqGRX3VuWv73bUQW1KSP4aOncDr2qf3LuWi7SFaNjbNDly
         rT/JdlWP6OFX/yedKZt1tK4P82bFe4Ap04ur16hpYWWQ3C+MtviHjYF9c83Pw0Aa6qzm
         e/gg==
X-Gm-Message-State: AOJu0YyjrxFheJo+vVJyCo2EUEh3efsZFiZARirl0xWznWzGu/z7RQWC
	Wjah05wu8o0pMjDryIOYfsoly9+SH4sasubzEtxEeFtZ9HbpTGV0UD1g+0evZH3dVb7csty9u6j
	+0BViBQ==
X-Google-Smtp-Source: AGHT+IFW1CnJBjbF7Aa/vCphsUpZawH1JrjgBFuOplZJCnRAXG3kKQQQygDZU5VinjflvWeeW7y2BmvVPI0=
X-Received: from pjbsq7.prod.google.com ([2002:a17:90b:5307:b0:313:2d44:397b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2642:b0:313:2f45:2fc8
 with SMTP id 98e67ed59e1d1-313af1b2399mr7734150a91.18.1749682043833; Wed, 11
 Jun 2025 15:47:23 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:19 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-18-seanjc@google.com>
Subject: [PATCH v3 16/62] KVM: VMX: Move enable_ipiv knob to common x86
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154725_189150_74252B36 
X-CRM114-Status: GOOD (  13.27  )
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

Move enable_ipiv to common x86 so that it can be reused by SVM to control
IPI virtualization when AVIC is enabled.  SVM doesn't actually provide a
way to truly disable IPI virtualization, but KVM can get close enough by
skipping the necessary table programming.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 1 +
 arch/x86/kvm/vmx/capabilities.h | 1 -
 arch/x86/kvm/vmx/vmx.c          | 2 --
 arch/x86/kvm/x86.c              | 3 +++
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index a9b709db7c59..cba82d7a701d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1950,6 +1950,7 @@ struct kvm_arch_async_pf {
 extern u32 __read_mostly kvm_nr_uret_msrs;
 extern bool __read_mostly allow_smaller_maxphyaddr;
 extern bool __read_mostly enable_apicv;
+extern bool __read_mostly enable_ipiv;
 extern bool __read_mostly enable_device_posted_irqs;
 extern struct kvm_x86_ops kvm_x86_ops;
 
diff --git a/arch/x86/kvm/vmx/capabilities.h b/arch/x86/kvm/vmx/capabilities.h
index cb6588238f46..5316c27f6099 100644
--- a/arch/x86/kvm/vmx/capabilities.h
+++ b/arch/x86/kvm/vmx/capabilities.h
@@ -15,7 +15,6 @@ extern bool __read_mostly enable_ept;
 extern bool __read_mostly enable_unrestricted_guest;
 extern bool __read_mostly enable_ept_ad_bits;
 extern bool __read_mostly enable_pml;
-extern bool __read_mostly enable_ipiv;
 extern int __read_mostly pt_mode;
 
 #define PT_MODE_SYSTEM		0
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 9ff00ae9f05a..f79604bc0127 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -112,8 +112,6 @@ static bool __read_mostly fasteoi = 1;
 module_param(fasteoi, bool, 0444);
 
 module_param(enable_apicv, bool, 0444);
-
-bool __read_mostly enable_ipiv = true;
 module_param(enable_ipiv, bool, 0444);
 
 module_param(enable_device_posted_irqs, bool, 0444);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 93711a5ef272..f1b0dbce9a8b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -226,6 +226,9 @@ EXPORT_SYMBOL_GPL(allow_smaller_maxphyaddr);
 bool __read_mostly enable_apicv = true;
 EXPORT_SYMBOL_GPL(enable_apicv);
 
+bool __read_mostly enable_ipiv = true;
+EXPORT_SYMBOL_GPL(enable_ipiv);
+
 bool __read_mostly enable_device_posted_irqs = true;
 EXPORT_SYMBOL_GPL(enable_device_posted_irqs);
 
-- 
2.50.0.rc1.591.g9c95f17f64-goog


