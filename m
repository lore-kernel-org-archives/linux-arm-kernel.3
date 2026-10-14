Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDF8CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2vqgPBzudi7/wozeWO4xZg2nwY2bakbLYAqbfosODE=; b=rKBOd9hobb8ck8AT4ayge3DBFD
	s/Mh+Qas9BNarWuT7TYs/bNGg4pjlMfJvfh3VlXv1k43qZHxLm51g1LONZ2dA7xwAniqrJ0XafV8K
	46meZCmBTbAxZKhOiHMBmxKVIVoJvn07onTbgAjpiHWItDTGQHL8ysUDJNVjxRM0ECRH/zqiDdFPN
	3R8IjQVl5oZMmJDVtJ8zMSnHpsNgTTv7x3FtjRRyShFHFz4hJo7J6muAsmM5xBSDhL8adI1y2NKZO
	7MDaZjkt6jGK/LIE3Nil3Bd/KKuaQREpTcCWL6+OcHxAzWudhrTPTAA7UpZWRUsYXU+1RRDiS441k
	XuwduDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvR7-0000000F40S-16iq;
	Wed, 14 Oct 2026 09:38:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvQl-0000000F3fw-1GVv
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o2vqgPBzudi7/wozeWO4xZg2nwY2bakbLYAqbfosODE=; b=cQjd3iL0vPHo6InZm7UvpQSkQG
	POBRVWuuKLI76ZGrVfGeQl4NmUa0D5Qd9kTP2b5EEUA5d+NmxYCAmLfLCnYB0XrfK47CKEsp8qqxx
	yOV9Ffks+93cnCQ1umbG6jdCpknz8KMZTb9zRWBLT6eFBA4OEdImANLsaglrFPYHEKZTq6BlK+Hk5
	K6m47INvWyUAOLc6S0TlmxzkeOIXflvXn7EC6N/xhKSLNZkVbD2g6UU6AjuMprKiMlOyJ8LbELzGC
	KNbDQj/BDzxMKGD+q4o/MgQBWSW66bdlLR7HjZaoxKXKcLuVxcdApWoyfRd8K9AfjoMia6Xfn/syi
	n9e9inFQ==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGvQg-0000000GZYw-1vpZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:37:49 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48c4207ac26so3684907f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 02:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970665; x=1792575465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2vqgPBzudi7/wozeWO4xZg2nwY2bakbLYAqbfosODE=;
        b=V08MOvD2g6mVbFpNeFFDrs5WkPIxndsMF+PmIvEf4QfM2yS8K8fVfIRn77Gf1usmDS
         HpBQBsVoc2D2YZ84g0B4kfk/swfqeSSPCv0wYPl5jKnRof1RYH/ZWEM6AFYptHhJ4TFL
         BrCZgfkvRIxzNEkm+7sz6IJatY+TExC3mZJHgOXwFzURFhYpeEsjxR0KULj6TfEpnDYq
         of+NA7r8dD3ZxdhLfHXB4LP2es9M0SwSNB4zMib5MtZhB5h3NGT7DUp1Ixjk7/8Bq8Ag
         qGZz/XYf9IA6gvaUzbzyTkQ0PkH6iyLEb+cF59QSI73w7FVr6y/5tTJzso6vKEE0OQ5U
         pycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970665; x=1792575465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2vqgPBzudi7/wozeWO4xZg2nwY2bakbLYAqbfosODE=;
        b=sXmwGJEOIW2Arb8jBJp2H00bTuQxli7PnO+XLiDfs2xvbegnh9C3eFUfuk69FeBJG6
         82fLx/IJXdYVXSCIJWHWGZ6r/z/P2pq80qwWKouzzlX8K1KayV/uG7Da/rkdfh2hVUZk
         bsqnN9P4JnMkrZjeDqBEeD1edPClxV2cpsEIHrIjlRcM+ouPsDbJlbQBvdDI/+MVTY7y
         P6DbjoDWPTIavyXVHxawpQn1NB+4O+FuAgOLT6h6atBxZTYMvL7UTTshyT+dla2rmns/
         5wcBPhGPKM/gHeyAaCg6IxXCcHIDVLUbHLT0Wvxv48PO4v2mF8PTx53pqmINEGLlY40i
         y/lA==
