Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD38BD36113
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 19:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFajokhhFV4XM1IVMgUFGnhvSX98bkK7pakRqkac4YA=; b=kHEXirhhS82v+8ZBN/TPQ0NA7R
	Vv9q103rR1ENTC5U6EZnm7OOuHf53dS2Oh+XavRFlm9KLFO9ydr62NB/peBBYWUM4hPQ7/5P/BbhE
	Xu8xNPqLIJN0+kcdACRjGXyQqL6+MEfEHaQxLHougxpv+XmkOymfbmA7Tq68iY3zRC+fwdBy/f7A8
	Fnjb/VFxdoEKAckuJUthPhqMqKSxLwj7CO7Rq1LISfHomh8r6Yekvfzwp3/KBgTV1PCzDdM+TjM/R
	BFOdrUAUS9I9cvUfLVX17Nt3BSZOAjJK7/Csv7BBJMw1CU9NG0xVvvQrDrFci2R69y7/d4KhEv3jY
	vMFtc8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PNV-00000000ZfP-0HZx;
	Tue, 05 Nov 2024 19:38:13 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PK3-00000000YoZ-2NNw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 19:34:40 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7203cdc239dso6994635b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 11:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730835278; x=1731440078; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BFajokhhFV4XM1IVMgUFGnhvSX98bkK7pakRqkac4YA=;
        b=nNYGKt+5dS9GBh7od+VQE5tYNr8tsXvYrNly6yvWadCfJojRCgmbp8rzGD4AOENbMb
         mgcBe1w1B1DrHFD1178ArnlG/YKog+zcAIHQ/Su4VIvq8KS2doGJ1gNfZ1V38D0Q59Fd
         XG2e2Yt+XV3lX6EvplAP80HOzvrvz1975zc2F/5qKuOPEKhrLTwbfGNcaWeNYlIJyWoa
         Ri8jrOX1LQiZIai8Hu28QwfvJYeO03pjkn+g2R41iwZ1LIhjAX1luMDVttP0krlnPd2z
         2Jtjd/657lo2Hwh1qBctfawqsbgF40ulC0ynRONIaBi+0DsFarsUXGRdDfJazG2rqkuM
         3GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730835278; x=1731440078;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFajokhhFV4XM1IVMgUFGnhvSX98bkK7pakRqkac4YA=;
        b=GwpGkQO8c8T0NHE6tjhO+65whjNcIe6roidQXggBKBPa1EhOw6lMn96adjcrbG2f6J
         Lvfa2Gm70quCYygOSiCYxqyFHFOgDHlJ5mquJMzJOGnRBKbbU0kkqIkzR9is/SWU9gqZ
         ZV4oSK2V239SKf7BXu/D20rkAmffO7//Mmvil0wBpEKkePdno9nBDaTeJY8RvO4SUDry
         WJ18rNzcSU8LSYIJaoWrOj3j4Ol8ZmSjy+HeGWDkjbKuqNy7UKnyY/YEWlZTainIZdMj
         aUscAQIXYl4VE2A+FaejyqyIdMAPHtcDC4nFKNHCVEYLrSpMmDUrOBduYVI/08mCEWyK
         2ohg==
X-Forwarded-Encrypted: i=1; AJvYcCW7/Ilohar0azVeyZzieNVOL5YLCpm/XQEVjq5lVjWcvX8+cddaw8k1jsVw2gVgHz/2kp6Cb2wqJgILxjLNiNTv@lists.infradead.org
X-Gm-Message-State: AOJu0YxpS14D83bNOK3M5EhXFnvmLZbK9DKrW8i5MICnEGDZoIlNxy/j
	9Gk2OzqPb8Yy0nf96NyT9R4isWPP+zJbNUvnoE5/IhLHjTOJWA9Wys+vsPGt5QyfYl0EHsi6e10
	4lIs+QOvQ1U8DSqhiim92rA==
X-Google-Smtp-Source: AGHT+IFs0jYQAmFSrOyPS5Iq6Vm6Duf7I7Iw8B4nNyWqeL8ps99nDwFFCl2y98EAYFGlrxHTSsLPk7Pni5p9u/hvxw==
X-Received: from jgzg.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c96f])
 (user=jingzhangos job=sendgmr) by 2002:a05:6a00:73a1:b0:71e:5b2b:991c with
 SMTP id d2e1a72fcca58-720ab661957mr65760b3a.5.1730835277696; Tue, 05 Nov 2024
 11:34:37 -0800 (PST)
Date: Tue,  5 Nov 2024 11:34:20 -0800
In-Reply-To: <20241105193422.1094875-1-jingzhangos@google.com>
Mime-Version: 1.0
References: <20241105193422.1094875-1-jingzhangos@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241105193422.1094875-3-jingzhangos@google.com>
Subject: [PATCH v1 2/4] KVM: arm64: vgic-its: Add a dummy DTE/ITE if necessary
 in ITS tables save operation
From: Jing Zhang <jingzhangos@google.com>
To: KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.linux.dev>, 
	ARMLinux <linux-arm-kernel@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Colton Lewis <coltonlewis@google.coma>, Raghavendra Rao Ananta <rananta@google.com>, 
	Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_113439_697932_2ABA3FCD 
X-CRM114-Status: GOOD (  24.84  )
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

In device tables/ITTs, DTEs/ITEs are implemented as a static single
linked list. But the head of the list might not be the first DTE/ITE in
the table. That's why in the restore operation, the DTs/ITTs have to be
scanned to find the first valid DTE/ITE (head of the list).
Add a dummy DTE/ITE in the first entry of the table if the first entry
doesn't have a valid DTE/ITE. This dummy DTE/ITE points to the first
valid DTE/ITE if there is a valid one.
This change paves the way for future incoming changes which will utilize
the fixed head the DTE/ITE list to avoid scanning uncessary table
entries.

