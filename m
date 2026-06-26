Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFEBC44518
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 13:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M7qA3QCgngkwupOanC4fj5zvyRgNy6GXvi+NFYgoU0Q=; b=bgiHlz4PDpMVKVmwu+bVZ+FYle
	nbIQjLUETnU2m4SIh/LJs/HC7GJBWuv4nnmKbCbMXUK+kNNa/n07Rei2nmT02DDfuWWmCm6AIeH2r
	C1gnNm/26myZc3uXS6QSb7IRUagKq2MGaaZNIAsAzpcXQ4yOO32+vsh4toq3Dqqzj+fM5M/TuVoSq
	jXx2XPtMbh09zQ5yhhvdT/5WvTQmWRsMLFqzdF4IZAuRyDV0IDgmSCjmdTr332t+6rMEEqO9kehit
	9UdYw9dIDQuIskhi7Pu3RcDhH/3NcoqaiYhi9iQvPk7fZLdFWhGvSNtecxtcnsEN9gUqR/a/PflTg
	AAMnphWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6pF-0000000BQ4z-1vbL;
	Fri, 26 Jun 2026 13:42:33 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6pB-0000000BQ3R-3JRz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 13:42:31 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5aa624ff3cbso895127e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 06:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782481347; x=1783086147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M7qA3QCgngkwupOanC4fj5zvyRgNy6GXvi+NFYgoU0Q=;
        b=XkmSrGer+zCeDokp7b8aUtMN+1cajFETpcgK/Q0KolIkCuYK0b732oPxeGr4nkwszh
         uDx8W7Xqxz3LvE3+g/gfRq9v1Ae0E59E+h6X9Oa7cYS8ZjFh40YbedHtquG9CFpNVU2d
         oGfQIlh8plhpPsosFTaj2J5RUzGTUNiEXNSzSS3t7IIPLOGVTvtgTzxadhUF8HiJ+8le
         XpA0rWeGL/CmE2OgfE014kzHUkvtR6zGD+3pEN0D7yuCehd9//HtY7apjLYcCQg2IV0K
         a/NjsA+bLuiL8L9padgljJ4+Y7RcZS2vFkIEv2f3VlCOZD69JTRbY02Bou36KeejafqS
         1PXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782481347; x=1783086147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7qA3QCgngkwupOanC4fj5zvyRgNy6GXvi+NFYgoU0Q=;
        b=ZzttT0F57C47GGtbLIY7RMjJ9czF6L0qNcmPNGWNYASzhh0ElVOiDtXEvU+jVHVyDH
         13ujMAJs5glkWz/gYYpds9pq2UbYvI+71wwrecilwwW3DpFS6czeUFOCYymhDHg2Ju2r
         LzJrNXx0NEIRUhHpyVKIXn7pwwg8cQXkJj8DZ3zcflzLBRgdDkBcsQV7K+e6Y6Yu1d7a
         CUVNOFez3HHMD8L2gn+uknO8vnCHkiLGaBjBXT/7+lhdC71K8AaYz4RQfB18Xor1Tlgm
         1o5qVQrDVmszQQmCP+9MlAG+HOq0EzbMi5wrQBoqd/Mr8W9ZwuFPUuC+pe8pFJKW3AHh
         cliQ==
X-Forwarded-Encrypted: i=1; AHgh+RojpejxAJ/pyiUIUFXwRpods4R0zs+LzYWoZPNkR43WEfZMKcHgQd6q/qE30koh1xhky2Ad7YvN66bfQwIIhT6o@lists.infradead.org
X-Gm-Message-State: AOJu0YwwOGY+nX7Upj1cv7L/fBuCLjSWBvolI3YrWllglJ5R9IAn2vhm
	FDgdEWAUiWinwqD21qS4BaMv0d9IlfitYEADbEYky2zTN9L9vj3NxM8P
X-Gm-Gg: AfdE7ck2KFCaRXI2qQBWOf480hQdsFJHbYQw/t3aYXsvzQfoCSdFJkUg096gTqhOBF2
	UgqH+7OCeKnoam+VjERU3tdaJAjZ1sQkXJocS1PrhOGEYyaGfWZbPztbwrDxzxIa3lLu7Scp2Hz
	ddPB6T3qI4Ipoc93hhX5CxXWVv2jidbtT9a44848MPalNDtsJoQSuLX56zI4jyhBInvgS1FvRDd
	CvT0P532qg7rV6xCNalGX6Sfqxi5Md15E+jdk/b4c9Hr4y6Z6PNl/3uXhlS64yoa5LhRYHYxceA
	uhez9yis+Z8ofkvdSKwgX3kbKiQpcla1aKUdRVhn3b9lDbO8l5uhHOQHFbQIn/7ef3IW+OCj0nw
	xwurGy7S4hlSXcmJGT5w7hk7IuhQHJwHI9hUIyxuyeGNJZJ1vA3wVroPARwa+GLLmn2Q1jfnNTQ
	5UhGAT8DMIJtwfIswnJScE/vKIsNAg
X-Received: by 2002:a05:6512:2521:b0:5aa:68cd:8367 with SMTP id 2adb3069b0e04-5aea1f51f08mr1686486e87.37.1782481347149;
        Fri, 26 Jun 2026 06:42:27 -0700 (PDT)
Received: from grower.astra-academy.ru ([185.32.135.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69580fcbsm3476839e87.67.2026.06.26.06.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 06:42:26 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Martyniuk <alexevgmart@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oupton@kernel.org>,
	Hyunwoo Kim <imv4bel@gmail.com>
Subject: [PATCH 6.12] KVM: arm64: Take the SRCU lock for page table walks in fault injection and AT emulation
Date: Fri, 26 Jun 2026 16:42:07 +0300
Message-ID: <20260626134210.228892-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_064229_856136_B5CDAF66 
X-CRM114-Status: GOOD (  11.26  )
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

From: Hyunwoo Kim <imv4bel@gmail.com>

commit f2ca45b50d4216c9cc7ffabf50d9ad1932209251 upstream.

walk_s1() and kvm_walk_nested_s2() expect to be called while holding
kvm->srcu to guard against memslot changes. While this is generally
the case, __kvm_at_s12() and __kvm_find_s1_desc_level() call into the
respective walkers without taking kvm->srcu.

Fix by acquiring kvm->srcu prior to the table walk in both instances.

Cc: stable@vger.kernel.org
Fixes: 50f77dc87f13 ("KVM: arm64: Populate level on S1PTW SEA injection")
Fixes: be04cebf3e78 ("KVM: arm64: nv: Add emulation of AT S12E{0,1}{R,W}")
Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
Reviewed-by: Oliver Upton <oupton@kernel.org>
Link: https://patch.msgid.link/aiAZfdeyanIvP8SD@v4bel
Signed-off-by: Marc Zyngier <maz@kernel.org>
[Alexander: __kvm_find_s1_desc_level() not present, patching only __kvm_at_s12()]
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
 arch/arm64/kvm/at.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 39f0e87a340e..8192bc0bbc87 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1087,7 +1087,8 @@ void __kvm_at_s12(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	/* Do the stage-2 translation */
 	ipa = (par & GENMASK_ULL(47, 12)) | (vaddr & GENMASK_ULL(11, 0));
 	out.esr = 0;
-	ret = kvm_walk_nested_s2(vcpu, ipa, &out);
+	scoped_guard(srcu, &vcpu->kvm->srcu)
+		ret = kvm_walk_nested_s2(vcpu, ipa, &out);
 	if (ret < 0)
 		return;
 
-- 
2.43.0


