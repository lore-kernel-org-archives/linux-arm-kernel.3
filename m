Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978E4D78794
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0vKnnQVQOLcuGM0Z6DABlcPjogcbXkt0OdhVZNjZAY=; b=HkMNASUiqldgDj7LHhW5wOExPO
	NJIkhkVnVS8zc7ZLtUObo0FPz2XF5PAKgl7zQJLHt7kSyRksDyzyM6h4s1RL8mYMB+YzlKKXflq8j
	cfg2ax+FGBrcnoC/3z8cqzloh3YFk3zxYwVn19Ze/SybtMIAJdhsFckjx3EVjPFw0ejtf2e6VY13T
	UXR5Kid5nVaOPrTZsEoZNSRE0S6FTP8O9ioMdMSCtCcBhwIbpMBcQ9zMKQopaTqmKcl98LYmXy8j6
	LUOi7ho68gb11Ev7NYYVhFOrsQbxMUTQxELzJlY6LLUicYNwRuua5i6dH/551fRzaE/d6S7Yk/Ts+
	b+xcJ98A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcng-0000000AXgb-02gI;
	Fri, 19 Dec 2025 15:53:52 +0000
Received: from mail-francesouthazon11011014.outbound.protection.outlook.com ([40.107.130.14] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcnc-0000000AXd0-0SoV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 15:53:50 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kc+Dcas1Nzd65uiWbA74BP39c9VvsWv4C2LUDdVqpg1JnSq7lNBbbDgVKf5M0stjGFZL84y/aScG1+c2vQ6sldCJYTENz+mBu7I7FQoSa4W1vGEQ5gPkiEBGhejFf/HccNMdTPu4MfZbEN0Jpo8P9vSZ3r3BIsNALreghsdpAm/t+OLUQRoA54tStUQW5edhnGLrIi08Q5dVsvFJ5V353WFgF+5PXTcscomsoNKfMqa6H1LAT+T+EeGmKbJYJg7QQU56njrt62l6S24KfHWixzo/DqyXF5duD/acbaxGF3NgO8NvdY4okW/uSfK8HyTYxkJ5ZZRP/dNNUEKHidPRyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0vKnnQVQOLcuGM0Z6DABlcPjogcbXkt0OdhVZNjZAY=;
 b=sEURBvFu8VWzXUMQ2DnF/rEa3fVK39jWDONkRxi5sfv6+F+7KYq+ZcvIhkXbNJj9gOJiSXSdinXmaGVwXRmRDgvbl9zGIMNdZZwSJ9aDLle/4vbFgR5cwkurgYeY5FlcEqXXHPMr3342sBM+FE1RejndWJ1ws/I3wZgMXpYmJMPn76Kox97LZp0TL/UU/qgU8ANigbcG9OtfrmxNVlknqepKuk1kN4pfd7OoRQLyKWkfR7KzzdC9LV0ltFzYW+fU9hC+00In2Bv/yesGV4ABnXcItC6ukNvdlzEXLFJfWanznCKUHTNwM2Vl8iek6yYA5vX9OXYiXdDn3+qcOLJcXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0vKnnQVQOLcuGM0Z6DABlcPjogcbXkt0OdhVZNjZAY=;
 b=XluUxzTtri7IlFHu2hUg3ssEC+8tNUiVJ3ithPfB+U9gmYNJZAfGD92cdkB4zP/hNdb3a88XhPoW3V20BnoqQxJ2Dky+TcAmnkATpuZrQU/AjLMXHGSA/2TnjfoI2ik1p33M7VWoriy4sc4aj4cgCQiynvhn03g0Mhm8g+0q3Y0=
Received: from AS4P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::14)
 by AS8PR08MB9096.eurprd08.prod.outlook.com (2603:10a6:20b:5c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Fri, 19 Dec
 2025 15:53:40 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::34) by AS4P251CA0014.outlook.office365.com
 (2603:10a6:20b:5d2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 15:53:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Fri, 19 Dec 2025 15:53:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSh5Z4W5cDMkYcyDVD2+5zd7AB3jmLj69dDQ/QIF01cZjKI7wUgl7Qy/cV7Vao4oV14Mdg3BiVJBVskzNJlMUfcnNHauZ0tDcGeyk0LXtsuHSn5urKaXk5qQzyMLoa6pyIwi21/16KvtoG+4v/OZynz9G2uaC0Z+CCGwff0TlmJo/px4+rSiqJEasvJNGb7KNr3t1A67yIwVvN1ev3BQdbpFuGs9HAhGtVd3/eeJ05vWuF0CzEaC+IPzJ1+1ZOOSiYF9wVAFJtENrYbzcnvB3Q85T3eZOBduLpAFoKv2R1dA4dw5nA4QCdjtFx9T9YTj71Wi4Wqv+rFi2swgw1NNtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0vKnnQVQOLcuGM0Z6DABlcPjogcbXkt0OdhVZNjZAY=;
 b=ejGXk8gjBR8OkmMF8Huh2J9oJOL/Z88BqQx/+P3gDXygZApm+OveZ0WpggmgyZy//pLMp8m0XDeb9vuKtOhKTivgutbXGGs+XVOV4EFo6riIRqf32J1JoipqaacvErY5+hsxGAb3aqJNs/sBXxtQt/0uhfVTiAh5qYPfhX/4Ta9JRc66+IjGA9djpdeKQ7irK+cahTnnRpNqQietWWBjo8HeLLEEMjVUyZRvx8/5fnEd9vTm1nIyFIpkzNM69liCFCyAR+Iczcq71T6y/HEMscPI7VnvJ4+DK5+mAUCLJBE57MmBQmXzqWDjIzfRHqwD7o+6KKYuC89jZEc3kKG+vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0vKnnQVQOLcuGM0Z6DABlcPjogcbXkt0OdhVZNjZAY=;
 b=XluUxzTtri7IlFHu2hUg3ssEC+8tNUiVJ3ithPfB+U9gmYNJZAfGD92cdkB4zP/hNdb3a88XhPoW3V20BnoqQxJ2Dky+TcAmnkATpuZrQU/AjLMXHGSA/2TnjfoI2ik1p33M7VWoriy4sc4aj4cgCQiynvhn03g0Mhm8g+0q3Y0=
Received: from VI1PR08MB3871.eurprd08.prod.outlook.com (2603:10a6:803:b7::17)
 by AM8PR08MB6546.eurprd08.prod.outlook.com (2603:10a6:20b:355::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 15:52:38 +0000
Received: from VI1PR08MB3871.eurprd08.prod.outlook.com
 ([fe80::98c3:33df:8fd4:b704]) by VI1PR08MB3871.eurprd08.prod.outlook.com
 ([fe80::98c3:33df:8fd4:b704%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 15:52:38 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: [PATCH v2 05/36] arm64/sysreg: Add GICR CDNMIA encoding
Thread-Topic: [PATCH v2 05/36] arm64/sysreg: Add GICR CDNMIA encoding
Thread-Index: AQHccP9/MNS4WvXxjkysb2bgAp6h3w==
Date: Fri, 19 Dec 2025 15:52:37 +0000
Message-ID: <20251219155222.1383109-6-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
In-Reply-To: <20251219155222.1383109-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: VI1PR08MB3871:EE_|AM8PR08MB6546:EE_|AMS0EPF0000019C:EE_|AS8PR08MB9096:EE_
X-MS-Office365-Filtering-Correlation-Id: 158d1548-2831-48dd-3e0f-08de3f16c7b7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?KVLIJ2YdZMU+fd2hkJ13A3nKD8mm+nt7945UwF9zivHDak9ZnKxsoo9+jA?=
 =?iso-8859-1?Q?CS/ST43DwB1gPkOIdf0NOk5VGRwqrF9rLrWQza7xwj9lqXp313wFMwQRGE?=
 =?iso-8859-1?Q?lXma/INeB1DLQRNYyQjtUMzbhCdtDgB1NFMBF92g756G3VzdiDHztdHf9e?=
 =?iso-8859-1?Q?yKzsq0Xad6ixyU26oSDAIIBsDsSuRjHPCnCsEV0I1f5/+DEmzcOOsggJFz?=
 =?iso-8859-1?Q?FMUBp9xhzmcg1RBY56762OWXhv6xu8+Mqxcwhc/ZUOAwz7BPkCghq0pZFc?=
 =?iso-8859-1?Q?eWnAZrxiyioNMPL0NvOzQpz9a09XiSmMXOHV8HV2sHgBsCmUNzsE+tiMe5?=
 =?iso-8859-1?Q?RCpDvY2OJhBxP5pG71EQ8J7ccTHUL6vCb2Z2S7ohnm2jUY1aXtgUmj2+GV?=
 =?iso-8859-1?Q?Nsjj5qva3V6iCT0U4t1RVFrFWN94ITLf2PNmZS3eSlXh2fWjxtRSv3A8oR?=
 =?iso-8859-1?Q?zhAPH6lsElVjDEpX77ZXuxY3HzuvjhJbGHU6VL097qg08ImcIWW1VhBV2n?=
 =?iso-8859-1?Q?2LFKd/uKpf2aWY0xnl610icA06RbkVtwQYdKPYpcZHSIpSjTs0UcqzA2fz?=
 =?iso-8859-1?Q?5zBqjcjSvPIsXkVlGodVRSAMJ2bBVQGN3ejLGPGeZIqwRPnEW162+2VMhI?=
 =?iso-8859-1?Q?KyzOpv/xSs6ZEERnVLlWQz20VA9RdN5HcGULvuNZHuR2YkiihkhTbcveV4?=
 =?iso-8859-1?Q?LYLotO0TT535Qm6O1q1LcwEXZZ7W/kdDDWun6aLyDPqM34EhMo5MThs+pt?=
 =?iso-8859-1?Q?c/Z/dYfJrl6vaTHqROKswyNmxuhFL1YRssQ2ag1RHE/dVeVgKbusNIL2mg?=
 =?iso-8859-1?Q?/or//mZvX6m60b8D6qdr+OG8hf/b2dPGD9ZEk6q9T9TMzSIzmE1rYLYDUr?=
 =?iso-8859-1?Q?Us/xIvIAQp/C/PTd+dwAYiDyoQolL7w+Qfjx3e1Du57KBROwC3uC3NlFw6?=
 =?iso-8859-1?Q?sngaKO7S++aiaFuyRfLFAZWiMZKaaTSqfjP1vgePLNKUy0+GYQZCr6cKb3?=
 =?iso-8859-1?Q?8gW1z1gQ2vqhLAwCuI15d7k1Ek2GKZvUTq/TrEo0YY2dGCO57AIvawVyx5?=
 =?iso-8859-1?Q?eksIcTXR1AmkD9584NzL8VnF12gN/xI9Qa6ZcFj/UG3sFNvLYqQDI+suQt?=
 =?iso-8859-1?Q?GA8BssMOJ7iD/wrs0SEK2kJfw6I+2qayNF+fMIUWE9G2zZ2EpXSBAmdg/c?=
 =?iso-8859-1?Q?2NVQjDTU8guqTxypALafRkfz0YaA8h6DOCOSvJPe0LWlVzt65mEjsmUm8T?=
 =?iso-8859-1?Q?LYqnErfNe2dDFHsAnnT5CftGIIA8xwUgoVyFVzEOKlQiLwHZBtRB7d0Y2l?=
 =?iso-8859-1?Q?5HZWfdnxh7cKTIqFRLL5kiJrex+4bbGSLX+r8miUFdf9CLNbpa0oDRDtsO?=
 =?iso-8859-1?Q?VD73YlqIlVNbnlfT0pLmXXzvTOUE0qDi0LHBE5f1A6Rg8Z+0nNtHODct6h?=
 =?iso-8859-1?Q?ctmupxGyz0NywzxbQkp8gopc7eYmewVzcAfhWw/STUeIeFoQnEHLZyj56t?=
 =?iso-8859-1?Q?eBQGyTKbLI9DTV/iQN7WD2pHIwTvMM+Qrl6Hg2RlEavjYwGWQrvrx8Ig2A?=
 =?iso-8859-1?Q?qqp8SVjSYkrslF1Q2LWNQbGq24XI?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3871.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6546
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b3316b48-369e-41b8-55da-08de3f16a2d1
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|376014|35042699022|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QTF0reNLZqUwl8RC26mNVr08qFAonogsLaJZ6QsOaaKZ0AG7q53FSlNx3X?=
 =?iso-8859-1?Q?G1iKwBggGqDJ5Bs7NbgC2NilYcd6RekK59J8+JMjePNIoN+vTWI2DdxdqK?=
 =?iso-8859-1?Q?3LrY7FyLdrtut8LfMIonjDLK8sHpdS0HbqVQfBNBcDAzt5lQQkqQVwT4vJ?=
 =?iso-8859-1?Q?7K7F/AsKZ+HCiwaNq3XWG0yp4dH8+5QhDGnlxT8AMjXBF/uS/HgAP048OH?=
 =?iso-8859-1?Q?vmEEFu06Is+doJMMhaKPpWs59HXOikzYtfVve8d7ZsQ+eFXi0v2WD2DJpd?=
 =?iso-8859-1?Q?esI6wgXkfCaGwca+Q+OD7C3n/VbNmIEdZNT3Buo+tONQBSfzFeIzaGMHCz?=
 =?iso-8859-1?Q?rs7wBqWuKRWxMUFG/Ftaih0nUhsAbjS9/IQCDRPwVonkompTGKWrfYM6eD?=
 =?iso-8859-1?Q?/jvm6L375QpkgV/60qY/UrqOdkalPAuZw5XHbnMFWfZ0lz9/z1FSBh0+dZ?=
 =?iso-8859-1?Q?BYUg4bVDyDMp6u+sIt9bpUz6f/m3PTF341eABxrRT+Qu5B1+/Il9RrcbBy?=
 =?iso-8859-1?Q?Pf2Xd4uGnBH1uSuixmMkii4pmYAIxOjV8WKZFoqBqfnYwkZSQQzN7AVcrv?=
 =?iso-8859-1?Q?P++0KBdvykK7KrsBAcDHke4rAbnSCf0PD0n6for+9h2n2ePZw0JrTVw98W?=
 =?iso-8859-1?Q?q3eVPPIqA2WNdFN9V9Fk40q7XZs2ymv4exqBCiUhlCPLWpRbe/xNkphvME?=
 =?iso-8859-1?Q?+1I0naLv28gjB2KkB85xgTha1Y3t2TTu7hYy7QFgp/9hTzZnoPJ6ARCgHG?=
 =?iso-8859-1?Q?eRiS7GfRsaCPe56hIvqkc8W7Z6vx91kuW8h8hQl4b2LHbLxix1E51TXJYS?=
 =?iso-8859-1?Q?nNA69lwHz1vRnD6xvic/GD+0PZW0Dgx6z3nwlBbyp6zBLpALucWDeV25w8?=
 =?iso-8859-1?Q?Egi3meDVSDWkcuV7BZPM8AP5bOEB9n+US7GNZIyvXAw79V4m741cx61vwP?=
 =?iso-8859-1?Q?qU6BpYCO0UboJB5BWJcYtAi4+39j+uRfqbWlkqWKgkIkPo6qmhy+p+NKe8?=
 =?iso-8859-1?Q?NrulBwcSTgej6t8cZyn4hbwUHc1Q1JRY1UB793frdT6Bc4xojgUeZ7xcDY?=
 =?iso-8859-1?Q?5r9n9AETQ2WVB06wTY1APdGi976h1Ar2mW4XtPh+7twsDIsWALD9WRNmqy?=
 =?iso-8859-1?Q?lP1SEnUB2fnTSE6oTbrzSfsTzXWahmjfz3pzG/JQYQvzPK9KG+071Iains?=
 =?iso-8859-1?Q?wZEAWaqJ/G7sBuIgJkr1M8GhAPoCjvlsj6TjyGMnEje6Ak/EOHKyQty+Hk?=
 =?iso-8859-1?Q?0XERn00v4QBI63OcrWs4b4omJKRWkrEZwEHeZ+rEKiSFKI5yvoBj/LaOll?=
 =?iso-8859-1?Q?cnsGAgSc8R5ZfirVHCU7+SVjLktjjKpwZ74pJ5Db8vnhbr35ym9VJS7jsG?=
 =?iso-8859-1?Q?wEtPQL6kgXiqkEEmTHepqfR8GFQwsy9r24Gnmhek360Ol30/AkI1Uu9El1?=
 =?iso-8859-1?Q?ZWkG21gwDX41CtHL3sh2gFlfI7mAv5Dzx1wsoan5ARghLQSJsjmociEBNM?=
 =?iso-8859-1?Q?aM/mndrw7ybCxf3BbK9PcGncYrAG0ue+MVv1A0YqTk7+nPjaw50MDjMDof?=
 =?iso-8859-1?Q?Pbd1bRkzwilK3JGaYqPMgnoTM6/3AlSUBb2Q/vkuXnsNP49LkGTNlJv3Ck?=
 =?iso-8859-1?Q?ivLFCQ+OYcP/w=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:53:40.4835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 158d1548-2831-48dd-3e0f-08de3f16c7b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_075348_335562_E18CFE3F 
X-CRM114-Status: UNSURE (   8.52  )
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

The encoding for the GICR CDNMIA system instruction is thus far unused
(and shall remain unused for the time being). However, in order to
plumb the FGTs into KVM correctly, KVM needs to be made aware of the
encoding of this system instruction.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/include/asm/sysreg.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysre=
g.h
index b3b8b8cd7bf1e..e99acb6dbd5d8 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1059,6 +1059,7 @@
 #define GICV5_OP_GIC_CDPRI		sys_insn(1, 0, 12, 1, 2)
 #define GICV5_OP_GIC_CDRCFG		sys_insn(1, 0, 12, 1, 5)
 #define GICV5_OP_GICR_CDIA		sys_insn(1, 0, 12, 3, 0)
+#define GICV5_OP_GICR_CDNMIA		sys_insn(1, 0, 12, 3, 1)
=20
 /* Definitions for GIC CDAFF */
 #define GICV5_GIC_CDAFF_IAFFID_MASK	GENMASK_ULL(47, 32)
@@ -1105,6 +1106,12 @@
 #define GICV5_GIC_CDIA_TYPE_MASK	GENMASK_ULL(31, 29)
 #define GICV5_GIC_CDIA_ID_MASK		GENMASK_ULL(23, 0)
=20
+/* Definitions for GICR CDNMIA */
+#define GICV5_GIC_CDNMIA_VALID_MASK	BIT_ULL(32)
+#define GICV5_GICR_CDNMIA_VALID(r)	FIELD_GET(GICV5_GIC_CDNMIA_VALID_MASK, =
r)
+#define GICV5_GIC_CDNMIA_TYPE_MASK	GENMASK_ULL(31, 29)
+#define GICV5_GIC_CDNMIA_ID_MASK	GENMASK_ULL(23, 0)
+
 #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
 #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
=20
--=20
2.34.1

