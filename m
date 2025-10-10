Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B2DCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 03:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKKyUn+WzKi4EbqWLfsvHtG4EG76seS8+1cIgJ7XRNA=; b=mjAp04KkPBGqDH1q/+ZgvOUvNe
	aTrHpEt+CLR8s2cCeYbAmlFkYMuxThOVUK3gvybfIzE5dNLsVgWgJJegUrtHvDkevUqO/7edvIma6
	2xG6ivAXxH0GzvBo+l6LrCN7MssLzQ5MfLzTm6tfkaq6+Qfku5V0cGHfpSK5sliTEV3yEp6uxkO7M
	Hfq/F0WWOwXbYFUNwZ38v96k9APhoXbnRi1YqtYB27Ay7gQtQESS8JqonlG9FKE9OqAVGBIH7cxmI
	XAhrZ6rAxwUFlFlfTEY5VnOy0y6Zbrftmynrt7Zr7goRepnDD6sjEIdUpTtXsinJloOnwIDk2bGkT
	WRI0RBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73sF-00000007aFn-3OEq;
	Fri, 10 Oct 2025 03:32:55 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73rZ-00000007ZGa-1B5A;
	Fri, 10 Oct 2025 03:32:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVoZZo/O9TiozxONIuUzDspM/ftpjMXxCQSdokKvyEiLwDbreLFahboNEqEdKUu6A9q+XwujWcpT+nnDQ9dsGjiNO8bNRIzmG+/oF5lFb3wE4WZQzJc7yXEjQwnDe1OLHN3kRBrKuB+72H7ASXN2IuvYv0Ow81GRnSEyAAWRx1YCyDy4wm2LWn+7i4qJ1XHWyqpRuNTulltboHHskvkXsRM7q7VSruuzO7m32L6mSHEF2pLUkkhGb2nMO5ayMA50ZfOmKI5QmI+L5hTVR2mf2A1kae0r81Ab1OoeOqWtYQCEHGjo90YAUbmnHev6GbHZTGodqmrLW1aO/7TH7RSF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKKyUn+WzKi4EbqWLfsvHtG4EG76seS8+1cIgJ7XRNA=;
 b=pdYxG/xE4YpTF8JHLPQEEnTJWzD+y3bj7ICf/tRYyGoysS5qhWdLp5uZj1WSKyuIqwBV264fzSSi/FgcWqb8tgR6d2XSkizUT2dHajP8kOfXGVm/u6N1eaizgIAMoHpDEjBts1djPbJvjr8YC6ftJZtziOjdxOI+YDtyRb9ToIhVXnVsFgtz4uDrKXvhrCccL2ZonbW9kYsMrrfOF/I7O2VA27gXuQ0+lZJMYIdccRF+m4LcgTrAb0RfaFa8EIKCskPGbD7v2CGRWF0gIiyfAsBwyolIfKptjZCjAkyd60bNrEmQPpUNOTjVCJXnCZ2o9N4Bpqap07MZjKWH/VAf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKKyUn+WzKi4EbqWLfsvHtG4EG76seS8+1cIgJ7XRNA=;
 b=XZuvPB5qvAvH4XXQzz2ByaY/rQBbvynYSTGgoh59yBLW+Cy3VcRoF1VOKRv/IyJgFfewO7U6BuZK/6/n7Z/95P5Y+tLXTJKh8z1OkxjbLgG54+XEf9m9rzoPeLVseUpR8mJdfLs8awt4mQKTFNLaJrKiu1PhEVNbnRHJbIyMF8rVEvjR4fsQRo+3QWm/7q7b+jCaC1b6b5HspCxtdFLoIWJ6UbcwNuDrs5TfhVyqhytGrzs3c6VpOHdEKvSd3SDSQk3D8eUQvzdgboZ2gwg4XrtulyOMEpdDhh63YPQOgYRjlCbE/XF9qOC+m60A4U+QAhLP0pH/Xt+j6YyX3V08Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DB9PR08MB8359.eurprd08.prod.outlook.com (2603:10a6:10:3d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 03:32:07 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 03:32:07 +0000
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
Subject: [PATCH v7 14/17] spi: airoha-snfi: make compatible with EN7523 SoC
Date: Fri, 10 Oct 2025 06:31:33 +0300
Message-ID: <20251010033136.1475673-15-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: fe013248-f850-44e0-caf2-08de07ad96a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qq+DzyODgoxDZvGz0Zds312gLW/84BeQKwdI4P/f6M4gbgSLusBlXjSNxujJ?=
 =?us-ascii?Q?AhzJ2oD+J5QQwAffXJCcOgMA+3B74w0ecz200jKL9uMonEykTJ9UVN5LkdDz?=
 =?us-ascii?Q?dlH3JZ+n1w1Ez4a7pxcuBCUYJbH1Zu+M5N4G4ncvNtTWH+eAT13StluLS/YH?=
 =?us-ascii?Q?5/zr680m2DtBvZwpZXqACXqiR6LIM1IQKs6tBFKVNH6WOaXsiE2M7Nxxa05s?=
 =?us-ascii?Q?SLiCdnv5r76mW+M1sBPwMYZzNHIfgFN7QYx3nCdc8PEEbAmUTvCCsZaZ6rmb?=
 =?us-ascii?Q?fKQlefhbiilEVRTmHc2TRwJnnuO87HVqOyq+PkPerljV9v+V0kpEm7dIm5A/?=
 =?us-ascii?Q?UYc0dkeQgN+g9Z8DJBBLcEO6TTbk3uxXr6KhWAcAERYltH2dsf6dkJmwiWXV?=
 =?us-ascii?Q?OOSr/oawlleUT9KqagBVcb/pxrbqVhVVHfU1jAtqlaMnh8oXMq+AoNI934JI?=
 =?us-ascii?Q?lcvd7PfUG9InDLW7zr0/k8xtnIidwZLhOBwnCp4+k4Jpa3Nqh4zzb+QSnDsW?=
 =?us-ascii?Q?YekelTdNBmeohTDAQ72xwKG7r7HMeSuPVcndHk2hsXF/cqSLms1B3xCtU/Ba?=
 =?us-ascii?Q?xbCMHZZQbCs42BH9SwLDicj2YDNfYdM8FAUE9spArq1ZBFmEytQOt+srvpR9?=
 =?us-ascii?Q?AYsHk+H0a74Pf5dNlqd2wckcJE4Wx6ixssAj5+/lE4Sae8TZTzjp9sZIs8FJ?=
 =?us-ascii?Q?jxkWSP3VrbIxSYN0SpIAF471VGSZjlHeAgnZLxjS8Wp70F7Nth1leTvXcc3j?=
 =?us-ascii?Q?wIJ7ChKd8ep+ZG80ike1wbSs+dsARXpxMUWXq+0WSJKaE504BZ79BGHlru5E?=
 =?us-ascii?Q?bW2fytgCjd6ZEI9aAGOe2uB47ppD1qeTZptItyjfTNDsHWudnwOH+EidQv/z?=
 =?us-ascii?Q?9Djn8i+2LwjE5cUp7fFfNoUgq1sXqlaz60c3bXYz9wmdJx4NmbarkCXZVcS2?=
 =?us-ascii?Q?+9jaGPvXBuGlDZRWRFaG6PVfd2bM8LGeKxpkqg9QItYLSfFe8Kb2aWmwg7yZ?=
 =?us-ascii?Q?UKI9J9Mb9JZBU4vnwP/Ch/S+JaG1ImdNBnCHB2unK4saTYejuZ/vn0utd1TZ?=
 =?us-ascii?Q?9z9li0LZVIH6nCCTxptaMVnGRgxY8Q9qgmonFyzKNsbPg1dsH3jo6KEX01EW?=
 =?us-ascii?Q?R1eTdIZjDmC8bRC6cHxPK1AWlXQpnvu8oCtaaTNc3qM9SI7XQskxTCPBYH8c?=
 =?us-ascii?Q?n9zssi0TAndGhIB8YVMen3TNghndKF3LgdyT0g9UuREPI7iFfL3z605hEf5O?=
 =?us-ascii?Q?gp8jb9jByA26+fNP/c2ZZzx5+66nf1k5eR/y2ClQHOogws5lBQ4ft3sZcPdw?=
 =?us-ascii?Q?6ha3KOMAocXZMwUp1stCylA0XS2suqP2cC6Jtm3dpRO6S+TbGke5GBLRLeK3?=
 =?us-ascii?Q?5ZedIWn/4reygX6rOXi/69fAP7Pl+60xxqUniaJaBHax23/OwE4LPwsxZNlz?=
 =?us-ascii?Q?fkjromP2sZ1vF6Ky7iZ4uTxljIDbxqC86ZfEBesJ3x+7q7dtilrIfnL9HM75?=
 =?us-ascii?Q?U55oiBeBPRY35drPsBoDYGMZbK2H9q5/3bOyOiCZWQRP+2mtg+Ot28tnxA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u9EKPHolGQcbg636UX9fYXU7S/drGFc+4ZjCIlzUNWV6NZ9zZiappAl1jqcY?=
 =?us-ascii?Q?Rg4mXkKYVX1pFwGIHTaBqXHfqo522RBhLvj8j+LmslDyV7Vhfj88g/vaNlZB?=
 =?us-ascii?Q?1O4c3ZSprvB/fEKefY4Ihl3WBUhONc3fd77DknJ96WDWajsRTxK8ENZ7iizW?=
 =?us-ascii?Q?yo56vJ9xPTZiumDpTNrvvXWbciwHJpsQpVn0gDMHTYUoNGjUifeMWPgqwK2D?=
 =?us-ascii?Q?09IT6U3D9i/U5+QoilDne73jAHOu92+PPHzw9IWlS97ZQmcLfhowTM2rVnPP?=
 =?us-ascii?Q?wkA1o9vJ3mgpgQqRB3x4UMyZocDOTZnr4aPa9hWAWSp4FakP3pu0sEPgbVQI?=
 =?us-ascii?Q?joiMagUYC7QK0Yf8Tha2yc7+1dA+47a+XoCGknmBpexme25C2YdmCPewMo4L?=
 =?us-ascii?Q?s13RaPTHeNSk9iCChJn/lY5ZJ7MkP9/RxvcM488/kEM1T3gPjPOjN2a0kJys?=
 =?us-ascii?Q?UoLPAa3IeZEOY6MbZVVfna6Vehkvb6zbKrNBt5ayafq4xynbyzrIw//WEelM?=
 =?us-ascii?Q?l5ADkcqfI13hdUjqB0RZDSJLCxGpnU+NYUUbcABcSGIUm1r9yuGEPyI8rl5Y?=
 =?us-ascii?Q?t+9q6guBRPcdRzq3dyYlcxIbuXeg0DSkwXPMDpMkANDh3hju3Nsz9QvX0QRH?=
 =?us-ascii?Q?T6QRYCThDpGby5Dmriw56eNInbft5Hr+Uxq90Ee8d4uux5qjNMrl2ugFXvZP?=
 =?us-ascii?Q?DhmB6o9dNIFhVE8AzG0kPOSgL1d2GkjzI23BfNRSR0aEFUorrzT/mzLuOusg?=
 =?us-ascii?Q?uS1fJjnp26YhtahG9J6o3Et0L7/qDW7r8newCYVJaKZl0QGUSyzvCLxnVv6X?=
 =?us-ascii?Q?dy+F+2AF6WHweeZZMJu6plKogoSO/KYoEvVOf4n2N+I5/a5NTA4/YDlvncDA?=
 =?us-ascii?Q?8O68tCbynkSkT9AqmJ9d9ls7RFnxAHeLJKg2JYwzcydTbn6S8eiGzbImO/od?=
 =?us-ascii?Q?XJqMS6h8MHeFKfyqUtoI7vQIYiqvTIuh5qk4+AP41w6P0vCvLPpx+cWlY6xa?=
 =?us-ascii?Q?JxX43XWbwPmS9VucAMki7mItZ7ttUNFVx1Wg+jyAbnJ7fqurQW3exmj02/MA?=
 =?us-ascii?Q?5Y9E4Nd/v4MEeBOTQ8FvDR6/TNqOdF8UyGjeRf5IEIrcCONsAWapqxevVCor?=
 =?us-ascii?Q?q/mmZmvUlKJtJOwIQP0oRK0GJzl/ZhcA7/6aaeBklFVhG9KQXwGWJe7Z4RAa?=
 =?us-ascii?Q?T4p8ll4oUjTVFcqrdYuU3yuImxvrMfOHzRv19nyDBgY1Uve9ANoonXDoUKBi?=
 =?us-ascii?Q?CiZK8eQIu5r2Qud6Zld5/d9Cr7m1N1c4GQco4SI3Y2fSwJQ/fxQV4/RTQMBO?=
 =?us-ascii?Q?lAmgXCV/eJQs0R9TzDcJSk2L4baPB68XOYk1qO2Uezm76xH/rogauugC3oBe?=
 =?us-ascii?Q?mMBNz/YCtSeik40c1qcos3c58RsytK3aG6Gpt1Re8YhoUwDhIlfWEz/k3aVx?=
 =?us-ascii?Q?hxoh09H0skWFlWUOkrM8TQ5cQ4OAEKW+olS4IKZfo6aTmiA5qkANXPSFoUeH?=
 =?us-ascii?Q?5jyjLef5GWsFQpL06/o7VGCDAmb0XDjJ+KhHxqO981YR810zb+Y279JUhfw5?=
 =?us-ascii?Q?K6K+HgfzWID8DS9vMbN0FlEujp+ja1d+RXf//CAp9/Cbc+t9QyC3G4Yv8c+/?=
 =?us-ascii?Q?BBbKVSf65EGdnLY1+kmr+x8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: fe013248-f850-44e0-caf2-08de07ad96a4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 03:32:07.3455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLvStw7ekcMclzyGH3MpMG0if1NSDcnIWRcdHs4JFZuZJ5w38GacNw9XE1pDXd7FOi+y3T5PjOYa9uz1j9RG5I5HZ3R5gDH7/bkRXxuVMHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_203213_374556_8153972A 
X-CRM114-Status: UNSURE (   9.42  )
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

The driver is fully compatible with EN7523 based SoCs, so add
corresponding compatible string.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 8408aee9c06e..058e08811210 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -1047,6 +1047,7 @@ static const struct regmap_config spi_nfi_regmap_config = {
 };
 
 static const struct of_device_id airoha_snand_ids[] = {
+	{ .compatible	= "airoha,en7523-snand" },
 	{ .compatible	= "airoha,en7581-snand" },
 	{ /* sentinel */ }
 };
-- 
2.51.0


