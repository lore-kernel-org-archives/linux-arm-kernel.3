Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26891CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2edt3hCNhDDISlEQWDtl5hq5r7qRXf/kTUlSGVC3Zc=; b=wWv4N42C774RQI7puJM2Z7Igrr
	js+fga41eCbizmy1BVEjj9eP7QbV05mWPg/Ch2HFi9cdA7R5lMhmZafmWaJu11p8oly6kKZWk/j/x
	QRxE5OLWbsfi0x9peQ4Hf1qyE4aLKqlRG//vBjgKXEhBenomrue4W0ZSN1x0LwGv8KH4Zvvl7PULw
	cnp5ILLUb3Y0nJT9BDrA8x/XOpm156fnS9RQOreCyAU3ymesTifKYfGY0HRVP0Xr6XBzc9H8fPizW
	1hjqZ0wCMGemkuY4Ojm8Nm1kKVQlhTbOPLhmhsRtqCGudriys1521w3S1rjw4HyybyLba2i8qp08j
	iBD/CrlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkgg-00000004WuW-0HWd;
	Sat, 23 Aug 2025 09:37:26 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upbwD-00000003h2a-1Sjp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 00:16:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHHxQT7jU+BPJiQH1ZPCnJiehGOv4sTzHMFzylDYchChocMgsf6Ho+S46D9aFJag+ksQWHjV6LAcL4oaA+tSNn6hqbHg8WURJY7sBi42pB1sTnJuGH9AOlrcZXDwinUL7fNVXRIS3B4dNBMfukyQYLLKBuJUtFo6SdvIXDb9T04AxqhRJZfB6yUZQ/GeK0WDhqVEIsQN6dy1ekzlTPLj+/3AkJ41Cp/7cvkVnjDBADTBWoLgf0Yqy0cqV9jfO25GAWo3tyInklERCX53pFUacgeoSpEpiMSnywjYJ9IBkn6F4X0sceVEnMWIF6YNegM0abBRUrS9l8HORjg4Fu6GTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2edt3hCNhDDISlEQWDtl5hq5r7qRXf/kTUlSGVC3Zc=;
 b=E827KN0dGEAsdGPTDpYOnGfG00eYD3pinCE4pLAGQ49p9WWYxgsSPehaZyQzEli/JQ5B+z00mwtDkUASqvcSGrVM7F0FnpmRBaTkZEIo3Yrz2kRHzey55Gdp+etrLTinTNA+IPHrTWF1RL6hkMMbWE9gJAgMkPPHsSuJr86YeKhra4E8aqOf1ugYltFojZ7R9uxUBbBemIQBh3Bz9mjL033/80CGj7fObiwD0XxYaZncKDaBdanRpWw6YHShcxZu6+Hn8HEjIwTxqcWnnx7oadyh1oMVsMX8cnTcnUYX0jDf22giykgi/VPPCy6cOGkaWWPzrHI6CAPG3nibujvemg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2edt3hCNhDDISlEQWDtl5hq5r7qRXf/kTUlSGVC3Zc=;
 b=LaaRNKE0UFSxVFbIMyTSdwCseFj7hjdIxcCF5GSmT9A5xJ77s+TFUhb3DzeLOx2IOZJQNFq3W2Q7T0XNoCDicrEh8y+PJJtgq2KeJ34k8SCNXSiQWoO3sjUx7wJ0YU/cygCIUlofyT3fTujeW+NF117edrgRLzAQE/R9rvFrBfTwRLKB0bjCSRHUjxaEBgu9HeOLNyQ/j00/U7PmvjB5ay7mDx2ww5h4BaePMWA46WfE4gnfKrZQ91nWcXTsmDNqhHYk4NDw0uHTvGQYAQFXHVPVNd7xYzFzB0+johe4LrGwNTqc6HXORHzgilXhQrZdrF0odN2dPgn5KmiJmOSHXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAXPR08MB6398.eurprd08.prod.outlook.com (2603:10a6:102:12d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Sat, 23 Aug
 2025 00:16:44 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9031.018; Sat, 23 Aug 2025
 00:16:44 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v4 11/13] spi: airoha: set custom sector size equal to flash page size
