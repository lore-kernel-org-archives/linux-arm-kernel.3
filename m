Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B8BD72368
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJkNXHiazd0dwH31jEBkLazzm2uWsRVuYgNsDwicVtY=; b=XAdm+6H2jnW04alt0OanN6BTa0
	J2bavA6JBddqmVQHdQbtdNDgaHdhcCsJVljxrdy56MElpM1C7Jtg+zRohij2w3ALCXZtmdEc3Omp2
	di3Wep5g9j9KwKNGNsTwlWpGyp8O2WGT+FM289sNfQX9T0/8rmxb+kJPtBkeZypAAJv3H61ECOQa2
	rvF6jeEnOkJdWcH/7ISfK8jHV+9RNmkAiMefRrIg+rZIlJxZ2I5tOBzZRk4X5hEccrduR4FE7QsxT
	iKSzLLBNWjI21OisF0nfushSD+g6Ey7mLDmiDxOGl5SzOIQjjJJFfjVYjUJIu6gUtQnwhGVfm9Teh
	zkcR5Sbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDrd-00000008czB-1Aqr;
	Fri, 23 Jan 2026 09:54:01 +0000
Received: from mail-m32118.qiye.163.com ([220.197.32.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDrb-00000008cuT-05OS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:54:00 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31bc9a766;
	Fri, 23 Jan 2026 17:53:52 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ge Gordon <gordon.ge@bst.ai>,
	Arnd Bergmann <arnd@arndb.de>
Cc: BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v5 2/6] mmc: sdhci: allow drivers to pre-allocate bounce buffer
Date: Fri, 23 Jan 2026 17:53:38 +0800
Message-ID: <20260123095342.272505-3-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123095342.272505-1-yangzh0906@thundersoft.com>
References: <20260123095342.272505-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bea46453109cckunm2b675df11c3da1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTEMfVh5DSkgYGEpLSkNDTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=PzvIHpSCmK66dnvT0ft3KvRFx+FVWMdDumgNLodw9BVs7lOxgoh81nvrT0KCoMJqz8L8eNyIwfuNB4bhONpWIZ+G0AqA5JJ2/vOyG4Oe+e+C4AEHLXBTQEPxAJOG/Vf8H7+gucus8ETIsdzOM31xnEvN7A3xPAMbrfZaa7eEadA=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=gJkNXHiazd0dwH31jEBkLazzm2uWsRVuYgNsDwicVtY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_015359_491856_4F1D07CB 
X-CRM114-Status: GOOD (  12.00  )
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

Allow platform drivers to pre-allocate bounce buffer by checking if
host->bounce_buffer is already set before attempting allocation.

This enables platforms with specific DMA constraints (such as 32-bit
DMA on controllers that cannot access high memory) to use their own
reserved memory regions for the bounce buffer.

Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>

---
Changes for v5:
- Split from platform series per Arnd's feedback

Changes for v4:
- New patch suggested by Adrian Hunter
---
 drivers/mmc/host/sdhci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index ac7e11f37af7..dc5960e72a38 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -4193,6 +4193,12 @@ static void sdhci_allocate_bounce_buffer(struct sdhci_host *host)
 	unsigned int bounce_size;
 	int ret;
 
+	/* Drivers may have already allocated the buffer */
+	if (host->bounce_buffer) {
+		bounce_size = host->bounce_buffer_size;
+		max_blocks = bounce_size / 512;
+		goto out;
+	}
 	/*
 	 * Cap the bounce buffer at 64KB. Using a bigger bounce buffer
 	 * has diminishing returns, this is probably because SD/MMC
@@ -4241,6 +4247,7 @@ static void sdhci_allocate_bounce_buffer(struct sdhci_host *host)
 
 	host->bounce_buffer_size = bounce_size;
 
+out:
 	/* Lie about this since we're bouncing */
 	mmc->max_segs = max_blocks;
 	mmc->max_seg_size = bounce_size;
-- 
2.43.0


