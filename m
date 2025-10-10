Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99A7CCD18F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 19:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYefZq1Kji++ENuMNeN4dsMVnRysysPfLivp5ZCp2Ho=; b=qypz0BIvYEI5Ji1SkxP4YPHZEN
	9Nhfe0s6ZwZ6ETLjLIS8XCp3KS/rsQx7eAAPfrsVa9lo6WpmKiyMBrn6e5L8xHmxPIvL7pyE7jUkI
	+nTzKJlekucKp6X8A2E+FYXXO95cLqUN/GR0EBqynJMv+m362Fg+68bGVyFHZ7JKscfu0+JBMumFT
	mkD3PvsbMaxwtIXRmNyQY8jU1f8CToxAkMJn/F+5g5emJ+nxIWXog7wdkfIqaq5e9csaFsKu4scB0
	feKt67JzygdJoOMy0tL3MRNnH4PwT+4u9exWhoYX6l3HA+xp4e9H0rmf7ImtwO0TOUNunqoon2JxH
	58qG3aQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Ifo-00000009DKD-2Fig;
	Fri, 10 Oct 2025 19:21:04 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Ifj-00000009DCF-37Kw;
	Fri, 10 Oct 2025 19:21:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFTHSuLP+zk9Qe7JBNmBCQuo0kK34a19dYCbeiAjqUkrMZ+scexWwORG7LCFEE3zL4sI8PkvE6C3b/nJGxwbCV+39rJ9d65a+hUduEZ3FXloAshm1OP1Ti2B0sU/51webdjtEkxLRsoCQngVAhTAng5vNGS1+MZFf+WzVpa6RcW8PmeOcYmeVUPr9pibF3WtWAAz0uFNx6wbnwOtrAbZdZac0cb1Ehmu9c0nFFEFIWTkqd1u6UWBLLhQwbY48QSeylqR133UcEz1Gfz6P+243yZBep02G5Z6XCmhi5APuXNk6KfZgypjH+XrssEAX4biDMqo6U5KFH68bG26BwspVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYefZq1Kji++ENuMNeN4dsMVnRysysPfLivp5ZCp2Ho=;
 b=EkYFP9owUIyaeNCg4o1b0bjXZR/2Mr5RN9Qp78f1kBgmqoWsXpGYLAhewCBurtP2BjcsrhZgpX/1YPLrcZCDFLJfgpyHzZ6z/htGKD/k35qlejL5ce/g1M0dGyo8mo+PSuyEMzvzcnYb1J+6l5i7TFKQeaACpEWZUf96c0M83jZsa9uqVuM/MvO2yd+ROxOg6USs6VbjOS1rLPXu9Yawf0+Yr+lE3pg9ItFmQ1IsfV3AymCpsk4ixN5zthcjpoYCWquJ7ZM8HP72Q21s59vzOV7roULwKaEhImFghY+bKUhslBVllZ91wHHFPfDcyxattNP8ykndoE9MYzBX8zjRQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYefZq1Kji++ENuMNeN4dsMVnRysysPfLivp5ZCp2Ho=;
 b=TVrlic7Fb2M1dtvRErG8VLxPPUqFHJMcGOXK1f58SV5IkIILMlTiAyFE6LifdW/1TbUCoQjZYi6M4aUq8TmnU4emKgfWZcW7t4sOXrxJ0E3Wfj+9qr049zSF8MOkMUdo3AIMq4KExiMW3jRr0Jnxxzpw/buIPy6/NUECkVDlQ7b1zVVt31RzCLsJ/alAwWM8Fuv87GiXd6Za/2MNkzxlVa1DM21JXq0A+5Ot2cDJPk/EGxVbDAVyL67SESDyKmTyOzvxTMus0jw0qXjBLdA/FKH/+EsO2sBiA4eHA18ke3pkvCBvCGaYSCFzVoSPXEmJZurrZUsHTZcdtdUCfVu7Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GVXPR08MB11352.eurprd08.prod.outlook.com (2603:10a6:150:2c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 19:20:50 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 19:20:50 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v8 03/15] spi: airoha: add support of dual/quad wires spi modes to exec_op() handler
