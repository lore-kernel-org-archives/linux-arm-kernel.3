Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC918CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 10:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:From:
	Content-Type:Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:Reply-To
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UynyMXU+5r522Kn/ICkDBmSlHA3PizceoXrbexTPZVs=; b=MfKbgfKML5riXQnLRVkUtJEOzk
	/yuTiq8NkXyERuPOQBX5CWez8LOw9kDhg6UOyodEl/vw90rtDzVYt7xZzx0NjPItYMf/yVag75Dwk
	FclueUGOihsgyRAzCV3zjKTjAH4DV0s+EkHVGUFe1V2uY3lSvKifVFrQukXalSbi4cfjvSS2/rjph
	vfox4Uhpj/T8ZAmndCFDsjyQbu700t0LbwKQmfv2W1sQk1xl2ULmfDjcSbLWo5cpuNl5gpPJJ80Vl
	YU9jnuz0E1y0nyN8HmoDg6sne3XNRkHgaar9PEF/TDQ6Wt9fVZHpZpdMiG4BUmFoFgJ9MywDpLRJq
	hHzHVVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1jE1-000000085Gv-1xYL;
	Thu, 25 Sep 2025 10:29:21 +0000
Received: from mail-westeuropeazhn150110001.outbound.protection.outlook.com ([2a01:111:f403:da01::1] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1jDy-000000085Ec-1c7M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 10:29:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSt3Z2OS87zHbG70Rsc4zQ+GDnL98Uu8vXaCFU6ol7COIB3McznI1ukH8oHuaA3nCmuC5CfT/wG89cd0DwK7wISjHXRnOgOUwnXN1O2L8/P9DxK96plRZF51XwI8exxLYOPHKEWeCxnFAjGgpBaAeIdFINF6/Dpfl+iZb3ZYf+GVRFOCMomOaPWqro7yNVIc9dFwsIuPoAl9fDDVNVwcinEtFKiGJyAuielqHupfMKWtjthguispqnkT68PxEDgBGHc9uAc31UMSSZaiWOV1c/TVNJt2YDXA/GVKf0+aFjrk5e2/f34q4TI9+/lR8RoNr1YSKmGKuJvpbFkAnhaRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UynyMXU+5r522Kn/ICkDBmSlHA3PizceoXrbexTPZVs=;
 b=Sq9IuQyzpOoJwi1FqCYKrPGkpkpkNZH0ZE8NabM6IYxMFwT1000F0ANXCv7f/cwV7I2Kza6VJb/eq4/fo2rEjChVQJy19utxnWeA5wJSdxjfWJu1BoMff5nxV2YhEz14dRrF/J6/swij+sFWJh5B5215Zm8WiwXB3mAmp/2ZNYm2hX8B6ZMDQRbnAcQxKtzuQ2N5vks4Nkh9H9enDvHh+dR8FI71BDG7mxIsjNfSsxIo2TZf2F00ssZK3Xr0IcNbpC4kL0ibmZ3WYq+4LVIJx0aPBVSekTn6Lbt1J7WXsuZK+4thCh6Gsu9OJpMUGtllcavSm4RFAtjP1L48ovcWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=none; dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prevasonline.onmicrosoft.com; s=selector1-prevasonline-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UynyMXU+5r522Kn/ICkDBmSlHA3PizceoXrbexTPZVs=;
 b=x9d4VjeBsSPhrXG3irhHfUoZqRqrvlufMAsVIDFjctXZo4yP8un0zJx+5Ec5VXh6xGojfK8DUnWcwAPyg+shaFGLeE4WQhqTE5vR+1TsOE4HXFN/IQ8CNu2+N3wI1alNbaw9wRcgRKAG85Opm9dKvYclzuB0Jtin+TKc+fZ1nrE9xwloUdr1p4+TYWS96KApsSIRwPX6E1ZDD2gE6fpQ6Rp0pqGNrzcg3kcnJ/AWjOSInaxn59dVs4M6WJyQY7+6d9xhwMXRZwSqlE+Mkwkmz1URykMeAi9Tx5PAEazqjTisjVra9D5OVTaWjfV+2bMA8sAqb0vAYmtskB/yy/DJwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=;
Received: from DB9PR10MB4747.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:254::16)
 by AS1PR10MB5674.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 10:28:59 +0000
