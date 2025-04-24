Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33F6C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pJfw58KOVJlcvsi2YwD0da6h5VnpsCyDZ/he/rc1kk=; b=a/4CDC6/AcMyH6d9YA95hsy4Zu
	5Am1rcUxAOMfxb+Z4XIAdg3cj3FO1HGWMbR7rrBsA8N/NtDNTms4lKQvXek3oTh4UIthxs54HoRWN
	PWlQhk8yFinSdRBQXoWvXEo2hNuNloaURrFwDAgGmJdWPn5w+umaL/gz+7mDCe8Tat4FkcXgIGDEc
	CSwk7Sva9Q/Av7Ch7gnxUFtw4A40a1j2LKpluhHTRUmwXkSJiZ4G4AFodsWa0B1E/ueYeryVo8aNQ
	Gm/jI0dfeF1S8Lnc0G7vGPuGmgvvHP/bY6CofYsu6dJeuyhoJhdK9PreDCVuE4CLbuNWVjmxpFCcE
	ppPbEwBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z4p-0000000Ecbw-2dNO;
	Thu, 24 Apr 2025 16:05:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xKm-0000000EKba-105i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:13:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so8024385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504027; x=1746108827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pJfw58KOVJlcvsi2YwD0da6h5VnpsCyDZ/he/rc1kk=;
        b=s5k7uPH2S1UqCywlV7rCZVAe5TZhHqUvpnMgm3vA3eOXyjolnhjp+t052GWnihuDiK
         JTvQC5/TUwKax6fXkFw1tyHDXsMpt2yWPYDnJ7S3QtXxgCrvKxyftd+xN/qqqLD4NiF0
         7SmCtG3EZ+pqUu8+g3RyD1r9LQuYDRuZJTXTvU2DD6MhiV0rmZ1zyVuAbzsfoI62h767
         QSlD6up/1Q9JqS23o7p9uTxZyurnnYT2tjzZeSwjfCM9oewxkw6CZVF1/s7bBheACqJu
         7sEC98kOfC1amJH7pEWYEr1Yy8+L6q7m9zxb6YpcM2XWL+aHIa1rOagy9wDjQ3Y5z/Hw
         FEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504027; x=1746108827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9pJfw58KOVJlcvsi2YwD0da6h5VnpsCyDZ/he/rc1kk=;
        b=PJ9xAE41KiGOaqzij4CCRRWRCgTH2Gy0J/5kIXcoexApyMaIJIx4llpJuI9uTNpIXu
         hm+DlkaQeHcsHCqiZa3Bs/Nug30b4ApP7QmUM5OxII7w9eIDdvKUJtIgSbf2cS6/wtS8
         Tr9v3Hd+zVH//VU5LhUta4WL/bDBkR+0RSSn0eKi+DAfNlLLuJmbQ5CZMqAJadt+5qc1
         AQc/G+v7lbS/42I/u9h6ryETHxURksm8w2UIDQlJTXxxyhos3c8EgRYa29st57hMFlfO
         gk7k7FYBbjsDLyOHxyMLhOVqtQbqllkdYGhtc7Lom+2W3to5xN3ONFpvIp7pXYjY7ME6
         Fr3g==
X-Forwarded-Encrypted: i=1; AJvYcCVupoHw08f9K6tV1oEGpqLkUMCvVDpH/CngPr0sgg0nKP2RHn0j/AU++gMH8P8ELwUzXYSbwk/aVF4nEDgsl87P@lists.infradead.org
X-Gm-Message-State: AOJu0YwCyAHxH+ksdim6oh/5KR2HiG3c1TlNyZRlN820GWCP3p2GMLy2
	YKZw/FXHisX3tg77xAqwIrCLc1jfCt8sz08KGkbjR2QUxvvwht2BDzOy92O91Rk=
X-Gm-Gg: ASbGncuP4FQHTMBiw36AMiSZTBl7kgGnJ0A6AokL4GsL9MYyucW+EPnfigQ7vWxm/iK
	82RdlLs2XwUJ3MWeMT6UF9JmRmZRFU0QuwDIPEqriICo//yruqW33C0XsZb4CfdS3quPlLjsG9b
	JFeb5aeGKAxubATvinYsIT1G6TZWLHRi+TYiMc6v8c2cklWSFBVKn9ko1bfPkqLy4eivV39nZ0l
	rGuVub3uFnbh4OwCsE/9JCy0mmFj8dWfCTJ+u+1o8Y8NJb2gB/W5FZ6oJ/SqI+y44GORfREwlZt
	eTNCxvzrQzWmzpcgdMNB5KceO8am8aawMuZjgjyHLn9EcOWIxewoXQfx0c35SqNSvpBPky5JmS4
	WmCksd7UpzyH1wHP8
