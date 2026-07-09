Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C4CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 02:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nje3VnB7DSlBIObuHE4/HU+NqWp0QyBUBupHe4jUl+I=; b=B7lY3+n1B1rG9p2xjCG29lU7mF
	j+KTcaBMnQy7K9XmBAhegmoOHOjwSb5B6+5eXOwZ3iMFqM2Ah21qAAZaJudNTgmQ6cEqadKpY4aQP
	RqX+2NDoROBzA/eZdqMHUfKCem0nhi3umDohh9rDdrtuD//bnxLm6f0zDlJqhmOScaW5Swgaj23Pu
	Oc6SBItuWlLtXlzaiNZyzPIlmZ4oU2OKNwdqnTQ2qmKqaGoIAtGWFEg4A+dweg3w+jHWq0nN4dh0c
	CaNvBIvnbwnv3JLTKi7rdOAsd0NO1XwV90MjP0DcpY/JcPv1sm1sHGUQBZksQ7tPmgyG16aKJ+6fk
	9aeIYhwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheYw-00000000pSi-2bLV;
	Thu, 09 Jul 2026 02:32:30 +0000
Received: from mail-koreacentralazon11013055.outbound.protection.outlook.com ([40.107.44.55] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheYu-00000000pQb-217j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 02:32:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pfm5go0yMUgqlx816Gazlu0IcWCOQuxBRMQFb5HQOPOuiwPev+TgY8ile+Cf2EM6RtkYJqZH9ZwjNEtZcQPxZ8WdcAgDc0H8S27nM/S12XJIK2VZH/fXdba7EURRn7SUShodNJoCL8CxjTXojwSXwaHgKgSzsqBAs6FoiHdVk7g48Ie/p6DUZnMTIdH6CAG7tfoAzvzADDqMX30A45ZT6UbPbwWtpBkyTlvScBizH9ETv+cXaVb18/JXjLdOevUKA+eyKUCJz5CrY1A0dqKBmVE//smR2//qaeTjTJ1QnKVHVwNrZxWLCLGD/aVrrjkvLQ0KVJvWHsaVI6y61fU9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nje3VnB7DSlBIObuHE4/HU+NqWp0QyBUBupHe4jUl+I=;
 b=hU0LtbFMYb5mE2bout5KJQxut9cNqmas9mE/OsykEFxK0gcvB4wdqRk2N/5OuZmVHEU/wc2T6+T8eUjmDphtQKzZZc1XGs904dU7g7yvEjC0oBR0g+XeKqf3OR67WN8CMtJe3HZtdB3ZUmboOn5mx45ULzRR04r6Tz2C5tknApsldzUQR3XiTBgCoKvwoAsgNei/PoJNGcf1uB1atcJEbB2IpRn3Ta6dyGqL5VK5EH4zGCN4lfgbercldR7enVGEqbL3Vr9Ya0cmSWx9FEq2QjGXjAPK3NloS2YolyvCphTvxYDZL399QzOHSglZBg6npQHJbk0RurrH+vTTw5d76g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nje3VnB7DSlBIObuHE4/HU+NqWp0QyBUBupHe4jUl+I=;
 b=bLIobmN1WvCYuR7oTq6M3ibKe70DZ55zCNWVXi8c9bfQc+BY/m1wasxwWztCtTbbQHxk+5kWTP3h+aks1cZcNQtuNPzFalfrDDwjBANMe9t9DQxW5db/i2bi0hFpcMXBtj30O1zJQEzhto9q+6Zaq4iGuWq7OsJ7CGZ0BjPDfk7iTAIyiK8Fo4dhWeErhhVuF2wlVax+OBHNgDvyQz6sgY4JM30kk3yHFsJYxvCGuR8QrCzui/ScLT6lWEpQueHniimlpYrgkX+w+EaMlso6rgecuTiSgYS0/M8ejhUSRVr60+2A6hhPgnqJ4j10jJqpbZ+sRYvxok9KftetS/n8cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 02:32:17 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 02:32:17 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 15/18] thermal/drivers/exynos: Remove redundant dev_err()
