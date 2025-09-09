Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA63FCAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CHS3L1HTq4zc8VOJcXLjTfuiOI6XTDNN7808wd2BIw=; b=hSiQlXf3qqCSe3TT35OAM22CAj
	Ku0dXxXS6/q7m0bvNdiPyIJPkz84tlct+w8l9u+mU3NktAPdrhGmyg+7AkfX4lSkHEfx2i/z9F8Pd
	jjW+0Op0LcK2Rn6SyQ4FsItNkAiPPVglfdisM18JIFpUc9fv2Dg3hLFUuL7D5D6I04FBIzZ1dkDf/
	po4lR+MDk7pfJW1o7wdxpmWOuXXD7ZVB0LVpgXDF8xIi97apPrPizsF4HO15uvcOUXhaucQNf4S4H
	SUyTfS8MqXs1TR1K/00OScfIl+3sgWXK4kI6LBHuq+6dpVj8jEo8+JHdvQCK2hLYGQuId8USD4T48
	BQDLd8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0TQ-00000008BrQ-0hIc;
	Tue, 09 Sep 2025 15:41:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv9C-00000006CpQ-3Gbs
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 10:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4CHS3L1HTq4zc8VOJcXLjTfuiOI6XTDNN7808wd2BIw=; b=F4iV9pe6u09AMgNrnaHTWSdTSo
	FTDUjURSYebVcJ7a1KnwB3iLr4mMkFsL1AHXHbg7Dgd5d8A2o2Og9ibCFRIW2GqoZSy8S9YWOLC7E
	8cYbuhC6lRoAt6w/mRrQhGLPjeOuMCsda1jDmNRm29ouYybWrLHjvMVozlwPTRz7E30OWrW3PFwx6
	ovvFTda06APGkqdNjvO3++WZZd4weIL2/otwSCwEIhmDwy0xSU+81Boe7Rd6fspNUN6Pu+737vQra
	MSYGS1KgtoTw6HAeMQXEFMywHJXqtv2B7Vj1sw/eh1Xrm7+oQxLX76wmHjSO8zjnXZehp61vpJehD
	bWM88LAg==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv99-00000005HGY-2PK8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:00:21 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45b9a856d58so43505815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757412018; x=1758016818; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4CHS3L1HTq4zc8VOJcXLjTfuiOI6XTDNN7808wd2BIw=;
        b=4Vo3WO1ISkB0bDA8l2eYRC1aJufT4wJ+DVcYtPzfkU9WrjM/OSMJxcwkXx2jNgq5I8
         OLb6NvXTGgT4phv2Y5wCIKxmhsuuPTJlQP0w9KpwDoTBEG2MC8pqkoELHJNwI5mxGI52
         7Oh0voQajDOrkDu56HqWCIjdwquDEP5mQNskvzj3V6ldFENY1jt0wBVprEFnd/GxrAAd
         ubxgeKzctTE1DFTcNxpJdkI5wuwADh6dVpr/Yf5ANP99Kc4HMbA0F9MuzrVdLvAWfNlS
         CPLcbtQW9reuzxtsZZlIMOE4pee0OPygeqPluB9ehQXIJPzPsfxN0CBjAbbjR+ZqoztU
         aARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412018; x=1758016818;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4CHS3L1HTq4zc8VOJcXLjTfuiOI6XTDNN7808wd2BIw=;
        b=QLEc9zAOZ7YaRIVSYYK6gKK8i8/XDm8CpZjIhly+bQGKxFZHMHy6K83DYIsYx4aokZ
         Igtzw2dcUcqg3YRdtPpwv9uiXj2073xKlG68yivjLMBXwrZczu9NU4tCKmyhEqMOtnzK
         mSG9YU9QbX3iX/7fgBW59zCKjkZ5MSvKhGqR6gF+sNdjVLNZONU+hnufzdm4UX+WqKnS
         r66r7Owr1B0jNQnIfPfpexvDp7XUUtFQ1TGyeXXlW/LROLxieUULd4lFZsg0XKdLlNXR
         tVMM65ELJvwylVT0c+EEgf87lhp7zKNMt9TKRLWLw4n4GxGCfvVZ3XY6mSOujD6NG+NO
         bCyw==
