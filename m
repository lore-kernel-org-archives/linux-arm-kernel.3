Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4476ED29FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 08:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4GbN8ZDurMjcmVHL6T0Xi9xUq1GYOGvqk92rYIEnWQ=; b=P2xiYRI8741ri2oyUsqmFHudTY
	l6KS04nBuV5frPrarbWujLLdhBtSkRtXLoP6D/GqpyHGqE1KX5aaqV9gbdzqCz5v3z72JO2w3IJYp
	t8U9M3tz4g1uCvrOKywA78w0oId2xk3fZbfiWrBJLv7nnjKqUgCdhufb7dGn6aCT90fs7XTSGhHE0
	u/g0S7AkYtdQRRm7MEgYrlPLddxpALUe7yMUAC7Z17u5ok/ViXLb6QfVX6BHhIqZIBa7zBdqQyum/
	qL/elf0rdL/paYJqBtrNoAQhAwN3ZUr1Zu0tp7m4/fOYUOmVQpUQnUBBQY/3u8P+l5OL3MTorMXeU
	JT1UG45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bUY-00000002J43-1pjq;
	Wed, 06 Nov 2024 08:34:18 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bR6-00000002IRI-02Ws
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 08:30:45 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e30ceaa5feeso10910328276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 00:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730881842; x=1731486642; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T4GbN8ZDurMjcmVHL6T0Xi9xUq1GYOGvqk92rYIEnWQ=;
        b=MiUKvEYiK4axmCytd+Me8b0pRf3ZKHqKbwT8gFIAKOFUdHwLuzJ8lzPDu9lkXqRFvh
         kPGuBz8PeoO2Ybz0ijD2A2+NJNKgANN0zydQ0slcJLhwxjRhYDsDwdR9Tc9lSwAk7c7x
         SHojyrIx1PNX8+csF5b1gIcOKTsmv8D1+tvpWtgrQ3PnqAZzLCO/lBHho6x72aTJApbB
         OKf2o5p15ec51slyqU/tb6+VoHSVGshCSO1Pp46d0J3IzA5HSQLS6i+Dlj8SpBrG8CUC
         yFRsIl9TnQvkugWSt+1GbjRSZ22T4NYVBuK2JcJJXi4yw+wWSna5Uzs9QlpeBylxr9eN
         b8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881842; x=1731486642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T4GbN8ZDurMjcmVHL6T0Xi9xUq1GYOGvqk92rYIEnWQ=;
        b=cFrqkVb+SH1SIVN398fqMY17EZKb4VBZBIOxyFv2Ei8rCwg3gPlGUQkncfRnWVFrzy
         mLyIQPgUlUjfiPYKWHHxsI3fMDIgcj2CEz+eoaF7GL0UZak6W4NBnZ9TvkZv1eEfk/Mq
         ffKyPLUV9Hycby6PeDCAAkBz+5ksv0UtepxskDKvg6GF30kSsCidDypowXO7AJLBGRCw
         rShZrTlACQj1zA9iAjlY3FbPnjNjKr3itS/7J+si1PcX7cclUZp4W3DfGiQHapB3VUVp
         nqg1Hu82qyxnXVeUPshR5JjQUleCjWzZQPP9uQSOzT+miJpp9BCIZ7d7939tQSN99e8v
         e8TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqRVa79Ef14k+qEf1wz2+3vci8vJGGDc5QbelMMj0tshpemkODMEJmi3lXvRYuadMaEvU4HT9mxx5jdznkUehq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpdy1KcjWZ3T4mVyb9eMdHguxrC4ciRYZxQAARna+y6VHSb3i7
	+oUWmTAlyAl9uzWVJOypV0tndobchDdje5wVKiByl2VeXDnf59XUUe1agDPR6FW2fi/iu/kMr9M
	oH1KsCBRezBevJwQkWrz6TA==
