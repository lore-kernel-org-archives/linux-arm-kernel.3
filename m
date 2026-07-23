Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F392C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 02:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zEiTbO7RW+OfqkWvli8ohV3YYexfO1cVMQtK2N8si1c=; b=knFVOddfxV4PB8Xluq4wHBiwlR
	gTJF5/43ajOViaqKSCVpaD50ujQ07zAA9dlOa3nz/EjDBoIW/VxB6rszJ8blYDV+Xge3VCcrNFJIe
	+dBdJzY9B0HvQywH/bYIidMyy9LfT7SXoMJWHmlg2RlCRl2qLq1T5Vjeh6I4WwYJLH4ZXXx1nGU3b
	5OcmzGUjkltz3Jgk7KVzXZTARcEvt49OufBREjjPagTgRNAXHNzFLwJgVgKCzmr8/fcwQdhZqdPiJ
	A5JzuEE0hLnuAQmsv+xJ6kQHLJPRow2hTvEPQCRnEeQGW42JB1KAuniyvhHXl4eQGbAo9XBLQcrWV
	J0Y86+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjIc-0000000DEvO-0rBN;
	Thu, 23 Jul 2026 02:36:38 +0000
Received: from mail-japaneastazon11013028.outbound.protection.outlook.com ([52.101.127.28] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjIZ-0000000DEut-1SYX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 02:36:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yp1+nysuw/bAC89jVaVCqs+qJQ0FP7wy2HHHUSFg7Gp2FuZqvF0hwcTwfdyyCvjuTxIzvDkn59HGXPKo2nCciOnuMwLsZPfEukwM3fRKGx8slPG7g44tITICJtjDWuinkVvc7B4pbX9Q+oaRwoYDkOkd3t6ZePivZLQwQxjKpzLreLXRp+IexMTRYv+X+vbpzbUMkj9PUwXaue05JfJGmU0zQC0KPQvrzrgZDhbgaKEn0n74AhIqDA1IY3bI7azgF6AcQmbxOSMoxuJPTOEbwNVMU1clprEFrY/ITNe864RLvlVDntnqiLTs88UpbEJOkHeaHxCGXH5Np9nfs+69SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEiTbO7RW+OfqkWvli8ohV3YYexfO1cVMQtK2N8si1c=;
 b=xgh/5QwEm6OhtAnmlDSgIWwF8ZOocjL008r/UMP1cRAHDrY2Y/cz15MyBK8GGkxQRkfco+uoFN4QBu1druh4yclY9tYUwciO7/ipjH4FZAp6Lsl78mC96P/ogIf/A9GsjHuhsOGxSqOyYnV7QqRyb5yRRMbGN30ltoB2jHX5jOn7r0umClpMC4p1IaXTpDmZ+ZkWQuyvnRoV4IGOCzSw89cpy3R2W2nlIKy5AVzMl8Z84h7KQyNvd/jIDljBokso3qEZj7Tod+mCowkExI40ZA50mFB9YiGAZPsUk/ycOee6ZcJohLXtiwKVIXpIVrQCMmTFiRXaFTeruSDrXt0w3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEiTbO7RW+OfqkWvli8ohV3YYexfO1cVMQtK2N8si1c=;
 b=eSBU6x0D3LUgj/lWwNzhwRuaeovmDIrMp90jI3fX4bmbEH2WjE5eT7WmWkyt9B63VsESPSs+crhVAmj+TbUO0HDOBNknNcnYg7eoNica3L92OlJC/HAUu1oaF+LQG7bh/xuaI3Cf3cBpLgRqPwKw8Mzxw2RzxQXF/znfmQgaEVYecaNa1ziVAGLtNdCTlhjwUruuwywQoOzrEy6Slvo99zYNjCcz65JJYNiclCNjGZFUu3C9a0HlIy4WeWNHJRm3C8GrMBMYBL9wN5zXWHLNlvSjldIB+yMf6dwX2/6YG56YrOIfbAlu5Hv5lxCVyjbM4R+LDb6/MyOOFk72ZkVx3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYSPR06MB6542.apcprd06.prod.outlook.com (2603:1096:400:481::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 02:36:29 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 02:36:29 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-kernel@vger.kernel.org (open list:TI KEYSTONE MULTICORE NAVIGATOR DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:TI KEYSTONE MULTICORE NAVIGATOR DRIVERS)
Cc: Pan Chuang <panchuang@vivo.com>,
	Hari Prasath Gujulan Elango <gehariprasath@ti.com>
Subject: [PATCH] soc: ti: wkup_m3_ipc: Remove redundant dev_err()
Date: Thu, 23 Jul 2026 10:36:16 +0800
Message-Id: <20260723023616.654508-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0021.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYSPR06MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d8e0ca-bc2f-47bc-5988-08dee86332f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|11063799006|6133799003|56012099006|18002099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info: ySLrHcDyPq/HUElYvgOCy7jjNTxkjYGR6jIhfo41vtUXkF+qIxdBUsMiLNA2KoiIDUaNO6tUQ0dgnkL47vTmXyGfhYIzlTnDsT/IPLME5iVx/1FH6Wltz/tv3jVm0vxZWqUbN2j7xFuXp9h46VyR8NM2eGtkoQo5Zx/27OydQ5BI66xVkrCJebwt0PvK0kL8wF6/+qPQoBt57wcAB5YjuqC07j5XnaPt5Tm25zsArsXn8t/7raPApBSs61mf4NWoTKWLowvKubkr8KEAXWoW7oXzykJjR3ZGVxrWs4JHKvCTJ9qOK3CdMdXKqtQZ+8/HYg2wJq2cznKgPRjh9RHJyuVDLkKgrNmt8rEgHj+VYYxtPiYoPnB6L7Z5A+XkuGq8eiv4p1gg8EArt7bznVkUxlACOwKE8Tzu6m+IzyRQvl3ri3n6OFUO/fwBu1P6gbIDYfPg+9uq4nbpMV225hr5GtsVX6bnsqqG/Eg/bEXdYA34loEuibqy0CmtuRj+zhA15abg439/cD4oZWC6jbg2L8ze8tBP7ZkaYSWJ1BQfNh2q5Blm9ebP90YI55LbkR1h460ImJbZ0PEA+RslCqSW6DpIVSEPBWMhLSaY9c1nKYOnqGWNVjfOeKdhX5jcyNgAkIg21v3KWl22j6XCGOAAGhkcWKdbKCqj7uaG9L6UEklpoWB9GTtpnknkdzBbV1hljeZZPk/DCFTfS+nllS3J/F4A50FUh9D4nvCvOmRvXZs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(11063799006)(6133799003)(56012099006)(18002099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cDZNWw9RmHm9IrdKP3tkpf5uZAz05szIhm3XPIkBSlyMMQKN+T8dWPafu5bB?=
 =?us-ascii?Q?fsbEpsvp04j1AA+maANTQFudKPf6XrBEXyxiSZFwPhlU57m2DytuNCx0x+Cp?=
 =?us-ascii?Q?+Vz+v4dr0qYZ1+lVvbRgNi9S40aSLLDGhyD2EJP1n4MzsZLLlEoDmZcFLN/M?=
 =?us-ascii?Q?3ZD/K83hGu+o3U6XJF0T8MraeJIyjSgkYCShpMvShUFn6GWchlPgItmFjKYS?=
 =?us-ascii?Q?RgMy5XyOZqykYjfdUzSR98z8cO99pYvk/Xzxfw1vpaUnT1g+OeDrvm9jKc1P?=
 =?us-ascii?Q?AJPYjy0WVcrTZq2SZK9d+sPfaX+zDBIpy3mv1aGzYKZXO/hoNdi1RsH7kKWA?=
 =?us-ascii?Q?CZbwfy+0A3g1ZsGcUhv7EfltfvJzZQywfumIbrlhr8gMkIjAMzCqRsPbhggu?=
 =?us-ascii?Q?N7FhgifmrPbPTWLTVAOV9ZfWDMp4/NLGMDKtNkXimdrQaz8BiAMprFr5TWeL?=
 =?us-ascii?Q?p+fvdIV+qAhGxitLHKZDixq94oNNRt+hZdD58U3Bu2BzcSAqB5lVz2LkHot7?=
 =?us-ascii?Q?GZySl9xrhU5Qi4rYxYMbxlyO8rHTWxSpx5cgzeWs+n3Ng8s7Y3RBlFwLTAIp?=
 =?us-ascii?Q?0csh4toK4pRb0rJnRj2EOkx1AA00zRoenF5i20Xcz1B1WWrCo2BgkejS0Rdr?=
 =?us-ascii?Q?gs6ZwtGw/iiHlnefp2ZHvykQNzw8wBmAbV56WkmeHdYCVUvPfomKc2+/WM/a?=
 =?us-ascii?Q?JQUsyL2VE56a/GKILoks5A3MwJK5+BuHCsZZBfWEc8zYsr1KYtgHUQGOdzRh?=
 =?us-ascii?Q?zKGOh2Y4A5PsIIfMqDYAJ+lH4PaqEWYxfvR3CyFtQWm2XNIIdFdxFjjTwilq?=
 =?us-ascii?Q?mnZoUFWXvTqguYylXIrtXyAw4IYx2U+sgtdOPg4vnpwfrJPGZmzr5U7k9yTE?=
 =?us-ascii?Q?HJkuFLGpi8lfOe4NZnSmrp3J46VTaeG4hQddgcudhKbyBaazRSMKdxVBw88b?=
 =?us-ascii?Q?woXvzubr58M4jj7+5y7/nm2hbkmiI9do5b1T+SdkoZEie+dpgWosOc6qU3l7?=
 =?us-ascii?Q?RjQ7C6gOt5meSE2QaUpnUoRgpVWKiFrv5hp6dkIzbshITnIrXO4C/y3Ursqg?=
 =?us-ascii?Q?vkkojtXRtkkw8ndEZmRQQg3Tv69XXCdmJ6GylIaqzLxoZfgEB73yyzreHAAM?=
 =?us-ascii?Q?zXFvwSkg+posmSrXAhBfRFKxTeyWofPDqBC6sFoAcVvF57ssK57HWojwGYSn?=
 =?us-ascii?Q?APoYLUmKdN0FZGpoGXrBURjNiCapViOVQRhAjsppPBbVep8YWGoeTzV5IEZO?=
 =?us-ascii?Q?z3r+J+EHETppcnkvcNetxXXDjWw0wx8bPhkTkVvSxilEU1LACsXlmJwsTDJe?=
 =?us-ascii?Q?d6jFApRdin8PveiP4WAAMSgI3/tlZzWIl/qPa8UIT58Yk8RO4cHR4O7gqqeV?=
 =?us-ascii?Q?ve3ZerkJ9yFkBuzHTc9VM8EUdLhzE2HgeImIKTYqcSiTrDPyCXM6aQsMAfR8?=
 =?us-ascii?Q?7nnAPyTJ6A+Mc7NeZ6jJZwCcWql3DAtBiaLLGNJb63OqKtqF2qE/RTmZBY1s?=
 =?us-ascii?Q?VWL94tp2KCqkSRIYt4sA1etjROYHut83GrZ3jyAuv2uOi7WYWY5NlpokiQwE?=
 =?us-ascii?Q?FIqR1n3lQ1toJdoe6bVyu/mtnY8HZRCr9qW0vT3zKjGKmDQk7m3zem8WJSxJ?=
 =?us-ascii?Q?718AsbMVZTo4fQgkXyDIq5YJwpEAAn5946LbtnTCDHI3L8N2RPe6jgxGob9b?=
 =?us-ascii?Q?fgfUjUCwt2A3d7V9OsqG8hTR9df8i+3knzyOmnvyvyxFGfj2LjRknLflFhQg?=
 =?us-ascii?Q?sm6Ve3p6rg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d8e0ca-bc2f-47bc-5988-08dee86332f4
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 02:36:28.9608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyAjYZUNIZbCFeBdMzuFDwMu6+K3fn5tWbdwGeryRZbw8obBRGDeyKZsPib7mcuFaAGllDu2Tlm+Y6fjoD2ntA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6542
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_193635_385919_EEDDA002 
X-CRM114-Status: UNSURE (   8.75  )
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

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
---
 drivers/soc/ti/wkup_m3_ipc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
index 5845fc652adc..f8640cdc2a21 100644
--- a/drivers/soc/ti/wkup_m3_ipc.c
+++ b/drivers/soc/ti/wkup_m3_ipc.c
@@ -630,10 +630,8 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, wkup_m3_txev_handler,
 			       0, "wkup_m3_txev", m3_ipc);
-	if (ret) {
-		dev_err(dev, "request_irq failed\n");
+	if (ret)
 		return ret;
-	}
 
 	m3_ipc->mbox_client.dev = dev;
 	m3_ipc->mbox_client.tx_done = NULL;
-- 
2.34.1


