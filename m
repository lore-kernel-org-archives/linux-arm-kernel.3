Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D53C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+inRgGSz1U6L50o8R7W+HWSPOw+AYju+eC6UBSnEY48=; b=LRUD7Z53FnRNw+AtufHOuXs6EX
	5ahvAQ7FY6JED2BhpF0QkAhRrfOeQdkd5PMBIjzelb3EOKOk0S9HFM+SSlIs35WQ6jWHyQkx3qMky
	xyu5HhsqW+M0nGXX0MOFmvlFyJ5UiQl0hlsG0/viRvWfBUBB/JD2tqZxwkwen7cOXvQ6wn29dyFyo
	/ulSgncW1UzYB2murNR8VrUYDyLrCBVxHLUmbVVqip3y3cdUq5FIvtnypICPNrbYDJbA7+S1Mxvlc
	NyUleC16DqG+gS8KogczUXOuKZWkdMct0e+KU59eqRYBF4zmH9HsFIlu6+Zy1+quqLZKDYI4IZN+a
	7B+yNDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYih-0000000DvaL-0JLF;
	Mon, 24 Feb 2025 13:42:03 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYhC-0000000DvBl-0RT3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:40:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4oEdVTpSqs3V85u0nAhMLdjW85lJtG5+VpUdh8oaJb8cZcwpwFKqVETyrB2SFZycTbffNKeAdbwXnVMRB+hUNMhav+UuS+0c1Fn4YXYCBFAeFtOcJoavLH+quld1Lc2HwgnfhnxNXKAv2mFb6B5alOD38hsMq9W1hXN0j3+GkPKr26GVBLh7LjszcAu+sY5kOqyC3AasvYA2CiQi3autxHqExW2jLgrh+EalyuDSIv3hfXfU7M7uIULgwV6cIye36wkjgK4MBOVIGCTkBKZ7ZF4DwVzmGMw2PlwKPSfwPtkf/9nahmlkum4rx0H78cJFY+Op8bAaWKIGLZX2vEGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+inRgGSz1U6L50o8R7W+HWSPOw+AYju+eC6UBSnEY48=;
 b=aqJ3eHiX4Sw6Gh1Gg96iOLaEIku8yO+hHIzNs2vQzTRyzjLoZDm35UbOgUHZ2sGZrKb/TO9PhX7r77GlQPq9BCL3mICac1uXcBLlfT+i6XmcqQNmWKiYEjsjAM3gyDqpfbf2J4OPG8N2gvAaygqDzGgNUd1qinCDZSkMkakoOAtpzEnRalCQov5SYlcHSfDsvQOlkaW+tow3wyQNUSVab1O4WtvjUIFEO62+bK90V3je1Z4gqiTloLz/+a/JRNW+uVxl2xAP6BSCYdSsJo8ursrUvSni45TSk2yXIv14XO9GYjJ7+9OGg297LDARMoDz+ksSR/cbHGy0wQ7gjydb5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+inRgGSz1U6L50o8R7W+HWSPOw+AYju+eC6UBSnEY48=;
 b=FkB3EF7mcg+BIpil74YdvgxUMW/5IrbHb3DO8Yr7UEgaBuc/q5O5wgHTOuUoB5OG6J9bTsgTupPhAw6R7BfwQnf+HcLWZLpj+p8DpvGsg/g9maNC+TAjxP+2a+4Bg2E11tFlrAacrr7X01SFyBJFMHoeRM3V26proWxO4uYW95oKugl9S4StR7asxU0IGuJtqx79Pprr2Uw7MnOXTYkk6ZV/NGqS0i0YSdXhEn6FZHB87RkrnqFlWYCUQVQxZebhBSpe4W+casm/X1uSrBYrLwvzT6lTMJRL+n8BdHuW18vjGKmv0E1RMJY/JtYgNs7LPCTcdENHxz77os+qmGnBsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DBBPR04MB7867.eurprd04.prod.outlook.com (2603:10a6:10:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 13:40:23 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 13:40:23 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH] arm64: dts: s32g: add FlexCAN[0..3] support for s32g2 and s32g3