Date: Sat, 23 Aug 2025 03:16:23 +0300
Message-ID: <20250823001626.3641935-12-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
References: <aKgSY7bOrC8-qZE3@lore-rh-laptop>
 <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0047.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:273::8) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PAXPR08MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: c4456f0d-4dab-4b79-c4f3-08dde1da5746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T/srWrnVC5yoOxL1P+08sGnF5aoap2B2mM0dmczQPdxzGNpo+p9WG1MaF8wW?=
 =?us-ascii?Q?cOAwGg9xEb3ZVEi4kwcO5VbD43b/U5I1ZScBPqaPViVIbv1SA8LZu0LP9tHk?=
 =?us-ascii?Q?+UTyMMhidcM+kprG3TVs2EczFbJJ9QxA1SFziO+9Yx8cpQduAmAGOCm+YbcL?=
 =?us-ascii?Q?SSI92YK4WV+8PTOaET7C6ImdxGuu07bRAGF42T7ZyiWwKodDlNzFV3wWFobD?=
 =?us-ascii?Q?LUU1uJXHitRKdMY5nTClrBzW8xUan59vBxDuwQYvyAPjKq2Cx7AnF8AyOIV/?=
 =?us-ascii?Q?tVc8WSTu7uFCan3MasJz4c+XAYMiugFFaQYiXnWIMwjgY0l4nOaqETeLqiQo?=
 =?us-ascii?Q?bkFJbmer3Y1O91ax9w92CvTnNknk1j+NWW7UIo6jDZmLWOsbpmuNRQE5JvFF?=
 =?us-ascii?Q?tNSH0pnemI3rQkLLqB3zI9wOUOdjdMw5zDf+raTXSrr809mwtzz/pRe0htdw?=
 =?us-ascii?Q?RZ1g9LesJdCmkeibLp9iUa9M87J8n9gNQGcKHbelDfDrtvFSbHFxso0FQRMd?=
 =?us-ascii?Q?v4y0IrYXr7UNIrFeLeZcNRol73aG8sUrdmPz+AqonzdmBW9NXTU3k0c0PI44?=
 =?us-ascii?Q?Xiv1+g1HJSzjKM4frv3etd9icFlkGV2C0Q9wRIeKW6xHSvspeEowWN+um0sk?=
 =?us-ascii?Q?czbQ8bnJjvEcBuRBQnJ25lj7Ici5HFAPu33M1v1QricmqG08evJ3/4C4iCOc?=
 =?us-ascii?Q?k5yYBbS+pAiRPllw5PYeEIb57FTQfYETB0Tf2pZDSqaEnNRHcoDLRAOnFKe7?=
 =?us-ascii?Q?k/1PhPrBS97Y4ENdB5slFeH5PqdbAVImOLhXmuvDzBqtfctFcgwX5S0ql0uJ?=
 =?us-ascii?Q?dc+mJWQEEOfLvBwOYoKz2GGmXn/wkp2EkaLDKxt9bSohCnPQfA38uDpZ0ufV?=
 =?us-ascii?Q?VU6YWOHpTF5Pnyt4zEAbcdtNESTNvnSFKkC6YOqdOPZC65K5ljg4N6Ej5QaO?=
 =?us-ascii?Q?/bFd/5MMUau5IIPEHx7LIOF8jrBwxZOpjsDaEcf3ZqNgIMjzWD6m3NWsN3Q1?=
 =?us-ascii?Q?GNGHwCp0JUw0VQU+RIJL7qL+wdGGdoK283aJ+mMzM6ntvfMgbSSVPFvGV37n?=
 =?us-ascii?Q?GVJJ4DEBgbWfR0ldcLEWXrRnM3/wcazNkAp/oh2DER6gUxRdB4gdWGqUWXZm?=
 =?us-ascii?Q?Qm6Ho6zi12dkNqZi9TvJnSYxI4Fj5OsKFqxy2l3qHl0qankv2Zu/fzOapdOK?=
 =?us-ascii?Q?WgD19XAzNOr/JYRcrBZ732q5+cv6w/s9bwyHlXnoTLVpvFGpS+//8QeKTYZ3?=
 =?us-ascii?Q?bNOtqiLQBaTPGSLb9KZqSTkt4KVj2KptUtsQEZqBcOVA62OS4YhiIPPCnIl4?=
 =?us-ascii?Q?FU82IrwzPzIgBuuYH1AbvKJJ1uStnlwz2F7QkvpDOpHK+LQktLxvIXoxbAho?=
 =?us-ascii?Q?KC7LHS67bHMAMUwvlrlFz7m5McMbdNvFHuvr34wHs2A4zQbS4oHycfF9BJGV?=
 =?us-ascii?Q?PTFK6e0gpNvjaJ32yKTd0kfUNeO6FrgT2SxY7SqAKOPY53PD8XuiWQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o3cTSatFXSvH47aAHqQ4oLsrMw2zPmaLOJNq7vaqfuHycAt3TtPQiDFjT/wB?=
 =?us-ascii?Q?77hShxfZIxWMezHefZo2tebJo97QGZepox4HBsMo7AdJ305C1RqL4GXXaO9c?=
 =?us-ascii?Q?Y29429grzu1HLsowH7cLWRAEqK5YVe3uBMTxDECYnJ1jIu+ynRGxMHA/ar4p?=
 =?us-ascii?Q?W4UgKlnYpvufim/5X1laiac69QNaw5VhImoYRu2r4FabsVnOSHn0mrzVjcY0?=
 =?us-ascii?Q?+T0Yixy0UIE6GaVhDcmDOrNtLT73iN+yp6qCz8lUXutHrMDhwJo53QdFpD4c?=
 =?us-ascii?Q?33Rv1vR9FpVIaJBgWvNqYS4nvxkcf9SZ0EYv+ys46LRp6JlA5Cq2EOnhbm/9?=
 =?us-ascii?Q?OBBFuwlUfFgc/JS8NcRG/ttk7EGlGub322Pf+z0XBa3WCLneWzTQBp2YnKgw?=
 =?us-ascii?Q?LQDftsriBwm96EEhaX5jYB5kG/2TIuRWMVZieVwIKfpQN14tUAbsq9lfmopc?=
 =?us-ascii?Q?scXb4H3RBERTqHJ2o6p5uxEnqnd8hynR87yBkwDqH3+gbWYFres0c8WWyBwk?=
 =?us-ascii?Q?QR8wfWnkE0yFQYfVWUoUKxGGG91LxKgpilPpx7TvRda4b6z8MfujYTyEU0XG?=
 =?us-ascii?Q?tsVxgrhQ6bzEY4SwDgQDoNazwQXqs120DEqBNjohXRxAnsp/uraWqwOzO59l?=
 =?us-ascii?Q?x2kAmCjR55bbsPOg80dsP1+eEMFEUjNLEtxZDg0n5QxA5ZIF2xLea59HzOvX?=
 =?us-ascii?Q?rY+hLqKp4NQCMcmcY+jiRs1BAQWTAijvM9P2O0NVY/L8Zy+GHBGmQkAxLYnI?=
 =?us-ascii?Q?nAJeaNMcW02duZkcGNH7UmkP9cqhsdSlGrnq2FY9TdoT6nsOkr8SD6NZHmGh?=
 =?us-ascii?Q?HT5SDNo3CzWXcpuj7RxFiYuJ/YfKqd8orB2yWMhJtmC8ehYpgb+dWernfwAk?=
 =?us-ascii?Q?dCy0//fg5NfKUEK0Rq0joR6lVgulsmNFak0+3X56JbKB1M9TuCURXIf3wD2z?=
 =?us-ascii?Q?eapDciFiHYn3ucZ+QGlGBUWDyA84YXmUYz2VeEcfvZwPd8LKOeoPYTeY7SxP?=
 =?us-ascii?Q?kPZiAyxPXYav9qWWmmt5EXPlDTMRN/Vvn3NrAmLAvNkkjiTQBlByCQQpRWfJ?=
 =?us-ascii?Q?9NUgJJGfj2SBKMqmNqoges2OXZDnoajNOHQXISSd1S1Hi/kdZsQHHp9YhP0l?=
 =?us-ascii?Q?nx0hD9CEKoWhYgAHSnq1QC9yR7wDFbaRTNDF4ZL3Sf+Ta0m3wXQMh8y12ukx?=
 =?us-ascii?Q?W1ecCY7GcqvXA4OZFbC2w5IF3KZ2/6oH+Ev9JjDFlES73pFhTsWgMtP1cj2D?=
 =?us-ascii?Q?Y1WE6qkzdZmHNQfZAi8hBQT5S1GGWPTPkY3gNwtRu2YatV0Aw4n5j08Rz3Eo?=
 =?us-ascii?Q?1jgnSoTxY/GfWlk4AYY6ghb2b2n8ATPcEzUAMIpZg6W+Y9YSNonML3Y5QbQQ?=
 =?us-ascii?Q?oOx+rUIzndlzLuBYc8oK9gE8/z1uYPBujrMN1thb/nm0kl2AzdtHmff2xAPo?=
 =?us-ascii?Q?Kzid+I7WUo3mI7KZOK3RDJez9Lw3h39jJ8sPbg6znNIdNwsNOzN9TB+BGzxF?=
 =?us-ascii?Q?Lmc1joNQeAOU6wzqKxclA8aFXpsT9peLH5IJAmQWW14hE6/7BXOsPvWIOnQK?=
 =?us-ascii?Q?lZAZ3SaJd5KRDcdOqgnkq6a6Mts87kGl7bFkVoEyYMzF08U3pwevxMBybyfo?=
 =?us-ascii?Q?INXgHX0zoAKDLcyWLsF8K90=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c4456f0d-4dab-4b79-c4f3-08dde1da5746
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2025 00:16:44.1550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZhMZ8hTq/JBsKdDRW5c48uce+KvIgurpRbhrXC2MxR7R7ZKVaULuuAJ55srJ15HgEpDjsEt3TORae1mTzTzNt3LWn1W99nUSYFMRSuM1Ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_171653_388190_44ADF00E 
X-CRM114-Status: GOOD (  11.21  )
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

