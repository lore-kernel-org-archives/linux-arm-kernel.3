Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C87CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXuFwSViEVUbL70Ik8nY20cOJpTQjyy2VCWQlHvoLoA=; b=amfNanW8d6AtSX/NTSQe9uEmMP
	RLUgAlGNulHQzrJU7c0HUWviJBJGeZjyzetTxoETpjdI6GmcZi5RmTv15D9JzLG9gqkXTNumeCXzA
	f4tAi5AFKHHqRX6IfELA5DYO5fT1bHOzIzzqWOw7IEciTYNPK6J8LCyn/v4a0e3ZsaRcqoOtzOvD+
	3Z1fSqvpwtb/L6ba5JDOFxurI+XcBGBnMbYEOoWmiuH+CBRePyE8IlVbJX9muNLTmBV/EFFApPUer
	HVBUcxYaf3vmP/qcpeO2AD1nXiuSBG6R3UVJSjHtQjyXq4N2e1oYrY9kOg0J4772JTvEKoGv0GT9u
	zjBhJUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umv4e-00000002fnq-0VFf;
	Fri, 15 Aug 2025 14:06:28 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsQU-00000002JHO-1Tf0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:16:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2mZ9+bK9LVzIIhJ9CQsvmDMIrkkF0fCtu0HwvOgqlB26HTAuHGdnx7IELR+Drwd8oje2Csb4yvfdDqwpvMnSik0jBwOt/5XPUg1bNwCs023E6mNShLL2qaU8K039v9OUikTPCmvYNpd8X35s4ZTiqlE180QobiW/3EgRZnA9HliYPx3nehS8v1UVeqE1eI8d5nYDNhk14phjC8KmauMPF1FbCuS/7WLFc1L9GkUuZZD6xvlAo7wD2ysO0UPOftvNg/fy6s71mZVVJECwo8JtqrZf1+v6gYShOmsmAp0UDJa9oOxeF+LJbmrnXmYORNPwYm0thQKJtZzflxS5bNi6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXuFwSViEVUbL70Ik8nY20cOJpTQjyy2VCWQlHvoLoA=;
 b=a35NkRhJa1CjWvjI7ue4GmhFcsOcLc2G90am5QYRrtLGRih8npOJsYs/17HIsk0egJkYVBdkeUy5YX2XmoHjTNpt12QCbDg71rjmIP5AlkmUFUHlQSYACH5VWNaPggddFSDuMMUOawl75x/KTwHDX21CtT47LFNoKTei48YDDA0AEFutePpm51IcV19pH/3s8gthB+TVBVZ15Wrc2v7dQiGYqMovBD6g2fdjMnZAsLICiK7BkcTANcGbLwtg3CEz88M1KiMACr7WcjoIJYqCflK1nLeG4PMqjjFb0YlcCKEi2g6/f5KOBgl3eLDPZxq7oks0gWJgM2rxbFCP3LmUFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXuFwSViEVUbL70Ik8nY20cOJpTQjyy2VCWQlHvoLoA=;
 b=KYspdhxSks9wf9nVTKhlFwhPOHrSXtDjrOfAWWkbQOf72dnrR/dC2D2rqP9yjBP0rECYxjMfSms88J3CPSHfWfHNY/AJyxuOuX3i/8R3t5QNBL0mDVE08VtqgP0Od9Qa/aF54rwm9/M2L79U9CrlvWP7CadM6QnErK84Mbz4YcR6aObokz59o7hQUC4FJenXz81c5B6GSki5HQ2viAkuyd2MgKBkvktKAFxp9w6dnV/o2qCQvv1dvHkeDZ3Q67ySg//lxTnAmfqDN3HmkE5+6fEBW/JptUNfk60TGXTdRKWINGKfsxEwUv6eHHqflx9E2NYfJa2Dq2KtdFT0PSpSfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DBBPR08MB6268.eurprd08.prod.outlook.com (2603:10a6:10:202::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 11:16:39 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Fri, 15 Aug 2025
 11:16:39 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v2 12/13] spi: airoha: set custom sector size equal to flash page size
