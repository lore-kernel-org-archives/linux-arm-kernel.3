Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9595DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jMXSiXLid893qcJu7rntooBK5qeALnzci1Lmpsxa+vQ=; b=soNE1NQTWD/itbZJVvuSaGDoY1
	fRmouPAwWe4aWHacF5BLekSdY217QSak7dHal3GoEuf31CHcrwyKRTSSa1ODSFhn8Ntva1BMdUEyH
	Fol7DX0HgO1azNRmXgofitckNgE6/KRcr8CtYMACihn5YUp+1e9k/X+vUvHTBHcpdkpsh7n++/M/w
	2jlmJy5nUeIJn5H1AqaaAxe6eXqKskrMtdsh09dJtD5GidlzoRzW4hHgQH5TCDiBPtMbTPJI5gOFa
	wmdH5g6Xs90C6oYvSN56xJKsLioHkp1pfQ6CA9AkDAfeaEdloDFQaSB0dqNSfEfT2jEaX/FDVS2MB
	ogKhSBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gJx-0000000FUqY-0bDK;
	Fri, 18 Apr 2025 07:39:33 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fvw-0000000FRWq-1L4l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:14:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Zf5Wn1BJRz5vM7;
	Fri, 18 Apr 2025 15:10:45 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 403F1180B51;
	Fri, 18 Apr 2025 15:14:34 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Apr 2025 15:14:34 +0800
Received: from localhost.localdomain (10.90.30.45) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Apr 2025 15:14:33 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <james.clark@linaro.org>, <leo.yan@arm.com>,
	<john.g.garry@oracle.com>, <will@kernel.org>, <mike.leach@linaro.org>,
	<yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>
CC: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <hejunhao3@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/3] perf vendor events arm64: Do some cleanup for Hisi hip08 json
Date: Fri, 18 Apr 2025 15:08:09 +0800
Message-ID: <20250418070812.3771441-1-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.30.45]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_001445_106358_65A7704C 
X-CRM114-Status: UNSURE (   7.19  )
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

Add missing field for Hisi hip08 json and list hisilicon pmu json
events under the its entry to MAINTAINERS.

Changes in v2:
- drop this PublicDescription addressed James's comment
- fix commit of patch 2
- add new patch to drop other hip08 uncore PMU PublicDescriptions

Junhao He (3):
  perf vendor events arm64: Fill up Desc field for Hisi hip08 hha pmu
  perf vendor events arm64: Drop hip08 PublicDescription if same as
    BriefDescription
  MAINTAINERS: Add hisilicon pmu json events under its entry

 MAINTAINERS                                   |  1 +
 .../arm64/hisilicon/hip08/uncore-ddrc.json    |  8 ------
 .../arm64/hisilicon/hip08/uncore-hha.json     | 26 ++++++++++++-------
 .../arm64/hisilicon/hip08/uncore-l3c.json     | 13 ----------
 4 files changed, 17 insertions(+), 31 deletions(-)

-- 
2.33.0


