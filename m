Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD66C53200
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 02:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVhgRyzIojPy4Gr7MQFF5ABLYw2xUw1GUk3zGewQnfY=; b=TH2tPKLjlMYTRZ/lh9KpoW6Ffq
	X2utmPvVFypWkEjWVjhJ7V/U09cPxzzYoCp9a8lY8MgRbhKQQ53KWdaHeRJlED0rp/2oj3YGLt1Us
	XK1EhpG/2d1uxJOAMIeOsUHyLXLyqHCRe7+oj4z5NHnR3PxGjnSemKVDxjKZ7w7Ao3uq9VKXvChxT
	2Nan4wYMy6PW69387H7eVCtflslGrrfa5lL3pYYy7CXVoW9/CSxcMUpY30wupXSsylGYF37kSRJC9
	eNSWwqWRdNQ8MDWsgonA8dkHxbX+trZ0zqV2fQFt3F+Z5nvUDK4f+1rNqk+BXgBRD+9FWLNtMwh6K
	wInHm5XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woBCS-00000001pXc-3fQn;
	Mon, 27 Jul 2026 02:36:16 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woBCG-00000001pTI-3jsN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 02:36:06 +0000
X-UUID: e06ed46a896311f1aa26b74ffac11d73-20260727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e0160ef2-0328-41d5-be7a-3910bc544b95,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:bd359f38c3c2bb1e9faed96943e22ee5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e06ed46a896311f1aa26b74ffac11d73-20260727
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 333338921; Mon, 27 Jul 2026 10:35:48 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v1 1/4] firmware: arm_scpi: fix device_node leak in scpi_dev_domain_id
Date: Mon, 27 Jul 2026 10:19:14 +0800
Message-ID: <fe59f1badf4f.1785118770.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.1785118770.git.liuxixin@kylinos.cn>
References: <cover.1785118770.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_193605_603975_BDB422E5 
X-CRM114-Status: GOOD (  11.16  )
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

of_parse_phandle_with_args() takes a reference on clkspec.np that must be
released with of_node_put(). scpi_dev_domain_id() returned clkspec.args[0]
without dropping that reference, so every domain lookup leaked a device
node. Paths such as scpi_dvfs_info() / cpufreq init call this per CPU, so
the leak accumulates over time.

Save the domain id, of_node_put(clkspec.np), then return the saved value.

Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/firmware/arm_scpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm_scpi.c
index 87c323de17b9..6056754ef48c 100644
--- a/drivers/firmware/arm_scpi.c
+++ b/drivers/firmware/arm_scpi.c
@@ -660,12 +660,15 @@ static struct scpi_dvfs_info *scpi_dvfs_get_info(u8 domain)
 static int scpi_dev_domain_id(struct device *dev)
 {
 	struct of_phandle_args clkspec;
+	int domain;
 
 	if (of_parse_phandle_with_args(dev->of_node, "clocks", "#clock-cells",
 				       0, &clkspec))
 		return -EINVAL;
 
-	return clkspec.args[0];
+	domain = clkspec.args[0];
+	of_node_put(clkspec.np);
+	return domain;
 }
 
 static struct scpi_dvfs_info *scpi_dvfs_info(struct device *dev)
-- 
2.53.0


