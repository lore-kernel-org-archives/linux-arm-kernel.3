Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAAECA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=606p9tA029FZYyVveHCd0LFlexJPYLR1FlTOFRup4VE=; b=2zaIbYHjX1Usws+f6+Ufk0gwgT
	xy6HiL3A6/UFF9uOD795e7X36IWNkfv4tbFnbgOnDL7yuByVDqt4H1I4THkWMMIngJlGhG4EE3bNC
	HoCrhqu3STbkKSpLc20VWaYbJa08TJSsTPML7bD6nqdfriBPrx5ASZsweYToRr2DRaf6OEylQP1UI
	POzb4u34dEA6Nlb4tOO0NXxmbJXy8ICYJwHn4H1v8OOp9rc/Bwp/OlnYqxVXbKpEeTgQkxFoTn1Zx
	IWRTYJ7drzyT0zqAq8nmZBiDLjlwqad5E3wfv1zXIdyLzsAZygYxEKEbOs0kKF0a5ULeH2XWYzDJq
	LEfFxQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umurq-00000002cvN-0BEt;
	Fri, 15 Aug 2025 13:53:14 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsQP-00000002JHO-0Wtp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:16:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlR87idVvC2No2jIcCuBWQHzPzJhl9mrNSrP3hr10TiZVJ9nrw2kaYt3QVzY32zMsj7IpQtbRD6zqR8XGY70aXozyn0sMJHbfZD9NE9ie0l48cpdUJyYh2bh6kQUt9EwB3mhQbdJFA6cJBr4dk1m7zmUMpOpBuEZWUrgt32+ARPCVluZJNK4izGakouE4kWZcwPf+Li6vXgXpfjELjOBiKxWZC3hC22UVylozjHLntnmydyYgVA1EvgOCsjG3L0mlG8l2FZUD9qR6l+Wj9imsuzO4B1MKTVpPy6JKJGQRJ8be5SUO8gVsC7WoMC+jAp63n2slykJDLO/XUd6wBL6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=606p9tA029FZYyVveHCd0LFlexJPYLR1FlTOFRup4VE=;
 b=ssl08WiIf01/Ul4tAv/H7DE6a0xbRXWhulKJ/AkxcNnqZP/sHXWfNHyobzajIe1rafy2nUnz/xldguiydOFoEinGd12gMm+F/QebZz5vLjBEZdelCMt05Fqu1GYJsfOkuqPH4Jx5P4I4fhc4M+XTEQgJe8uhjcwa/GpCJn5YONF9Y02y05CnE2Mdrk2JiuHCak+BxYiuSFF3qq43ywiHVrtLXq12/zPdc2BAn+s+UKIEMzWTD32ebl9uWz+F4vAQhVHhamI/lnsm+fPPaVwxaRyiq6bgejyBHDrYZq8dh9nPA1LsMIPY9JfRYnoeND6dzmcTzBe5zztYr/+TK+Sq6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=606p9tA029FZYyVveHCd0LFlexJPYLR1FlTOFRup4VE=;
 b=VtI3Mp05xhnsDzNHiQWi17iGct3baYkQQqhOCRSsKC+uzeTY/zZ2viQu8vLN4PfkzzlpRG6okURGmDLNj82l3/Qazi7zdfF6UTYdzpKELpuGRvmuXsRWcniUxgWgn6Jy41dTJWvHo72vl7LV/5p+W84/cabVG3o6s2d4ayrAccVmSs7j/d5eMIrUNNJ+31rvtmhqIzPSPXtG1jF4iuGC4bER8LD/ECnECV4I84MWlBWw3USGqacUgKOKPxfVto2fLTxSV0Xbv6Az7CPeM3F8HaJEsUhPOk0PNhgVIXQKt9el+ilBh54NGHprkeirtLrLwWuXamrC6nGf7SCun3R/1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DBBPR08MB6268.eurprd08.prod.outlook.com (2603:10a6:10:202::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 11:16:35 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Fri, 15 Aug 2025
 11:16:35 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v2 08/13] spi: airoha: allow reading/writing of oob area
