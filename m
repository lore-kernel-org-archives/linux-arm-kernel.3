Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E979C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXGy0SHh8jrpSx+7uq/1tK4RtoEe8AnmCidff/RRwQA=; b=2e1sxcmD+cyf5OdTZap/QqiGq8
	o4t/fHJ1/Z2b6J/SgYi6arI+nb4djQ0TV+cWGXZ3bSj+ZHQ58iXm3WEP0qsj3S5hl5oN8EjIm5W5c
	vN4tVCUwchqvIkicBUCe9v0WwjX1eG4Lwz6Rdzz5kD5TdnBwhnw5fmCv2Rl7iTeklfRitNh4mNrUo
	DPDkbVdp3B/br6vBQcC9FcjUeaI+lReUTvsm/V1AdrOkP0/qYTD3siS0BwSyC8WmCiqR20gV9PdLB
	G7po68sXyrWNkazc/BEOX7WoirT5WPu618QpfbLVv/w3kX6wfmylq4fASbfWx5RfP9sWfQdik0H/1
	GUp9mRaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woSCM-00000003sjF-2W3Q;
	Mon, 27 Jul 2026 20:45:18 +0000
Received: from out13-173.antispamcloud.com ([185.201.17.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woSCI-00000003shZ-1PSP;
	Mon, 27 Jul 2026 20:45:17 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx198.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1woSC0-00FDyW-1i; Mon, 27 Jul 2026 22:45:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gXGy0SHh8jrpSx+7uq/1tK4RtoEe8AnmCidff/RRwQA=; b=xKzrLGTCjD0Wvn8T+2CSK9mmEP
	5gbte8SftUeRnlxAxEqHb0B26+LrCi46ypwLbXHFqIeFqsadp32pbjWpGAljUAdCCDCfPIlxrkV0m
	eyg/cpQlU1hhzyjDxvuPE045aHjivZXnIQU1LgXrRjJJoqzCkGANWLd8aN+xar40oEvURFxakr97W
	uSHPotntrvNVOu5fnKR2HNsayjhsDn5q1XNSYUbNa6A3lPsfdkMLRhNjKxUViYdsOiC+TkRY94xw6
	OaR2G3A+jJGvgz2jcXnjGXFESJf3VXi5vKUnJkwSUi4CvuSgnSQjpqQsvt6KQwzc7wL9KP5vjdrdE
	M4WZHVgQ==;
Received: from [188.251.249.2] (port=52006 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <dan@reactivated.net>)
	id 1woSBv-0000000AlhO-40wY;
	Mon, 27 Jul 2026 20:44:51 +0000
From: Daniel Drake <dan@reactivated.net>
Date: Mon, 27 Jul 2026 21:43:56 +0100
Subject: [PATCH v2 1/5] generic_pt: allow missing sw bit in DMA_INCOHERENT
 case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-bcm2712-iommu-submit-v2-1-0247b5c03de8@reactivated.net>
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
In-Reply-To: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
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
X-Spampanel-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuUrXUfs4B29vl3sm0928Wg7TGSVRZSTQZ6D
 d1+lfooj8iu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIM9P/1xMDIkquwg7ai9+tqqGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWAIN4GsiK0O3K+JEByc7IobeB7itP8hgjDRserKv4bhb/pXHHNX+LCF5x5jewa7FkNWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKclZzoe+TZdeH39wA4E
 grA4pE2PuLHIFQdBY9qb1rRWgyz0f29FZkQs6Ir87R/YNAsKIxDIUtFmywXPGNvcLD4XAsy6ZgPN
 XtV1vaLx7+UgEWK01AxdI+KkSxKhiIoeJ0jQMvgrc1wie1AEvvcTmPTytX698+ztXsH6JaapNvQF
 04irJjZh1zuwKVTcv9YdmjlVE03CQCv1OPOxZ3EyKTJGzDaNnaI/TSpIu7J1HoIZoPraGaqADwsr
 hpLSznzcewLJhIQpMZXNN5waPWBxruZklS+QlzUpPwM5oicrBfHSx0cq8sPOf6wGW9u/lWd24hqp
 yYmhcu01nwGh48ZvjBXmHyxxk8Sjs3o9/k8nLBnptL51csmNAdXgD5+6bU9gO3ZLn/njN5eSj526
 f3kLYY1T/P2g+PQ+l1DstpeYEVfxMxGAKIaxTMjXXNk1i3Bzs815ElLTCa2tTtJNS6kAj74zV8Jw
 2Fxq1Vd7xIu/TP3zx09ZxKUjiSltDxNYVDOGVSYSMZzCFfNlTB1XVH7neYUsHgYpny0exHkD4v2T
 MMb8rpk5QFK0AS+w7oZEh675gBR0cXT+dF0NxOWKiLIVw46C5KEt00Sv6nHHHAoc3/Q83cLqzhpS
 0znDaGCPRF8atS6+/IVQTbUJupnRiHmHNLRPMKbVSbsDMLsDJjzehgqGk6S9HXdEGxiktrX59Amx
 O5gvPpyylyRksDtvh9EglVwlXarBbY/5t7CstIBQE8o/YSFDpQ3A7hHzYZTDTFQbY0uqoOhT9kj8
 8PvWZJaonRQv++DuIQUs/5JJj4C/n4CILhif+3TxP9sd7y15THR2QZzkg3RQrvacrkZ+DYAj4Ojj
 HQAEwWflr/1yylAR2QMesXOVLbMF4pTjWB0otgBwB1GjG9/7eW4VzmKFOpkivUGpcgYFRrqmiqIy
 cv2/2+nkpYsEMysPur9wmiDBurOy6iR92AkV20DuvQ+xF0HoW5AQikKYGfM1Wxpi+aM7bRAnIOLo
 KQ0J9yQ0dfrf1qMUYpmRgnAod+6ZVPr8gZAM4Wbf+qcjHi4H/kJJ2RqjS9NOIeNn/VZF/HyORicl
 1WGsneIWpF1Xu3oZ/FZQiE2Ny7dG9R/2gMGq0KWAzmMf+ibVDnUBndNaXaq/kyxZOii4y6zwY127
 8R9pzC31fkjBqL4nASEz1JNCESIPL2LJqBM7qaqIrXo0c6G6fvFF//i6zRUhEWyJzIkwSFAW0Pw8
 uiKeSByqtznmWyRPJzMvReGPtOJKZj6+qwdjWpxBAv2JzzLwY1278R9pzC31fkjBqL4n6ihrjW1z
 DU0jv8+sl3B5Xg==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_134514_686015_C2AF2C2B 
X-CRM114-Status: GOOD (  18.44  )
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

When working with a iommu with PT_FEAT_DMA_INCOHERENT set, generic_pt
will attempt to use a spare "SW" bit in the hardware page tables to
denote when a thread has flushed the CPU cache after modifying an entry.
This means that other threads know that they are not working with
cached/unflushed data, if they come across the same entry.

In the case where no SW bit is implemented, an undefined reference to
__pt_no_sw_bit() is created, causing a linker error in order to prompt
the developer to implement this feature.

For BCM2712 IOMMU, no SW bit is available at the hardware level, so we now
need to permit this case.

Introduce a PT_FEAT_NO_SW_BIT flag to allow for this: this will avoid the
sw_bit codepaths, so no undefined reference is created. __map_range() will
fall back to defensive flushing every time it reads the PT, ensuring
that all data that may have just been manipulated by another thread gets
flushed and made iommu-visible immediately.

Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 drivers/iommu/generic_pt/iommu_pt.h        | 13 ++++++++-----
 drivers/iommu/generic_pt/pt_fmt_defaults.h |  7 +++++++
 include/linux/generic_pt/common.h          |  7 +++++++
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/generic_pt/iommu_pt.h b/drivers/iommu/generic_pt/iommu_pt.h
index c2752151c80a..54f9c311d0ac 100644
--- a/drivers/iommu/generic_pt/iommu_pt.h
+++ b/drivers/iommu/generic_pt/iommu_pt.h
@@ -484,7 +484,8 @@ static inline int pt_iommu_new_table(struct pt_state *pts,
 
 	if (pts_feature(pts, PT_FEAT_DMA_INCOHERENT)) {
 		flush_writes_item(pts);
-		pt_set_sw_bit_release(pts, SW_BIT_CACHE_FLUSH_DONE);
+		if (!pts_feature(pts, PT_FEAT_NO_SW_BIT))
+			pt_set_sw_bit_release(pts, SW_BIT_CACHE_FLUSH_DONE);
 	}
 
 	if (IS_ENABLED(CONFIG_DEBUG_GENERIC_PT)) {
@@ -702,10 +703,12 @@ static int __map_range(struct pt_range *range, void *arg, unsigned int level,
 			 * release of the cache flush so that this can acquire
 			 * visibility at the iommu.
 			 */
-			if (pts_feature(&pts, PT_FEAT_DMA_INCOHERENT) &&
-			    !pt_test_sw_bit_acquire(&pts,
-						    SW_BIT_CACHE_FLUSH_DONE))
-				flush_writes_item(&pts);
+			if (pts_feature(&pts, PT_FEAT_DMA_INCOHERENT)) {
+				if (pts_feature(&pts, PT_FEAT_NO_SW_BIT) ||
+				    !pt_test_sw_bit_acquire(&pts,
+							    SW_BIT_CACHE_FLUSH_DONE))
+					flush_writes_item(&pts);
+			}
 		}
 
 		/*
diff --git a/drivers/iommu/generic_pt/pt_fmt_defaults.h b/drivers/iommu/generic_pt/pt_fmt_defaults.h
index 69fb7c2314ca..72f341645294 100644
--- a/drivers/iommu/generic_pt/pt_fmt_defaults.h
+++ b/drivers/iommu/generic_pt/pt_fmt_defaults.h
@@ -249,6 +249,13 @@ static inline unsigned int pt_max_sw_bit(struct pt_common *common)
 	return 0;
 }
 
+/*
+ * In the DMA_INCOHERENT case, if no SW bit has been defined, produce a linker
+ * error (undefined symbol __pt_no_sw_bit) to alert the developer that this
+ * should be implemented. Alternatively, if this is not supported by the
+ * underlying hardware, PT_FEAT_NO_SW_BIT can be set, enabling sw-bit-less
+ * operation with a defensive flushing performance penalty.
+ */
 extern void __pt_no_sw_bit(void);
 static inline bool pt_test_sw_bit_acquire(struct pt_state *pts,
 					  unsigned int bitnr)
diff --git a/include/linux/generic_pt/common.h b/include/linux/generic_pt/common.h
index 07ef1c8341a4..9e8001f7b069 100644
--- a/include/linux/generic_pt/common.h
+++ b/include/linux/generic_pt/common.h
@@ -139,6 +139,13 @@ enum pt_features {
 	 * sub structure with information about which levels were changed.
 	 */
 	PT_FEAT_DETAILED_GATHER,
+	/**
+	 * @PT_FEAT_NO_SW_BIT: No software bit is available to denote when a
+	 * thread has flushed the CPU cache after modifying an entry. Only
+	 * set this if you cannot implement pt_sw_bit() due to hardware
+	 * limitations.
+	 */
+	PT_FEAT_NO_SW_BIT,
 	/* private: */
 	PT_FEAT_FMT_START,
 };

-- 
2.55.0


