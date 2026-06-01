Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E3DCD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myBbZVt9pZizoKTbw79TdKlIez+dzWm6VMZTcEDpjws=; b=rniTquElzu1mfz1ir4Bi8fv1z2
	cMczV3rGdZXFQdIeI0gEUg3wZRhI/MVfpmz4paLCEseXJySK/p3XNWVRS2UvyFfaDU9ASCNWcnrU+
	TT4QGB0RuuSsz7JyUqmw9xS971ScatMlRmyQrHt+u0EJ8/PYSE6UXDN7Sfxc+KGKBV3QZO0LZCZai
	uryNKT+0lChURfT6qRNyl4rtgYnaDlwprxGoEUewpNTkUO/zrgWxbcMzUC20biQEmTdelOc/pYVyX
	VwcjhUZhQYl1vahHVjseWn1fAB2f80afkWu5jaXgSd7g2QeScWttheGQGBirqsOGw3KxgQcLMwB5z
	DKvrYjHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKv-0000000AQ5q-3Dw6;
	Mon, 01 Jun 2026 08:49:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKu-0000000AQ3r-12At
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 08:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=myBbZVt9pZizoKTbw79TdKlIez+dzWm6VMZTcEDpjws=; b=NbJ4mNLnTF6s71hQMqnqlWe3h/
	dOGaDzI/ni3XAWxYuvePyUtvTByl4qrJHFFB8NAHbDyu51/yVdYHBmYyYsaFwJGBMLiAO9s2o8RHD
	8hajhcOuhEC5G0dWz9SCubyJayLbzLyFTWakEkx0GTe6Xz4yl3BRm7MsIoy9frWlPRbcNRaI+ZxYc
	ymmZ5GYS4MM8m/9DDl9fWC+w8PhVFJrsIg3WuYxvE2gu044VOtRnK+Yi7eVgxR/kmBMAAw4Bdk+70
	YWIrJinB2OW5dWUfQjDraXyZBDsPnI93QxbL1wplvLBoSKBqTZMjRKMO71V2i40snDsrlQ1v5orc5
	BBmDXq9A==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKo-000000067ks-08Ft
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:49:24 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-841882f8f4bso3300106b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 01:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303761; x=1780908561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myBbZVt9pZizoKTbw79TdKlIez+dzWm6VMZTcEDpjws=;
        b=Bx2N/e37QAwA4jDjjbsJf/uihN512KrJ/A+YU1ZDnmZgjQPYcw3S/9yTydtUZWAbEA
         IuqKgjDGkYG9gTQurFkzdHDyEfbOcmVpwBhqO6KDRGhrhjH6m0yCqJBp+9CcWsGJ31MR
         BDFyYDPAIh2Y7pYmlc3hP9iKsggsIYd2H2LzDDOfWh+adnfb0sQ1ESOh70vzMd8Sxd2h
         lHyJuy4M+N8MLdsb0jyymjaVYTijlqmHShvwqM+2hD+U4EVTl0HrBRvpp4HfG0+eW7Xa
         VeyWF9LYxeSpWxe79OSiyCdMcbyGwZ4Tc0lrG5Kc74Ru3gd6f+l/BJrRY3BDRs8m+YqB
         LEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303761; x=1780908561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=myBbZVt9pZizoKTbw79TdKlIez+dzWm6VMZTcEDpjws=;
        b=McSU37D9TYc3IOraRiYlHVP9H6VNQyED+KpFzYZN5KcNP44ECO/qCvPjvpb4BiMn9D
         Jyi0QOwyeMUrVT5/V6nZqdAw5SiFGaj7vKiENU/2IcH4ZIcU/Sn+giARLfEi77iuTU4k
         GhHRW641lkrEGr5LatPtj2dp83nrV4w18L5IfJ73E0rrp3gurqjrRo3DqgL+9IiFM7mh
         OIVnbjFeo4DdMOIKpMZsgFh1Y/j2E945bJrVauubhIOp1pxX4YHGS+7Y+53zexZtAwUS
         xbWba+mBf+AFffGb75RjJmjcoFFQfoYvCCXz7mFpklno0XmVyEKPUS5PJvZL6hFtJW0D
         r4ug==
X-Forwarded-Encrypted: i=1; AFNElJ+NvWEkkJVBz+kJS6Or+lV+j/wX7tcQpalECMA/dxhN2yEaZWiP3VdCY/iUBtnbqj7NYaVOnaZAJpIEzYSwsXb0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxya16Anq5CvubYtVUvzjyznJrzkXMmhNhdZkEA7DdyVdvUIwrG
	aXIp9OYyI+th3CjKvZh4q/cCeSruIgxRqnsjgbWbKlIMmdpnB6f3novrHdL4grb4Qpg=
X-Gm-Gg: Acq92OGduzBtfKKLrmGLqbPvRHaYJe9wm2LpZvUeV5kkRl3UhbkAVSrUAgphw9yL2qO
	YdEe65b8xf0MJd+jkEwkdEnxZtwzPbF9s8d7mdDXxlhDO3xUvcH7+oILZAgKsMVcV4Cim+tpOhK
	dPDDkzYPo6IT96fUq1DLhandZ8wosSewyo4ZwKuThEbjn041My0H3iikBxYcWYxH9lA8MXNNWpl
	a/uBgvFsepLjoem6I6AdwYkkdzaJr//XUBIEShhvS3v55KPF/O/dkS5DTr+J70APQZXtWzRy+vN
	NnvQGkU238xRae6nwVnwaw1evgvbuVD3xRIYBUKwwgIxH+gwTq1ZRf2IFPb46Y8Ft0RWvfeBKWj
	LnQ3aC8QaJ0tXGoRjtB8Fb7+YJ1vsaOwXO++HnpLnlITdiEnmD+8DDZgoECAuBRNhQYsovla21a
	h9u5bweT6IvJailtQz+bDjUmRt7Ws+5OPtdXLa9JjEXMTsiH0XqbMDsw==
X-Received: by 2002:a05:6a00:3a0e:b0:838:29b3:9ed1 with SMTP id d2e1a72fcca58-842255c8233mr8977076b3a.41.1780303760714;
        Mon, 01 Jun 2026 01:49:20 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:20 -0700 (PDT)
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
Subject: [PATCH v3 4/5] loongarch/mm: drop vmemmap_check_pmd helper and use generic code
Date: Mon,  1 Jun 2026 16:48:43 +0800
Message-ID: <20260601084845.3792171-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084845.3792171-1-songmuchun@bytedance.com>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_094922_486315_CD02620A 
X-CRM114-Status: GOOD (  10.01  )
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

The generic implementations now suffice; remove the loongarch copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/loongarch/mm/init.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 687980b6e91f..3407030f3e7a 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -140,17 +140,6 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 	set_pmd_at(&init_mm, addr, pmd, entry);
 }
 
-int __meminit vmemmap_check_pmd(pmd_t *pmd, int node,
-				unsigned long addr, unsigned long next)
-{
-	int huge = pmd_val(pmdp_get(pmd)) & _PAGE_HUGE;
-
-	if (huge)
-		vmemmap_verify((pte_t *)pmd, node, addr, next);
-
-	return huge;
-}
-
 int __meminit vmemmap_populate(unsigned long start, unsigned long end,
 			       int node, struct vmem_altmap *altmap)
 {
-- 
2.54.0