Date: Fri, 15 Aug 2025 14:16:14 +0300
Message-ID: <20250815111619.45001-9-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815111619.45001-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250815111619.45001-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::33)
 To GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DBBPR08MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b2fa45-1d0a-43cc-26f3-08dddbed3230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x/atC5Q0FL6HL7K9dUhq8z2kYsCbbMk8RkjcnY+ccPBeyXMPIuNPwAeOPk/9?=
 =?us-ascii?Q?ep3bLVm6jIkF85afkc+EVnrKHMofkg7p8U8y+cd8xe8S6iPomsKpXweRc8cP?=
 =?us-ascii?Q?3tQfyOzAwmqf6SUDLbsEgwJBlR8sRxRyZdXXahSC9JtmmVZF3dr3Qm4flkyY?=
 =?us-ascii?Q?3GGbBEPRdmc0dwZFAKqqn/RXgG3uRnXXCVV9FQrQysQWE4uuCz5+r8P57bVv?=
 =?us-ascii?Q?gFKKQWBiFntw3LoCe9dRQxcKnSw2A5aeqabP/H5D9ENR/kbsP6mjQbcBfbEP?=
 =?us-ascii?Q?Pp5b2q9teVhjEZ4yT/kU0dsf8YmYR9AzJIzfVVD3MdhfvDk8mhGWOPidHhl9?=
 =?us-ascii?Q?dagLajooQNSEiBeHvsfW5iNYGcxBnZw4HKOwwu3PDYanu7qDZD24cBUK3F8s?=
 =?us-ascii?Q?omFrRt8LDS5gk/l6dCzAPBHHpmFvoxlYBCaIen68SssGTpXP8wb6S7nxxrlp?=
 =?us-ascii?Q?k0fPdye1s6AW9d4qrd7sj0E6c2dvTPNsK/4VMnGfYdelJXXxsbiDMtC7CSqZ?=
 =?us-ascii?Q?IYBglZyhRBIHtr9BZOnuqPVLmnfjFGuXPJFBalZWn/TUGm6ove6NNtkBY0cb?=
 =?us-ascii?Q?0iLQzQhS3f7eFvtUYtKbvUX6fRC1OnK/Slbs3cA4cUMXvea25C/BPuJg4XSl?=
 =?us-ascii?Q?5tnuASgqyzvk5ALP3cGOGTVCyZhkL5rgHX/b5c8eodz6ehSCF8C+YJTGmTRO?=
 =?us-ascii?Q?U7bCWcUH8NohSQYerYa6R3JOKyQWq4Aboc5T8SuuhtovVcAwrQQhctzq3Gnl?=
 =?us-ascii?Q?/8tTtSaNWJ46Ua4wSi2Dt2oegAp5vBH8XHohWWIH9Gy3hng9ZtJnZK5QOveS?=
 =?us-ascii?Q?oA6uWT1bWoQVYDi/wH8J/d2Og7UpsbjQMwnJoa1rwVj15FhJUgPv0r4QX+id?=
 =?us-ascii?Q?OF03toJj2bO4YIg7GVE5/jNcoH05ltVILF8XSTwJv+AfvTH4Vxmm85Ovm1bi?=
 =?us-ascii?Q?SsIIysYK40vXNIUrCMMlkyvsb9jE10ijlt5q/KfP3j5K7rdwT3JLWZwNnayG?=
 =?us-ascii?Q?TCJgMwVyxlqTJx8iDfRTc8Y1xwll1H0ZXL38YAzLE6W3HofFtv5irPT1a9im?=
 =?us-ascii?Q?04Pp+EtAEuMbN9jePP6A9Na2C9q0mvISwg47dX4PuiGKmktGuyy14kXB4zjH?=
 =?us-ascii?Q?a9LevdBO6ywkefNrFYLjJIBH9VlrjdMJErGccnp0p9ECdgvOhFT2M7ZJbZZX?=
 =?us-ascii?Q?uCoIXTa97Zmv60nmQiRiojvDp3asm1jGLcS6L3YHWhteBEaU5BRJAv6x4ajR?=
 =?us-ascii?Q?kjOin2kjlB7nJjz/vMeRtd3meo7GQExIZNoK8JGJmZcPxn0zEMZbeT4fRFvl?=
 =?us-ascii?Q?4iwtJZ4O1oibkuEp17G90yHlDm0oZaRZire3z+MjV2SH6qCTmrXjqYZ1gAiL?=
 =?us-ascii?Q?phEQRVmRXUebXn00OPwF2E6ldPViftysyCwDXBOpD+pgYi1X/WG4aPeu8bII?=
 =?us-ascii?Q?eDXH87+B6O0cE0gz1FGQ21dCIpyHWejcjBdZPYCPGcNVSBH75BjpYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FpnEjYXsH6aY3wC90Pi3xLvrFTJs7GK+lhTFg7jaUzI3071uMAFFWPg2D2WS?=
 =?us-ascii?Q?tNVITtXbWYh8ddMPwrP/tQlfrVbLFDGLOBcefcdOr/blEo1O4sIdst44A8Q3?=
 =?us-ascii?Q?o2sThEiyCtHLeLULfuD1Xw0NLWZuHSvcYYWYIoHfYJAW3g01ETcBCLndsc60?=
 =?us-ascii?Q?8cGwkSO4di3KaqW1S1RFpP/Lv0mTRfXedQMl0g++s8/WwSa7fjKa9YqS3u4f?=
 =?us-ascii?Q?uCVsrohFYPLZClq11GVHj5G2SBvFwqWzLX8vupcImH25LV7/LLQYuX50U72x?=
 =?us-ascii?Q?P8LAOsivtEEBBsYOWTd2ha9IuXtj65bbY6vkgKNNZ8ru7r+K48+VTOZ8kTE7?=
 =?us-ascii?Q?GCx188xiTEIbcDNZeZWJyQ/TXl/LoszJjnpoelJXnzMWP5e//6MN0OH3mluM?=
 =?us-ascii?Q?kMMvzVkEMCI+c9Z2yp6HwKpkTupZwUzcJ2Zn7iGxheA8bQVvwUx0rYoKI6wi?=
 =?us-ascii?Q?vhws35niaaAIQWttezioVnphN8cSQx2hmFjdPD9EEYMh0AI/9BkQXMIwXB01?=
 =?us-ascii?Q?97GiIw/Ku7QLJg3PaVxYCk4qEl4JgS4jpFFuunQPsvhRervv828yeOEejcHL?=
 =?us-ascii?Q?ZEjn6FvFoj6/5ansuBMhUnBX28S+grb/dQQ3BevvG23C8wqKfeZdkS9Tp1sR?=
 =?us-ascii?Q?Sp7zY8QiU+wKAhjGLEF5If+9RlrkecKX4l7FWPMp1Bofu6WkES46MjhkMFIS?=
 =?us-ascii?Q?cYRs2w240bGBMXUbsrlE6u1Ep6mUC+vn725L43+dtaCOfAp2tkxchA6H9aoi?=
 =?us-ascii?Q?aH90Swx7jSNtnugmlUWV8PE1WZMpAEnXOhtICP6qGSNoLkyyMPPDBhuFLRw3?=
 =?us-ascii?Q?hkAZH/HWr/F6CgsE+puZTiL1P6oqfXSm3CuHqMxvqlELGlOt4ZvK2he38SC6?=
 =?us-ascii?Q?XQluIzfNdwEny8vaK+zXSWO8huoB3DOimTc8IZtvh/GbnMA/tlTezf12CWUh?=
 =?us-ascii?Q?taG4l1q0ab2qc6Jur6AWJYTh8s5KLwCtm+EOH9hKyNihY9WrV1vHAaOrn9aW?=
 =?us-ascii?Q?927NscLEquhiClC4QyUmOdVsQinMqYNCdgefUtQ4aBifB8RR7VKb1TjXp/7R?=
 =?us-ascii?Q?HmJ8BpdKNQ7yC1K8EHQUN9mGF61ZWME4j7thL1oAow3NXr5BCWJEWwqHH12c?=
 =?us-ascii?Q?p5MLFrqbVYyjM0CyRDPg4pZepLOkKHUr4czuzEF6JftyD2s0FGE70tv5mWIO?=
 =?us-ascii?Q?1GrbhgTVkj3fMLMBnpvrpTM9zpwP6RWiuSvtQKsvDxkISmzvDb+VdyMd9735?=
 =?us-ascii?Q?6RKd+AWJeqakycBu3PQ7BxXbBgXTF01tFQ5YD2qiDTKBSCdUSBcW1fTtYriO?=
 =?us-ascii?Q?JjhVsQawshlK/ESecQzXfc2hPCA0eay1KBhTLgXaRXWg/nlvOF6c5S3qcvOF?=
 =?us-ascii?Q?nWwIb2zPgybW3jhvgiQvVxrYy+7oqiC5sXHqo6Ag/bI3cclQAaN/Pnik8c44?=
 =?us-ascii?Q?KhLbo3E829L/YqEbWBVPhqwKf0coWprwvqW7Wyj19EBT8+rvdMKk6kVzo3Ay?=
 =?us-ascii?Q?jFmTMHI5Vfkv/vMXAynZFXksEK3qjj3bVnGH9kkcDKgHnfzxIHj+uyoRhPT7?=
 =?us-ascii?Q?aioY2Zj4+F/sj4SU7XCjJqIvtl8E5parswg3Bji6sKnFmD8J6QEHWHvhluxJ?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b2fa45-1d0a-43cc-26f3-08dddbed3230
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 11:16:35.3978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTprB7O8FZfdmR5FWhoSv2qW4PF0Rz4LZc4SSK4DQ9pyBzM5KFvucqARMcAm0EFSCqFu8yohPMSPHAE1w0HfNy4JawrfvZ2tJf4tfYAv5Og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_041645_166023_2A29730A 
X-CRM114-Status: GOOD (  11.28  )
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

