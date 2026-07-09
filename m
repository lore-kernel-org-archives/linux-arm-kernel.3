Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A4EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 02:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqeT8FSjWBLwt4mcnfCkOyHd5HDogMzcwjCTzCcRR4I=; b=3CrNbvEkTsqbwy8iSmv5WVW6EA
	eU0ZlreHteA9A3GghfKHqrutOwsVYcRrTYzEa91AozFHWgYsWrShO8qIAgsoQfFtZ+mMTwILe65Jz
	i+Xr5JYiFjiHTzYvklJbdhuvzACuIgDLvCTNTYTMxrzspcpVbsxBM94P/nsyWX0FFXPAyIPT3oRaE
	sPrODoal0foQkOcYUuQeQWsGi0b+E+hjoywulIuaKZBsO/QI044QeH2ZHlT/+sB66I6lGJ8GwCnvg
	DfCVc8QJlB5NMsNe5+1TT4515nuHMPlgaf7aY9RbimBfnGYyPRzM9OTvjVjKBAxM6r6bcJN607f+d
	jnboACmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheYL-00000000p76-1Ztc;
	Thu, 09 Jul 2026 02:31:53 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheYI-00000000p6d-1RZF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 02:31:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSIOaazppCRwRG1la4srXokXVrqgwyeVK9UOkNTBuLsBu2Hti/7igbAxI1Cf6m13qS3h5Mxxn0j23seOGPp8htsO/MuU8TbX2MZWk11rFyiKHLid/637KEPRqPmvUkzFKqozN89ihLf8Hwpccj5c68RAV6muHW32IjcdIy3kiJmNGbJ5zfThoFwQQRWOBNldNwqF1tW+3rQKvobA7CSL5CLVf0DykV6Nfa5gpIHvmXyPQDzvu7ATARhec4rw3s376+S2VM+BXpLPTjKjWd+xtMEBB4MS842ec3HeeBvZ5qg0cMvOPcyEyNCrdNeRlrieHBaDo0K9GlOPEv3eadSEtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqeT8FSjWBLwt4mcnfCkOyHd5HDogMzcwjCTzCcRR4I=;
 b=yHmxtM0iHAYuGU51qd0GB4g0xpSCmUyu3Jn9Tt+MQa5tg14kNuFT7cqEoxx4BveNK0wqS27+zFV7OiyeSE9e+xul84amgiVO1OW6gLdXcspe7ePwyPPjmAv3ZwGQdZkXYKsp1QzXLikGET5zZCECSJysDv93sOYKEnkle63sJuk3pUAUij3VbYtTvP35r1HEItFL5cV3jZ8dUrqyb6Bf/1eFbc3ba4Kqr0hgFKD/sI7oyy0i6hpPeVh454ZP0mZbK8rrHTNvb43Gy2gn7rMNVwV9DVEdQe6uB8Lah1s0yfl5tL0QudSrWWbjj4ZUStcfqx18ZQmYuF9z3ofGbiiYGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqeT8FSjWBLwt4mcnfCkOyHd5HDogMzcwjCTzCcRR4I=;
 b=FedKlQszrBCGy3pWvPL1AxQT8cY5d7kTFnv812/yMFf9TbzrbxYIZKy8/Xnp9ZhKnu7B3OOIv7KQ7fx4btTF6tOA6AeCJLvOlqAHZHnHGglMVTtd2603p8Wua5BfdUaLrykA+86O2zkq+1LvsacjsLwMDsPGfOXwQ7Au5SObeeSmGIcQZDCWd6YSHABRDoeXUGyNcXOtuXectvmdzWmt9ghnowmqZ1Q0vSzxqMe/j7ZPw75UmeQHTbm64Oqmi9cCFMUyBg664GZIATY6nP4q+m0dSggsptG8p8tyY6pcrKrCv01rZsaPCjkRaicIWp1zlHCZeeqNz1ibE/C98F5Wmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 02:31:44 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 02:31:44 +0000
