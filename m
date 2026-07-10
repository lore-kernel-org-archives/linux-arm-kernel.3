Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D27C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 07:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yRGfZfkra0eihHKKGvP+5U/cOaqThixokW+NQOaBAKQ=; b=vDMJaAu4B8YTCuZ2qOCo1OpCMK
	M54mFjBdqcJJwtSxf1j3/UYShbLz+nvJ58OSAWgioTnqiQKsf8seAEBBDymKqOATuhQ6FnxjeDAOX
	wUhXlqiuNgm+rsHoTF0X9LKSOgg1IbcNbOAyQeucb/7MYku3H7wnUK8W4BIaPS2+QlieWO2R91BzJ
	alJWa7FjSB0N303NzbKMGx2bzABtPVRDhgkcL3VUMxjmdsNg4pgstb/Pwqz2Al+yERZLcINDdQymT
	yLLUuCi34vu75k5TIHoiz6fTAZxGna9K0kFy8qSx/TKMNdPwt18zfDRc80URfoWjqHHyQXfO5e7FP
	cJb3KDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5IR-00000004K3W-3G8M;
	Fri, 10 Jul 2026 07:05:15 +0000
Received: from mail-northeuropeazon11012012.outbound.protection.outlook.com ([52.101.66.12] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5IP-00000004K2R-17ab
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 07:05:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtTT3rHEDAPRPLlIJTTXnQRu/1Z+9L16xaWArrTTY0pSSHBrQi9P1g72tu+IR9btGuYdAYAXiiOABcH5sicNJwH+qAirqM6k3OAGudhC02rgo4YO3zfxvJIZKNjRGtT0c6QVEmPIGdnMTcU6xFUZ2zWEjkguDcaW4cO84YlJKpN/rO1HudhE6NNCvIzk1UesQpy74UAsdZI+CnY7UKgJr7BcG/RYLqUCzlq18qOgHgGfWCyVRXhUh2k6ZS0JSQcf75abJQ0f0nzjm4OPyG5pyFYmDVJrHCzJ2DhvEIotDU7DMjgGozI2/0zMAheZFlDMfioL3ptnCRc1fSOldk6X5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRGfZfkra0eihHKKGvP+5U/cOaqThixokW+NQOaBAKQ=;
 b=HhXy4VAyuvH607JYTeqKXPjt6tLgFBIqAxKd5rqygQ5OZizMGQxSpMJDjfjnvF5s5LWeKhLWBqZ3B5cXc9/DRee9TXLLK0xxfs4oEb7QKh3ojqY68RloBiOC62dQmU0aAk5nMmoEJICvybrvA0Kq7+4FxIuYIv/wEQ2GSFdsU8dn7G8Fuj/5ySLSC+Mtq4pnScjermCMnTmLPxIvK0BEcqN5QJfLhdcwYWAtnv4gHD62VK0dJETAmEdOf5k6DjRhmbTchb+1tpWnUkdSw+3kfNXGWe3LDKreFqc+jpkB4dsP9MAwvPUCzI+cafIuDweWkx72+/jeeilwCZ8mQQ7IUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRGfZfkra0eihHKKGvP+5U/cOaqThixokW+NQOaBAKQ=;
 b=abEkFkBxe+MSI07f1y8zm9wRQlVBfv9vGAgWNWfXBhhZTmKFOnoXNqd0+0vRWHZnFS84K27QQa0Du7tIKJmPolAFPDb8eLH+CErZaWoRRTuu2QJ+EU5NvfHepYzNG1pXZX9l0FfWGsAwIc/9Wpb3BfAwO6/lLLhvmUL0K5LGLIxIs4RZcSea/3ThSRiFlOKJLhZXc5CI86ABeG3/hkqjGxp7snJU0iaDVjyijvcvc2AUTV3xIzFIyihzLZm7pOB/qk3wzTob4Pyz7M6WhKXUzl3O32e9ARucrCw0il8HeN9k8bh8kouCcDua5gWMwagQgM5vi/mNvh46BhnRxuFrFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB9326.eurprd04.prod.outlook.com (2603:10a6:102:2b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 10 Jul
 2026 07:05:05 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 07:05:05 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: chipidea: imx: fix missing ret assignment for dev_err_probe
Date: Fri, 10 Jul 2026 15:08:34 +0800
Message-Id: <20260710070834.2744357-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::12) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: bad88b27-1327-43d5-dd2b-08dede519194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: MLASnbwg6PUNJi/oKoXvZwwVB7ScYxEXMJxsp3OT7aaVRfTrKwL/1lLnbYbYyI9Ka1XZidA1SLCWknWFmXoyBdU/HABu1T4VWfeJZD8PK+oM66E5vyneJC0WwFqlji/6wYiJincuWBhJkO7BKkWOL1RJl2Y6ONN5oXZc606bPkZEkwZgNGE8u478l35bkdgFfroADNVran8gd3SeT86In7ommidq76kY01WXRgLmDqOnd60KBCj/OTgi/QHE0QnEzKD/4tDfq6pdCmreso+U+hHRBXFIozrJ7kvMJUa12CXURttJlu6PVMFbVmdV+Hycl1l/8ve9HEiW3WZKK8R0WzgLELRoCEcEEf9X5sgCK2KxIMIXH690lBhIFDNs/RdrhmVRTS32h3HpOfKv463SJ/TvEhcc3u3r9to20/YM9mC8jP5v3MLIPdZRY3LfJZQgvyR7kFztzMmf/WdJwafBqSc2OaiRcydO47YC6EIKWXFHAVlF5OHJpLDOVgHWpxwgG9ov5O3KANPBmqNHcnSKYyRLWnJfpEeN8Vc1ElpZWn/u6pGy8KnDhKmG1Kq7SBTsCkKjBrBm2YCsgnogJJITUAHuD9wfuhZQ1KLT0KHRzIFRRZTPgC3cmhDmMPmNiLazv1nIO4V26kKWu62szMwa12dyjnJDaxdR9vh2/PufSwY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i4/N7sG7ffvp3brHIVrtrYgD/r+DLV7PsMFk0hzw6trl8HKJBucVbcpWWkRN?=
 =?us-ascii?Q?pUKPntYeUIFBFl/CX3+Bz73GtFjHZj+0sfeWQthfH8y6RGzzS71zhLCzRhBV?=
 =?us-ascii?Q?HEc0NkkVnPMI1w6BD2d3YBYcJNtp91TdbBxK6g5YP0yIFMQ0c5pCZnQ+nNxM?=
 =?us-ascii?Q?uR6ePpbNkAb6ojwYZ+y/KdnBP143J/RrVC/Xh0wBt0RfVZ3xYf2mrGhyP74i?=
 =?us-ascii?Q?/7ovWmOVyMMXpz6l5/3ozOWRAZxhvVVmECfVIAWX2Ln0Ug1m3nWDAn6SEJsQ?=
 =?us-ascii?Q?1gR+0EkurTXfYWzooqlTDsPITB3HxAXcViPWQZVoTtjTUZDeU/Pvlf3PF+76?=
 =?us-ascii?Q?5xtgmPP8XKdvJ8as5l26Q/mYrjoW76r6feqKG/zr71SuEEa7Ze8IMe2YPkw9?=
 =?us-ascii?Q?4GH79M43wZPtejdJ3RdExkd6LT5fXji3qIzo8gDCVW6DH6FveHAg8jKqK0cL?=
 =?us-ascii?Q?5SOLDr6zi22uJmZsM/2AH82SYyf16JOOTkery8fYaleOr6h9xFhj8sqgc2wh?=
 =?us-ascii?Q?At7fK4eMN7LCUeiszEGnV9aqP54iBmkJ4k0XbpxAscaNVf1tPU6Np0ZP5pMI?=
 =?us-ascii?Q?DVfeRTwH3tXN7A7ULj6jhtG2cHnK/YB0kR/TBKImT6u4m6jrTBt3hjTKARS1?=
 =?us-ascii?Q?qZ4pAiX3mkwzJnntaMRj9eYN2IZeVieMiMdsik0MAcVvvjQbwuCPFy6aii02?=
 =?us-ascii?Q?mIGvQxiyvpnGjmj8xT7hRVuifpwkZ4g/k2l7DAaLzDo0ns1lO0ZGsZuH0J5A?=
 =?us-ascii?Q?lXOK5ev/Sh1BVsEr82YGWx4KoKWISd7jL8hpsBv6+12kDMfTThnoaTty4Q5a?=
 =?us-ascii?Q?O/OLcdWgU9Me3vLpwzajYCGN0MhaCFttrS/mG7eFiEkLdSgj0+YaRLX9zBVh?=
 =?us-ascii?Q?qfhZixVDlEm2x1wYckwIhnyEW9EGkWDCHuY2JHqHMUv8FM0/3qrT2m+r/tT+?=
 =?us-ascii?Q?3K+WsvkjWMsnNCYprCD2sQoYj/eWpdjjISDxz+wD1B+WrSU7Vhk47tCvnWon?=
 =?us-ascii?Q?/gP90bqgcX5VEEd4C6C2Hut4wgHBhoOnaZSg//OLwcv45wGanv0BRauEtjdo?=
 =?us-ascii?Q?8WgA/mUgpDhtmYizojO65f1jjFwxPsArT+hx0x8AUpF/u3z3ZjE5/fo1ctTQ?=
 =?us-ascii?Q?xG9JICN59FWkMhHdkpzlPU3U2EhwUAM99NpVNJhCrr3B+hWFkNmjLMrk7PqP?=
 =?us-ascii?Q?gYrlT4U9GZupyiNGf4PcyabNQfhwAlvqznYzTSWHFZpNs85ULe87Rzf1p0ye?=
 =?us-ascii?Q?x9NiLfwgTQHlpdzopeCF1JxRSJLMnS94k2SPrQmNFGD5En/7dmVqyUuOvoTz?=
 =?us-ascii?Q?XRg7miVeA23NT1CMZURudlIzNUbAa2mMTfjMnyYbbxyv1KmmoUHgYQbPe1YP?=
 =?us-ascii?Q?jol3ZEko3SYB6fP+BZxkjo1VXJN9Y6C/4qiYH/jrzu5Geo6V4ePa4adtV17s?=
 =?us-ascii?Q?LySI//viQs9JuMjBlq8lNzg+e4DjOQW0PjRPQ7puQZoLAKRjBRjLndNJHH5t?=
 =?us-ascii?Q?GgX9OO9Ha3i2VIEnrOSSvO/wKxqLvCNvycC/AJZSD0AXoW0Zok8SlsM4cAWF?=
 =?us-ascii?Q?DHTDfdxvWJk1wI2hjOlhsIgRr768/wjaA/v6Pp7CJynFFyhRUUZFpinYCdBK?=
 =?us-ascii?Q?+Q6q0XLXGYTBRRAjfcYVtyemOcPh6U4dHOW3Pwf9bIQEhzLXOzMfv4hrRrqv?=
 =?us-ascii?Q?QjuINy/xY6ZhR8jhfzbIHQcxWc0sBOeHn5HWNOSuiQt6Ph4UdTFU2z89z33q?=
 =?us-ascii?Q?CiDW6bCnHW4wx8Kvpu6McWTY+bApKqFIy/bLCIzeMNrpwjdo33iE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad88b27-1327-43d5-dd2b-08dede519194
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 07:05:05.2149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZseLMhOJlYVX/oh6mNsqy7RM1r0gpips/+w78/T+IyEK1/fYHHQstO0mYyHK5+as2ivhgCE1dumPyxYBzyKdCbTre+dIFQkVCGSEducBvJeXxks1nH4W9nTqsS1uG/pu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9326
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_000513_308830_CE9C23BC 
X-CRM114-Status: GOOD (  12.02  )
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

From: Xu Yang <xu.yang_2@nxp.com>

Assign the return value of dev_err_probe() to ret so that the correct
error code is propagated when goto err_clk is taken.

Fixes: 2e9762f45efb ("usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for wakeup interrupt name")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202607031656.FR3Xrved-lkp@intel.com/
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..282314eea7fc 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -528,7 +528,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
+			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
 			goto err_clk;
 		}
 
-- 
2.34.1