No functional change intended.

Signed-off-by: Jing Zhang <jingzhangos@google.com>
---
 arch/arm64/kvm/vgic/vgic-its.c | 56 ++++++++++++++++++++++++++++++++--
 arch/arm64/kvm/vgic/vgic.h     |  6 ++++
 2 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index ba945ba78cc7..953af024d94a 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2176,10 +2176,12 @@ static int vgic_its_ite_cmp(void *priv, const struct list_head *a,
 static int vgic_its_save_itt(struct vgic_its *its, struct its_device *device)
 {
 	const struct vgic_its_abi *abi = vgic_its_get_abi(its);
+	struct its_ite *ite, *first_ite = NULL;
+	struct kvm *kvm = its->dev->kvm;
 	gpa_t base = device->itt_addr;
-	struct its_ite *ite;
-	int ret;
 	int ite_esz = abi->ite_esz;
+	u64 val = 0;
+	int ret;
 
 	list_sort(NULL, &device->itt_head, vgic_its_ite_cmp);
 
@@ -2198,7 +2200,24 @@ static int vgic_its_save_itt(struct vgic_its *its, struct its_device *device)
 		ret = vgic_its_save_ite(its, device, ite, gpa, ite_esz);
 		if (ret)
 			return ret;
+
+		if (!first_ite)
+			first_ite = ite;
 	}
+
+	/*
+	 * As for DTEs, add a dummy ITE if necessary for ITT to avoid uncessary
+	 * sanning in the store operation.
+	 */
+	if (first_ite && first_ite->event_id)
+		val = (u64)first_ite->event_id << KVM_ITS_ITE_NEXT_SHIFT;
+
+	if (!first_ite || first_ite->event_id) {
+		val |= KVM_ITS_ENTRY_DUMMY_MAGIC << KVM_ITS_ENTRY_DUMMY_SHIFT;
+		val = cpu_to_le64(val);
+		vgic_write_guest_lock(kvm, base, &val, ite_esz);
+	}
+
 	return 0;
 }
 
@@ -2328,8 +2347,11 @@ static int vgic_its_save_device_tables(struct vgic_its *its)
 {
 	const struct vgic_its_abi *abi = vgic_its_get_abi(its);
 	u64 baser = its->baser_device_table;
-	struct its_device *dev;
+	struct its_device *dev, *first_dev = NULL;
+	struct kvm *kvm = its->dev->kvm;
 	int dte_esz = abi->dte_esz;
+	gpa_t dummy_eaddr;
+	u64 val = 0;
 
 	if (!(baser & GITS_BASER_VALID))
 		return 0;
@@ -2351,7 +2373,35 @@ static int vgic_its_save_device_tables(struct vgic_its *its)
 		ret = vgic_its_save_dte(its, dev, eaddr, dte_esz);
 		if (ret)
 			return ret;
+
+		if (!first_dev)
+			first_dev = dev;
 	}
+
+	/*
+	 * The valid DTEs in the device table are linked with a static single
+	 * linked list, but the list head is not always the first DTE. That's
+	 * why the restore operation has to scan the device table from the first
+	 * entry all the time.
+	 * To avoid the uncessary scanning in the restore operation, if the
+	 * first valid DTE is not the first one in the table, add a dummy DTE
+	 * with valid bit as 0 pointing to the first valid DTE.
+	 * This way, the first DTE in the table is always the head of the DTE
+	 * list. It is either a valid DTE or a dummy DTE (V= 0) pointing to the
+	 * first valid DTE if there is a valid DTE in the table.
+	 */
+	if (first_dev && first_dev->device_id)
+		val = (u64)first_dev->device_id << KVM_ITS_DTE_DUMMY_NEXT_SHIFT;
+
+	if (!first_dev || first_dev->device_id) {
+		if (!vgic_its_check_id(its, baser, 0, &dummy_eaddr))
+			return -EINVAL;
+
+		val |= KVM_ITS_ENTRY_DUMMY_MAGIC << KVM_ITS_ENTRY_DUMMY_SHIFT;
+		val = cpu_to_le64(val);
+		vgic_write_guest_lock(kvm, dummy_eaddr, &val, dte_esz);
+	}
+
 	return 0;
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index f2486b4d9f95..93314f249343 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -86,6 +86,12 @@
 #define KVM_ITS_L1E_VALID_MASK		BIT_ULL(63)
 /* we only support 64 kB translation table page size */
 #define KVM_ITS_L1E_ADDR_MASK		GENMASK_ULL(51, 16)
+/* Macros for dummy ITE/DTE */
+#define KVM_ITS_ENTRY_DUMMY_SHIFT	0
+#define KVM_ITS_ENTRY_DUMMY_MASK	GENMASK_ULL(15, 0)
+#define KVM_ITS_ENTRY_DUMMY_MAGIC	0xdafe
+#define KVM_ITS_DTE_DUMMY_NEXT_SHIFT	16
+#define KVM_ITS_DTE_DUMMY_NEXT_MASK	GENMASK(48, 16)
 
 #define KVM_VGIC_V3_RDIST_INDEX_MASK	GENMASK_ULL(11, 0)
 #define KVM_VGIC_V3_RDIST_FLAGS_MASK	GENMASK_ULL(15, 12)
-- 
2.47.0.199.ga7371fff76-goog


