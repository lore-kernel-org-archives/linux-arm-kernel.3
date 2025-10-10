Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A377CCD18C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 03:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvX94nIt6Ushebm+TMBumijXPGW+xCDBR3BCYJgUfgw=; b=imO9iIvfxet0SeBeJUOtAZ+0xq
	OhPEiuIeE0XiL51wluBQIapdcPJtMlMm45k2DIaII7DIn/cK1RolfQx9mEbCcS0LVo4HF5nI/EHE4
	BzoNl9CWdKA0VL1g0akESQ9uX54e2g0xYe83RxWW4ZJNm2G44K2VfsuIRFzeHljiCk3CC5S+SzqLH
	ufHzCiUbGg9+CaMkRzATgnsTJ0KM/Xrf7KuXnQr208iXMPZMlPWqSoVVIVLaAc4r4FkT5L32EHxdr
	0u+oiexUAzJvdUgO5hrqFtO6NG7mmlCwODGpfJLEK+wV7vCtWkeJNoZqvk1fko6rLACTj+8F+u8pE
	Z4YA7NjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73rX-00000007ZXv-3XJC;
	Fri, 10 Oct 2025 03:32:11 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73rQ-00000007ZGa-2ZDJ;
	Fri, 10 Oct 2025 03:32:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GeAMWXqULTgUeviZNWgHPCtbDUkDQv+5HHcQWvT5cpHOJDqotd8C24Pk+GSLF1OUuhLGWRGkoHSD5iKYn1ktmZTMJDWFCmp4tKMiwHxVoUVSgSsSH3ZlhwzwnjL1cCqUokiAr/SAwGjvPkxBJoCT+LtrFdTmkSdCLcTtgt+/6j/CEI9H3A8rRwItgd7pwSzb7QI5fzfAQSncRz2HIF4TowfBpfUyG+wiakVzzVnvT+idtGbVOvCNqYvFaaOq5+ryQf/uOiELyFK52GOAPXjlKjEGxja8VAl6M5IsCc0jZlInm3Q7/1H5ZHmC6FKu9iT8URoGGsFbZXZ+o0vPvqTWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvX94nIt6Ushebm+TMBumijXPGW+xCDBR3BCYJgUfgw=;
 b=PiDIr9sf9/3QfLbkndnXjTLqDqKKcMTRfJgCXnloQ8SfKVuFnOUc171gHeOff+gofKXCLoQFVRxG9y+G4krzWD4TYjS9T4qDTYwZ18cgx7/fbDOpq9OuIl7zK9ie1EQhD0UbfMyb+lmICIQLehzu/eHnl9Vsw648YP2aBINLHRH69UGKmN7B0uGhLtVwfb8iDGmBQumz6TU1LyT25+wgkxx885i6etBHAgtffC6Whi3qyP3RKCXSfSEd7Ffk+tc9hPcqk3YqgY4QrFzbpiNFc84Jtwqx7kOB3voUHzNQHKMZU/pEJ5lBflKimZv/MO1QSk+aX2RLNzL9CjfRngEUuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvX94nIt6Ushebm+TMBumijXPGW+xCDBR3BCYJgUfgw=;
 b=A1Tw4a4MITKXno9zQEOoD2h3gpgtHeVAjbchDUO/UjhK6iTEGhSi6ITN8BeqLxbfqmGLVWBB5/6z57BKAc5uz3rGnSUTMF50toN6ixgDpuidk2iCl58WFtZ2pddfjM6Mc6lJiJ3MpK7EzJ0+t9cBgoxUUPjvmHTq+SBF6QXiyZV2h7r33R8pKlb9OM0/PZ/PqwkfXBeIotOXyK9XthZS/4Kj3v0E6mAPJzo/5WBh0gG2ctO7iwP5KlA8v8Wk0vb+Xwc3fEMrAEC7d+JU43RwDPlLmUkM6sqLj4vF5F695WdganTD5e35ladlaZmnx15gnfBvDMuPEbyfZNm4bnUunw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DB9PR08MB8359.eurprd08.prod.outlook.com (2603:10a6:10:3d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 03:31:55 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 03:31:55 +0000
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
Subject: [PATCH v7 06/17] spi: airoha: fix reading/writing of flashes with more than one plane per lun
Date: Fri, 10 Oct 2025 06:31:25 +0300
Message-ID: <20251010033136.1475673-7-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 6ad44988-8cee-4202-61db-08de07ad8f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kf7Sc8YzA6eeHLHjEYfccGtv1rqcExmVviedCfmWbgOzNCJCPdD+dG6vNBRe?=
 =?us-ascii?Q?B6GNY+81ixvFDRkKuWp9ykmdNDURWj3ZR033wGPligwuqmGKOL4S2+u3xnPk?=
 =?us-ascii?Q?sMSWVI6hYmEKaDWJcukrB7VBXwzgb4S338V+ei+e1LSEaF+a4z+S9iGrNfQS?=
 =?us-ascii?Q?HpBr8G7IGfK4I3To74sywGMrPL/4uoYpwqrwfTCHjL0G9eBJME44YLjUaNsh?=
 =?us-ascii?Q?7UNWwvwMWsg3DL/uNceq0Y3VG4VE8CORSg3w8CSgcrU4lomlkji/jsQhYnZG?=
 =?us-ascii?Q?26FzoSRXPdDs8OlDpitHAI9nCzAkLDEZ/PFAcvO3Ty1bK0pkOp163f2YROr7?=
 =?us-ascii?Q?alSSKtDqdyGroU8he8Wz7I7uSfK2a3t1dvnYF8+QERrzVjFGFPIWmO/W8WBa?=
 =?us-ascii?Q?usFyodJ0peGEKkZpIXfqhAGtT+9wWXc9KwTCFfCv/+wTjNgO7AdFQIlMjXTz?=
 =?us-ascii?Q?G2+/C+kyGQ2nTO8nHClEoscK7L59DLIQbWep4mHLJ5h3+M7O/mWJJ1Ku+NzA?=
 =?us-ascii?Q?vQa9k9f0X9L7FCmszf8rN/H+mAHsIuRaQjPv9HJKfDXFspuiDHrtW5EVEsoB?=
 =?us-ascii?Q?YLeEZui11DpQUTXU1y3jxnb6Eu1Y644c/qD5H6DqVeeLxQm1lm+DHLz66//+?=
 =?us-ascii?Q?0aHrgOjDomFWTrAjbSfD7lT27CY9iYWOxhCYcTxzE4SMHa8QcBhwl2X+ly+o?=
 =?us-ascii?Q?Xb7BOjL/WyqW0ymPAD8cx37UtolcfHgJ7Y9g+vCrdz7kWWeZ5jXhzf+JcF96?=
 =?us-ascii?Q?N/ubffnFizkvR6mrT/7IbzF6RCuOSf/oRePc16kyx1XZGMODbNKfOaMawmt4?=
 =?us-ascii?Q?ktIW9Aei8hvhQRdLmKL7rOrd6W1hRmOfx8msRSHSVhiEdKNgwE7PzgSLGfkR?=
 =?us-ascii?Q?XE6YRoG9+3dDlt70qU/vZcm9faTwN3MEob2HXgMpryAQ3Z/9H7QLylqdyjKg?=
 =?us-ascii?Q?qD+pDHIQyctNX3/Sb4BOe5EfQNPbKvCjU+yrt96jsRRABiNc5Ch3WzIksbkI?=
 =?us-ascii?Q?Wc9jFIwev88iDIDoMOIgCRhhtMtv5dsQaQdStw1/rEvmbU6uRCf85cx9+51S?=
 =?us-ascii?Q?iymyHauvscCXMMu+8vONZqOZJEufOAXfBBdCvgcTROmWNOAQn35RJZy8d1CV?=
 =?us-ascii?Q?zZOgceHpRHKt3c5SseGMFC7RudT4mc1/c3VFNFYPAV8RwrAOdx6VLAMt4rGl?=
 =?us-ascii?Q?ji14vG9nGPRJHNBTS1mDsLoJPIB6U0oxOwicIXAP3jVhwIFd6Bpt2TLLuOv4?=
 =?us-ascii?Q?AStmcpoyuLpRzNgA1eP5LUtOSfTRC88f94Rb5Z5+G7pS9uGileRUSgTCpAVz?=
 =?us-ascii?Q?Xgro/rpbkZ8bLT59fE+iCo6dkJFnm8MdS/mq8tTEh4dqJRdsR/J+vY8naWF8?=
 =?us-ascii?Q?h8FYS7xo3d1L/Zi0HqabxdRhh7yHSvNxUoLJaz1hkb97z7m45NnSupvIX8nv?=
 =?us-ascii?Q?xBDa+K8g5nVxX0hamFFoG/OZke9XnL+IeIVqQcy/LA07X9QyK+JOZ3Xd/LcF?=
 =?us-ascii?Q?B2Fy4czeAFowMvp2wCNG01Z61em+G+PLc2yHt/Yr/Wz+dyZELSs2AgSXAw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vQR6SFC6EAUCw73Fq6Qwp8I/UWwVTl8QKj9lYBPdD/zYDhPK5aZBGMLSyv9l?=
 =?us-ascii?Q?vGByx97t15QrJzXaedV6VbsRdepvYy9qvpCuBKqGkVDgJgTCsSosvn3dStKB?=
 =?us-ascii?Q?KUMHQrK+1q+UA/rzdbdSZ3dBBlST8wpjDAsuWlDandkaiHuV02CuwLKVb9eb?=
 =?us-ascii?Q?+e7qba8n6PtXZr+QhGn6hbxTZdyk7jymXype1RP8YEnt+YfKTv8ZgYYGpNQX?=
 =?us-ascii?Q?BLlqKHoHqa8NVX8wiD4aoFnWvPdu2nXdNUoWPyrvDZ1UR/dSqCGBk/ERDxEe?=
 =?us-ascii?Q?Kw2GuKi/ggRADICWSvXzu52a8AnJqmzZoQHrSjvsHuBvhbMR84NScnjRHtIP?=
 =?us-ascii?Q?y87l9wne1+AY+QLkjDe+BLaNN1LG3DUDtM5zrZyC8CaCqnZoMySLup0gmFbr?=
 =?us-ascii?Q?s5m8ygSzh7jA0uX/xiydVds3LBALOHfa8QGbPr1rb7lOFKcM5feus+GydwOD?=
 =?us-ascii?Q?+F3Mcb7HSYqsbVJyN+sVjxaHsUpuc+XDFMW8Jktm4yPeC71CTxoM0FeuNCO8?=
 =?us-ascii?Q?TjALhpxfzTOu6/CkTrtl7o7kadZoPUGV4sNdm2Pai8WM1TLvn/dG+JWcMh+g?=
 =?us-ascii?Q?r7zv/7X35o1ctfWrZ1QpfOmV+c01jV+pkKrnN+TWOt8gVe/acpexyTTOUOCY?=
 =?us-ascii?Q?teGnVCxC1pOaDe+2JI+BQcndPW2h8jN90J6XOxsQQpMUq/dEhJ0NXlzQuoX+?=
 =?us-ascii?Q?5TNDzkRSk09TAyX6cJpRdIuXnCPU9T10OWm4AntPqtUA5TvT71DKIMd1kCaP?=
 =?us-ascii?Q?ukbM2d7qaOqrv7/GfKErMz/UzBC/8qgIrdEap7sKnA/Jr9S26frHwKQljBT3?=
 =?us-ascii?Q?d7HTfqsDgWRyNPxD9J0BBbLzryqzr2KZbU/59eoQ/JZWG8DCQs8Ejza0hMb3?=
 =?us-ascii?Q?rfIxC7rrVMnEipQ7Tes0WGqnbvyesejmOR4hXNS6F3op5IdUEo/OHt9mku+H?=
 =?us-ascii?Q?JJPtyvicH6eB3S8mVWCpqcOyfNGuonUkMxwGO1XVCSEw0Yk64TkPc1tmaugu?=
 =?us-ascii?Q?p9lyBccA+gElWfN2kolzdJj/txgFv8B3xmf2XT/4w9E2g+h3SIRkRjjhbJO4?=
 =?us-ascii?Q?sPClo8GusEdkecVXlosO3LsxjjYwBezlgub5TG7kqasRCw8jqlIsgofHUC95?=
 =?us-ascii?Q?OAitBzZhHQ3OrfVpnB4DDJbsBAg6jQLRv7TZbiPWeg60u6seZGCBjD7tpWej?=
 =?us-ascii?Q?T98WFjK6u2bUhbeNJ9qSflNagjrgxbUStOT7VPNNbRcAEaKHYj7p2eWgaWxA?=
 =?us-ascii?Q?E6b0NNUIDWFk1kIa4mC6oTNzVCUMfW25ZRTN5IBP3tXLWq6I4NsXtNuR6121?=
 =?us-ascii?Q?ZsCX5RPiPZMAf6D2Dvhg+wmPYwHOty8CutKI//p4iJwGZL9zEpnR7vWgHdxt?=
 =?us-ascii?Q?LIi/kRA8prp+GoEG93UwRcdiYZ5xSjuJuWuzY1V2m0hP7hyFlC2dpxmr9V6A?=
 =?us-ascii?Q?SzHBCLc5IR9m9/v5HTB7wuc1Jm/vEuxVYuzWyVlp2czbtOyX6wSBLcdv1tYI?=
 =?us-ascii?Q?ko4TDzpg6dbRnN1mqkWMP23Ilg7zaPiWU8j0yVJeKoKUg1GgPHP3zEBHfIw+?=
 =?us-ascii?Q?GCxptjRIn5b6sdLn3TW8EZB/Dd5jJxNJ28BkAGq5/xKpdeIBU49BsuvIy4Ub?=
 =?us-ascii?Q?AAdOFLMKODJHV5OKz9wS/Uw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad44988-8cee-4202-61db-08de07ad8f45
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 03:31:54.9523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6S5qFmHLkEUvB16sUPTyioYOwqSqOzJHq3pwaKjiyORnuxvZpWYaVnxFYynKk3X2b9dH6Ka3D5ICiZstyvj8kH59yf1MaN53HRvalKxZqRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_203204_660387_504829C0 
X-CRM114-Status: GOOD (  15.49  )
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