Set custom sector size equal to flash page size including oob. Thus we
will always read a single sector. The maximum custom sector size is
8187, so all possible flash sector sizes are supported.

This patch is a necessary step to avoid reading flash page settings
from SNFI registers during driver startup.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 284ec5534693..bcecfb02497f 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -519,7 +519,7 @@ static int airoha_snand_nfi_config(struct airoha_snand_ctrl *as_ctrl)
 		return err;
 
 	/* sec num */
-	val = FIELD_PREP(SPI_NFI_SEC_NUM, as_ctrl->nfi_cfg.sec_num);
+	val = FIELD_PREP(SPI_NFI_SEC_NUM, 1);
 	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
 				 SPI_NFI_SEC_NUM, val);
 	if (err)
@@ -532,7 +532,8 @@ static int airoha_snand_nfi_config(struct airoha_snand_ctrl *as_ctrl)
 		return err;
 
 	/* set cust sec size */
-	val = FIELD_PREP(SPI_NFI_CUS_SEC_SIZE, as_ctrl->nfi_cfg.sec_size);
+	val = FIELD_PREP(SPI_NFI_CUS_SEC_SIZE,
+			 as_ctrl->nfi_cfg.sec_size * as_ctrl->nfi_cfg.sec_num);
 	return regmap_update_bits(as_ctrl->regmap_nfi,
 				  REG_SPI_NFI_SECCUS_SIZE,
 				  SPI_NFI_CUS_SEC_SIZE, val);
