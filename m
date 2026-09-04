Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFC2C79F83
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LM/ZtSLU/J3nueXy+XgpL+eelg2/bX7Qhca0kqwRafM=; b=S+judPW8moY+/iO/V9oDU2MqMy
	pn1TnuQdvS3myL4pw3ez1y+XiLkQsP9Oe9ju+qnrIF0fx5kgQeb1wNrWlWoSPvi8AsyqyIHQ7gMTB
	pflIzPenRzjuFpDrpBzroZ/K1EKV/s8I60nZq/TUSqI1c+Ds6WJ7dYKJFqwZzI48EHvqO/P2ScujZ
	AD1Ugz0Ft4WB57N+td7ed3nVqSf8CkfFbTcFjW+HwHxCtuQIDN2D0W7BV0rmjEnlmqObReqGECfwP
	HRjV3PE8C4Y1zuejAaYYelGVV4ARLg6S1LR8Qx2hYviggdWFzmI2hrUciw1IXGgRipw2iv6nG5kd0
	PiCNq/2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Sl3-00000001zqM-0tE3;
	Fri, 04 Sep 2026 12:11:01 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Sl0-00000001zpP-17ub
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:10:59 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6b128dd0cb1so575256eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523857; x=1789128657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LM/ZtSLU/J3nueXy+XgpL+eelg2/bX7Qhca0kqwRafM=;
        b=tNyzsuVv0tD4inKXLAcH52mvnFIn4IySDbqS137xRPq7T7Z2/jdpMbVXa1YpWWvqiE
         XD4egRpw/gToTMdHMhoRYRRmGh7Vam4U7j+QefJPXmrCswT7lcChTU8jiD64AALkA+ZU
         bGaMNSwTHpljr327WJ01RL3PQblH5OjqH7+YSET4VO40EKI05xGw1p0I98VgSDDwwDsy
         T0cHptYWmTyDjcmfD9euBHAm1UHPTgyF3Qb09qILc5kH4pU4bCa3KTsBYO5zcK04lN1X
         cP9vo+8QMDlAlm9Iqcvj9cRYF6Zd+MCKA5rihF93Bt8RyTcyC27JGdhJrn79KO+DblPh
         KC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523857; x=1789128657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LM/ZtSLU/J3nueXy+XgpL+eelg2/bX7Qhca0kqwRafM=;
        b=qMFTWqnnfabfSxJ4xioxZ58+EHARN2hPCkHhOFBVVtFZwOgRY5FPvWs7REkDHnbC+K
         nnrV3DEsqgYu8qGEi+yLWuFAu994t8Dbk5YhlIH3vezS3s6p4DoIOJB+IhUhIt4F9r51
         zaphE2oMB0KAm/Fi8KNMeKloTJ+p5QcT+/mDPhYGGs3JzBD1eONn69Qrt+TSziB/eZwE
         rr0sWypwbfE9PIpKBWl0G958Sd6m4R358BRlHVWoK64/EbBkRe5/XezgfLK6UI5QOg7n
         wvr1eOJdcNGz1aFWYvosmeaS5b3Iem04depCpWqRNp2ZUyHFqbFNoIf683yx26jTckT0
         YKnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzIe/d2au2+4M2NSm6B8Pao/caedkerHlZnd2PN//bFrfyE+sI3JS+gJQcaXXLYrcMRbr8xYwy7UCwHvYE386K@lists.infradead.org
X-Gm-Message-State: AFuF++l6IgqC0t/vyD+4PecmI7Jd5w5YjB2TF8nUvoRKUOWG66zowFX7
	sTLXN4NClf5sq/quUF6JUHdt73G64oT0Mv1SzpFFsS0Rw0/LPQjJ5SdX
