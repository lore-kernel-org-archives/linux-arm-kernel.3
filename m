Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59E4D29FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 08:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diXjwQHhYDrLApdizCzZAM2Cz7No88ZBnmospkxRJcg=; b=f9WQNsZ70YYk41PLEAw0YETArX
	aTi+e4GjzjK/Staa0YH9B9V7CwKTGUgn1gzqTdaaHy65ueYGcl55W7CXMK4nHSo1ml2yi8RdMX88s
	G/dthcSvtZLk8t4ss+sz/x6N4yuus/7MEzcpGE2KPzxbL05GROuYAEz02b7Nrguva6FkuXFrXCxrd
	O1UWDjPWyfLPTd1lNyLROJasp+wfHN8v6QKtFONB4V+ilCyEPuv9cjmPeZGqmJ4oUhf4fQaoJPeG+
	pPHpRx23Pp+lZwpy30MmEsPJSQsusOIMpLnTBzQO/yG5jztXHyiKwI80KH9pHGXhxY2yrd3FC5jVc
	GnOExVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bWE-00000002JRl-3Q96;
	Wed, 06 Nov 2024 08:36:02 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bR7-00000002IRk-0Hgo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 08:30:46 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e59dc7df64so7779507b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 00:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730881843; x=1731486643; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=diXjwQHhYDrLApdizCzZAM2Cz7No88ZBnmospkxRJcg=;
        b=DjX//2zizE4JcCkk/wy6AlE1aryqFObunUhqCd7zcuAZ2x+u+8g5mi1fUrZ8Xf0G07
         8nvkLYfxdbGzeMWry4bev86ZHK0KrTptG5QiRPqiExOa+vSZU2RybP3/ODk2MSZweyYo
         UD77AqGmoJ63yfFcUYzSCJeZ3nGp4TpJuwx+R3HxUT7ypmbjxd5zUTnNFkmIbHTx/2M7
         5U9pWQnyMBDmXzosRr8dbazteRk8nGDpJSuy9ogApVxxr/gbupAfdULECYjZnaRvnINx
         GfcWihdaZ9V3ghGytx5wcMijJaTk7vnirCdtWBN0UfNla9A2b4oPhywaRVpJx0s3M8Xg
         AkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881843; x=1731486643;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=diXjwQHhYDrLApdizCzZAM2Cz7No88ZBnmospkxRJcg=;
        b=aQsG9OUG2bH7EFipfB6+M/ykh2xiqofsefE4tU7looXo0PNB19NWpw/5tQw5VEIzug
         mFb+080Y9KBDRo5nLIL9O6+i8Nmw1iNWwcg/bgcK0isgq61oiOgI7jO0fdBHA9fbPK11
         VTnbSJz8ZZqFOIlem2irO9PulBhgHIg9HT1/xoZzlBA3bKerUBfYvC/CPA5IqaJsi5RE
         dn4fIfys3f5zQ52ZvbqAG2su6RcmoU7IEo5XWgmEhGR/PwjRj8uNPv0qHaealtYP864M
         Kxm0sI8NTIYQP264+jsJ5m4fUovayWxAfurBcDs4nGPxKwrhDBo+cJ/9PNlPnhwW1lSv
         IfFA==
X-Forwarded-Encrypted: i=1; AJvYcCUz495xE/cuZnVe9HdOcdj7QusBnBHib7GYYbmEJRAWPokC/z1Mg7jYcdApZuLF5rNcvw4OEUSw78yQ9o/e9kSB@lists.infradead.org
X-Gm-Message-State: AOJu0YwwWrEBbQzUk2Lz5Xa2/WaVt1eobv+QyrdwwHp1V+sfsZV72E9L
	PQS0rMKBgQOG1cabq0crafC11xv7o1Vng7jygTaAv2LKbMJVImmYJ8z+VCkNdW3DOxW6RuZ0lDn
	wIANm0kI28vzgcu664kzQ6A==
X-Google-Smtp-Source: AGHT+IHBjq15b6Y9u9NLiJuGhJ0HwVi1u2HdYmZIETeo0dLVKCCo/ZW6prnAhvaB3StzEMzIb/ffCzTWRHXU7A2VXw==
X-Received: from jgzg.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c96f])
 (user=jingzhangos job=sendgmr) by 2002:a05:690c:4a04:b0:6ea:881b:b545 with
 SMTP id 00721157ae682-6eabf0290c6mr591907b3.4.1730881843278; Wed, 06 Nov 2024
 00:30:43 -0800 (PST)
Date: Wed,  6 Nov 2024 00:30:33 -0800
In-Reply-To: <20241106083035.2813799-1-jingzhangos@google.com>
Mime-Version: 1.0
References: <20241106083035.2813799-1-jingzhangos@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241106083035.2813799-3-jingzhangos@google.com>
Subject: [PATCH v3 2/4] KVM: arm64: vgic-its: Clear DTE when MAPD unmaps a device
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
X-CRM114-CacheID: sfid-20241106_003045_134002_AF5E5134 
X-CRM114-Status: GOOD (  15.22  )
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

vgic_its_save_device_tables will traverse its->device_list to
save DTE for each device. vgic_its_restore_device_tables will
traverse each entry of device table and check if it is valid.
Restore if valid.

But when MAPD unmaps a device, it does not invalidate the
corresponding DTE. In the scenario of continuous saves
and restores, there may be a situation where a device's DTE
is not saved but is restored. This is unreasonable and may
cause restore to fail. This patch clears the corresponding
DTE when MAPD unmaps a device.

Co-developed-by: Shusen Li <lishusen2@huawei.com>
Signed-off-by: Shusen Li <lishusen2@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
Signed-off-by: Jing Zhang <jingzhangos@google.com>
---
 arch/arm64/kvm/vgic/vgic-its.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 2381bc5ce544..7c57c7c6fbff 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -1140,8 +1140,9 @@ static int vgic_its_cmd_handle_mapd(struct kvm *kvm, struct vgic_its *its,
 	u8 num_eventid_bits = its_cmd_get_size(its_cmd);
 	gpa_t itt_addr = its_cmd_get_ittaddr(its_cmd);
 	struct its_device *device;
+	gpa_t gpa;
 
-	if (!vgic_its_check_id(its, its->baser_device_table, device_id, NULL))
+	if (!vgic_its_check_id(its, its->baser_device_table, device_id, &gpa))
 		return E_ITS_MAPD_DEVICE_OOR;
 
 	if (valid && num_eventid_bits > VITS_TYPER_IDBITS)
@@ -1161,8 +1162,17 @@ static int vgic_its_cmd_handle_mapd(struct kvm *kvm, struct vgic_its *its,
 	 * The spec does not say whether unmapping a not-mapped device
 	 * is an error, so we are done in any case.
 	 */
-	if (!valid)
+	if (!valid) {
+		struct kvm *kvm = its->dev->kvm;
+		int dte_esz = vgic_its_get_abi(its)->dte_esz;
+		u64 val = 0;
+
+		if (KVM_BUG_ON(dte_esz != sizeof(val), kvm))
+			return -EINVAL;
+
+		vgic_write_guest_lock(kvm, gpa, &val, dte_esz);
 		return 0;
+	}
 
 	device = vgic_its_alloc_device(its, device_id, itt_addr,
 				       num_eventid_bits);
-- 
2.47.0.277.g8800431eea-goog