@@ -635,10 +636,13 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	u8 *txrx_buf = spi_get_ctldata(spi);
 	dma_addr_t dma_addr;
 	u32 val, rd_mode, opcode;
+	size_t bytes;
 	int err;
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
 
+	bytes = as_ctrl->nfi_cfg.sec_num * as_ctrl->nfi_cfg.sec_size;
+
 	/*
 	 * DUALIO and QUADIO opcodes are not supported by the spi controller,
 	 * replace them with supported opcodes.
@@ -696,18 +700,17 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 				 FIELD_PREP(SPI_NFI_OPMODE, 6));
 
 	/* Set number of sector will be read */
-	val = FIELD_PREP(SPI_NFI_SEC_NUM, as_ctrl->nfi_cfg.sec_num);
 	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
-				 SPI_NFI_SEC_NUM, val);
+				 SPI_NFI_SEC_NUM,
+				 FIELD_PREP(SPI_NFI_SEC_NUM, 1));
 	if (err)
 		goto error_dma_mode_off;
 
 	/* Set custom sector size */
-	val = as_ctrl->nfi_cfg.sec_size;
 	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_SECCUS_SIZE,
 				 SPI_NFI_CUS_SEC_SIZE |
 				 SPI_NFI_CUS_SEC_SIZE_EN,
