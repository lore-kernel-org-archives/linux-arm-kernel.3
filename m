Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AB9EB4912
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t7OK1MTD8GPC4Un3XC11aYaSxxhliDI4UapgzBvNxaY=; b=ZgFJ+cQWsMY5lGtp/gFatxdb9l
	wEmBUbZPYJK2D4w59Q9zQ+IWCGQ1AkE/zNf2Ex4uOCwXUnvsCvoAK4vlwB6qaJvCPsrU8q9Mm0kEM
	X+i4VCw+0082srJ8q3f6V15trSfXaM5fNEJZTtrPVtbLwgctg7cBCd1qeqfB4oVoxSspp1A5MrKom
	DXaxqW3qInYVWqk3YARsEQXOdul6rtMRs7Wo8fSJuMe8CmMZGBWNjfnkNr9FshBDXc8/ti9lP0IUg
	JjRmKqB+9l4HGia1D1HOrnxC6nU1Q23ZUoIuwxqeT+wqDPuj6McZ0UaWvulL6suj/Uo7Km6kOcJCs
	OjnNFVqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVCL-0000000225j-2PER;
	Thu, 12 Feb 2026 11:49:29 +0000
Received: from mail-westeuropeazon11010041.outbound.protection.outlook.com ([52.101.69.41] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVCH-0000000224e-3zkO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:49:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PeRZCrMuCc/Lrz+qlx/nfyLEWzH/iiLwoM3DcuB1k+0DOxC+iYCpcSleSUM089RCC+fmFqoOOHYnzIOB7GCCyYDXQEbQ4XrFZYEZoQFudaQ+i3RWw5aAfXMExTl0MTQF6mABx/1IGu7o58yrJL0IebrZX9uhEZxVOEACX4nDadkhPMtSu0sJ+fGOr9gT/4f7F03MResKouj1Ptad8K+cysszadwMCsZwWjQjRUO2qfXIeYVB7errkLW8ebopw6JkFPedp14gwMXXzuS0/QLfDaBy0xKmXz1HzjFDIX3Hm879W4ZoOjj0u6SWzDIdxTjFuSGf8DyNiM4y/gts0z0w6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7OK1MTD8GPC4Un3XC11aYaSxxhliDI4UapgzBvNxaY=;
 b=Or8sCa+coqLa1s2OjOl81jHC6aOb8gaPq937XOI0YPpmggOgaIKGSvOT90SWZpqekCqoTwT1YKypM++s+TDNJEdadIFXep2Qo3qNjTBd7bKXVxBPZOE1Gvj+Z7mKC9IbhxmbJpefGLhKogy2sP/MHtwCzqKs+azBGIE+/MnVyyL+i+ZL+KdL/o2RVaT3JQmNNAqvFS5qL68Rt5KZ8eRsZm8jnSXtb6VoQ5Wpr4YDf0M6y6FPFTfJCNHpOMpJSi8olFHsHvE4rfhs023qq9gyfO+e5RHXV5Pto81o/Nd7WhzAP1o4X+5tgzrcbJSybx2t6rIefXub6pl6ZetDzGSUiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7OK1MTD8GPC4Un3XC11aYaSxxhliDI4UapgzBvNxaY=;
 b=HE17Qd8Fx2Y84BHXLhtkDOW/7sBkd3UQPX73aRSg/vxHrkB5yx6i5B40UoULSOZGEeDU96taIqP0OB+1QIURhI8nNkrGqD2h6xelDOaLpDfyhS+WtYOgUqK6lsB2p0xu93M+1A0gJuTjiRWwp9MK8zFQVIMVVNC7COT5CXI5wtpI9GzwrlN7q3TQLkJ0f4p7TPvsoQGhyrLO/8LojDXOi5Ekfr/FoF4llbq4ueKHQ6+COB1QBPiCjkxcLlspOyfzxAGOZ/MZuirVHnGCme70Mj/hfFe+hPcYrWnbuyTGg8NBwwhQDMhFwWkDlEqhsN729PLQHdL0PbOYftJgY8FVsw==
Received: from CWLP265CA0504.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::23)
 by PR3PR10MB3881.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 11:49:18 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::bd) by CWLP265CA0504.outlook.office365.com
 (2603:10a6:400:18b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 11:49:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 11:49:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 12:51:08 +0100
Received: from localhost (10.252.1.111) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 12:49:16 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 12 Feb 2026 12:49:10 +0100
Subject: [PATCH] spi: stm32: fix rx DMA request error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-spi-stm32-fix-dma-rx-release-v1-1-53a37c31626b@foss.st.com>
X-B4-Tracking: v=1; b=H4sIADW+jWkC/x3MSwqEMBBF0a1IjS0wsWnErYiDxDy7C/xRJSKIe
 zc4PHC5FxlUYNQWFykOMVmXDFcWNPzD8gNLyiZf+W/lnWPbhG2fa8+jnJzmwHqyYkIw8CfGOCY
 MaEKivNgUuXr3XX/fDz+uR0VuAAAA
X-Change-ID: 20260211-spi-stm32-fix-dma-rx-release-4bbbfdece8ad
To: Mark Brown <broonie@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Alain Volmat
	<alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.1.111]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000003F:EE_|PR3PR10MB3881:EE_
