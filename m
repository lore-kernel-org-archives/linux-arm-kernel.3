Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56818CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ct8LTm9E0tar8OtNDyCoaad0P31p+YAvHyjb0MDrcWY=; b=ZP+vUQXX5CMHkzGl8Uk8wQqPZ8
	PNjJ34E6ISluwr42givOht5ofECidHeDm/zXF2kvP7HtyciYF+Zi8QQPdpTItuTUTanLX3enJRPRn
	zitqGTUX801p/W3EN2xpm/uKImvtRrwG7JnOZnE2hbPITsRWZE5HNa4k8cCQhb9U1OUek57q2tNc+
	ygYZbfdGzML2yHuA+sDrYsBUJ3Ei23DwoYrzhYPQNOIeJJdV9wHf8c0JLDsHPNXLNnCi0/jeucQeA
	Z8cA/qQppmO3733TqHFxu+xk5ZYA3VkqIXyOoAykTtwtA2wg0NUXApG6HQEOLExdWLUaB0lXZHLpn
	8u21C/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKh-0000000APt2-1071;
	Mon, 01 Jun 2026 08:49:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKf-0000000APqx-0pNr
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 08:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ct8LTm9E0tar8OtNDyCoaad0P31p+YAvHyjb0MDrcWY=; b=aiORj0+R68FwfnVtHValMlC3II
	BCxYcnV06oAHHio6NmPADZxFqSauSi5qiC767epJx8WdkRChPm/W0h7Uh3fN7a0o4YoxLRucPk9aI
	9ms5Hx3sm5/8tFzLiOB9QNscxXS0PWsofQCPy4a7Icj8Q83QcU1tNMmxFWrJs+N7RC/JetTdHP/5V
	PRJEa8wgAP+MFZtxmGNQzvb6w8dmj3y/DlheydNRtfioM0CUau9zgzvGGar7jhq78NmaEq3v4asCI
	imeyioKfPHCuUsFdEsL0JcKbUtUAz6XmFbCY4TrbkQcEyIzRhzr1Pu4IyBOdOy9AXC4y2F8jBTYTb
	Njrn7A4g==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKb-000000067fH-257A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:49:12 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-841882f8f4bso3300042b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 01:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303748; x=1780908548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ct8LTm9E0tar8OtNDyCoaad0P31p+YAvHyjb0MDrcWY=;
        b=EnzPx4XpZ5BxLnAef+Q6fJQVux2whXm6HUBGdAKkFeDSZNk2r/BZXqILAw9FXVihTk
         RiEhgBi2rTX3vyTpTuF3pWmChCyPunUQzC3pfJvNadT6c0ChifkrSbfDIp2ocYGgD5Dv
         ozXyRslPf/+j2DRYf1ACkhBl3NGv4AQboj9GK4+6hzlEGyp1cqg/HAPUA1l9pu1gB5Ct
         T0YFVhvlRSpUuei5dUL0kkdYqhLJFlSNEcy05l+ps/XbjVR6n9E8TJ42VPDDT5Zq4UVW
         wYwPMPqj3FaTY6Rxd7a8lOvlOotxiERPKLkyoP73nqppY+BNDsIbAFeWXWmEYUewc8ZG
         ME5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303748; x=1780908548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ct8LTm9E0tar8OtNDyCoaad0P31p+YAvHyjb0MDrcWY=;
        b=Fn49AQX7eDnoj2wvxX9lkkvlnBevRVdasEKmOLMAwPdsuwaftMESyWKqZevL8kU4/7
         EVVKEKo0ZYXdFBMZCjrrqD7C9DlaN3V7CmdpLLTRgqXu0e39vsqWrlZS3uSa7ZBe3dP5
         +HFYrYd+GFNDRhwCIW8n9fZPx55h50NC/f4nH1382BHrcw1NP3v4YsgC+QIhWjA8NiBA
         LIwLHIEyKWDEzZc5qb1+DUofDneBAc9JhLbr02WEJCeJf6yGdb2iiq512wVI8quSbpmg
         J1pAW08Kt6Yzv8SoSu0kB1Xppx9gNHrn9gslSUKJqr2aEWcBGuXFuUhJ2VLKLLMY2+MH
         D+FA==
X-Forwarded-Encrypted: i=1; AFNElJ+mfkSSDVAJ/Kzvb84S9BakJd/MEAszv4AQtJvBHueqVorhOymGbsljJN3Xa5qhMe41uvVlGfThJaHqOqLI60Gj@lists.infradead.org
X-Gm-Message-State: AOJu0YxMVN1v9QIqzEFj7gHXznVzxsGHyyeykw9jfMS+C9UdC1XkAe97
	zLKFbam3VOPn6ZLf0eCcz1oZJYw53KbV9EcfSD7Wv4WgXUvRSGLqamiWlaECNyvRIuU=
X-Gm-Gg: Acq92OFGwA6MOxYO7v2lnmkIQW0C4tlOeuNxBGIh/piHkcvknDafKGHazflblLxMa6u
	xwWo+EZB/n4z12+HvvlGSarHRvgJOnrnhci32dT23jzlGfDjdj4RuoXzhR4W+erTC9YrwG5WkWf
	xxWMXtb1ZqcJzQTOor4oO6FodwPOJtSUuyV61ZbMjf19lbcnn1GHLTVUcPjjJ8onriVwHpI5ofJ
	A76QjIjhOBBb0dh+Gcubi4PttVD8opauGm++US6bZKiUFtD2IxxGFp4djb41KmsOUrjQmUFYYHr
	n2MM64ZTiuvgvi1isuhaa4ekcbgzqCeFkuF3w2oBqiWsOdBcUpfsIlqcfoieXrMNu98h0tzjjyM
	gQnOmmkybl22VIjHWvutqqw+kaRokUyBRVrMZmyFWhj1vpTLRPeZXxFYkN9AMCMoYMXmmia3yb+
	mUBGb5WJA9Y+VtKS7DzJt6XI+8u+dQxTDPOczZ7yC5UiCd4MSv2rYuWg==
X-Received: by 2002:a05:6a00:3903:b0:842:2382:a0ea with SMTP id d2e1a72fcca58-8422535fc9bmr8854602b3a.14.1780303747688;
        Mon, 01 Jun 2026 01:49:07 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:07 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	WANG Xuerui <kernel@xen0n.name>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 2/5] arm64/mm: drop vmemmap_pmd helpers and use generic code
Date: Mon,  1 Jun 2026 16:48:41 +0800
Message-ID: <20260601084845.3792171-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084845.3792171-1-songmuchun@bytedance.com>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_094909_922395_1A0217DE 
X-CRM114-Status: UNSURE (   9.73  )
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

The generic implementations now suffice; remove the arm64 copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Will Deacon <will@kernel.org>
---
v2->v3:
- Collect Acked-by from Will Deacon
---
 arch/arm64/mm/mmu.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 24388e5c727d..ea10b0ebecd7 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1776,20 +1776,6 @@ static void free_empty_tables(unsigned long addr, unsigned long end,
 }
 #endif
 
-void __meminit vmemmap_set_pmd(pmd_t *pmdp, void *p, int node,
-			       unsigned long addr, unsigned long next)
-{
-	pmd_set_huge(pmdp, __pa(p), __pgprot(PROT_SECT_NORMAL));
-}
-
-int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
-				unsigned long addr, unsigned long next)
-{
-	vmemmap_verify((pte_t *)pmdp, node, addr, next);
-
-	return pmd_leaf(READ_ONCE(*pmdp));
-}
-
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		struct vmem_altmap *altmap)
 {
-- 
2.54.0