-				 FIELD_PREP(SPI_NFI_CUS_SEC_SIZE, val) |
+				 FIELD_PREP(SPI_NFI_CUS_SEC_SIZE, bytes) |
 				 SPI_NFI_CUS_SEC_SIZE_EN);
 	if (err)
 		goto error_dma_mode_off;
@@ -732,11 +735,10 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	 *        = NFI_SNF_MISC_CTL2.read_data_byte_number =
 	 *        = NFI_CON.sector_number * NFI_SECCUS.custom_sector_size
 	 */
-	val = as_ctrl->nfi_cfg.sec_size * as_ctrl->nfi_cfg.sec_num;
-	val = FIELD_PREP(SPI_NFI_READ_DATA_BYTE_NUM, val);
 	err = regmap_update_bits(as_ctrl->regmap_nfi,
 				 REG_SPI_NFI_SNF_MISC_CTL2,
-				 SPI_NFI_READ_DATA_BYTE_NUM, val);
+				 SPI_NFI_READ_DATA_BYTE_NUM,
+				 FIELD_PREP(SPI_NFI_READ_DATA_BYTE_NUM, bytes));
 	if (err)
 		goto error_dma_unmap;
 
@@ -825,10 +827,13 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	struct airoha_snand_ctrl *as_ctrl;
 	dma_addr_t dma_addr;
 	u32 wr_mode, val, opcode;
+	size_t bytes;
 	int err;
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
 
+	bytes = as_ctrl->nfi_cfg.sec_num * as_ctrl->nfi_cfg.sec_size;
+
 	opcode = desc->info.op_tmpl.cmd.opcode;
 	switch (opcode) {
 	case SPI_NAND_OP_PROGRAM_LOAD_SINGLE:
@@ -879,18 +884,17 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 		goto error_dma_mode_off;
 
 	/* Set number of sector will be written */
-	val = FIELD_PREP(SPI_NFI_SEC_NUM, as_ctrl->nfi_cfg.sec_num);
 	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
-				 SPI_NFI_SEC_NUM, val);
+				 SPI_NFI_SEC_NUM,
+				 FIELD_PREP(SPI_NFI_SEC_NUM, 1));
 	if (err)
 		goto error_dma_mode_off;
 
 	/* Set custom sector size */
-	val = as_ctrl->nfi_cfg.sec_size;
 	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_SECCUS_SIZE,
 				 SPI_NFI_CUS_SEC_SIZE |
 				 SPI_NFI_CUS_SEC_SIZE_EN,
-				 FIELD_PREP(SPI_NFI_CUS_SEC_SIZE, val) |
+				 FIELD_PREP(SPI_NFI_CUS_SEC_SIZE, bytes) |
 				 SPI_NFI_CUS_SEC_SIZE_EN);
 	if (err)
 		goto error_dma_mode_off;
@@ -915,11 +919,10 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	 *        = NFI_SNF_MISC_CTL2.write_data_byte_number =
 	 *        = NFI_CON.sector_number * NFI_SECCUS.custom_sector_size
 	 */
-	val = as_ctrl->nfi_cfg.sec_size * as_ctrl->nfi_cfg.sec_num;
-	val = FIELD_PREP(SPI_NFI_PROG_LOAD_BYTE_NUM, val);
 	err = regmap_update_bits(as_ctrl->regmap_nfi,
 				 REG_SPI_NFI_SNF_MISC_CTL2,
-				 SPI_NFI_PROG_LOAD_BYTE_NUM, val);
+				 SPI_NFI_PROG_LOAD_BYTE_NUM,
+				 FIELD_PREP(SPI_NFI_PROG_LOAD_BYTE_NUM, bytes));
 	if (err)
 		goto error_dma_unmap;
 
-- 
2.50.1