X-MS-Office365-Filtering-Correlation-Id: 2776bad2-0741-4faa-5948-08de6a2cc077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amlDQWl2UnZkekN3c0Z2aEI5Y3BFc2U3b0VPT3hOcWZMK0wvQVVoU2dmQUZ2?=
 =?utf-8?B?QXV3VkRnZjloL083VWJobTF4eFFBc05xUjFzR1pxY0RVSWJTU1A4OGxhb2pZ?=
 =?utf-8?B?WkJGajJVMzEyR01XLzMrbW85amZIaUlTcktwN1ZQRFFaYkJmdStSdkM2dGZr?=
 =?utf-8?B?UERrSVpWZWhzMkdPV1QrdURxUERrVW1XY2UycmtkWFpEVGFhQk1NU1dVSC9T?=
 =?utf-8?B?WlR5Y28zWnZGY0VGM3BSZkc4MW03TXU2Sm94RXdjMnZPUGg1VnNBUWt1dGNt?=
 =?utf-8?B?ZHI2RHpyV294Y1NjcjZ4OTBxTWVrTllGNEhUMmtwTWZ4NDBpa2czNnYrWWZC?=
 =?utf-8?B?YmNlcmdXN1N2cEpjQml6WnFYMTA5Q3pYVUVGT0RZK2w3VStCVDExR1hWenNK?=
 =?utf-8?B?OFV6QTUxa1RtVzZLS2ZRUjNPaVdDTVpmQkhsUEs5Q096ZFNpUFRtQlN6emhp?=
 =?utf-8?B?OHA5ZVRqUjFGQ2l5MkkyUGY2Z2xlbzVLUmZ2Y1lrNlFMWCtPZWljSUo0WUor?=
 =?utf-8?B?NnpDRjhveXBCblIwU0Zxb1dIK2FWTVROMTFsYnNJRmJWRnYwcmRPMFNUaUNt?=
 =?utf-8?B?Zi9sSXpvdmIvVHdjKzhOWDdJb3l1NlVxZzFNUXUxVmJSTDdaRUd2NGVwMjBs?=
 =?utf-8?B?Z3Q5ek1RQW4vNy9lL0M5aDQ3U0tHTDR3NXRCRnp1UllxYk9mSXRHK09KR1JE?=
 =?utf-8?B?NzFBT00rRzJQVFJobUdvbE5DOVQ0TEhCMmVpRDg2WkxiMCtRM25yZU9RMTh4?=
 =?utf-8?B?QTBhMlhBMmt4cnpzdWcxOEQvR0VlTjRDVjhxTkpyaldaZlZmWGt2NDV5bUp5?=
 =?utf-8?B?R094OFZkcnZnYW9XeDI0ZXBsUUV3MmtiaFJrQTJ1V1ZodlJiRDdNWjFGekwz?=
 =?utf-8?B?akNDc1BkY0c5RFAwSno0U29OTmNvVkRIZlZGZWdEK2hzSmlLWHZ0blFNQjR3?=
 =?utf-8?B?eHJ2bVVxMHRlM0w0M2gvbmJQbTZXZVB3dzc1RjlnTkljQ3ZvVWJoc01TMXZj?=
 =?utf-8?B?K1czekMvWWhXaFpGWEtKWDU4ZWx3WTZSMzRJYWR1d0t4UTh6TXkwMDh5NnV3?=
 =?utf-8?B?QWRhQStPNm9pTC84YjZaaHVHTlB2ZWZ6bmdkZWlyUlJyNUovZ24waVpHNUR0?=
 =?utf-8?B?SjM0dEVMb1FKQjFGU1pCYkhGRG9Sb05ncVhsUEp5OVlWMXozdHNOMmRuN2R0?=
 =?utf-8?B?ZXVQQXcyWUxJbEFBRUEzaFN5c3BTQzJOWjAwakRCMk8vZ1ZuMm9DckZYWW1T?=
 =?utf-8?B?S1Rmc3RJRTRBdzg1bkxJUHQwbVRENkpEUHBlZEVadHB1UFEyT2tXVTJibGhQ?=
 =?utf-8?B?RDcvL0Jza1dVSTBVb0Z3R3pLMm5ucndYS2QyT1FEajJGbEV0ZjNlcFI2ZUFz?=
 =?utf-8?B?VHlXd0NsMUJ5Y3hpTFJST2l1RlczdytnVFFUZUdIVGNrVUNlWitjeVNPcHJW?=
 =?utf-8?B?eklFNUpjei9icms3Mk5DR2t4MWh0NzNnNXdPM0d4QWNxTHAyMFV5QUV5OWQ0?=
 =?utf-8?B?T0o2anFxT0FoY1pPdmxXUGF6MTBsMk5laVdZWCtNZkdBMDdwb1V1eGJlcWFB?=
 =?utf-8?B?RTZqM3R2VzZRNzZQdlVsUFlZQ0pENklHdGxmRmZldExaOW5QakE1cFkveUUz?=
 =?utf-8?B?cFZSdHN6NG14K1lDYmc3ZHhOMnBPSGpndFRqNHU4ZDE2dHg2UklxcWJHQnAz?=
 =?utf-8?B?NWVWeEE1WTBtajVjR2IrTDV1bzRDUno5R3RBZVYvVWNxcHJFQnN5dmZ4NHE4?=
 =?utf-8?B?dFhiMVErZkRMaTJralh6bGlodVpmNWFvT21tYUVsUml6MmpRWTJkUE5aajU5?=
 =?utf-8?B?SVdrTExZa1hFZldONmRsNHZwRENmZ3JValcwYUh5SGF2VUVkREQra2ZOdWNa?=
 =?utf-8?B?anRhL0kyZnNIaTBxL0VkM0tLUUhBOXh3elBpV2ZPaHBLVjd5UitjU1lsOWZF?=
 =?utf-8?B?T3NDbFd5d09KK3lkNFB4SWIzWFFCT0tJRWNKYnZkUkgyV2ZIeVpKdURhbGlT?=
 =?utf-8?B?eGZ3NXlZa1ErUWY5WXpUeXY3UVcvRmFhNzJxdDcycnVCY3l3N2J2RTk3YUg1?=
 =?utf-8?B?RjcrT0oxV204SnNPVlpXNWRRL2dHREswZmJEL3dJL0s3Ukh0RUFOZjRhbis1?=
 =?utf-8?B?WEs0Mm9YbkhTWnAyOW16MnJjTG9zMXJ5bThiNGdLWDY2ajFJNWNobG1oVEQx?=
 =?utf-8?B?RnFreC83dGw1Vmo1K1dXUGNkWENXNmpXTk5XTmFUenU2clZZb3RjaXhIdkx3?=
 =?utf-8?Q?k5VQsENuWbdfpe9u3slhRC9zWH0aQfQEUBQaWPv228=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: K/JMtL9F1D7OO5QHb5qW3Gh6FDPlc86AjIO8Ew5YC52R/W/4IX6J2Qw5pWCNA83H0nQQ0bgzMdCyVJh4OSDYDx3BLt+NSihJUGQdUJcPJUqzFOsOV6PkxbjQh0bc1CjfoNMMNM8kzm8esoyGs+jx1/SZy1rJ5Ximfvudlj7/l0NIUiISzKKPd0Y3mTKiELFiSzqdT2A6ujggBTOr9aDj7Xf5r5WLRHWwvpzDzydi18GXgip5sKO+d6jNrjRt54owh77Dujvcbyjxu0msLvDdKYCTr708s5Y7RsyEvzlc1XQzN6MWHOh6bYeQ+EcSVibwMgKxlCqaHHO/yPl6B1CvT9fBCv1Qi9EFeaQPPhGSBUfxeIa6kwSrMnR/dBRyQ8tojITO3UTNhJrwIxR/Pwj7m6MndU/efnCITsT6MG28D9oLRAYKj15j429nvSgLmK4s
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 11:49:17.2542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2776bad2-0741-4faa-5948-08de6a2cc077
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3881
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_034926_221999_0B8CB1E3 
X-CRM114-Status: GOOD (  10.22  )
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

