Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B152CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dryunec7C15FT43WsTYqyK8BC2tH9vRzD5ncvT1VTyI=; b=jdisoBtfAT3oRA0n6vnWloTdwW
	fDtmjTm873wDOVqYzdUWew/x5qC7I2xN/8W+Z/8JuC5+oCSkLJnJuA8VRMb96YZMeTZXA4XJ4M0I1
	x3wAnhY3XLHWIOWCwhqa5lgivPZmb4CSsFL6WSwDuTU/WQYyG/9d8EIlfSnlPvFoCMOO+fUfEwbXA
	0AiPrxD9+I91/8JuYr+mW0JohDUtjpq/MXLf8bGlHNMLB/8+GFf0rrXPz8OnYvU12pvNok/We5J12
	Cr+0nADEin+Y+J6z9ZVRYzs1MSgCyvM0B0Fo6o62PDZcZCvHOIalCj5r1MV/QQMPFkVVXZSyGG8jE
	TJfmImGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJ1f-0000000A2F0-3qEM;
	Tue, 19 Aug 2025 09:53:07 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIL2-00000009tmM-18IR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 09:09:05 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3b9dc5c2c7dso2779056f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 02:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755594542; x=1756199342; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dryunec7C15FT43WsTYqyK8BC2tH9vRzD5ncvT1VTyI=;
        b=eOsNdm/mu6tBFlqd+phT4e2aJNYBcFIaMFeL8LiQLj7Z4H5Kn2Temz7Y+OJzQgRaRf
         ydFBs1BZ8odZ6Ia96Rc13ZbhV0qQsFreeww4i8fN6M98Tlhzucd6MRvLk/2vstUP3ssK
         NeBSlC9ZYhOmeLE0WaqAxS+ntrg6q+LlV6iGbvS3dclbtvyt4EFVmoo2962EvrU4i6Cr
         9i+sA53WgbW0A9VH9NyqJTrbBnAe2jII1Hr3T2S5EOdw+qCB9J7qg8yaigHW05lSJ402
         xceyLH2/3q4I24vHYbeIuH74OKa072YAVShw8oKqwJaN+kqbBMb0YEaMfCBM+l5dGAu2
         tmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755594542; x=1756199342;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dryunec7C15FT43WsTYqyK8BC2tH9vRzD5ncvT1VTyI=;
        b=WNLdxOtL5qsyXva2r3XSoYUDYPwZme5+8tK5kO63UyMg/LZf8iJp7dLPzeJYcPFhux
         QdkD6KZr2jiE2+bYq0xxg5X5nRTHl4f6MbULbX75fYFkn3Hzv/pG8qMbIttf4sQRQCnX
         DXRxwlTYvQnoNvwxNTyAoGtfjpv2/iUYjhYxDKtuiMEiZAuLABK64qoTHxcxL9O47/KR
         YhLF7l49sjOBVMMY97REy/OfC0B1X+6iQ5bZwUqiVCeUkqF41OZR7tkwUvRhnxzZJG1O
         4icQQJBrAbDQooBRBUl+QZpbkRWwvUVIvuVBShlj6JEADtgX5dotnuv78wCqmfVhIjKy
         QzzA==
X-Gm-Message-State: AOJu0YwqdrIw+SeWx0SypFiKiLP1SxfXPVEc/El9WPjC8EqLdKofrsQi
	7CfgcIUqBoCNqquJzyqevOjJ0KwNUqp4eY+SpSQ+3lyNrHhe6ITGShnr7m/dhP+q5TKYgaBU4by
	8nMTkEXwTg9kBMyDYJdPrbSIWczQvBroJ90TFC+WAyufvVPeS/IPWicjn1U592j64MiFf8atbDR
	tYXFEyfT3qrWJchvNH5236DU/cCZ70AFXfszAv1G+31lPFIYh6Sw==
X-Google-Smtp-Source: AGHT+IEWZK/S3bmfcTBpMD/OWSO9i/fgVmwIt0LtH8csguKl7P4ZrXGSAdstuEmNYdGpRILLFl16F7mudg==
X-Received: from wrqx7.prod.google.com ([2002:a5d:4907:0:b0:3b7:8342:dc50])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:64ef:0:b0:3b7:9c28:f846
 with SMTP id ffacd0b85a97d-3c0ed1f3372mr1452415f8f.44.1755594542204; Tue, 19
 Aug 2025 02:09:02 -0700 (PDT)
Date: Tue, 19 Aug 2025 09:08:53 +0000
In-Reply-To: <20250819090853.3988626-1-keirf@google.com>
Mime-Version: 1.0
References: <20250819090853.3988626-1-keirf@google.com>
X-Mailer: git-send-email 2.51.0.rc1.193.gad69d77794-goog
Message-ID: <20250819090853.3988626-5-keirf@google.com>
Subject: [PATCH v3 4/4] KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_020904_306688_3214C8CA 
X-CRM114-Status: GOOD (  12.93  )
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
index 4f35ae23ee5a..9144a0b4a268 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5953,6 +5953,13 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
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
@@ -5991,8 +5998,7 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
 	memcpy(new_bus->range + i + 1, bus->range + i,
 		(bus->dev_count - i) * sizeof(struct kvm_io_range));
 	rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
-	synchronize_srcu_expedited(&kvm->srcu);
-	kfree(bus);
+	call_srcu(&kvm->srcu, &bus->rcu, __free_bus);
 
 	return 0;
 }
-- 
2.51.0.rc1.193.gad69d77794-goog


