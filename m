Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55308C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 03:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oW1Uefy+f4dgCipPdsbyESQqmd5EwkMRGfQFSNX/cxs=; b=UnsASMeiJHdzvpRSJwEYznV3DV
	Smx6tn1l+5PvydPZGJQa23PaWejmkqG0jlmdR8Nfszdgs0rAxxYj6Tar0PWDeBRW9ZA/UNkyrKnoQ
	nLIT80Ei17ih/JDjFdknXVzz31Hw3+erPzc1dk8SeZTXv4wflYrCxMrqOkurrFp4YfURc418vztX9
	JDrpa0HEYPZ+LT+zmq2WSODsV1POGu9mgpAU1vzWIu0YAuXH+c73MOg9rVyyJNriyYP9UrX3pK5i5
	ODAc2Bc+ho+a0cOekuMDHAzfCiJ4lUuXvNuQaHrQ7oFB9Rzdsvfsc1I3tCUZkvycoPAC0GmjPxPtr
	hOX6qEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCsL2-0000000HFWf-1I6z;
	Thu, 08 May 2025 03:54:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCsJ4-0000000HFNg-1cG6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 03:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746676341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oW1Uefy+f4dgCipPdsbyESQqmd5EwkMRGfQFSNX/cxs=;
	b=S6XginuLz3Ee7fQU73F7z5U511Z1tE5FbEFMT4J0vK9148RmrMJqFTZLZlck9nJXUiAK9J
	3+lNXcJyKb4DO0TG73dU2vSuzOub8Yuj6Tv2o4PFMVgycLQjpxvvs9hB5X+4uHcIdVIHWM
	oYoGAksgdATvhjBUjvOEoitGA4rwZhQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-161-0n-XLoZXNXCH5N2aVHTTAQ-1; Wed,
 07 May 2025 23:52:16 -0400
X-MC-Unique: 0n-XLoZXNXCH5N2aVHTTAQ-1
X-Mimecast-MFC-AGG-ID: 0n-XLoZXNXCH5N2aVHTTAQ_1746676335
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C77EB180036F;
	Thu,  8 May 2025 03:52:14 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.rmtau.csb (unknown [10.64.136.14])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 24E77180049D;
	Thu,  8 May 2025 03:52:08 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	gshan@redhat.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	yangyicong@hisilicon.com,
	shan.gavin@gmail.com
Subject: [PATCH] arm64: mm: Drop duplicate check in pmd_trans_huge()
Date: Thu,  8 May 2025 13:51:42 +1000
Message-ID: <20250508035142.189726-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_205222_502556_1574F2CB 
X-CRM114-Status: GOOD (  12.29  )
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

pmd_val(pmd) is inclusive to pmd_present(pmd) since the PMD entry
value isn't zero when pmd_present() returns true. Just drop the
duplicate check done by pmd_val(pmd).

No functional changes intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
Found this by code inspection
---
 arch/arm64/include/asm/pgtable.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d3b538be1500..2599b9b8666f 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -739,8 +739,7 @@ static inline int pmd_trans_huge(pmd_t pmd)
 	 * If pmd is present-invalid, pmd_table() won't detect it
 	 * as a table, so force the valid bit for the comparison.
 	 */
-	return pmd_val(pmd) && pmd_present(pmd) &&
-	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
+	return pmd_present(pmd) && !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-- 
2.49.0


