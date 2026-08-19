Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F66C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 22:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3M8fODVTfcIR6x1BvOAoZIGong7qKVQ1WDu7Gk51RQs=; b=CzyVgX81a9DV2HF0oGVK7LpXJc
	ucHBtbkv50el4pBBeiJdpRWeTinAZHxRUUEawBGQ+583caWYPP60GKdI4BzbrUieuzIKA+rszqavt
	WK2yhjsP9SJprNyQIwNeT8TPRq05+Yg2+CBb/LjR37go/1tj3SinB9DAYUj7KMY6b3/kLZz3k069g
	AIGbNUbxMF3XN1pik4YGGNuCOVSOfBpQ8/v7M84qLFLRWyY9PcdaRgm9TamfDcAzwDn7I7T3S0Ec2
	Htb7bDLRtNEKGGu3AOgaeJIpCQ/a8+HTy2EE57hl2+qeSZHM9jNTdv7+RIxQoTzZ1jugVAX3SVZ4U
	4kgVdrGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwp03-0000000AcY2-3TU8;
	Wed, 19 Aug 2026 22:43:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwozx-0000000AcV3-1Sae
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 22:43:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47db714766aso258366f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787179383; x=1787784183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3M8fODVTfcIR6x1BvOAoZIGong7qKVQ1WDu7Gk51RQs=;
        b=EUThdPVsA8AbQYa3FDI93/hfwxToPFIbYcfydq4fOH4tjvkCgYSydBRT5DkKwBEZdR
         fouVs80QJvB2dF6ZpBpyugOdXz1LySgwGA7xntqRS10Uct1xIBMcPh8LL5Jnku+tFodD
         8D+8p9KtAeA0FBNBqeVoEfqq+mf8vG6fvT4VY5IRwUgJlsyVMsDlJCY1aYcCElU845Mr
         ZxzWW+HsePR3yvTs81cRInLrG/m7ei/Akh7ysVUyGiI0cmVDNH3maYW+Bk26abl6fsn3
         oG2fodiyMqlrd65c2roXsbpbp4+5IFhMqP0HCZ1UViMqBj6N2jBAqahhS6CENRXsbIy7
         EoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787179383; x=1787784183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3M8fODVTfcIR6x1BvOAoZIGong7qKVQ1WDu7Gk51RQs=;
        b=bHjagouVDdZPovSKqVqVuVFHhDt4WkdToBImw1/LY70FHKBAKhvIXBLQzqn56j2Km4
         sOq7HcPeyw6LYvyA0KaJo2oYqteBuG6fu9NrsgOr67SdtMAN5f7jx8eP6kWap0hT74ez
         U5DXbB8dh/euG2IQDEycwGCwT18wCQgS0lPZBNMxYk1dJpOqWihLSvB9cAFRb7c9awjM
         JVV9vZz4GmB4DDvFdcL/6eLtth+DMiYx50nJOXgkrXx5UxcgWun0BLoawOjTJFHL/fxh
         EJZoYqrt1/4o1/qJzD7ThgyDIUbupQnRD+LwH56Y/L8g+Fvf0h1l0e+HUWRg283Y+xyk
         DokA==
X-Forwarded-Encrypted: i=1; AHgh+RoPFP3mHa5AApRk5WZEWJVRERD5J+dqUJ7XVqX7aILn1AHTRyfV7uDMo9L4gFjvPgjJRP7xFQF05w2vwIYHzpn/@lists.infradead.org
X-Gm-Message-State: AOJu0YxUlaKF9plOye/jtwzxRF8ScEaBW3xQq+WzAt3+Otv/tccLVyrR
	DACC+SW5Qo5F7+FAqqEfiwLqQf8PWyWF/j7GjPAE3mND6ZActzixxl3g