X-Forwarded-Encrypted: i=1; AKwUvBwPQc9UE95g6MOxPtiDcLh5b1bqPHU/wmW9hf3nykC9vme9JfoMoIYiNtK9276KGn3gGcGgf9H8zBiB9GlDj9e5@lists.infradead.org
X-Gm-Message-State: AFq9FYJLkA4GijBRVC2+z2vp9DI5o0XSXSoA6xHC7SlDac6OIUg9DywB
	AJfU8S2UztcQgkIdrUag/Z9GqnE2vmYpMaCMWnkV1/gIgD6L2Pq5y7xZ
X-Gm-Gg: AYBFou0MMtE9M4iRLirtNTHE0XhtZtmy2Vbnuoj3o+O1Vxe2lYIOV+tjjINoTR0/Ew8
	LTnyLn+iQwQOcVvfb4tbTdLFupSAfn6ODVSnb5pcPlmKmA1eHe3WqHCnagYma0i12HuOxkoQSjB
	BthMejt1gg0L7XEccwkSgs2oOled9gvO/BUGssTtgRLTPMj1V4hMsZQL0Mhni4PBsVKpEgP5FgE
	EiK8jbnx1/uWXI27sURa3oS9PWnweShyUatedMQa3r6cE158PGX449rIIKzAbb4aOVVTu2SZnoj
	K7J5iSp6Qq8w9+vZb9qpB4SIVLH8pQ7va4N40a7qWuG8fIULVrJwP1aJY0eLEdCiajL7kiOdvMO
	nfODzg7zNheL9+tlyoU970ILMPP5n+G6K1jZ2Kdu8w9PA2OWz8tmnVDW5pgi9gy96TrwQMQD2a6
	RRg1A8HL+yBCSMHa+oLxZnhz55sT27nABJaY0/tYHRKlNqIr3HmtKfKfe7vwloRkHSDfSx2RjQf
	OIsPEQYdaOqI0W06/5M1e/aHFBRRzzQQBw4kccZDp3LLYrHeGBlcY7vH5kyRk1gttaHM2vCJG7R
	COBDgOhfThFsiSlqDrrFfdCi5b8JIMWYOv4=
X-Received: by 2002:a5d:588c:0:b0:48b:5083:96ae with SMTP id ffacd0b85a97d-48ddff64e46mr11244091f8f.15.1791970664941;
        Wed, 14 Oct 2026 02:37:44 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm9365477f8f.35.2026.10.14.02.37.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:37:44 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 07/11] iommufd: Use large IOMMU pages for provider mappings
Date: Wed, 14 Oct 2026 09:37:29 +0000
Message-ID: <20261014093733.90312-8-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014093733.90312-1-griffoul@gmail.com>
References: <20261014093733.90312-1-griffoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_103746_615169_2F80CA3C 
X-CRM114-Status: GOOD (  38.08  )
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

Provider pages are mapped with one PAGE_SIZE entry each. A device that
uses a large provider block then misses in the IOTLB on every page, and
the IOMMU needs more page table memory than the block requires. A
revoke also flushes the IOTLB once per run of pages it unmaps.

Map each block that the provider reports with large IOMMU pages where
the IOVA and the frames are aligned alike, and with smaller ones where
they are not. Only the pages of the block are mapped, as before.

A large IOMMU page can only be unmapped whole, so a revoke that cuts
one widens its range to the whole page. It maps back what the provider
backs now, and a device may also fault on the rest of that page while
it is remapped. The widening finds the page with iova_to_phys():
pages that only look like one large page make the revoke remap more
than it must, which is harmless.

iommu_unmap() may not split the range of one map call either, and
virtio-iommu refuses to. Map each IOMMU page with its own call: the
widened range ends on IOMMU page boundaries, so it also ends on map
call boundaries.