X-Gm-Gg: AYBFou1vBLBW+EVwucL7OMro4MmvMSFu9ln4YKgPu2aK3ZpNq6ex/IKoU+3k64LNEp/
	SJGRVETziMscyTi6eRBWSw2raUZyLb9A59BmjvejySFdxXp+UrMtqC7ZccRvDXHyv5OKUm6qSLA
	pfbJPt51D5maWArMMLrgB2yM+UbKqccx0g1rpJDyWOpRGC6DbYgmHVkz+PEnkgaUg5xHXp33tOw
	Udo/S26H34LqjtostMqyBdW1DBGOZaVSy/1i5xjxTXSo2iPkKjD/1LPmTkubJypazHit0l1vBN1
	utVbet/JmKCIn/Wt8nxJNp8RPFQ0vB0UuIuD+pt57dMooOo5rmJWA31Dg9F8yB8dAfLo78tD/OX
	LsVOy/3pRkFIBsc+ER7BJ1qtPh4UcmuuqyFUk2uvp1A6ck9RAEyhrUAgeVC1mMI24rmCte01Jnd
	f5oHHn8N4uCsYEQWqZVtvl/kW3wcceKowrv2dVUCtDw4dMneH+J5qkcHxwJXGjQeij8pV8bOq8u
	wAG1BE7Cs+4OIE=
X-Received: by 2002:a05:6820:188a:b0:6b7:83d6:292d with SMTP id 006d021491bc7-6b783d62eb3mr1446014eaf.48.1788523857014;
        Fri, 04 Sep 2026 05:10:57 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm6461237eec.13.2026.09.04.05.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:10:56 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2] iommu: fix typos in comments
Date: Fri,  4 Sep 2026 17:40:43 +0530
Message-ID: <20260904121047.21701-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904121047.21701-1-hemanth.selam@gmail.com>
References: <20260904121047.21701-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_051058_336586_206862F9 
X-CRM114-Status: GOOD (  16.40  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/iommu/amd/amd_iommu_types.h | 4 ++--
 drivers/iommu/intel/dmar.c          | 2 +-
 drivers/iommu/omap-iommu.c          | 2 +-
 drivers/iommu/sun50i-iommu.c        | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index 3dbe20023456..a1cd29f0d03f 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -121,8 +121,8 @@
 
 /* Note:
  * The current driver only support 16-bit PASID.
- * Currently, hardware only implement upto 16-bit PASID
- * even though the spec says it could have upto 20 bits.
+ * Currently, hardware only implement up to 16-bit PASID
+ * even though the spec says it could have up to 20 bits.
  */
 #define PASID_MASK		0x0000ffff
 
diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index ba675b08cd20..e80a2eb3e64e 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -1034,7 +1034,7 @@ static void unmap_iommu(struct intel_iommu *iommu)
  * @drhd: DMA remapping hardware definition structure
  *
  * Memory map the iommu's registers.  Start w/ a single page, and
- * possibly expand if that turns out to be insufficent.
+ * possibly expand if that turns out to be insufficient.
  */
 static int map_iommu(struct intel_iommu *iommu, struct dmar_drhd_unit *drhd)
 {
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 8231d7d6bb6a..7e43c6d64434 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1732,7 +1732,7 @@ static int __init omap_iommu_init(void)
 {
 	struct kmem_cache *p;
 	const slab_flags_t flags = SLAB_HWCACHE_ALIGN;
-	size_t align = 1 << 10; /* L2 pagetable alignement */
+	size_t align = 1 << 10; /* L2 pagetable alignment */
 	struct device_node *np;
 	int ret;
 
diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index be3f1ce696ba..8c9ed9e5f1cb 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -152,7 +152,7 @@ static void iommu_write(struct sun50i_iommu *iommu, u32 offset, u32 value)
  * 4096 4-bytes Directory Table Entries (DTE), each pointing to a Page
  * Table (PT).
  *
- * Each PT consits of 256 4-bytes Page Table Entries (PTE), each
+ * Each PT consists of 256 4-bytes Page Table Entries (PTE), each
  * pointing to a 4kB page of physical memory.
  *
  * The IOMMU supports a single DT, pointed by the IOMMU_TTB_REG
-- 
2.48.1