From: Pan Chuang <panchuang@vivo.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pm@vger.kernel.org (open list:THERMAL),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 05/18] thermal/drivers/imx: Remove redundant dev_err()
Date: Thu,  9 Jul 2026 10:30:08 +0800
Message-Id: <20260709023048.599150-6-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709023048.599150-1-panchuang@vivo.com>
References: <20260709023048.599150-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::14) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEYPR06MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 9966ae06-93b1-4ce8-d6bd-08dedd6237a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|23010399003|7416014|1800799024|366016|18002099003|22082099003|11063799006|56012099006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: L6Vh1CFiGM4YIfq6Gi+gY/M8caj3bnZIYZca946IKdt1rbTwTPrhu2Wzw079DZqFeFeOm9VK85aFnZ4Qh/eYe1XFOweUqwQs7FnLfLn1nmzwk2tnio3w+IwJT4tRrvfXT8feYVT51mC6H4XjtXIIXDnN9rsYvcXzgHoCzC5L/tObxPa21Sj3VxWDshwv3lOf2zKotfJlstJSZSukX/iKHvAjd35nQjO01nnM0RBT5m5LIO9J0SR9p7JU4B+wjUYWOcWXe+eFAYynB9kvQxrAIHZVTAnqn4VNuKDBf7Pj0oYo6Y9PlO4VSek8AvufIMr5HPrZ2SfhnyfNqC8NoM+oEBpyRf8yzUD0EY8z3dJTCAjpqxIF8Rwae5jp0/qHUtLrq9rJBe5/aDV9NKGyEQZpDCLuv0A37fPSHDD34ELYeuT9iYWuVp5rUFriB2R+dpVTX95fJvhz5Ux1Sy17n2IgwPid8AZuVa3KObECpisA4utZeICDM7rQDW5ARjgussh+d8GVAZ4hrOKorXb9Q+mRQS1iBtCwRPb3VA9GA7X79dJFwb/PIFLdG77qWRsKSVNWZ0BfoOD0nJcWGqzDuA8WhAUOys2v066WhSX/Pgat78UF2x7V5p8KdOvpm2w3uD9+TnWvxo7oEO7akti0Ek7ZfSJm16ZulP3VyPl9AE5jikrtejGFSW+fkO78J47pFrk+GdVeLBmqNXTBS0/poS/z4UndkRq9IU+kEW+0pylglZvyTbBOBLmx0omBuHzmLqZ2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(7416014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HsgiuYBEXBIikDb9IGoLI9D3y6VXHei5pN+iLWlcjrkTpdFtyydeSEZvN76h?=
 =?us-ascii?Q?jXyHU+KLezcpJe6/TtFT1Fs9UBiDU8yCgrYeMC3IcR+UFyR/TheMgCmyGs/l?=
 =?us-ascii?Q?FR4zWUuT9Z7OSKzVWdHlmqCJym0SrGW78rp+2yVrEGRnARt8kPhxeafLj844?=
 =?us-ascii?Q?tRJhj1OIW4QoU//fVTiEq55QD0ZC+fcKtPJ0hRbwQnyGZHTmMD/tNlw3SAdt?=
 =?us-ascii?Q?Zboe21Hl4ckGorjzK+oF/gl80eaSbuCAQouD242lavNmdnY5XiQE7hOTvROq?=
 =?us-ascii?Q?/JB9SdHpbGu+rWkdSMrIBwfe68PE3RSq9xuY1cv9CZ782ZDpqCXIYNn+qbog?=
 =?us-ascii?Q?gvMrKNwvX/+f1ylGHhGl2XZDkHUS9Kc6dDwYWO28zdCX18SMlhZqQL7I/gXH?=
 =?us-ascii?Q?shz4Sh0i2+G77OR+tD+16C2UNHxiDreX253slcR0BtMiU+6Nq6Y+9ltTXGq5?=
 =?us-ascii?Q?KYblbp6EKZJAHtZsYxWUc99oHTgU76P7CkzrBHKFU/NzSaW43BK+83PWE/G9?=
 =?us-ascii?Q?G25CivW1ebYTHlnKiTcNCDWW3/2PBc8TeBB6+MGPAzT2i1PN8oifvmHw3xOG?=
 =?us-ascii?Q?UWBpeBtC1EV67DyejL4XNFUQq7XoJaZjSY97sJOcot/XA9VhVIrQofuC2yz4?=
 =?us-ascii?Q?wfiiMCydKSDYeMwz8V/4wvKIqinnz65d7XtYl22sNyUZupaJQBhpj5XF92I7?=
 =?us-ascii?Q?k4xyPJ3HUlY04BA4fxEdABa77pXDmg1MreO5pXpZ9vLHGswatgWr2BHN7t8B?=
 =?us-ascii?Q?Xq7QKVO7HZBcM1TVXXTHJ2RBo/SVuNreD5F78Cej6+Bokp7HqUcsYPFUCsVm?=
 =?us-ascii?Q?ZDnAOBKtstEoxjnnXRIChM2Svvv2FnGDJZ/Ww2K/PLiBN4fpOwmEpD051Nmo?=
 =?us-ascii?Q?y1TSWVw0GQFD2U5Z/BzX7qUSQaCZVN9F1zZczyIc9koaMvYbCqyGH53uyHB2?=
 =?us-ascii?Q?grHmy419NtXrhoCutvK0OCFKTGskf20dWdR9QufVcCNI5mp78t/8rHVQBKor?=
 =?us-ascii?Q?+8J7V9B0Gy21wPmtQrU0aEC0YYzy98fAiDVhtHBqozf7Cy1M1xVJRbuJV/Gw?=
 =?us-ascii?Q?2tuMvtohTlNlLW0Ptz4VzZBpmy1xgw8KdjZJ4PQ6ZfhyLrnfZitIq6bSyp7X?=
 =?us-ascii?Q?VtLz+Ft61MEGWRo5CSROj5Ucutb2iY5F6+HZ2g6sg8Dd8Z2TNSBPkiwrGYyq?=
 =?us-ascii?Q?MLddK+2P8r/VhkLpg7tULawnq882LZGlP4MRrlSUmtD3SzmyLbUcHHwxR4U0?=
 =?us-ascii?Q?z9ZCWrFBDbuJxrLrYbiL4rNtvrrYyP+zFm+Jg+NUtK5FQHq0rRbiDiTMq8Pl?=
 =?us-ascii?Q?KV/6aoGg7J1X34GmXpFICZ+VUn2n/0nSMYHoUcoi8z7tLAIUUbAX1fZ+uAVG?=
 =?us-ascii?Q?WrwMPs+wWOp6yVX7P0RfoTuPDFu3nJ+e+hZW5wbe8FOzOgX4L3c8vIC3UjyB?=
 =?us-ascii?Q?6WJk/GkZhIPbEVhpOvVKEsLE0+mlXrbh4DmNfxfKyHcolbtGDQe+Agn3Bbz5?=
 =?us-ascii?Q?agaBgjZF66wIkhsVz7K23Kd5RU3JBb6lqoYctAAYMy4JZxKWuBtd1i3fqDMe?=
 =?us-ascii?Q?8TvmX3lmKLX/+/j+coMW4cEvO9/wou54eC5O5IwWNgQg/XYwjnhl8fkE70Nb?=
 =?us-ascii?Q?zMW2rKK2X3GmlxFxKpSyrkE16nPlS965e7C7nnBh4E1qxMPlULoEexBr3Zp3?=
 =?us-ascii?Q?P9Z9T67ehYaxbDhCKSfbe+gFlK4d+03gz+4Oac/RZpGrIzWeJ310y4fjQje2?=
 =?us-ascii?Q?2/AEkJvmpA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9966ae06-93b1-4ce8-d6bd-08dedd6237a4
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 02:31:44.5172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1vlDp2kKs6PtBHFMxiaQn4UIClh2vP7dcsSozft5N9kqgru7VCpB5jKdRb9AGsDlUVVOBFDNf5wDIOC1xSTJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_193150_537881_CA3EBE17 
X-CRM114-Status: GOOD (  10.12  )
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

The devm_request_threaded_irq() now automatically logs detailed error
messages on failure. This eliminates the need for driver-specific
dev_err() calls that previously printed generic messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/thermal/imx_thermal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 5aaacbc53478..416d89c6287a 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -732,10 +732,8 @@ static int imx_thermal_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(dev, data->irq,
 			imx_thermal_alarm_irq, imx_thermal_alarm_irq_thread,
 			0, "imx_thermal", data);
-	if (ret < 0) {
-		dev_err(dev, "failed to request alarm irq: %d\n", ret);
+	if (ret < 0)
 		goto thermal_zone_unregister;
-	}
 
 	pm_runtime_put(data->dev);
 
-- 
2.34.1