Date: Mon, 24 Feb 2025 15:40:16 +0200
Message-ID: <20250224134016.3921196-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::14) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DBBPR04MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 90230ab8-ad65-4b18-9f13-08dd54d8c999
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHlCMWM3SGNmbnhrQjh3OHlVa3V3ZjhKMnVrOVM4cEhvcDRzbmZsTnEvYmsz?=
 =?utf-8?B?Z3o4UThjaURmZHNHOUJjZUVYbklXYUV1RldKcFhTY3l5TGxMQkVoQ1JnbVE4?=
 =?utf-8?B?K0FBWDd4NmE1dFNUbTdUeHZHVjNPUjVJeGxWbDZFZzd4S3ZEM0dBODFyQlJv?=
 =?utf-8?B?QVJDZkVXb1JpNmNjejdyOVNiL1RPUXlkQXZoUmNhY1VhT25wKzlyWTV1aHJN?=
 =?utf-8?B?Qm5jNllEUk5pR2Z3eFA1NWVmSUtlTVMyODFwaHFrTE9UOHoyZDZONkczMjc1?=
 =?utf-8?B?Z3o0OTZqdFlDdDN1NzNvdHE5c2tUbG1yTDNwUUNpWWd3UHk3V2pXMVArMmZK?=
 =?utf-8?B?VU13RFYzVHFXemVDNFlTMjJwS3BTV3h4d1l1YzgwN1JhZ2twYWVVVVNOVy9W?=
 =?utf-8?B?L0kyVlNyL0V4K2F4TWtIY2pFc0VkNUxIU1h2K0MzbkhTZE9DVnRoeTBnL0Yr?=
 =?utf-8?B?SVFuUjljZXBEYy9CbUNiRE9GUGVxc2MwY3BvNWo3RXVobVUzQlBkNXZUZ3hV?=
 =?utf-8?B?K1dSRlJLc2VGV1dNcGVwY1VucXBVWXpBczhtMy9xT1R6SEdUN1Z1S0w3ZkFP?=
 =?utf-8?B?SkN5RXN2RXJMWkFMR1kyUyttY1JPS0hhZmJpKy93TkpNc2pjYlhqc1IvNlU4?=
 =?utf-8?B?ZytEV0twS1dwbmI3NG5KQ21jY1cxcktJYWtKeVJNeHpSRVF3TVNGUllXaldE?=
 =?utf-8?B?M2o5cVppSGxzU0RKNGJ1WXMvWGk5c1VvckoyRVF2aVpPVWtSOEc4OG5NVCtx?=
 =?utf-8?B?RURSekdBN1ZKQWlFakFOVlR1OGtKdm5jTVBITlpycXY1SzhuWnkrdUdLWUl5?=
 =?utf-8?B?VnlDbWFsWDNUYmx0Uy9kSGNpVURjUmtUUUFETTRDVVhVWGQzanRocm5INkdq?=
 =?utf-8?B?RGFTdXNmQ2NrUXNQd1BXU2RWQmNxMGxsZ1c4dTd4ZStTYnMrODVsRE0vRThY?=
 =?utf-8?B?RHhPTkZmWXNIZGgyeUk2bk5ROFJxUWpickU5UGNmMkd6QUZTcU9tU2dlbk1F?=
 =?utf-8?B?NnZKc2VFbXB4ZGlMWTZmaFFSblFRaU1UZ21DOXFPMFFWOS9OWjdxWHJidEtm?=
 =?utf-8?B?dmVkRk1GbFdiOEpiOVptQUkxUHlHMHpGWmhqVGxJTmJJMjFVd2hkczJOOVdX?=
 =?utf-8?B?MUpuaTBZVzBLb3dtNnd2b1ljUkJuc3lsM25QV1FUQnQ5RlRSMVYxN0p4ZGQ1?=
 =?utf-8?B?c3ZUNThZN25jVHNnenZKZFBidUk0OFIzREhnVEI1NkJxT2FSSS85eUhtWU93?=
 =?utf-8?B?eU80QTR2bmg2UXNOR0ZxZDRNWmk2eWkwSUhiQUtyd0hjakxwR09nUHYyb1N2?=
 =?utf-8?B?ZkNwUFlYRkJkOWZRRDJkWHZhOTBvQkQ3NTRualBQeStMR0htd0wrNjlFalo5?=
 =?utf-8?B?c0c5NUhlR3A5WmIxazQrOEFZdE9mZzk1bjNpbnI2dm9qeUEvMEtsMThVT1FX?=
 =?utf-8?B?NHp3Y3VhS1orZ0E5bCsyTHdXZ0hDenZHdytxZDNJT3FPd0dLblNQU2xIU0ZT?=
 =?utf-8?B?UWJreno2dkFLU0tvZUh6VFBRRkl0dG1Ld1Q4ajRzVWhFemFZNWtnaXlINlhC?=
 =?utf-8?B?M0JsN3c5YXozVXVKU1JoYVQwQlFpRXd0WjdmMDZCNTR5WlFQRDRPaDlHN3Ft?=
 =?utf-8?B?MjBNT3F1WGUyeHhRZ0VacjlhRFdzTG55VHh1QTdxU2VoYlNBZmhjc2l0Y3BG?=
 =?utf-8?B?RlFtdGxhM3gwYXRCRklLODZ6RzNLSFNDaEJqYVRqWUxuOXdFVDdUbHlvSGVQ?=
 =?utf-8?B?Y3IxSWd3N2dZMlkzUndGd2hZUTZjSzV5R2xqb3dQSEJpbUZDcWNmb0U3QXBN?=
 =?utf-8?B?ejFhMnd5TzRkU2xuWVdPRHY2bjgxdHFGMmU1aTJlaFppV0NZenJyTm1GSkFs?=
 =?utf-8?Q?cdD6EVoHAkutz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cis4cjlhR05wVFFKaGRUWlErcFZtVlVUSXZKWGdNbmc1WWwxNDRqK1dTSlJv?=
 =?utf-8?B?ZzhYUElpWXlSZnRwWDdBRU9RN3VSRmNwcUpnUkt5YjFOMEFYUUtCOFo4Vlg4?=
 =?utf-8?B?NDNqZWM2aXIzNncrRldReDJPamEyUUR1ekVNQ3hYRitGRUh0aGVNUTQ0UGlI?=
 =?utf-8?B?c2Rnd1dxcEdMWUkyN3ZBS3lyejZHa1p4N1VoWFhIUko2TDJUbU1BUFFtZHJD?=
 =?utf-8?B?RzNneE02djBneWcxMkFYMmpCbXYzaWUzTzg4ZW9jRUZoTXl1Rng2UEJCelJD?=
 =?utf-8?B?VVlTR0VJQzZFdWR4NTlsMkI0V2dwTFFnOUVJMUxqMGlIT045WGZOZTZRekQv?=
 =?utf-8?B?d0VJd0h3S3QyYWJrQWpHaytteFNzQkVFU1g2bHpTSEFRMmg4aE55ZDUrUTZq?=
 =?utf-8?B?YUNHMDQxdVZ3a1FKMGdXaFRxd1JiYXBMQmpNRVFDOEtyWHdPSGIwcXMyMk1i?=
 =?utf-8?B?dFFWenF0UEJpVlVVQXU3NDNzZjY4S0N5VDVzVFd3QUlBTjV1emhONEloQUgr?=
 =?utf-8?B?cVRTQVl4OUNOampZNHVXeTVUWW8vN3c2R2ZMa2Ric09XeHV5MjRKQUVWWGxD?=
 =?utf-8?B?Sk9SVXdBYzUwZTRtcU95d2VJTDRJMGhIY1BwOUZmMU1lekt1K0d5N2lYY05T?=
 =?utf-8?B?cDBLRmtVN0VmK2hVNHdXVUg4RXBENzIwL3lVR2NXKzBndGNMVjZqOHAxSGZU?=
 =?utf-8?B?c2pEbnExTVVFMG5paEY5WVNKWUljS0dHWmRvc1VjUXJzdTMrNlZQOWQ4TlRL?=
 =?utf-8?B?SWthcjlBeUNyUlRoVmdrcXVya0dJUDRUalRlWmF3dVFGN3E4UXFWN3dkdXNE?=
 =?utf-8?B?Y0ZQenZtTmtOd2VNZnRaSXQ0UGRuSEZmVlFCZVJYWHpUTjN4Ukk1MkRYRXZI?=
 =?utf-8?B?QVlXSkdZcXIwaVBKY1c2YVVWbTg4R3VnaEo4RlRKb0VDQ2VmZFRpejZaczkz?=
 =?utf-8?B?elF4bWZ3dlViYmZYSC9ucjgveHRBYzZ0dU0zRGNOZWMvdjY0Q2FwYUpvN0NV?=
 =?utf-8?B?QS96aUxMRmI2eG5iaGdYVzNHMiswQ3dWRzhJSUtVdkVEbkgvZzFDSStqem5O?=
 =?utf-8?B?NDAzMWZwOFhsY1gxc21sSSsrUEF4RzczSnVBY2lsbXhxUm5iTklwOTduOU5G?=
 =?utf-8?B?RElNdjNuYXNrZDQxclN6UFNXZ0dvSStpSkVBQ2ZmMjcwNDE3eWZIcURZbkhj?=
 =?utf-8?B?S0IvMnpDS1UrU3JISGo3Q1l3aEVpQ0xFTERqRzd5WGpFUHUxSW5kWklpYk1M?=
 =?utf-8?B?UGR1cUVOSm9Ud0FhSTJxUWdPMXk2VGx2T3p2dVJjQUhMd2VEbHNHWklCNWRI?=
 =?utf-8?B?Sjh5QUczSzdJYmV4eUNFV3VSekkyRXdZKyt1d25pSVlJd04vK2xyOVJ0UFJN?=
 =?utf-8?B?a0VKOHI2WGRaTmF3bTFvNzNEQ2RQQ3NsOU5BdEk5dVBrZ0pWaXpBTzhyN2U3?=
 =?utf-8?B?QmJCcWw0YXg4QVBDTUpQMWZWTGk4anliRnZJa2I4SFVlUkNyaUNFRm95c29H?=
 =?utf-8?B?Y0pIdHNaNStXYjJQUnVOUGJuY2hEMkZMV1UxcGxWRXpTYXZFL2xpMFlQRllh?=
 =?utf-8?B?QWpSMVpSMXdwc1ArYS9PRTN1SnZRcTluUTZrVGhjZmNoZW5rTnNkdEtTR24w?=
 =?utf-8?B?TVBiZm82SHczOFhnT1lhOXduRy83RVVJZkFsMXlqY29kZytvUFBSSm50L3M3?=
 =?utf-8?B?S2tqS1B3b2dWVFE4aTdEZDZSaWhjdFJFd0l0eW5vdVN4ZkVLODhMbmtIaUxl?=
 =?utf-8?B?d2JGdy9pMVdHbFpxMml1RHArQldGMzR2UlQxL08wb3pNa2ZSTm9YWjhycGw1?=
 =?utf-8?B?bUZrOUk2TGhTa1dwUFo5Z3NOUStaUk56cjZ5MTZwcVA1MjFCM2FacEluUi9G?=
 =?utf-8?B?REdnKzl6ZjN3SkhXYzIvQWFqNzVqS2xqWHJ4Q2lqZXBPODdXbkpFSkhtaEdm?=
 =?utf-8?B?TXRoc3dXNEhxL2xZRyt3UjhsY1J6WEoxZWNOT1JjcUsrbjN1TmlUNWsrK0Zt?=
 =?utf-8?B?c3Rtd3BqaG42anBvcW01d1FWblRNUkczU2dXc1UyQTdtYXU2OGJCTWYwVGlm?=
 =?utf-8?B?c0R1cUY3eW5JbmFtME9LVm9qcTJUNU9pMUY1M1hSekw4TGErRGsxUVlQVm84?=
 =?utf-8?B?OWFGSzEwQlBkZ1M5bld5eThNa2k0dFB5cjFlSmUxczc0N3dIemZ3ZVBBdnds?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90230ab8-ad65-4b18-9f13-08dd54d8c999
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 13:40:23.1821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5NKG1RysmC44Pz+Mb8jNtHO5xXPYcWfmqQrxgxPm5hi/1tWZoHQRznWo4rJ4yeCg7j7Ghd04m8/O92z/6gmYoeVxwvC1eIQwu1Ac71Uc6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_054030_298551_48E0389F 
X-CRM114-Status: UNSURE (   8.32  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add FlexCAN[0..3] for S32G2 and S32G3 SoCs.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 52 ++++++++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 56 +++++++++++++++
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 72 +++++++++++++++++++
 .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 48 +++++++++++++
 4 files changed, 228 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index e38f1f878790..ea1456d361a3 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -334,6 +334,32 @@ edma0: dma-controller@40144000 {
 			clock-names = "dmamux0", "dmamux1";
 		};
 
+		can0: can@401b4000 {
+			compatible = "nxp,s32g2-flexcan";
+			reg = <0x401b4000 0xa000>;
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mb-0", "state", "berr", "mb-1";
+			clocks = <&clks 9>, <&clks 11>;
+			clock-names = "ipg", "per";
+			status = "disabled";
+		};
+
+		can1: can@401be000 {
+			compatible = "nxp,s32g2-flexcan";
+			reg = <0x401be000 0xa000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mb-0", "state", "berr", "mb-1";
+			clocks = <&clks 9>, <&clks 11>;
+			clock-names = "ipg", "per";
+			status = "disabled";
+		};
+
 		uart0: serial@401c8000 {
 			compatible = "nxp,s32g2-linflexuart",
 				     "fsl,s32v234-linflexuart";
@@ -400,6 +426,32 @@ edma1: dma-controller@40244000 {
 			clock-names = "dmamux0", "dmamux1";
 		};
 
+		can2: can@402a8000 {
+			compatible = "nxp,s32g2-flexcan";
+			reg = <0x402a8000 0xa000>;
+			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mb-0", "state", "berr", "mb-1";
+			clocks = <&clks 9>, <&clks 11>;
+			clock-names = "ipg", "per";
+			status = "disabled";
+		};
+
+		can3: can@402b2000 {
+			compatible = "nxp,s32g2-flexcan";
+			reg = <0x402b2000 0xa000>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mb-0", "state", "berr", "mb-1";
+			clocks = <&clks 9>, <&clks 11>;
+			clock-names = "ipg", "per";
+			status = "disabled";
+		};
+
 		uart2: serial@402bc000 {
 			compatible = "nxp,s32g2-linflexuart",
 				     "fsl,s32v234-linflexuart";
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index d849edfd26f5..991dbfbfa203 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -391,6 +391,34 @@ edma0: dma-controller@40144000 {
 			clock-names = "dmamux0", "dmamux1";
 		};
 
+		can0: can@401b4000 {
+			compatible = "nxp,s32g3-flexcan",
+					   "nxp,s32g2-flexcan";
+			reg = <0x401b4000 0xa000>;
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mb-0", "state", "berr", "mb-1";
+			clocks = <&clks 9>, <&clks 11>;
+			clock-names = "ipg", "per";
+			status = "disabled";
+		};
+
+		can1: can@401be000 {
+			compatible = "nxp,s32g3-flexcan",
+					   "nxp,s32g2-flexcan";
+			reg = <0x401be000 0xa000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mb-0", "state", "berr", "mb-1";
+			clocks = <&clks 9>, <&clks 11>;
+			clock-names = "ipg", "per";
+			status = "disabled";
+		};
+
 		uart0: serial@401c8000 {
 			compatible = "nxp,s32g3-linflexuart",
 				     "fsl,s32v234-linflexuart";
@@ -460,6 +488,34 @@ edma1: dma-controller@40244000 {
 			clock-names = "dmamux0", "dmamux1";
 		};
 
+		can2: can@402a8000 {
+			compatible = "nxp,s32g3-flexcan",
+					   "nxp,s32g2-flexcan";
+			reg = <0x402a8000 0xa000>;
+			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mb-0", "state", "berr", "mb-1";
+			clocks = <&clks 9>, <&clks 11>;
+			clock-names = "ipg", "per";
+			status = "disabled";
+		};
+
+		can3: can@402b2000 {
+			compatible = "nxp,s32g3-flexcan",
+					   "nxp,s32g2-flexcan";
+			reg = <0x402b2000 0xa000>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mb-0", "state", "berr", "mb-1";
+			clocks = <&clks 9>, <&clks 11>;
+			clock-names = "ipg", "per";
+			status = "disabled";
+		};
+
 		uart2: serial@402bc000 {
 			compatible = "nxp,s32g3-linflexuart",
 				     "fsl,s32v234-linflexuart";
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
index a44eff28073a..d26af0fb8be7 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
@@ -8,6 +8,60 @@
  */
 
 &pinctrl {
+	can0_pins: can0-pins {
+		can0-grp0 {
+			pinmux = <0x2c1>;
+			output-enable;
+			slew-rate = <133>;
+		};
+
+		can0-grp1 {
+			pinmux = <0x2b0>;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		can0-grp2 {
+			pinmux = <0x2012>;
+		};
+	};
+
+	can2_pins: can2-pins {
+		can2-grp0 {
+			pinmux = <0x1b2>;
+			output-enable;
+			slew-rate = <133>;
+		};
+
+		can2-grp1 {
+			pinmux = <0x1c0>;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		can2-grp2 {
+			pinmux = <0x2782>;
+		};
+	};
+
+	can3_pins: can3-pins {
+		can3-grp0 {
+			pinmux = <0x192>;
+			output-enable;
+			slew-rate = <133>;
+		};
+
+		can3-grp1 {
+			pinmux = <0x1a0>;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		can3-grp2 {
+			pinmux = <0x2792>;
+		};
+	};
+
 	i2c0_pins: i2c0-pins {
 		i2c0-grp0 {
 			pinmux = <0x101>, <0x111>;
@@ -121,6 +175,24 @@ i2c4-gpio-grp1 {
 	};
 };
 
+&can0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can0_pins>;
+	status = "okay";
+};
+
+&can2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can2_pins>;
+	status = "okay";
+};
+
+&can3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can3_pins>;
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&i2c0_pins>;
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
index 91fd8dbf2224..ba53ec622f0b 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
@@ -8,6 +8,42 @@
  */
 
 &pinctrl {
+	can0_pins: can0-pins {
+		can0-grp0 {
+			pinmux = <0x112>;
+			output-enable;
+			slew-rate = <133>;
+		};
+
+		can0-grp1 {
+			pinmux = <0x120>;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		can0-grp2 {
+			pinmux = <0x2013>;
+		};
+	};
+
+	can1_pins: can1-pins {
+		can1-grp0 {
+			pinmux = <0x132>;
+			output-enable;
+			slew-rate = <133>;
+		};
+
+		can1-grp1 {
+			pinmux = <0x140>;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		can1-grp2 {
+			pinmux = <0x2772>;
+		};
+	};
+
 	i2c0_pins: i2c0-pins {
 		i2c0-grp0 {
 			pinmux = <0x1f2>, <0x201>;
@@ -93,6 +129,18 @@ i2c4-gpio-grp1 {
 	};
 };
 
+&can0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can0_pins>;
+	status = "okay";
+};
+
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can1_pins>;
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&i2c0_pins>;
-- 
2.45.2


