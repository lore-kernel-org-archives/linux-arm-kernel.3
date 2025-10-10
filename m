Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B80DCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 19:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvX94nIt6Ushebm+TMBumijXPGW+xCDBR3BCYJgUfgw=; b=Q7fayw5Vd6ier/UUVAGr82K/Tv
	Vh8wzKJEN8OUgkO8Dj1MZyIGwLKYwZ1W93T4TKFqz0JdvOdKjvE4h4RVm0a/B1Buz8JERo/ONDY0+
	RvJoDdsjfDQC5OdT0Q1of2XFwajiBpTJRWpZppcbF3LBl0BqlCvVHRS8CGvPonnipCi/FrH3/6C8i
	07gL271XU2dfZd3EkY4UxO47PPsGgOEO1b6PggNUncpsdbdf59jeef3EyE2E3MjkgLpVkbmQBwLgG
	3Cu9T7xAV8uH7w9zMNE66LV/yXam5bYIZTs3AaipPYBmFCYG75zxEDTRW0jz73qhrLGzKC+nZh+n8
	eBL0Keyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Ifs-00000009DQm-1nfi;
	Fri, 10 Oct 2025 19:21:08 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Ifn-00000009DFF-0o98;
	Fri, 10 Oct 2025 19:21:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHUQ6Giuszbx0gGWEwjw+ksdgJ8N+CgF4uluzRcKEeI0yd0/pY70i+cfNmTDr82pZtLACqAZrDMAM+2Syl57YB3fvzOpPZhqkigl8E2jVwndc0mB/PJXoaCDKktnF/ykkr6OBeNSQIyXmm3cqB2vjLzGNSO/zxbpP5UBYvgDpzZX+/cQiFsUHE/gJtqNstB9zjoJbF5XYM1bvzfMp8+hHY0nAP/H5tom8YHRtYPwncPwPtag0maYGEHYVx3AuKIZjGazo9MwGeX9tvOWpFqV4kBfu8O5WvTl8G4bpz7iOvx8qtF9bEfTfuJDbILTr9XdU5A2EWR8sLaQ5iTUXo3FuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvX94nIt6Ushebm+TMBumijXPGW+xCDBR3BCYJgUfgw=;
 b=XsdP9LzbXrjvcsycD93/O8H+TCioADi11ZkJqQROftQBhVXEx6k5oIAEeYZmB0KYqTCST/v7d0OE4X8qDEKh+G30eSn3ckgCej3j3Rv9gOZFFqw0Cz1gYjCYgCpj0vcAnOhWsTqGiXJpn6s0ueGvI5BOnlT/aW7q+7Pg2u++RoUCIb8/QmiEztij2vY73n2vFTgLQg7KTNOVkwZCmo4raHjIfX/Qo/sPJcOUOLL8LzODQaEsftva96rOAG5SOlmSlcODTFxM2NGbKZhrIFqrWNNrhpzHkkbC3bHxZn7Kh46aIWSMhabMZxdOZEGmxu7UgyDusQRYBHZ6Why5w075xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvX94nIt6Ushebm+TMBumijXPGW+xCDBR3BCYJgUfgw=;
 b=hpGLVXU9xQVJ4SkC3o3myY36mxctpgeQt0EKRBRsw7fIFWK9HfdFPMegSKSs6YzvMAR4AQy9UNP/AQWYHfFXHlMdnJRlg35xDCgK6GENG4+nkO2qJaqh+Mb7xX7ljZIcMlSc+O58uSJi8oEkNOtkxw9Fe5H4TNqCVZKcwfIcGChg91Z+CWoBWiWKYTmrv+vvv9CsYQYFwaLOyWLzAdMjTxdprINwjEYJbzHR4cKGz3HXe8wOy/cUT5TgOhPh7+vE+b8FioKRPQ+MaDb37M5e35dxgEJwfuKsaG1Jg/y/C/ezWFUhmRaWNizTsM+a2iSPWx8/+DdHyV+ZAy82oeWbdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DBAPR08MB5784.eurprd08.prod.outlook.com (2603:10a6:10:1a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 19:20:55 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 19:20:55 +0000
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
Subject: [PATCH v8 06/15] spi: airoha: fix reading/writing of flashes with more than one plane per lun
Date: Fri, 10 Oct 2025 22:20:29 +0300
Message-ID: <20251010192038.1592889-7-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DBAPR08MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ffee499-6329-4e77-1067-08de0832222d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V5q8PgN7FJCNc0lqMlGOVo6el+FY1hjJB7lIDm4l6IP/koJKBGcyhqDzQLwr?=
 =?us-ascii?Q?m1qvkewfrPqyzs6h7TIoCdnR+egtDdP7DS+RFcp8jL4anv63I5BJ3TMcW2ov?=
 =?us-ascii?Q?BRVo0FZUDaqP4pcEOfBQ02v35nDJWbvRjdiEELCGepB4qIIGAiIYreY4SD6f?=
 =?us-ascii?Q?meiq2qgVVhhdfTbLNiyvdiDPDde++BZmomaWKOJYsAgcUoYwPAlmFyAKQDti?=
 =?us-ascii?Q?gbB5ImScAM1mzf+exdcADHG9zIZ+ZjllCDteqxX+eku3jQ3vP962gIIetpNb?=
 =?us-ascii?Q?N+Uz61o9GgskUOUN1jO97SMS6NFMdONgsAC5/IYn1vhJrWRq0v+lFSYn5MnX?=
 =?us-ascii?Q?9fDxA45MEoLkk8BflDfUAQeCibdwN992461k4T+m5aWWNgQAgklwQjGxaheg?=
 =?us-ascii?Q?QMwAFOv1yktq9P0o3vVeVFlsrZ3FSW2+7Xv7721DPA/0KVXw+/lkAZKAiV+g?=
 =?us-ascii?Q?cJ+QpGTVzoXhlbzovwbkXZfMil9Kdg+lb/3YJa13UIdkRoHrQTzj1hsWb3X1?=
 =?us-ascii?Q?j3SCePCG34pUaDU9EgA0qkW2PPdyR16xmpsTrC3ACHm0+s5TVZTsqlmYYt01?=
 =?us-ascii?Q?pzaVkzWvO+uvVW5yPqxKXYPU3+qPdd0iWhHWcLPdb1+Z3Lm3mund2xcr6nkB?=
 =?us-ascii?Q?RKQNPAX6teqJyZbDtOxfpZuK8PS8yDTMXojpwmJLLHJjujLY0Az7NHTelzUm?=
 =?us-ascii?Q?aHsSL/yk/zXlKImAOxubKtyuecfmgjKPokEO+x5vIXt5bhUxHD/jP1CdvfEZ?=
 =?us-ascii?Q?2GuEe//sQJ7kDy5gPbvEqZKnL1JpZQw7HlEIDXv+vGq6xqu5nGc1MFLuaJrk?=
 =?us-ascii?Q?e5ozp2JaOB8Td7lfWpLTfhQowXzbdTowVqy5l54KMmRdpnIvmcr0kXLhx1Vt?=
 =?us-ascii?Q?nT3tAvAB6vNKNiQYSDK92rdYzIajDCpd9h6isJhGYVBYBacjQ9BhgkYrqc/d?=
 =?us-ascii?Q?CwWl/B0GYK2KzYYmd4If6bR0wpf6oK/J07lx7FeKGB6SNvZCwVD/nNItI8ps?=
 =?us-ascii?Q?UqXmmsKPPEtE9CrHyatslX6ZDAHVP/ixFocAs3Fr7H9PdyiyZ94aPFJIXCEQ?=
 =?us-ascii?Q?eCxY4JRzcmCm5dIvExl+XXR5PrvVOcNZWnFfUJPCwt4MHPm4mrjnHaYQMoOh?=
 =?us-ascii?Q?/6EXQ9mSvEplUYeZ6B3hGOfQm7n1COemfJF8rpBl9q8qVrfWvototodaz0Gr?=
 =?us-ascii?Q?BF6oS9h3U2v8aWV6JEEVGN3CgJOvMArel5WPhJw8BuERWI2HFwO+KZD9uhkB?=
 =?us-ascii?Q?46oTgvKzHdpqjp4ysdWE3f81IT7NP97L3Ve1Wb6irFu78CHhOWJFX0+y9Ok6?=
 =?us-ascii?Q?X3DQveRPFoPhD7edAVtQhld2KUfxhXgflrI7v05BmDQn3g8UwJ521/UEUKN0?=
 =?us-ascii?Q?83snFB/wdF5RuQMbNMM6EuJA92yiiML8BuKABprNXRHyEew+0EIGq3x6welv?=
 =?us-ascii?Q?1YKi9HWkQoUnyJUrYKbLBYCBNzuOBUtPx8EB/bl/u9SzkHRun3U9ZR4vnuid?=
 =?us-ascii?Q?675DdiuqZFZvQUPY49acpvwRxvohAPm7B4GbUVffB2MDKbZUY+IOMt3pnA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vlaYSOIwdsrcFLsNr+igO2Qq3wk0vocs5DLFp00jD4bcmoLlYfs6VduXWgAi?=
 =?us-ascii?Q?byfwB9i8IomUWhi8n/iuK2Leaxn1avuSmPRekEupTWdPeQyj0zODA0Ay5oLY?=
 =?us-ascii?Q?VCmQ5NhtHwi9r/Q0pA1IwqBeJzIgYu28JLs8G82g5bctlr8nZr/DOr270OND?=
 =?us-ascii?Q?4zxyIiWh1WBgFNv5YU5njWWDqQga8AOeNgszHwzlyMFyzuU/SLRTL+AJpDwx?=
 =?us-ascii?Q?ERhOEju2/azg0xhlZSxZ+EJqW1Q/syh/+sEv2TrUH1/weK40BVt82AKHWoFW?=
 =?us-ascii?Q?Xl5OwuBV0PdhjvRoO5VW8UPKBanVjei3Ty865TzswXQ84vTQwqrMl6dP/Nzl?=
 =?us-ascii?Q?81W776EMDQq4xFR+dzNIFzgeZLaUZivD8H4q6h8SXCDvs3jT6nyrzd/NouXk?=
 =?us-ascii?Q?cmF8H2x05UJeLur7i89xRKRW76VJZcuoJbiWUDn1kkofAgdjhBN0gWj6DFp7?=
 =?us-ascii?Q?TyPrKCjHo1lBmdWVaMNEccCYjTQCG2hHDWFOGCYOyvN9Papp/HUfZNKiovcL?=
 =?us-ascii?Q?ABY7TO5bh6OJwCxICcfDF5PGfmlaJs9uL9uQ98S8sJLiD6bq8wURIBKIqJHf?=
 =?us-ascii?Q?77jtUt9DJpqI6zHfcRRoa0WKn6JYmKZy3YCgAllxbGY4ZEwJ165K5mS9yvrD?=
 =?us-ascii?Q?B7GDad3NZHcV2VrAEaLzA8VVfdMYN7qSl/duSOyM+WedXKSKagubox2aCk+X?=
 =?us-ascii?Q?GZ4fPP4o6Z8Ef3CHU1eURmJc8raEYTg9VOz4SVXJCb8pN0hSol5mr2mP14KG?=
 =?us-ascii?Q?OnQ4YRMMxDD2A0Mb1BwbIdT9sRfMLMTdhw5kYlyvMuf2naK8y7dI6J5mHSBU?=
 =?us-ascii?Q?1/F+0+wbqWe2Hx/NjDPEiQHVfej/L0Ic4PZqRbhOJkHQ3sINkYlitHIW+vhq?=
 =?us-ascii?Q?BRanJFaR8UDu/bbwH7WBTUhJe4dkFMcydKeB7KCWPqIwJdM61NM7RVdnjf6D?=
 =?us-ascii?Q?jZNf5YTLrxOod7f02/OBQdYVM2MPQr30taCPdTedokbIuQ1pcXd9mcsGrD2X?=
 =?us-ascii?Q?d5Pgai5n5aV2aNVhtPl7+BWnEP3HFEGPeESl4l/vj4XZ6FMLaiU/k591Y8AI?=
 =?us-ascii?Q?Mt+l026KE4funM661WsWjm1HVuVVx0OlGOM89tnCSUccBASDACv3d8BXMG6A?=
 =?us-ascii?Q?W90wAuhJ5T+il4rBMZPGDiQL5Af3xr0xtbsHxqqUruZttZeU7JhKCbjZ9YUI?=
 =?us-ascii?Q?2HbHzmsopPFiuz58sfkwM9WggoRySBpmjU847Jfw60K7ESGerAAO/Dk/Q3ny?=
 =?us-ascii?Q?4JIla5/cjCmGCiGydY1+KPLY0wEI606DBFQefW+zcGosgKHU5neHo7Vl3u1e?=
 =?us-ascii?Q?ZEvI0iDxubeWnZxWxfJby3eIc92No34gsFM2WRinRRmaxTso0ybzftRaWrSn?=
 =?us-ascii?Q?w2BI0+woA9wEh6dlhslM7yJlGg8KfLXeE2fd9JUzZ1UnDyTHH69QB5Fzfyok?=
 =?us-ascii?Q?uPG/z2zqwEnwOQ3eolS7yDPXDWZzPrHekZ3Rjo3Ku3MTO2GZLnC6P7CIsM2n?=
 =?us-ascii?Q?W2s4uIGA4/OO0a8L/T4X9qVXpiu3p6CL+9ymdAUJBuwC50fvC0ls7DG8nblb?=
 =?us-ascii?Q?DNt2NP0ruUd2antcyGVdfmwTfbB0zUHHVLzqQbP8P8q8CKGkCTS/VHE7V8zD?=
 =?us-ascii?Q?7IKojsyeyFTIbmFX4c0dnPE=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffee499-6329-4e77-1067-08de0832222d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 19:20:54.9796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udg9Rz4p5tw7bEnNIvrRb9woPr0vsF/bOO8O1MgqD6pBZXLA4Tmu1DOvh20t+VtCHHhBJJLhH4dT28rvgb7h1AQx8EDvFR747kF6MSdUmNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_122103_246859_A92A2A86 
X-CRM114-Status: GOOD (  15.63  )
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

Attaching UBI on the flash with more than one plane per lun will lead to
the following error:

[    2.980989] spi-nand spi0.0: Micron SPI NAND was found.
[    2.986309] spi-nand spi0.0: 256 MiB, block size: 128 KiB, page size: 2048, OOB size: 128
[    2.994978] 2 fixed-partitions partitions found on MTD device spi0.0
[    3.001350] Creating 2 MTD partitions on "spi0.0":
[    3.006159] 0x000000000000-0x000000020000 : "bl2"
[    3.011663] 0x000000020000-0x000010000000 : "ubi"
...
[    6.391748] ubi0: attaching mtd1
[    6.412545] ubi0 error: ubi_attach: PEB 0 contains corrupted VID header, and the data does not contain all 0xFF
[    6.422677] ubi0 error: ubi_attach: this may be a non-UBI PEB or a severe VID header corruption which requires manual inspection
[    6.434249] Volume identifier header dump:
[    6.438349]     magic     55424923
[    6.441482]     version   1
[    6.444007]     vol_type  0
[    6.446539]     copy_flag 0
[    6.449068]     compat    0
[    6.451594]     vol_id    0
[    6.454120]     lnum      1
[    6.456651]     data_size 4096
[    6.459442]     used_ebs  1061644134
[    6.462748]     data_pad  0
[    6.465274]     sqnum     0
[    6.467805]     hdr_crc   61169820
[    6.470943] Volume identifier header hexdump:
[    6.475308] hexdump of PEB 0 offset 4096, length 126976
[    6.507391] ubi0 warning: ubi_attach: valid VID header but corrupted EC header at PEB 4
[    6.515415] ubi0 error: ubi_compare_lebs: unsupported on-flash UBI format
[    6.522222] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd1, error -22
[    6.529294] UBI error: cannot attach mtd1

Non dirmap reading works good. Looking to spi_mem_no_dirmap_read() code we'll see:

	static ssize_t spi_mem_no_dirmap_read(struct spi_mem_dirmap_desc *desc,
					      u64 offs, size_t len, void *buf)
	{
		struct spi_mem_op op = desc->info.op_tmpl;
		int ret;

// --- see here ---
		op.addr.val = desc->info.offset + offs;
//-----------------
		op.data.buf.in = buf;
		op.data.nbytes = len;
		ret = spi_mem_adjust_op_size(desc->mem, &op);
		if (ret)
		return ret;

		ret = spi_mem_exec_op(desc->mem, &op);
		if (ret)
			return ret;

		return op.data.nbytes;
	}

The similar happens for spi_mem_no_dirmap_write(). Thus the address
passed to the flash should take in the account the value of
desc->info.offset.

This patch fix dirmap reading/writing of flashes with more than one
plane per lun.

Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-airoha-snfi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index a39c3ab4af5c..5ad3180ac6da 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -726,8 +726,9 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	/* set read addr */
-	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_RD_CTL3, 0x0);
+	/* set read addr: zero page offset + descriptor read offset */
+	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_RD_CTL3,
+			   desc->info.offset);
 	if (err)
 		goto error_dma_unmap;
 
@@ -860,7 +861,9 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_PG_CTL2, 0x0);
+	/* set write addr: zero page offset + descriptor write offset */
+	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_PG_CTL2,
+			   desc->info.offset);
 	if (err)
 		goto error_dma_unmap;
 
-- 
2.51.0


