Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C1EE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 17:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsDAqIMu5OeVPY661bWbJiymnpLSWD2TsLjT9CDADno=; b=Cn+4sQ+zEeeLK67YA+uhyDcdKP
	onyiXH4FJQsUznb1ay0gjgTUoOO6tdwgSh4+81+Owgr0erQ+1+EGqjNFl6nzVKbxelG9dmQVA+DRB
	8GMzWovQ8zDZsomWbxofYx20odmu+mou+hHb5xCYkLQ6sCG2eCqmzfNrFZnKMoK8xuVbMWmzkp3/q
	AykfNCo4DL/13l99srX9fcMaaYB2mIEg4PggYfECkWjF+EHvNM+J1lNgZLp79+yBakikHqR+KsDjw
	70Dxse6IQLQ4WHOdH/uljU5QVWMUFAct+0WwlKpcePjcfnjrUY+/SHACCl38W19GcFP+T5b4xYtdY
	jyQP+LBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFJa-0000000AqGi-3psC;
	Mon, 16 Dec 2024 17:55:30 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFFO-0000000ApFG-2iM6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:51:11 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGEVveB022778;
	Mon, 16 Dec 2024 17:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=AsDAqIMu5OeVPY661
	bWbJiymnpLSWD2TsLjT9CDADno=; b=hIlpDmBodynyFGK6V9frB/+XjVu6DWEgf
	R52LjDRUXSyJQLFRhq3eM+/bEE7c92OOBqxxa2MX2RChx+32PFfKMBqFvXL7D6Aw
	jZBarbkcvOMIe66+KbBx1QL/woCLoLnsHc2srNQFsmc8v5s4cCIFqHMo26q7eRR9
	cmoFaSjTrS1LnXVM+XUvfVlB6gTauOCbFAwrbRH51TWsYuYTC7nahDVa07w7qC3v
	2GWt4tkRHGm6inGfSAr4Sduk2qL1CVugEdmvWiXIL/N9EXan6d2sb0ezCFea0FlP
	2Bc4NhBGH7UYEsxvfXJXr3s7p86oKYQaD4TT3ZYhzxHbURV5AuXpw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpguwrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:50:50 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BGHooWY032297;
	Mon, 16 Dec 2024 17:50:50 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpguwrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:50:50 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGFd2EP014383;
	Mon, 16 Dec 2024 17:50:49 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hq21enwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:50:49 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGHolHO13697638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 17:50:47 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5072658061;
	Mon, 16 Dec 2024 17:50:47 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F395D5805A;
	Mon, 16 Dec 2024 17:50:46 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Dec 2024 17:50:46 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        eajames@linux.ibm.com, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
        Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org,
        peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
        naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
        patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
        peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v2 1/4] hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
Date: Mon, 16 Dec 2024 11:50:39 -0600
Message-ID: <20241216175044.4144442-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216175044.4144442-1-ninad@linux.ibm.com>
References: <20241216175044.4144442-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: khMEGGYchnDn0ryiujH5xPagk6j092gg
X-Proofpoint-ORIG-GUID: S-Pi4RVXgWybTRV7czs61N0F7xJiPf3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_095110_696194_FBB3326C 
X-CRM114-Status: GOOD (  16.41  )
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

Add debugfs file for the PMBUS_REVISION command. This command provides
information about PMBus protocol revision number.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index a7000314e5ad..787683e83db6 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3534,11 +3534,11 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 
 	/*
 	 * Allocate the max possible entries we need.
-	 * 6 entries device-specific
+	 * 7 entries device-specific
 	 * 10 entries page-specific
 	 */
 	entries = devm_kcalloc(data->dev,
-			       6 + data->info->pages * 10, sizeof(*entries),
+			       7 + data->info->pages * 10, sizeof(*entries),
 			       GFP_KERNEL);
 	if (!entries)
 		return -ENOMEM;
@@ -3551,6 +3551,15 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 	 * assume that values of the following registers are the same for all
 	 * pages and report values only for page 0.
 	 */
+	if (pmbus_check_byte_register(client, 0, PMBUS_REVISION)) {
+		entries[idx].client = client;
+		entries[idx].page = 0;
+		entries[idx].reg = PMBUS_REVISION;
+		debugfs_create_file("revision", 0444, data->debugfs,
+				    &entries[idx++],
+				    &pmbus_debugfs_ops);
+	}
+
 	if (pmbus_check_block_register(client, 0, PMBUS_MFR_ID)) {
 		entries[idx].client = client;
 		entries[idx].page = 0;
-- 
2.43.0


