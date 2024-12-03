Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB371E64A93
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzOdIPzFyCUlm6nJrSEhIB6pmF0cEZS3VsXZaXcMnJc=; b=tgLhHEQJjVzhUbGD+RhqUdpLa8
	eRb+y5YI75eKZjEk33jYLyhUp8qGApKj9topDamDtia4yJTKjMA0ZX5UGVsBPoR+XXvPc/cB6y0v8
	/OcZl4SiHQQS9VZ6vNdS1R6JxzwjAo22QRIfDoYYw2neo20O2NdqNqQNprhgCpqtebfNf20rX75a7
	w3kfidbtf8iZt4wpGfwJOh3Jb1S4jcoZ1ROLSJbuTO8u2pOKwwKxpv9217xVdAPWG3x9AyBFoCokt
	eorAI7T/jw/x9Ec6/Lx0ciK5W/7+1unoJmtonPqGA2an2H9V8bIaAlVExF4U0z3ahJCf9v2/C6g3O
	ppCaWXvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIT30-00000009cs0-2Ju3;
	Tue, 03 Dec 2024 13:34:38 +0000
Received: from mail-am6eur05on2060b.outbound.protection.outlook.com ([2a01:111:f403:2612::60b] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIT1z-00000009cl9-443y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 13:33:37 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Sx/RAW42E7X6ZklZH5MJEEOv93rzBJclW1NzWphXxS/92vYz5xaj0DdKKgHx7hfjqJ2IuZ7k+2XudMqu8M3EBltdHPm+0W/w+1/fJxl5/UI1WzkhLiCog2L4dceMDpfWfKqe6Lt/3ZOwpqzk9+WzPoZEPGT8DVsraxHRNANRpRcRnWz41AUmiq6b0/BNDtr46+bIZ0svxZTE+5+X4goqMUXAHo8jYPDn7P3w5ZSldrgpHI0c3BdlxgqpxQBaLuYJ1OyT9153yaQoo07HVjJ8xCn8+dN1r8cCPKPzX65CJPWlSkr9LA1C6ewiNWN6f67nnkhUp4N8Z5MuTobEWl+PEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzOdIPzFyCUlm6nJrSEhIB6pmF0cEZS3VsXZaXcMnJc=;
 b=G0Dgs03iCeFaZWkQ5MMmo1FvKcOUatH2LdbzNdYVmwgeeby1VwTus84KBsARz35/lRxWRDwYEMXa6pZ+ZCAuLnTd7nbz7Y64BR1nRUuJOeChbDTdSeAmIEbX7W7nyDrDO/GZSB2CLgGHY0wnG+sVUE/ixrJeSCPLkkyDXhLQBXLxLHRcAtRdx/7iOmbhYvDdywoPr9UIYQxuaG0D+AlUhp3cyawFkFy6Iw08JcHlZBNeZQJaDk+8JIpYbgJj4n/mAT1h72QMxB4MLLEUQ1z3rEvW15elOfeNJS7yHuwg8py92WG1LQO1JXDpZoztDKWKXpyEphs/wfEWGBDY8DLvqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzOdIPzFyCUlm6nJrSEhIB6pmF0cEZS3VsXZaXcMnJc=;
 b=WaipvARB/kvTpJ+Ail+Csl6cG5YheHKaoaHO6Ux31CiXAQpXOpa8r0atFVrAmuy5CVU1btoBYqGUwK2eUY6Tv9DKf+0J0HXdwrTuNt8213VD6cSFehoN7gceb+D96WdZGGTkb7UC5e/m6K53JbOSkDJFSlwAAeS9FQMp37NjUFk=
Received: from DUZPR01CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::16) by PAWPR08MB9613.eurprd08.prod.outlook.com
 (2603:10a6:102:2e4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Tue, 3 Dec
 2024 13:33:21 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::9) by DUZPR01CA0071.outlook.office365.com
 (2603:10a6:10:3c2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 13:33:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 13:33:18 +0000
Received: ("Tessian outbound 206fab1c37e0:v514"); Tue, 03 Dec 2024 13:33:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 38fca3520531b41a
X-TessianGatewayMetadata: d5zEwSyy8Z3ZQ+GRErxnnH0N/utHvgAkE1LP0sJ/9X/ijHDOouCljTX0tIkQQelnBLDuKBNky1WMrqMR9KsGTHw6mAfm9gqx8tK17QDufDHnZAMBvOKq6FUc1UdO2irqqTLrFU+xsikznvBfh66PwQ==
X-CR-MTA-TID: 64aa7808
Received: from L7d1f6cb4e129.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AFBCA9DF-A644-4E79-83EA-917BB3F5FC81.1;
	Tue, 03 Dec 2024 13:33:12 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L7d1f6cb4e129.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 03 Dec 2024 13:33:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrX7hs/2O5W3iBcc3YHZTN00S8PXNGNEbCVo8VNKfNVCLrbMHzwdEXcmCzDgOdYlOpWzkC7Lc1i6VSKqeX+R9EVpweB5I9ZeybjQVP7qMNXOsxoI5/k/0okC+Sya3pSPsA3P/L68GOI7RydJUh/8hZUoDkBGtgW6M02SKGm4XU0vUeYKw+PJ749d+hcJz8ccjDB/2A1V6QfIgt3m+HKWiPh0VZIPn6+mcv47T/ox7FzQHoG5cM4LnDtcIfE4N9Ml/0QVopUEXqPv3K1W0TMl6h5PdC8gCDywmGX9AtnvS2xv3/7e8po67W9sAviZAqDizpqFfvQFUKFOcbgAO+2xUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzOdIPzFyCUlm6nJrSEhIB6pmF0cEZS3VsXZaXcMnJc=;
 b=WvD/Rz8ykrynw/DWXvbf3fkuYG3A70Ns6+0eEpnK8ohcArcbT3k2YsNx/0Cz3gPcNPGMLfod4K8K24AlsiJR8OFMbYplPHyFynF/QwpTuKA3wV8d0J93k4hwo6iSGKd0SG8FY6aQRTDPOII3CS36kC2rYxCDRoSF6eh60OmLoEfaWRHyGbwhewwxuIcq4YxfYuUlZTl6IG+9H+Patbojn+/fcCFUYginkcQtGowMnhwxWTxDZ9Xihv8BDtZDgPrpxxAIuJYfKt+FkLcrH9RYeecUo4UtSSr6SIqNlfNtYgpL/J9uQoaYX5MZ7nzmwUv3Hl7jZi9fa/HasXVAixwrWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzOdIPzFyCUlm6nJrSEhIB6pmF0cEZS3VsXZaXcMnJc=;
 b=WaipvARB/kvTpJ+Ail+Csl6cG5YheHKaoaHO6Ux31CiXAQpXOpa8r0atFVrAmuy5CVU1btoBYqGUwK2eUY6Tv9DKf+0J0HXdwrTuNt8213VD6cSFehoN7gceb+D96WdZGGTkb7UC5e/m6K53JbOSkDJFSlwAAeS9FQMp37NjUFk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB10069.eurprd08.prod.outlook.com
 (2603:10a6:20b:636::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 13:33:08 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 13:33:08 +0000
Date: Tue, 3 Dec 2024 13:33:05 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] firmware/arm_ffa: remove __le64_to_cpu() when set
 uuid for direct msg v2
Message-ID: <Z08IkRcxpBGUDozj@e129823.arm.com>
References: <20241125095251.366866-1-yeoreum.yun@arm.com>
 <20241125095251.366866-4-yeoreum.yun@arm.com>
 <Z072Mm61eE_Twx1B@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z072Mm61eE_Twx1B@bogus>
X-ClientProxiedBy: LO4P123CA0365.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::10) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS8PR08MB10069:EE_|DB3PEPF0000885E:EE_|PAWPR08MB9613:EE_
X-MS-Office365-Filtering-Correlation-Id: be8c0e41-bd64-4514-7cd5-08dd139f0c62
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?XBd3INCPD1SxPtrotsxA2km03XvomXLkkwHmc6bsm8objvSz6sEl1vzVkdkt?=
 =?us-ascii?Q?KgyOiCHNa6dERMcvnWUAdkvyqnO3vc+EIjqDhPtGzpc8sCnHBI7kJ9WMhM1E?=
 =?us-ascii?Q?Juq53CpsZ0CHHmFXdMQ3/wEIniLe+NHyNQlkbJSXUIRv49XcD60vnhAH0uG4?=
 =?us-ascii?Q?L7EU4M8Mn5L3HtBrBZoCbLPDmZzOuji3rjH88ilQyc0aI/ONjvVdtY13agJR?=
 =?us-ascii?Q?NPymdS8P9I8R+e6d4WAZEe11fviHYgL4hB/HLND/n8jPStuci8NQrmPkrnHb?=
 =?us-ascii?Q?vkEHpFPboD+Wvo6jU+5tXTT4sSrmWc1rfRVeVsImMtY4YNq4F6StjRCubDuH?=
 =?us-ascii?Q?H9PadbGfgdj/KgMyQLlIxq3+YPNU0ZmnBDB4uArSpYNTkpqF4zFpiteOcejS?=
 =?us-ascii?Q?kye6yluHhTP5q/GsWCLFn7ksx/D2OsCCpTUjD65uHkSh57CrHtH3PoHkVoKT?=
 =?us-ascii?Q?zr+R9gucCt70vZuDyDF6H0FXvqARzSvhmLNYv248q9mHLOJqsbp+O4d1362r?=
 =?us-ascii?Q?tdvmtBsyhbkEezKVbE263bUXiCX7yzlOe71Scyj4MRctkoxpD0+4NuT8jm6g?=
 =?us-ascii?Q?dZY2G78xUO3fNv2lKYZByfWheBOrmTmIG1rAj2Tgmzvcma5+Lna3vAjjv0qo?=
 =?us-ascii?Q?Gsiveno0B/eLaYLIQzDD/XbFTBxo5M433X81/q+/HJxaAxa8hFIGkXFHKAI3?=
 =?us-ascii?Q?h1MwsdA+Y2Ll07VXk2wXvwBWmPQluvMIAT94MAP59o2ukx97hjUAltF+xxyw?=
 =?us-ascii?Q?62tuqrnDLv3kbwpUL7ivpoQ26ocYkRtJvcnwTg+TfQh5qQuIV0K7p1cXpOV/?=
 =?us-ascii?Q?SzpIT4LY2lj2rRHBhLfhV0MnL8CrOS3F6LlmZUEiFqijuLIPOlZ0SBrEOmBx?=
 =?us-ascii?Q?6KuHT5o8lVkJuY/blnbbi2imuytDEv9AORwZVArYNQA3Y8lMrMkRGfkZHKnt?=
 =?us-ascii?Q?N8GA1G3D4rQ5GI4cRW5Tuk6skvsH6EIRDuWhKHk+mIrRo0hhu5mGWWhArCTd?=
 =?us-ascii?Q?GigPOUvUjKxMvM6ci4pGzABPLf/8yJFGwVD0xwOVkWucBdYpKCbYRSa5TMiA?=
 =?us-ascii?Q?bz4BkTCqy1bfygU6xprM/08PovyN5WKLQmA4xgmcGS84TNy7ENR60A1Fcjvk?=
 =?us-ascii?Q?YHK7ELivH8FhXPQ599baJSzG86e8OXN8IgVe++6mjYbNfP0AUOz+RL50vQdE?=
 =?us-ascii?Q?HJBxW+5H/1YgCPZ/aq6TfWqGx7ZJNBJXyLzSPnfK63CD63l1u3VyyKNFMIgG?=
 =?us-ascii?Q?+NiYENMACqzhLCwqiuCQw+PaMbQXK6vkH1+mjGoC4L2wVlDSDkWjSbmkH0Dg?=
 =?us-ascii?Q?SzypfADUY21TOHgOcecELrL0qy+yjTTaITbMd6vb56xKFA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10069
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4861b92b-a6c7-4655-16cd-08dd139f0655
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|14060799003|1800799024|82310400026|376014|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BhbNCV/rFnBsfGzwnspXZTinE+0hVEYmBbqOslhR7KSmE+tLBpTcv9qaFIGI?=
 =?us-ascii?Q?kPrxqGfzx8QNKdfmwqiMI3TO80BoPq4OtHWDzzTEp8LVbGgoQRcjw6/6xK7x?=
 =?us-ascii?Q?nt6vovEQN7tN4kUX4KlC4JDWlLf+KXc3kbKJfrNGBhX5SWrWsjWe87+PUMeS?=
 =?us-ascii?Q?SYh4TD/8KYzc5hIokdNVlotf/Hmmi9xICIT0NwYz3OqTe7xRvUJObvcfyWp2?=
 =?us-ascii?Q?68GxfrcwGpgbaeogSl0opyLgL6WNdgx1l1pgsKZvlcmfLYeFH6uxyfCIB5Tp?=
 =?us-ascii?Q?ahyckdcSysBGfjpltAyg+yV0fdMDFBgXuJjeuc5ZbnBbt9ukKu6pKdgvjvlK?=
 =?us-ascii?Q?a4HN8KSUUMDjFi0blf4a5LC47MII84PQkTxSk9kV/uw94JQBWOfuuobz1lHR?=
 =?us-ascii?Q?SRZbt9QOlzjXl+zmzm/R7xWdHMVmUuQIZ8/Cfzt7dg0YeZ0P0IUrK9jD8mNo?=
 =?us-ascii?Q?ktICckJTIk+f4mMpU+DrTSm25LGKOpQWp4IruDjzJyegXF/fnomsenZbIGBk?=
 =?us-ascii?Q?NCGuBpANTy4PhCyyLGrlvXZuCAR594jZVR+tOFrjuq9ZhHoZ8FwQ2Ce9351v?=
 =?us-ascii?Q?R9gy3VEgc1y+Nvq1ej8kdOkt2LDgpMhko4NurOIQssxC788EbXGe8jgjRAKh?=
 =?us-ascii?Q?Q4brgFfDM0MfKTiG4VPWdBck3W/HGLTKQxIKScixXJdTpgYJRSfWv144JXJk?=
 =?us-ascii?Q?Fqo3fnhXgGYgEa4f/aEcK6A68OuZugQmhZ+jIxZdx5oSdY4nYCgJIfuOivms?=
 =?us-ascii?Q?bvkJF4ZMY/BsG+RFjvzLpV08ln8Yi2SDAiIDxohqjo2gtEJTDOIYhdTy9KWn?=
 =?us-ascii?Q?cmyvdwxoM4bIUx2ay/w9r7fkSdeQQlSNaFZzjaR8wvue32KnuLrrkFWZmqzN?=
 =?us-ascii?Q?GRIVaTPa6NXZF7hVNmfCccV+oJNvmLoP7vU0byRzv0hybQKsDPAAX2b//5Sf?=
 =?us-ascii?Q?IXLB75a87RRsGps/obCYv7WY1k4UPHC720JgaO/y0qnx9aMltnS7HK+dSTPG?=
 =?us-ascii?Q?6m41a2s08xy8svJY149FtiVFKpk1wvZk5LddS9+VFXbhIIA1Qug3u5aruKWf?=
 =?us-ascii?Q?gSq6YPiNLPN0Rcxo1kkBFohaxFzqUSOeM3J0+rIbrXfrfHk8mINlCsex6i2k?=
 =?us-ascii?Q?TIvzJ6ol6BNvP/Bgs+CcEhG/s6CBvRT8pyDXtX/whfhjGe5MnkWNYHcnyo5E?=
 =?us-ascii?Q?jAvfdw03KKSpuwDAcF8r1sBTN8g438COVDIFKpOy2MdttV5lsKereN+EIdmH?=
 =?us-ascii?Q?5YkiZH+mBF8CZoU2CKDITHVoOScpWDPCEP5zEV0ZHTTRcv3Iu9SkR38mcvCg?=
 =?us-ascii?Q?ZoS2jcF/tlRv1IhbEZmHY53n/J9Pa8kl+eCpK2j0QRFaX2u32mD8YNMg0cLe?=
 =?us-ascii?Q?BeWZ7G5tdnIMA+GUTRoLJM+vGcMnePBBPqSyT87aKabZ7gGCQWwCj7rM6ypT?=
 =?us-ascii?Q?y5NI009kO3xpYqavJXf1mGBr9iVXkPMq?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(1800799024)(82310400026)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 13:33:18.1706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be8c0e41-bd64-4514-7cd5-08dd139f0c62
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_053336_063974_E0992284 
X-CRM114-Status: UNSURE (   7.71  )
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

Hi, Sudeep.
>
>   |   warning: incorrect type in initializer (different base types)
>   |      expected unsigned long a2
>   |      got restricted __be64
>   |   warning: incorrect type in initializer (different base types)
>   |      expected unsigned long a3
>   |      got restricted __be64
>
> We will get this warning back with this change, wondering if we can take
> up BE support separately.

Sorry. I'll change the type :\ Thanks to let me know!

