Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BCDC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhIqXs3b02Zr9EkAcj7RO68Dtso22D3FSSNBcsVaNJc=; b=ZlFaLmfSj+0TuICHht4I2BEN5S
	aW+yyPYTMaosla+g9UtizK5H0WM+/R4tszQU9T4fjmqfcDuqkIcH1RKonD3WHyahxYYW6Jum6/bm/
	o2jVI8izpig1LAOHnnuoUIFjyBFq9gWcdIvJ3V/iAEJh2vjeFL6uyCaD/v3aKyG56fmG1cZR2As9e
	q7I6Gch76cgoaNzXHspgiGQSGmxlIDB5ah4aUDRSh82Q+bVqlNTw/f9vm8cAFeYH7NVyh2qqa7Qsm
	U+SA0HZRVjGcClR8Yhd/5oNlz+sdprsEvC2W/W8Yua2UaCMsfC72/tVaRytszYdrbq9ord2D9FVPG
	zDlLkSag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57XW-0000000AZM0-1Oz8;
	Wed, 16 Apr 2025 18:31:14 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57Kk-0000000AXhw-4A62
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:18:04 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7be49f6b331so761638285a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 11:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1744827481; x=1745432281; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nhIqXs3b02Zr9EkAcj7RO68Dtso22D3FSSNBcsVaNJc=;
        b=n4EOAvi/S1GkWUrh1oqLljGbBMnkWN5nKd4H/wgm6b5JQdZhI9KXMAaSZexzx/+0Fj
         eOxrLB7msZhPxMILBhDZAvEYeghjOSQ7Kd4g1CoXQa2ZB0UaXsuNnBjup1TTvXRedWD0
         lAevh7DgYi7ox2hXWQMpi3hAQ7gep24bBlDOCw5j35ZzIJbNlwXzxukRywqY0kiOO3vP
         5Hblmaig0ILGwvE17AMdhwV1YZ3ceJtcUjt8Lj53cO735mz1buC15SMKDd1TBLb3qM5w
         sflYn/kvPfcGKsgSnSG31APZq0/LVkx3EXgqw6XrkzlNsGRasKa4b7gZnFAPMp4WnCcu
         47iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744827481; x=1745432281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhIqXs3b02Zr9EkAcj7RO68Dtso22D3FSSNBcsVaNJc=;
        b=Dw8FLFVp/8ixbwHFOmue8cibK6CHbyijD9wz2zxV8SgTkl/lFeEZ+6fUpVrr0KDw2p
         P4UrxdRPlCJd1sZl47kAE/DbtkhQgjtdnfWIbpjEJxjYDn6/LCsEaEXlitONlffYMrtu
         9wRjo4zsBzms0SXdZxU0NBEauzUw2Zqw577ou05MF449A/OB7Uh/hZMyV8F49NydzmUQ
         pGsQq/GmP5b8s/UDHgqJCtT8dqS0BDBYI/nJ8JcCqYOZnkSFbHBTHB/jypCMeRNQHbgt
         PjVIh66w+fiVv0uOwUFG7+ZXwvqpqyX5h3lXAvs/eVn7KskD81jbxccPGB/VvdtYljJb
         +Avg==
X-Forwarded-Encrypted: i=1; AJvYcCWHT0d93tbuAWRXOb+4l4rIT8JZFfEoyS2hBazOIFwJMGpsyGl0e/Bi2HyfeWzVUp/miKk18VxUqtflx0vgcryC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt5riURYZpXal4VIhaa6C+iMuyDjejC8L6YpDGORYwtT6XwXkR
	TdLzmndxrDMbomtRg7+D+9nUndcwA6juOvypOf0tdPhqgGRXcX5rsZtcP6WDcog=
