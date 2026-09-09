Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A21C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 02:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgZCf1MgQGSCarsBSZXbw8T1G4s93KyaAhqYm1OiBLo=; b=VqURAakP4zR/qxXEIlCLIjL0pP
	FtT2TX96LFeUeZounho+lM+Wy6qE9Is30MyFJakK+3rhWquS+Hivgk+D5M1Vw9sIWqm/f9DBVMdUn
	K7G2zsEOv+X3FPYBkto6ShtZ8/DZRzWtBd2Tp0j/ysZ856MPJcPPOHD1BD1BqpU+Vqp4pNygA/seZ
	2//aniXnHHsKP8cAiKPFHryNh+DxTExAMznAkuexr6PLX5Dwd8FrrD43PNGmVWcHEf9VO8g9RwmwF
	GaIw/38T/bJXkFYHlSb4DU11gFrJ9ySvdIq1UcqlPcFs5cakuVLDvVViAkF50k7FDU1zG3TY7SMrG
	99kd4wag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x47z9-0000000AfQm-2EQm;
	Wed, 09 Sep 2026 02:24:27 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x47z5-0000000AfPf-1kqG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 02:24:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CgZCf1MgQGSCarsBSZXbw8T1G4s93KyaAhqYm1OiBLo=;
	b=Y910v+Y5eABPY8kElCpbNXnpm2xezNE4Caxux5KPcjkB2OiwgCEPofiZ4H39hZMotPTUZ1pT0
	QwODdXsF1+whgUYKAkKsA4181r7iNN2j4YjofMgWa+hWK1KS287eBD7b2GTPI75c6P18wQFBKnu
	KbWB+IMvJADzkKZ1CpMkGkg=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hfkqg298VzLlX5;
	Wed,  9 Sep 2026 10:13:19 +0800 (CST)
Received: from whupemk300003.china.huawei.com (unknown [7.152.185.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D79C4048B;
	Wed,  9 Sep 2026 10:24:13 +0800 (CST)
Received: from huawei.com (10.50.87.204) by whupemk300003.china.huawei.com
 (7.152.185.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 10:24:12 +0800
From: Zhang Yuwei <zhangyuwei20@huawei.com>
To: <quic_vjitta@quicinc.com>
CC: <zhangyuwei20@huawei.com>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <robin.murphy@arm.com>,
	<quic_prakgupt@quicinc.com>, <chenjun102@huawei.com>
Subject: [RFC] Partial iommu_unmap issue with contiguous PTE hint enabled
Date: Wed, 9 Sep 2026 10:18:55 +0800
Message-ID: <20260909021855.520173-1-zhangyuwei20@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.204]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemk300003.china.huawei.com (7.152.185.49)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_192423_930813_E1D39CFC 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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

Hi Vijayanand,

I have a question regarding the contiguous hint patch set:
https://lore.kernel.org/linux-iommu/20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com/

We encountered an issue during partial unmapping when contiguous PTE
hints (CONT bit) are set. Here is the scenario we observed:

1. Setup / Mapping:
   - Under 4 KiB page granule, a 64 KiB memory region is mapped via
     dma_map_page() (or iommu_map()).
   - Because the 64 KiB range meets the contiguous hint requirement
     (16 x 4 KiB PTEs), all 16 PTEs are programmed with the CONT bit set.

2. Partial Unmapping Trigger:
   - Later, iommu_unmap() is invoked to unmap a 32 KiB partial range
     within this 64 KiB block.

3. Observed Behavior:
   - Calling iommu_unmap() triggers a kernel WARN.
   - Only 28 KiB is successfully unmapped before the operation halts.
   - The remaining memory in this region can no longer be unmapped,
     leading to leaked/stuck IOMMU page table entries.

4. Questions:
   - Is partial unmapping supported when contiguous PTE hints are
     enabled, or is caller-side alignment enforced?
   - Should io-pgtable (or the SMMU driver) handle clearing/splitting
     the CONT bit prior to partial unmap, or refuse the unmap gracefully?
   - What is the recommended fix or expected behavior for handling
     non-64 KiB aligned unmaps over CONT-hinted regions?

Any insights or guidance on how this should be handled would be greatly
appreciated. If needed, I can provide additional logs or help test
potential fixes.

Thanks,
Zhang Yuwei

