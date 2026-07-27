Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2695C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 02:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1jj55WBQzGrPgrclrAZ1nETRFMg2jvvhwOjEU//pXg=; b=ObaHedeFdr8PTYAtodcVfNxNUa
	VBxdRQ0IBYN9AerhqSmgQRr2+VMV4nw+BNBLmlai9A+d+yYRZjfiyp97kGkso1Mu+/uBtV8orwo8Q
	1rwdc76Uo8aFXSgFltijyecBjKtyTy5OR9JcUH13WbuBDhNVt2fE2zmBAYLXNlXnyXFzPt0czQc3j
	fe5Sjw9gFc0ApSifBVQ9ml+wUgTqMDO7aM57CA8hdSI6fKLLwHleE3eYDWdXlVUT73N32w/sq3erw
	nUAuCJe9bA49by/y9k9aHm0HfzIx1JAy0xTJoadA/1gNiEczKYCX7MaIdP8475CxqgKv+hcWv2CeK
	5Gb6NFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woBCS-00000001pXK-3HHE;
	Mon, 27 Jul 2026 02:36:16 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woBCH-00000001pTP-0TdE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 02:36:06 +0000
X-UUID: e501413e896311f1aa26b74ffac11d73-20260727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:17e1e125-2018-486a-a267-7db0f92e14bc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:a9fd983e214b625888e4f9f7e3e430eb,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e501413e896311f1aa26b74ffac11d73-20260727
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2056388121; Mon, 27 Jul 2026 10:35:56 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v1 4/4] clk: scpi: register scpi-cpufreq once and clear on failure
Date: Mon, 27 Jul 2026 10:19:15 +0800
Message-ID: <0ef515019f96.1785118770.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.1785118770.git.liuxixin@kylinos.cn>
References: <cover.1785118770.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_193605_455954_EA4E31C7 
X-CRM114-Status: GOOD (  11.26  )
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

scpi_clk_probe() walks clock children and, for each DVFS provider, calls
platform_device_register_simple("scpi-cpufreq"). Two related bugs:

1) Multiple DVFS children each spawned another virtual cpufreq device.
   If cpufreq_dev is already set, continue and skip a second register.

2) On IS_ERR, the pointer still held ERR_PTR (e.g. -ENOMEM). remove()
   treats any non-NULL cpufreq_dev as live and would call
   platform_device_unregister() on the error pointer (oops). Clear
   cpufreq_dev to NULL after the failure warn so remove() skips it.

Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/clk/clk-scpi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 4e22ba12b157..ce6baea8f82e 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -283,10 +283,14 @@ static int scpi_clocks_probe(struct platform_device *pdev)
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