Date: Fri, 15 Aug 2025 14:16:18 +0300
Message-ID: <20250815111619.45001-13-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 87767e2b-59d8-43f7-d3c6-08dddbed3458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VgcgL+HyPrZGszb2eZlDawJMA7r563ipV9+8itnfNf1BoxFtyelWDGEXQ1L4?=
 =?us-ascii?Q?j9Z9cuHPKoeD0J2o8Fw2XUypzbS52Vjo1Fk89YFnOu1pX7CRFrICHBDOZsTI?=
 =?us-ascii?Q?p3gN8jlAwl25EhE/9antWSwJ8uuJ95vfo4fmnFR/cbs5NWaxHL9Z8O2kUG+j?=
 =?us-ascii?Q?ifblSIpmSNTzE5EJG/i6vcESe2evSVNzP68688LHHuAkHahC9+uwzU68RSm/?=
 =?us-ascii?Q?bt1ZHtgIfLbQF/P+y0q+u+LQQDeCZXEXt3tSIZhmgDRVX+CfTunG6/w4ziKI?=
 =?us-ascii?Q?ut0IZ3YgHfueqC134hgn/GiHYDsVFVMQcBMVmLgHERzJXe+m1rV62lcd0nlM?=
 =?us-ascii?Q?3OiU7qFVpmAwZ/L2dqMQItgOd2b70q6ZbUo9tBo25wkcy1Cnn1Vk2psIAvOG?=
 =?us-ascii?Q?t2TFYRerPqnTVrpkwwtHn5PqqG8+KR5lh5sMvugWTkO9CbnOeU732OE27cqm?=
 =?us-ascii?Q?k8+NNwRIt4yDURZ2mhARUElCgOIsoE1CHu045d0e8Ez+fjLmsmUOLlDDdVbf?=
 =?us-ascii?Q?QW9uxZM8cVbA8I3nLgps0ReC1eLWUd68kVQQFJrn6aieqOOOSmOWhbaOKLCX?=
 =?us-ascii?Q?QulkgCFW/Cd6d7RBCP7gWmaY4msYcU8PwT8u5lHy61R9sgdQdUy3loiJHoVB?=
 =?us-ascii?Q?6Jparb+cBwJNWEP8mRT6HfH9LAp2vtmfe5k96JLh2kps7/KqHqc1gY4VlGiz?=
 =?us-ascii?Q?f0MGZt8lSMvEeI4ejtOD7vYbVkuxfgPmjCc6hLUC2ABfFJoVXKSNaEqH5Vzc?=
 =?us-ascii?Q?26pp01Rem0//ZiEoJUTHP2tnAnRBTloJjuLv4IR6vVWaM8HyHDAd7s9Q1TV4?=
 =?us-ascii?Q?wXUFbcqCPpbyoL6C+tMoAqJmgXFNrc0C6brnPjAQmQ46wKX69tCKNOwolCxD?=
 =?us-ascii?Q?wiLFia8dB/efpSnvZBjw09lEbLosST8JjVU5UFUe52zVtv7wXyNg+effScOp?=
 =?us-ascii?Q?INduieVPwfx6If6TDQa8nGwMcIdQM2tDRtpZdO1F8Vhy9GuvWgDWEcPyF2LH?=
 =?us-ascii?Q?UgoFlpHize8S8kiy3l18dWjnqiNAz3AReOq1liVfwhqZ8gdjsJZbOyp4Y9hv?=
 =?us-ascii?Q?d9tbcAp0zYyURNBcr+7w1eRPZViPEBkTuJpBxxaF/KH325ByrC2Ay2XMm41D?=
 =?us-ascii?Q?GRh4VdWw3yg7EwPvF0/I2y221t73M+T6eRmaV+E7vE1yOHpXz4+M40AY00m5?=
 =?us-ascii?Q?JcJV9I6af19wmo3flWsFMeXsG5OGvNXVUFYHuA+o5Sdd5coicHA94ypkzy7h?=
 =?us-ascii?Q?Lvp/L/EaLFQiHPBifb6yycVLHG2PuXGqd4fKCfWJloo95dyt9ES65MXSFeqT?=
 =?us-ascii?Q?eK8WFdi55fHzs7P/LpFwxResrw+meiR0aAyOQ4fXV21JLJahnYF/kbQmSiMZ?=
 =?us-ascii?Q?KWeYjajbOdHxYi71tSQNOKK30ibBfKK49BlxnmoAWTEG7UewG5G6Kg79PiIU?=
 =?us-ascii?Q?XCcx//pTQ7k5oT+CPys1lSs5dvPz93RawOamratpO0xqL+HoLRaJIQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DdmTeog2B2hl+kQG75u+5l+gAvDO6kTcbMsVKXjv8sDJJN3QjK8Ryq2RAS4z?=
 =?us-ascii?Q?0+2UmpGl+ooEOmdK/Ki1kg0J4ZRfcVVybucZQIZCZtzeGWQGpJxuwx/U6Lli?=
 =?us-ascii?Q?RQLB1D5y6taginBzTKe6c+jE7hjF/a32SHvhypyxZzhWvzhyUNz6SWVBIilW?=
 =?us-ascii?Q?cLdiHcr6xPuHPXIGXnwGXD6YMNRQKa/5DzgvrrQAPz2rEP2WW2kYMR/CeVsw?=
 =?us-ascii?Q?szBRhJS237DiwmGnSnaHI5wczMCgw8BIXK+buha56sG0fBHkyiERhyHDs4p/?=
 =?us-ascii?Q?+yUOOHbN9JfBfIts1hN4T0EUdNL+k4abZk6DOl5AqK5hYua6Pc10I/DD5She?=
 =?us-ascii?Q?LCAyloL2g3doJlkLmYIRZrbbvqQH51KW3McLN0YdCm+lNBIFzQHXTDtJGbHd?=
 =?us-ascii?Q?Lh2iwypV2xZtqldSxcjXPa1F4ajKYIDFIWHgn+Sp8o3OfeYVtXoEzuWtvwOb?=
 =?us-ascii?Q?/k8fg6WB8LHGVXP6alqPT00YgfwVbg+EUir78d4BjkgbQx+QPUzod63PtJUN?=
 =?us-ascii?Q?g8C27k7gStZ75Qqz/1HkTQwAW6V9rLPnAL9CQ5ApOkzqJ52+RJ0f0m+zjpBj?=
 =?us-ascii?Q?Z+903BrXSZ1GCt1tyApLOTUYTnZ7EUlTFExYslCImimqZKnIUf45aFp72Pxm?=
 =?us-ascii?Q?gcryWFC2sidV3R2Qgin/przBWMcIsvF5sRYf+e8DG7+D4oSkXsz1oqF+6usw?=
 =?us-ascii?Q?77uiX31JXyJMW7RK2itB8pVGArQpFRpywIXGkV8FBLCod7lQS8DyrW2CQksQ?=
 =?us-ascii?Q?7pcPxKL/w8Zv0Db+NH7orGGHXfdAljNJn04q57T0Q+Ukv40fiB5FuccpfnzB?=
 =?us-ascii?Q?EXTWmkZFIzyP2qWz+DCwfTMpIpKZyc6i3GCxnjI6AZk3aFqdq+9pvHlM30gY?=
 =?us-ascii?Q?3SPqo0DhlJYGXBJavvJblxnZ7QB3kAHdOZPdm0bC9jvJV3Je2FykEW/svunA?=
 =?us-ascii?Q?m2fc54E0lERaqDle7tkyG2oy4W3niH+WtcfaGPW6nec2CnGGKaNVu6P42TKC?=
 =?us-ascii?Q?2a4SYfiL5AIgkXqOyBz/ngBYFhkmfg4DJ7V40mt2MSNSTphFVVY7P0VZkUE5?=
 =?us-ascii?Q?JcvkMfnDaI4LZv5O9eGJn0ckMW9XUUiSRVEzdPZ8dY1NUK3i53HziXk2i8E5?=
 =?us-ascii?Q?zu2mk750P6sIDM/Lp5XriHDX8t1JtytR0fSvBq9aPCyMF21OUtDkuOd2dhUm?=
 =?us-ascii?Q?Q90SfHj2joaXmqNPsTxJKd6SopLv/CgB08TYmN1rJjjgPdd6KyVg0R9T7Oab?=
 =?us-ascii?Q?mqhu4T0O/yBTKiyKsDfTVQHvwFEyln3E/WDIlKGx52n1pA4Rj0LuKVisbxKD?=
 =?us-ascii?Q?BlUpGfc5Curwr/K8s4u6rRRXVxyFJQOz2+VqVDPP5fynvqLvx5fpPN311WPq?=
 =?us-ascii?Q?I8m/xjv9qodWq5yYvwEKDpZQV4Xq2aKKVc817a5WhNCOMl+cYZxQLOadze/+?=
 =?us-ascii?Q?aCUgycPV4GY2RwMH9mzbLmhfMEE7l9+1c0jYUN13HHxM8/kB3Pn1xzWaolRu?=
 =?us-ascii?Q?nz2qtsyfYqOmXdi7ZzgTzzgZx+frtmL+u2EGHpmJJN3arBwCggVDnr6PQkCg?=
 =?us-ascii?Q?qWWG3VBnpdiwt1ler9TB2429LNtD81N+PI9qxCZKR1bG+DBNVa+w8ABfAq2Q?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 87767e2b-59d8-43f7-d3c6-08dddbed3458
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 11:16:39.0082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rh/pzoF/c2XrkgkcIgE7JYS7sRClDKmR3wJ28jLfg/g4ZHplDfRIgOEMUhpwaE/G40h19qUEREnw2833RpWMzzXwaBYqeJJCOavObGc0PZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_041650_394241_F359154A 
X-CRM114-Status: GOOD (  11.94  )
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
 drivers/spi/spi-airoha-snfi.c | 38 +++++++++++++++++------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 0a95e469ed7f..067d9925415e 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -631,10 +631,14 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	u8 *txrx_buf = spi_get_ctldata(spi);
 	dma_addr_t dma_addr;
 	u32 val, rd_mode, opcode;
