Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EE1C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 03:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtfdsvoZ5cZg5WRr/QDa8Be/p0gK8Snvq18IdGfXAwg=; b=Fxx2BvdpWra03Y2X+XX6/4y3pK
	YddgRc8DdEXcJV5tVly8D1V34cRaVgDH55IpZd7cBathaPcYbG1uDc3RNDTriDi4VL3VsMLMxg5Bg
	N2nWzIEAXWsiV1bpOAJixhadWfVaEgNVNmRapMwsOS6CtKxRL9wBFRlbaMegECIdP0tF8112iGFtE
	C752WxZ9mHeChfRVpPo40DNBVcp/lA/FuPics38Y5XwCf4To0KuMwK1l8EBuNt/7Dl/efzoYWg2Y3
	oJ/1NReQ4tw2PdKG88yYu0bqqOao21FcrjYPH06+MNY8sGqqfINxq3mG1SXwGyVYOUJaiCyc9BWA3
	b8PUPfiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYBk-00000004ISS-3JoZ;
	Tue, 28 Jul 2026 03:09:04 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYBf-00000004IQO-3FEK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 03:09:01 +0000
X-UUID: a9b966468a3111f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:bd83a39b-8895-4fa4-b7e3-7cefc687fac0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:4788c629cc1ff9d1d4cd0b191e559469,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a9b966468a3111f1aa26b74ffac11d73-20260728
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 892507905; Tue, 28 Jul 2026 11:08:53 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v2 5/5] clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq
Date: Tue, 28 Jul 2026 09:27:31 +0800
Message-ID: <fb51cfbfbb41.v2.1785200642.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.v2.1785200642.git.liuxixin@kylinos.cn>
References: <cover.1785118770.git.liuxixin@kylinos.cn> <cover.v2.1785200642.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_200900_129975_366C2E66 
X-CRM114-Status: GOOD (  11.36  )
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

Replace the magic -1 passed to platform_device_register_simple() with
PLATFORM_DEVID_NONE. The constant is defined as (-1) in
platform_device.h; this is a readability cleanup only and does not
change behavior.

Fixes: 9490f01e2471 ("clk: scpi: add support for cpufreq virtual device")
Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/clk/clk-scpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index e1891351c221..900488dedf95 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -287,7 +287,7 @@ static int scpi_clocks_probe(struct platform_device *pdev)
 		if (cpufreq_dev)
 			continue;
 		cpufreq_dev = platform_device_register_simple("scpi-cpufreq",
-							      -1, NULL, 0);
+							      PLATFORM_DEVID_NONE, NULL, 0);
 		if (IS_ERR(cpufreq_dev)) {
 			pr_warn("unable to register cpufreq device");
 			cpufreq_dev = NULL;
-- 
2.53.0


