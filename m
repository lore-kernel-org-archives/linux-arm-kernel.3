Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F12FCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 03:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2snrpNrzRAzTOeqpJ8KPLiTOapJVIgdfhM9IUrv732o=; b=wgHRYGfkRgz64imwEEPCRBS+nb
	PaxarCaTBa0CWb6hGXE0fjKR8itjWCKchsTSCpNbG7T/X8qGkeX8sYxZ1AhW+Mi8zmTBVtUtdA4+e
	NVfrXECIsUl5zgQC7fDbbx55cFDbexfZWBtQVNSMF9lZfTXopL/LR6jOrRMEfSWDq8ocklTb2TMA/
	aR2GV1QC/lTcQhsxuSvGtA3m74jivsyjz6B36F2VKqrGE7xd0PGeEvQNIzFiwuZmAvYlUU9F3RclH
	BvQLdggFsF/piIqjwdVJ5XgdwPvso9fiTgTXeW5o0YuZU8IgaZHqK+VZhBSfKQH/xIrZYHn4GRCzI
	UceCGnrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73rS-00000007ZQC-3VcM;
	Fri, 10 Oct 2025 03:32:06 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73rO-00000007ZE4-1Ctl;
	Fri, 10 Oct 2025 03:32:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU3wlVPoSaymk7JwY+VaTrtbRM5BtuFbWxKlvkgo6eLtcv7bqhX64WWndA4rbMafZPPgCEDC2SdiIJHBEgfTmmEN0/5SS6R9LBD1hBg5sIUpM8ZsXvPzg2ebFKlFvyJQhZoCqbQbZCVF5i6Clsp2tdE93tMcmHjDxr9d53FTtzI9w59cp4igmQeRacYKgb8Y+ObBRVzp9YN+GRLQdhUJryqDogkpe0ByKwnRGPwwfkfiSEdtIQFH+Co0Lt3jmUgkJIVATUpQG5p8RPh6efueJgMvw+b3En84pv0kDfzmrS6ywAv9pR3brDnTSAt9gG0QCqnjMW0Bujx4Ij7MACsV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2snrpNrzRAzTOeqpJ8KPLiTOapJVIgdfhM9IUrv732o=;
 b=swqez0BiPDZLPNof4DTUrZc9lBNDiH5TroppQLb7PKC3vkfoQ1u5x7hAOaferhdNTbtve5V7oW7gSEcLngZIPOc7cOg0P/3DM3Umi0bfX6I2bxqAcUK3cccjwk3r2l+lzDhqa//JLFXF8hbCAUdf/68IZRvjkWsiSynHx0J73LNitcDU6SFU8yK+ATTvGF+diB1RiYCyPE0UjdsfDcgYBzaptLYAy6DHDoHWiJG0x/MzUoMseNI0H5/mUlOLTvqpIXzWmOPA4yfBkVdjHCBuKlIHVYxGoaO8aXjbRPiWdO6wimod8x19ydV1q3uT3Rm/MNBdXO8uGqNbjuXH2sWL7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2snrpNrzRAzTOeqpJ8KPLiTOapJVIgdfhM9IUrv732o=;
 b=Y3giv3Duh3XhN8HT3Ul+CEl0fTaBp8CYy5pYoEp7K6DgEBJQ04wzD5McjKWhYxkGYU8nNn2dzYkDJMXim8nIuj9fcuAG7wCgx8G7nt9nbYXmgkmMJvZHZ13rGso/piNyxDKlNUhtf+cUfpFBW0HTQqAZYdc5TxCegXa7BFXPX9GhhtYfSpELRcmYpzoC1QhUppS0wNz0sL+VEA59PgiUB0aCc2EwlNmHg+JNVFkmy8ttQDDxdbN4gJRDopBcn2SjBrIh5zAtO3hvDqZQ60JRr0cf0l5JXqlRBDna/dowLpZuoiROVyFT6Fe1FMrb37vBFNCD8eMfP4p/A8HNfNyMIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DB9PR08MB8359.eurprd08.prod.outlook.com (2603:10a6:10:3d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 03:31:53 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 03:31:53 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v7 05/17] spi: airoha: switch back to non-dma mode in the case of error
