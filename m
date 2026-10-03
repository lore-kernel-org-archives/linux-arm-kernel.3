Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CD5CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93aW5kJ7TuXndYGEWNCSD+XJA7ltxFbIps3WQL+8iZc=; b=VELsAPH+/LfzKYLiOQpLa6v5Ag
	7W+Dc8ksfA9oVvfPEf4tVL9PgrbYwvYVNBSZ8ioyGHc+C448EHl0AyrYqSbpdQWxIMCjAVnLQuUaN
	eZ9WB1uvO5isf+Q4N/C++7PG6drZ1dTYS98GFUMH9D1yhVLxLDcVAHw5MuDR35BaggL5X9Az0Dt01
	PHTCLM1hWZTl0WkoQGmx4IMqvv8iZxWDhT+lHbzy40IOgY6/zSFyhLVGxkUaRVZrHBhijnyrtm3pC
	8849No+XzLygMTGiqXupIdGbPNGJP2FFLwIKNkBEiA0nPMsswZqwsEE9fx375cldiqpbh9ka94ToN
	IZCyTM6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVV-0000000Cn4D-24rA;
	Sat, 03 Oct 2026 00:21:41 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVT-0000000Cn1G-0CRE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:40 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2e2c785aa62so715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986897; x=1791591697; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93aW5kJ7TuXndYGEWNCSD+XJA7ltxFbIps3WQL+8iZc=;
        b=FCC2OigSG0gD652x7vMqofRXQDggsn9psJ6pzjeLTXW5FwSwmrnMMZXoLouAjHhTCr
         AVgcocSs7fc+jcmt98t8+k3IPdCnp9A6mAr2pw9D/dhf3xQYSQs1279+JpEh+v9fu0tG
         SAHGo/AExE5bll1O5RgpOYouEHJ+9zJ14TiddXy3hubWzkID5B3vMmhpsF4jCajokET3
         oqRcza0fDIbXdTHLgqax1DFvh+DPoByCJc59rMK/mfLKv9AuxLwRdwnpZCWep9rz7sWn
         iDPXvlVUiAnOjhlmJVNqsd5QZ2UvYfr5bxL0jHNSPOcTcOb6Xm07EdsYFAANyInPkzfr
         CONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986897; x=1791591697;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93aW5kJ7TuXndYGEWNCSD+XJA7ltxFbIps3WQL+8iZc=;
        b=RvEJqcAPNzODMY1GrSrohEv3LEZV/ISacDNfD5stMA0aU4htgTZSyDmsw23UEs7sw9
         TZNzJupN7xTOaFDtI4X4/vy9LfMjUv9A7U8T7Jv8ygev/TUyrsaBcrChQpf+Aog1ZpAc
         herLDxGryxyNkdJ7KfGgFY+v2TuBq9jiCFSolgEBIpQ8Mkmmw7wYjzOUJDlA2jgadm3v
         tiAn+EMzJKVjGbIrDnztj1EblHIQy+8q0H7kaJUmckxRJe7QkGfw7PLwPFUiysf/jXjm
         pp3XeUX+2mXTKksbBH0ALwi3rdd2fhzTgGHPNcp+BeRPXhlt6UQ+91ZtOhDG/Tqoo7Tp
         WWrA==
X-Forwarded-Encrypted: i=1; AKwUvBzsQW8nECKZhHn2q98bOX4iuPmrp1D1qs130MrMSMBCYy8uFt7iWQq/4oi7SZDx0oUzfxed06n1Gxu23rkvz+CG@lists.infradead.org
X-Gm-Message-State: AFq9FYKfK5NMG5KnM1mCZwtFWVmioowgGSruOrlhPN84P6ebsE4G0tTd
	phG0J4QXs7XGY3pY2AgHV/RKbc0eEUuAJ3KBpit/PtIp/wxuqrKvtkQgq82D7P4OmCR5P5+eLbz
	BqXXRkOtwd1UmgY4gIa091A==
X-Received: from pjbfh14.prod.google.com ([2002:a17:90b:34e:b0:3a0:6f00:2a50])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3d86:b0:39e:6c68:c77b with SMTP id 98e67ed59e1d1-3a6ce83b91emr4273665a91.49.1790986896998;
 Fri, 02 Oct 2026 17:21:36 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:06 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-4-jthoughton@google.com>
Subject: [PATCH v2 03/20] hugetlb_vmemmap: Always flush TLB if needed upon PTE remapping
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_172139_151635_69741263 
X-CRM114-Status: GOOD (  12.01  )
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

vmemmap_remap_range() can potentially leave the vmemmap in a partially
optimized state. In this case, a TLB flush should be done if the walk
caller asked for it, even if the optimization was not fully applied.

A follow-up patch will more completely deal with partially-optimized
folios.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb_vmemmap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 0057fa2a16a8..1a2645c382ba 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -163,13 +163,11 @@ static int vmemmap_remap_range(unsigned long start, unsigned long end,
 	ret = walk_kernel_page_table_range(start, end, &vmemmap_remap_ops,
 				    NULL, walk);
 	mmap_read_unlock(&init_mm);
-	if (ret)
-		return ret;
 
 	if (walk->remap_pte && !(walk->flags & VMEMMAP_REMAP_NO_TLB_FLUSH))
 		flush_tlb_kernel_range(start, end);
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


