Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BF3CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 03:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y7FMWOQHFD1M1H1jdZsZDIeBnKDttX8LgdIEgVZkweM=; b=R1fq/prFyFJOGI+8dAAlqezrNF
	e9QkDud50UQLJZEDYo+yr6vffOBKtDgoCrrB2N4Dxw9eEbmuGV9xTPVTRP1QQvos1icfgq6SYg/9e
	sKgwCh8rUJIxdG1EsCj9pkFgZv6jnRu2SIWkRqIaZDTMZewJZHEyTKkSTzc1SdCR+ROmVwADWjB/y
	VuqzdrvhLdioRanouVxX3CA8VZ3ZSpxADCF12GGeK+paaD+PVxQIDoQeeuDqyW0+N514nuuHxaT1C
	v73BxSNKnXxKab6Sip5RD35CZDQ5mHnAm7/cRWt95TurbVbR+ndnauAXLfAvrr+tFml7uSEAuy82d
	dmlVifcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9Fz-00000006ilE-3629;
	Wed, 10 Jun 2026 03:05:31 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9Fw-00000006ijt-1sIe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 03:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=y7
	FMWOQHFD1M1H1jdZsZDIeBnKDttX8LgdIEgVZkweM=; b=EgXPldLEjzyg8vWRG1
	t0xx9wVZ3RyjnxmWwtuud4goSw1hE558U+u+TAyjBLGCnKm0PPaKwcqd1qSrXRDN
	k8HRocOlnM/m4S3HsgJKH6KhHmHDS59D7jXTRQPQqSwUweI/Rk87ted9w/wH773E
	lRVq3VGUk+ZluVFegDBLioo1s=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDn7xlp1ChqZkUqCg--.33361S2;
	Wed, 10 Jun 2026 11:05:14 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: brgl@kernel.org,
	andi.shyti@kernel.org,
	khilman@deeprootsystems.com,
	chaithrika@ti.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: davinci: Unregister cpufreq notifier on probe failure
Date: Wed, 10 Jun 2026 11:05:13 +0800
Message-Id: <20260610030513.2651018-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn7xlp1ChqZkUqCg--.33361S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Xw47Jr1DAw1xAryxAF18Xwb_yoW8JrW8pa
	17Ca95Cr10gF4qgw1UAr15uFyUW3yDC3y7CFyUG3WruFs8J34vq34YqFyYgFyrA3ykJw47
	Z3s8tw129F1UZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi0D7fUUUUU=
X-Originating-IP: [240e:604:311:e68d:4f96:b420:a895:fb1a]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxQvzYmoo1Gtq7AAA3k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_200528_959878_9F3C8927 
X-CRM114-Status: GOOD (  10.48  )
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

davinci_i2c_probe() registers a cpufreq transition notifier before adding
the I2C adapter.  If i2c_add_numbered_adapter() fails, the probe error path
releases the device resources without unregistering the notifier.

Add a dedicated error path to unregister the cpufreq notifier after
i2c_add_numbered_adapter() fails.

Fixes: 82c0de11b734 ("i2c: davinci: Add cpufreq support")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/i2c/busses/i2c-davinci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index a773ba082321..a24c3e8b87ff 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -818,12 +818,14 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->nr = pdev->id;
 	r = i2c_add_numbered_adapter(adap);
 	if (r)
-		goto err_unuse_clocks;
+		goto err_cpufreq;
 
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
 
+err_cpufreq:
+	i2c_davinci_cpufreq_deregister(dev);
 err_unuse_clocks:
 	pm_runtime_dont_use_autosuspend(dev->dev);
 	pm_runtime_put_sync(dev->dev);
-- 
2.25.1


