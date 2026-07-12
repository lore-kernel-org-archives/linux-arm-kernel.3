Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C88C44506
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 21:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDNXuZBAqjn/E8x//VWR9RhMVgZnkLggONWA/HHqhig=; b=ZEExiq6s9AVbH5cvpQElY4AY8l
	T8IV9AnKflizo4iwKhPzdol7rRTK941wjZJXRRKk9DPw6PrpOl+dssfujazXw/04JLK8yARRca19H
	KO/vfbTyk5WiCK47mD9nk8ghKG0n/tqhKAgJkmuByCHsM9lgtAqCs4MzXGxIB/kB5TYj7K3+2gjrv
	q1/2MmKw44cT3KsAKvfECnaq2V2mGHqQTiNJLQCC9rPtM6quF7iTmOs0WZ/tt1tSLeMTg+Mx8g8TZ
	Cq7zdWR+kF7Phjq24tGoRaRfWCFVONtg55+iVJ4ZTdjCew9pFgKHNgDDaFOd5GMqVPG2n5hp00gq3
	C1hrskgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1aH-00000007lIe-0Iwc;
	Sun, 12 Jul 2026 21:19:33 +0000
Received: from out12-31.antispamcloud.com ([185.201.16.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1a8-00000007lFD-3Vm4;
	Sun, 12 Jul 2026 21:19:26 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx195.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1wj1Zt-00GoOi-3N; Sun, 12 Jul 2026 23:19:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DDNXuZBAqjn/E8x//VWR9RhMVgZnkLggONWA/HHqhig=; b=gZ5xC8nTiujbtnalGoOBB6xjLB
	Dfm8Lq/kZRnPstVeYqFgWGLMJi+AXdUxvKU3JaraQ8MmzEHc8ElMHRmsJ4OLgVDQi91L7uN160glM
	bxxguiQEmUG5qEJW9NpY4tGHcDug5U375z9DixRzwzhNwbXg4kZWd/iSHsMZhZ0c1JmkGzZLTH/5E
	ZN/bYnX05JlT8zMcW7XuD9RIiCS+9mg6dYSdFxKVgNzhJv891IqCB/shb6zdybw67WmGULXDoEHQP
	KD+Wze9dWrVrMxqzdbdNLC0XzkXih1oDr1+M4wIkBAWYH6OYiYQ/dkdO5WfnvqBgqV4gcGmj/jor/
	qmc+41QQ==;
Received: from [188.251.249.2] (port=43526 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <dan@reactivated.net>)
	id 1wj1Zq-0000000D6jk-0raK;
	Sun, 12 Jul 2026 21:19:06 +0000
From: Daniel Drake <dan@reactivated.net>
Date: Sun, 12 Jul 2026 22:18:52 +0100
Subject: [PATCH 2/6] iommupt: allow full-table contiguous leaves in unit
 tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-bcm2712-iommu-submit-v1-2-80e10cdde2ea@reactivated.net>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Daniel Drake <dan@reactivated.net>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, 
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.3
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Originating-IP: 192.250.231.249
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuVJ1hybdgXAyR4gyvwoLberAVSXKZ1AHPG6
 BTrVnKc75yu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIMl6kNTi5f5Ljs8M8nl33UbGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWCulNo0fvnzmZPW3MC2/ZtQeB7itP8hgjDRserKv4bhb3RyZlCL9i3kc+ehInPHgYZWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKclZzoe+TZdeH39wA4E
 grA4pE2PuLHIFQdBY9qb1rRWgyz0f29FZkQs6Ir87R/YNAtVzCPMWB8YiCVMyNt8jc1XYCTwuapY
 HJC4Tg2AsI28yi/dAa2TOnnczQuRE5msdQvx7x6TyzQygoCqslGluZauEuYXMjE4hTY0I3yya8U2
 jiBi1+p615Zso12vM2KCXe+L+BWU3diRaOYz9oc1tEKKEEfmr+ndqHTRP8aRGVatgmq6HzuQCGnn
 Tr3mO80I+WGf3He7jw4SoVhmTJ/3eP9OK8gYxuf4cLtZNp2k2WPcLin5ZMVYU7yNzdI5xqOV/A3g
 I76KIb/qJBMhevARlsatJqEylk1bBhjIWUVQpiEaCSJav4VkFrk/gqlx5FextQtEBRpnK9diwaq6
 f6CydGvDt3K1cl7mca7sWC/TjRz/cJYxsQRt/d4lhqv4oGXrB8ohU2BXFG8+WkvtZVo+JtxTPVht
 kelGIuyBfLEgNwn2D8zbg4Paoa3pNVQ0zl7t/+UIhlD770gsG4NDLnuybwGB6H1bOhFowpwrz0y/
 WpAnxs5pZJhOUQY/VSc1PV9silww77YaJhiT+NFWJZPoD/NF86TgtruyOWQA4kTJivF4YMLqzhpS
 0znDaGCPRF8atS6+/IVQTbUJupnRiHmHNLRPMKbVSbsDMLsDJjzehgqGk6S9HXdEGxiktrX59Amx
 O5gvPpyylyRksDtvh9EglVwlXarBbY/5t7CstIBQE8o/YSFDpQ3A7hHzYZTDTFQbY0uqoOhT9kj8
 8PvWZJaonRQv++DuIQUs/5JJj4C/n4CILhif+3TxP9sd7y15THR2QZyGg3EQOEtB6O5zAxbwt8f8
 OMYGUgbNMUWTOHN+J/NrZnOVLbMF4pTjWB0otgBwB1GjG9/7eW4VzmKFOpkivUGpcgYFRrqmiqIy
 cv2/2+nkpYsEMysPur9wmiDBurOy6iR92AkV20DuvQ+xF0HoW5AQikKYGfM1Wxpi+aM7bRAnIOLo
 KQ0J9yQ0dfrf1qMUYpnxHriJz7Z9ZB5zQq6r8umW4yWfyKeLns0rLmGoFmUivONn/VZF/HyORicl
 1WGsneIWpF1Xu3oZ/FZQiE2Ny7dG9R/2gMGq0KWAzmMf+ibVDnUBndNaXaq/kyxZOii4y6zwY127
 8R9pzC31fkjBqL4nASEz1JNCESIPL2LJqBM7qaqIrXo0c6G6fvFF//i6zRUhEWyJzIkwSFAW0Pw8
 uiKeSByqtznmWyRPJzMvReGPtOJKZj6+qwdjWpxBAv2JzzLwY1278R9pzC31fkjBqL4n6ihrjW1z
 DU0jv8+sl3B5Xg==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_141925_163882_DB36EFBF 
X-CRM114-Status: GOOD (  18.63  )
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

The generic_pt tests currently assume that a format should never support
a contiguous page size that spans the entire mapping range of the table
it resides in.

This assumption breaks for BCM2712, which has a 2-level page table.
Level 1 entries cover 4MB of memory via their corresponding Level 0
table pages. There is a concept of a 4MB largepage, but that is
represented as a Level 1 entry pointing at a Level 0 table with the 1024
usual PTEs with an additional largepage hint applied (for TLB
optimization purposes). Unlike typical IOMMUs, it is not possible to have
the Level 1 entry point directly at a 4MB chunk without the need for
Level 0 mapping.

This BCM2712 format is well supported by generic_pt: SZ_4M can be
advertised as a possible size at Level 0 (so that the iommu core feeds
it 4MB-aligned mapping requests where possible), and drivers can also
advertise that *all* leaf entries are installed at Level 0. This indicates
that the tests are overly strict.

Transform the test to become a validation of the driver's routing intent:
for every advertised page size, check that pt_pgsz_lg2_to_level() maps that
size back to the table level under test. This is roughly what the original
tests were doing, but also allows the BCM2712 case to pass.

Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 drivers/iommu/generic_pt/kunit_generic_pt.h | 39 +++++++++++------------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/generic_pt/kunit_generic_pt.h b/drivers/iommu/generic_pt/kunit_generic_pt.h
index ef2c90b6d6af..7f4e172ef08b 100644
--- a/drivers/iommu/generic_pt/kunit_generic_pt.h
+++ b/drivers/iommu/generic_pt/kunit_generic_pt.h
@@ -419,40 +419,35 @@ static void test_table_radix(struct kunit *test)
 	}
 }
 
