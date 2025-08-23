Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227CDCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KT2ZH+5DH1kPuMbYkQACgQsDAN8AdeUjA20Yot3lQRM=; b=EE6wIU4W7k6dnMiBsVhN9B6P0w
	226aJOGkWiF7UcR8Zq3tO14d2Td7P8Zdp4vNDIF8m46XVGQ/+24lBzVrrOYSJeWNrPWuZFWZFLqpu
	Y5MPYH6jatwjs5MgkwPxgx3JNy2aHuqKE63Bk5Q5q9qQ8IWaVf6d9M6XEnyuZjfXF3pzatbpItgtg
	z13icn/KpdGLdTWo2e7Oojm/IDixO+qhvX2j6oStS85VS4uI9KR3Edz+al2snVIfXKrd4IEHflX5i
	ftCS9aW3I8FfIlyvNI56NfUX4gyw7LzbGl1z/TDm5QuhNC8SW3ZOifpen0YgE8Sz9JGyU7T45u8tT
	6405Ygxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkgS-00000004WWy-2SEd;
	Sat, 23 Aug 2025 09:37:12 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upbw6-00000003h2a-0dJX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 00:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7GF610O38LcojSwrKcfmCfatHxMxkOH0ik3md8E2srkXbWzikNtaZvk4zfU6LgGQGRRnLHG1rwDTKMpLSoDulsOZ4lu9ccL6xRh0xwA/oG6h2Yb59NFts0/3dovZ13HsmUO6MvjIGNHtXVqLNUSn+zdZQ28kwJCfT8p5MppyTIqTwz27JL2UybC6GTfrAZJMsz61cIwjo1EXmobZpO23pWTjrhcxfSgLqr0XRDG9jDfO18ae/p/cK88hoelaiaZz447yYftqkAqLh9Kisjb2un5LNRa8LCKB/K/FvVjERVm1Oo43GYt657WBC2giisBjISQUxGZvaWQChsf34nv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KT2ZH+5DH1kPuMbYkQACgQsDAN8AdeUjA20Yot3lQRM=;
 b=rBiB652974uw24K2iZnPkWO8HrdyST0lbnXUWcC9Qh//dloPUWK7U5kn4w9lEeHqSz6hU13S39VomEQKya5DVWUOjIMtK6jQXjneL3zSLMOjmABilHhvKFHaurTlNrORZ11P3O0oN41OfczF9RXcJHBwdq9NOrITOhxhZ/5FGFvfmUZaaasRmlrsfRrzQo9kb3U2Lv6ZS1enHs6Bl4el2lOz8IE/cXzSUiFmuQ6kTGBLWRZplRm0zt56lF4rg3xc+MYLOLHw8jNSDtCptN1ujgPjAjMV9wk6MxjfS6X86sPl/SavFVUNMKUlopvqSPNney9enC9d7zzxGRIMGSADzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT2ZH+5DH1kPuMbYkQACgQsDAN8AdeUjA20Yot3lQRM=;
 b=X3ljw9AG87kmN1ErflnedZbwobrWuhkCWkPVBXAAP0TWVxno3w1HVMHr6sWuyoGbdO2ezejiLd4sfeRfoYuDaeskaDH/DQ8HzRLiigeqW3TyOFBHkEajUa5LLlciQbxgqmAKmCftMH/Kh41fmTdk106g1SdYhqxHOZg//8W4Dkml3xOSgPlIiPzPaq4gxKo6stcuWbNZ2bj8ZtY9Xgu8Q4m928LfyCPxChpEoKF+gTKKMIWqnyIKSAeS8Of26d7cDB1dEfhhXDUX2HIHYwoLG+qyktdPugCdQJqkKXX3XoF6ALZxtTe7gNnlNWjd6F8MUd9jsLYKFZWbD1M4BePiJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAXPR08MB6398.eurprd08.prod.outlook.com (2603:10a6:102:12d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Sat, 23 Aug
 2025 00:16:39 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9031.018; Sat, 23 Aug 2025
 00:16:39 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v4 06/13] spi: airoha: switch back to non-dma mode in the case of error