Date: Fri, 10 Oct 2025 22:20:26 +0300
Message-ID: <20251010192038.1592889-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010192038.1592889-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251010185940.GA715991-robh@kernel.org>
 <20251010192038.1592889-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0020.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::32) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GVXPR08MB11352:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d919a8-d2ec-403d-dfdc-08de08321f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dsnpbKJ7wxdZGBRFRffgJmo8kuZSep2OVxJe6p/eImOl2RiPbo6LaXA5nR1w?=
 =?us-ascii?Q?7hJZ8hvdZrBH1cVB/qOsu2AwTEFwLmECUUdcHBJUvEHNBPzCt1agYUSHss1e?=
 =?us-ascii?Q?ibcg5+IfTi1TblcIlScgF0xz+UkgY4VTY2TbGTxdrv4px+TCuHQtWh624PDG?=
 =?us-ascii?Q?76wYwLpcL3WjH3CVUh/AZLLnfwYQodjfLXdileuhlPDWjr2cGVV3tP9dsMUq?=
 =?us-ascii?Q?heMdXDQTtyRt+33iFMQmK8iYCYKMiJ6//IFQKulrTxO1kNdDbihWZsFzdTBq?=
 =?us-ascii?Q?7+6yfiE5THtOpiiAP7vDIaoYCvGfJ5k8chLthnZchx5O61MLtt+i+iZjjA1C?=
 =?us-ascii?Q?xZsfVh/rGF24GftHTa0/QDh8yTWkwM2Y9uULOd78ygfnd7WAX3Po1qyXjex4?=
 =?us-ascii?Q?46iaYB2VZoHqFXc4VuNoxPB0xEmRYFGJef6demkq8Xcmqk4HBgt/+4aRoQX9?=
 =?us-ascii?Q?HyMksvbLa+VULR07uRUDjhbVYsRHz6/UqHgcPUF4xJn/WLs9j0Bty4hEe3i9?=
 =?us-ascii?Q?LRafLqq3scY2MlFU/WvmXhxQWnLG0vSQ15WchwMB6VIXAiUiq/5NLYMBLTez?=
 =?us-ascii?Q?H7BXsGA7PHxXoe+0Yc9s7x2+/ftwnjFpuo0uYvXMBGMtMKIFkoy/edhm9C7k?=
 =?us-ascii?Q?Ff/r1KGxoKzPkkJ3zRw9UNFBXZh7hFVvWX3uZjuOodaDS5mGMzQvpsUxB67E?=
 =?us-ascii?Q?ptBj7B9nVMapgpsxMO72gNNs8CjN7zuS7hWmXL+owwSPDlYwAOLC0IbK1K9c?=
 =?us-ascii?Q?JpS50tQIWR/4oT9Fx2nGsuTdvHaWSoYQss1UJYQaShNPXG76luvHSIP3wZ6O?=
 =?us-ascii?Q?23Ikt2eDQslRJ0YVWwmz0yFbiJLz4nuVNlW5gBjCvSPd+/w6CVMQB8owviSL?=
 =?us-ascii?Q?q54ERYsin6Z9qbz5LLS5S6kr7SB9/du6vfqzdKxsHw08Xj/czqTKQGX/MaSH?=
 =?us-ascii?Q?ASo637yjuNFTkcgYjWJJBTJNUZC8C5HnWUCc+2cdiXWitO+ZYfZAdGX3n+s5?=
 =?us-ascii?Q?N8iYLzaG8V5Oq1Sq6+J2xJyhgUO4masHUjpPhPOQ5vde9EbpYabpbbv1DqDd?=
 =?us-ascii?Q?oUA6GwN28kTocLzz9R5v4yk4dZLuDomLhkYBsCul9ExZhg4VrPG/CX9NuulW?=
 =?us-ascii?Q?a9izW3gbZAUK2/8Cykdh78etI0YwXvFepmo0/NTtbYmD594dG/OvfY4Bi/cc?=
 =?us-ascii?Q?21Z3RX/eND35Fcsll/dl9odUuerrNgeukSp2PloSya6H8BiEI4njwANX8S+L?=
 =?us-ascii?Q?jNrf2rjZoMQJpWecKee8aoHtUaWuxRq4U2xuMOVlAZbtDK1r/+cUt/7PTxcS?=
 =?us-ascii?Q?XG6nazhIO1XZgsSUR0lEp1nBNnueaJOxUOADXH/L0O4nC9LPv9zYQF/lclW9?=
 =?us-ascii?Q?a90IhbJOb+BTnBuJw8hK6SrNMSHqe06B0KSEgfbqyWR8FwEs2haDagAsVC25?=
 =?us-ascii?Q?VCj7B4E7TGV0vLl5CmvyUgKAy4ZsApVNtV23ytpb9/wEPleA2MmJx7FJaDRe?=
 =?us-ascii?Q?N7m7WSAz4yRrX6+QUg5lnGHZ0rISOexADiS6gerckpCd11YPi3dKGTLTsA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KUBVoWW9zJBSsxDy7BBSdEGBTAQ7frteXUaFZgnUuMpx87jj6Lz2nIzr530Z?=
 =?us-ascii?Q?F7oVy8/Khl180vX37PLPh/p/HkGX6hlD4hJ/r93qwJsDqT0gXyGzHXpQXidg?=
 =?us-ascii?Q?29Go5Ishm5PGvtuclt4QjwCxFuaGrHXbB7SAfdM9Tob4aR1Xq0/M+tL5HlI7?=
 =?us-ascii?Q?c38NtaQ3HZPN6HCC1TS0x71b7YYDidaCTKAK7/Se0h7UBEzSnhlw9ugwslUF?=
 =?us-ascii?Q?QIeLS5yXYZPirsBNLA69uNb0B8grKUsTzRXYwW/pCER2hQDKRDt2Dv+kpft8?=
 =?us-ascii?Q?UalLVkAqFvPKrqrspgezTD+BYUFWLpY3l7i4HitCdaaqfWGJhPyLzVCE2D7L?=
 =?us-ascii?Q?aa2dvjx36lljrXOJaVD21UX2yZyycmAqkI5O63gME5Fe7OA+CBvolLtvAc2D?=
 =?us-ascii?Q?+33DmkzOHwIg0BHpY63EDWCTBVeQDIezKmbGfy1C0eAD32rq5rhEZtUcdMsg?=
 =?us-ascii?Q?xhruEKzd2riBEW9ixeEdsCYckRccOOY1iMYR4HMpbUXuPQqEnO7YSm2/wYKI?=
 =?us-ascii?Q?P6daKiw4nV+Ilt1tMeqx4z0cEOMZ3pA5B08IxqdRXWNsxBJ67mzBrLclCH/j?=
 =?us-ascii?Q?NiNKvXei/3QucjAh1yytVLUwHld4Emcl5XTJNLkc/Dy0a8ZlZyibxkf7CUDY?=
 =?us-ascii?Q?evUwnHhJvpfSHnZ3AM6vNIXLx3fDbYgy2NAiMhblzFG1oi1vyn1mCeGnNoWG?=
 =?us-ascii?Q?ptvrW/PW6yAFzrgeYQD0OFEmh/+Y8sUouI9GmDGADLooO78VSc0HvtKdxx5A?=
 =?us-ascii?Q?H3NTnOgXSCarwJ6XtP7tFAC1QRBKo49R1lG1cKtVWATxfv0A+gAak9LhiLz0?=
 =?us-ascii?Q?seLhnpBVDuRMIhRbTIpN6YgchluXt41iWtK3i+ewwpsEGrhbZdzRBua5T3xV?=
 =?us-ascii?Q?71J3jq53FOur0DaCksfpi7d2YB7aBI1QAxrlK6Q4Tjkj5D3AWHZC6LiEyrdo?=
 =?us-ascii?Q?aSx8RGjr6P2+fPCfhu9ePvfL179R7gjhsw095P2CDzFIq3fhxuH9HXOxnNuc?=
 =?us-ascii?Q?pVTiVO7uLswEk2sePWafilZLe/KPNViJl/wArw1znc26hxnJUhVQFiQ1uZ33?=
 =?us-ascii?Q?3QRwVJzSuokoPodE6hIFhPuCAleaQJZoN4HbdvmaRfF89HeHoOBZNYp2+cGp?=
 =?us-ascii?Q?UcLpTUDZoPOjeHLQQc3EW5mZBnFm+xmFxNBTlDp1yD7XBJgbTivojzx95AbY?=
 =?us-ascii?Q?MnbKmnt/3T2stZdGHvM9Eigyg9HDXe9hg0WPQt6Szl3At3Xc0TzeuGVgMsBi?=
 =?us-ascii?Q?fHmAgJsX+8+7N8WdDD3mQNcrtZM+58to6mQNdnEflzZp2FFGFdK3KQOcP0Oa?=
 =?us-ascii?Q?ID+6MP8mu5ntJ82VR/9Drd+Lerec8Glvly3romPt+A5jeeawXEKV+kUnXUo5?=
 =?us-ascii?Q?Klrkoa+A6H9EevVKVFrrBsB300x3HTp+doHHDb0CYXaxns3Uwlej1yvC8U8p?=
 =?us-ascii?Q?GID09yAf5pGW363BlnPBVaP15f5ev5YXMmCDHVtQdWO2Ya7OLdqm+L5uOz5g?=
 =?us-ascii?Q?SjGQjuQ1C6aQX/qn+JeNfLiKGWOrYC8P6B8znO5wLGx6sQwcMZ3ykBhzHhOs?=
 =?us-ascii?Q?YYJjah+QFFMp+jC+9k39ErF4AFkpv5HXrNtqRJM5rHJSc3iLwtnOVERbc1Hb?=
 =?us-ascii?Q?hqZWa7MgIvCqALyKeW8Z/30=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d919a8-d2ec-403d-dfdc-08de08321f98
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 19:20:50.6541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrfpHqjM9xG91Ho3OG0DONRBXvYWh5QxvxUsGQ2bDKobMDKxgZk8LsED/xMp7Vki+I+LsmBR28xQtmQSKLcufCTLBboIUlqOpfna2r8ZtbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_122059_808487_6C34E7AE 
X-CRM114-Status: GOOD (  22.07  )
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