-static unsigned int safe_pt_num_items_lg2(const struct pt_state *pts)
-{
-	struct pt_range top_range = pt_top_range(pts->range->common);
-	struct pt_state top_pts = pt_init_top(&top_range);
-
-	/*
-	 * Avoid calling pt_num_items_lg2() on the top, instead we can derive
-	 * the size of the top table from the top range.
-	 */
-	if (pts->level == top_range.top_level)
-		return ilog2(pt_range_to_end_index(&top_pts));
-	return pt_num_items_lg2(pts);
-}
-
 static void test_lvl_possible_sizes(struct kunit *test, struct pt_state *pts,
 				    void *arg)
 {
-	unsigned int num_items_lg2 = safe_pt_num_items_lg2(pts);
 	pt_vaddr_t pgsize_bitmap = pt_possible_sizes(pts);
 	/* Matches get_info() */
 	pt_vaddr_t limited_pgsize_bitmap =
 		log2_mod(pgsize_bitmap, pts->range->common->max_vasz_lg2 - 1);
 	unsigned int isz_lg2 = pt_table_item_lg2sz(pts);
+	unsigned int sz_lg2;
 
 	if (!pt_can_have_leaf(pts)) {
 		KUNIT_ASSERT_EQ(test, pgsize_bitmap, 0);
 		return;
 	}
 
-	/* No bits for sizes that would be outside this table */
+	/* A page size cannot be smaller than the span of a single entry. */
 	KUNIT_ASSERT_EQ(test, log2_mod(pgsize_bitmap, isz_lg2), 0);
-	KUNIT_ASSERT_EQ(
-		test,
-		fvalog2_div(limited_pgsize_bitmap, num_items_lg2 + isz_lg2), 0);
+
+	/*
+	 * Ensure every page size claimed to be supported at this level
+	 * actually routes back to this level
+	 */
+	for (sz_lg2 = 0; sz_lg2 < PT_VADDR_MAX_LG2; sz_lg2++) {
+		if (limited_pgsize_bitmap & log2_to_int(sz_lg2)) {
+			KUNIT_ASSERT_EQ(test,
+				pt_pgsz_lg2_to_level(pts->range->common, sz_lg2),
+				pts->level);
+		}
+	}
 
 	/*
 	 * Non contiguous must be supported. AMDv1 has a HW bug where it does
@@ -463,12 +458,6 @@ static void test_lvl_possible_sizes(struct kunit *test, struct pt_state *pts,
 		KUNIT_ASSERT_TRUE(test, pgsize_bitmap & log2_to_int(isz_lg2));
 	else
 		KUNIT_ASSERT_NE(test, pgsize_bitmap, 0);
-
-	/* A contiguous entry should not span the whole table */
-	if (num_items_lg2 + isz_lg2 != PT_VADDR_MAX_LG2)
-		KUNIT_ASSERT_FALSE(
-			test, limited_pgsize_bitmap &
-					log2_to_int(num_items_lg2 + isz_lg2));
 }
 
 static void test_entry_possible_sizes(struct kunit *test)

-- 
2.55.0


