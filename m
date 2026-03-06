Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5EEF0183E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KT44YeiLTJyOwAcprGitUZ5uZxYG91k2apEts1OjnSo=; b=YDxAwY+8aws/pLe2RbQWLZ0uwf
	AHVb2o5c2rjuhfgivctJzH5WFWC7+F3beeDmSelUqkHCo1cMo/d9de7QnIO9uVKTlt1fLeoHcR59r
	4mfUK9wx3zjMTJ2I3B/xwkuVBLHdnh03bv3+wpqyYS6Mc7VRGRXow+rtceszJO8ELLaU4+nvKuYWZ
	diBx7dNbdc+4Vm/A5prsu94tZePbuXre9lRN96WNwzXVvflvsy4bUZbyo9XitoZq39lrP72h+Qzn0
	2Qv+64AM9BnJxJIG0c9ZvbItyHbosRJASUmLWKyl9su/wqWZtGOyBCWZNSb7zWeXoVMylTmAuvDr1
	7X+uuvgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlR-00000003qE5-1nit;
	Fri, 06 Mar 2026 14:02:49 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlN-00000003q7D-1m9D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:02:46 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b938cb02038so217543766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772805763; x=1773410563; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KT44YeiLTJyOwAcprGitUZ5uZxYG91k2apEts1OjnSo=;
        b=WuRJlMeR98cGa1TjZtDrWErPxXd5kqUzNyqfFWvegffnKMo3e+LVwnq14FIA39iRIU
         QUMXMv0UFpv9Po5nOHLqGxuev1Q4VGIc4mWFMAr4GM7f69rVO2pgysOhQLDgUUhk375r
         rn9ThNU40GQ9emLvDzotVZJSnkuZ2Yz09Qo6o1YWLGD2X39Lcqp7Ce2l7ba7dmo6AKCC
         RnRVYnIyqTgQttZI/nmvUzjXE5RF0q2x3ClbKw8mPgDMaAQSG53KO/ozV2Xvv0RjCOsH
         AIvKpn3Rxy4yOCCS33QOWpaXfOjQzKpKpll4ZRVq1V8KZ0wfT5qS5s2FqtxfosGMmwgx
         bVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805763; x=1773410563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KT44YeiLTJyOwAcprGitUZ5uZxYG91k2apEts1OjnSo=;
        b=afvYeE53MG2JLBqv5r4VyvFZt08Mc3o1E78LG1fmS3TixYvn4VAw7e9KRVSuhjaXoh
         N8pZIdpgNVy5rMy0ZJE/lWRDCu6y+Yvuo6chFpsw31SFuDO0JPJ5Fkoh21i901qDKnTS
         l6ZyL4qyTVjSe3Q+W+GDPPJxcH8hlPNvotDbOK1HabdU5oUDTLMqM6tCd5yMDxiN5coB
         Zym7e9y3/gjGMaVbvw/YnbmmleppljrB5NeofSosVfp0BC+VxyGtS8sH1/cp2n0rpyEY
         OtecY+drEvv59BQ2dnb22XvdgtkCEwYXmKqx5nX7IpoPWS8Erge9R7sx1QxYl3N+kCt8
         NBjw==
X-Forwarded-Encrypted: i=1; AJvYcCWND2zZ2i6uWhkJ1mf/XNA6zSqT0Mvr5bc0LQpuWVf9hL4965OaFpvEafEgUD+yvCtCOidOr874Io+sXTWlhe38@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2uHSn9ZtOCwdUYDVtHYx67ukuSRXAvtYUz9cWxZQr1wcTRL1c
	/Juw5eA2mJZRv9WHt+EjrczqbpLpv0vIAZiWb5Vzw8F4Wi1AeO6VWElTTjcgYu0vj1mS+ssYT/J
	HFA==
X-Received: from ejfw12.prod.google.com ([2002:a17:906:a0c:b0:b94:f06:dc6e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:d54b:b0:b93:5ef5:904f
 with SMTP id a640c23a62f3a-b942d1b1bebmr143967466b.26.1772805762935; Fri, 06
 Mar 2026 06:02:42 -0800 (PST)
Date: Fri,  6 Mar 2026 14:02:26 +0000
In-Reply-To: <20260306140232.2193802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260306140232.2193802-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306140232.2193802-8-tabba@google.com>
Subject: [PATCH v1 07/13] KVM: arm64: Simplify nested VMA shift calculation
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060245_481590_1884B9EF 
X-CRM114-Status: GOOD (  10.59  )
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

In the kvm_s2_resolve_vma_size() helper, the local variable vma_pagesize
is calculated from vma_shift, only to be used to bound the vma_pagesize
by max_map_size and subsequently convert it back to a shift via __ffs().

Because vma_pagesize and max_map_size are both powers of two, we can
simplify the logic by omitting vma_pagesize entirely and bounding the
vma_shift directly using the shift of max_map_size. This achieves the
same result while keeping the size-to-shift conversion out of the helper
logic.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 833a7f769467..090a906d3a12 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1646,7 +1646,6 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
 				     bool *force_pte, phys_addr_t *ipa)
 {
 	short vma_shift;
-	long vma_pagesize;
 
 	if (*force_pte)
 		vma_shift = PAGE_SHIFT;
@@ -1677,8 +1676,6 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
 		WARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
 	}
 
-	vma_pagesize = 1UL << vma_shift;
-
 	if (nested) {
 		unsigned long max_map_size;
 
@@ -1703,8 +1700,7 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
 			max_map_size = PAGE_SIZE;
 
 		*force_pte = (max_map_size == PAGE_SIZE);
-		vma_pagesize = min_t(long, vma_pagesize, max_map_size);
-		vma_shift = __ffs(vma_pagesize);
+		vma_shift = min_t(short, vma_shift, __ffs(max_map_size));
 	}
 
 	return vma_shift;
-- 
2.53.0.473.g4a7958ca14-goog


