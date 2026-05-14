Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EABCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4izeGUE5yc6CqsffIoYTcEPD1HGMIlHVDl1/1KC/ZM0=; b=ENG2gHCimUk7engDUBSrOKG7TH
	WCWqDqUPT6FdScnhTVYPghm0QkOawtJOZDlAZhgQCDN0nLmxPiDHfAdTc/YGMWa3XvPMm66OqH7TT
	zMqRZDZfLUeutml7UsBZY7CnLNGEA8FqipIIdFO6dE6V4kYCqQa+WabkAe/X6OQYmczmCcxLwPysb
	DVOUTZ+wdyw2uri2gXCUUrG8mCdEBj62OkUMmJBUMvLVf7eyO/dPZ522TxMfZdXnr6isevbIX8yvz
	IgJ7JaFOLOrM+UVBoi/VcHaSd/ke7xhvl2PDbntshwVRIiC/gO1/Zv80NHhr9NlvGvtcFowruvvmU
	sp8VmS8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSZi-0000000562W-30sw;
	Thu, 14 May 2026 09:41:50 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSZg-0000000560T-37J8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:41:49 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c80167f5716so3453940a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778751708; x=1779356508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4izeGUE5yc6CqsffIoYTcEPD1HGMIlHVDl1/1KC/ZM0=;
        b=HTCIpUoDSE1PvTT/b3XavKVBworssOxeI4Ia43axv7C57WDsArZQb+L7tGqaU1JRD4
         AZR7eIkZt4a86txYjOK971P6gAjQvVHab281IZrh1PI5i/FYxTh5AMCbwGtbbPcR144c
         TIUNPumK6pRqTkxWZuhcsJEZ55JSyOHwXt3Hnxg+WXM/beh1gXXJe4N79wXRK92req5N
         GOmsfpX/M+E+RGQvgEM0pIg+9XiaDlrbWeN9W7gtQr92iHLtSEnXveLTnxGV9+1fiXG+
         KhvZIU+z4igM55OhZkitbLh2TrqybXv8iLQIUwkEgs8lxySkcTRiZhxVlivDeoXKfonJ
         uw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751708; x=1779356508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4izeGUE5yc6CqsffIoYTcEPD1HGMIlHVDl1/1KC/ZM0=;
        b=TUxkeEP1VBRcSFUF7kDscM2/L5aZ5Im/wEinks9XJhMoCmnr0GHHmivPScXIfpI0SO
         Xaum3egAYZSvE4oCG5Y+UJd2A7bZ6l2zV0JgTI1V1doejhB3NH5ayN38d0JfH5Klc9lE
         5vb+y71WlPdoIejoa6WY3rRPB2ykU50G5OF3xtT6XdJ8ch3WBm2DhoFN1CsLwILMco/U
         J9shPwdhSLkgG/wOrb9OrYCACZmQFQq+/9y7KPpHjQbTGWSL6kSa/tmeeCVQG56SXDYw
         oY9J8A3nlQ1ouDo2M8U+T4ykGU6P8xm+9LP8xeNDE/Gu9587l2KeQrMOUkF0GKBmjHz3
         MTVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Auax6A4rT2akIaar45XzPrgP5azPVlB1mEdF2rR1P7FtwWYxePTQYqSKIHhUk8VoIutB8K60O0YlGjQcYDLOS@lists.infradead.org
X-Gm-Message-State: AOJu0YxvVjHZqqNH2x18SixLAXi5AQyf1wwFCwB+xFiyKUNcqdsA82a+
	x1b3XhyKwqLKls2PUV5gfKuuXIqni6nBWRPtfyB4NEmzpu86pn2cOVqa
X-Gm-Gg: Acq92OHijDy7TtI+LiOagZhkqUaeWn7X/U6iU9v99uYUTG3o8EfG03h2ea27PgVeT8C
	CdnKDEcpppSaxzxH5GiY54kTzSnRG3VhQnFvi568ToM8Q01skqyZSHAyDyvf2x4A+LoYqYq4Zj3
	U4cX6NJvVNvKCgJYoutsXKhaPWeKvhGWJBaNNAn/vBcSv6jpDxFQAtH81Cr9pLowNzDBa8AErpA
	jF07MJX1lLbynr0RSgXZY4y1raG9sBwDMQU4yGnUfZrAfWLgxbXTo0Jo9s5+aL0MEkSwkcQvRo1
	F3jEFE5Sa6DbKCL7cIC70m/vVkB6A4aC+cVlqwfNQU0D0MRmnEwfkegAEaswNLNAF7/jj2XTdZ+
	a7rBZ5xN7ocDOenoON8yGtg7tA2H6gvLgwUXV7OnY+oOWqhXVaCrsnUe6029ILjlcnbhgUTIQE4
	n/AZ8YTrwD5Fzdv3dYgQjvBrru9U9d5tLOzOzw3GdMkeMN8uWcYl7iD1DZ
X-Received: by 2002:a05:6300:6c07:b0:398:abe1:eaac with SMTP id adf61e73a8af0-3af8137634cmr5712299637.27.1778751707654;
        Thu, 14 May 2026 02:41:47 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb114a70sm2351244a12.22.2026.05.14.02.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:41:47 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: baohua@kernel.org,
	Xueyuan.chen21@gmail.com,
	dev.jain@arm.com,
	rppt@kernel.org,
	david@kernel.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v2 2/7] arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple CONT_PTE
Date: Thu, 14 May 2026 17:41:03 +0800
Message-Id: <20260514094108.2016201-3-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_024148_784845_61AF9CE7 
X-CRM114-Status: GOOD (  11.45  )
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Allow arch_vmap_pte_range_map_size to batch multiple CONT_PTE hugepages,
reducing both PTE setup and TLB flush iterations.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/include/asm/vmalloc.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c..9eea06d0f 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,6 +23,8 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
 	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
 	 * aligned in both virtual and physical space, then we can pte-map the
@@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;
 
-	return CONT_PTE_SIZE;
+	size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
+	size = 1UL << (fls(size) - 1);
+	return size;
 }
 
 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
-- 
2.34.1