Received: from DB9PR10MB4747.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7956:ad04:35d8:6f0b]) by DB9PR10MB4747.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7956:ad04:35d8:6f0b%5]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 10:28:57 +0000
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Stefan Prisacariu <stefan.prisacariu@prevas.dk>
Subject: [PATCH] ARM: dts: imx6qdl: make VAR-SOM SoM SoC-agnostic
Date: Thu, 25 Sep 2025 12:27:49 +0200
Message-ID: <20250925102751.4118470-1-stefan.prisacariu@prevas.dk>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
From: 
X-ClientProxiedBy: MM0P280CA0079.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::12) To DB9PR10MB4747.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:254::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB4747:EE_|AS1PR10MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: 70851733-fd98-4dce-b162-08ddfc1e55df
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:6;SRV:;IPV:NLI;SFV:SPM;H:DB9PR10MB4747.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:OSPM;SFS:(13230040)(52116014)(61400799027)(7416014)(366016)(376014)(921020)(38350700014)(1557600115);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|61400799027|7416014|366016|376014|921020|38350700014|1557600115;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?87uBJgLeOVpJZ0wfYqDvenKi3IeHFYl4Ug0A2J6mR4SluUu9Un+7oQvK1JMK?=
 =?us-ascii?Q?i9AHDuW8e9JkKCg1naNSnryveKfUzw4qHSAmqJolJV2DL6IxRpicGj1yqM6X?=
 =?us-ascii?Q?owp7HoZkKBF51/jw5mxXDZp43Lail6U9YN61AM0yqdXTJtQ6omqSCi2l0c/y?=
 =?us-ascii?Q?zbRSEsUftdaxzVzCFoy2MSyf70dgQEAlGe4N+Zb+e1WJr9k/+i77vN5x8ApM?=
 =?us-ascii?Q?aiZmAoXusJAGh1uUYRbuk140azqrxhC+UOrjIVO5L4EK4691YBj+7uz64Mn6?=
 =?us-ascii?Q?fpBZyEIg+JDQjGu1UQlb9be55/tEOCbHWg/TAbLmJ8lRIyoJLd5ljn1N+D+e?=
 =?us-ascii?Q?7ON+cmgWD7f2mDKdZoV7bl91IqlUJEuYme8XpD8lIqgPax86XapNY1zmYZ4K?=
 =?us-ascii?Q?TfCov4kEAzSyLDvB+jowQcNUySFqKx4aPktBxQlc9K0cVRY90/2NHXXhW3gT?=
 =?us-ascii?Q?/3cOVMZDtwEOTchZF0UXe6IrOAcfInErmm7EkZgOZQjDAtfClsJ2avN9sD+1?=
 =?us-ascii?Q?3TQcklsJYEzQa636qIV8mMilP54opXNK/zixXCVAvy98BlzC4y+5U6nszOGE?=
 =?us-ascii?Q?ZGHibtJ8N9nbKm9rTD6Jzq+Uy7nIT8ChXZnfIVFt0zF+bf8JzsUZ/7utc9xe?=
 =?us-ascii?Q?uuYZIuWdSAEfVDuND9BMNJM1z4DOuwbWEEQYGqI8DIh3jZUHxY0Z45hHZ078?=
 =?us-ascii?Q?6yg1K4SUSaqudorDTdYxHdCEqinKzV01CSLH/LAo0odTAMqqgJzaU9dgSXDy?=
 =?us-ascii?Q?i0eOwWGVsc/+SiZ9WX7DZxgVGyKXdWaahxToj7ZLZ7poE2FuxzYwmPCsOJhF?=
 =?us-ascii?Q?eUJ4uTsjgZkmmksrqa7cbvAIc+vZags6VGNk0POlTa0OvKyVb/sW7Cm5iA5t?=
 =?us-ascii?Q?wyUJk8EScKIqDvS5S+yY0tTmbcMOoiu/4sNlUo0fFKkNPnd8pBz9EvsB9mGW?=
 =?us-ascii?Q?usG6Tk8uhHlwQnAGVJc46wCp+d1CKE9ES3K5w9BjGLhqFyxL6Rqg+Wjrafmw?=
 =?us-ascii?Q?q2HdGl1k6Kbcxu7EYS153J9i6gJupBDabxjMO0yXP67gyYzpuxvjXxMErtUo?=
 =?us-ascii?Q?F9ZyhipQbbwRZChPe3aigj045Br5F2T/cg4XryeqH1EkvN2+o5YlKIcF/jf9?=
 =?us-ascii?Q?rzYTVp8PTblNuOJlXtZE57i/9rZ0VXCI5FLkOXxGZZ7TxjBY/2CArGDTmX3U?=
 =?us-ascii?Q?OA1vYogJ9d2ZKYKglC3CaEME+d13YF/9xZxZ1vnOiptFDsdnntIiUSitXCdL?=
 =?us-ascii?Q?0opo6k24gI1Bti1YGnWGMZ3nJhpc//M0SVuW1XVDCTXm7/SK50k3X2FAdQP6?=
 =?us-ascii?Q?lCsTa8uCHl4a/TYoQLP3zH+pvwGd41jk3Q5HG4Oc2RfPlIeac++Y2bwn1yZP?=
 =?us-ascii?Q?uKe0Lm8c9KI7a94rg9hcq1BPsB8vJsmxBe4V/1KFsliu0bHu5CTY7VY+DjSE?=
 =?us-ascii?Q?b5WGbmV98o4Hhy1vdKRAztqVuNL3c8dAn7cXm6+cKrogBztchdGhmdu4fL94?=
 =?us-ascii?Q?eboXvy0+iuXJ+mPjWx7k3u9x0CL4sZf2a26WOHUHLCXyKKohvRAb53K6gCws?=
 =?us-ascii?Q?rNd5TSGK/u51AhDqJQfJYn8DQIC/nIFbx6X/wZ/26oaz9GImhdkdVKfQ1Mbn?=
 =?us-ascii?Q?tqSN8VfnkK3HgdpT0tyhzdOa5nngc+3YXZxTnCITYv9aeZ18F2AGFauedAUa?=
 =?us-ascii?Q?BaLi5430GzhjN8GI/aTlIk7Lc1srPxn7feh2aBxrc0o0WG8v0P9/G5KfDkJV?=
 =?us-ascii?Q?Lr6vI75QLXOwSTxsifA1R32Gjtnc4YzENbNvNh5e+TDvegnwBWt+mw3tNgyd?=
 =?us-ascii?Q?ILeOEC5gRuSNknKbCDNwbzGWYn+e4v9I9xkeFHSYOBRe3AQKGoJPlys6NP+m?=
 =?us-ascii?Q?ZaGhSiQ6q4MuQcbkU/uoi7chpfr85rOSmG1XuztMZBAiVss7LbChS9WCZTe5?=
 =?us-ascii?Q?jDGwkNovhOIfFnHv6DQKrZREqhvSvifggfbJSkJt5YR1X9snZgMH6mWx2GRO?=
 =?us-ascii?Q?6pl0cxDI3YJuETXliD3J7W+OLg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rXnnuF+qtiJHgPjrDh8jF0aqnrpKjhnQq9i7wiiAWli7mujCYKmTuJVGp08S?=
 =?us-ascii?Q?bSx/NXHmEZtMmacNzLo8aUQ5uCXvAY48y7aLyAMwoyubGoPQQSddhgzfYbKM?=
 =?us-ascii?Q?Mpqv1XHCT2ECv9L8eArUgJpj0YScC5JZJuFuimODy5G3ZOcpqiKzO07XJd29?=
 =?us-ascii?Q?4fofaS17n9X1MYQo5w2xLPPLgSWTaBUVOSzFTzCsCGT7ge6uI8GFhd22xGpA?=
 =?us-ascii?Q?YZO9txx1/rPJspqinNvOnrnqpO3t4zLjtauDRQqgPE6fV5884noX2DUxpiVb?=
 =?us-ascii?Q?4ZMI+o8hgNfxvv9ff1y0ezSeo5sIuNrvL/39JXFY5RhSBRjyEChrUWFvzBui?=
 =?us-ascii?Q?gn1qk0Ph6Ra78+ZpK5x4inUn+4OeXpMjGXyXeTRFuCiZCmGr0IemCbGqfRlW?=
 =?us-ascii?Q?gSo8ani4vXx2IOtURvyC//3epAC90HZN/pQpRb/KHlmIaoKhxrH+op8wP0PX?=
 =?us-ascii?Q?TndVySEtmLd97A47XIsw6W2MWlm2OqmiSeBDpSQdQUFi2HUNt7YpNZNm/Src?=
 =?us-ascii?Q?fFF+wSONB9HWl/+Cg+6PQA2ruE1g3vO5wHbgOQsBxUAGXRmC0+SVDbXq0xQF?=
 =?us-ascii?Q?KmI/NIJNmLBYH6OcNzH1J1IbqueWKojLZ/1H5eY+bGDWi4kMiA+nw5e7Ftxl?=
 =?us-ascii?Q?JNyP1lKa7QqGDW6VNbafV0hTZp70ks3HT4wr8wzzaTMZ9YPJta23l0krvUJB?=
 =?us-ascii?Q?XRZrbcrFParkAfSUTF3trk/ShaR59vJVL1oh04uSNeQqLgZ29Gk1/HUA9TRv?=
 =?us-ascii?Q?HJlpYxOaS2uYmq0Ex1I/8U4lBjM1wmaPfqw9OzuXeSGp1VM6dkSdvtaKvLeu?=
 =?us-ascii?Q?Vxv3zpnhqcJG4/nt8l3MuIFbwW+W4suxHlYCFOqiX1GDhvBBlfktBBbkKdkc?=
 =?us-ascii?Q?kxQm3r3w/iWcYM5B46SqXNvtAkvbkKMG+q4z6xCbpVg5aPYVz21a9f7nIOtv?=
 =?us-ascii?Q?CTfBb3CesHjnC9H70BpW2fQly5Mx1s1ORbfrwt1pXhsRJRH7LB1A6b+a7qrA?=
 =?us-ascii?Q?9+mSOHHU63Uw9qa9rmggPvdIBDqLvG5Kkz9ZvwcQs+9D3SqSjLsY6dLtVcpa?=
 =?us-ascii?Q?nT1IcRrI88yG9gA/gRxDILamfiLQ7UDmWtH4q0WovQFq05KmUuqwvtomWdte?=
 =?us-ascii?Q?7zo6WTH4T1OO3KqhzR+EEyiFonfvU92QOXb/nrXFxflZLgplf8PznniSZA9m?=
 =?us-ascii?Q?LmlLq3zcTLp4b9Hzj2Bfnn1z1JzK2PPHIo+QHP482t+jDNGUFjZjoNC/KzL/?=
 =?us-ascii?Q?f3yENxplrUIGKlXw5sWsFVn5IW2V1KeGK6paX9XGP8SGceliUIBUNYaFVR4R?=
 =?us-ascii?Q?zTMZ8AnQicTYBrJnwWmzsFbKgzNgc3xsxdwlRhNiu0/lQNBWNqn64sQS6gMk?=
 =?us-ascii?Q?Ytw9wus1Bmkjo24etRsSq2ExESL7buSOMV82+L8TYkSNWskyM3X8h9ji15QN?=
 =?us-ascii?Q?ELqmjYDDfoxF6miZZQ55HxmqUR9RnnATFa1YabBIAV+7jdJmP4bxPuUDIfG5?=
 =?us-ascii?Q?bulN0pEbjszCf6Nb9JeK6MoGCtBEgmMFZ8RuoswKVpEc8UuMjiZn/PmhbLM7?=
 =?us-ascii?Q?s8dWtHR5TqvHk5bzfqKlA2n+GZ0Rp/mnDCBbmwPs44Cwy0OF1j4o2kdv7K7k?=
 =?us-ascii?Q?YA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 70851733-fd98-4dce-b162-08ddfc1e55df
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4747.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:28:57.7884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlXKqH+1Kw+536ekiPucsnGbvFW5quI4wVa+YEW0bUZMKb0Jwkx+M3+SGOuHkfDi25uJNPgXYZnOydPQ49dh+hFYDPZKV8qGmoYrEza1VwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5674
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_032918_437452_26471D14 
X-CRM114-Status: GOOD (  12.92  )
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

