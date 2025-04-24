Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276DFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J9ZIzd9hbAVCYujHJSRFWFzaoPdwapJ/LYnJaf0bMvM=; b=gfdS4vob5pxKZsKkQVFb95KZCw
	s5xACfkFBTOFrD/vbwdJsMgWfjGB5rqRrzWnfwbCA2WafLXLsZstHlr3eZY3Yp9UVUcwCmUj4W8kJ
	YA6tLCuTHXJGaY1vEZGEggkIKI9GqcwXsY0AqG6qgMs3tuw3OUq/wonEQfCOZ45qser6ZAw6sjsv5
	EaTJtf5A+iINln7lnP33443i6bjVcqcxb3jPTqpYft0tJxnWgUAPiMivsQ875tE5pTOWHtTwbx2qz
	CbOddwcoRsjfVzRq8r/gx70HcrOrvg3StiQiTCt5GxHLXT/dezxKPs8LUHUmPtZ3R4PEcSuabqalx
	YlBr3MQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vMQ-0000000DxpM-0GII;
	Thu, 24 Apr 2025 12:07:23 +0000
Received: from mail-westeuropeazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c201::7] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tO3-0000000Db9u-03D8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:00:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrSLfWNirJE+Df8z48EZ5DprHzddB1NUEtuZU+B9kaMPnBe8e181ASkS6duq58/tkpJ8PWbyENXUUp2+/sCa39WIpSEHjcvKSOXvhBbWaYhKYsgS2Qgm/UigU08ASRr8Z6q9cAMBA/g8demWcn6ZF74kIWzh3t8WDpGpCJB3ruqQn4SZScIs9dYWQTZ0G8AGsO8RuZlQLI1SKwPcMC0mg9ZBWPu5aPXgn98rrFsc2dag1g5ZYkShGgnxUmk+kQZYh5Uq0sD0voa12IEep9utW0Z+5nsdxJgeRuCuk1a6wzAeGPIGPj8gqFvQc1/DyJ9BDkH51Oc6EuAyZ9LEv7gO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9ZIzd9hbAVCYujHJSRFWFzaoPdwapJ/LYnJaf0bMvM=;
 b=cynGEME0fGAtDYi7qpTJWSO7o2wjCIrFDqNgWIoSDBBg+r5/IE09OE2q1aniIsqCIAAUWU4ZuMt8cBCLJmrWpgv8mho7IWsEeSBHlHpRJnxQeG1YFAB/47R/LaU8JCpwFGaVbCoM2/HrxheQzBxtUL6u7bY6GpOYDUp/CDtbYrewap04l0ddqB7GS5FKpaVdHOrj3bvLMN9EAFgHfi67WwTO1vkgEKUyuWPC4HF025LgWZmtGIguhUo2kYP2kkRBOlq6t8bRBX+AzxWJzI7zVAALXNs1Sr/b/+5N+M320diWtul8mQO5G2LAH3YZXnqv1J9DTIF1XpIRdV1tJyy+6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9ZIzd9hbAVCYujHJSRFWFzaoPdwapJ/LYnJaf0bMvM=;
 b=gBaJmauJw8vOapdiZ5Z0VG/Apq/2AuH64D4EWYWSA/fTUh63zAm2YK3zRxSHHHCVmUHeZVtgDmsc09gD+Svyszm8tQd7Q1laLKTPf2EiIR4LWzcLPTYnuFVediF7cpC8eORiaGeMhO7NtMk6d5piLKM+oGlQ1d5LNc0Y7Qf0iAO8Gf2a1/hWGSINIUfY3ZnNB5HaZcnIUKoAoMBvqHvTX8D4R/R1QTG6dS5QC6I4oO15R4FCMmrGAZpBEtOIHTRPejSOSL/vUkiKKfnaDVteFq4Gvvvb8h7Y0/PtuBqOuQ1mwRQKY97/rCwlN33y70UkCBhHzAHCC+4DdeDyi0zLVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI1PR03MB3728.eurprd03.prod.outlook.com (2603:10a6:803:30::14)
 by DBBPR03MB6763.eurprd03.prod.outlook.com (2603:10a6:10:201::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Thu, 24 Apr
 2025 10:00:46 +0000
Received: from VI1PR03MB3728.eurprd03.prod.outlook.com
 ([fe80::c7de:54b4:3ebb:88c1]) by VI1PR03MB3728.eurprd03.prod.outlook.com
 ([fe80::c7de:54b4:3ebb:88c1%6]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 10:00:45 +0000
From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Philippe Schenker <philippe.schenker@impulsing.ch>,
	Manuel Traut <manuel.traut@mt.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to usdhc2
Date: Thu, 24 Apr 2025 11:59:14 +0200
Message-ID: <20250424095916.1389731-1-Wojciech.Dubowik@mt.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0081.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::14) To VI1PR03MB3728.eurprd03.prod.outlook.com
 (2603:10a6:803:30::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB3728:EE_|DBBPR03MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a202fe1-cfa5-477e-f483-08dd8316e175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?npDOO9vCr2C6NB7BjfqS7tc3mJMK7tfu48UPJZJPEydyWjt91uwMuNOFQks8?=
 =?us-ascii?Q?TrLx0Riib2mU35C+6lWxXvExB6lCBiuus1K1MIKtzrK9Z89ILK4iODKpoqmU?=
 =?us-ascii?Q?I9ZScRpH0NssMJxbPIR3W8KzZJsZVYZvu5Ka8gXLmpoxF0DQGrahHlC95dKc?=
 =?us-ascii?Q?4juN0csEljCmjz31+T/Vlnoog7PqiF+cviCiA1DY3CgUTo0ynbxehh0X4rMF?=
 =?us-ascii?Q?s0hT+G/aWqLeTBRVS7rQNaZIRWKLK6tYKqTQK/+22C3j3u2GwOleIiDkIeBz?=
 =?us-ascii?Q?4IA/MIPh7KFL3dlqsSlExUUJ6WG853SHmUedofk5pNYyIqwVmuIF0XbANwU6?=
 =?us-ascii?Q?xZeQ6MFObxg2TpiJipMoUlu4GMSRX5o7dJkdBhJb0RtRY5ukbTsodL6VLiho?=
 =?us-ascii?Q?W8YcM+Gcz1FaLLIwyICBlcGTjvaJco0/N0n0w6SfUbD33U5UGfJuZBdwaFmN?=
 =?us-ascii?Q?D/45MpeLpiL8IKZ7LYSr8Pn1QjCEXJhsX3VjawJr3qXODGQyIy8shgQDSn+9?=
 =?us-ascii?Q?7nr2/6z6nlOu9bvhvjRIIPKkKQqUabq56QnOgYNlASC2ydJ+vMZLbHDyCocx?=
 =?us-ascii?Q?4q2PKMlBTLn7L5dO2RCpKu1rboAF8cXoyQpkfW0a2FGmllHksiYjE8gN5XZX?=
 =?us-ascii?Q?jNaq2Y6z1xYzyQcatrjh41bBFzsPBjHiVa+5XgvAjA4tEGUwIsLrtPm4cE65?=
 =?us-ascii?Q?GIKoXq0RgwTviwP7MwrcAt/mD3gaPocHRsKOjiCdAeK5kjCaCyaFYtJDyVL5?=
 =?us-ascii?Q?ErkRcr/ZGN1aP2AT1mEyAHzS8A4F2snY9fvNOTsqOOGLaGXdyATXaq/20ZmJ?=
 =?us-ascii?Q?NCJ0omJ2VZiO5XiKsf0wWCnOipTJV0PRRorJd/rZ1orA7M/uEh1744OC8Zj5?=
 =?us-ascii?Q?1gEoicaTWSL72Id26MUXaGb//t6fPqbF6cl/RA8RF9+5PxBeYN+nssURsba4?=
 =?us-ascii?Q?AD1UiBV1nqcb/LPDIR4gB9+/R5bJuMjesQGawwjCnl4NTmw0oskFStQobM5v?=
 =?us-ascii?Q?XxfvAm1HOyPvjotu9IRmLqqvO+HQYITS5zd1yzm7mOMvhty/v0yl8NLhd7EE?=
 =?us-ascii?Q?cPs6qBbpYqvLSTm0TNwmAXM5eRs1KWslal/nyei+OvuSAnVQZh3pJVwJlyeA?=
 =?us-ascii?Q?NhJKZ6sFruF+pl8KJ/kTOrVMaXqSFLqudqriKuj3BydV65HrJ2R9pYJvU6S+?=
 =?us-ascii?Q?wqGWIaOFtHq3OoiFekQFJbg2eyQIVv8MVS2KDHIf/HjK0K4iIWJuTFvR++Ta?=
 =?us-ascii?Q?hiFmZTn8WFIZ8YqvXLsXJJLZDZgBibmnrlofaVkUYn+0avBP+G7dTa4W10WK?=
 =?us-ascii?Q?Of2VW8jhz/TE+SZJKQ6r1CmlQzsLZbs0AccWuG8j8paSqyUYGjeJkiJeB77a?=
 =?us-ascii?Q?x2K9EyOi5QTJ8Pxt3WklaAH1IfFKHq+Svn0GM4KPTiLBInM4AzfeFa7cTopY?=
 =?us-ascii?Q?GorfhCBYj0rRzjlb5nICsvO5AWfcPJ1Mi/K5wq79xHql5PLK0anQU3R6/Mqp?=
 =?us-ascii?Q?G3wKdjpuABuM8Pw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3728.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UXJ9b8o8eMQiKtH/UvKVleYxIvO4ZNYTd9N56jg1xLJRl9HrFKn8MG6m2CB/?=
 =?us-ascii?Q?RrYOWi8jd1a77AqmIHMANs6T56f9IvRVCwGNnmXjZEtIe73J7j3hEh8KCYiT?=
 =?us-ascii?Q?idwIV9xIzfmoqcFC0SrX52y9hT9+DmnfpuJprFDXw/UMg0gMy6hc5yGft79c?=
 =?us-ascii?Q?CtQqe4DMY3BZmYQZQWJOEHuHZj+lZA/Anpw7kLgDuNMtNVndRxg3SIGYuRtN?=
 =?us-ascii?Q?Oo4beFEDRGyv11Pa1/EJaa7NCB4nRdsYCdPn7xAlyMDPjUdV7fmWjyhoGAuD?=
 =?us-ascii?Q?tSZFrCH7ovVYl1w9HASg1b5rn4XxF7CilsXyzOLV0DkRG45phLprfBfPxTWG?=
 =?us-ascii?Q?0QfT2mLHCdO0QoES/kI2B5s4Fzl0FRbimOnuN1/rda16WIJHmYCcAvtR4WxC?=
 =?us-ascii?Q?nedK/gqLy9QjcKYeK2b801mq85NZ8exfz3TKjIEZeDKKy3J3bRu2RLrE+GNe?=
 =?us-ascii?Q?WgbQ9fiKSOcO/pND3a7sMool48okJt+Xim/2dFFKpefWG3mpSFdR9YV82WXb?=
 =?us-ascii?Q?D3RccJoLYn7rOmEiY74Fdlf+jzPAqGxVP7hfH6nC7m3toOPpj9YGx21BPsXX?=
 =?us-ascii?Q?HGZcQ6PVWEHPEW9wuWxlsf25B4Kh25yi0mnXoGxY3KyzX9QeG8455M/nilt/?=
 =?us-ascii?Q?yxad4IQhtI5OFk/hN2eBm/lndc3WAlYnxHAFOBTj18tVhzKSE1jJW9ibBs2O?=
 =?us-ascii?Q?7r4wqkK3Hsih76E/RGq26Ek5mgpC+EoZQO6Cbqkzf0DtptP4ypAkL0i9yQM3?=
 =?us-ascii?Q?2BBBk/IPz3QJhufWN0gq6XB6WNZdE04NmpLHxxYOCWadkZZYt7qOEO8iCw6s?=
 =?us-ascii?Q?HJmVZJ96H5zcwFkuDa1JJi/AzgRrAGNShSQD7vVxd4PeKyk2UY31wbGOE+uo?=
 =?us-ascii?Q?Q/ojVvCzvy5et6eWDMRfGLgq7GaFTfEGKJ70RmHhVNtn5c81N3Tzq7kb4/tk?=
 =?us-ascii?Q?KYNI3F/wTnuppjmmy/F5lobeHJc6zG/IxMtxjmJ2hY9Bhn1xUA2/XkqMmlqc?=
 =?us-ascii?Q?yMzW/EBGvgIKJgUpxrN0nSsXyNU3zZi6Sb/9VqiXKeYXBrI7hBAOD/Wruvkj?=
 =?us-ascii?Q?WVxsHGKaHdJBcNDjfvZ2lui3SowrI/U0+nXZ5qBCy/V31qBbZFlhd9f/PSOQ?=
 =?us-ascii?Q?o5QAQNpweda949yztdMh0w3ZJNC5zG6i6nsVMQ+NqfOUttlQXew4lLgv9JU6?=
 =?us-ascii?Q?4XE72dc6Uys1r/ULej/x3yy+XjQNTBSoLlbVMJgcVo7GkXVcjPaaaSRy4eDm?=
 =?us-ascii?Q?6HdMRAnfeyOfyJqaSGJxF/7LC+SByFhNqkIe6amYGxKibCsgOsiX357tadTb?=
 =?us-ascii?Q?3bPLLgDX2A9pHLr9reVDWB6xtZY0NC9g1h7Bs1peolT1zM8tnIIJRlbBIZVm?=
 =?us-ascii?Q?+3ARga61ygqlxZjSqJlxT2W3V7iQTPGo9P0EaQ5AJ/NnQBrwm6QAw0AePzYa?=
 =?us-ascii?Q?HwpUNvb907DkPeiqJDLnl3BKT9jc5JzZCKa4wBAMCCUNA8LxVjjr0nN0StS6?=
 =?us-ascii?Q?vK57MYT3yeDs3ujPL6IWKEFnKvgXDIoQYMSSsIY+0bqZSPn34Ukn/dF3gy5e?=
 =?us-ascii?Q?hAlSeT49W5dtMq2PypT5Sx7vLiPKElYisg+6X9tR?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a202fe1-cfa5-477e-f483-08dd8316e175
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3728.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 10:00:45.2824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9tx79BPcIsKSYiKM5KoF6JSpP+/GO5XlFw4G7LVVCGNF05cytrAYC28g+zo8k93FSqMQTO3flDJ8iPNRjbKfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6763
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_030056_080692_2C37C985 
X-CRM114-Status: GOOD (  11.42  )
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

Define vqmmc regulator-gpio for usdhc2 with vin-supply
coming from LDO5.

Without this definition LDO5 will be powered down, disabling
SD card after bootup. This has been introduced in commit
f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5").

Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")
Tested-by: Manuel Traut <manuel.traut@mt.com>
Reviewed-by: Philippe Schenker <philippe.schenker@impulsing.ch>
Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: stable@vger.kernel.org
Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
---
v1 -> v2: https://lore.kernel.org/all/20250417112012.785420-1-Wojciech.Dubowik@mt.com/
 - define gpio regulator for LDO5 vin controlled by vselect signal
v2 -> v3: https://lore.kernel.org/all/20250422130127.GA238494@francesco-nb/
 - specify vselect as gpio
v3 -> v4: https://lore.kernel.org/all/84dc6fdf295902044d49cafc4479eb75477bba5c.camel@impulsing.ch/
 - add reviewed and tested by tags and changed fixes
---
 .../boot/dts/freescale/imx8mm-verdin.dtsi     | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 7251ad3a0017..b46566f3ce20 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -144,6 +144,19 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		startup-delay-us = <20000>;
 	};
 
+	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
+		compatible = "regulator-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usdhc2_vsel>;
+		gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		states = <1800000 0x1>,
+			 <3300000 0x0>;
+		regulator-name = "PMIC_USDHC_VSELECT";
+		vin-supply = <&reg_nvcc_sd>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -269,7 +282,7 @@ &gpio1 {
 			  "SODIMM_19",
 			  "",
 			  "",
-			  "",
+			  "PMIC_USDHC_VSELECT",
 			  "",
 			  "",
 			  "",
@@ -785,6 +798,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_cd>;
 	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_cd_sleep>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&reg_usdhc2_vqmmc>;
 };
 
 &wdog1 {
@@ -1206,13 +1220,17 @@ pinctrl_usdhc2_pwr_en: usdhc2pwrengrp {
 			<MX8MM_IOMUXC_NAND_CLE_GPIO3_IO5		0x6>;	/* SODIMM 76 */
 	};
 
+	pinctrl_usdhc2_vsel: usdhc2vselgrp {
+		fsl,pins =
+			<MX8MM_IOMUXC_GPIO1_IO04_GPIO1_IO4	0x10>; /* PMIC_USDHC_VSELECT */
+	};
+
 	/*
 	 * Note: Due to ERR050080 we use discrete external on-module resistors pulling-up to the
 	 * on-module +V3.3_1.8_SD (LDO5) rail and explicitly disable the internal pull-ups here.
 	 */
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins =
-			<MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x10>,
 			<MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x90>,	/* SODIMM 78 */
 			<MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x90>,	/* SODIMM 74 */
 			<MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x90>,	/* SODIMM 80 */
@@ -1223,7 +1241,6 @@ pinctrl_usdhc2: usdhc2grp {
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins =
-			<MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x10>,
 			<MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x94>,
 			<MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x94>,
 			<MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x94>,
@@ -1234,7 +1251,6 @@ pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins =
-			<MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x10>,
 			<MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x96>,
 			<MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x96>,
 			<MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x96>,
@@ -1246,7 +1262,6 @@ pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 	/* Avoid backfeeding with removed card power */
 	pinctrl_usdhc2_sleep: usdhc2slpgrp {
 		fsl,pins =
-			<MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x0>,
 			<MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x0>,
 			<MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x0>,
 			<MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x0>,
-- 
2.47.2


