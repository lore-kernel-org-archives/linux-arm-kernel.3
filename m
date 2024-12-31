Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A6BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 14:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bs7CcMWZgcAEozNy8RTwYNNuZ8MI7nvdwRRDEngzSzc=; b=J6N5X6EOJmBDbQs1YOi8K+vhGk
	VmI9sDZQsAAjWxTEc3YORdAEHKtfHLIF3PZozPczEOL4qU+ckg0tcgztDH37IbSL0FpL7Poi04gJB
	2n0AHEC5ZRyPymjhls5/Qnud/13KSO8/sfqVyiOszfdlm/ZUkhBdIR0uFkGgRyxWjvMK+/n2k51KZ
	tkFwZn+nPVerSmWzzDKHUrh+eVGlmTMTXfFczj+RLaabKrioxNX4hOtY8uWam8/Q05mThRgQe8OkI
	Dy+LMtZlNmhSLks9W2ah4YRq2IPLMmM7aIVmlGXE7a4m09C+A6POVlGPArIZ6xQVmLZgYJcBek2zP
	83hNnlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSdT5-00000007KqU-1cZi;
	Tue, 31 Dec 2024 14:43:35 +0000
Received: from mail-am6eur05on20622.outbound.protection.outlook.com ([2a01:111:f403:2612::622] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSdRr-00000007KlR-1a2L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 14:42:20 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IfytY2EIaOgj+MEdUZiiHKNHOuJEMeOfqHQQj9+i72RVrVmzEQmO6cJqytXKfzqDugMsafE8nizdjASJYj6ym6KMyzYcN+MBDRVLrfX+dgswhpA0miQcyST59jpXdRBQkc3BOGlUz7okvVasWWsaSG+Y2pNcbnfyociJSJvXA97X8SyM1RZ7bzofnVk8H+MhPwOjIaQvVA24a5GlBsNpjezgZJ4yU+BeP8711tz0lXNr/8oPSSjAUI+zhTfjRBbZ0A5ijqlNgqdpY0ZEjOJS/bXUdCRGlpOETELGKJI9co5XBkW3LSI7exIkwNxf3pIzvVMcwhBXyVo7qZaAaYy9bQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bs7CcMWZgcAEozNy8RTwYNNuZ8MI7nvdwRRDEngzSzc=;
 b=hvAGn3JRWbf+Lm67cNmXfnkYGKkXxkZEgppwbAyNvdqtewucZiVVKDsq2jowhaKcA4/3WmChBUTFre5VzdurokevSuBFKXiK6jhHoKiXc42WmXyoRdY2r7jFl2tNBSXsTB5wfiinZrzNQcuW1mbGSCjbYWEjGrQnnab1t5bz9iu01cfLEK+5LaKw1fqHjR3+cdbE/czRFkG8lwpK54AZ4HGxffXqaJWAO1gYjp3E/JvG77StjayHEkbX7e32DSNeszrez6MQR6mEzfu8/rfmcTCzthgl3w7V6GcuDAepvvUdNiDfTIq76qRb/D5vxLjZR13/l4VEoyaH94rbB3hl6A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bs7CcMWZgcAEozNy8RTwYNNuZ8MI7nvdwRRDEngzSzc=;
 b=Iw9n1TrN2PQd2kRX8m2Ydzr6TPCEHIPhddRK7QOBcPxVhaYhE1aSdAN73mmc7iApeVjMd+jbZG+jXDbW0hdD0PHMrHlwo9+G9Jl6hKwcACIu49QyfBAtzsrsXRlEaI2lbFmVLOYWiA7Z5mlYTPgC0PtXL3ScwV8YxVPtjDJsCPQ=
Received: from AM0PR02CA0169.eurprd02.prod.outlook.com (2603:10a6:20b:28e::6)
 by AS4PR08MB7579.eurprd08.prod.outlook.com (2603:10a6:20b:4fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Tue, 31 Dec
 2024 14:42:07 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::ac) by AM0PR02CA0169.outlook.office365.com
 (2603:10a6:20b:28e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.19 via Frontend Transport; Tue,
 31 Dec 2024 14:42:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.11
 via Frontend Transport; Tue, 31 Dec 2024 14:42:07 +0000
Received: ("Tessian outbound a83af2b57fa1:v528"); Tue, 31 Dec 2024 14:42:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5e3fe5405d6926b7
X-TessianGatewayMetadata: w79iNV4zbA2ySQAvYB7gARGNqEa7LUN8jV06Gs4lmRV7tMFwzxCu8pvOSTDy5UcPdoqy4tPNUxihVdyhGHrQCZ7RMeM0iwjJlW3H0hhMRCHjE/gApZ0IoiZ89gOIDMav5qOcbt+V67KXSlRA7Z1s3hitmJYNYVE2gJUxwWCTT6ANQsAwBse23IuBHa7fG+FF6NcK0zh676IRxgObdIy+5g==
X-CR-MTA-TID: 64aa7808
Received: from Ld51b47489df3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 966DBA6B-8E98-4698-BD1B-D94B4E05562D.1;
	Tue, 31 Dec 2024 14:41:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld51b47489df3.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 31 Dec 2024 14:41:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtOnVRjdZJZ0tiNH7DVmetemrn3ktj8sQTfY/1JI0yc9sORUTBsimLADsVrZJg7Tbdf17BjIi7cCONqm2QpXpPSgn8QbJKcDLui3EPOwrQxSV+N4t+R2aXe6EIXnbxR11MPzLThk89UvSGSyal2YhBW8+WIJCQKx3ghPXfIoQh/Vt9H97sqI+f4kvtLBZ1CSyRa277WpdCnju/jwdTERzZRTuuEDFGWUHn9LiJoNlFgAS6mXZd/JjmbvXzYJ3Xjp4DyzPIHCRsTSqCO2OgVakp/MYN6viM8OWs+B0VhQLmaD72tU7QlpyIVQWqrqHbuZ/XsibDTfqoEfsN6dy8a5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bs7CcMWZgcAEozNy8RTwYNNuZ8MI7nvdwRRDEngzSzc=;
 b=sthBXKXEUNJgS+XM3BiYaLdZF7yGWBqD1AyrzZmoPaXzd0GP0h7JlFa/PIKJWRxeIqH0i6kq7UD35TWttWcB2FR46dshO7XfiHsa3OAnyrLeewOb8OZQywNrIyA3Wm0XAiHDF8ZYTRWym5UfPc9j5tpD6pOYzFRvg+lrXjiKONdca1gKBOXYoiL8H/CoVZsRlPeDwp8C9QXfcLJ05cRcv+WVJwT5sLKg/tQMAugocNUEaisByhfaoGFAdbb9AKTHMkXml6Xo6J0lU17CaLZK6ZXTamT+wMRcZRgOtls73iqwFB25glA/g8xvx4fexZWpY+Di+ykqTXAuQd8ga9lVRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bs7CcMWZgcAEozNy8RTwYNNuZ8MI7nvdwRRDEngzSzc=;
 b=Iw9n1TrN2PQd2kRX8m2Ydzr6TPCEHIPhddRK7QOBcPxVhaYhE1aSdAN73mmc7iApeVjMd+jbZG+jXDbW0hdD0PHMrHlwo9+G9Jl6hKwcACIu49QyfBAtzsrsXRlEaI2lbFmVLOYWiA7Z5mlYTPgC0PtXL3ScwV8YxVPtjDJsCPQ=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AM8PR08MB5714.eurprd08.prod.outlook.com
 (2603:10a6:20b:1dd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Tue, 31 Dec
 2024 14:41:54 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 14:41:54 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Suzuki Poulose <Suzuki.Poulose@arm.com>, "mike.leach@linaro.org"
	<mike.leach@linaro.org>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] coresight: prevent deactivate active config while
 enable the config
Thread-Topic: [PATCH v2] coresight: prevent deactivate active config while
 enable the config
Thread-Index: AQHbVWv5hfJj9J3fYEOw/9NUV0Uz4bMAeV/E
Date: Tue, 31 Dec 2024 14:41:53 +0000
Message-ID: <GV1PR08MB10521F85FD35241F9F3391B21FB0A2@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241223185328.1339616-1-yeoreum.yun@arm.com>
In-Reply-To: <20241223185328.1339616-1-yeoreum.yun@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|AM8PR08MB5714:EE_|AM3PEPF00009B9F:EE_|AS4PR08MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c02ef9-aed4-403b-e7a4-08dd29a94d07
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?clI24LGixzjiKn2XDdo/MzdUGSiGGyERD5BTIiXLvPeOK4QLsaYazOkei8UY?=
 =?us-ascii?Q?Jqih87FRTczn92m0p3G9TDapAzr6qlzWvVjLlg9pzUQcZujyoZN+L5hNsSSP?=
 =?us-ascii?Q?4WRR28Cy/nskU9T0huMvxBUtoFig7hrknUtUeBb7K97g/4TEnT2SeBVnjdWU?=
 =?us-ascii?Q?oJr737ON+LyOgckDHdDO4x4MARogr5nZrkV9Hya2hrHTyLNBGYci/WR75gFz?=
 =?us-ascii?Q?irQDI4QaQsCzZ84LLubN7yzGFXCkrBWgGPQBBLGPMOXTdsp5K2XFpoX9gT/U?=
 =?us-ascii?Q?I5NDRNyCzhRdHEingUpHnNAbSXriyTpunnsRwG4O7WuwqhSaQ2blE2lxltXm?=
 =?us-ascii?Q?nDi3lia57G3XQ40sTt4RTDxS/iCjpx+ObPHN1H72rZtgIpYc2Dpm96CzaKRv?=
 =?us-ascii?Q?EFO+IA8+ragfdAQzxiv1U+/KEpts9094/0wNRmF1heI7NUBOkzDSpCDGckEk?=
 =?us-ascii?Q?dd9ak0ODQcM5NCHz1D+S46l36NQBtq5IChjAITuOuxm9/MTJzJrBkfXoyxEu?=
 =?us-ascii?Q?X0WQqal+wV+uVfehvkPO5mKsgwWsD1x7vYGHQUIgzkkAJsVXeV+Uf3s79EXX?=
 =?us-ascii?Q?twQNuGyTJrQyTQ7sGOwHAKVkHNwUOE1uIckjqlqYlENT7l5vUzbr0d1ZNpvj?=
 =?us-ascii?Q?XCpQoWlfk748juyM7009WX0db1TyzRbHbyw904IZXQRQN0SLE3YTWtayc/na?=
 =?us-ascii?Q?Tto/+qqbNur0tcio4GYKRB1ur0Sz1LrJbVckTVRNKnCNHkDLFGjUOL7mhB5m?=
 =?us-ascii?Q?QqB1/zYs+uz15xDeqndaPc3TfxZlrmpH0ykpjOxWV8sHlxJuQ6DIsgbuHxU2?=
 =?us-ascii?Q?7R86dDa1ICcWZUnTpdzDhtPzDpyo60f159hzgR6lLzB401UeGI7dRR2uCRlb?=
 =?us-ascii?Q?jae3uR9P2/jc8KVZA1JLXwC/qIdOR6jsT1LG59uqigrZNQAVCS+QTsmsyz8b?=
 =?us-ascii?Q?JZwQQFwzy0S2U0HBj+UIuLdJdZbLWkRO5TbmOI87ODMPYxWNTJeDzj1SQqXj?=
 =?us-ascii?Q?wvsfKSGuGhkdIE7BakV87NOUQ2bf7TAHbw79dzaYkZmZwrApKwWRwHmOpky/?=
 =?us-ascii?Q?CW/y8+5GB+lNBIaHVWr13QLD7c2XtO081c+bwoQpNGm3Oe9JRFl7hfU81mW7?=
 =?us-ascii?Q?SusqgVFYb3UDitpJTouyiZpNIQRt+gt5C/y01zYcw0cbbO0Rd66PmGkhjfm8?=
 =?us-ascii?Q?Q4kW26wUt7kVvCkcuzMy9BYv0WcM1wYLTCjih3+rSHn0W+ohi7V2PXWI+n+q?=
 =?us-ascii?Q?bMfT7mZrYmGsoEGCBWZoW9rYlydt3LEawP1oztBj2O7qbjmGw0PEkpyH13s0?=
 =?us-ascii?Q?tIsYtU3VZw+IFOtBEq0sPe1YQTpSx4Vckb9wTPOhv9isMQTY6WFlCZL8CU+D?=
 =?us-ascii?Q?9K6OwpeOKj8J9bBQU3XWUVTwaZjjDKWHpH6bYjsrppSjYpOy07AWir64hUEo?=
 =?us-ascii?Q?sCA8Btog6KYpETSVWKJLR/svBjsfos/K?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5714
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8b173cd6-c6b5-43da-bcb0-08dd29a944fc
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|14060799003|36860700013|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MJ4OaoAdMAMjVzqbWSnBI8308dz53BJDoGtVQysbMUkWiRhPHEKdWN9bPGDS?=
 =?us-ascii?Q?z2FMYsqqyvOyBQab4SZxy9Emlvr7LnP9Z9r6jCRSDW1bFLiiPGngW8s5MDmb?=
 =?us-ascii?Q?FPO3P9O6XJrbu0l4Pl2XzPJwMgHjNY/o6kRhKzi5hQJlkMdu3z11cK8rulv8?=
 =?us-ascii?Q?o+jlaNLhSSmRKyYbtItFPs6ov4pKxj806UlwNMsicXPIISBaeZ5dU7soEcA0?=
 =?us-ascii?Q?I2Y9CjTZCLDXEVGVQI4bEhdxSQjw2G/cRsaRj4+tjXiD9OwmGMQHte9SQzM+?=
 =?us-ascii?Q?Xm/uC4NR+k26NHp+6o9mVfYarsffdc1znPpxHlb4rIxvINubwVZUexABeBAi?=
 =?us-ascii?Q?ghQQCHWyws+ll639lh8NmKwdEpkT3/zrG0LCooPre4GwVqg6zMBil2y8w+b2?=
 =?us-ascii?Q?Jk1zhDpJ5qW79Iz53mHtb69q/FVFfJX6P5GitjgLfWXP+X4BLr/UvP/xEgDJ?=
 =?us-ascii?Q?lAnsNv8AhkHZ4dkjX8H/pTWgbyDYoHhrBwXgJhzCZZQlFqCsZPQJfp2NDZvR?=
 =?us-ascii?Q?dhK+SUzvCXH7t86yVXAq3BTNUBpgPjXW9KcJF47v6dFiyigSSRQhBvNSAS6Y?=
 =?us-ascii?Q?YdWtumD5L/43zaCH6ZBQRsj7MGVSwURVbOMyL802hQDgASZ7KiHHK/gHaSvw?=
 =?us-ascii?Q?Fc8IgvksAa4UFJj4NJn30QvUK/dC5W9JOvh3ACHD73290KBAtjbW+1vmorUi?=
 =?us-ascii?Q?F7d9BBP4YtuxcslGTiM9PD2KZm/RmvNsb+OwxPs4ypSmahGEeNaLA7jUpPZn?=
 =?us-ascii?Q?s6W2pDwdt4VFx2NUVDYSlQPDSlwEl7z0YHbKPXW+3f6yqDgbVgE0Exzuq40r?=
 =?us-ascii?Q?o3lBgWf5zti5paUTNk9AT+EqAYeMOt+T6+Ug2SdMQ64GO+RiBMlJjv81wYMU?=
 =?us-ascii?Q?UyUpV0k8CK846FKIb7cygqO58OcoFiNReQWdyItZ9qxj8SMtwz4zsO5DRFl8?=
 =?us-ascii?Q?gTsTlB3slM8rO3kEvsYCSDIWWsjPEM4A7pIq3S+53GXB/R9NVW91hsTg6E1/?=
 =?us-ascii?Q?qH4mdMpcObbm5/oxHRU7Mq8S4sEoo9eykoWKLoAQOa8uDizB24b18nsdZ1vj?=
 =?us-ascii?Q?1v/f9t+2/8lydy3RC61HyamEPfvK1WhMURm8GP5FZstFec8Q/1W0m37pKpP5?=
 =?us-ascii?Q?Dg7+KlKLJyFDNjNh2Ylm2E1RgZogwoncEepWNfsLHwVLaWEHAcrzBW/Bktzj?=
 =?us-ascii?Q?sA4tfryC+yAbtYPas3yhUO9/vmyefN6uAzl0GEc0SmzFyszWQb8aRHlXx9ly?=
 =?us-ascii?Q?XMHd3CoKkjeOQL4krUY64mZr5qct6LrBoojM/g2pGBMUzSgv4lOpnXbmcJ5u?=
 =?us-ascii?Q?NSMC/HX03Vbm4e3RpIK89Z8JF5+TVww7nV0MhobamHK1JyaZWPYvEpmmhrQL?=
 =?us-ascii?Q?j4BgywcAJSivL1+tGFRELK7kx8fH0yIvM4vnojlWnfeUqba8BGh+tZQpNpop?=
 =?us-ascii?Q?7ALpbyrLRTO0EJeVP4B60tVZuklEUOtB7A3kXgcoqytcshyTrWIB3kKkN+7t?=
 =?us-ascii?Q?TyhexmBdq2XS7j8=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(36860700013)(35042699022)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 14:42:07.4428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c02ef9-aed4-403b-e7a4-08dd29a94d07
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7579
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_064219_577577_B61189CA 
X-CRM114-Status: UNSURE (   6.29  )
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

Gentle ping in case of forgotten.

________________________________________
From: Yeoreum Yun <yeoreum.yun@arm.com>
Sent: 23 December 2024 18:53
To: Suzuki Poulose; mike.leach@linaro.org; james.clark@linaro.org; alexande=
r.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; linux=
-kernel@vger.kernel.org; Yeo Reum Yun
Subject: [PATCH v2] coresight: prevent deactivate active config while enabl=
e the config

While enable active config via cscfg_csdev_enable_active_config(),
active config could be deactivated via configfs' sysfs interface.
This could make UAF issue in below scenario:

CPU0                                          CPU1
(sysfs enable)                                load module
                                              cscfg_load_config_sets()
                                              activate config. // sysfs
                                              (sys_active_cnt =3D=3D 1)
...
cscfg_csdev_enable_active_config()
  lock(csdev->cscfg_csdev_lock)
  // here load config activate by CPU1
  unlock(csdev->cscfg_csdev_lock)

                                              deactivate config // sysfs
                                              (sys_activec_cnt =3D=3D 0)
                                              cscfg_unload_config_sets()
                                              unload module

  // access to config_desc which freed
  // while unloading module.
  cfs_csdev_enable_config

To address this, introduce sys_enable_cnt in cscfg_mgr to prevent
deactivate while there is enabled configuration.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
from v1 to v2:
    - modify commit message.
---
 .../hwtracing/coresight/coresight-etm4x-core.c |  3 +++
 drivers/hwtracing/coresight/coresight-syscfg.c | 18 ++++++++++++++++--
 drivers/hwtracing/coresight/coresight-syscfg.h |  2 ++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/h=
wtracing/coresight/coresight-etm4x-core.c
index 86893115df17..6218ef40acbc 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -986,6 +986,9 @@ static void etm4_disable_sysfs(struct coresight_device =
*csdev)
        smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1)=
;

        raw_spin_unlock(&drvdata->spinlock);
+
+       cscfg_csdev_disable_active_config(csdev);
+
        cpus_read_unlock();

        /*
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtra=
cing/coresight/coresight-syscfg.c
index a70c1454b410..dfa7dcbaf25d 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -953,7 +953,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_des=
c *config_desc, bool acti
                        cscfg_mgr->sysfs_active_config =3D cfg_hash;
        } else {
                /* disable if matching current value */
-               if (cscfg_mgr->sysfs_active_config =3D=3D cfg_hash) {
+               if (cscfg_mgr->sysfs_active_config =3D=3D cfg_hash &&
+                   !atomic_read(&cscfg_mgr->sys_enable_cnt)) {
                        _cscfg_deactivate_config(cfg_hash);
                        cscfg_mgr->sysfs_active_config =3D 0;
                } else
@@ -1055,6 +1056,12 @@ int cscfg_csdev_enable_active_config(struct coresigh=
t_device *csdev,
        if (!atomic_read(&cscfg_mgr->sys_active_cnt))
                return 0;

+       /*
+        * increment sys_enable_cnt first to prevent deactivate the config
+        * while enable active config.
+        */
+       atomic_inc(&cscfg_mgr->sys_enable_cnt);
+
        /*
         * Look for matching configuration - set the active configuration
         * context if found.
@@ -1098,6 +1105,10 @@ int cscfg_csdev_enable_active_config(struct coresigh=
t_device *csdev,
                        raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock=
, flags);
                }
        }
+
+       if (!config_csdev_active || err)
+               atomic_dec(&cscfg_mgr->sys_enable_cnt);
+
        return err;
 }
 EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
@@ -1129,8 +1140,10 @@ void cscfg_csdev_disable_active_config(struct coresi=
ght_device *csdev)
        if (config_csdev) {
                if (!config_csdev->enabled)
                        config_csdev =3D NULL;
-               else
+               else {
                        config_csdev->enabled =3D false;
+                       atomic_dec(&cscfg_mgr->sys_enable_cnt);
+               }
        }
        csdev->active_cscfg_ctxt =3D NULL;
        raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
@@ -1179,6 +1192,7 @@ static int cscfg_create_device(void)
        INIT_LIST_HEAD(&cscfg_mgr->config_desc_list);
        INIT_LIST_HEAD(&cscfg_mgr->load_order_list);
        atomic_set(&cscfg_mgr->sys_active_cnt, 0);
+       atomic_set(&cscfg_mgr->sys_enable_cnt, 0);
        cscfg_mgr->load_state =3D CSCFG_NONE;

        /* setup the device */
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.h b/drivers/hwtra=
cing/coresight/coresight-syscfg.h
index 66e2db890d82..2fc397919985 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.h
+++ b/drivers/hwtracing/coresight/coresight-syscfg.h
@@ -38,6 +38,7 @@ enum cscfg_load_ops {
  * @config_desc_list:  List of system configuration descriptors to load in=
to registered devices.
  * @load_order_list:    Ordered list of owners for dynamically loaded conf=
igurations.
  * @sys_active_cnt:    Total number of active config descriptor references=
.
+ * @sys_enable_cnt:    Total number of enable of active config descriptor =
references.
  * @cfgfs_subsys:      configfs subsystem used to manage configurations.
  * @sysfs_active_config:Active config hash used if CoreSight controlled fr=
om sysfs.
  * @sysfs_active_preset:Active preset index used if CoreSight controlled f=
rom sysfs.
@@ -50,6 +51,7 @@ struct cscfg_manager {
        struct list_head config_desc_list;
        struct list_head load_order_list;
        atomic_t sys_active_cnt;
+       atomic_t sys_enable_cnt;
        struct configfs_subsystem cfgfs_subsys;
        u32 sysfs_active_config;
        int sysfs_active_preset;
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


