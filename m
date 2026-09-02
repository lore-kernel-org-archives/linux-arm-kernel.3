Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4433C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 07:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uqv+RTAI4cJSSsg2qdg0AwAoAqWKAsIT2FLXo2GNbW8=; b=VxS94Jl/lebg/ALa5ZhB+WxYeE
	lUxgPnw4WOLAczoDrOQXxoak6QN5L3RliaPsHhoNTkB7y2AzzQmZGdBnNezZalV66ETo7L/T4LpPw
	JAulaKXf7Bv3ENjd2DReTBLs09aZkMkJ3f1S9/bO9eJZThZOi5TI2wADkZjS/Vl2SuAhtpg0bZUx3
	l6aLIbUTCL6vP7HMURvl80okxVG/65m5q9oGkXn1q0CVzdlNKyfr8nFt7ihdkYqYtgFV0v76U9CL5
	qOMK0reZl3hNVky45jCxiGVAukEcKtMNFWMktp/g+sovsX0sWG+jnva3dwVDwnPPsDRmWeeN1HSC7
	gHV5kAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fRq-0000000Dvjp-13Ok;
	Wed, 02 Sep 2026 07:31:54 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fRi-0000000DvgX-2f0C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 07:31:49 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2ccc2e84048so2638095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 00:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334306; x=1788939106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uqv+RTAI4cJSSsg2qdg0AwAoAqWKAsIT2FLXo2GNbW8=;
        b=T2liDEm/t9Mu1l0AYR0Dgeo/F+RZkNWehenuXv8MBEYxE7D9x7HgUGeo0ScFxLowYI
         1myR99mGNebgEpU3c6qd92zk4MDwzck+xjJ6+durkS0KxeO6MidGYJuxjmfDhVaXhlOZ
         kfAzmIB81NP77yx2ub5qaSu60zChgpRYTj+sgzaPONanj8quW/aNJN2wOqFcxQ8Tzd+W
         PDvo57czoAg259iZXfGINTrJeKW/1jBlyCHyhJ0fsm7DU85dbLssPEhhGZ2eI/a7t4sC
         CllKBAHnKwpZfk9+5jhuZgYJ2irbeYAOjYRb7VDCAQnj/wrglblhI0sJJOCuJYRx3mHp
         Wijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334306; x=1788939106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uqv+RTAI4cJSSsg2qdg0AwAoAqWKAsIT2FLXo2GNbW8=;
        b=eImaJ+5oIxOFcuhJT/dJN6Hw0Ikiw5NbGKjfPB6qOeUMcPlkiNv2R3s34MTUu5jDWd
         gv/M5rKCN6WowJjkjrmH4cgNE3LaOGj/Qso5YAicJeBjvGyNcLoeZGF40FyfMnN31llb
         44R6KuV8fzJyEwOD0D3LuZx4IoVZqJG3ELd4BOZGFxRsjB/NlPVXDs9Y+MsdjEwixFCc
         MR7Eo5hE0SUcGyeupRS11R7V97gDGtYdd1rEavKnnCs9XYSxtNEZasdREhzI0oPsnIhm
         ifA/kRfl3F2jHi/SbRfbx+vJHzqTSM9AW6lD+dBJBfn9DVRWEkgIjnQLSJZ2/RiVuXUW
         wciQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpyu2+ee822Y2fVP9nmNqTQNJOvrn3wmAdDINMRLLhs5kfoWOsxkS86GtT5TUoCmOd+Xi2zD6VGSWcSON0tOzDk@lists.infradead.org
X-Gm-Message-State: AFuF++mB0eRR8f7z3q5kgBxGds8T3Du/rUDzN/nuCe/M0QSlzq9Gfn0v
	f605MrqjK2/FZ8l8fmtlyomSe/pNK7qGqu5c2cAF6TNQhXf9lo7J4tQV
X-Gm-Gg: AR+sD12vseYPCOtjA5V/kaK+Q4tmjaP753Q+/wwZDsWG1gonyN4IWJ2zN6/3FkKrQR9
	ep85Aj/5tuX5ciTyY+a65UjivhhqXMCioBYu9tqZxxHZE5yr5CkZCkIiuQ4M+BsqZbT8YOmwUsi
	1U2RkUIYAlLH/HBt5dUt+HvVY/4AeJHcek2Nptjnf+XtCMZL9zYxG/rOgRCMKO67+Tidmw6MEWy
	kL2vxJmpM3AhJf0hP+taXesszSDiUOluVroR/AYqN7uU5XEDR2se++RqzHN+gdKp3kRRlfP5jYb
	5FsLyspnPoCZ4Rw0D3HtNIidCDAkScRZ5yEodezCyL/BPCJMNBsszidPor8xDjhMQtf/Dqtnkph
	FLnRQSrKsO6+X601uZnsBlQbhR/CPNMLJkIXWb2RXpC9Q7zN1K4q88TST1w6LkvCpK1Va4Z3CGQ
	Q3NnA/1rijCFCHnYOXZp11IhAFPROW1yGGsFk5f5HghUgXp6IjP4AS1rlPeErXqfe/dxxd6uor
X-Received: by 2002:a05:6a20:258e:b0:3d1:39e9:b261 with SMTP id adf61e73a8af0-3d9aa4ca9c0mr4530228637.0.1788334305736;
        Wed, 02 Sep 2026 00:31:45 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:31:44 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v6 01/10] mm: memblock: add missing HugeTLB flag name
Date: Wed,  2 Sep 2026 15:31:07 +0800
Message-ID: <20260902073116.802752-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003146_738590_C1C706B0 
X-CRM114-Status: GOOD (  11.07  )
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

From: Meijing Zhao <zhaomeijing@lixiang.com>

Commit 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work
with KHO") added MEMBLOCK_RSRV_HUGETLB but did not add the corresponding
entry to flagname[]. As a result, memblock debugfs cannot report the
flag by name.

Add the missing RSV_HUGETLB entry.

Fixes: 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work with KHO")
Signed-off-by: Meijing Zhao <zhaomeijing@lixiang.com>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://lore.kernel.org/lkml/20260821020910.3428585-2-zhaomeijing100@gmail.com/
---
 mm/memblock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/memblock.c b/mm/memblock.c
index 9ce86349a29f..f2952d725c10 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2886,6 +2886,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
+	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0