+	size_t bytes;
 	int err;
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
 
+	bytes = as_ctrl->nfi_cfg.sec_num *
+		(as_ctrl->nfi_cfg.sec_size + as_ctrl->nfi_cfg.spare_size);
+
 	/*
 	 * DUALIO and QUADIO opcodes are not supported by the spi controller,
 	 * replace them with supported opcodes.
@@ -692,18 +696,17 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
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
-	val = as_ctrl->nfi_cfg.sec_size + as_ctrl->nfi_cfg.spare_size;
 	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_SECCUS_SIZE,
 				 SPI_NFI_CUS_SEC_SIZE |
 				 SPI_NFI_CUS_SEC_SIZE_EN,
-				 FIELD_PREP(SPI_NFI_CUS_SEC_SIZE, val) |
+				 FIELD_PREP(SPI_NFI_CUS_SEC_SIZE, bytes) |
 				 SPI_NFI_CUS_SEC_SIZE_EN);
 	if (err)
 		goto error_dma_mode_off;
@@ -721,12 +724,10 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 		goto error_dma_unmap;
 
 	/* number of bytes to read via dma (whole flash page + oob) */
-	val = (as_ctrl->nfi_cfg.sec_size + as_ctrl->nfi_cfg.spare_size) *
-	      as_ctrl->nfi_cfg.sec_num;
-	val = FIELD_PREP(SPI_NFI_READ_DATA_BYTE_NUM, val);
 	err = regmap_update_bits(as_ctrl->regmap_nfi,
 				 REG_SPI_NFI_SNF_MISC_CTL2,
-				 SPI_NFI_READ_DATA_BYTE_NUM, val);
+				 SPI_NFI_READ_DATA_BYTE_NUM,
+				 FIELD_PREP(SPI_NFI_READ_DATA_BYTE_NUM, bytes));
 	if (err)
 		goto error_dma_unmap;
 
