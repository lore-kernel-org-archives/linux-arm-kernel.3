Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB62E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iE7Hm00X8Pj7oeci400jGxYZ7JzmHInZBktzySylDPw=; b=uKuBOJ0dnTox4q98zZ98Cw+h0X
	RsJlxRd1iGkdP9z9suJUy3BXA/btWXtsR/dT/IShXhL2xSfJ3e5BxeEYUv39AXQ1mnOT5tl48AsnM
	3xzS8sVCSBThd9I40EhE4FpgsszemltI/cZtAFS9ISRR4etgFS5JStfvIMyD36dOatueUjkbeOKZm
	49CivcNcp9QSFQYWAj97J++CagF0AR5ydaL2PyphTad1UAVRXXu9LpelMLYbw4yUVJD1gT+st2UZl
	YaDtmvDN6s9fFrTVhy3BYmcZONF7kQt4x/4HGDAdKEHys5CwO1iN0F1s6ZO87X50dwLK8SrzoLcC2
	2pvwbdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvv7-0000000H0hd-2iRv;
	Wed, 18 Dec 2024 15:25:05 +0000
Received: from mail-vi1eur02on20615.outbound.protection.outlook.com ([2a01:111:f403:2607::615] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvt3-0000000H0Ki-0K5P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:22:59 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eIf/UCr0ODuqMMINeIhVXxUcE5JZFRBxEZQaS90OEAts+Y8+kK/2u/y2HFhXFx4ldfA0xUqqOzu29Jrn1jbYJOgjWmQZB1LO47R2CgmN945ksrp4nlkoOqtEvhFZ/C2RkxKk+Zgu0QyV8JHtWnuTqlbRLYMBOLhQLreA/h5qxujiQHdqhq0RBoSC9KKCPxxBIKYiKYiFV6JGOrW0k+4fu2F2SfpH0taTNY8THd6UB0wSWEn8j1/vOPCV+Gd04qXKuzyJ6MMhtL9OvviKurxZmQnOiesYxE8zQk6Rx6bhSllk0Ub6t1GjbtkaGo8FJrTWec+ukforOlwL4H/4nCEK9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iE7Hm00X8Pj7oeci400jGxYZ7JzmHInZBktzySylDPw=;
 b=MN8YZTeQIuqQyGlXQVK6tgUPsXpuB+hwoYs4Ba8M2QmmQ1V3Cj8e+By3fI3N7sgoVK+9Mo42RILM2xGoEDMZUWiTSZ1Wn0a+4qw+w/450ilth7PS4GmjWaCX8GeUaB0tBtzNnhILyr5V/Bn/Q2jnCb0tDX+ZPoLwUqhO5gwKBfF3mZ1Md67sJcuLY29NSbPBIi6u38cIJhN2Qu4gKCjwq3Evyt8kEU90v5LLN+i8wpWt6cmda+HJPzBU63Ix2nk3AdNhu+TfAuECAJRxKlIt3ApWPoFA60WRNJ6jq/xBLF4j9F9Hj5PC8ZX35pgV9nYcEcGpJbeJ3P+Sv5Z8HVfZDQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iE7Hm00X8Pj7oeci400jGxYZ7JzmHInZBktzySylDPw=;
 b=mj9v5oyJ+zQMRMzd7WWY52WcJY6O0K0yvFbI49tGjeYLCvvNldlqz89OZaG8CjTD61xeRVfd5dC0PuDGQUKqz/hrTPse1ztF026CuvN9PXbxU7/FJa5F4r4GELfOavFPIQsuw4CJEoiEbOLmOBSAypgQF+gSPayCWaCUFVwYB+E=
Received: from AM6P192CA0015.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::28)
 by VI0PR08MB10917.eurprd08.prod.outlook.com (2603:10a6:800:252::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 15:22:49 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:209:83:cafe::ba) by AM6P192CA0015.outlook.office365.com
 (2603:10a6:209:83::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Wed,
 18 Dec 2024 15:22:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 18 Dec 2024 15:22:49 +0000
Received: ("Tessian outbound 867970499bdc:v528"); Wed, 18 Dec 2024 15:22:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7152911ee2f950e2
X-TessianGatewayMetadata: UYLMx6KR8xL9Bm4jdJOsdnPAoCsug48O+gHTVme+G7wJN6X/B7m7Bb31sPLLBrACuHCpwjaZUHV2MqW38T9VQWyr5h4sGiaJ6sFdndKLjqvMS9J6RjXcLMmV0z/ORGUKxiQBq8yb5QL98ea9+PGd4/wH/O1uxaTwdokfjK5jJsj6d156sdQLdM3K6A625eMqBe0au/L1+hPFwjpS3eT3JQ==
X-CR-MTA-TID: 64aa7808
Received: from L4410abf62bfc.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 387FD48E-92EA-42B2-85B8-24A72AEE74BD.1;
	Wed, 18 Dec 2024 15:22:37 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L4410abf62bfc.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 18 Dec 2024 15:22:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvENnCkgwyVHD2wybhhardC9FCyzp+ki8O5rqb/w0zc7muSpLJ7vo/RoHVDuFk1rsPftxNClMZGHVkrpM0UDtAOX7FNDqq7gZANRQxwhiAz9zUOvXN78lV6Yu4fxQ3Fwwecq2sVwy9dXWs16E6nzS2B4mNEwiwX6e1J36xD7o6L3cKYd1NSt5q7E5go6SHXcegbIQ22cLjd+tFHWn9mklR2ATMViRtLUrone8N0XB60URwBbM4IVQcOrz+L2N2gDcFIHtZtWdo7xlxp/7zVM3zk5Xdzx665nNz6QYR7KAWSAtnDU69btELsYJTgIcp4yfFRrxI76pRYAmzAFoiwxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iE7Hm00X8Pj7oeci400jGxYZ7JzmHInZBktzySylDPw=;
 b=L5yU2pmAxISl8FSiDzCzXmiY+QqIoc2HUuv2KFFdohYqlyQW6mxfxD8yoCT4jOG2X+G2uTgxvuaK26l3XF2ldSr71ijZT5ZnJw/lSGv1dTBrT77LQLRDv1pdMHUsMPuLtKCDyxm32F6xD+GzpvY8xwUT1iZJyNJhPLV6ZEuS0/eiI0sfI8qnMUi4ZfQhhSJuNOVIry4tYVi+AdFylZy+f3DY5iKpX7M4OWfsmDePrrPqyYQXgrvImbp38xbEWVhv5mVDvF2KsIWrMioSJhtfyCFfkVRffdfJEadxwdIhokanDu83xvx1+1i5CnExt4k5SFGSYTAbEQDgw2WFuGvthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iE7Hm00X8Pj7oeci400jGxYZ7JzmHInZBktzySylDPw=;
 b=mj9v5oyJ+zQMRMzd7WWY52WcJY6O0K0yvFbI49tGjeYLCvvNldlqz89OZaG8CjTD61xeRVfd5dC0PuDGQUKqz/hrTPse1ztF026CuvN9PXbxU7/FJa5F4r4GELfOavFPIQsuw4CJEoiEbOLmOBSAypgQF+gSPayCWaCUFVwYB+E=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PA4PR08MB7410.eurprd08.prod.outlook.com
 (2603:10a6:102:2a2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.23; Wed, 18 Dec
 2024 15:22:33 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 15:22:33 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Mike Leach <mike.leach@linaro.org>
CC: Suzuki Poulose <Suzuki.Poulose@arm.com>, "james.clark@linaro.org"
	<james.clark@linaro.org>, "alexander.shishkin@linux.intel.com"
	<alexander.shishkin@linux.intel.com>, "bigeasy@linutronix.de"
	<bigeasy@linutronix.de>, "clrkwllms@kernel.org" <clrkwllms@kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rt-devel@lists.linux.dev"
	<linux-rt-devel@lists.linux.dev>, nd <nd@arm.com>
Subject: Re: [PATCH v2 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Thread-Topic: [PATCH v2 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Thread-Index: AQHbRXl3XK0qSrIPr0e0pGVelZxLa7LsGwaAgAAawEw=
Date: Wed, 18 Dec 2024 15:22:33 +0000
Message-ID: <GV1PR08MB1052108680D14C3AD04282270FB052@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241203114942.697188-1-yeoreum.yun@arm.com>
 <CAJ9a7Vis9vcdJOzu9tvNQ4eAacmXkbhbZBaRYd1acOrd8G-ZUQ@mail.gmail.com>
In-Reply-To: <CAJ9a7Vis9vcdJOzu9tvNQ4eAacmXkbhbZBaRYd1acOrd8G-ZUQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|PA4PR08MB7410:EE_|AMS1EPF00000048:EE_|VI0PR08MB10917:EE_
X-MS-Office365-Filtering-Correlation-Id: 6376f47f-f464-43ce-d666-08dd1f77d514
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ixXVDxiY8xOurcv0fENaoT6qEUzk6LkeXkpqY8HeVE7r3ALTSazr5pH6XiSq?=
 =?us-ascii?Q?4soF2H6271JGR4ydh63zMSetNo2sshluRpi2D1P1ps+2J7dPJg7S5LDktxpR?=
 =?us-ascii?Q?gfYhFYVV95H65bFZG6+ydGBUO9myzUPxp0zPMKzho7ZlnmU+RClBIPbVXXKt?=
 =?us-ascii?Q?SY/r9lZiUOs57dzfzzc3Rmv9W+q1rXg5QIrU5xXgXMiysqoyGBGguSoPYzmB?=
 =?us-ascii?Q?YUX71phwyg4FcZE362MsdU4T72EOXu5Xu4JFODwNtOPkURcWWlvbKi+X2XNS?=
 =?us-ascii?Q?cNx/fQ6QqwskLW+gs9StnD7fpJ/N2RXUPo2fZ51mlM+wjzu54N0WnpSqrlKo?=
 =?us-ascii?Q?5L2pmqyB/AWAHIeDKvGdBlUn80GfYzbfc0kjN9fw7qfnU8tLlMx6Y3Py7bPk?=
 =?us-ascii?Q?bdqyi8h+Ho0lSv8dJI1dd4HN3gTYvw0YXdwtlODIXC4SRLtos6BfyEB3JeMG?=
 =?us-ascii?Q?uN4IY/pY7kVirHBE8aAoizXGyHCkbieJ++2DnRmJfguS7ZEqz8fiFPjTQz1N?=
 =?us-ascii?Q?bRJXUd9Xmlaced9ST3vVvHB1Am54YtPqok4u8VKYVq2xh8YBL01wqJ9DEkJV?=
 =?us-ascii?Q?zrTeg5NHHP4vTCEo2x8nS30+mvWsnsNEpRWscfAX7AMQ9BYEe3WNVElu4Pw5?=
 =?us-ascii?Q?LaOT+zV3+AFM+Vygyl8ETMh9LU8scyJPYphEXnWUXzEicnuXXROAVF6YD9ah?=
 =?us-ascii?Q?5LEJON4cvLUjk9hQfhPLwQ8Tc5UL80qi+y5lL+G4oWTqjy99TU8t93mWtH5L?=
 =?us-ascii?Q?foh9CF0ndu5yiIh1bIYgIbRmOTbp2e5OP4TVt+nGw5tkwX5ewqCvizbPe/WO?=
 =?us-ascii?Q?BMniO3m6XSQwdMFUla1Wl5J01aQL7jnmlzftB800/INkoTYxZKzbP0uI9R6/?=
 =?us-ascii?Q?J7faWFX+Z+/VmbOSFw1PV0ZjuhU+8vaUcwMIIebzBXF+dJjodFVfkVFOJ7Fa?=
 =?us-ascii?Q?FZMLx1BdK4VTy7Q4uYEWbJmYKYygUOLhZOeOCKNVaM4PNm6ofyHEmU8JC00K?=
 =?us-ascii?Q?O/mfs0hEcIykSGzYZabVp+SqodWO6ga6CWDKoo8j6/zHYoACQ2+3e5PXt3QG?=
 =?us-ascii?Q?UzIEbqEic95W+1fnTyl6a357lYqfawNoGidt9NK27mcWwT+HE+6OIPY60Wbj?=
 =?us-ascii?Q?OGnydby3FT4KwX7ElgdRltgaVoflbe90dmzbG65Jb0757SuGW3kmvFQGdwr3?=
 =?us-ascii?Q?q9FGAohGe4A8/SxXqDqgls46oK+58++gEY54Z+GI9anGoG6FDJ+u0ykjhHe+?=
 =?us-ascii?Q?1cDjkN/XZoJtJbMc3nmAXnTgVOtxXNHGUg2+f+g4nBjze6sOLvT/tYhKbfna?=
 =?us-ascii?Q?ucjMxYzev0ywyF6uWxmMuI4ayz2+DBCms4KPYNwZze4jiOWQPBWWsNJ/nSbg?=
 =?us-ascii?Q?rn8yg6p3170g9QFTrFE6dm2bx7rkwiH8y2Wds65u0KiVpSTJAeNRQvmixAxl?=
 =?us-ascii?Q?OyHanzkL53U=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7410
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4c46429c-4eb5-4593-7627-08dd1f77cb88
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|14060799003|36860700013|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pFJ9GiaZHQhF5OruMcOokHXf9BHxnDxLXE3MbGcV/JpdCa/8nz9duRxKg3oh?=
 =?us-ascii?Q?jeI0ej0gH5s8tXAK1Czb5ktOos+/mNIuXKUvHdi3c3ns16G7eALNeBYOJmIm?=
 =?us-ascii?Q?B+FzjpNG71w7E7zoBNJDEsZnMlZwsau07kVWb+hF+Da02CwA41mtx+M8BtW3?=
 =?us-ascii?Q?uxBFF5DagBa0NMKbeKlZIo7AORdvMy1SV2W67rK3pPzwiRz7WzHrVIlXNHcL?=
 =?us-ascii?Q?Ein/x/w0C9rcLaGMC6OT9NBSX892gR2WFD3uZPBmwxZPfw4euQJu+FBBcdfb?=
 =?us-ascii?Q?vUmOzjZfRWeBDS8Hsbg2W2H+f6qlCT0DmqmqnP+JXuuqmITLyPGC3049PNo4?=
 =?us-ascii?Q?LCtbKuxYzzFV+NiptXd+6iib/5Z7DmmzeITIxV8tnE6NTRGYjooZ3Wtiw9Nt?=
 =?us-ascii?Q?enqa1yLDHqQoSJPBJIpZlU0p6pLBHfoS+9Yj9IBsOYbHErd6c0TnqTlzfITV?=
 =?us-ascii?Q?qLiCTU1+yqWWJOKZfbsP+3+ll3PajI4gBzYjG4kmt1p5i3/2V2OUNYD2k88S?=
 =?us-ascii?Q?LYIRwRyHxRzbIl+0B8Na97TsYOaxnuCpy6FtjjawYTzKoMhZPIshO3bhCsNH?=
 =?us-ascii?Q?4hTYezYe5miXkCkl5086HrD6UTDnoXup7i0bRZTNRvuoJJXAOqzuhrAh2EE4?=
 =?us-ascii?Q?1elhWly/3Q4jdECIE8hf+glSfgmLz88Vb461uNEV+Et8XsuwZ1jqm1ARmCWo?=
 =?us-ascii?Q?H9DD+NKhn/RFj/kC8AES+9J4VO/nz+7owdy8OfCJgYsZS+nMcSJuzSdkv6di?=
 =?us-ascii?Q?F7bLaIHlfERw/DyPt+Kbs6sOm2hult2J+z/NIBRdGIAlv2n0T3c5PRgY5MH+?=
 =?us-ascii?Q?9yCfWU2gXzFUzrvn0tl91QTdWU8PikLyE4lFej//dk1S+FBXkPul/DngpNXk?=
 =?us-ascii?Q?/qVCMByBV6IamWt4zMD9zqWtOLiIrmhu3l873Y7GRUI1Vw1FOV61ZrJ5ugKm?=
 =?us-ascii?Q?3c1L1L2pB1GU7sH93a+3XvSYZvpNWzRQC3QWLnKgtGGaXgfdOyDBs2dpDk3Q?=
 =?us-ascii?Q?CbGxb+6lHADcG4BdBYT+wQIKsnpxP6EK1g8hGjaA7drX8W8DdyfbtX/kW/aJ?=
 =?us-ascii?Q?kHmSjxcWkhlujLO+PUo/LcqiVPgq+DISNwhUkngqmtcKcQbzdRghBFcx8BHi?=
 =?us-ascii?Q?expQ5WZcddQPBo/aQS++qIT8fUAm+mr3ck2YnNdMQ5L8rlMbug4dddqwuYSF?=
 =?us-ascii?Q?Y9HWCTWR41q5cpTw6iGGpNJXFnNyJo1Y6K4AnrWcgYhE+s3854cTSTk0BRGt?=
 =?us-ascii?Q?nQKtjbNYUChMi0DtkerPV1QMCJCCrPNQbhYrhjfSCxs4U44k/peUwloRrdJW?=
 =?us-ascii?Q?0B1uFc+ToY/nr/hVhk7w4Lo2od3OLrxmX6aI9mUSx6xMs/zTXtsLO3AXyXvR?=
 =?us-ascii?Q?gHwtkL/tnO5XzVnBL+jOCgypi2bqnsG+PQc5Tx7zMua2yc3TJMXWQrvubvko?=
 =?us-ascii?Q?shD4Ndadpdq4qhw3KqjqBicjH6MQDpsEQRkj9zT6HH24TSX7BqDhazWNd/Wn?=
 =?us-ascii?Q?+8e8n7g2cEeFR9c=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(36860700013)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 15:22:49.2179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6376f47f-f464-43ce-d666-08dd1f77d514
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10917
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_072257_381321_F75832DB 
X-CRM114-Status: GOOD (  11.97  )
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

Hi Mike.

> etm3x - which provides support for ETMv3 and PTM, both of which are
> valid trace sources in the cs_etm handling code.
> stm - can be integrated into the kernel STM via configfs providing a
> MIPI source for ftrace.

about etm3x, I have a the same opinion with James.

But, In case of STM, Is it enabled via perf interface?
The cs devices which could be called in perf patch were changed but not for=
 cs devices which never used via perf.

Am I missing?

Thanks.

________________________________________
From: Mike Leach <mike.leach@linaro.org>
Sent: 18 December 2024 13:44
To: Yeo Reum Yun
Cc: Suzuki Poulose; james.clark@linaro.org; alexander.shishkin@linux.intel.=
com; bigeasy@linutronix.de; clrkwllms@kernel.org; rostedt@goodmis.org; core=
sight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; linux-kernel@=
vger.kernel.org; linux-rt-devel@lists.linux.dev; nd
Subject: Re: [PATCH v2 0/9] coresight: change some driver' spinlock type to=
 raw_spinlock_t

This change seems to omit devices:

etm3x - which provides support for ETMv3 and PTM, both of which are
valid trace sources in the cs_etm handling code.
stm - can be integrated into the kernel STM via configfs providing a
MIPI source for ftrace.

Mike

On Tue, 3 Dec 2024 at 11:49, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>
> In some coresight drivers, drvdata->spinlock can be held during __schedul=
e()
> by perf_event_task_sched_out()/in().
>
> Since drvdata->spinlock type is spinlock_t and
> perf_event_task_sched_out()/in() is called after acquiring rq_lock,
> which is raw_spinlock_t (an unsleepable lock),
> this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.
>
> To address this,change type drvdata->spinlock in some coresight drivers,
> which can be called by perf_event_task_sched_out()/in(),
> from spinlock_t to raw_spinlock_t.
>
> Reviewed-by: James Clark <james.clark@linaro.org>
>
> v1 to v2:
>     - seperate patchsets to change locktype and apply gurad API.
>
> Levi Yun (9):
>   coresight: change coresight_device lock type to raw_spinlock_t
>   coresight-etm4x: change etmv4_drvdata spinlock type to raw_spinlock_t
>   coresight: change coresight_trace_id_map's lock type to raw_spinlock_t
>   coresight-cti: change cti_drvdata spinlock's type to raw_spinlock_t
>   coresight-etb10: change etb_drvdata spinlock's type to raw_spinlock_t
>   coresight-funnel: change funnel_drvdata spinlock's type to
>     raw_spinlock_t
>   coresight-replicator: change replicator_drvdata spinlock's type to
>     raw_spinlock_t
>   coresight-tmc: change tmc_drvdata spinlock's type to raw_spinlock_t
>   coresight/ultrasoc: change cti_drvdata spinlock's type to
>     raw_spinlock_t
>
>  .../hwtracing/coresight/coresight-config.c    |  21 +-
>  .../hwtracing/coresight/coresight-config.h    |   2 +-
>  drivers/hwtracing/coresight/coresight-core.c  |   2 +-
>  .../hwtracing/coresight/coresight-cti-core.c  |  65 +-
>  .../hwtracing/coresight/coresight-cti-sysfs.c | 135 +++--
>  drivers/hwtracing/coresight/coresight-cti.h   |   2 +-
>  drivers/hwtracing/coresight/coresight-etb10.c |  62 +-
>  .../coresight/coresight-etm4x-core.c          |  71 ++-
>  .../coresight/coresight-etm4x-sysfs.c         | 566 +++++++++---------
>  drivers/hwtracing/coresight/coresight-etm4x.h |   2 +-
>  .../hwtracing/coresight/coresight-funnel.c    |  34 +-
>  .../coresight/coresight-replicator.c          |  36 +-
>  .../hwtracing/coresight/coresight-syscfg.c    |  75 ++-
>  .../hwtracing/coresight/coresight-tmc-core.c  |   9 +-
>  .../hwtracing/coresight/coresight-tmc-etf.c   | 195 +++---
>  .../hwtracing/coresight/coresight-tmc-etr.c   | 199 +++---
>  drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
>  .../hwtracing/coresight/coresight-trace-id.c  |  93 ++-
>  drivers/hwtracing/coresight/ultrasoc-smb.c    |  12 +-
>  drivers/hwtracing/coresight/ultrasoc-smb.h    |   2 +-
>  include/linux/coresight.h                     |   4 +-
>  21 files changed, 751 insertions(+), 838 deletions(-)
>
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