A revoke now batches its unmaps with iommu_unmap_fast() and flushes the
IOTLB once.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 drivers/iommu/iommufd/pages.c | 114 +++++++++++++++++++++++++++++-----
 include/uapi/linux/iommufd.h  |  11 +++-
 2 files changed, 105 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index aa7740326ad6..4b284dae26fe 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -241,11 +241,17 @@ static void iommu_unmap_nofail(struct iommu_domain *domain, unsigned long iova,
 }
 
 /*
- * Provider pages are mapped with PAGE_SIZE entries, and may have holes.  Some
- * IOMMU drivers warn when asked to unmap an IOVA that is not mapped, so find
- * the runs that are mapped and unmap each one, without touching the holes.
- * iopt_provider_map() refuses frame 0, which iova_to_phys() reports for
- * an IOVA that is not mapped.
+ * Provider pages may have holes.  Some IOMMU drivers warn when asked to unmap
+ * an IOVA that is not mapped, so find the runs that are mapped and unmap each
+ * one, without touching the holes, and flush the IOTLB once at the end.
+ * iopt_provider_map() refuses frame 0, which iova_to_phys() reports for an
+ * IOVA that is not mapped.
+ *
+ * A run may hold large entries, which can only be unmapped whole: neither end
+ * of the range may fall inside one.  iopt_provider_map() maps each entry with
+ * its own call, so an end that is not inside an entry does not split a map
+ * call either, which iommu_unmap() does not allow.  The ends of the area are
+ * safe, and iopt_provider_revoke() widens its range to the entries it cuts.
  */
 static void iopt_provider_unmap(struct iopt_area *area,
 				struct iommu_domain *domain,
@@ -254,19 +260,23 @@ static void iopt_provider_unmap(struct iopt_area *area,
 {
 	unsigned long iova = iopt_area_index_to_iova(area, start_index);
 	size_t left = (last_index - start_index + 1) * PAGE_SIZE;
+	struct iommu_iotlb_gather gather;
 
+	iommu_iotlb_gather_init(&gather);
 	while (left) {
 		size_t len = 0;
 
 		while (len < left && iommu_iova_to_phys(domain, iova + len))
 			len += PAGE_SIZE;
 		if (len)
-			iommu_unmap_nofail(domain, iova, len);
+			WARN_ON(iommu_unmap_fast(domain, iova, len, &gather) !=
+				len);
 		/* Step over the run and the hole page that ended it. */
 		len = min(len + PAGE_SIZE, left);
 		iova += len;
 		left -= len;
 	}
+	iommu_iotlb_sync(domain, &gather);
 }
 
 static void iopt_area_unmap_domain_range(struct iopt_area *area,
@@ -1700,11 +1710,30 @@ static int iopt_provider_prot(struct iopt_area *area, u32 attrs)
 	return prot;
 }
 
+/*
+ * The size of the entry that maps @len bytes at @iova to @paddr, the largest
+ * that iopt_provider_entry() looks for and that fits.  Mapping each entry with
+ * its own call keeps the revoke from splitting a map call.
+ */
+static size_t iopt_provider_entry_size(struct iommu_domain *domain,
+				       unsigned long iova, phys_addr_t paddr,
+				       size_t len)
+{
+	unsigned long sizes = domain->pgsize_bitmap &
+			      GENMASK(PUD_SHIFT, PAGE_SHIFT + 1);
+	u64 align = iova | paddr;
+
+	sizes &= GENMASK(__fls(len), 0);
+	if (align)
+		sizes &= GENMASK_ULL(__ffs64(align), 0);
+	return sizes ? BIT(__fls(sizes)) : PAGE_SIZE;
+}
+
 /*
  * Map what the provider backs in [start_index, last_index] of the area into
- * @domain, and leave the holes unmapped.  Each frame is mapped with a
- * PAGE_SIZE entry, so that a revoke of part of a large block never has to
- * split a larger IOMMU page.  On failure nothing in the range is mapped.
+ * @domain, and leave the holes unmapped.  Each block that the provider reports
+ * is mapped with the largest entries that the IOVA and the frames allow, one
+ * call per entry.  On failure nothing in the range is mapped.
  */
 static int iopt_provider_map(struct iopt_area *area, struct iopt_pages *pages,
 			     struct iommu_domain *domain,
@@ -1729,7 +1758,8 @@ static int iopt_provider_map(struct iopt_area *area, struct iopt_pages *pages,
 		return -EOPNOTSUPP;
 
 	while (index <= last_index) {
-		unsigned long pfn, iova, block_end, nr, i;
+		unsigned long pfn, iova, block_end, nr;
+		size_t len, done, size;
 		int order = PUD_ORDER;
 		u32 attrs;
 		int prot;
@@ -1752,20 +1782,25 @@ static int iopt_provider_map(struct iopt_area *area, struct iopt_pages *pages,
 		iova = iopt_area_index_to_iova(area, index);
 		prot = iopt_provider_prot(area, attrs);
 
-		for (i = 0; i < nr; i++) {
-			rc = iommu_map_nosync(domain, iova + i * PAGE_SIZE,
-					      PFN_PHYS(pfn + i), PAGE_SIZE, prot,
+		len = nr * PAGE_SIZE;
+		for (done = 0; done < len; done += size) {
+			size = iopt_provider_entry_size(domain, iova + done,
+							PFN_PHYS(pfn) + done,
+							len - done);
+			/* On failure, iommu_map_nosync() unmaps what it mapped. */
+			rc = iommu_map_nosync(domain, iova + done,
+					      PFN_PHYS(pfn) + done, size, prot,
 					      GFP_KERNEL_ACCOUNT);
 			if (rc)
 				break;
 		}
-		if (i) {
-			int sync_rc = iommu_sync_map(domain, iova, i * PAGE_SIZE);
+		index += done >> PAGE_SHIFT;
+		if (done) {
+			int sync_rc = iommu_sync_map(domain, iova, done);
 
 			if (!rc)
 				rc = sync_rc;
 		}
-		index += i;
 		if (rc)
 			goto err_unmap;
 	}
@@ -1804,9 +1839,51 @@ static int iopt_provider_fill_domains(struct iopt_area *area,
 	return rc;
 }
 
+/*
+ * Find the large entry that may hold page @index, which iopt_provider_unmap()
+ * can only remove whole, and return its first and last index.  An entry of a
+ * given size is aligned to it, lies inside the area, and maps its pages
+ * linearly, so look for the largest such block around @index.  Mapped pages
+ * that only look like one entry make the revoke remap more than it must, which
+ * is harmless.
+ */
+static void iopt_provider_entry(struct iopt_area *area,
+				struct iommu_domain *domain,
+				unsigned long index, unsigned long *first,
+				unsigned long *last)
+{
+	unsigned long iova = iopt_area_index_to_iova(area, index);
+	/* iopt_provider_map() maps at most a PUD-sized block at once. */
+	unsigned long sizes = domain->pgsize_bitmap &
+			      GENMASK(PUD_SHIFT, PAGE_SHIFT + 1);
+	phys_addr_t phys = iommu_iova_to_phys(domain, iova);
+
+	*first = *last = index;
+	if (!phys)
+		return;
+
+	while (sizes) {
+		unsigned long size = BIT(__fls(sizes));
+		unsigned long start = ALIGN_DOWN(iova, size);
+		unsigned long end = start + size - PAGE_SIZE;
+
+		sizes &= ~size;
+		if (start < iopt_area_iova(area) ||
+		    end + PAGE_SIZE - 1 > iopt_area_last_iova(area))
+			continue;
+		if (iommu_iova_to_phys(domain, start) != phys - (iova - start) ||
+		    iommu_iova_to_phys(domain, end) != phys + (end - iova))
+			continue;
+		*first = iopt_area_iova_to_index(area, start);
+		*last = iopt_area_iova_to_index(area, end);
+		return;
+	}
+}
+
 /*
  * The provider changed the frames behind [offset, offset + len).  In every
- * domain, unmap the range and map what the provider backs now.  A device that
+ * domain, unmap the range and map what the provider backs now.  A large entry
+ * that the range cuts is unmapped and mapped again whole.  A device that
  * accesses the range in between faults.
  */
 static void iopt_provider_revoke(struct mem_provider_attachment *att,
@@ -1836,9 +1913,12 @@ static void iopt_provider_revoke(struct mem_provider_attachment *att,
 		struct iopt_area *area = track->area;
 		unsigned long s = max(first, iopt_area_index(area));
 		unsigned long l = min(last, iopt_area_last_index(area));
+		unsigned long unused;
 
 		if (s > l)
 			continue;
+		iopt_provider_entry(area, track->domain, s, &s, &unused);
+		iopt_provider_entry(area, track->domain, l, &unused, &l);
 		iopt_provider_unmap(area, track->domain, s, l);
 		rc = iopt_provider_map(area, pages, track->domain, s, l);
 		if (rc)
diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index b4500fc21368..04ca2a244267 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -241,9 +241,14 @@ struct iommu_ioas_map {
  * behind any range at any time, and the mapping follows: pages that the
  * provider does not back are left unmapped, read-only pages are mapped
  * without write permission, and device memory is mapped as MMIO. A device
- * access to a page that is being changed, or that is not backed, faults. Such
- * a mapping cannot be split by a partial unmap, and in-kernel accesses to it
- * are refused. It is not supported in an IOAS with a dirty tracking domain.
+ * access to a page that is being changed, or that is not backed, faults.
+ * Large IOMMU pages are used where @iova and the provider's memory are aligned
+ * alike; a change to part of a large page remaps all of it, so a device may
+ * also fault on the rest of it while that happens. If the remap after a change
+ * fails, the range stays unmapped; userspace recovers by unmapping the file
+ * and mapping it again. Such a mapping cannot be split by a partial unmap, and
+ * in-kernel accesses to it are refused. It is not supported in an IOAS with a
+ * dirty tracking domain.
  */
 struct iommu_ioas_map_file {
 	__u32 size;
-- 
2.47.3


