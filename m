Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EBDC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 09:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwYf71jp03MdxLBkkbihaPjia5WcEiabBGw3WgO3Tes=; b=Fn/n0oVjgzDvCc7gx9A1CCMRdg
	hirfWNGLJXSgSTEUt5hEBH14VR25kKCTO5tHusEqBzqAN8fXb4XUWQtMaPS9m+YvlhjxVlu+0MnSP
	oEmCSMOGC3vMSqFeuYd+uCjAVL+YBuRHo+P4uWXuBNxma0gsc5Ugvf8wXsdAeHyw9MFEfOoiMpSAo
	uvBYF5EzYirWyLOhame916eFZ5KuR8yWvHwjXqkV7Hi9uizo26qRGpNEPS2ff1grIZJf+IUR3v9ob
	FjU2RS97+uMk1/fxkU1KUBUaLV9Qn5aLQ7wykXk6PG7Wk9hB1pxY82IfpvE5DUqIhc9RMl2JnksOs
	bj6dKX6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU01d-00000005C0T-3n0Y;
	Tue, 24 Jun 2025 09:33:09 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzs2-00000005Apa-0c7s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 09:23:15 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so115517f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 02:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750756992; x=1751361792; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uwYf71jp03MdxLBkkbihaPjia5WcEiabBGw3WgO3Tes=;
        b=s3NsnpZvpFmrwxSQCvol9qQLDJEtALwS/CMM8gFQDuFolrgqW3JnTb4+Sxw61a2Yu4
         nvIHcq7rdj8RlSBQHdFgvApu/r1pe1hpnACDXJ/3TsqsBrHDNo1dY78QObwctGF0347X
         BQdo0KdL3jpbDrDg0Y6/LIz/gcq0cYqde7lQbAc4m+WiY2OYRz3cYIpdAj3nXAPLDvoZ
         x3JRzVX5f6s8exuyG8XF8vX2QBnZvf+ClReSin+YAB/kiE03YBMh/XSzG0Y64HoV4i1/
         xH0hjtXuJEd2ibjRjTB3CvcV6HvzvWxzDQ1lY6rl9d1Mgc2bncNjnGPbjr9ysvcV+C+l
         Eu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750756992; x=1751361792;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwYf71jp03MdxLBkkbihaPjia5WcEiabBGw3WgO3Tes=;
        b=dGvAFBmse6yFJ3AFODSH1hkAhdEWUE2+ffUat5oZTGBNbpbJ8foKCiD2HRJwDr9sI2
         DkRmSvLXQvJHBr1LvA8sB/DdC4ixn76Kh1VfFNu4kQXihuFt7JjuRJKafQnvjKg0iqM9
         +2oogDWiF/fDEyBsfNdMnWvD28bzxbdzZMHI5bzNcYpGa8lo1u86eB7sJBVARC5MTUX5
         Ew1E9SuYtEtOZ67uhS/ktRjgGqHxs2OMKv8EB8+bxc1YiHlezI001a7itAdRXTDS7QZ7
         xJGom1RH6EjlbA1o//PEUy65lcIX/lYoWs6guQfCtGqaCV+s7TFRLWaASQZp+ucLFn6+
         +X3g==
X-Gm-Message-State: AOJu0Yxwax6237dYkDWsYY9+Muki9jzWqx8Ps3NHmvcTTf8gAxuA0mdf
	igaUx/4ijCK8nnyrPjRGkOjjGSkWckzGQRCtwcSmPfTBDbraEsQFW85OlSNawBURA2FU3gTGFji
	dkQfXPo03AXnJ5l5cqqjma/w5F3m9zEkrX7JzJG8I++uCaAggBSh98dWGrs3sTe8+Pz5UORe1pG
	lZxrX5cjE3pEu/A0bEOT+OT1QD0bGHCONvufSU6OVd/zl8q/f4CQ==
X-Google-Smtp-Source: AGHT+IH24B8WCr6OqpYTzgXlBOmAaqywmufYf+A6d0IPqpHPXgTUr1i0hczj9/ID0CWcv/+olmz2NYEObg==
X-Received: from wmqd12.prod.google.com ([2002:a05:600c:34cc:b0:450:cb8f:62cc])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2004:b0:3a4:f50b:ca2
 with SMTP id ffacd0b85a97d-3a6d12fae98mr11445680f8f.8.1750756991731; Tue, 24
 Jun 2025 02:23:11 -0700 (PDT)
Date: Tue, 24 Jun 2025 09:22:55 +0000
In-Reply-To: <20250624092256.1105524-1-keirf@google.com>
Mime-Version: 1.0
References: <20250624092256.1105524-1-keirf@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250624092256.1105524-4-keirf@google.com>
Subject: [PATCH 3/3] KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Eric Auger <eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_022314_205556_02D8AD58 
X-CRM114-Status: GOOD (  12.32  )
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

Signed-off-by: Keir Fraser <keirf@google.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/kvm_main.c      | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3bde4fb5c6aa..28a63f1ad314 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -205,6 +205,7 @@ struct kvm_io_range {
 struct kvm_io_bus {
 	int dev_count;
 	int ioeventfd_count;
+	struct rcu_head rcu;
 	struct kvm_io_range range[];
 };
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index eec82775c5bf..b7d4da8ba0b2 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5924,6 +5924,13 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
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
@@ -5962,8 +5969,7 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
 	memcpy(new_bus->range + i + 1, bus->range + i,
 		(bus->dev_count - i) * sizeof(struct kvm_io_range));
 	rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
-	synchronize_srcu_expedited(&kvm->srcu);
-	kfree(bus);
+	call_srcu(&kvm->srcu, &bus->rcu, __free_bus);
 
 	return 0;
 }
-- 
2.50.0.rc2.761.g2dc52ea45b-goog