Avoid trying to release the RX DMA channel when an error occurs
during RX dma_request_chan() call. Instead, jump directly to
release the TX channel, if applicable.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-spi/aYXvY6NH7OlZ-OAF@stanley.mountain/T/#u
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/spi/spi-stm32.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index b99de8c4cc99..c9442326782c 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -2502,7 +2502,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 			spi->dma_rx = NULL;
 		} else {
 			dev_err_probe(&pdev->dev, ret, "failed to request rx dma channel\n");
-			goto err_dma_release;
+			goto err_dma_tx_release;
 		}
 	} else {
 		ctrl->dma_rx = spi->dma_rx;
@@ -2571,11 +2571,11 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	if (spi->sram_pool)
 		gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf,
 			      spi->sram_rx_buf_size);
-err_dma_release:
-	if (spi->dma_tx)
-		dma_release_channel(spi->dma_tx);
 	if (spi->dma_rx)
 		dma_release_channel(spi->dma_rx);
+err_dma_tx_release:
+	if (spi->dma_tx)
+		dma_release_channel(spi->dma_tx);
 err_clk_disable:
 	clk_disable_unprepare(spi->clk);
 

---
base-commit: f921571df917408594a9039ed450859f3bf9cc2e
change-id: 20260211-spi-stm32-fix-dma-rx-release-4bbbfdece8ad

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


