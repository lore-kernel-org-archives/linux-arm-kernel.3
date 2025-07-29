Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D8FC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFnHmY/mnoB77L81qdmfXRRJ+itvZAH1/9yVsOU0ZkM=; b=OlkZd/8TVqHLUkI8n6Zj74YtoK
	q1eE/dT3IRmgH/ODpKTWVya00YcYq9mDgCbPW2egPX9G837k4wILz9m7UKpu1U+izSqV0llJ6GaHE
	aeEREYpjZBNJTFpYm/LZSJshllcJb9nYbCmyhgFU7/zK22bRu5f3kunii8suohqsI56W273bNVhNq
	Mn30OPAn6+zJ4rIup71cLZX1u5Lt4EsgRJY2r/EMhVhUzIQaBDHEzf5Ha9o1iBx15gD5uhyvHTuup
	wrbodWA1sZc6YZ7SA1NIwh7NXgnr+YKs7NJmAp9dD7Vli4jrvdW8IxsuEJLRfLoQWypt62u3MzZr/
	5bMRQMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtSJ-00000000GLL-2u1n;
	Tue, 29 Jul 2025 23:09:59 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEP-00000000Dkd-3mkm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:55:39 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31edd69d754so2818439a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829736; x=1754434536; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gFnHmY/mnoB77L81qdmfXRRJ+itvZAH1/9yVsOU0ZkM=;
        b=JhXijTUt6ETpigrMQXKMXbZz1vTLqfh5k/j8CIfJv2N0rD81O7g6BxkmXIlcDOiQvS
         ZsUp4HdnrtgzrU+YJkNuuSGmvj59URCMtJVoGzWsRMKT8FEsIeWykCfhMwRAES3PShOO
         47TON2bb+0Ne37ZZLNukjizqpVFrQUp5BvUvGo24oLg+swBLEmjKP0/wj5iXOV/k5gi6
         IUXkNz5sF5sOuQ7r1NlD3ZWspCcS9bw0lFG8oUx92nAPj5wl6i0mnx6ra0ce7Kc7I6Q1
         tIW77KOBGStzKQSfQ9nBJHf482BkHU8VoDxay9AhSa1Yc1emqUVNzkZWMo1vDbhmYD3z
         /Mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829736; x=1754434536;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFnHmY/mnoB77L81qdmfXRRJ+itvZAH1/9yVsOU0ZkM=;
        b=M8ijoxqUTqa6GAWurEdgHu33tLgiRf9NuSnZgIidgS6H8D7oQFSp0KNXqmaf4+U6Fq
         +TZ85r/1LAMdj4uHAw8sZoOqLKWQ3N7WKzbuV02QG9tSCo79oHTttIWC/owaZ74FMCFf
         QYgESkKHuOW7MRVINSQ5ITtL096Kk578F02kAp7hOu+uyoLD7kY7wI5p1rCnOuI1RwzW
         P5JgUB2pPp0OdHPAbPpOZMJt4aN+FM5XAqh1JcN5tkfLL7Y3Y7k5R2KajdtjNV1XNSG0
         yFqCfY4UnS9B4jEaH8loWFbDQ10O+8YbTn9gXWNu4GVtiSG+ZO9wgWz2dhkr3XTEQ3kf
         J73A==
X-Forwarded-Encrypted: i=1; AJvYcCUmQS9hnkdSoki7IqbI4lFunTzCwOF6MoI2hlmegDG7+l5k7TZiVr1ABqTIKvNdhgHTVmhms5Zg/ZjUV3K1Jk0N@lists.infradead.org
X-Gm-Message-State: AOJu0YzC5tw6KY+Lems1MWmTyAKqYTJ1/zVt+XGc46NYjjjSks4ebFTV
	cVNTmksYZjND2QKLhrq3Gb88FAEDPlMXWhkAC3248Bsug1Av91kZFDUXJZiBl5X+FDrM/xzEmsH
	jL2w76A==
X-Google-Smtp-Source: AGHT+IGW1K6V884yFJ/UsdufteHNa+YJReUfJU48NT0v+IzXl6w7knzHbQRXIxUuwcw5V5T6c1ZnGgjicS4=
X-Received: from pjbmf3.prod.google.com ([2002:a17:90b:1843:b0:31f:2efe:cece])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2885:b0:312:639:a058
 with SMTP id 98e67ed59e1d1-31f5de49d4dmr1634316a91.27.1753829736661; Tue, 29
 Jul 2025 15:55:36 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:35 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-5-seanjc@google.com>
Subject: [PATCH v17 04/24] KVM: x86: Select TDX's KVM_GENERIC_xxx dependencies
 iff CONFIG_KVM_INTEL_TDX=y
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155537_938752_FB5527FA 
X-CRM114-Status: GOOD (  12.04  )
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

Select KVM_GENERIC_PRIVATE_MEM and KVM_GENERIC_MEMORY_ATTRIBUTES directly
from KVM_INTEL_TDX, i.e. if and only if TDX support is fully enabled in
KVM.  There is no need to enable KVM's private memory support just because
the core kernel's INTEL_TDX_HOST is enabled.

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 402ba00fdf45..13ab7265b505 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -95,8 +95,6 @@ config KVM_SW_PROTECTED_VM
 config KVM_INTEL
 	tristate "KVM for Intel (and compatible) processors support"
 	depends on KVM && IA32_FEAT_CTL
-	select KVM_GENERIC_PRIVATE_MEM if INTEL_TDX_HOST
-	select KVM_GENERIC_MEMORY_ATTRIBUTES if INTEL_TDX_HOST
 	help
 	  Provides support for KVM on processors equipped with Intel's VT
 	  extensions, a.k.a. Virtual Machine Extensions (VMX).
@@ -135,6 +133,8 @@ config KVM_INTEL_TDX
 	bool "Intel Trust Domain Extensions (TDX) support"
 	default y
 	depends on INTEL_TDX_HOST
+	select KVM_GENERIC_PRIVATE_MEM
+	select KVM_GENERIC_MEMORY_ATTRIBUTES
 	help
 	  Provides support for launching Intel Trust Domain Extensions (TDX)
 	  confidential VMs on Intel processors.
-- 
2.50.1.552.g942d659e1b-goog


