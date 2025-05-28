Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D217C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 12:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbEK6SkU1F0aWzhRQtG5Rw066hLt3YlcvHbYIZ7Xd3o=; b=05ClOei/IcFLTFHgikBjW44Hr+
	s/Mh5TwlHlRBmu6Q8Nk41RIWhbAZauSjfTOwd06b07xJvOtGJi9yW+dkI/PPcPGrxvr/MjW2QgYyu
	RcTaLja0sFk6u697AGxKtRTlSWsBC3o52fPx0U0R/Gi/AvRNe+2px/njg7XmMSMcNUnjJmNAV1ypQ
	/l+4VuiDCVVDD94B8d7h/0SCn7ZyWHBa9ZCp0D6Kwcvt6TYwRtTOZSpr39R8X3ht/z+0ywcXu71kb
	lqM1ijtwJRlB7fXRQi7i4j4DSeHxDN67uAErztWPfAY5sBl2pV2LBKKAcfe/JOwwJMNqsT1AUDSNF
	idmHNmug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGGV-0000000DARG-1JFc;
	Wed, 28 May 2025 12:52:15 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGAc-0000000D9XK-11S8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 12:46:12 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pbUegEirQz4AUKXHaJYkdqxejkRFbZY6eXv7TW33kiRFcCDcCklKb0fMC1yUsvfJ3kH9rOZ5Q4iM/aKRoVGVWmfPhKKgvJ9yri9Qo7cxcDES36QvnfqvJdPkZBdOJvJaJO77PRp61DVuj1SQ1sV/pURNEechF5Ai3EqElc97r66j2m/OPjossUkVPgvRH/ymOd1nvjh8A9+aHMCRiz6IL7PDq5esCTB3xkZ6YbV3NGJQgZao6RfRMRGPCzcs99U2HIM/XxVyYwI4LNNc16SU14nv8wqkGTQUSjeEK/i4FRZY2FE1r/RVHppfyWNXdiob/C9Wp2eCCWkjupz+OcEOiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbEK6SkU1F0aWzhRQtG5Rw066hLt3YlcvHbYIZ7Xd3o=;
 b=YCAYTo7cKHmXNGCYsP4X2JnjoFFOmYHv7iRF4sSs3PL1LnFFU3WFc4eQ/SeoTtToxsRghypD0xvF52ZGLwedh8mOvWvANLdPQXepk277kaujlxLLE3W83LLq9uNFJ9fLujbCKk79cWK1sFA2yd2pXgfqiM+k/mm/5b0mfaFa/ww7Qx2fCTlKLPBf2Pk4/TKVCUnf0bXyDJQuQgXUA9wpX3BSpNnuGcesczl6Oyl6bbgBGhfKyXoQpxQEfBgPOQ0KkSRZWFDTUhD/0Et2F9AbKOiJX0UtBR0RqEkDghFs+fwx010Fl60NXadL6qT2TRQpjeKfK0qPXMu9cFEr1f9Aew==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=marvell.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbEK6SkU1F0aWzhRQtG5Rw066hLt3YlcvHbYIZ7Xd3o=;
 b=l7ymlTSNv0M4p39ynsdDWC10m3GxlRWYhzitYGcNzE9K29I2ciQmZG1P9RqtuWveimTALGDnDtWVeco244amcnezasLVVpu4439KV+4W2zy0kpk1KbaUC0qBjmix1vO9UU2WwLX38KlvMrmu0tS4hI5JzpBxgMMR4gI/zt8Cs60=