Date: Fri, 10 Oct 2025 06:31:24 +0300
Message-ID: <20251010033136.1475673-6-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010033136.1475673-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251010033136.1475673-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0035.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::28) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DB9PR08MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: a5cf7549-a9e0-4334-6a8b-08de07ad8e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rG1VpV45q3nOYtaWHzANoxdRH+fPxzwy0+PuEY4PLBU/0SwxeeQjpd3W/POa?=
 =?us-ascii?Q?gvo3Ehs4f48uyEBb65kqGfAi/GdkVg/hKonroX8nuNcXG53aEPnsk5qviTys?=
 =?us-ascii?Q?BpvPC51oWv37tmhsHVk7bpfPSQwEuUPLdVzg6TTWqyfkCmc50uqmtQaQeGiP?=
 =?us-ascii?Q?7WtEAm5QvY0JP3U9Pj1839sJkVPQkZyqwQO+5Nbm5sdo8vL/cTChraRMuc/0?=
 =?us-ascii?Q?l+KMA1/pqNzDpkEeNwuiASi2N+FyYAMk+wsNBCUAgMKZKExQqRt/O/ciFHgX?=
 =?us-ascii?Q?I5bHnxdMaE8xhS7Ep3hcpT/zBCuOUeEsBH61FvWoVHTczyJ+tE0q7SUbWR2p?=
 =?us-ascii?Q?ha/Cprqr73MWCRSPjOBS98ACRtoprYMtFuHdIH97MXG8ajndNa805f4ZY7SG?=
 =?us-ascii?Q?Huyn6PrrI/lOmLoeJb10uB6BBlwQUdUYUN+EcE/DHjpnZV1mZWL1C3JjIfd4?=
 =?us-ascii?Q?kpDmLIlgjwHdHSeNxluUxQzW++UJ05CSD48ZeTmuJGBByVI/zo+Vx5NK2mju?=
 =?us-ascii?Q?YATr5wOA9Lr1yLGKJEf7V+X6ZxStycXQdRupPH55sITdOWDAtHXAra1kXJBu?=
 =?us-ascii?Q?RCaOj045wgfEjrTZLa7PGZ0SjqJohs//06MOuiVc5A6A5wkDpXsEK1hX20Bg?=
 =?us-ascii?Q?gzn2Zp6/Or8VqJEVdiT3LVVPtGsBee2324iuBZ7Qa7hZPLzWXGyO2z3HuA5H?=
 =?us-ascii?Q?XJCKf5hppFR+7lLqH5A7aWBZM+lNgkLkV7xn1oiQjuX+TRimzmUsM0G/5+/7?=
 =?us-ascii?Q?/X2/ohTXC4HL4xSP+9WsDhL66rysEWNS8egXj5TL+Oia0SYhTDIJQfmpH2oa?=
 =?us-ascii?Q?PNkGh/SDiRgucKjjXphSLWwZfjnm/00cZ+Nx/hixjqBV0C9qEZW751FCJ8gv?=
 =?us-ascii?Q?FHyGIjjYFI6h+zNU5pShzet2g2zRc3hb6Jea6vqbVFhc/a+fc4AIL3AoHms9?=
 =?us-ascii?Q?1gzojcu1fGYsHhxwFl/e6PBOBdGuZPqf9TlwA9LTrPgCdXePGokH8br1f48X?=
 =?us-ascii?Q?05FFSHeQMosPbmtCGXeU2a3Ox9eh1Ss9KSXzmYdACotlj0+BhZvuhjC97mjZ?=
 =?us-ascii?Q?+cX9Qpai41qGQs9hNdQKj4j23BjC5JBa4V9mO826dPcoqoMnwPnWypRTn9rt?=
 =?us-ascii?Q?sLm6m87GnzvfaGph+4TDrRLOpkWvrekJMbN0t8vhlGo1VjndeP+6V6xLWoDR?=
 =?us-ascii?Q?DrZXvNv3GLBPKEQG4vwpc/3fkJNowpGowldh7vb0sdw3tc/fWhc+t7E4txQi?=
 =?us-ascii?Q?j3GiDEtbua+EeVwrUX3bH38N+Y2AyOWLTE1jDeItDBua5oGQUUpoWZsOJVQh?=
 =?us-ascii?Q?e+PmNkObvRsG5STcI+9X+75p6NfwYNweVUSL3FpJLRKsj/oP/ISunx+1iRpx?=
 =?us-ascii?Q?gulYxbuMJgmNUcQljkRfyKi+WhbdU8Ot8LnXTdIkse8QGSGhwLuT7QaKahoS?=
 =?us-ascii?Q?pGDVb6mmd17TjWYkeOEcZQbWnHtNBIoP8DAR1EDP6ZNZ8uupLolVFTNhGEOw?=
 =?us-ascii?Q?9TlWyICjwnLkzQJF2e8PT6+hy1SSSPeD9DMAUr+/iX0WFBDnvjqqYc9Mxw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Tlt6Kc+jNTcwVXBflDhtWaYlKYcRYrv8iy57r79e/qg9I+Npf42S03h0Gsc?=
 =?us-ascii?Q?9QWX9SDRBVaGrSPR+muKpyDcb4GIE8SdpoIPtChwwSCNhsM7O+tDnWvOLewB?=
 =?us-ascii?Q?UBXWsRtPBC/yNARhYAFNsJmca1BuhVlv3O6FDHPt74JwHODPU6/B3hk8bi7/?=
 =?us-ascii?Q?GrLZE/WpsNXYTNTAbO9IvWwExcbizyR14i+9eYO+teIcJPnahP5+e+VjHXE+?=
 =?us-ascii?Q?zbM9bUZjFqtNwiW5aYZluW8wP/WPDyMp8V5GvkFgUhu/MiREWTIM5v94ez8C?=
 =?us-ascii?Q?qc23QtByg3C/wGnvP+gSs5S8Tc1oZB2U7LIM/2brULUyN2CKKvzM56S8IUER?=
 =?us-ascii?Q?6Rijrk9aTBY4XAeXvht5rkn5oA03tJ/TDW2dyFNzSvpe7K5CZOrcvA6wu55w?=
 =?us-ascii?Q?UytU7R1lkenUofQEPJQqiOnTt7q0ALdonf+EZ7BfGy4eUYnxNAR9T/lKvAt9?=
 =?us-ascii?Q?sZVpl46LVyrxjfaLrEHBRECim525ujAM8zAsFWGXnIjT1zxdVK9tuvXjO/BD?=
 =?us-ascii?Q?oicbz/n0AfDZcOliQLK5ztp7ouqE2KePXmYoxnvHM/L+ryUVKf0XVNG2d0dC?=
 =?us-ascii?Q?EexaFCkMgNxlCTZFJE8+5Td49Jme2aIey/z1ZUlTtcpexHwKEahYpJWXs2Ok?=
 =?us-ascii?Q?YH3GXS5YinZtY3Fx5xMOxhrjZqN+FWSpK3TYD5hGToH/sJ/qvz2ylQxe3BVP?=
 =?us-ascii?Q?xqP1LGqaG6/kZ4MvthdorMrek94siMTY1F784RTx8OY5O64r854pJJtvf+OI?=
 =?us-ascii?Q?WYDN9mgIPbQRUJwZMbTik2KO3aNtUmMr6YAysrtE+qZl9E31CLCm+JdRj2SI?=
 =?us-ascii?Q?0pHxMvECVTGuyCEJnEBDA4okbfE5fjt5hVlzx5sg5Y8tfnjekp9Uv6ffAjl4?=
 =?us-ascii?Q?sR0toPISJqen/i1Jr7cpvZ0WhkxgB46T1Xgl1AxPGbTB3JbMN1+VCISieL9o?=
 =?us-ascii?Q?EtH+QUT7zWm6sHUq6+LuVqMiWg+z9lg5zpwcpKWDj8f8ApTM+7r/C+LpWVLd?=
 =?us-ascii?Q?dnuXAjtDzaLgOa7ZX7FUMYozc4ttiS7dUyyKCWW/njVvj2FYbJft0Vp/YCDw?=
 =?us-ascii?Q?Mh66JuTQo+eh4uy3vNPAOVqozjoU+2qIru9NImkK+cGPB+Xh6qLoZ+cetAhU?=
 =?us-ascii?Q?dd0MDQ4Wtq4m/XuwnkSHNJVmDbCj4BmwjLzzMPBCIa5GIkJ5vgWL3f5ecuCn?=
 =?us-ascii?Q?RFqVWOzZbmUwbrsynt9FQ+KBX7YbgBImJulT6lX6+3Y+rQIZS3TNfHZPP7Uv?=
 =?us-ascii?Q?bKxVYU44RcGZmzU0k3QavOzxDhMCZc9bdgYLeEN7qCh3qtAtlpMuPWbjmkDx?=
 =?us-ascii?Q?ZDDSFR6XX1i5ZqzwxoSJB8dSM4yWL9Eu3mDdPzbwTMqzlyx/8hit5c/cY7Te?=
 =?us-ascii?Q?OBLdP+pzJs6mhFUeJkL292XtAjAUxi/dxOTf7acgm6SXkV+WWJQPN0/Q53nF?=
 =?us-ascii?Q?c3cNwIHuBm41b6Dnty4z7BDwrqSioI03nUdKYJHDubCRZjW90TqHdU1ieLU+?=
 =?us-ascii?Q?OMZYjO0hlvXuZB8qyswRPD3OtISzmUmds80NdVFGx5KykVelSxEGKRCIzGmR?=
 =?us-ascii?Q?MVsEv+BdZHSLwQ191LoAjhUI10WresB/063WdimV+wfRlJ/wqBRK504cyT8n?=
 =?us-ascii?Q?d5I2ud+7wRLNsV5L1cKVHpU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a5cf7549-a9e0-4334-6a8b-08de07ad8e5c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 03:31:53.4063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfRoct4xRvygsV44kbvNmSiO2kR+RZDc2BhIFt+VNDj9y1j9qwezWNLZZb+/leN8ZGtxUsqiW09Ueg0b5BTsBbJpxitgLIq5G8S1vxo9l9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_203202_334125_D2E0643D 
X-CRM114-Status: GOOD (  10.11  )
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

Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-airoha-snfi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 2d86dc62dbde..a39c3ab4af5c 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -691,13 +691,13 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 
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
@@ -797,6 +797,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_FROM_DEVICE);
+error_dma_mode_off:
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
@@ -926,6 +928,7 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_TO_DEVICE);
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
-- 
2.51.0