@@ -815,10 +816,14 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	struct airoha_snand_ctrl *as_ctrl;
 	dma_addr_t dma_addr;
 	u32 wr_mode, val, opcode;
+	size_t bytes;
 	int err;
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
 
+	bytes = as_ctrl->nfi_cfg.sec_num *
+		(as_ctrl->nfi_cfg.sec_size + as_ctrl->nfi_cfg.spare_size);
+
 	opcode = desc->info.op_tmpl.cmd.opcode;
 	switch (opcode) {
 	case SPI_NAND_OP_PROGRAM_LOAD_SINGLE:
@@ -834,9 +839,7 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 		return -EOPNOTSUPP;
 	}
 
-	memset(txrx_buf, 0xff,
-	       (as_ctrl->nfi_cfg.sec_size + as_ctrl->nfi_cfg.spare_size) *
-	       as_ctrl->nfi_cfg.sec_num);
+	memset(txrx_buf, 0xff, bytes);
 	memcpy(txrx_buf + offs, buf, len);
 
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
@@ -872,18 +875,17 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
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
-	val = as_ctrl->nfi_cfg.sec_size + as_ctrl->nfi_cfg.spare_size;
 	err = regmap_update_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_SECCUS_SIZE,
 				 SPI_NFI_CUS_SEC_SIZE |
 				 SPI_NFI_CUS_SEC_SIZE_EN,
-				 FIELD_PREP(SPI_NFI_CUS_SEC_SIZE, val) |
+				 FIELD_PREP(SPI_NFI_CUS_SEC_SIZE, bytes) |
 				 SPI_NFI_CUS_SEC_SIZE_EN);
 	if (err)
 		goto error_dma_mode_off;
@@ -901,12 +903,10 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 		goto error_dma_unmap;
 
 	/* number of bytes to write via dma (whole flash page + oob) */
-	val = (as_ctrl->nfi_cfg.sec_size + as_ctrl->nfi_cfg.spare_size) *
-	      as_ctrl->nfi_cfg.sec_num;
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


