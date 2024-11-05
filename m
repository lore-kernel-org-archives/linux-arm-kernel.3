Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F1DD36119
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 19:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rG28HMeFmKNz149Y+Vw5VAUYNp3YmfGstywpzoeBNY=; b=ttA+xYlOmGK+9EsW2Jr2WWj2KR
	oxYQXLvsMba3LllZbnAs4tbg3lX7Jlmp5f+aBpIK391yDvlGedz9m/UZMs6Fpild3b/vyUskZqGjY
	zIld/msO6dOrKcjCiJdM2ocj4WQh5vGXAPArN8YWMeBDiERx+k9928oxlmwvParIf4hR8YACOTBrY
	HkFFOMYSEvd5WmkFiSseETqnTrlbibhds0ivmb4HPTFrkzhAfSqzeYFfinyblFgurjIgVv7erWxgs
	koOi4/D4gyg9JMucSqzgmbOfz6IarjHbESDVhJ7R4nwtfjuu1H6Oxc22/7jx6dU4jiwfof2FM77WS
	/Cb8DlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PSX-00000000aX0-31LG;
	Tue, 05 Nov 2024 19:43:25 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PK7-00000000Yps-2a5x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 19:34:45 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea8794f354so61460377b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 11:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730835281; x=1731440081; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rG28HMeFmKNz149Y+Vw5VAUYNp3YmfGstywpzoeBNY=;
        b=AfOy4Xwut5NJ18eM4fORDtT534bDm17eCBf1lXT4NDTgCDHGdbMxPhujMXr+C62xHH
         1vZvwyXNd02mBHPamFw8+Gqh8tzlP8TrBXSCk7x/SnK5VaZIIlqPn7Ghbmzu0ZiYJj9I
         t3wfwFLu3yzA0XnQZxhTuYG9vfCw0k+0DcSk3WAeNoz+Xw/60VHWAAw5ryZelvgUVPRv
         n/xC/Gldd2D1JQhCXXUn03Z5/fRxLlS5kyrao0SxGWqKErYa9htBroh6L62ANNEuTLhb
         TB8bIAmrfvqDOTjKM69i3gCoZVWmrZjHnmR1/5pS9D9qNzSLQq7DjyeW+BstSS4TxmyE
         wRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730835281; x=1731440081;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rG28HMeFmKNz149Y+Vw5VAUYNp3YmfGstywpzoeBNY=;
        b=rdYP+4GQ/NKmLG9Fh7KusfijJjC1q3svtY6IIdC78KU6TedJKMHiiEXIu4MbiDwABR
         WJl6A5vqYGlLX3gsvJk5qdD7GnAsgPRS0n8FhpV1n3DI0WvorMGnHG1qufjn0B6CUPfA
         onv23TQ1iSRF8XhAU4E/R5bh/HUnzPPzigHrcfOeacK31nU5i5wQ9FzkP82FCgTor/Y5
         BNMbp8p/auQaT/ltr3Z9QLwwkVQeHUa1P5dlpshvryit7lydGK8Awmg9NJtjV8fPalxZ
         QQonUWix3sRRIrlIz2/akFxW10TDnz2ck9k4eM/8NYOxnzJ5FPn3Rw8ehahsx2ctTVDL
         4s+w==
X-Forwarded-Encrypted: i=1; AJvYcCV4qJT8J421+3+amF4HKA6mZnYTsn14qlNqfOBCG1G25x+QfhzCEfTUwRMmI/eXRCqKUcoPmBpBguniJAhSM99P@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9zG0iizxz5yWteBnPnoWWC1ab8bGZgXye1aGiZUf3rd1KT7Cs
	ISAQWqCNXGerojoSHKkj/UX5z7tNrugwkkFQfxYbrwzfOeoGT3ydZlqMma8u1ZcoYuehc0JvdBy
	itFsH7Vtw7VjfyG9YHp8uHA==
X-Google-Smtp-Source: AGHT+IHSwjlYAEmxZvE3K18uqtu/bNQVHl4DA7qztn64qZnoHG833wnp2QKrs1chSkfAHMYdTQ7wPLIAKTndfwX+xQ==
X-Received: from jgzg.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c96f])
 (user=jingzhangos job=sendgmr) by 2002:a25:d616:0:b0:e29:76b7:ed37 with SMTP
 id 3f1490d57ef6-e3302669387mr18225276.9.1730835281208; Tue, 05 Nov 2024
 11:34:41 -0800 (PST)
Date: Tue,  5 Nov 2024 11:34:22 -0800
In-Reply-To: <20241105193422.1094875-1-jingzhangos@google.com>
Mime-Version: 1.0
References: <20241105193422.1094875-1-jingzhangos@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241105193422.1094875-5-jingzhangos@google.com>
Subject: [PATCH v1 4/4] KVM: arm64: vgic-its: Utilize the dummy entry in ITS
 tables restoring
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
X-CRM114-CacheID: sfid-20241105_113443_914932_8EAF9E76 
X-CRM114-Status: GOOD (  17.12  )
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