Booting without this patch and disabled dirmap support results in

[    2.980719] spi-nand spi0.0: Micron SPI NAND was found.
[    2.986040] spi-nand spi0.0: 256 MiB, block size: 128 KiB, page size: 2048, OOB size: 128
[    2.994709] 2 fixed-partitions partitions found on MTD device spi0.0
[    3.001075] Creating 2 MTD partitions on "spi0.0":
[    3.005862] 0x000000000000-0x000000020000 : "bl2"
[    3.011272] 0x000000020000-0x000010000000 : "ubi"
...
[    6.195594] ubi0: attaching mtd1
[   13.338398] ubi0: scanning is finished
[   13.342188] ubi0 error: ubi_read_volume_table: the layout volume was not found
[   13.349784] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd1, error -22
[   13.356897] UBI error: cannot attach mtd1

If dirmap is disabled or not supported in the spi driver, the dirmap requests
will be executed via exec_op() handler. Thus, if the hardware supports
dual/quad spi modes, then corresponding requests will be sent to exec_op()
handler. Current driver does not support such requests, so error is arrised.
As result the flash can't be read/write.

This patch adds support of dual and quad wires spi modes to exec_op() handler.

Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-airoha-snfi.c | 108 ++++++++++++++++++++++++++--------
 1 file changed, 82 insertions(+), 26 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index bcc464ec9c61..fffed26ff990 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -192,6 +192,14 @@
 #define SPI_NAND_OP_RESET			0xff
 #define SPI_NAND_OP_DIE_SELECT			0xc2
 
