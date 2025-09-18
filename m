Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022DCCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 18:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6AFtYNgzFlGUfnCDw9OHKWnsFrL+D8ATC1/qMSs/P0E=; b=TCxtP3jiHCd6k1noTfFPwNK7CQ
	LB+TySEoJyfsKdggmksu24BSiFfy889kCcMBhg8HfUeVjYF1+aDZBWYa4lBH+nliB6oiWbMjWO89T
	9LXk9OGXdP5KZhjBkjfNmzm8sdik02YPwj3K33i9qrnYw/y2t2PBJFipOevIEu3SgI1envfyIR3LV
	I0kJj/m5NmdER+Pwp7CwiHiYSOm41ESpjRlXrc0NObbjJolQD7jztKf0ge/yB1rNa6cPlJgcHENI3
	+LtfvGQ2WUOa/wAmM3TRsSZk92KPrZeebYAMip+cZMC3M1N3EQ0bpQTkAzdCLVelXDqq5H19xgPmp
	zxtcmP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIwy-00000000pNy-2nkJ;
	Thu, 18 Sep 2025 18:01:44 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzIwv-00000000pNN-3fWV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 18:01:42 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45f2c41c819so8383035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 11:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758218498; x=1758823298; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6AFtYNgzFlGUfnCDw9OHKWnsFrL+D8ATC1/qMSs/P0E=;
        b=O6K6b5MXzMLS2SyR1qBf79Rwe4EyPJR3Sy3MN2xSb6ZH2zuZvFEzHq9AubZV9ltRE0
         rimENKc0wL/SdjgzFDqWeg9ylWia8SouG5w2+rugm5y9J83mueSc1ip0Uq2f2+wdIhEZ
         wJN1fQUvT7fQZZhl/YgLu1QOKu/UPXYV+r4vnqhk87oayRBNVVcJoA7sCl5n+PDsRib7
         VWee1Yy5w2y40qpKxH7Z6Q5C1sykjp97bVYRraVPV63e85SIZjFc1Yu2kyNOu/ZMeuON
         iqZpmRZArngIz2uke+3gcOeibSN/tmpwjBKas5/+Zl6XkJCOSLiW/s1Biu5GBQ6Q6bob
         dt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758218498; x=1758823298;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6AFtYNgzFlGUfnCDw9OHKWnsFrL+D8ATC1/qMSs/P0E=;
        b=Xv7FCU4vPrVfdq/eCr7uDOR05GPnR9Jjn3IhNq/fxvV0anF4FP6mNkH/HmPU4e6HaU
         ht1bojnpBk6987XE3a5y6z9pB4j0kBxcluuRtB1fsnHuMJAICXskP7hRKc8f2y598sxy
         682H5XukoRBI9VIrsfs2Iou0IoTLDfRpPVnVLEU6uM2pC5sKHzlptdQUQ/7bmN9TyVuA
         30Yp/CLlhfIhQC0EF3YgpRYFyX3ayG1QHq42M/Ai6/gOfcGa09MpXBX1ZAKhaQ0jGfRX
         bdZpbhhU0AqGiHf5MTuyMbp+SkFOIX2wyY+NIoqj0q0JWl3l3rD8kxUCo78JSTWeUx6j
         IMvw==
X-Forwarded-Encrypted: i=1; AJvYcCUqdQPnzQQvObTUFJtWOFaW3ISCcwry/aSdfsVCEWDVkmyy8xA03HIRJi/DDatwDLfVhZzMuOyULpRfsvhQctcw@lists.infradead.org
X-Gm-Message-State: AOJu0YyN7Kg78m/wbnnR4Cz0/Fq5VaAgcSw0ykd5YkRoamWrIbS2EpDB
	aTvZqDOQw+OUW5mY8WlKVY7K28LRLg8h2I7VoiMXvGv1uyQMYQQVPpAO1oAwMZwYaCSTULea9ga
	za7Il9/AJb8M3myET+E2D2Q==
X-Google-Smtp-Source: AGHT+IE0s3mgC68bYqXT2U/+o4HoYc6G5jDuhQVBgFNX5eIHGXZ+lKBwfO0ohqVmckXSTclutoo8kufdndZGfzQr
X-Received: from wmqd2.prod.google.com ([2002:a05:600c:34c2:b0:45f:29ca:4f27])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4451:b0:459:db69:56bd with SMTP id 5b1f17b1804b1-467ead682c5mr1151005e9.20.1758218498702;
 Thu, 18 Sep 2025 11:01:38 -0700 (PDT)
Date: Thu, 18 Sep 2025 19:00:49 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
Message-ID: <20250918180050.2000445-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: Validate input range for pKVM mem transitions
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, sebastianene@google.com, keirf@google.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_110141_922902_6D1CCB9A 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
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

There's currently no verification for host issued ranges in most of the
pKVM memory transitions. The subsequent end boundary might therefore be
subject to overflow and could evade the later checks.

Close this loophole with an additional range_is_valid() check on a per
public function basis.

host_unshare_guest transition is already protected via
__check_host_shared_guest(), while assert_host_shared_guest() callers
are already ignoring host checks.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 8957734d6183..b156fb0bad0f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -443,6 +443,11 @@ static bool range_is_memory(u64 start, u64 end)
 	return is_in_mem_range(end - 1, &r);
 }
 
+static bool range_is_valid(u64 start, u64 end)
+{
+	return start < end;
+}
+
 static inline int __host_stage2_idmap(u64 start, u64 end,
 				      enum kvm_pgtable_prot prot)
 {
@@ -776,6 +781,9 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 	void *virt = __hyp_va(phys);
 	int ret;
 
+	if (!range_is_valid(phys, phys + size))
+		return -EINVAL;
+
 	host_lock_component();
 	hyp_lock_component();
 
@@ -804,6 +812,9 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 	u64 virt = (u64)__hyp_va(phys);
 	int ret;
 
+	if (!range_is_valid(phys, phys + size))
+		return -EINVAL;
+
 	host_lock_component();
 	hyp_lock_component();
 
@@ -887,6 +898,9 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages)
 	u64 size = PAGE_SIZE * nr_pages;
 	int ret;
 
+	if (!range_is_valid(phys, phys + size))
+		return -EINVAL;
+
 	host_lock_component();
 	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (!ret)
@@ -902,6 +916,9 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
 	u64 size = PAGE_SIZE * nr_pages;
 	int ret;
 
+	if (!range_is_valid(phys, phys + size))
+		return -EINVAL;
+
 	host_lock_component();
 	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED);
 	if (!ret)
@@ -949,6 +966,9 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 	if (ret)
 		return ret;
 
+	if (!range_is_valid(phys, phys + size))
+		return -EINVAL;
+
 	ret = check_range_allowed_memory(phys, phys + size);
 	if (ret)
 		return ret;

base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
-- 
2.51.0.470.ga7dc726c21-goog


