Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B19C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 16:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grWc+Beyq4KqBEDCfPSGibIQjlO09HdKlKJlg7ai8p8=; b=0Pl48ecnZXijWgi7mN8AEhP4Ry
	zak2TV3wTH/oJLruffNT5beTBbQBahFqS9wiK6TJuOt0zthzaANVdIwxtjJLj1fhJYuyePZPpbnTp
	206d0rbadT0it2bvT1yGQCePmGHzFIPxLwCM2bNZvXwhjREnvYnKs/35KwLv097376eJ6HnaFQQfy
	02oTzF3Rgy4gXHv7CTwW7IHAmCyZPkf7x7tlYTTndOYqh/U8zH9JDWMu31StlsTd6/fg3YiD88YPO
	4AtSZ6KUWgmifJdvvoNcgUwN45lWhAEyVLWEbBuzk8qkesagxlgaO4dEOCRaSAyv82+WCa7Qt79xP
	8SzRKAhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAt8V-00000002UU1-2dJg;
	Fri, 02 May 2025 16:21:15 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAt2I-00000002TDU-0pkO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:14:51 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZpwqD6pdcz6K9DM;
	Sat,  3 May 2025 00:09:44 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id AF8601402F7;
	Sat,  3 May 2025 00:14:44 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.77.180) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 May 2025 18:14:43 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>
CC: <robh@kernel.org>, <jonathan.cameron@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>,
	<shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v2 3/6] coresight: cti: Use of_cpu_phandle_to_id for grabbing CPU id
Date: Fri, 2 May 2025 17:12:57 +0100
Message-ID: <20250502161300.1411-4-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502161300.1411-1-alireza.sanaee@huawei.com>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.77.180]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_091450_375927_68CAC7F3 
X-CRM114-Status: GOOD (  10.32  )
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

Use the newly created API to grab CPU id.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 .../hwtracing/coresight/coresight-cti-platform.c  | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index d0ae10bf6128..369a9b7170e8 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -41,21 +41,12 @@
  */
 static int of_cti_get_cpu_at_node(const struct device_node *node)
 {
+	struct device_node *dn = NULL;
 	int cpu;
-	struct device_node *dn;
 
-	if (node == NULL)
-		return -1;
-
-	dn = of_parse_phandle(node, "cpu", 0);
-	/* CTI affinity defaults to no cpu */
-	if (!dn)
-		return -1;
-	cpu = of_cpu_node_to_id(dn);
+	cpu = of_cpu_phandle_to_id(node, &dn);
 	of_node_put(dn);
-
-	/* No Affinity  if no cpu nodes are found */
-	return (cpu < 0) ? -1 : cpu;
+	return cpu;
 }
 
 #else
-- 
2.34.1


