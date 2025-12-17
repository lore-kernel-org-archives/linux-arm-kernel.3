Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341D6D65C63
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 23:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gCp1cPhmE/vbSZIyMUDJx6BLB5ImHdC/D8y6awXAMk=; b=t/T41t9drknJyOuSX6CUtinWcJ
	aKoQWgtqlWF8zhLvqxMm8MxymEViMK6ZiVJ4SMsxFExBMENY0VHQZgylojtNQoAKD73qYbK/XP3QH
	vwkAHPLpZezwry3lzRFsESUukBcp1aZzDWAHdnQ4AC5uW/AmuN2n599STJuzY8PWRLO9jhk7bC9lt
	VXbLkhDWoUCil/iDHc3JZipbNJSD4CkSlVdd5ags4Ol45VxU9zupdMNjzqGxe58shvbixo5/wjqEt
	ImB7OqL/CO7eEYDicsY9QZDu1pvpmbRsSMNFjP2j4zCwGm+r5rj5oYIwp7IR3wsedXLwwyPVHxKrv
	815QeL6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0iG-00000007W5p-3CYf;
	Wed, 17 Dec 2025 23:13:44 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0iD-00000007W5I-3C2X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 23:13:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfZz1/hDHM+m9a2jUhVWKQR65O6Mk+qWrChJ8yhbahFlpZ5aK3LZri8GF0kDp9fy/IIzFkkL72N5ASTx60dfXQbWdvaH/VIsCY6tT0TgsTzpRcOil/8dlWBphUKFx+0DiG9aeCPVCQjrLRy2EkW7wKx/qDIBxjNw5lffbdkvOCHDxQluQuUyBAxNv7lUv8p10uoQHaqyTsN+VON154fcTBQ3IqJZNb2jb1eMRwyS16aL4a39dQzaNBlX1cgVnEzYwrnFDITeLtF9bigx2d5kvMck/i2DJkoXoDQrgHxkuZmBrm1ZkQlpKqS6MAwfMQCfIC0ZME+hWMP8ZiJVZC5smg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gCp1cPhmE/vbSZIyMUDJx6BLB5ImHdC/D8y6awXAMk=;
 b=S86rsp9X3NQAQDSqoByp1MCBH2jpy0dOznA6tlh0k2I+AtxqjUCSEM0GL1FW7OGDFe01gjUMwQTciabfYP3gvGGkPNEjTeDk0mf8RZPmHtqDyV5OdUYFA/U4mYc8LsmR9b2mviToaLtUdJT0oJVCqAfFwtFyWjqFNQOWWbQL5F/QXQzNppP+ThpRGwYR0UhOR0aIUixEca+WI/39kx5KCQKoaOuodyo/AI0CRqiFNnUkWpn0k9JIn25f1hHHLl9vCQnge27IhdGKNqOt+BMc0ZNTxLNJ995J4WpyPoCA1HssOhr7p0F0WAmgMok6zo6LUWT0Z5tApUXVNpYfQ2kSzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gCp1cPhmE/vbSZIyMUDJx6BLB5ImHdC/D8y6awXAMk=;
 b=IBWs0uHHUAvzCaXp7ovZZ9e4V62gGUpTCtNO/q0+fnpmDj212GHZcnyupg7gO2TE4S1lGiJgIdMxRoheV38Fuw1uYqtR6KmbVLaPDAN+UtBgxSwGW5HvaaFa2Nf+yHkNTkJyHq4YtKjOVed2rmFXOdtRztDuFUWTFSL2Uepv0r6/478pWqYfrJEXU4M8v+etzZXI4fGlgFvaICksHC1uEIEexzzMwhQv3j1OE05AcLx8r7PQbFvZ2X7DLu0o2iuacGAmmyxTAOnEEtKm4/tZoHI8GelypuurYrK/hyGgfJbdcyigUSiC7G0mgvotqeOIpFkec3bxGX+ubJJHOYFFJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by MN0PR12MB5834.namprd12.prod.outlook.com
 (2603:10b6:208:379::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 23:13:35 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 23:13:35 +0000
Date: Wed, 17 Dec 2025 15:13:33 -0800
From: Marc Olberding <molberding@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: dts: aspeed: add an alt 128M flash layout
Message-ID: <aUM5HcEs0OVrDO1w@molberding.nvidia.com>
References: <20251211-alt-128-layout-v1-1-100f57d2bc4a@nvidia.com>
 <61f561d95af86a46f1e1075df39e1ce0f1324098.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61f561d95af86a46f1e1075df39e1ce0f1324098.camel@codeconstruct.com.au>
X-ClientProxiedBy: MW4PR04CA0180.namprd04.prod.outlook.com
 (2603:10b6:303:85::35) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb683a3-b63d-4273-bc75-08de3dc1e72f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mxZR/Gd+hN6CgsS+gPf78Bmg5vu7XJ/AlyAbP8ajyY+b/b9rOKU5YgdmFqty?=
 =?us-ascii?Q?H1UfVsTwQIELZXjlLQ+viJycAbB/wmCgASPMI+9xfQb3efotXCv3M3wOi93l?=
 =?us-ascii?Q?qqb7T52PrW8+rzTkwKrGfIeEoo4+g612+BtCUY0qwIN0C3xiOCUTmNIj6ak+?=
 =?us-ascii?Q?Cft23+LHTjaD9bhPdDgtiBcK7j7gUHLHEclE0MtuL4df4bDpNX1CxYCFFAVM?=
 =?us-ascii?Q?GMGwt971w/J78VbqBxlMS8IEKt2gXwIEUaYST5y+m0Ki5iGUbEv/G8iZk4Kg?=
 =?us-ascii?Q?UH8HWzZYgdFszOgGy6OFJRIaAyTfwU/ZNNHYmptNdgriGlvYu7zOMwHIf56K?=
 =?us-ascii?Q?EDq4RcUpYOYUR6XCJi3aQrXSsEUu65ulYGNLRp4mvOrCc2ZuQOmXJch5ZoaV?=
 =?us-ascii?Q?402E2GH2q6EV7puTICByMHT7GGPOwnhKIA5+tYbTlxrQ1L5s4vC4migy5cLP?=
 =?us-ascii?Q?REAcp9c9qexIZl5bBcby/DVL2lagesV3SHlYwXCy0bvTfUmuQjMaQPY2jLJX?=
 =?us-ascii?Q?ewP3gNVW7gkoa+6FVcdoVTUbzy9JkLB719ERmDjlpU2hHr/SeRk9nWWJwuOw?=
 =?us-ascii?Q?S30guGWaVfaZTeyQ9nr4KUhZ9xpEe9vKJJ1SJ7TADrkfJDFhV0K4zT+qg+XM?=
 =?us-ascii?Q?GmTFL1W+YrfGs0hekd7h3PDCWWMTv88QlnDuOED0mWel4Q6+pJXwo3Ya/wV+?=
 =?us-ascii?Q?4aNNxWcSS3kVSCbAJk/cyifiichZrB0kUa8qsEb+pbH8ZneWpNVniSJr1dZE?=
 =?us-ascii?Q?lI0zdCIvzbs6G2UfLj0Ud+zfBmP7mpnwBwslkAXl5gJ5ecx8+PC55bRV33t3?=
 =?us-ascii?Q?5Pk5kMie6Y3eDtUOHQcGZpc8/TQKhv7qZcBxeSLi7wK+eegxPp7uOIHsq2Ls?=
 =?us-ascii?Q?hJ9DXJd2qKrOZN9cGuMpUif5GOSwhT1hyL1bgcjWkMMqPxConW6lRgCzp5LA?=
 =?us-ascii?Q?FpCbfwTv05QIkJBKwo83hS3pmcGpfXA3pyJw89lIzp3PbIxL8mM4Ghwxv3tI?=
 =?us-ascii?Q?yG6M0v+TLveVbWcUVJ0YP1IE49/2GZnLdc9WFaHSNNLhH5VHRwo49Ix1/MTW?=
 =?us-ascii?Q?fp8DYAPHz2ks6EA8SRCGMhkH/r87riqrbqgPOV2muzCnkEG0SpfsVONsGx+A?=
 =?us-ascii?Q?abGPeYkALKPlfEorc7jdb/j611XgmES96BlmAMXG4xvxMdWA3fueS9BGDim4?=
 =?us-ascii?Q?jMFOdylAyfFYDS74lpFYsWQnY4+MmPUYoN6FujEL9lYVRp9jC1p8baMobv2S?=
 =?us-ascii?Q?5klEBKzWh0MH312YkgbZ9lo7KMG9h4wFrAqoh/egCdKj//kCVvzMccZ6/SZA?=
 =?us-ascii?Q?ge4KWu++o2MlmZuUrCejw1p8e08lv4Proi6z4mlJaopA046kUuFUImtruVFU?=
 =?us-ascii?Q?K+Gz5Aa36Tbg35lL4eP+nuvm84DhH7BZevrkkQNivzQbTdy8yiFGdCBWnL4o?=
 =?us-ascii?Q?/bI6cfMqXUOtdMv2E4+N0DMXvEeNdiTk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8KWolpDhb2n+0+cWOUbNp7680oVeCGLnbFVRG/14DieLvd1LPfTvdw0P4o/i?=
 =?us-ascii?Q?lFHByobltLB6WnQGVvTfWoWHq3dBRubTGC3+C6wZ0W5kYRlAoY7sNKGKKFiE?=
 =?us-ascii?Q?GDFCCJSVe4r4Xuv5uz2scCTrVICjwIuhwywQuL524TmaWgxW1Oc6dIEU/Iof?=
 =?us-ascii?Q?PayXN2mjpTG2eS+vQVIM93Jgbj+9c+OiXedj4klCDq27HT+LcXIKBSre2jLn?=
 =?us-ascii?Q?W6wtNLEUnGUTdvMRxfyHzXGk1p4f6kmCPtK5r+mc4M037t9iJGLE//CGlVat?=
 =?us-ascii?Q?6LE3ulT/kpmap6y1WjzLaxHbBJonoP49vrJ5y34oz3LSbE2ID7J3ICMoXiUS?=
 =?us-ascii?Q?TnJTlKehA1ulPl6Jvr4hwnXronnGujXs/yFY7c4p0WXwAxhzqrPJLJScTAOU?=
 =?us-ascii?Q?qKOoRRoB1b74HfhAl23BSOPkzy0pwSg1aPIdiGXPYccZBNQuzL+mXc9E/+uD?=
 =?us-ascii?Q?E9OvfWBNdXfme8WR7C6cc64cBwYIxH2uBhXOxJ6opBNryCDZN0ZoEiVmjxfK?=
 =?us-ascii?Q?KuPKxekITtSPMGS45riR8SzXq/tZkIa6W2cKzhuk4eg18gH4X5I8r9o5J3BJ?=
 =?us-ascii?Q?fN3dmO6OOv9IPKWThbjXtWsz7HAHFg5y0gt3061KQmw3iLUh2y2zoUSAYhgB?=
 =?us-ascii?Q?RqBVJmXWleJ+I1zRJJS+DgYESlvMnski7wNXK3Pfza+qImjHpKAYbFvQsBOn?=
 =?us-ascii?Q?snbjs4h6gh2M6AMmFujUImNNyYyvMWpz/Zbg7E2FKa3v/ycRofkfaUtzui0Y?=
 =?us-ascii?Q?Q4h+QqRzURLW+zBIarCe89TKpwbj2hXOxBVDkM0AH2sWPtCke8OaeXFs+3ub?=
 =?us-ascii?Q?NYsRvSw9AwJioV78auFm1660LAmf8arbhKekh9GVUtCKzFS7sfdGs7c/BveD?=
 =?us-ascii?Q?N5rissIo9tY82ni57HqyNaq34PH49G+kq5jL2JZE3Fyg7VoOh059DHZCyIBM?=
 =?us-ascii?Q?nlS9KR3VGozEDcNprolLxIrc9cwv9CNPKUm2wZJTYYqwhxzYY/oilET8ysd1?=
 =?us-ascii?Q?IAuQdJeuSrjThC1WC0RW+yjoD4aUAgkhEDHZhOYW519G0xgOZZcfqQiJm/xu?=
 =?us-ascii?Q?YbiyzjGUUtgBBH5y3nvx9IcYGW3Flg6TVs3TPIlC4FoawEEWJ8H4ouKtZFEm?=
 =?us-ascii?Q?O8Hy6f8FEXyFn4+0ixHq9ZxIk7PjC4gcuJNEArhDXjRbQs6ODPWhuhzEbEl4?=
 =?us-ascii?Q?bZphWkZl8FxFg+KnFmbjLGRcq41R5FsCIlqsigYhgZw1eASj9L/CyWg1vLRL?=
 =?us-ascii?Q?mEBmid42n0D+C27HCE4adrb8H94Zs/Jiqm1N8K5OZ8ROfDAVANVajSA/zt7d?=
 =?us-ascii?Q?hL4qYzqYMoTYn16TKI2CIWQLB6qHFKYnvArMTo61xLiaixBxMRRaG9631+eR?=
 =?us-ascii?Q?FCpgsuTXkDyfUHbbSftN0iheFhz05pE4Eq7S/qjP5T89Wjbt2xYPdWBylNye?=
 =?us-ascii?Q?xVIDgnY8FFnZwFT5wFCG+wPqRaAbiYOwRuAGP2z5HxR993pRyxpp6+ksjEal?=
 =?us-ascii?Q?Ze/NF0r+/2PotmwZs+ayDkxtQ2Z4teT4y1kQhTalPJfCGtMqkCH3mDVi3qR7?=
 =?us-ascii?Q?FWfuQB5zJkjhWN1wfEQx1uXFxgdvxDSd0l+Rmysb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb683a3-b63d-4273-bc75-08de3dc1e72f
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 23:13:35.2307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBe7kX3DK7RnWjD1+VmuRQl4RiGAjiXbNin12ZTq8oYnK4JMCggsmVhG8YxMLkmuaHTbZVSETZlZYbU9/c6WsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_151341_808522_7285FB6E 
X-CRM114-Status: GOOD (  17.35  )
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

On Thu, Dec 18, 2025 at 09:29:44AM +1030, Andrew Jeffery wrote:
> On Thu, 2025-12-11 at 13:35 -0800, Marc Olberding wrote:
> > Add a 128M layout for the BMC flash chip we didn't boot from.
> > Including
> > this allows the user to write to each partition on the alternate spi
> > chip. This dtsi follows the existing standard of using the same
> > layout
> > as non alt version and prepending `alt` to each partition's name.
> > 
... 
> This may be fine, but please add it in a series that also introduces a
> board that consumes it.
> 
> Andrew

Ack, I wasn't sure how to handle this, since the MSX4 hasn't merged to
master for upstream yet, its just been merged into the openbmc tree.
I can either just hold off on this patch or update the msx4 series.
I'm assuming that including this in a patch targetted to the openbmc tree
is a nonstarter. Any thoughts here?

Thanks,
Marc

