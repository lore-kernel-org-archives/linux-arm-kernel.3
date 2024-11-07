Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24620D5D690
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HGLva8x9odObzptOfMBkr9/TxQLRpKS7Miz1lBZC1M=; b=jQTLFAFHzeIilJnPNHOq8WA8N/
	RfMyQKVFspzLtNbnhC2+UhnRH7s3Nch0/8YGpUEyRg+DW9xyHYBCZ1j5QT3NADDyWm62NunXwM7JW
	fF5Hin6GE5dhmFTj78SMTw9IBZwsxGMRvUOeFud+f5QvIuUn/7Dk/WsLMKyFDE6QhMOjm/PSmdp/h
	t+TMXQojstjRlt0FRKdheeWmKExpwZV1KGsC8E1gBh8P5dRDpreXXV24qp+ZyU7Hxkp9i/Plc7suS
	eYNYzdc2jmkTYik4jRnS8esU+vBFDc4HAws+xFNoHZuBrdE+jY/2e81WvOhYKj14vRWVRYg4fFJFs
	EJWaiMlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9AN1-00000008SzI-1nqH;
	Thu, 07 Nov 2024 21:48:51 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9AGA-00000008RjX-31lQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 21:41:48 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e32ff6f578eso3355099276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 13:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731015705; x=1731620505; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+HGLva8x9odObzptOfMBkr9/TxQLRpKS7Miz1lBZC1M=;
        b=jrqkOON+Ry79P3pMGJWfua33rAeDcfBAY+BNBi3tf3iEMV8TGxY8NXsYi3Bv+OASum
         Z31bn19cAptxC2Gqwb+wwDShVE/2k4UCVvHfqxpTfgOavcc9smoVCaqep/RAP1BD29WO
         iAKnGiMC4hvVtKzUEaH0/1pp01LeO5LYRnqPl6EtFenjE6mSJcoM9eDVZp/8g/0Uxy29
         UIz1JNQQkJU7/czcEHN2bmTeI5zlOYQM94RWw5wHlFz7PibC//ObJyN2xbcBaV/ddt2A
         DqNAJ3xkrNPQnsZ+mSm1JQmIMUorhpSkVFmIUD7WCq8/ygHBldYgvUSQTLEfhxmNIf6R
         6SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731015705; x=1731620505;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HGLva8x9odObzptOfMBkr9/TxQLRpKS7Miz1lBZC1M=;
        b=oxYZ2SUOe00LVDRpPDWqPwH5slNHDv0NY1CVyczGldRyO0hr2qzLoliPm3dtfBm/WK
         pMUJ6crXRV45z5pHH+x0mc1zssL9CAnY8x+KyyEm50/iA2R7SN6AVkR6piqfMmcFvhFD
         HAldnpZmnZH59ivw61OWFSOvUwgBxfGu5+F/ZdKmJC6wBiQk90ccINPemM6Id9iQvvhw
         jQSpmem14Clq86+Qluy03+jR8YN3MEfPFcLeT+ytm4HOBdippOA5maA9pwgHE+IQiAzB
         HXh0u08DYfk+g/B4QtBDE8h3o54hKMt0Gyla/tpsdtbJ17zEP7WOq30gFcHYKbA5ZrcY
         Vk8w==
X-Forwarded-Encrypted: i=1; AJvYcCVmJO3cf5732+0bvZQIFrD5W4SX4prhQEHHV2ytGZNkC038BAG75DS4ES5l17ZjPZcZSZXbylRpJp4d0jATN/Su@lists.infradead.org
X-Gm-Message-State: AOJu0YwLAQmvYIMxiXORnVjU5y/SBuwuOCgxWuCc1zWUd9G3pkpb3YPR
	bJHnZJ+V7X/LM4+2/MBiybBhe9NRB+SntOK6USzhbXg9atcAbBWOxOXqNrFIseI9SqCptKVzrxr
	toayny8Q1QiMazpSwyifBuw==
X-Google-Smtp-Source: AGHT+IFc0PLyo+kb0an1Crt410TnBfN08WjncHVRt9wOAEQvXdRMVzovySNeUUyzLZxRzXVJhn2du4OY9kLn+4Hz5w==
X-Received: from jgzg.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c96f])
 (user=jingzhangos job=sendgmr) by 2002:a25:abac:0:b0:e2b:db24:905e with SMTP
 id 3f1490d57ef6-e338017a945mr1306276.5.1731015704930; Thu, 07 Nov 2024
 13:41:44 -0800 (PST)
