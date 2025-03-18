Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D44C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zO3ZzM+RurQ0HVvhTyBHJz7UiXcbKFmS1I/Hti/J8oU=; b=oVHvSquhDmb0thSAY8g/NgkxUc
	/lHKv07y2o0OAHDtBX3tXMfOwvGN2TNjN1V253B24f9P7+jgtSjuIuxxD579SvXm9MHY1PTZprAOg
	rYIRAl8EOYPNhh3KA1RsvFOaK8r6Ux5gHB4mb74XVEDSMgzZ5Z/x78zVNit35xLIHGXRT/bW/wy1S
	O5CQ0bQlLmoQqlkYsAhAetq5Wzb7M1VLag9vFD6nVXlMCZ4Y4infG7KiXDnKp+1OxQGj/C8AOAJU4
	WWHApsNqGxC6hHSl5UMwYIN+meqmnXGCRUFKdh1Opdr7OzQxmZn44XbmAc77Itj/ukutqztyFDup5
	SZ8C+kow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tua3c-00000006a3b-38nH;
	Tue, 18 Mar 2025 16:44:48 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZl4-00000006WXP-0WCg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:25:39 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43d025a52c2so25180195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 09:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742315136; x=1742919936; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zO3ZzM+RurQ0HVvhTyBHJz7UiXcbKFmS1I/Hti/J8oU=;
        b=DdRKUCt7IbEVEsZtxH2/IsXmQLB9WOJbc+d2PjEzLJj8+P7CqFvidKASu+0r0jwWZd
         af+AAWZM6RZ4vYbenXJy28ClvUbhKsW4CH9kdPSatIkmhkKRH5urbexSeq9zl8H0jL5x
         2k8GZ58NWRMSJxvd0W1yv5FX3eo++Alq/Ha7O0d9Yn2p0Ltd7cpNbcyVWyD+2eDI+g5B
         I2Z4c9lySIwLjqLPDvapwFeUnF9Gn+NQ9YfGBsanmRn5OAnwBDS06+8mgOLwlLEvcRRf
         XODhU9iVyV359WiWw7z6XLrZ3N7XxJBs/PJKy22y9EwsC/u7qWd6WfZiknSQmL8XZqrA
         Ej+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742315136; x=1742919936;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zO3ZzM+RurQ0HVvhTyBHJz7UiXcbKFmS1I/Hti/J8oU=;
        b=wWSLCvLdXzYBB9tO4iB6bWTVw4Vs0Ty1S0wWDuKZdnuSipunfTK20G3frR4vuJrpJC
         TDyxcfqurprpIXyFwJeUSE/82oPnxUc7ReWd86YiguKY5thHlTRh5P1XiDg2XeIgdOap
         CnOmJQsGZdS1vtaAGKAgqJ/IEXEuniwlWQqdzwVmPfTffTFMVUNE0FN/+95AJUQg8nev
         N/vuucw7j57Q3h1KGk83XvnGyEUuDgjuKNAtNKRwYepaiJF8CEB2t+UX4e5LZCPk44Ck
         /686EgB45B2CKl4QJW0hb5hknb9YazzX/3k6rUbHEGi3ffFHwvXvabSaL7bQdF3qXpTj
         h6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWcFOPopHU410L4E7v+L0E8XrP2nHXUgcTIDhaJouHdxJMzd3GBWsmbR2HfW/K9fykRNT3lSQMo+iC3M+IhnJW9@lists.infradead.org
X-Gm-Message-State: AOJu0YwLCB3xr4rsoNG0K3WL3wrzyTsutnXgVDcyREOTGboiFUzJMU2B
	/KWOPhkLTc2BFqlR1ps4dvdEAMuNt35Y+lbjknq6clgzgo1DSztYml5o4uVyYMZvnSZdXwmz3c7
	kUmWbp2JZNjne4RUTkAyEerMkWg==
X-Google-Smtp-Source: AGHT+IHi1UgeMel0/A+rXKxvMkXf6AY2s0C2/6FsLbf6+yhSlW/MgJVCp1Jp/o/iLc/G34hYG7cfGijEvYJBHA3IS0U=
X-Received: from wmbbd27.prod.google.com ([2002:a05:600c:1f1b:b0:43d:4055:98e3])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:470e:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-43d3b9dc569mr30076925e9.30.1742315136406;
 Tue, 18 Mar 2025 09:25:36 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:25:10 +0000
In-Reply-To: <20250318162510.3280359-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20250318162510.3280359-1-sebastianene@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318162510.3280359-4-sebastianene@google.com>
Subject: [PATCH v3 3/3] KVM: arm64: Release the ownership of the hyp rx buffer
 to Trustzone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Andrei Homescu <ahomescu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_092538_160124_B34919D4 
X-CRM114-Status: GOOD (  14.82  )
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

Introduce the release FF-A call to notify Trustzone that the hypervisor
has finished copying the data from the buffer shared with Trustzone to
the non-secure partition.

Reported-by: Andrei Homescu <ahomescu@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 9 ++++++---
 include/linux/arm_ffa.h       | 3 +++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 6df6131f1107..ac898ea6274a 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -749,6 +749,7 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
 	DECLARE_REG(u32, uuid3, ctxt, 4);
 	DECLARE_REG(u32, flags, ctxt, 5);
 	u32 count, partition_sz, copy_sz;
+	struct arm_smccc_res _res;
 
 	hyp_spin_lock(&host_buffers.lock);
 	if (!host_buffers.rx) {
@@ -765,11 +766,11 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
 
 	count = res->a2;
 	if (!count)
-		goto out_unlock;
+		goto release_rx;
 
 	if (hyp_ffa_version > FFA_VERSION_1_0) {
 		/* Get the number of partitions deployed in the system */
-		if (flags & 0x1)
+		if (flags & PARTITION_INFO_GET_RETURN_COUNT_ONLY)
 			goto out_unlock;
 
 		partition_sz  = res->a3;
@@ -781,10 +782,12 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
 	copy_sz = partition_sz * count;
 	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
 		ffa_to_smccc_res(res, FFA_RET_ABORTED);
-		goto out_unlock;
+		goto release_rx;
 	}
 
 	memcpy(host_buffers.rx, hyp_buffers.rx, copy_sz);
+release_rx:
+	ffa_rx_release(&_res);
 out_unlock:
 	hyp_spin_unlock(&host_buffers.lock);
 }
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 850577edadbc..32e235a2bedf 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -223,6 +223,9 @@ extern const struct bus_type ffa_bus_type;
 /* The FF-A 1.0 partition structure lacks the uuid[4] */
 #define FFA_1_0_PARTITON_INFO_SZ	(8)
 
+/* Return the count of partitions deployed in the system */
+#define PARTITION_INFO_GET_RETURN_COUNT_ONLY	(1)
+
 /* FFA transport related */
 struct ffa_partition_info {
 	u16 id;
-- 
2.49.0.rc1.451.g8f38331e32-goog