Date: Thu,  9 Jul 2026 10:30:18 +0800
Message-Id: <20260709023048.599150-16-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: c45b56f4-59d2-45bc-75ee-08dedd624b43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|23010399003|7416014|1800799024|366016|18002099003|22082099003|11063799006|6133799003|56012099006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: LqZaNUYrlxQVKypzJT556w7at6CvvKCkefgWo+uKZA9MxMsxDPwjU4tKmPAu6FDbvzPaP5cCEIkP975bvNATwIM3vYcpgl1a+C3N1h+5CLQqDN9E7dliueyTGCkaR+ZSR9AS9poLDPte/Oe72wbsvCL6phisvFOUGGzibopzUzUPjcHw9snVLawxfb75J4vXzB7IpBTyJitrVbScTPRhBxT6ZmiDLLCPe6ewf0EN7K20tR8XdCN+Hgafd5xQyce/rn7N3eEaFgoOHheA5JQbtexR6Ce3CvPAJ/itp0dg57VF/fH/liC1geTSQdsloxTKxLKddGBRJ7jsxzq5DCe4Wpcn6weTk1/VQxXjYOuXTe72srN483oMfzTCtsq5sJnpy31WOUf9v/p+z6dq5IGi4N8UUsVixQA78pn/BGAZf2uoC45xLRUDKjdvfrEQe+L8FKQ9Sq8aL1hzgqV//jEIvFyPwPmuOhwRJ5bgWYnv7DazW/NYpBln8xbfqRkT5+VIHAdi/DIbeYUWxGjNtUAkZbjttnP+MByIZhnV0wywoYrjhTcW/TxOirt0Sa8gvwNalZU40InVxGWcGpo0AZzoLGsEjMPVzxOSE9QoKuYfIMdzcSQO6tM0PQcYJGLtCZfVRf3v0A0FelRB4rsn5nrxnPZvWcpBkOXEcCcq9v7Oha+ueC11SPw4MGLhqd4wnHrQCc7wXKrG020UdGBIEaddqAHB+9uoKEa8Hz+nRFXbIgGkI488r5/2TPO4WMX0Y1sa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(7416014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SAWAMHeQ9Deu0tSJFd1NE49P4csPH9icU0BJFEACfBPMOnY9RSCAQOTMFs9M?=
 =?us-ascii?Q?Mn0LPc3EUj18tS4Norw6yQV4kWqHgiHRFunaYG1umt//nEgIaW55ekc68YGd?=
 =?us-ascii?Q?1lkRsW/TauB2mv6b1Ms5Sk/pHwu685vOyt9NwUVet9enQVeACJQ2jtlS8k02?=
 =?us-ascii?Q?1hUdr5cd5MYjVEIZpKa00IEbtKUebrESMiQuiNaKw/MwaYmJfcILFZOFqjLw?=
 =?us-ascii?Q?tLHmqrk0K8OgSH2HEjzmTaCjqWZ3NhL1sWcJBmZZBf7set2MzR2qSsCXlh9N?=
 =?us-ascii?Q?RV7s+Sf8STnjxgxri9Y4spq3qpUm/uJLv/y2FLX53Pw9BocuFQlGgAUZnZtG?=
 =?us-ascii?Q?SKOTHLszsj5Z71f3UROHrkJO2C2c74GBp21/qnVMNynNn9w5g5zREX7+x7xB?=
 =?us-ascii?Q?fry21gU5G75omSt9beHUzqO2az4ESXyn/Ngfy4Yfq7+ppZxF49MvHycFNzka?=
 =?us-ascii?Q?SHL4hOaciQ6ARW4BcgZqtX9G4uB6AkwQFTZhMNSg3+gPB5K5oN1N/BnSUqfp?=
 =?us-ascii?Q?Ag7dP1ZziDxo438JjYnELuu7m7YcmLMvsXdF8pzHDt2e5W9oB+m3Aj/8rd6a?=
 =?us-ascii?Q?nnNe7yLbl6jfC2QjDgNu4qolGyTbBcstppYOdKxJ1Qgp1V4dy5oXQEoaegr5?=
 =?us-ascii?Q?JYGsgIVunQzE4JUrQ9bRdckxYia0CTcWE/rxuzgc2ybCYr5HzEa3wyPTHaH7?=
 =?us-ascii?Q?GbISNAfUeEzHQjPiXye3g0IKTJ1YsUNvenzbamAb+Xn+BKut9wyKwDos4p7L?=
 =?us-ascii?Q?PLqA+IiOdRBIliz6O+mjSAasmBi1xEJDDPyPffBUratVy/Tqsdo/sEpqmaml?=
 =?us-ascii?Q?a8Ba/qogdv6vqsB9cOcirCYLcRVMw/VgF1HCDIa3KjQPmJZ7W172lJfsJqbK?=
 =?us-ascii?Q?JzgtCnH9KeAc33P92/G8/1N7K6N1ejZHB+gi2/0L3/z7VM8vd/OivpYO3e9I?=
 =?us-ascii?Q?+bt1JP339C0VxSYef/qjS74LgM9T6RjbgB3T9Q9mHWqVAzHCpRpzRjH06IBh?=
 =?us-ascii?Q?OoErZK0DXxHGPYvAL+DkozDsqp7KXTw7h/GE+fuJI+XVSXNkc+nHl0pbkZUa?=
 =?us-ascii?Q?B1KgmurjdhuJjBXNKzjj8XZ+ZXyeWs2JQeeaY5PMDTJ6kQ4N4MYMTt12aEgS?=
 =?us-ascii?Q?LS8MJtgKPsf/6Cd2H3Fr/M1JNVPf6y2map0VZAr4HCvB66a8EN7a6awwrhHQ?=
 =?us-ascii?Q?tSHuZAF3SNVtEPLoDWizt4FqMjk6ZkBuMJ8QiznF1qaNdUUBb+yHbp45oRBD?=
 =?us-ascii?Q?0ICUUxjOGwPm2/TlL2K3oyciPb8cPUfQcG7lXsjUWNT5vBbQyxjw+J5xon0z?=
 =?us-ascii?Q?3BykJzoyXGvyeKg88W+d3MsHNsdo2bogUBWfi7uSw/uHrFdHdyMpKzE7l6wC?=
 =?us-ascii?Q?nfKn9H1WOcFrDu7LW6BnIgikH7qbvqpzaihFhEkkTIW2cQWGPwQf2rQHlzGX?=
 =?us-ascii?Q?2iTk51LYzpCIincYZQevNBP5Rw3Q37k6KdUBdzNdHPKeEWwyzPzjbJuLyKBm?=
 =?us-ascii?Q?bVZkMMGL/kHsK0MyuhF1iCoAT8Uwl8YP+P2MVChav9oVb9cPyHAabK+Xt9WA?=
 =?us-ascii?Q?WdbgFiR3up5z5rQ8svU/UoojpacgE23KiP5RI3vC+iGvL2q+sW7vXzbl3MFr?=
 =?us-ascii?Q?UnJSq52FwOcOFEaCuM6iPLy0Fgg3YmP7e6dxUiPWcKXcFofJt0BA2t3eOF65?=
 =?us-ascii?Q?h6a2clDuF0BZXNBGs9uUp4k8Kt4GxzBS6KnxhC36IBbHmk1F04OL0hRqTEdi?=
 =?us-ascii?Q?bL3Wo0DXHQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c45b56f4-59d2-45bc-75ee-08dedd624b43
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 02:32:17.4245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TGJ5Ay5YiEYDZVL1RUN9t910aEiDS8L9gmSoMttOovIyD52fjFvj7s7EZHqYh+bZjNsBHi/YiNW+V1gy8dESA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_193228_523329_CDBE1A36 
X-CRM114-Status: UNSURE (   9.92  )
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

The devm_request_threaded_irq() now automatically logs detailed error
messages on failure. This eliminates the need for driver-specific
dev_err() calls that previously printed generic messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c5395..56717bb50d60 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1102,10 +1102,8 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 					IRQF_TRIGGER_RISING
 						| IRQF_SHARED | IRQF_ONESHOT,
 					dev_name(dev), data);
-	if (ret) {
-		dev_err(dev, "Failed to request irq: %d\n", data->irq);
+	if (ret)
 		goto err_sclk;
-	}
 
 	exynos_tmu_control(pdev, true);
 	return 0;
-- 
2.34.1