Received: from DUZPR01CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::13) by DB8PR08MB5338.eurprd08.prod.outlook.com
 (2603:10a6:10:111::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 12:46:00 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::c) by DUZPR01CA0059.outlook.office365.com
 (2603:10a6:10:469::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.29 via Frontend Transport; Wed,
 28 May 2025 12:46:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Wed, 28 May 2025 12:45:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1rmKuwlg5Lijrahi3RV59FLVOy8aQR5BTTCWCu6RpGxGjqE/SdCbC91FMSy5Np8sfTbvqOG8o8ALl30/FXKoYjdLub5rky8e46wMkSOj/JnoWfeeyrEociAMErN0d3EGNO9PzyCKILJ5cwHVgKCkdXdkLnNdBwOpJv6iKvzDjttUOxBkPartF91lGkwCLH8la7cLa+YhE33wCoAiIWZWV8wjzNxe77zLBkduAa8JDx7LhW0LOc9vXr3pB+1f5Ml8GcKSCHm/0UBNizE1rqaMfxXUqChH6NwYR8Wt9/RwzHKGpYRAMvHC3ouTao0lD7Og+JVa6WCrt676R3E5QKnlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbEK6SkU1F0aWzhRQtG5Rw066hLt3YlcvHbYIZ7Xd3o=;
 b=Y8wIZqwy1Yc6fWFOaMqSvUgWWqhfd1bIa76HjREA9oBdiLU/yGik5abjNLG9rAgCm4UlPiK5ojmRW1eEj5GFTHG6GCMixeCrVAgkLXNPIQvy+GPeD4I86F4QOZvdmS6dNe+206Mr/yrAwbyMG0SAXVjX0s+3i2tFc0122felgwg+djdbHg9GsLVGu3YmJyriSaHMFwSKd2Eq6AyJCGD1PNbMyHLT4uU1xf11VRIHfCCVhEreSs69SmJCAQd1qq909Ux5tIw0oA//HqicvZ1a+M+DLgj+IygAWlNjlqLBI/Du8Js3hMN8HRKo6Em7tsST0vtWX/AC1FH5XBfbjHwh8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbEK6SkU1F0aWzhRQtG5Rw066hLt3YlcvHbYIZ7Xd3o=;
 b=l7ymlTSNv0M4p39ynsdDWC10m3GxlRWYhzitYGcNzE9K29I2ciQmZG1P9RqtuWveimTALGDnDtWVeco244amcnezasLVVpu4439KV+4W2zy0kpk1KbaUC0qBjmix1vO9UU2WwLX38KlvMrmu0tS4hI5JzpBxgMMR4gI/zt8Cs60=
Received: from DU0PR08MB8322.eurprd08.prod.outlook.com (2603:10a6:10:40d::5)
 by DB9PR08MB7889.eurprd08.prod.outlook.com (2603:10a6:10:39c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 28 May
 2025 12:45:26 +0000
Received: from DU0PR08MB8322.eurprd08.prod.outlook.com
 ([fe80::3975:3172:82d6:459a]) by DU0PR08MB8322.eurprd08.prod.outlook.com
 ([fe80::3975:3172:82d6:459a%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 12:45:26 +0000
From: Al Grant <Al.Grant@arm.com>
To: Linu Cherian <lcherian@marvell.com>, "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>, George Cherian
	<gcherian@marvell.com>
Subject: RE: Possibility of using Coresight STM - ETR as console for  System
 Control Processor
Thread-Topic: Possibility of using Coresight STM - ETR as console for  System
 Control Processor
Thread-Index: AdvPmRx3iCLKuwfyT4aOsliJqfc4hgALtEjw
Date: Wed, 28 May 2025 12:45:26 +0000
Message-ID: <DU0PR08MB832208AE4C2468388430E9228667A@DU0PR08MB8322.eurprd08.prod.outlook.com>
References: <LV8PR18MB5914F2903E66BABB272F02F3CE67A@LV8PR18MB5914.namprd18.prod.outlook.com>
In-Reply-To: <LV8PR18MB5914F2903E66BABB272F02F3CE67A@LV8PR18MB5914.namprd18.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DU0PR08MB8322:EE_|DB9PR08MB7889:EE_|DU6PEPF0000B61C:EE_|DB8PR08MB5338:EE_
X-MS-Office365-Filtering-Correlation-Id: 976d4bcb-a2a7-4c96-3e04-08dd9de598da
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?yFS++kKTzXKMbo4/rY7ymfGDsn3ghUectvyUvP6uU9K4cgO/pk9EnAFb13OM?=
 =?us-ascii?Q?aU0/yTcMVRvykPXUwEOwUeiuNPACzTodDzHiJ8RbDcdPkipOQznzsKLdrDpC?=
 =?us-ascii?Q?INnmERQ7lFKshKYDXVkf4007UaSk9EaUR1cvyLnm+MjFV1Bcu68785zBkrds?=
 =?us-ascii?Q?rdQjWl8jYm7yKhpUlLGVfD5ZNv6XDmX10dGaQCCsU9egPElkhh7gMDtmzEkt?=
 =?us-ascii?Q?DtwXSlbmAAiYO2PcXDO5g4C2OHps0wDMBx7vhaoOzuBtpkHzTSxUUyF7pZ28?=
 =?us-ascii?Q?GBgd0Tn58ua7KaC71x97P7PKGKbLGNI4/2fFOHbnJrrXqeDyhFBHRupMRh6/?=
 =?us-ascii?Q?/Xtsy8al7i9GYfRyWF+mFzY3YxQ87SnV8Vq0sQDsRzo0lJ/KsqiF3C1dwEi1?=
 =?us-ascii?Q?q14A3WHhKVSus04JKzqmV8fAQMLVySwyxHP56XD9ozqLG9mx35ffwbcS3Jub?=
 =?us-ascii?Q?hFs2vpFdGsi2PRQstc+K1tipntwHtvbWDoFSU82FhgO7gqujF9N8RPs/slCB?=
 =?us-ascii?Q?Goy/vmorU1oOURpyfh7zaXr7TYaJRlMvE4tM/q9X3/0ncvvy8JXX/b5Kxf1U?=
 =?us-ascii?Q?Q8WN9SerMEOqIWQgw4kuJLl6bhQXwRQ13zj1qlMWQh4rWno22xRIxQtf2Vaw?=
 =?us-ascii?Q?YuyNQZ4XQFKYUW9Y56XEDKdAKSEMKOKW3hn6sZHfYna4/FAKZbvJReSrumcL?=
 =?us-ascii?Q?xGjLrKoqfCFnOZ8xLh2eRUgHX14ToDZJASzJTCBqszuBGaXAaX9HXmh3226j?=
 =?us-ascii?Q?77U57n8EM8KXTtgTgSzrheyxENiPWcaF3IPT8mBuSa8uBpusp2AUACexgjK3?=
 =?us-ascii?Q?IfwcqWfBfiiKMvLTJyZQp5reCbDJ++o7vnj5CkwufTGLdrSFWndFkT6/NHN8?=
 =?us-ascii?Q?lA9ZRutsxCbb9rG664Ypj8Ktlev9X0FlclAcSThO4HBSVRTUbAWwiBQKIsW/?=
 =?us-ascii?Q?oeTvlecUrJxaWPKvWsgrgcSQg4tnq855+PuUxto+mR2wchf+YO+14JOkIFo1?=
 =?us-ascii?Q?ZX8By84dEVzQbIS0NIPhXLfYIdA4U3+aWxuI88AEINqojwXQYcFE/IF8KzS3?=
 =?us-ascii?Q?Anvf+jGMZlf52ICc3u4w7Wb+utPNjUn2cOqdzZdjsjHCwFyjRXKhac2fu8Xk?=
 =?us-ascii?Q?/KFZuxk9+9w0uISzS4iADrxzyEdff+dqR8sU9xwgc1wMWWBN68fRs08sh7Ni?=
 =?us-ascii?Q?zm5WQnndgwa4cwUQAyFWupaA8btaaYDUEtxI5ftKKeUzn7c4reBp9xAPFHPt?=
 =?us-ascii?Q?N6FbdHNsj+eRIJM3iUoWQwFSAFjPS2IJCaRYNCNxRLKK4RQbzwGvtKWWVGH1?=
 =?us-ascii?Q?X48d+E0GKqkzyI52A4/u686RQziUof4fjlK7tJV+4ggfMvRAlsIQk3xL0plP?=
 =?us-ascii?Q?WYq3dFD+VaNq1Eu8wmEp5mNAg6XmRP65Yk66VQDEbXXqke+heJ0HJfEDzRFF?=
 =?us-ascii?Q?e9/n/CtEzTK4wo9YKLvV1JsTYkAyPoGp1Ro53Fjupy/Kp4z9y367xuZlAXHo?=
 =?us-ascii?Q?GVltRXlahXN6JGY=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB8322.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7889
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7e4e26ed-26aa-44bd-1088-08dd9de58527
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|35042699022|4022899009|14060799003|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tki6GOJNer/wszgxtTuzodTpY/UlLwobFaR+E8WfTiAHged2LFi4avsqJbPe?=
 =?us-ascii?Q?LGe9HYQlv4ae3qfk85nbtRwgV5O/piFiLpOV46vGPXJIL52FhgX5/gaobcq/?=
 =?us-ascii?Q?5M+p5rjxZEkWshHNCdrMmDiNLlIGGYuSbom2qAp6nBT0Jwt31UMzoLDaGEi7?=
 =?us-ascii?Q?Gor3+1AFEewXLAvDsfcU5qDaROlIXPlKF9bwB1yUDbhlAvShOAUKyu4yOY8c?=
 =?us-ascii?Q?4/p+gAk5TEkRyLAuBoBAxxz8LRUgOm+H7SslJWcr0WipwjninpRri8yDmPnb?=
 =?us-ascii?Q?TJyfXNJM/4wkjVCsFaKezWhyXOcmqozcCfBMX/tPqFIkWduNWYZlTINPWBQP?=
 =?us-ascii?Q?H08r2EjICRPJUFXF5CQ5VbUVVtSLE9BRc1Ghl+rNbK+qulaT5ZpCPtT/8TL1?=
 =?us-ascii?Q?EiLjVp9voIQqa7pkAWBJqAqZB1QOqMj9UAyIfLJaz7dSPZlooIjx/RoJgcX/?=
 =?us-ascii?Q?QnZYFtsXQEJiX1llrfhTRqsSHVZPSh5wEExXtoCeyGZGHvHLdyWCC7bKI0d8?=
 =?us-ascii?Q?uvkzSXedBVUhuwZDxmeB9eY8EKki68dkPFVLPUqtOlys09L7k9Gl4xKBn6FM?=
 =?us-ascii?Q?ZQ9OT0QWSMk6R029ztPu8gR6nVJEM+usXs/EKpqfi9J6B8Gz1IzTgkzA2NPp?=
 =?us-ascii?Q?bc49MiQFO1lxlVe3/Vp7i5pbww0pBdWy+xyXiqb5szV6RBKfLOvQCtSNuQLM?=
 =?us-ascii?Q?V5y0kVbaYdugf+9JEt39Y3PcmNAFMmqC1Sx+lNfs7xmSpIMIlyvfR1Yz8mX6?=
 =?us-ascii?Q?Ft/y75ZcjPWebVK/8Ha2qTiZGJHeGjWl2kxClM8y0cwEWJ3HHvLxcSmXM9/h?=
 =?us-ascii?Q?AlY9dJbBWAtYXEC/ZNnUnC6lXpKxhSqmSD0HMgKMd33VEyKKTdX0GjvUMKb5?=
 =?us-ascii?Q?hWFale44OgZxNznU/3qSUdSx8QEyuoG6Cw6dd+ShsaLn13As4mOxmPCD82Oz?=
 =?us-ascii?Q?o/8LMKz8wvzUcKPpb58PeGNwcpShwgMyiDWmzPxmlGudIQIlhZ7aMpQOOmXn?=
 =?us-ascii?Q?YPHxTW6VYBslnu0VqguGacP2fQlXPSD+wGKzNLY8D9kUHTY4Ns+e6vzX67I9?=
 =?us-ascii?Q?aFXuJ7tTzAEsZp+BOUUgGV08y+RHlTtjC5UDm63aJRWeyHkTruO+730/Rbdi?=
 =?us-ascii?Q?38nJz2Ah/vMob4SlgA2jVG3yNM8mqcXcv4k+RH9WUbc6IW2M0K4ZzI1ONLQF?=
 =?us-ascii?Q?lev/L2Fsrz1Bx8DYoy4UI1Ipt6EAqlfGLMSfxjBNgNFXc3brqcHnmm0KrrjH?=
 =?us-ascii?Q?2LinHPodtOg1IQKBq+ByvpYafDDkYmwyZzf1x0DYXn9ugCgs8f6Nxq/dLoP9?=
 =?us-ascii?Q?ik6LB4hqLyzxwqpP3CcbwbXP72FdPuc9YCnvHZzAFWt9sIlzsa0uEq5kAuru?=
 =?us-ascii?Q?3ogmuxEss2OWGr/3g4Nxfvh1G4vf4F37axp3jq09tXFfelo1EMvPvXdJrmzc?=
 =?us-ascii?Q?HpJZalsV7k6MS1LETsQlJea/gvhzzgzVOkQBMeiah5OOxWoDr6o+rntV9kol?=
 =?us-ascii?Q?/JHC8PkQBW/vwOJmpxY8x26YDc58PKUXg/PV?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(4022899009)(14060799003)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 12:45:59.2973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 976d4bcb-a2a7-4c96-3e04-08dd9de598da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5338
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_054610_435696_2D8CF080 
X-CRM114-Status: GOOD (  21.85  )
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

> We are looking for console options( output only) for the SCP(system contr=
ol
> processor)cores in our SOC other than UART and was considering STM as an
> option.
>=20
> Something like this,
>=20
> SCP ----> STM ---> ETR ---> DDR   <--- Linux
>=20
> On the Linux system, some user space scripts can retrieve the ETR trace b=
uffers
> and move it to a file on a periodic basis.
>=20
> Do you see any basic issue with this approach or have better alternatives=
 to
> suggest ?

It's an option, although an alternative for a Cortex-M SCP would be ITM.
And whether you use ITM or STM, you could have a replicator immediately
downstream of the trace source, routing to an alternative trace sink like
an ETB or external trace port, as an alternative to ETR.

> Few issues we could think of,
> 1.  SCP wont be able to route the messages to the STM -> ETR path until t=
hose
> are initialized by the Linux user space. Hence any messages until Linux c=
omes up
> need to be buffered in the SCP local memory and should get flushed once t=
he STM
> - ETR path is ready.

Or if there was a dedicated ETB, they could be buffered there, and retrieve=
d
from Linux once it's booted. You could even have a second ETR, and have
the SCP program that one for boot-time messages, and then switch to
the one that Linux manages.=20
=20
> 2. Possible message loss due to buffer overwrite We might have to reserve=
 the
> ETR trace buffers only to the SCP and keep sufficiently large buffers to =
reduce the
> message loss.

That's always a risk if the SCP is competing with other (much higher
bandwidth) trace sources. If they are separate trace sources (like=20
CPU ETE, or ELA-600) then maybe they could be routed to a different
ETR, but if they are other users of the same STM then they'll be
going to the same trace sink as the SCP messages, and if they are
much higher bandwidth they might overwrite the SCP messages.

You'd probably also need to decide if SCP would use "guaranteed" or
"invariant timing" STM stimulus ports. If you use "invariant timing"
then you risk losing messages (or random fragments of messages)
from backpressure in the ATB network; if you use "guaranteed" then
a problem with ATB might end up stalling the SCP (i.e. the AXI write
might hang), and that could be a serious problem. With ITM on the
other hand, software can poll the ITM FIFO state and only write
messages if the FIFO is non-full, so it might be unable to write
messages, but it won't stall.

> Assume that reserving a STM port for use by an external core can be achie=
ved
> from the Linux STM sysfs interface.

STM already partitions the STP channel space between Secure and
Non-Secure, so if the writes from the SCP are Secure, they will be
distinct from Non-Secure STM writes from kernel or userspace.

If you want to reserve STM channels for Non-Secure writes from
other cores, you might want to do that by partitioning the software
stimulus space and only describing part of it to Linux - rather than
describing the whole of it to Linux and relying on using sysfs to
manage channels.

Al


>=20
> Thanks,
> Linu Cherian.
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org To unsubscribe send =
an email to
> coresight-leave@lists.linaro.org

