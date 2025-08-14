Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B23CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 00:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSJwXhmW4Edv/ucbQn9CdOGaTwbUIV8FifbrJt0pb04=; b=TprIWUtzeJNzaFc6bk05BL8+yW
	PZWHWLRbc6XemFf4cdVFUkaFyiDMKZjA+KDaLEwygPI8HvEKGy8plBSwEbB78jsfeH1eY392h8pbK
	UJJW/QwNs8ZnMwU3lQ39poNKUnSWG2on9/ZyUiaZAfBwHgJyMH8WcCDH3Z8XFYeo+6H0MHqgpmrOw
	+pxBP3JLSk2RMgI5oJfcT1q91Adk9LqbbgtmbM6bcg4apLW5rMi7qv2OwjgIKhS8XzvInJMBpXl7i
	d1lL/kz/9+fi2V5MzsAGZAXXOHfhL4nprWDb96IEIpwDMCPf2C3MHrWHzxS3aAiGI6SVOoch/eLGV
	L9hlB2LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiEq-00000000t4c-16Vl;
	Fri, 15 Aug 2025 00:24:08 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umh7Y-00000000lW6-1COa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 23:12:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQ+724gCSmxycEU0DSb/1epJaeOGoktFm3QEYB2hc3cnnyFwZnfcgqTBzPJXptlGKCYqeCxnY+wAWDMAxEeNLPMnhiUBxrYBVCUmJ+fpOXPJf/dmspXm6Kn1xAJRgqWJvGqLs0h6fQdu9zviueOGhddw45p4kH209nFY5NamDMpdj7YPBf+7suPAavjnUVizFYMcfm1ELIugmA4n0wmUWzw2XAVX7+X7hW2Fzkdtwfwhp1gaftAGbgYlDNfYamohHDzgaENzFCDoV7mUlSUEYgKsw5jwCAxJqoj1nCvnQVXiiyEIuQy7bEQ9RWn3aZujF4YNEN0DpyxtEuk4PwSK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSJwXhmW4Edv/ucbQn9CdOGaTwbUIV8FifbrJt0pb04=;
 b=SdmhkrKhKrD0aPopWy2rdT3pAiRv2OdTdxaiUrgBdVE++bKp8S7/s4ql9gBrKNWL2TGvg7BVxfymbTSOoz2QvczHRY4DFpcdhY9Hjrs0/sePQg5rfxoP7ggaXs5MDdLF+CdcOOdW5C81UAmCro8UiSa76Xv25X1/nldQ8TIKsDi4PhEui4L6cqmXIKfMxsZFRZx6r7zHi7Zw65wBUK16D6b6ASig1wR0HMJ2LMxsn4L5azj6Z2UQHkCWWOZ8gPHhati6U5llBUQeotUjwxE9/ION8mz3gtzaj3fMVqsbqvI3ZMx5QFrE+sKpPkyK1yD0neAWE6l/35D2YF9Vz88lwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSJwXhmW4Edv/ucbQn9CdOGaTwbUIV8FifbrJt0pb04=;
 b=TmoJwbRlsz3O1NNCEi22kvOWSVGg7Ap1gLAsrMB+ClOhmArZYr7je1TYA1aCgbc3TQiXQNI4+9onMbafBe98QJfTp83s+VawlaVCVh2m5kQJXEM3JV+LIbuCj476i1Qtg5VgeHfaAMl5V1ZsRplnDhZ8Cf5M3wFz6suxIEly01T2EoJk7ucNs3qfj6NYAMGHG0GyRrEGDubYoiS4GRDOSE7+G8cFLrGyhYyJM+WVjsmSdQveXa/ziFdX6t6d4B+vcFNAtbyRCjom9pW8wa28RW/TreRZCG2/OJOp26rfrPswrE6WTdzrD+OeFCX0QhPtja8cmCBAlD48hoRQEJWAJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 23:12:22 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Thu, 14 Aug 2025
 23:12:22 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 05/13] spi: airoha: switch back to non-dma mode in the case of error
