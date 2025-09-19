Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA9CCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AI+xJYubzU8xYbi5UOSxx5OYAN6NReD9lv4iQlpsxGI=; b=ty7d+D0MTXuyIXHyS4cO1fxB73
	DBDCFgKaf+pOO2uxv8/4Ko4kGwCCYLJnu6cUm8RQQ58thQq0yg7UJkiNw8BfYkmn28ysXG8ggaUhL
	0CNO1pB5DVGTH0YTKHL6kHr+3CK5Hiz4xbGn8pPvfzf0ZFmK4/cgvwndVTmjuj8N8D7726AzJi3HT
	pjxiqxeNm91WcUxQJEk+LN1P+SXOVxM2GabrFSh5PJdvqUQ5YHhuxs0PILkJMC6PnMG/jo698yRT0
	LSPT65vU/yii83WuCHLQmtyJ78PfKZS1F00APvLFBYDo+K0XqvACSHcNHDKt52KO7ukgtyLBPpwKf
	lUI4Ao7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdej-00000003TRC-17WA;
	Fri, 19 Sep 2025 16:08:17 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzded-00000003TGA-1m1w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:08:12 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758298028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AI+xJYubzU8xYbi5UOSxx5OYAN6NReD9lv4iQlpsxGI=;
	b=YZ/lvbCEDGq2qugkxdT68KuY11ipuLPPS/lFfSPjzNYXQbBnxLGv/qQNdS0HhBnrusAwc/
	Ee8zEynI1IJnWgQXZbcpHKEcQGKxNa269+HurkW7EqV/i36SZbEsNZXiOch/TUgsrbyEs0
	uyD0P2izsG6sB1Ha9stJU2CY2MUce84=
From: Sean Anderson <sean.anderson@linux.dev>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Linu Cherian <lcherian@marvell.com>,
	Mike Leach <mike.leach@linaro.org>,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v4 0/2] coresight: Fix possible deadlock in coresight_panic_cb
Date: Fri, 19 Sep 2025 12:06:51 -0400
Message-Id: <20250919160653.507109-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_090811_609779_D168F6E6 
X-CRM114-Status: UNSURE (   7.17  )
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

This time with the notifier in csdev.

Changes in v4:
- Fix fwnode leak in coresight_register error path
- Move the panic notifier into csdev and restore the panic sync API

Changes in v3:
- Rewrite patch to remove the panic sync API entirely

Changes in v2:
- Add a comment describing csdev_lock/list
- Consolidate list removal in coresight_device_release

Sean Anderson (2):
  coresight: Fix fwnode leak in coresight_register error path
  coresight: Fix possible deadlock in coresight_panic_cb

 drivers/hwtracing/coresight/coresight-core.c | 69 ++++++++------------
 include/linux/coresight.h                    |  2 +
 2 files changed, 28 insertions(+), 43 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


