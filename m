Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7C2CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2APtNHHyxo533cskw92lxdMihs7PuU7RV34cw5AXBI=; b=CCcHUvRPHxR4fCD/3UwulacSay
	f0EmPZzjosJntjpNbWrh4QaB7A+NAaCjWfZuJZbLG3y0X3XLz2vI5Dm50UGNMtVYV+15LrLY02qTQ
	QUsMC3gJQSf207Ub8yUdJROu1DTni6UHSqqe30Iy0LdNj9/wfMsOav2e3BnffUOMKcpZ1X8h2HBdQ
	+ThIIlcXl3SBCLbjbds5PeOP+MTtxDcM62YbGHcgQGsmWOXOAv9j6ZpNWN5855nERWjloMHKN/Sqc
	S/pfCDsxrz41ccClKkKgquLiJkwBJaWdGSi6SoT7Uvj+kfqMz/zx86+1oDIY3blzdByg+XdieXZbT
	/TgeGGBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1UD-00000008dNw-2sbJ;
	Tue, 09 Sep 2025 16:46:29 +0000
Received: from mail-wr1-f74.google.com ([209.85.221.74])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv98-00000006CmT-1Ysv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:00:19 +0000
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3e1e7752208so2642436f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757412016; x=1758016816; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t2APtNHHyxo533cskw92lxdMihs7PuU7RV34cw5AXBI=;
        b=aDc6AeIOyrSCy6IwYLREmtycjTxK6Kte/XljWfqf5FnHQfmyDh+aNX4QNmrffu2js6
         bD6n4SyxWEcqSGZKTXCQ78ShRhpenIdKB+PVtqeqPh1meSoQ/STuHJHERjOk9tzsEXDy
         Z4uUdsQ+mCib+K+oXVCiiX3FiXBgeB6hlQSQ9Xa/Z6SRltUUJsCfSJLUoE1dNY/K8JNx
         c/YFe2rij1sG6ysh5RumMrCD4ZvZPESaIkBtXqd+Y4kLCq8RzO3qI+8FWe1Ohff8Y/Q3
         si8shgyg/VZfTNiQ0b22jVdVHR4TCjQMWDTyiFZRTqhRi4cRyjzr6QTAPtn7yLV5PlcN
         pi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412016; x=1758016816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2APtNHHyxo533cskw92lxdMihs7PuU7RV34cw5AXBI=;
        b=KwSihw+dgE2qj7g8X4fM0IFUbv/U80L32hl9RrHRe4JeNT62gsVHmtTDPlo/hszgOd
         kmA2TFeQL7fDeqCYM7K6F5gSWgHq7Uzhbx+BYQ10NP+Iv4HFvYqvgqnAimm/UZbp+afW
         h2FO0HgWcE3VHPWph9o63sf74j80/YlR/qMX+AtxuGurBEGWynTXS28IEB8VSpAdZ7tg
         xUJHlE+yLJ58+I04DLVGe1r1+dgDh+4tslHhknNQ1Z6RxTnG9CZ4oSZcPOYMFeplmEBF
         W4DiyiV8cbmhP866rl6nND3NGf5qcqfdB5OdCaKkYivijadyCUct/GL7qjtb869iXRVX
         9S9g==
X-Gm-Message-State: AOJu0Yyqeh1sPQqaHfJm1QDmbO94utbPgh8OeIWiVpeqI3Zb2/0k0Q9s
	sKFOlAY2EAuBki3MpesCWvbXKBZvVJARA+VhFk++0Jh62DatfQWSlGa5Hv0KdTSljAhhs+p8NE7
	On9ms3/yCW8vx3r1vVOp6VtxoaPzfBcBncpQc4HR1bXZXeAMbWCNHYVwlneZSURPaSSjGk0SUHF
	39Z3smXCS/5K9t4ZA6Xtspq6bLomOjVHvkZIlBULimu1/Wyuhy7w==
X-Google-Smtp-Source: AGHT+IEaeuL7yLD0zJ6dVDDu1CnL/lrOdGiAdKs9KWet1I8AXuefzYo8TDKeImXKCQUtFMCZRXRSbCKA3g==
X-Received: from wmbbi7.prod.google.com ([2002:a05:600c:3d87:b0:45b:885a:402d])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5d13:0:b0:3e7:481d:7a6b
 with SMTP id ffacd0b85a97d-3e7481d7f17mr6380076f8f.10.1757412015873; Tue, 09
 Sep 2025 03:00:15 -0700 (PDT)
Date: Tue,  9 Sep 2025 10:00:05 +0000
In-Reply-To: <20250909100007.3136249-1-keirf@google.com>
Mime-Version: 1.0
References: <20250909100007.3136249-1-keirf@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909100007.3136249-3-keirf@google.com>
Subject: [PATCH v4 2/4] KVM: arm64: vgic: Explicitly implement
 vgic_dist::ready ordering
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_030018_434463_BCD06AEA 
X-CRM114-Status: GOOD (  11.73  )
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

In preparation to remove synchronize_srcu() from MMIO registration,
remove the distributor's dependency on this implicit barrier by
direct acquire-release synchronization on the flag write and its
lock-free check.

Signed-off-by: Keir Fraser <keirf@google.com>
---
 arch/arm64/kvm/vgic/vgic-init.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 3f207b5f80a5..ccccb5c04ac1 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -562,7 +562,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
 	gpa_t dist_base;
 	int ret = 0;
 
-	if (likely(dist->ready))
+	if (likely(smp_load_acquire(&dist->ready)))
 		return 0;
 
 	mutex_lock(&kvm->slots_lock);
@@ -593,14 +593,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
 		goto out_slots;
 	}
 
-	/*
-	 * kvm_io_bus_register_dev() guarantees all readers see the new MMIO
-	 * registration before returning through synchronize_srcu(), which also
-	 * implies a full memory barrier. As such, marking the distributor as
-	 * 'ready' here is guaranteed to be ordered after all vCPUs having seen
-	 * a completely configured distributor.
-	 */
-	dist->ready = true;
+	smp_store_release(&dist->ready, true);
 	goto out_slots;
 out:
 	mutex_unlock(&kvm->arch.config_lock);
-- 
2.51.0.384.g4c02a37b29-goog


