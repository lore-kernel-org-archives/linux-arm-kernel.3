Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19F2CA0FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4krmg4JXjLKtpYmqMRKt6bOgkbyEd7a3mU/xQ1uDPHc=; b=SnxX2Aa8mSWsgoO4yxfvP6Lku+
	cXAcYKl0jGRSWkp4RdxEAAp20UeUvrrVRpjyybmlE4FZ2YzhNoHShKOS6Ihs/vUpHvCh0VwsGKz0W
	OeqmsEyn87kGbpkFELjb3HTti2AO4heoFyT+LgW3orJu1MUSYnq3QUNOBa0M5EFcTEtGjfki44J2T
	yqmWZhPRPzcx1JF4/88ZIXWFqYxYWlZQPDZTTI/Blh2RzUXwpa5p6utAHshgyYT5r476t+rPivA8I
	1Hx+lyIZHr/2NAihyx8cQi6Kbp+E53kkXL+NnrBUNG/vhrP8TXdumnlL7bdEknGIQA/tkQF92vYVq
	kuTyNG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAhr-00000000EUj-1g8Y;
	Thu, 21 Aug 2025 19:12:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5hC-0000000H7Un-0wpM
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 13:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4krmg4JXjLKtpYmqMRKt6bOgkbyEd7a3mU/xQ1uDPHc=; b=QtqhxcDAxGteaIJ5EqN4FsXOVS
	l9Fy8W8lSugPtQinmkcDfhI9wgwGMoLynByola6DJo4bntJckd+sZuciVMkYFMI/M7JmUdvm5xLqF
	/BLTW2yG99QAV255vat9tfgr79HROFmZvHIWqcTYEtGCN6QcHYjDZx/+Phjef8ef15tbZ/pMjtbjE
	Z32fhlIFabdT/mo/GX/jHzerYVnlSh33waYavkDy3jOoAkusT8w39iYsLVSqG7KzIh+ZJNQCIoWhU
	cEwcPYTdtt3hVi69EJBi8HzfPbjoy1tdy8q6ZPR8y/IBuxr6P/77ZdKCH6RePRwafSiOMeq3bT0mB
	avrDhOXQ==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5h8-00000000a4n-2Cu1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 13:51:12 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c74Tk5QB1z14MX7;
	Thu, 21 Aug 2025 21:50:50 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 1AA75140279;
	Thu, 21 Aug 2025 21:50:55 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 21 Aug 2025 21:50:54 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 21 Aug 2025 21:50:54 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <robin.murphy@arm.com>, <yangyicong@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <hejunhao3@h-partners.com>
Subject: [PATCH v2 8/9] Documentation: hisi-pmu: Fix of minor format error
Date: Thu, 21 Aug 2025 21:50:48 +0800
Message-ID: <20250821135049.2010220-9-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250821135049.2010220-1-wangyushan12@huawei.com>
References: <20250821135049.2010220-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_145111_113340_AE99874A 
X-CRM114-Status: GOOD (  11.49  )
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

The inline path of sysfs should be placed in literal blocks to make
documentation look better.

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 Documentation/admin-guide/perf/hisi-pmu.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
index 48992a0b8e94..a307bce2f5c5 100644
--- a/Documentation/admin-guide/perf/hisi-pmu.rst
+++ b/Documentation/admin-guide/perf/hisi-pmu.rst
@@ -18,9 +18,10 @@ HiSilicon SoC uncore PMU driver
 Each device PMU has separate registers for event counting, control and
 interrupt, and the PMU driver shall register perf PMU drivers like L3C,
 HHA and DDRC etc. The available events and configuration options shall
-be described in the sysfs, see:
+be described in the sysfs, see::
+
+/sys/bus/event_source/devices/hisi_sccl{X}_<l3c{Y}/hha{Y}/ddrc{Y}>
 
-/sys/bus/event_source/devices/hisi_sccl{X}_<l3c{Y}/hha{Y}/ddrc{Y}>.
 The "perf list" command shall list the available events from sysfs.
 
 Each L3C, HHA and DDRC is registered as a separate PMU with perf. The PMU
-- 
2.33.0