X-Google-Smtp-Source: AGHT+IESgZ2HUDGTGAdUvYoZM+ViRqBFK9RcS/H99OhminhorZqyukanemB5KOr2KI9Z7I4wBJZ181jopq1rHk8LBA==
X-Received: from jgzg.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c96f])
 (user=jingzhangos job=sendgmr) by 2002:a5b:308:0:b0:e33:2432:8b75 with SMTP
 id 3f1490d57ef6-e3324328dedmr19767276.7.1730881841856; Wed, 06 Nov 2024
 00:30:41 -0800 (PST)
Date: Wed,  6 Nov 2024 00:30:32 -0800
In-Reply-To: <20241106083035.2813799-1-jingzhangos@google.com>
Mime-Version: 1.0
References: <20241106083035.2813799-1-jingzhangos@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241106083035.2813799-2-jingzhangos@google.com>
Subject: [PATCH v3 1/4] KVM: arm64: vgic-its: Add a data length check in vgic_its_save_*
From: Jing Zhang <jingzhangos@google.com>
To: KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.linux.dev>, 
	ARMLinux <linux-arm-kernel@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Kunkun Jiang <jiangkunkun@huawei.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Shusen Li <lishusen2@huawei.com>, Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_003044_413943_1086407D 
X-CRM114-Status: GOOD (  13.59  )
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
Signed-off-by: Jing Zhang <jingzhangos@google.com>
---
 arch/arm64/kvm/vgic/vgic-its.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index ba945ba78cc7..2381bc5ce544 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2095,6 +2095,10 @@ static int vgic_its_save_ite(struct vgic_its *its, struct its_device *dev,
 	       ((u64)ite->irq->intid << KVM_ITS_ITE_PINTID_SHIFT) |
 		ite->collection->collection_id;
 	val = cpu_to_le64(val);
+
+	if (KVM_BUG_ON(ite_esz != sizeof(val), kvm))
+		return -EINVAL;
+
 	return vgic_write_guest_lock(kvm, gpa, &val, ite_esz);
 }
 
@@ -2250,6 +2254,10 @@ static int vgic_its_save_dte(struct vgic_its *its, struct its_device *dev,
 	       (itt_addr_field << KVM_ITS_DTE_ITTADDR_SHIFT) |
 		(dev->num_eventid_bits - 1));
 	val = cpu_to_le64(val);
+
+	if (KVM_BUG_ON(dte_esz != sizeof(val), kvm))
+		return -EINVAL;
+
 	return vgic_write_guest_lock(kvm, ptr, &val, dte_esz);
 }
 
@@ -2431,12 +2439,17 @@ static int vgic_its_save_cte(struct vgic_its *its,
 			     struct its_collection *collection,
 			     gpa_t gpa, int esz)
 {
+	struct kvm *kvm = its->dev->kvm;
 	u64 val;
 
 	val = (1ULL << KVM_ITS_CTE_VALID_SHIFT |
 	       ((u64)collection->target_addr << KVM_ITS_CTE_RDBASE_SHIFT) |
 	       collection->collection_id);
 	val = cpu_to_le64(val);
+
+	if (KVM_BUG_ON(esz != sizeof(val), kvm))
+		return -EINVAL;
+
 	return vgic_write_guest_lock(its->dev->kvm, gpa, &val, esz);
 }
 
@@ -2453,7 +2466,9 @@ static int vgic_its_restore_cte(struct vgic_its *its, gpa_t gpa, int esz)
 	u64 val;
 	int ret;
 
-	BUG_ON(esz > sizeof(val));
+	if (KVM_BUG_ON(esz != sizeof(val), kvm))
+		return -EINVAL;
+
 	ret = kvm_read_guest_lock(kvm, gpa, &val, esz);
 	if (ret)
 		return ret;
@@ -2517,7 +2532,9 @@ static int vgic_its_save_collection_table(struct vgic_its *its)
 	 * with valid bit unset
 	 */
 	val = 0;
-	BUG_ON(cte_esz > sizeof(val));
+	if (KVM_BUG_ON(cte_esz != sizeof(val), its->dev->kvm))
+		return -EINVAL;
+
 	ret = vgic_write_guest_lock(its->dev->kvm, gpa, &val, cte_esz);
 	return ret;
 }
-- 
2.47.0.277.g8800431eea-goog


