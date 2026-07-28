Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B1FC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 03:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XkbAKuZ0WqPipUdpYzuyXhC4wRyLl+GC+hS6KrTkX4=; b=bklxshloH5PI126xdJz75aFvhY
	3Ts9g3furACYnDXn5K6ctrkWxnVcWASA/Q6ixjcMJJ7LNRMzpOJ0nuybCFSBDPDQRMj/korWUNcv8
	k5OrsNHMGVWGPnpqriQrKSbZTHoJ+WZNth1zW1eYf0G/Zqttf/YW9SU9i2pKr2IUQWVG2+z3kQlu4
	4kgnbOggN8x1vM34auNs8KDqFxKoqnXjVgNssajn305AYBVN/fq+8eHM4XPODfhznqJZtpzwhAKTj
	+OeHaSoi1l9WOMOEkQOMW8rT0oQqIMxBKtIMM5NGFFO+JRZZWEHWXZbkkpTWR2ycyHjF9JEouZGIo
	DlTeL4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYBk-00000004ISA-2f0m;
	Tue, 28 Jul 2026 03:09:04 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYBb-00000004IOZ-2Nig
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 03:08:56 +0000
X-UUID: a7ac8aea8a3111f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f468df4a-a75c-41d6-b798-d1cb0e1ce64e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3a2a9a91644d069ca6074cca7ada6685,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a7ac8aea8a3111f1aa26b74ffac11d73-20260728
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 888252834; Tue, 28 Jul 2026 11:08:49 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v2 4/5] clk: scpi: register scpi-cpufreq once and clear on failure
Date: Tue, 28 Jul 2026 08:50:00 +0800
Message-ID: <fd1b9199a9c3.v2.1785200642.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.v2.1785200642.git.liuxixin@kylinos.cn>
References: <cover.1785118770.git.liuxixin@kylinos.cn> <cover.v2.1785200642.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_200855_900213_6AC4BF16 
X-CRM114-Status: GOOD (  12.38  )
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

scpi_clocks_probe() walks clock children and, for each DVFS provider, calls
platform_device_register_simple("scpi-cpufreq", -1, ...). Two related bugs:

1) Registration uses id = -1 and the fixed name "scpi-cpufreq". A second
   registration of the same name returns -EEXIST and overwrites the first
   good cpufreq_dev with ERR_PTR(-EEXIST). When cpufreq_dev is already
   set, continue so only the first successful registration remains.

2) On IS_ERR, cpufreq_dev still held the ERR_PTR; remove() would then
   call platform_device_unregister() on it (oops). Clear cpufreq_dev to
   NULL after the failure warn so remove() skips it.

Fixes: 9490f01e2471 ("clk: scpi: add support for cpufreq virtual device")
Fixes: 67bcc2c5f1da ("clk: scpi: don't add cpufreq device if the scpi dvfs node is disabled")
Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/clk/clk-scpi.c | 6 +++++-
 
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 3c33a9e3c690..e1891351c221 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -284,10 +284,14 @@ static int scpi_clocks_probe(struct platform_device *pdev)
 		if (match->data != &scpi_dvfs_ops)
 			continue;
 		/* Add the virtual cpufreq device if it's DVFS clock provider */
+		if (cpufreq_dev)
+			continue;
 		cpufreq_dev = platform_device_register_simple("scpi-cpufreq",
 							      -1, NULL, 0);
-		if (IS_ERR(cpufreq_dev))
+		if (IS_ERR(cpufreq_dev)) {
 			pr_warn("unable to register cpufreq device");
+			cpufreq_dev = NULL;
+		}
 	}
 	return 0;
 }
-- 
2.53.0