Current code does not support reading/writing of oob area. Thus raw
reading/writing and bad block support is broken.

This patch fix custom sector size, so oob area will be included to
reading/writing operations.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index c18ab53149b8..6b1422ab4240 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -568,7 +568,9 @@ static int airoha_snand_nfi_config(struct airoha_snand_ctrl *as_ctrl)
 		return err;
 
 	/* set cust sec size */
-	val = FIELD_PREP(SPI_NFI_CUS_SEC_SIZE, as_ctrl->nfi_cfg.sec_size);
+	val = FIELD_PREP(SPI_NFI_CUS_SEC_SIZE,
+			 as_ctrl->nfi_cfg.sec_size +
+			 as_ctrl->nfi_cfg.spare_size);
 	return regmap_update_bits(as_ctrl->regmap_nfi,
 				  REG_SPI_NFI_SECCUS_SIZE,
 				  SPI_NFI_CUS_SEC_SIZE, val);
@@ -716,8 +718,9 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	/* set cust sec size */
-	val = as_ctrl->nfi_cfg.sec_size * as_ctrl->nfi_cfg.sec_num;
+	/* number of bytes to read via dma (whole flash page + oob) */
+	val = (as_ctrl->nfi_cfg.sec_size + as_ctrl->nfi_cfg.spare_size) *
+	      as_ctrl->nfi_cfg.sec_num;
 	val = FIELD_PREP(SPI_NFI_READ_DATA_BYTE_NUM, val);
 	err = regmap_update_bits(as_ctrl->regmap_nfi,
 				 REG_SPI_NFI_SNF_MISC_CTL2,
@@ -863,8 +866,10 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	val = FIELD_PREP(SPI_NFI_PROG_LOAD_BYTE_NUM,
-			 as_ctrl->nfi_cfg.sec_size * as_ctrl->nfi_cfg.sec_num);
+	/* number of bytes to write via dma (whole flash page + oob) */
+	val = (as_ctrl->nfi_cfg.sec_size + as_ctrl->nfi_cfg.spare_size) *
+	      as_ctrl->nfi_cfg.sec_num;
+	val = FIELD_PREP(SPI_NFI_PROG_LOAD_BYTE_NUM, val);
 	err = regmap_update_bits(as_ctrl->regmap_nfi,
 				 REG_SPI_NFI_SNF_MISC_CTL2,
 				 SPI_NFI_PROG_LOAD_BYTE_NUM, val);
-- 
2.50.1