X-Gm-Gg: AR+sD12RpMYQZACp4MO+vNPU7Igysu2By8ukU5v1Ve0I33Ltoupv4F/DgI302bG7h5O
	ZJYHduGi3tqrUehcQM1snOYFWBdbWC7DJeY4VY44nMBCciPFoaLo/Vw+ECNT48zrxrCwUtQ/cDG
	WUdD9hjjSwVglC0kcFyvbnrNr39zW4q49Xya+XWSiBCz7JkkHw46Q5RklFEp1JMAtBSkFkXuGnB
	VmtLorhyA15LIvAgKQPEEJxuEhe90d9tExGMlRTaYc/JG6u6qzxS3zxcmetsI4uIZkkNhYyy6KM
	untHQU4oTk3UnWhFlhgUHKSohKLWb/ODK9J+1HNp78Dml+O+AnbJlYSGBOwEOukm3Xhi65kHbhg
	OrqqV+KmInejeEpl6VNGyvPnxTrsvxp2mFV2984QUGoqMRiMN1FkFNTaLn10Cw5AWRKwuwTxuhy
	AIq8nZkEbkTd+humsqV8e6sHbURWl2dJ50B4Uxr4WM0DlO93yP5D9f03tQhq7Qo2qvegJq5buZY
	IKQKDg4fo6bnfQ2M8JEu/X2wuy9Htj/rFNNVXaT3LehHUvaN0D6soH1qXYnJF+L9mK6Lq9HgJTL
	0OukTorg3KIYt+YTeZUrXPr4ezUBtw+Fatxk2O5gkvaYcGL53aLFV3ZwYad6cQQ0WGk=
X-Received: by 2002:a05:600c:4309:b0:499:60e5:248a with SMTP id 5b1f17b1804b1-499b06ea247mr24837485e9.4.1787179383250;
        Wed, 19 Aug 2026 15:43:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae9e-1d01-58d3-443d-4fa6-01cd.310.pool.telefonica.de. [2a02:3100:ae9e:1d01:58d3:443d:4fa6:1cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e61sm8553317f8f.13.2026.08.19.15.43.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Aug 2026 15:43:02 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/5] KVM: arm64: vgic-v3: Reset assignments after failed region setup
Date: Thu, 20 Aug 2026 00:42:26 +0200
Message-Id: <20260819224229.82948-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260819224229.82948-1-kmehltretter@gmail.com>
References: <20260819224229.82948-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_154305_413625_53BF053E 
X-CRM114-Status: GOOD (  13.32  )
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

A REDIST_REGION write can fail after redistributors from earlier regions
have been registered. The rollback removes their iodevs from the MMIO bus
but leaves rdreg and base_addr set. It also leaves free_index unchanged. A
retry sees base_addr set and skips registration, leaving the redistributors
absent from the MMIO bus.

Make redistributor unregistration clear the cached assignment and return
the region slot. The failing vCPU already unassigns itself, so the existing
rollback resets the vCPUs processed before the failure. A retry can then
assign and register all redistributors again.

Fixes: c011f4ea106b ("KVM: arm/arm64: Check vcpu redist base before registering an iodev")
Suggested-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index c75caadbd1d3..331d203acb43 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -852,6 +852,7 @@ void vgic_unregister_redist_iodev(struct kvm_vcpu *vcpu)
 	struct vgic_io_device *rd_dev = &vcpu->arch.vgic_cpu.rd_iodev;
 
 	kvm_io_bus_unregister_dev(vcpu->kvm, KVM_MMIO_BUS, &rd_dev->dev);
+	vgic_unassign_redist_iodev(vcpu);
 }
 
 static int vgic_register_all_redist_iodevs(struct kvm *kvm)
@@ -869,7 +870,7 @@ static int vgic_register_all_redist_iodevs(struct kvm *kvm)
 	}
 
 	if (ret) {
-		/* The current c failed, so iterate over the previous ones. */
+		/* The failing vCPU has no assignment to undo. */
 		int i;
 
 		for (i = 0; i < c; i++) {
-- 
2.39.5 (Apple Git-154)

