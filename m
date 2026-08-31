Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90723C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+4+Mj5xMw3iTFchj0PIGWYEqdIBf0ZuxxB5KKCLY+c=; b=Qw8CiW3+uEJkMwQorEBhnbi5f1
	lyZ9Q/4NwoL2/SjcSkAQ0AJP0/i5L3N23pbZTILIXYRdfGTR82lxZ40ujshg2HId39Hemehqhach5
	elywMTH9Zg+rMGoUDEQrASGiXHxILc00fQWDFJrJBrOpHQ56YjR+EVpevmlpTBFazX0P9oupbQQb1
	1+BnYv4RWx1AsXm4IQXsY8o0SJUwg/AvaVz5wGo9QqQpBwG5GcrCy+XuD4fhJ+H5kYihCnMLYmX3t
	1urst+edvYN/jHLd/a80+56eK9HjWf7XV2rkV5F7ZIB3wmY9SeqTKWL8ZH1Z3xx36KnxR+2N3BRdb
	REne2uLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12F3-00000009SaF-1W8I;
	Mon, 31 Aug 2026 13:40:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12F2-00000009SZQ-2ucZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:40:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6362E405A2;
	Mon, 31 Aug 2026 13:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FBA1F00A3D;
	Mon, 31 Aug 2026 13:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183604;
	bh=7+4+Mj5xMw3iTFchj0PIGWYEqdIBf0ZuxxB5KKCLY+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V5DC9wMM8NLvVvVHeNTHVPi7HwuLd/UBuRBXZzwywSwcDfg27gpJatH/0ZjedaSzI
	 pUAn1fOTl3SrsTkWR85BmdqwaRt4Jdm+FkyT1uda0zv3sJoft//7M/6V/zbZgeVaiH
	 Q1N5ASxjwzNKJ2p0NNp/QBuo7vQTbaPiP3J4tSEoBAhEUplSMU9ZTAw2YJSCT7X8Kc
	 w78/xgTvqJOtwXHYDshia/sVxKZGRkeVQHbXmn2o6QkkvmMTG3mmi/W9NWKdrLAEUF
	 8hBs+qDI0rEuhByJndK9n954eZaDivAw3BaPwebnDD3YLqGhZnmoSNiZAzJQvnR7Tl
	 1Vapugt2VA+/g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	Frank.Li@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.18-6.12] mailbox: imx: use devm_of_platform_populate()
Date: Mon, 31 Aug 2026 09:23:42 -0400
Message-ID: <20260831133314.4125787-194-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831133314.4125787-1-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.48
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

[ Upstream commit dd1b321e8024fb01404fe163076c9010c5df8608 ]

The driver uses of_platform_populate() but does not remove the added
devices on removal. This can lead to "double devices" on module removal
followed by adding the module again.

Use devm_of_platform_populate() to remove the populated devices once the
parent device is removed.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The analysis is complete for **Linux 6.18.44**.

**Verdict: YES** — backport `mailbox: imx: use
devm_of_platform_populate()` (`dd1b321e8024f`).

The bug is present in this tree: `of_platform_populate()` was added in
v6.9 (`2a0ac450128bc`) for i.MX95 SCMI SRAM sub-nodes, but
`imx_mu_remove()` never depopulates them. On module reload or sysfs
unbind/rebind, child platform devices can be duplicated and break SCMI
setup.

The fix is a one-line change to `devm_of_platform_populate(dev)` at line
943 of `drivers/mailbox/imx-mailbox.c`. The mainline patch needs a minor
context adjustment to apply here, but no functional rework.

 drivers/mailbox/imx-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 3e52f70434c97..445cd50c1b667 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -986,7 +986,7 @@ static int imx_mu_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_out;
 
-	of_platform_populate(dev->of_node, NULL, NULL, dev);
+	devm_of_platform_populate(dev);
 
 	return 0;
 
-- 
2.53.0


