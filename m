Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E47CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 18:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+bjb8pBuGzZ0gB+ramnibklBUi8/zdxzYrcccrO2/A=; b=lX4GuMojtrCA99gtd1MAt9y+d7
	0E/iBJ8aRUL0Zry/xpCQxeCSvefknJ3eIHdb3tnNaXUpir4WhhoezPTHRQY17sbfjV/8KRYmEieS3
	J0JBqmcI/Ro9dNAJslrrgkOBD2f1yGi3eumx7cq1u+c2XGnr9WOwUEFEB0NnXoDS/LzUW62oXxRYf
	ySSIOAk2IzFf1dWhGEJbAjQ0fN4M/8X26m2PtvGjB/QkIX+p7yazXOTBUsMOO+pjNDDKhqPA4wYEM
	hf29JJXucfz5QIi8jOB9RnH8cwyuRcg0sc50rCHNjeBSs9D6w74LTHlkaNTZYFNRQC3y1OGxb0sw3
	kR8By8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTd6-0000000Dcvj-15xp;
	Tue, 02 Jun 2026 18:14:20 +0000
Received: from mail-francesouthazon11011012.outbound.protection.outlook.com ([40.107.130.12] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTd4-0000000DcvN-02jf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 18:14:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZBfKlwfLbWymb25yyu2u1XZLXdSVpd/hz0i1UjJ9Ot+FeVf3erT0hbUls5Bi7uDthEyc3iP2d9CY0lad/cY1IASzhcAVNjNl732S23FLDrtUA6rGfdxh6ukP1xfF8DtFwM4AtTxmr3ZKTAdnmDUCUMIzwRZA6k4Z1gcJ5PYimSgVuVzUAi7EpWVz7FouhFV2g56Eu/zpTBZA+4aBcOYUb8yoQcTBwH+KaZ4rmZ9VlFrYzu0yIEUoPXd5Ps1JddBFov9bmM0dZVkdd2EF046jTPQ3azkZS+TZeURqHOdOucrfkzfbAnvQWEtu+jLE7kwdhAAs95OiIbdPEW1byMB0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+bjb8pBuGzZ0gB+ramnibklBUi8/zdxzYrcccrO2/A=;
 b=DjE9w11SnRdM3KYJ3v0WpQFxeTUIWMSTv89DKx5uJsiDE6VQ3OeiFOieWeWye6QdwJ5n9Qj/cg0rKFZlcFhmAgJrUwYYc5onnuH2D9vHO4eUk3c1OweSy0gcDrWZE6HI2+f2+0U0bQ08Hy8gdIvF4Qa/NzLQByLzIiNEltcqWFJGMvcsCLvyw0VFgOaCz2LLqznT0Uyc4ZqM09Q8IJS47V84nZ4r8b8fPHykHEg9wHb/JjOeZYNQ2TcsrIJ996ZTnJDr9r3znOKWtZ1naQwYXV58AqHr6F0dtejkLjNzLIJdW9fYm/iQVrlsxe2zT5ZNQPs9CpfD7lZEdv+JiTVufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+bjb8pBuGzZ0gB+ramnibklBUi8/zdxzYrcccrO2/A=;
 b=I9UcJWrISeTGSb27Vdu2MunMlfU8OZ8KTSnNYoTE6DewkUflYdxT+xNpCo4ux+YOJOTxL3wx5u8ySwWtVRiyZl/u7dSQ0FBvjJphhxjVgt1PmCVnOvNvlK7ztim+bTHUTYoQbpQcTM2YIJe7CUaXS2kTY4K2ArT5uGXfk/q3azACplHUvCKxE9eWbo2Ne681xGenEpOjZMsdY/MxPeDG2zg2nE730TkXi6vJpJ9lrBAPU5X2XIW3p+gXmScW5CpA/Q070aFuz33kBmLbJiSp+jbDEHdsN7HRN7jmw52gWtO1t5T08DiIcyCtuO+YTeaw568vLcl+I6pvAs1mpf2rQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10359.eurprd04.prod.outlook.com (2603:10a6:102:449::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 18:14:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 18:14:12 +0000
From: Frank.Li@oss.nxp.com
To: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] ARM: dts: imx7: add nvmem-layout
Date: Tue,  2 Jun 2026 14:13:57 -0400
Message-ID: <178042191833.3444635.17578938563345180383.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527093719.160777-1-Alexander.Feilke@ew.tq-group.com>
References: <20260527093719.160777-1-Alexander.Feilke@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10359:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d132ee-80ac-4523-e933-08dec0d2bf7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: vy5IhBwqBVv6G6QfobhypOn6NWaMssLpxIsGoh4evDHLal5DJG6Zq1xwyGG4XpzDLEXILb6iI8NSuYLmnMegrm3JlOYa4PNkgaqKPgdAZB0aJ3MjDzF8gA3anLcyiY1C1bRNmmdoiSoPUkS/Jf0rshZy8dGrpxMBWEH6t1cGKFXZYLsBKyj5nxG0dDjC1ynm3L7pB34SBo/gqQaZL+wg3aPkEeWVHAh80VcEyvISKitKDBcrzuelvaw6wWFH/UP32f/0Mt1x/EYLPE/mnU1xQl+2ORK/8atc2d7sBF2zZfJU0t6U1sUfTI2lMiABr5u6c88hACKcghbcXL58n6qxh671sPlkkjEK821elb9Tw/wY1Gm50ox691QB+rUhwmkFyir0aQi/LKc76gD230nn8rW7/651hysV6lZKY9kyjmNIUxhTHafn1SwdiaW+oZHYWcDA4BbLjBvh0Y18eGATQwIc396Q6D+fZF5wdPuSAoOuWUJU8C0s290QzV4/tEpXhMUkM+Zf+D8FMUgLOfYzkdsC+dPp08FkW/TKaFSsYc3gigAs6w2T+l0WZHTXOZWyZ09FBjmWDRPzb3NjyP1s9gAHRjeoYMTOiO9bzv4yqoXprpLpzD5ENLCBjAEpO1cbUKPTjokpImZgbm6EOJXz6AA6ipR/q4VhP3ZV25dvgklXEFXxr/SGNjukRIWyy+Pd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ny9GRFY3NTQ3aGJjQXpDaEpYb29YU0ZaWmV2Mk1USEVRSDdsTlN6dTJlM3ZN?=
 =?utf-8?B?Q0IyYmNXUkovK09OS0FTSHlLOHVzbmtBaXZOR0pnbktvMTFtK3p6YmlWdW5Y?=
 =?utf-8?B?cXBBcTdybm96aUxQUG9BVjBkeFpWTWpYM2M0ZThlWXh0cXlSb0g2V2dNQkt5?=
 =?utf-8?B?bXJneTZOSlNrTHZ3NWx6WGRWbnlMVnVPMjdRejdENngwdEpKdHlWaHgxNCt3?=
 =?utf-8?B?OXRiTFBTbzI0cE1KNHExblA1aTk1Vm9SSTVnd2NrVmhhWkJzMjRjRHJqbktY?=
 =?utf-8?B?QlFDMUtkdE5HclhxR3pUL1FhNjR6L2xXOFl1K21KVkg1ZGpCRU9jcGxjT09q?=
 =?utf-8?B?TlVVZUdCajZzcWtidFNMU29lcWFyenNjSWp2TC9jSUdGc21udWEvN3FSZnFW?=
 =?utf-8?B?VGpaVGo2WW1zdnI1alFmRS9PbisvY2p6bFk0RURsVEk0R3hmKzgrYTJ0Sld4?=
 =?utf-8?B?UXVLRU1KY2VWT2lpNkNaMHJhejhiVGxtbUZ0a3ZieHErZXozTWptYnNPOHQw?=
 =?utf-8?B?WWQwNFZhbjdlYXNEZnd3dEpCSkNZaVU3QmZIYkRDWGxydTlIam9RQVMwUkZu?=
 =?utf-8?B?aitmckc4aVM1WmFpSC9oSUxMOXNPNm5SNzRNSmxXRXFaMWxreWJUZS9sNC9X?=
 =?utf-8?B?RDJwcDNOTnBzaExUOWI4Z1g0MWZ3Q2FiVTBIanpnWVExNDR4UllSTHRVSU5k?=
 =?utf-8?B?S3hXU2xWazZrZTV1SHZRY3h4M211RXVqRjJrb0hBSGNYM1J6bmxMbE9SaWRK?=
 =?utf-8?B?YUVuSTc5dmRZdjM0SlN0Y3lCemJIYzhhbzdGVG14eFpsaGdhd2ZpOHJERDBI?=
 =?utf-8?B?Q09tZXpjWDk4K1lmeks0N0RWVUw5RmZYaVZLZmZqSFZKSFJmTEpqajRNcjN0?=
 =?utf-8?B?N2ExWktUSEhXY1kwTGhSem0wMU1rS21kS1lzaEF0VW81Qmc5Nzg0TFl0eXFx?=
 =?utf-8?B?YTIwWkU5RU1JSjFPemJ3VnNiMnRPYk1IVERrRS81Sk91bWtwaGVjTU1JSWE0?=
 =?utf-8?B?cXljR0ZzUmR2bHExZjdrSzRjeFlRbzFNVkIraEdJYk5wSzkyektRdnIyMUpS?=
 =?utf-8?B?b21XRU02R1R1bmFybldsVklUbnd3cUlvMlZURVFNVXQ2R212d1ZVUTFhaitT?=
 =?utf-8?B?aGszUTFHaG5xdzVZbDNUaTZJdE9TaTkvcjBpNXlidTM5NDExRkxVN3Z2ZC8y?=
 =?utf-8?B?QjVLSkx6KzhjNy9mQmRZenFXbU5pTS9uaTBLTnMraktMQ2xmY0tiUlZpclI0?=
 =?utf-8?B?VzlGNU9nT3BydHArQVhGeFhrZ3ZBSTFJY2ljMXM4WDRpMlkrM3YvdFl3dk9m?=
 =?utf-8?B?WWc4K3lLdkJMVmZzRVZjSjZ0RWkydkFjdFBmREdub3EwWi9WT2t2dW0xT3Iv?=
 =?utf-8?B?WDhiZVNRUTArbnVlSjZaN2pydmEyVS95bmNGYm5wMmwyS1hZZ3JoWEkzKzhh?=
 =?utf-8?B?aVFNRjhLanpWL3NKamJTRnc4U1FuUVYxZEFUbUNzMUZRa2xrek5IZVlkb1dx?=
 =?utf-8?B?cUVKZ280djZrdDhmaDlmd3NaYitYT3FyMWxQdCt6RXdFbm5YQXZibnpFRE9F?=
 =?utf-8?B?bWNDQndVcmxYbUJBVWZERFdTOEtTd2hZL2duUkVSa3ZOSzZrNGIvN005OWZG?=
 =?utf-8?B?TDZ1UnZob0ZOUTBhT1hNYnYvQ0l4ZERGRmpxaVlwSjZGQ2xvbDNIMnRJMnli?=
 =?utf-8?B?VnJFajUvNUIreTROQnFmS2FFYVlVL2pkdENkSHkyV0tIU3B5L0h2blp2Z0RI?=
 =?utf-8?B?R2thOXBiZ2hkeDgwc1JFc2IxWWZScklHSkZZRmFjRGViZ0RMdkgwNkJoVnhy?=
 =?utf-8?B?NkNqL1gwUFdIT3FMOGtHelJ6SXRRU1g0djFockRGK3NTYXZmTW9hRHZ3eDZp?=
 =?utf-8?B?WG5mbjg2Yk41SE5iT2dJQ01xUlkxQWlJcFZFL3pmK3BVeEs4UkFTajVmYU4v?=
 =?utf-8?B?cjFLMmlIS1dsMjhvRWtoNmx0UXl1S1FIbU1VT2QzL2laYU8zME5VTTh0YzNH?=
 =?utf-8?B?ZGRiTEsvM01vSGsxQXgxRFRYWVlSdW1ZaUZVV1pCdzByNGZYQWhXcU96eHE3?=
 =?utf-8?B?NWxZMjVjVWk1ZXlvZWUxcUxWbTJXV3ZiNDdvNW5rK1hwVWc5akFTN0NPSGFt?=
 =?utf-8?B?NkN4YjlZVkpsZzFsejBsUFlZUkJlTWRVYS9hbzFzMGdGY2lvV2lPb1A3YVcz?=
 =?utf-8?B?RkhBaGVNd0dhd2dsWW8rdTQ1Qndid1psMUFlRkV0bUovMm9VZ1ZBWjlqZzJq?=
 =?utf-8?B?RW9oYnJ0azZTUkN4S25sdVhjYS9IZnNBWXlxWXNYTjZjcnZXTFRZUDZqQlNK?=
 =?utf-8?B?QTN6WUZlcmlibndjVUQwVlN3Qk94WldtNjRyYXhLdlVvNzdMZWhxZm1BQnNY?=
 =?utf-8?Q?KX8Y61yC/77psR0vRMGONjhG6U9i76KzdBXHW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d132ee-80ac-4523-e933-08dec0d2bf7a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 18:14:12.3688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcM08XYZ8rDuLji+LnsJNAz7G/UDzuY/5BAcz2+1BnJrXQfRNHW5TNnwGr25qE6mpVvwEJk3k3y4NUcfFbk/laSmDDD2AGk94JzxdVJy8oOaCLjoAVWW1d84jgwh7B24
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_111418_048534_5502014B 
X-CRM114-Status: UNSURE (   7.30  )
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
Message-ID: <20260602181357.odh0pT1u_seYoSxpn9qEHaSP9itXA8YomFjimJ142q0@z>

From: Frank Li <Frank.Li@nxp.com>


On Wed, 27 May 2026 11:37:17 +0200, Alexander Feilke wrote:
> TQMa7 has board-information located in EEPROM at offset 0x20.
> Add necessary nodes and properties for nvmem cell.

Applied, thanks!

[1/1] ARM: dts: imx7: add nvmem-layout
      commit: da6662e9933880124ff6e8eea73e73a775d9ac65

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