X-Gm-Gg: ASbGncswJJIPzAY5ZQ/wBRYDy2EqIcblUwFOo47X7ySPkwU/MUH7Bs/WtJXnHpJmEVM
	9TQ9COw9dod3h+h019J3iDdX2HNlb1/TvTpizbCYENDGWMveaaMjQ2SB5nOVQabGuHa/KtA/2cq
	+vNA/OBTlb3ZagMao3Wp5djX2EWlqdW4RXhcguZxGFzM6hP8vB81OqhJZUQRinPc/JgVUFNMuE4
	KSxF5uVJ/pCUgB70aWV0RhpYzvZ0kFqklrlrmXiQ9VZNIMyj3XzXoy5eyz2QB2+hTZxwWnP0SXX
	lsb7U5m7wzez4V9XmQoay2wexkbCouw5uBry0nBz5x2xQwJykEcj5OhNFYjJ6Ci5g9LGVZDdbbB
	kODhnt1QGBklg+ESFn4Y=
X-Google-Smtp-Source: AGHT+IHO7Bqf4Fmw+LiZOuVSnpTOMSKYZPCbuJqFFE5vxmLzphTTuPO4Jd1IQCZQaz4uW5OwoW3Ysw==
X-Received: by 2002:a05:620a:171e:b0:7c5:af73:4f72 with SMTP id af79cd13be357-7c919064377mr376498885a.42.1744827481008;
        Wed, 16 Apr 2025 11:18:01 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0de1esm1088777885a.103.2025.04.16.11.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 11:17:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u57Kh-00000004wJB-0tjv;
	Wed, 16 Apr 2025 15:17:59 -0300
Date: Wed, 16 Apr 2025 15:17:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: Shyam Saini <shyamsaini@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH v2 0/3] arm-smmu: select suitable IOVA
Message-ID: <20250416181759.GF493866@ziepe.ca>
References: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
 <20250410230008.GA6905@ziepe.ca>
 <67fff12d.650a0220.208c7c.d69dSMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67fff12d.650a0220.208c7c.d69dSMTPIN_ADDED_BROKEN@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_111803_178603_A2382F7A 
X-CRM114-Status: GOOD (  20.00  )
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

On Wed, Apr 16, 2025 at 11:04:27AM -0700, Jacob Pan wrote:

> Per last discussion "SMMU driver have a list of potential addresses and
> select the first one that does not intersect with the non-working IOVA
> ranges.". If we don't know what the "non-working IOVA" is, how do we
> know it does not intersect the "potential addresses"?

I had understood from previous discussions that this platform is
properly creating IOMMU_RESV_RESERVED regions for the IOVA that
doesn't work. Otherwise everything is broken..

Presumably that happens through iommu_dma_get_resv_regions() calling
of_iommu_get_resv_regions() on a DT platform. There is a schema
describing how to do this, so platform firmware should be able to do it..

So the fix seems trivial enough to me:

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index b4c21aaed1266a..ebba18579151bc 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3562,17 +3562,29 @@ static int arm_smmu_of_xlate(struct device *dev,
 static void arm_smmu_get_resv_regions(struct device *dev,
 				      struct list_head *head)
 {
-	struct iommu_resv_region *region;
-	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
-
-	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
-					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
-	if (!region)
-		return;
-
-	list_add_tail(&region->list, head);
+	static const u64 msi_bases[] = { MSI_IOVA_BASE, 0x12340000 };
 
 	iommu_dma_get_resv_regions(dev, head);
+
+	/*
+	 * Use the first msi_base that does not intersect with a platform
+	 * reserved region. The SW MSI base selection is entirely arbitary.
+	 */
+	for (i = 0; i != ARRAY_SIZE(msi_bases); i++) {
+		struct iommu_resv_region *region;
+
+		if (resv_intersects(msi_bases[i], MSI_IOVA_LENGTH))
+			continue;
+
+		region = iommu_alloc_resv_region(msi_bases[i], MSI_IOVA_LENGTH,
+						 IOMMU_WRITE | IOMMU_NOEXEC |
+							 IOMMU_MMIO,
+						 IOMMU_RESV_SW_MSI, GFP_KERNEL);
+		if (!region)
+			return;
+		list_add_tail(&region->list, head);
+		return;
+	}
 }
 
 static int arm_smmu_dev_enable_feature(struct device *dev,

Jason