From: Stefan Prisacariu <stefan.prisacariu@prevas.dk>

Make SoM .dtsi SoC-agnostic by moving SoC include to board level

imx6qdl-var-som.dtsi currently includes imx6q.dtsi, which makes this SoM
description Quad/Dual specific and prevents reuse from i.MX6DL boards.

Move the SoC selection to the board level:
 - Drop the imx6q.dtsi include from the SoM .dtsi.
 - Add imx6q.dtsi include to imx6q-var-mx6customboard.dts.

This keeps the SoM .dtsi SoC-agnostic (it already relies on imx6qdl.dtsi
for family-common parts) and allows boards using the DualLite or Solo to
include imx6dl.dtsi instead.

Why this is needed:
I need to reuse imx6qdl-var-som.dtsi for a board based on i.MX6DL
(VAR-SOM SoM + custom carrier). Without this change, the SoM .dtsi
forces imx6q.dtsi, which is incorrect for DL and breaks the layering
model used upstream.

Verification:
The DTB for imx6q-var-mx6customboard was rebuilt before and after this
change. Both the binary DTB and the decompiled DTS
(via dtc -I dtb -O dts -s) are identical, confirming no functional change
for the existing board.

Alignment:
This also aligns the layering with how it is already done for
imx6q-var-dt6customboard.dts, where the SoC include is handled at the
board level.

No functional changes for imx6q-var-mx6customboard are intended.

Files were introduced in:
commit e5c810848d2a ("ARM: dts: imx6qdl: Add Variscite VAR-SOM-MX6
SoM support")
commit a5b59a3f41bd ("ARM: dts: imx6q: Add Variscite MX6 Custom board
support")

Signed-off-by: Stefan Prisacariu <stefan.prisacariu@prevas.dk>
---
 arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dts | 1 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi         | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dts b/arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dts
index 18a620832a2a..a55644529c67 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 
+#include "imx6q.dtsi"
 #include "imx6qdl-var-som.dtsi"
 #include <dt-bindings/pwm/pwm.h>
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
index 59833e8d11d8..51bcaf04546b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
@@ -9,9 +9,6 @@
  * Copyright 2022 Bootlin
  */
 
-/dts-v1/;
-
-#include "imx6q.dtsi"
 #include <dt-bindings/clock/imx6qdl-clock.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/sound/fsl-imx-audmux.h>

base-commit: 8f5ff9784f3262e6e85c68d86f8b7931827f2983
-- 
2.49.1