Now, the first entry in tables is either a valid DTE/ITE or a dummy
entry pointing to the first valid DTE/ITE. Revise the DTE/ITE restore
process to utilize the dummy entry to avoid unnecessary (erroneous)
entry scanning.
This is not supposed to break the ITS table ABI REV0.

Signed-off-by: Jing Zhang <jingzhangos@google.com>
---
 arch/arm64/kvm/vgic/vgic-its.c | 46 ++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 867cc5d3521d..e07939613f5c 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2129,23 +2129,30 @@ static int vgic_its_restore_ite(struct vgic_its *its, u32 event_id,
 	u32 coll_id, lpi_id;
 	struct its_ite *ite;
 	u32 offset;
+	u32 magic;
 
 	val = *p;
 
 	val = le64_to_cpu(val);
 
-	coll_id = val & KVM_ITS_ITE_ICID_MASK;
 	lpi_id = (val & KVM_ITS_ITE_PINTID_MASK) >> KVM_ITS_ITE_PINTID_SHIFT;
 
-	if (!lpi_id)
-		return event_id + 1; /* invalid entry, no choice but to scan next entry */
+	offset = val >> KVM_ITS_ITE_NEXT_SHIFT;
+	if (event_id + offset >= BIT_ULL(dev->num_eventid_bits))
+		return -EINVAL;
+
+	if (!lpi_id) {
+		magic = (val & KVM_ITS_ENTRY_DUMMY_MASK) >> KVM_ITS_ENTRY_DUMMY_SHIFT;
+		if (magic != KVM_ITS_ENTRY_DUMMY_MAGIC)
+			offset = 1;
+
+		return event_id + offset;
+	}
 
 	if (lpi_id < VGIC_MIN_LPI)
 		return -EINVAL;
 
-	offset = val >> KVM_ITS_ITE_NEXT_SHIFT;
-	if (event_id + offset >= BIT_ULL(dev->num_eventid_bits))
-		return -EINVAL;
+	coll_id = val & KVM_ITS_ITE_ICID_MASK;
 
 	collection = find_collection(its, coll_id);
 	if (!collection)
@@ -2303,17 +2310,30 @@ static int vgic_its_restore_dte(struct vgic_its *its, u32 id,
 	u64 entry = *(u64 *)ptr;
 	bool valid;
 	u32 offset;
+	u32 magic;
 	int ret;
 
 	entry = le64_to_cpu(entry);
 
 	valid = entry >> KVM_ITS_DTE_VALID_SHIFT;
-	num_eventid_bits = (entry & KVM_ITS_DTE_SIZE_MASK) + 1;
-	itt_addr = ((entry & KVM_ITS_DTE_ITTADDR_MASK)
-			>> KVM_ITS_DTE_ITTADDR_SHIFT) << 8;
 
-	if (!valid)
-		return id + 1;
+	/*
+	 * Since we created a dummy head entry for the DTE static linked list in
+	 * the table if necessary, no need to scan to find the list head.
+	 * But if the saved table was done without dummy entry support, we still
+	 * have to scan one by one.
+	 */
+	if (!valid) {
+		magic = (entry & KVM_ITS_ENTRY_DUMMY_MASK) >>
+			KVM_ITS_ENTRY_DUMMY_SHIFT;
+		if (magic != KVM_ITS_ENTRY_DUMMY_MAGIC)
+			offset = 1;
+		else
+			offset = (entry & KVM_ITS_DTE_DUMMY_NEXT_MASK) >>
+				  KVM_ITS_DTE_DUMMY_NEXT_SHIFT;
+
+		return id + offset;
+	}
 
 	/* dte entry is valid */
 	offset = (entry & KVM_ITS_DTE_NEXT_MASK) >> KVM_ITS_DTE_NEXT_SHIFT;
@@ -2321,6 +2341,10 @@ static int vgic_its_restore_dte(struct vgic_its *its, u32 id,
 	if (!vgic_its_check_id(its, baser, id, NULL))
 		return -EINVAL;
 
+	num_eventid_bits = (entry & KVM_ITS_DTE_SIZE_MASK) + 1;
+	itt_addr = ((entry & KVM_ITS_DTE_ITTADDR_MASK)
+			>> KVM_ITS_DTE_ITTADDR_SHIFT) << 8;
+
 	dev = vgic_its_alloc_device(its, id, itt_addr, num_eventid_bits);
 	if (IS_ERR(dev))
 		return PTR_ERR(dev);
-- 
2.47.0.199.ga7371fff76-goog