Date: Thu,  7 Nov 2024 13:41:35 -0800
In-Reply-To: <20241107214137.428439-1-jingzhangos@google.com>
Mime-Version: 1.0
References: <20241107214137.428439-1-jingzhangos@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107214137.428439-4-jingzhangos@google.com>
Subject: [PATCH v4 3/5] KVM: arm64: vgic-its: Add a data length check in vgic_its_save_*
From: Jing Zhang <jingzhangos@google.com>
To: KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.linux.dev>, 
	ARMLinux <linux-arm-kernel@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Kunkun Jiang <jiangkunkun@huawei.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Shusen Li <lishusen2@huawei.com>, Eric Auger <eauger@redhat.com>, 
	Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_134147_172084_080FDE74 
X-CRM114-Status: GOOD (  12.67  )
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

From: Kunkun Jiang <jiangkunkun@huawei.com>

In all the vgic_its_save_*() functinos, they do not check whether
the data length is 8 bytes before calling vgic_write_guest_lock.
This patch adds the check. To prevent the kernel from being blown up
when the fault occurs, KVM_BUG_ON() is used. And the other BUG_ON()s
are replaced together.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
[Jing: Update with the new entry read/write helpers]
Signed-off-by: Jing Zhang <jingzhangos@google.com>
---
 arch/arm64/kvm/vgic/vgic-its.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index ba945ba78cc7..9ccf00731ad2 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2086,7 +2086,6 @@ static int scan_its_table(struct vgic_its *its, gpa_t base, int size, u32 esz,
 static int vgic_its_save_ite(struct vgic_its *its, struct its_device *dev,
 			      struct its_ite *ite, gpa_t gpa, int ite_esz)
 {
-	struct kvm *kvm = its->dev->kvm;
 	u32 next_offset;
 	u64 val;
 
@@ -2095,7 +2094,8 @@ static int vgic_its_save_ite(struct vgic_its *its, struct its_device *dev,
 	       ((u64)ite->irq->intid << KVM_ITS_ITE_PINTID_SHIFT) |
 		ite->collection->collection_id;
 	val = cpu_to_le64(val);
-	return vgic_write_guest_lock(kvm, gpa, &val, ite_esz);
+
+	return vgic_its_write_entry_lock(its, gpa, val, ite_esz);
 }
 
 /**
@@ -2239,7 +2239,6 @@ static int vgic_its_restore_itt(struct vgic_its *its, struct its_device *dev)
 static int vgic_its_save_dte(struct vgic_its *its, struct its_device *dev,
 			     gpa_t ptr, int dte_esz)
 {
-	struct kvm *kvm = its->dev->kvm;
 	u64 val, itt_addr_field;
 	u32 next_offset;
 
@@ -2250,7 +2249,8 @@ static int vgic_its_save_dte(struct vgic_its *its, struct its_device *dev,
 	       (itt_addr_field << KVM_ITS_DTE_ITTADDR_SHIFT) |
 		(dev->num_eventid_bits - 1));
 	val = cpu_to_le64(val);
-	return vgic_write_guest_lock(kvm, ptr, &val, dte_esz);
+
+	return vgic_its_write_entry_lock(its, ptr, val, dte_esz);
 }
 
 /**
@@ -2437,7 +2437,8 @@ static int vgic_its_save_cte(struct vgic_its *its,
 	       ((u64)collection->target_addr << KVM_ITS_CTE_RDBASE_SHIFT) |
 	       collection->collection_id);
 	val = cpu_to_le64(val);
-	return vgic_write_guest_lock(its->dev->kvm, gpa, &val, esz);
+
+	return vgic_its_write_entry_lock(its, gpa, val, esz);
 }
 
 /*
@@ -2453,8 +2454,7 @@ static int vgic_its_restore_cte(struct vgic_its *its, gpa_t gpa, int esz)
 	u64 val;
 	int ret;
 
-	BUG_ON(esz > sizeof(val));
-	ret = kvm_read_guest_lock(kvm, gpa, &val, esz);
+	ret = vgic_its_read_entry_lock(its, gpa, &val, esz);
 	if (ret)
 		return ret;
 	val = le64_to_cpu(val);
@@ -2516,10 +2516,7 @@ static int vgic_its_save_collection_table(struct vgic_its *its)
 	 * table is not fully filled, add a last dummy element
 	 * with valid bit unset
 	 */
-	val = 0;
-	BUG_ON(cte_esz > sizeof(val));
-	ret = vgic_write_guest_lock(its->dev->kvm, gpa, &val, cte_esz);
-	return ret;
+	return vgic_its_write_entry_lock(its, gpa, 0, cte_esz);
 }
 
 /*
-- 
2.47.0.277.g8800431eea-goog


