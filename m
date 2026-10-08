Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700AACA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/T793OI/j+CqX3HPTudoj2H2H2daFaSvH0eU6CPZ2Mo=; b=yU/eZ3VnvIfGXCcqRYhE7W7Kq1
	YIVmNPll+Mxg20Qvlwjpx8jqa+gwkc/ZrEVG1vDgq7I2/uc5Ie4DjQqAt+3sOFByLfSFQB2LsksUQ
	bbab2cRXBVFm3br0fjkAJea0Ushq+AETssSgcTfDHeWZl5hHtzmiOPUmUyPCFVT6CZSb422sp8y2k
	ISnEr8OWfe7QWDunqVFoXGWYPfVjGS9ss7PtsgVqA3G7lMwrDt9ggIKOmIIgyy/1/+nykyW2Jjaj+
	nev9MhrgHgu4x9Mvfcm0xzEzifmMdtgoeSUoryg7RtfYF7CXRIv3Io6T8AOc0eQrcmBHZK29SAdcS
	5D9lIGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiaS-00000003kXm-0jfM;
	Thu, 08 Oct 2026 07:30:44 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiaP-00000003kVX-06xU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:30:42 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso1150276a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 00:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444640; x=1792049440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/T793OI/j+CqX3HPTudoj2H2H2daFaSvH0eU6CPZ2Mo=;
        b=FPa1Tk6eYk7IEVM8JGTxcMq/s6rzFlarPbIqrcgKbufqHjkuN0Jk9Jo/W+QlIT2jJk
         /VSPfLBXPLVoJBMi7aoIktj3XHt2fjch1BdwVsdUJXgmSxlTR6aRzL3udbJFSJaHc/n4
         dmnn+Jn8l/pgfYoCm2EyuD+I/lAokuvSV43srQgmJtoBlBvxrq0YuPjAzS9yb21Dc3OQ
         qeB/vnaxkkiwasDxbB8TCbOgD2dQldbpYIM9BaCbF6ueAoNRdE5eQ0lTEw5encwSNdxr
         DY56EePmoWXJPuWWX+Zmtp5xCbj02W6sXKO1+FvRcyOIe+/TpevYz9HRarQ4qmEmMXZr
         5+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444640; x=1792049440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/T793OI/j+CqX3HPTudoj2H2H2daFaSvH0eU6CPZ2Mo=;
        b=SN7IrZYMxOvYn5rxazYf726cGyQ5oqmB8c27iAyurMr4NWNA8ii371af6ZB7dvIXOs
         67g2y/MUZ/KM7El5dAaEfGEsaTp+k3xyad5oolgW1ioF6hGYTzU+eJ0OC1IRFc7TvuR5
         HcUylRsfb/Jv9SX9i5LjTo+IQisTBKIy5DrZO/jWzys0E50o8F7jdTn4I+umwhX61nZh
         kfwvDr10NL1D9iAey0FKdbjvmEaLqofXzm+Ir3lgVVIAVd8fAyF9Gdzuz9PutUEcQ9p5
         rkUaHUTe9F0VYoH1RsMl8EhL5QGaRxiCVAdN/pilQbBPpo9G6RCFxsQVt6hNjvawh/4i
         MO7w==
X-Forwarded-Encrypted: i=1; AKwUvBwPOdQXwcPVvPMwH9U77HSOXmHe5qRFlrq3/cnTiXIIgSvGnQtjwKiP/ykKnsb3Jz2TMHVexLgUXVH5sCLudzqc@lists.infradead.org
X-Gm-Message-State: AFq9FYJkeoIUarkfA7qC49ui8c83M84GcWYjHL67NhE699GoM1w05Lx0
	sAxe+60YZIgUBrAvRBDMoCZ+FG5Yze8BXvmPpDty1R7wwA8nkD6ZmsCEYMGBU5LrHPg=
X-Gm-Gg: AYBFou1BPVvHBKWimjpZPKSnrqg6I947ND/70EKzbg7nxgrNMOVEyQG2f9NYEAkJERk
	BOgilIkVddcrDb7nOSGqqMLCrK/q2xQEBjZrbf1rU5mdJ7hs5vLqD2yW+XyMS2ofUGrUnBswqSQ
	j6jNpQ9lAqhRb1Jf9yEjcwMNHwiK2iLNQprVD5WzqLAiPNoPd6RATNgiMa83Zt1RKJDGvXgLUvu
	YzjWI/VqR3lEC5yV4qIbzYMZE+vKt1FT2lXV4yTXxpFTP2f69M8fnxVR30z7dFoHQBW/Q+KZFcX
	23/NV8ZIEll8D+0eborLkiRxeHxZte3gRi1W33Np+yJSRBWkZJbwVYcySI3+hsKNsVBNEUtxlcy
	+7TnJoQ7/Gu0BG1reXBZYAmkUx8AhSQxk0h637ZRhXGfwhzVOSv3stfxUfHOXdNP8FQtXrTy5m0
	1yYCcsmi5GU48raVnZfhTc1yhdnyyq1Ztg2te9jhK8M93OBhEyNYqhI9/QXi8Ipjnd1j0vgRiVa
	2nLOsymeZPC/29BwvY=
X-Received: by 2002:a17:90a:156:b0:3a8:a1e3:32a1 with SMTP id 98e67ed59e1d1-3a8a1e332e4mr2636515a91.45.1791444640094;
        Thu, 08 Oct 2026 00:30:40 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:30:39 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	stable@vger.kernel.org,
	david@kernel.org,
	osalvador@suse.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	bjorn@rivosinc.com,
	apopple@nvidia.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH 1/4] x86/mm: fix missing pgtable destructor for vmemmap tables
Date: Thu,  8 Oct 2026 15:30:18 +0800
Message-ID: <20261008073021.2512665-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008073021.2512665-1-songmuchun@bytedance.com>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_003041_078804_87980F55 
X-CRM114-Status: GOOD (  11.41  )
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

Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
tables.

HugeTLB vmemmap optimization uses pte_alloc_one_kernel() when splitting
a PMD. Restoring the vmemmap backing pages does not collapse the PTE
table, so a later memory hot-remove eventually frees that table through
free_pagetable(). That path currently calls pagetable_free() directly
without decrementing NR_PAGETABLE.

Use PageTable() to identify constructor-backed tables and run the
matching destructor before freeing them. Keep reserved and
constructor-free tables on their existing paths. This also prepares
vmemmap teardown for generic runtime allocations through the normal
pgalloc helpers.

Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/mm/init_64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 70e682180291..a3ea627157ab 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1003,6 +1003,8 @@ static void __meminit free_pagetable(struct page *page)
 {
 	if (PageReserved(page))
 		free_reserved_page(page);
+	else if (PageTable(page))
+		pagetable_dtor_free(page_ptdesc(page));
 	else
 		pagetable_free(page_ptdesc(page));
 }
-- 
2.54.0