X-Google-Smtp-Source: AGHT+IGfRrIJRrexUH30juVxzQxuzQYHkS7hGTbMmJLV2Lp0+vmOpc/tkASkqUk2GbTXQepziYNH6A==
X-Received: by 2002:a05:6000:2510:b0:391:304f:34e7 with SMTP id ffacd0b85a97d-3a06cfab9abmr2560733f8f.44.1745504026564;
        Thu, 24 Apr 2025 07:13:46 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:46 -0700 (PDT)
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
Subject: [RFC PATCH 01/34] KVM: Allow arch-specific vCPU allocation and freeing
Date: Thu, 24 Apr 2025 15:13:08 +0100
Message-Id: <20250424141341.841734-2-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071348_273987_C878106E 
X-CRM114-Status: GOOD (  14.16  )
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

Gunyah KVM backend [1] requires custom vCPU allocation to associate
architecture-specific state with each virtual CPU. The generic KVM
core currently allocates vCPUs directly using the kvm_vcpu_cache slab,
which does not allow architecture code to intervene in the allocation
process.

Introduce two weakly-defined functions, kvm_arch_vcpu_alloc() and
kvm_arch_vcpu_free(), which default to using kmem_cache_zalloc()
and kmem_cache_free() respectively. Architectures can override
these functions to implement custom vCPU allocation behavior.

Replace all direct allocations and frees of vCPUs in kvm_main.c
with calls to these helper functions to allow arch-specific
substitution.

This change is required to support architectures such as Gunyah
that must allocate architecture-private state along with the vCPU.

[1] https://github.com/quic/gunyah-hypervisor

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 16 +++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 1dedc421b3e3..3461346b37e0 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1581,6 +1581,8 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id);
 int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu);
+struct kvm_vcpu *kvm_arch_vcpu_alloc(void);
+void kvm_arch_vcpu_free(struct kvm_vcpu *vcpu);
 
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
 int kvm_arch_pm_notifier(struct kvm *kvm, unsigned long state);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 69782df3617f..dbb7ed95523f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -476,7 +476,7 @@ static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 	put_pid(vcpu->pid);
 
 	free_page((unsigned long)vcpu->run);
-	kmem_cache_free(kvm_vcpu_cache, vcpu);
+	kvm_arch_vcpu_free(vcpu);
 }
 
 void kvm_destroy_vcpus(struct kvm *kvm)
@@ -4067,6 +4067,16 @@ static void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu)
 }
 #endif
 
+struct kvm_vcpu __attribute__((weak)) *kvm_arch_vcpu_alloc(void)
+{
+	return kmem_cache_zalloc(kvm_vcpu_cache, GFP_KERNEL_ACCOUNT);
+}
+
+void __attribute__((weak)) kvm_arch_vcpu_free(struct kvm_vcpu *vcpu)
+{
+	return kmem_cache_free(kvm_vcpu_cache, vcpu);
+}
+
 /*
  * Creates some virtual cpus.  Good luck creating more than one.
  */
@@ -4103,7 +4113,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	kvm->created_vcpus++;
 	mutex_unlock(&kvm->lock);
 
-	vcpu = kmem_cache_zalloc(kvm_vcpu_cache, GFP_KERNEL_ACCOUNT);
+	vcpu = kvm_arch_vcpu_alloc();
 	if (!vcpu) {
 		r = -ENOMEM;
 		goto vcpu_decrement;
@@ -4182,7 +4192,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 vcpu_free_run_page:
 	free_page((unsigned long)vcpu->run);
 vcpu_free:
-	kmem_cache_free(kvm_vcpu_cache, vcpu);
+	kvm_arch_vcpu_free(vcpu);
 vcpu_decrement:
 	mutex_lock(&kvm->lock);
 	kvm->created_vcpus--;
-- 
2.39.5