X-Gm-Message-State: AOJu0YwO4dIbtBaHGh/SwoQAPBw/tB8E/hejKhnbj/FCzivaZa0yJI+V
	IYqA5/BVhruRysq1AqMfNvrgSJsX/gArZxucq26F1WmpdDiwjKljPI8AZIeFUWZJnosejI5QgB0
	XKAl6qKHxAuKUOHOIagwMppAnoSbOpmoxDrvlvQo1/xvnO6dd+8ux6G031UquuKdC+UijKBJfiC
	ZXnLYwamxzBXRUD9JioquxxCG3xIra9WwsZj5TnshuyAtci1WGHw==
X-Google-Smtp-Source: AGHT+IFFKS9LSCg4pqICkObMpdq7WwENyXMbo01qMECVjQhfTtItSGy3G3y/UQTpd1+00goRvADrbyzv2A==
X-Received: from wmbei14.prod.google.com ([2002:a05:600c:3f0e:b0:45d:e45e:96aa])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:548a:b0:458:bfb1:1fb6
 with SMTP id 5b1f17b1804b1-45ddde6a471mr83472825e9.2.1757412017523; Tue, 09
 Sep 2025 03:00:17 -0700 (PDT)
Date: Tue,  9 Sep 2025 10:00:07 +0000
In-Reply-To: <20250909100007.3136249-1-keirf@google.com>
Mime-Version: 1.0
References: <20250909100007.3136249-1-keirf@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909100007.3136249-5-keirf@google.com>
Subject: [PATCH v4 4/4] KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>, 
	Li RongQing <lirongqing@baidu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_110019_888762_A2CC58F7 
X-CRM114-Status: GOOD (  13.29  )
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

Device MMIO registration may happen quite frequently during VM boot,
and the SRCU synchronization each time has a measurable effect
on VM startup time. In our experiments it can account for around 25%
of a VM's startup time.

Replace the synchronization with a deferred free of the old kvm_io_bus
structure.

Tested-by: Li RongQing <lirongqing@baidu.com>
Signed-off-by: Keir Fraser <keirf@google.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/kvm_main.c      | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e7d6111cf254..103be35caf0d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -206,6 +206,7 @@ struct kvm_io_range {
 struct kvm_io_bus {
 	int dev_count;
 	int ioeventfd_count;
+	struct rcu_head rcu;
 	struct kvm_io_range range[];
 };
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 870ad8ea93a7..bcef324ccbf2 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1320,6 +1320,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
 		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
 	}
 	cleanup_srcu_struct(&kvm->irq_srcu);
+	srcu_barrier(&kvm->srcu);
 	cleanup_srcu_struct(&kvm->srcu);
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 	xa_destroy(&kvm->mem_attr_array);
@@ -5952,6 +5953,13 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
 }
 EXPORT_SYMBOL_GPL(kvm_io_bus_read);
 
+static void __free_bus(struct rcu_head *rcu)
+{
+	struct kvm_io_bus *bus = container_of(rcu, struct kvm_io_bus, rcu);
+
+	kfree(bus);
+}
+
 int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
 			    int len, struct kvm_io_device *dev)
 {
@@ -5990,8 +5998,7 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
 	memcpy(new_bus->range + i + 1, bus->range + i,
 		(bus->dev_count - i) * sizeof(struct kvm_io_range));
 	rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
-	synchronize_srcu_expedited(&kvm->srcu);
-	kfree(bus);
+	call_srcu(&kvm->srcu, &bus->rcu, __free_bus);
 
 	return 0;
 }
-- 
2.51.0.384.g4c02a37b29-goog