Date: Sat, 23 Aug 2025 03:16:18 +0300
Message-ID: <20250823001626.3641935-7-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 5bfd0230-5eb2-4559-a0e0-08dde1da5495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+pDZM//IuXkIWgFHYmeOZiTc6mZpMXCoDS8qM1l2p4ENLM7a50/YMrewygA9?=
 =?us-ascii?Q?MqkViIYQ1+cGNgaO/uAw5pXDNAIzCGGYdthg4sjXQCknxhCBbUIavALcdIJR?=
 =?us-ascii?Q?gJDMhVVJT73IL6GARQeuGrWN4ncrkMW3bHNuwA7jroqtw6xr8+BZLnirgqmT?=
 =?us-ascii?Q?pIWgCz9Pr1uXO0FDXa21UeT8coZAykiq37qzkW+d7kH+fhvloncQx3aKUftG?=
 =?us-ascii?Q?VblzwWgqQGzDCufQLxN6x1j48w43ts7B3K5LfOcqPR9npW1UiO7b9+MRxAvB?=
 =?us-ascii?Q?xiskcMFGXT7GWTYF2sGbzcHfjqrzvty9JXM2YkzxZBr+0o8kFHvYcwHYg7Iy?=
 =?us-ascii?Q?R51T3GVMJeMK4iT85feWvHP4aTxVkQOdGaJmvTECrM88gc0NGK26qZaF6ufD?=
 =?us-ascii?Q?7t+bUU1MMILYBptrU9qw6YDYn4rVoNeZ7MgQ2BRE4IF/z7YLS3NMQpdA6CIz?=
 =?us-ascii?Q?tX4JHGXEpgartoa7rVQ44hkwHqfmGsurk7HHWveDdA1O3EJzvCIQ07Z5+Lpk?=
 =?us-ascii?Q?H+goRqgdD49Dxyu2RLSjrxFrn6nltsRK3SxozhqbPU2ronHgUp9SPv6md+F5?=
 =?us-ascii?Q?BwINFZ4l/gkuwU4HwGjcQDRHTBUbWSSG094KLgzbqQy7rDQZYiP3wpnm3YXW?=
 =?us-ascii?Q?dxxFNoYxiKpIHdkwrkP28yuS02Ie92olkG0OSkT9wssC0bwo6SjSl1DfMl4c?=
 =?us-ascii?Q?ASAOgApNrgwMwE8IfLZszcU1UCJ7v9NVshGntZHIWj8Q5vdQiWn6/1sHinvb?=
 =?us-ascii?Q?GfntfZrCMwdLmlMSS/foplWsnAgTaeUYl6Fh2gInd59/oN/yUHVSMG/mj9bA?=
 =?us-ascii?Q?3v9VXKZEaNZpkDt3y+W4sMvuF5fZ4+pT8sB1o6dcu8YxScHy/n9seBjiXtpZ?=
 =?us-ascii?Q?omSfzoN+yFS6qxBBeaQHCRe1TZunvf5O4S8twSHC0itCXjanQF6/ebrM50YL?=
 =?us-ascii?Q?bVtBpFHhKODW7S7nPS1mH9WNhkECY/r1QJVl5KAkA4tpz0m+3/DNrRe9tVMo?=
 =?us-ascii?Q?Z32gECt0uzLOPfEcLOpyouze32FLvqb6+ueDyIpD9nE4MEHsinPUBavdNao/?=
 =?us-ascii?Q?05MDINvGYteNBwqQmLrdP/aYCy5/JAXopkOE1r0sosOa4cCAdzv0wRUD6yd8?=
 =?us-ascii?Q?HKoj7/e5ySPA386m/f3AVvxjKvqfBOMvnTYj+mpEztWuJrTnWg1Td3CHXD5p?=
 =?us-ascii?Q?0Ir63U6o3dQGHNfsQLxOBJ7CabOuvtw+ev6hIXC9MzgRnU+Am7ipL9IODtSe?=
 =?us-ascii?Q?ot8yCLQ+paqVXuyL/Go2/87bLFXUFJV4jgLxnFCLJIel7uXdhm2XfABHl3hX?=
 =?us-ascii?Q?9ri0pL1pv2uxH6F1nhumeeiLHIeMiJvah64faEE4c+TX2x5LUCpFdv13wiHE?=
 =?us-ascii?Q?pMrzdKjgeJ3yipPtMIW0Xw5i+6Qce04BpOLFaACu68dxQp9fbTX2gug81kwm?=
 =?us-ascii?Q?Ju1rYv1k53mazr0gKh7/oiH8qbJpL5JmQNua11Et2ocf0XH/RM4LHQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vdrqx04husklfSVwcKmX4V3hTaBqBD+NHRqeUwuwnKVfC/yllSs47NwTg0dB?=
 =?us-ascii?Q?nuEJYlc9QdbNzzEROfxWUS8vpyq4KKkeJG/BEoXSkLimH+gj+nhTbzHaPuN9?=
 =?us-ascii?Q?yZQ4wlt+GF8ThCIFCkMKuKYmyp7z0abK2nNY0BhJwOtRh5A4U6se78iOStbt?=
 =?us-ascii?Q?amD40VEfiwqL6IK2TPh3tNg5fHueJ8v5CHjYgZSKVeBjCrFdsjIRIBRx8GHH?=
 =?us-ascii?Q?1PGgu5YDvr8qnv4+RX5M+zFaNNQ/pjntFfDwkZi83V4AGNDWtm741uqA6B5r?=
 =?us-ascii?Q?FGwpdHGJSDW8GkGEAIaEOP8UQSuPUjxjrzQLKwObu+/LDI/5qQqY0jOCsejm?=
 =?us-ascii?Q?cEY5eeJsMckdfEYkxORrYyT+MTVjR4jCz6V+3w5l9obsr7V7KB1IlCGFeCKS?=
 =?us-ascii?Q?alOsAsuH2thlRYSmHHBRtWp2YWKxuyocI5PWXJtqd06sSCfuneC1W3VZETqt?=
 =?us-ascii?Q?90XYl5Oh+wbt4Llj6TZF5nE9XI2XmA312vFozmPFTT/oeAf7aoz1TcAqwtfw?=
 =?us-ascii?Q?ZPYZheG2srHofPjMMMdJ8G1Q1p8M3Kv7X/rrPTq9XIICRGWSnOImbRcUYpYo?=
 =?us-ascii?Q?OhEKM9AcduMLHfAAceoUr9rQQ/afJi7IXr8yMqMN3X7VTIkX6c4uio6cZkTy?=
 =?us-ascii?Q?7HcP5/SK9CdhGzV2l/Rqxde8Z5hFr1WI6UG62kt9ikZsmpBsW7KVvWd3BsS9?=
 =?us-ascii?Q?QpTJTuJd35Y9y/vFJiTNKNfCMiXKDve7njWj/JIhZhO1cTuDToaeo5N+hKe0?=
 =?us-ascii?Q?/LYJ1Ec79aSfEz+fHpX8xCo623AxF1TNTFoyA1TUUA6W7x9tBpoQsVfLRFBn?=
 =?us-ascii?Q?2E09Aftl1i0FtX6NthBqhtuYiJiYlXCZjlCdbznogqVnn45zeb1PZQm5idPf?=
 =?us-ascii?Q?vd2OlHg5fIe3SMydJ18VHDTsR6a0xesIauc8zxk5KaG+Zf7wmKjt6irwhTCy?=
 =?us-ascii?Q?SA0e1CWPeCm07ixy4OvfKcVJhO6ktJl5HRfIxjhVdnp8lQfnunZmZr8tgGAJ?=
 =?us-ascii?Q?lRLIizoGB2lFk9ueXpp7xiEfI2qBwG+WiSDUGtPzdO5EBfy2PSb7+UQ5qWrK?=
 =?us-ascii?Q?925OItQEImX8BhkBNJLQPpJM4sreROHGHfI4mnymp1NaALlMH2Fmsbh2IkP7?=
 =?us-ascii?Q?UBu+Rq/rj8MWfBztUR36O0duGkWE1JNgH8PaoujEt1aYpKvnxz5MPGr1PMIU?=
 =?us-ascii?Q?lFbGNAxl6/eHqaYzdsqES49IOj/KpqHqtvyr6QX1ug+k62KrHYE0fw7356JF?=
 =?us-ascii?Q?05bhwIJs0r38CEbcTnXXcTiuMG6XOpZHcMiv5kZgG8/bMc+NpoccOfrKhSMb?=
 =?us-ascii?Q?uRzOkCWIg/Tm22UG6Dvl66mVgwS8/SyVXgG4DY/k6lnnomAxIzz+d7Q0dhv9?=
 =?us-ascii?Q?3fxJN7HJZbiSKq25AWHL1idSObE+yqwatRUz3MEyOYg8HrLs++gT5xBI1q4V?=
 =?us-ascii?Q?e3awCN7OtTiR5u/UU4t5r1cK7/utCWxd3kc1WoRNHgggt+bHs1/MGqW5UGwG?=
 =?us-ascii?Q?5CD9vSxFel3tAMSuW58oA30yAVpLM+HBTlOA+xUBtW6gGrMBVQZgJWwEammu?=
 =?us-ascii?Q?ugioai+FpEruxzqfeDxyQbK1Pz4Y+N5w8lH7WWWtNXJxZB5snIaWDoGqbhIl?=
 =?us-ascii?Q?VNXeFoNkyH+j7t4fJMKRwQY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfd0230-5eb2-4559-a0e0-08dde1da5495
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2025 00:16:39.6227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoxvkEGp1Dids/q7sF/Hp3cB80nFO7o4H+zuJDAah2nzwdJPLQJHvtYMvZYqFZ1ec7wOouxxsdSyrbuBJrv0r1qcs4BlhluD1JVaVeOfBoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_171646_192988_043C3911 
X-CRM114-Status: UNSURE (   9.27  )
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
index ce4026611e26..3431a9c84679 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -692,13 +692,13 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 
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
@@ -798,6 +798,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_FROM_DEVICE);
+error_dma_mode_off:
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
@@ -836,13 +838,13 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 
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
 
 	/* set dma addr */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_STRADDR,
@@ -939,6 +941,8 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_TO_DEVICE);
+error_dma_mode_off:
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
-- 
2.50.1