Date: Fri, 15 Aug 2025 02:12:02 +0300
Message-ID: <20250814231210.4174427-6-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814231210.4174427-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250814231210.4174427-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::15) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PA4PR08MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: d9c67a02-e1d7-48f5-9276-08dddb880669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WIvkQRERrDnZNKWg3TTG3b7qn65r7flNUeexessdaYRbGcp/VLtuxTKtjq/j?=
 =?us-ascii?Q?7SniKzHbOpl8jvPClTBYm3DXguHDnVBWHdh20sBWl8Qs4OL5glEDaNArXvzd?=
 =?us-ascii?Q?Kqxel7M9hhGTYkoPcJJR21C/dGkYud/5P62bO47oJnWdXLLAAiATIrHWgIwk?=
 =?us-ascii?Q?PqsWLd/tYdNBKbBBzKtG59gXlbD99YwsipeVC3N+q62Hgfbxn8H9IVHk8Q0z?=
 =?us-ascii?Q?fHHM78rEEhZCozKi2/nS5pnwbCoKmqaqkkhkktdVsv/XV7HzUNgnYSiFcgD4?=
 =?us-ascii?Q?ZePMUbNAUBjks+CBQFeN8d3aV6TEP47xMxKBV6RliFemIsQaRF8HULxp+Nja?=
 =?us-ascii?Q?0a8oJO8S7ll0PkOrTE7dfpjzLWbp0LQkwQ1uR6629ahjrnFDJ5elNRnZMaUY?=
 =?us-ascii?Q?ExQaq2vfern+SNh9DUhHIHIMPFi1zkdTTl91j2jrJuH3G5BmJwwxHDb6YnPY?=
 =?us-ascii?Q?E/kC3DiiEov5zfP/BUmIkc6YQQHT/0JYpf6Z4Fy8wou72Vl1E7qRJYhp753p?=
 =?us-ascii?Q?fSxqvDW2zFOD+wkHPM7Cej6jsVlUIm4DmevNJi2Mp7bzlpeSy/taDnuzoR0K?=
 =?us-ascii?Q?U1q7L2olsuNqJXs0+x7NmqOtvwMcM6QCcClIPLPfFEr8JH59fB42gBu9ED6F?=
 =?us-ascii?Q?3D/IN3eUw/fweMxwqApBuzKcBKalFx8jcUv9RB1S84Bn4c1R4F6ze1sGZ74G?=
 =?us-ascii?Q?q8gKJpg5EiegZxMHxSKEQAkgFI9LxN7rP7UXJ+vGwWBgdg20XB0pwBL8jTEK?=
 =?us-ascii?Q?Nu7VQ/Tt8uidADzmlXGdexyBVYczYRQBHVKLdoLBNGLzHwk33p2pZHZpIzlH?=
 =?us-ascii?Q?sUE+Hpz/7JQIKRFjVI4KHtx8FJIMQwBUZO2DokrHFCb+8aVvAvzzFvyRlkPL?=
 =?us-ascii?Q?Kl0uK8SPysTz6wg7jE+1Fv77m+FmHvLLPztZhEcr+lFZujrVAKQ4GitJsD8Y?=
 =?us-ascii?Q?dC94kA0HlXwxaWF9kCIS8kcYHiLSFkHRpBsD8HHBwvYsyRgA+Q96qnVJttew?=
 =?us-ascii?Q?TzeDnMMkHTP2FkBRP9USjLhvzCsjfkNASnDTLXt24ycEYSGlYb54WUpZhdbH?=
 =?us-ascii?Q?m2F6X8qWBw/WUT9XvRLgTpvGI0DtM8Sl90s2QWUtP8gkQXq/W0O7zlNINc7W?=
 =?us-ascii?Q?KdBiSXeyoKgRr+PVl9jrBhy+2iA8S/UePJIbm3Os4qfz0iYeAZKXVBAHzzNH?=
 =?us-ascii?Q?elDD4f512D+yYVc++YHpD8o7aD4rHDZVIb6Xmd9oew9GhkgObRFOG0duj1/W?=
 =?us-ascii?Q?f7tdJkXtbhIOTxnA2GKtd9qaw8QQlSQ68craaUuxJbAs76qZOs0sJl90Bd7C?=
 =?us-ascii?Q?eWP4c8tce1ME/yGZHIx9xeGXsQK9C9ckbDPh0XWs+OsZyx8QDps1omejRSQg?=
 =?us-ascii?Q?0zPCLGiBVnDfSh8f7uRFHUrUzN/MQ29hDNB/h3r10Z4WmxxIGFvA1l/I59om?=
 =?us-ascii?Q?6P//zLBKXxix1OGo41gLnepasAUM9lT8YK1XKyRqHAMOQLbFEXi4sw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pBEmbRM4frcHrzN+rnM4o7avdh3eF5ezQoJNWo0lnmhRKPYhMH3sTurrspTT?=
 =?us-ascii?Q?mrqZ8uSMvBH45vITObdTVlBh8QDeN+qm0apyEF3f//vFDnINRBKCQW/m2kUA?=
 =?us-ascii?Q?M3pxCRKMYKLqDSHrZdA3UTyc6tluH+73NyqMQTjOqkpbW42c/Ml4yIa+UEYd?=
 =?us-ascii?Q?UA1L6heCDfRoj+avXG2PcCwcFBm3Bv+aQVTBvmcmGEWsFuxJ7Ae/SuELbdOD?=
 =?us-ascii?Q?h9zGlFbqIjDwjxZ4W19n5upL8X/Nm9fduX7+WZ5kCGCAGZkr4ktNWnsAGJJB?=
 =?us-ascii?Q?eeYH3VFEaJXTjCYVkBp5+BWyx0Qop/qkevshaOxIFlHkoQBHAu+9DYsdVt5F?=
 =?us-ascii?Q?M3vf24lf1eHj1bs1B8vFaRbSOVhvzM0YmA/p73Q4qFCL+rvBo5i30ip2HuKb?=
 =?us-ascii?Q?HEPZZBluulJl26pWg6mbdfqDPZMpzUkUZQxtatQplDA2/ZWuVlB8L2w2sViK?=
 =?us-ascii?Q?FMWrMWaFXjg1bmMUxzlMd2Kd1IhnEGWCBSfF77a2h3CQOmaVgdGeR3Aq+ulM?=
 =?us-ascii?Q?/xBo9zrpQYegt0JuTGyysUKocsa63wE48gQ6uEOEZ7I/GTwX1pxnpgwUDapK?=
 =?us-ascii?Q?4jXqDClaCKY/XdT2UeRaUJ+v2j9OWeyGuPQjnzz1Vqf8hi5Rswxac2phpl72?=
 =?us-ascii?Q?VOlyRIX85FXzOe+/r38FAI6hxAJnTdThqb0hTXXNGIGarazITEWTakRNTezS?=
 =?us-ascii?Q?nMAodd0PGZZRLLmZKwc5rkl5720mJMa63tURD0qqduU11v/2QxXcf+FDGOGB?=
 =?us-ascii?Q?imejAL3lqWrQhwCfO8fWRwxoYLrxAa4xDVDrRn+ki/MKbBersX1Xe79AvgGm?=
 =?us-ascii?Q?5pAIccpZDc2W7ajqDQjbjVWiPxib1sP1E6i48pGkc60tipQM9V3hwQ3NQq5W?=
 =?us-ascii?Q?bHKS3c1FdNOWpdrTSABjX3oChjluj1W1z34xnUMHYPcFykyNcxI8grVjiTX3?=
 =?us-ascii?Q?4EhkmRGtmxmXrqj/1feSRWrIPKQYMElsyuCtBr5HWsm6IXRSHMFkFCNgaYYk?=
 =?us-ascii?Q?PZ5K5UcGc+EBRlRPjUfbX0sJYf2pLmKIhKxyvxLdlcW7O6axEaldfVWGt7FI?=
 =?us-ascii?Q?K0mhbytlinAlp2s5q5wVqJ2TsCgWAettF2wmXGiPyh2apOLJGyEu+6291ZAN?=
 =?us-ascii?Q?0rEiMagmS38fjrrK+YEWiG3K04X8Q3MB+NytFNBGpdy/Wqybm3VL0noYdIXB?=
 =?us-ascii?Q?4+KUBznr/jc1g3nkGsmeHQVxnBlUUP3Aejn9Gwws7rzAHxQBdPAHQZzFVaj7?=
 =?us-ascii?Q?Ch0C0iCxJlRSK1yX+lXS1WXOdJ9ZICmgLVJpte51eD34wCKseEbi4Tw9sNCT?=
 =?us-ascii?Q?6k2mi8IW2IlQjqq3GPfRVjoUQ9jsgJSVob79hhYQT/848FQfIMyWOLk/mpz+?=
 =?us-ascii?Q?i9j6193CArUgUk3Pp1xJ4dLwiqbtOi/qA+xkN9XZ0Qsskj0L0ITEq9QVa8WS?=
 =?us-ascii?Q?1pYF0w+ECvmURZcliX+Dta8r248/1bjSki06WEOmvVhWGoVSO45f8OYBPqwR?=
 =?us-ascii?Q?K2GlvgvkMRYoE/NvRnFcOEyDy2qsymPkEzFU1rDqumR4gKUiai7pDgHudTXZ?=
 =?us-ascii?Q?UeTcTpKbm1l9YLSEVujX85v2Vrh3kyTXP+zeqOLAz01D2ozBjpM4axTTraEV?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c67a02-e1d7-48f5-9276-08dddb880669
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 23:12:22.7461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JigRrbbPHj6mR/kU0/hZ0gdEZ71EV7vLDD9xacE8PVRmjsUp8kmuf7dCDUSrTKOmM2Fuvbkm3FaDluOkKUaIkeSDkAmvHaMnGTAIv3YDMCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_161232_337608_45DB4F88 
X-CRM114-Status: UNSURE (   9.91  )
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

Current dirmap code does not switch back to non-dma mode in the case of
error. This is wrong.

This patch fixes dirmap read/write error path.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index eb39401b3fb3..8e217ef00dd2 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -684,13 +684,13 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 
 	err = airoha_snand_nfi_config(as_ctrl);
 	if (err)
-		return err;
+		goto error_dma_mode_off;
 
 	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
 				  DMA_FROM_DEVICE);
 	err = dma_mapping_error(as_ctrl->dev, dma_addr);
 	if (err)
-		return err;
+		goto error_dma_mode_off;
 
 	/* set dma addr */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_STRADDR,
@@ -790,6 +790,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_FROM_DEVICE);
+error_dma_mode_off:
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
@@ -828,13 +830,13 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 
 	err = airoha_snand_nfi_config(as_ctrl);
 	if (err)
-		return err;
+		goto error_dma_mode_off;
 
 	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
 				  DMA_TO_DEVICE);
 	err = dma_mapping_error(as_ctrl->dev, dma_addr);
 	if (err)
-		return err;
+		goto error_dma_mode_off;
 
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_STRADDR,
 			   dma_addr);
@@ -927,6 +929,8 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_TO_DEVICE);
+error_dma_mode_off:
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
-- 
2.50.1