+/* SNAND FIFO commands */
+#define SNAND_FIFO_TX_BUSWIDTH_SINGLE		0x08
+#define SNAND_FIFO_TX_BUSWIDTH_DUAL		0x09
+#define SNAND_FIFO_TX_BUSWIDTH_QUAD		0x0a
+#define SNAND_FIFO_RX_BUSWIDTH_SINGLE		0x0c
+#define SNAND_FIFO_RX_BUSWIDTH_DUAL		0x0e
+#define SNAND_FIFO_RX_BUSWIDTH_QUAD		0x0f
+
 #define SPI_NAND_CACHE_SIZE			(SZ_4K + SZ_256)
 #define SPI_MAX_TRANSFER_SIZE			511
 
@@ -387,10 +395,26 @@ static int airoha_snand_set_mode(struct airoha_snand_ctrl *as_ctrl,
 	return regmap_write(as_ctrl->regmap_ctrl, REG_SPI_CTRL_DUMMY, 0);
 }
 
-static int airoha_snand_write_data(struct airoha_snand_ctrl *as_ctrl, u8 cmd,
-				   const u8 *data, int len)
+static int airoha_snand_write_data(struct airoha_snand_ctrl *as_ctrl,
+				   const u8 *data, int len, int buswidth)
 {
 	int i, data_len;
+	u8 cmd;
+
+	switch (buswidth) {
+	case 0:
+	case 1:
+		cmd = SNAND_FIFO_TX_BUSWIDTH_SINGLE;
+		break;
+	case 2:
+		cmd = SNAND_FIFO_TX_BUSWIDTH_DUAL;
+		break;
+	case 4:
+		cmd = SNAND_FIFO_TX_BUSWIDTH_QUAD;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	for (i = 0; i < len; i += data_len) {
 		int err;
@@ -409,16 +433,32 @@ static int airoha_snand_write_data(struct airoha_snand_ctrl *as_ctrl, u8 cmd,
 	return 0;
 }
 
-static int airoha_snand_read_data(struct airoha_snand_ctrl *as_ctrl, u8 *data,
-				  int len)
+static int airoha_snand_read_data(struct airoha_snand_ctrl *as_ctrl,
+				  u8 *data, int len, int buswidth)
 {
 	int i, data_len;
+	u8 cmd;
+
+	switch (buswidth) {
+	case 0:
+	case 1:
+		cmd = SNAND_FIFO_RX_BUSWIDTH_SINGLE;
+		break;
+	case 2:
+		cmd = SNAND_FIFO_RX_BUSWIDTH_DUAL;
+		break;
+	case 4:
+		cmd = SNAND_FIFO_RX_BUSWIDTH_QUAD;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	for (i = 0; i < len; i += data_len) {
 		int err;
 
 		data_len = min(len - i, SPI_MAX_TRANSFER_SIZE);
-		err = airoha_snand_set_fifo_op(as_ctrl, 0xc, data_len);
+		err = airoha_snand_set_fifo_op(as_ctrl, cmd, data_len);
 		if (err)
 			return err;
 
@@ -895,12 +935,28 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 static int airoha_snand_exec_op(struct spi_mem *mem,
 				const struct spi_mem_op *op)
 {
-	u8 data[8], cmd, opcode = op->cmd.opcode;
 	struct airoha_snand_ctrl *as_ctrl;
+	int op_len, addr_len, dummy_len;
+	u8 buf[20], *data;
 	int i, err;
 
 	as_ctrl = spi_controller_get_devdata(mem->spi->controller);
 
+	op_len = op->cmd.nbytes;
+	addr_len = op->addr.nbytes;
+	dummy_len = op->dummy.nbytes;
+
+	if (op_len + dummy_len + addr_len > sizeof(buf))
+		return -EIO;
+
+	data = buf;
+	for (i = 0; i < op_len; i++)
+		*data++ = op->cmd.opcode >> (8 * (op_len - i - 1));
+	for (i = 0; i < addr_len; i++)
+		*data++ = op->addr.val >> (8 * (addr_len - i - 1));
+	for (i = 0; i < dummy_len; i++)
+		*data++ = 0xff;
+
 	/* switch to manual mode */
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	if (err < 0)
@@ -911,40 +967,40 @@ static int airoha_snand_exec_op(struct spi_mem *mem,
 		return err;
 
 	/* opcode */
-	err = airoha_snand_write_data(as_ctrl, 0x8, &opcode, sizeof(opcode));
+	data = buf;
+	err = airoha_snand_write_data(as_ctrl, data, op_len,
+				      op->cmd.buswidth);
 	if (err)
 		return err;
 
 	/* addr part */
-	cmd = opcode == SPI_NAND_OP_GET_FEATURE ? 0x11 : 0x8;
-	put_unaligned_be64(op->addr.val, data);
-
-	for (i = ARRAY_SIZE(data) - op->addr.nbytes;
-	     i < ARRAY_SIZE(data); i++) {
-		err = airoha_snand_write_data(as_ctrl, cmd, &data[i],
-					      sizeof(data[0]));
+	data += op_len;
+	if (addr_len) {
+		err = airoha_snand_write_data(as_ctrl, data, addr_len,
+					      op->addr.buswidth);
 		if (err)
 			return err;
 	}
 
 	/* dummy */
-	data[0] = 0xff;
-	for (i = 0; i < op->dummy.nbytes; i++) {
-		err = airoha_snand_write_data(as_ctrl, 0x8, &data[0],
-					      sizeof(data[0]));
+	data += addr_len;
+	if (dummy_len) {
+		err = airoha_snand_write_data(as_ctrl, data, dummy_len,
+					      op->dummy.buswidth);
 		if (err)
 			return err;
 	}
 
 	/* data */
-	if (op->data.dir == SPI_MEM_DATA_IN) {
-		err = airoha_snand_read_data(as_ctrl, op->data.buf.in,
-					     op->data.nbytes);
-		if (err)
-			return err;
-	} else {
-		err = airoha_snand_write_data(as_ctrl, 0x8, op->data.buf.out,
-					      op->data.nbytes);
+	if (op->data.nbytes) {
+		if (op->data.dir == SPI_MEM_DATA_IN)
+			err = airoha_snand_read_data(as_ctrl, op->data.buf.in,
+						     op->data.nbytes,
+						     op->data.buswidth);
+		else
+			err = airoha_snand_write_data(as_ctrl, op->data.buf.out,
+						      op->data.nbytes,
+						      op->data.buswidth);
 		if (err)
 			return err;
 	}
-- 
2.51.0


