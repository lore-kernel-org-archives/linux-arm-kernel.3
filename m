Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0DBC5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 18:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjZRp1nhDTDgCD+T8te9v5HqJu4svj9GdgkIOM/whNM=; b=Z5B5g6q1UbkXbqx/6n6/jQYh28
	UJIASS+J3MyxVsh8Lzd6HBbwKiQ9cvThW1GDbNA1WWpIrF5ZQGIdEOTY98/th994PyhyMITQj3B/h
	urBOsa21CyoykV6ufsmywHaBye0eUdQUlhGYk+Zy+L1Mnr8w6wtH2UlUVWcbuaXQwgtqEWNjumDiQ
	K7C0Jt7j9Tm4dItGvRLQ2UNRU+KG+JxEA63JZs3qHMDnr5Jq5jU2pFaYLiQIUONtN2sS+mLpNCHIr
	XaZW4+2Uv0j9gWelk2/GnHhHGPOBHCd4ihjsfw5HzZvFTn5mZzDopqBfnKe/jCeL7XJl7Mj0WbK84
	k2HhApdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpVFX-0000000B8Ql-0y9r;
	Thu, 30 Jul 2026 18:12:55 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpVFS-0000000B8PR-07jx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 18:12:51 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso85565a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 11:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785435169; x=1786039969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjZRp1nhDTDgCD+T8te9v5HqJu4svj9GdgkIOM/whNM=;
        b=Jx/TGaj3yiedRup7TRLjfR78dvMKFy8gUFKsEnMzvCV3Lu7hY6anQ858QxgbHU+0zU
         dm37myyQv295f0OEVMwYHidCcRCoBMVv0E3zDVMwVSKS4Uk0gnSvp1eeYU+76hTKHMiW
         PUqr0I17jvfUTZ6Y/hHFykJVoNm/Ilc0xkAnNyBp8EYk0+LD7sO/2A2l86mSWMWzrnQy
         zn9HNFDNuSXbJjbOtz9SdQfRouqR64Qn6vlO/6AFtBglcRuD8stTAMN8X8W/XfocEzFm
         JrFwOQ9YZTDbxOAJcxpmosFC2ibegfax8M31QfDaX/SlsldPxzyZJ3QbOp7yj/dbf1z4
         35aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435169; x=1786039969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JjZRp1nhDTDgCD+T8te9v5HqJu4svj9GdgkIOM/whNM=;
        b=VN4AJqKAIOee7//Rf4gxTXxmIFxiefB9pThJrgoDzz9jUGi3bxtB+UctY3m7Jx3tSi
         C15pgbVNclBy3vMCAlRLhE+66OroKxJNjpYlyV5rdZRylJXX2ymf2aPWtOMuRtdE5eBu
         MCVSX2DRtA/1t9IJCtWHmG6d7NjihpJuqWRqOD6Z3rwMi1RQ8RzWvRa+KYx73/Ha3ZUe
         T2ZVVtK/pqmTh4i+4U/SCpTsX7Ad0f87iMW5JtVKaKMUbeQ8bxO4U9jV3Cu0cuqNG5MD
         ybVrhJ30zlBmsz9s/tenOPAu/IVn/jfHNcSWKXB5IDm8J5veHAgUXDJGo4rjS/8AajAy
         88wg==
X-Forwarded-Encrypted: i=1; AHgh+RpgfH+ZQALZ/ECXaoxe2ZGEGUhUewmD1PLCtdL2QLO8lsDZFe1wm4nm+oxYSBWEW27ltlakQo45ZaKNBhH2ySCO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3PvX23L+XVbecrYvvsMuQIZQI0ExNJivlCVWeM2SnLwbOYSLm
	oTaN8T8vq9T2/k2HlXu6pGIxLvI20yfHAoGdAwpJJqekGANxZzKwJJt0
X-Gm-Gg: AR+sD10v3C38tNen8uTwuSwsk+jQGbg2Ux7ocxHL4UlTcG/F4p8Ug8yFZyGsNrA0XFV
	L8ClM9mBanLycM2k2Dv/d6m+NkS5TlFyVM1XriH/ZOSwWqJetySEa3j7uLINaKzzK3dI02FJxG0
	MLrphPrBSwCZr1aRIphshrZXbXsodXki2D/knWwZaGaY/+hQNnBuUYy9DGsltpLJcW6+rNbpsV8
	DYFCiDU0PsXcYt3jypWwebS0lMxGaQPltWnpMnA3jv5LjUx3kSn0Siob/aljBtJuXd3uHsVz0kQ
	dt7zv2KOvkoWjPjoRu+FiUVjZeFYAwy35J8Kk7WTOKAJl60a99gWMb+5dHcQA3x+Fqw+k5CT80t
	W7/8ZVYdIc3veog1S2pEbBgorF0rnQTZEg2ZS8Udej0/IOO64veQB320ndHbULihQszGLbEGNTn
	jph0W5Z7t/7T53n6xVkyiyVgPMmbK8GBiM4VOzJz4ECKNUwRaDrw56J/cWeJ540qdGOWrFvy6Qg
	45zzUwwL3kiH5ozwy2CgjXuw7mFFLUohGFSWPdPSCeFhMhPDFsJpqf9Fy0inMg=
X-Received: by 2002:a05:6a21:3397:b0:3c3:9835:e75e with SMTP id adf61e73a8af0-3c9008f9f05mr3638201637.70.1785435168997;
        Thu, 30 Jul 2026 11:12:48 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (131.197.81.34.bc.googleusercontent.com. [34.81.197.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b124e4sm21998197eec.6.2026.07.30.11.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 11:12:48 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: will@kernel.org,
	joro@8bytes.org,
	akpm@linux-foundation.org
Cc: robin.murphy@arm.com,
	nicolinc@nvidia.com,
	cychu@google.com,
	hhchung@google.com,
	amitamishra@google.com,
	marscheng@google.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 1/2] iommu/arm-smmu-v3: Replace sort_nonatomic() with sort()
Date: Thu, 30 Jul 2026 18:12:15 +0000
Message-ID: <20260730181216.2709088-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
In-Reply-To: <20260730181216.2709088-1-visitorckw@gmail.com>
References: <20260730181216.2709088-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_111250_072698_D8A007EE 
X-CRM114-Status: GOOD (  15.93  )
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

The number of master->num_streams per master device is typically very
small in practice. Sorting this array takes a very small amount of
time, so there is no practical risk of triggering a soft lockup that
would necessitate calling cond_resched() during the sort.

Replace sort_nonatomic() with the standard sort(). Since this is the
only remaining in-tree caller of sort_nonatomic(), this change paves
the way to eventually remove the unused sort_nonatomic() API from the
core library.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Build-tested only.

I'm not really familiar with this driver or smmu internals.
Based on my limited knowledge, master->num_streams should be small
enough to safely switch from sort_nonatomic() to sort(), but I could be
wrong. 

Please review carefully and let me know if there are any cases where
num_streams could actually be large enough to cause issues.

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a10affb483a4..dcb6be2df95e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4047,9 +4047,9 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 	}
 
 	/* Put the ids into order for sorted to_merge/to_unref arrays */
-	sort_nonatomic(master->streams, master->num_streams,
-		       sizeof(master->streams[0]), arm_smmu_stream_id_cmp,
-		       NULL);
+	sort(master->streams, master->num_streams,
+	     sizeof(master->streams[0]), arm_smmu_stream_id_cmp,
+	     NULL);
 
 	mutex_lock(&smmu->streams_mutex);
 	for (i = 0; i < fwspec->num_ids; i++) {
-- 
2.55.0.508.g3f0d502094-goog


