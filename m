Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE83FCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3KLggIQUnYbR48e1lNGPBy/KmnEFFRv20c9Jaml6iiQ=; b=j4epFzKsJnIm7wKkbhXYEtm3qk
	FuB2X2nj5UclHdU6/TfSkOgWiscNExZXDn3gMge5U/BP2nJMr3fdSOnjqiV3PwpDWkcEkqumAbYCF
	0ayNOCTB+kwLF6xYayzZUzuMnuKb2vyrHC2ArkHXr7kYxgQmTIt79mnLI7LCN6uocx+V7uDJyuNwx
	qpjvYw9ChS58Wbv1AMrCY7in20M41Dg5JCFVzUnj8IepR74NEjxZTtJtnjTYj4G48XhdfZqriD5t7
	btCmCcQjJoL7aU319Lg7XKe8h0RWsElHgf1+RantM+rgCpyJe7VG4R/2YDJbdJhJSnTHn8UReC0HU
	WX3+k/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyFp-0000000AfmP-1s57;
	Fri, 12 Jun 2026 09:32:45 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyFm-0000000Afl8-2wPb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 09:32:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3KLggIQUnYbR48e1lNGPBy/KmnEFFRv20c9Jaml6iiQ=;
	b=AgPVfIyvFs4NRcS98zEdapEmGO81mzvC5p5cpAqCK2PeQ7SzilobKKR80AJ4cFq4M3wvvSl93
	vniYyvnLpcqs2Whd6TXbRLwUE0XEUnHDlTxpxORJNeoEaAnvOrv37f6+u1yiuCOg8swF2UjpkSD
	yOeQuoqS95I1EQ38SmcIVbI=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4gcDnH2cydz1BGMX
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:32:19 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3KLggIQUnYbR48e1lNGPBy/KmnEFFRv20c9Jaml6iiQ=;
	b=AgPVfIyvFs4NRcS98zEdapEmGO81mzvC5p5cpAqCK2PeQ7SzilobKKR80AJ4cFq4M3wvvSl93
	vniYyvnLpcqs2Whd6TXbRLwUE0XEUnHDlTxpxORJNeoEaAnvOrv37f6+u1yiuCOg8swF2UjpkSD
	yOeQuoqS95I1EQ38SmcIVbI=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gcDbQ3zBVz1T4Ff;
	Fri, 12 Jun 2026 17:23:46 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 5AFEE4056D;
	Fri, 12 Jun 2026 17:32:10 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 12 Jun 2026 17:32:09 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>,
	<wangyushan12@huawei.com>
Subject: [PATCH v2 0/3] drivers/perf: hisi: Updates for HiSilicon uncore PMUs 
Date: Fri, 12 Jun 2026 17:32:04 +0800
Message-ID: <20260612093207.1242000-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo500002.china.huawei.com (7.152.185.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_023242_897707_B916CA9A 
X-CRM114-Status: UNSURE (   9.68  )
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

This patchset added support of ITS PMU, and new version of MN PMU.

ITS PMU supports counting number and latency of interrupts by
catagory, and statistics of micro-ops of ITS.

The new version of MN PMU added cycles event, to be used for MN
metric computing.

Changes:
v2:
- Added int_en filter to tell if int_id is used, enabling filtering
  interrupt with 0 int_id per Sashiko.
- Changed event format width to align with register width per Sashiko.
Link to v1: https://lore.kernel.org/all/20260423152959.1458563-1-wangyushan12@huawei.com/
Link to Sashiko review report: https://sashiko.dev/#/patchset/20260423152959.1458563-1-wangyushan12%40huawei.com

Yifan Wu (1):
  drivers/perf: hisi: Add new function for HiSilicon MN PMU driver

Yushan Wang (2):
  drivers/perf: hisi: Replace counter number with defined macro
  drivers/perf: hisi: Support uncore ITS PMU

 Documentation/admin-guide/perf/hisi-pmu.rst  |  12 +
 drivers/perf/hisilicon/Makefile              |   2 +-
 drivers/perf/hisilicon/hisi_uncore_its_pmu.c | 375 +++++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c |   2 +-
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c  |  61 ++-
 5 files changed, 444 insertions(+), 8 deletions(-)
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c

-- 
2.33.0


