Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04524C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 01:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BR0DBd5UccbAtX70BWuEg9hwc/gcqidAhAjhM07UIAM=; b=sP8WEofifJKCIT2AQODJjy9Vei
	S3rYXXEng+8Ob8wA2g7t2E4JiAHBSyI8fisKih0pc+OVFc1oySZq64a9crDU+VXKyEcRg5IZDfpTK
	UPD0aUSarBrcyiluUD5Pj5ePdRmkAQAFjl32LPNbBF1FoSlmnH9NMmOpkx+fGmfB6XMt+5HKaGnWr
	IpiUVIxQ0PGXnluV94dYdVHabaaO9NETx/JXyNJzgHa6uPI0nxyjXviInRxD0Om/bDITKSii1mdMf
	YyPQH5WaqBWqi7KPqVUU27HvE+yDGctD/WmTt5H1rvNsmlvkwyGg1YB+D01fjbGfHfCOBIaFeio5s
	Q+p/U4qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujpox-0000000H5A8-1f1x;
	Thu, 07 Aug 2025 01:53:31 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujpju-0000000H3Ni-0pG7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 01:48:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFsx3/2B9JEfxApgiuNWGZQbepbIk7VROxNwLE8byiODc4GWoBj1rCuWAXkqv5L88ecMvU3/rFwgvjNkOZvDVTze+ovD+qRA1gyn8UG/T6NodEMQYZxqO9ZlPYhrp4gCe3w1F1Jl8UygK3+3/HOkepVEOnawXDLJo3rq1atkvS2ZSm4/HiZcEfzqlBtuqR1n649YGmt+g6cm8uWpSz46VWMkaI98dU6716v83KN9u1RDj6Zs2IgSBg/HeaEgwrmKb4wx4nN+cSVRHOK+6IM5wGbMMpP4fbNpUOp20wtUYrhEGLqzKfGs1EjKfIAFD7pSqKotZtyxubodxQgWj7cCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BR0DBd5UccbAtX70BWuEg9hwc/gcqidAhAjhM07UIAM=;
 b=wYWNCHlgDNXyf+KhUca+AEqkMyloQzcoLkS2Jh6TFTXyQlwkqypjoIWbDoilr0cOS2Z64Op11y1IwZOmot7jBH2yW9GGufzNW0dQ5sm6wzw7lGZ3b2wtMiWlR3pOzs2uM1+vnQwUcmp3Bdan3CRU55yiGwX2AEEBJF8lVryeW6nSlDb+rB+wJzgz7cbZpv1OwCPWHQ2GWV1eSfhJ9QbrPFto8K1G3JxxOEhYk2XBDys45AaKwxiQll4HEYlHLAmvCkSEgeLsOzTbi5jxsJqRxVwIWWOGYeLgCaBwehsa21Tv19mWbVoezW5hQ4ol/v1ojziMQ5b5p33PnS9EnQtEuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BR0DBd5UccbAtX70BWuEg9hwc/gcqidAhAjhM07UIAM=;
 b=bMk9PVa8+q8BUqC9bERSr0p3KZx44XpunUEu5WQKz2t51wnV4SuTjgC/MakVwVrgwaWkjVsSoPrU0Ejo/6znJjyF02/NTjClKYXpXnuDb+miABlSLodXBd03EJpgVPS3jC0z6jnv7LeG0Qn3GmuW4fMGtsa+ZT8O2+wKeDCF13HQ/D7UeDjyu/0sVbBNcg2uKFmC/mNO663FItGFswTpjsjU92QMB6y4790sh+IAu2eIrv4GOp34B5WirTYhmWsSRIuf9LCBoCRjxlfUXAhgouaM1W6/yLG1QYAdthU3sXqHQKiakn3YkwWkyevVhQ4+chEZeVkLfVl1fH5xYs+wSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7683.eurprd04.prod.outlook.com (2603:10a6:20b:2d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Thu, 7 Aug
 2025 01:48:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 01:48:08 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 07 Aug 2025 09:47:42 +0800
Subject: [PATCH 1/3] firmware: imx: Add stub functions for SCMI MISC API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250807-imx9-sm-v1-1-3489e41a6fda@nxp.com>
References: <20250807-imx9-sm-v1-0-3489e41a6fda@nxp.com>
In-Reply-To: <20250807-imx9-sm-v1-0-3489e41a6fda@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754531281; l=1630;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=piMbvUDaQyS0A7I1oGtvAwEi8nbuMhE9yD1f4dRrq5k=;
 b=aBMwQhOB3EnDGoOlAh9oQUtGO4NBrWJys50tm4NhEh27GPIO0R+y9BM8XswVMIFJqk48tSc2+
 mGZcWp2nGyRCT4fPhqLQjE3xRa0igbh3sS8suApOOF8vGZ2e68V/Mob
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b11d79-bca1-4076-e014-08ddd55475ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDEvdmdySWVTYmVLbFh2YkZtL1JkNW1TOTQvRmoyRzZCazJMWElEMHNqdzZm?=
 =?utf-8?B?VFFHdzN1WS9TMU90dG5ORE01NDR6SGVGMW1FbVZZdzVmYWcxc1k0cm9PbHhq?=
 =?utf-8?B?aWVSbXZzSTRlSGVFRWxrVi9VR2lhdGx0czFpcjV4dG5TemxRcU9KL2FUWUp5?=
 =?utf-8?B?RmdkVzIvV1VNV0txdC8veXhMTjZuK2N6bitTaWorajFFeGo1WGNNb3FIcTZV?=
 =?utf-8?B?OXdSTm9TNDdMWkhieTV1M3Q0bitFRVJrc0t5TUFwRkVnc3dEdHdhdmk5bmZ5?=
 =?utf-8?B?cHZjczhUMHVJN0dpWDdEajFmRWJ1SzdBelpIUG1yREhqcjhjR25JRzYvVFJy?=
 =?utf-8?B?eHpJSWFvTGNHd1pkMDFZdlh0Z09ud25wYkVsQlZRQ0N5V0Nha1pVT2dqR2Jz?=
 =?utf-8?B?UUlGZ05FQk53REhaN3RHSUdtUEIyRXZMQUIvN3lQa2dxNHhZRVd3dDNvcFAy?=
 =?utf-8?B?ZXg0QW1MVjZlaU00Y09EOVNHQ1E1bHlOSzJBMndqZFlLeXllQXE1RUJNZ0ZG?=
 =?utf-8?B?T2Y5RDhBYVV2WVlxaUVOQkRtRVJ0M1ZOL1I5dFpON3J0dnR5NmxYV1ZZQ2Fj?=
 =?utf-8?B?OWFmN3dwclAwQm9vMXIwaTQ3U2hBZzdkL3VzK29aMUxEdGZPVFhqZVQ4T2do?=
 =?utf-8?B?V3A5eGl6cUY1aW9yd241azlkSTFDQlYxdXc0akJjNzEvVzJrWGV3OWtpakRU?=
 =?utf-8?B?dU5WOVJpYVFKeGt5UHYvdmx5QXEzZWkvTXJlcklhYVlwaWEvNWRaU0haaXRV?=
 =?utf-8?B?YzhoSWlKa0k2bzY0blNLNytEVTJzS2JPSmxuMXc3R3lyOUhqb1ZiWURoOU5s?=
 =?utf-8?B?SWtBVHJsWlZUbThvaVdMblhEN1c0WkRvcE8zRmswd0J3dExXV2gvMy95ME41?=
 =?utf-8?B?SE1NVEVsVEJJN29CTEw2RlZZeGNOVGUvSU9LSDBSUDNmdkhncmJVUWRKQ0Y1?=
 =?utf-8?B?TnV4Y3dtbWthVFZPbW1OQThsNjkxdmJKZlJjNHNSbnh1WEVzR1FEWWxKQTdH?=
 =?utf-8?B?c0cvak5SdjQxUTFwMEZFTlIrbXRqNExud05Zdm9VaDBtVmdpQlllRTNmMGt4?=
 =?utf-8?B?aXF2a21jVFcrMzAzeVI5YUMrQk5FbWFYNHlTR3pDOGg4eHRtTXB3cGdYYkxL?=
 =?utf-8?B?ZHdzeE5qTThqLzZJZ2EyejdCcW16WGNobEVoSkczZU82aDJza3ZoVDkvbk5B?=
 =?utf-8?B?ODk5ZGdjYTZaVlBTZ0w5ZTNBUlFBcFQ0UFlBYjk2eVErSHZNSnljNkw1OCtu?=
 =?utf-8?B?NXExNWU5Y0lJaE9PNm5MOW5YdUt5bHVsa0RtQ1Z0RWc3ZU4xMWlBL3hXM2xM?=
 =?utf-8?B?YWtXTVZKZkF1aVdTYTZaSU5rWjJoakxnbXVXZS9qaDI3MWRkTUx2Wkt3ZG9Y?=
 =?utf-8?B?ajZkYU1pb3RubEVSKy95MCtKelNsUGswQjFBaEp6WmpwYWxDZDE0NENCeVRp?=
 =?utf-8?B?aFQySDl5WFg0YTRYV2ozMFVEM0xYVHRTTmxsU21DaVhkK25vbmxzampVb1Ro?=
 =?utf-8?B?emM5NTVBekt1dXpiTEtVR3pLcDc3WHMxTUpmL0VRTFpDOVJpT3VNeit0ckJo?=
 =?utf-8?B?cWZXRjNVOHZuUDJzWkhFSWYzRm04ZzJJc1Y1UkpEV0xCd2ZDL3AxOXUrZTJQ?=
 =?utf-8?B?Sy9hdzRUQW5pY3NLbFBnVGVTbzBlbTJmekdTaSsrZGt3Mm5aei9zVk9rUWEv?=
 =?utf-8?B?NFl5SXBqZkcyYkdxc2JFNlBlMVBtazBNM3Q3UlBzc0JURWRpNU9jZ1JIQUt2?=
 =?utf-8?B?c1VPRHBhbys0TndqQzZmWFJWNlJMbHZyLzZEWGFDNEkxWnJpN3M1VnhkSnZ6?=
 =?utf-8?B?QWlYYWRVd2loc1ZVdHgxZFJ3eDFNckZRUHBzd2c3anRoM3lQcnl4NFRXZ2gy?=
 =?utf-8?B?SjhiOXdmZ0NyR2xxWXVUbDc4azVwandPRFBtQUQ2SWhkSUpaWXJ1QWYxcXZu?=
 =?utf-8?B?SnczaWtNdDlBTkJXYkcvZXlCcFZXbXdHUk5lNnVxckV4K2J5K1FVdUxZREt0?=
 =?utf-8?B?cEFPOE12bnF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjFrVVhoUzVCSzd6MGdLV0pIZ3Q5KzNOWVZKMHpqN1JoVml1bUFyVFVzdStC?=
 =?utf-8?B?SmgzUFNSNms0U0hWemtxWjlGOUFyM3pRaFZnUWRZUlcvNWlxSnBsWnEyTXk1?=
 =?utf-8?B?ZWpJdksxUkpVYzNkTldXRUxqQ0V4eS9WQzBYZWo1SWtyOVBhelpYcGRTdnB2?=
 =?utf-8?B?MlhOYk51T0htQVAvVFhnMHUwRDF2MWJRV3E4VkhNTDBvV2NxUWlCUzZ1WmU5?=
 =?utf-8?B?Vmp0b3MzKzRtNnNqQzUzdW5qUFNXUDdJek4zcitUTS9oMUdzMWNxREVvOTRt?=
 =?utf-8?B?WU81MGlVdSsydHRlSktnQjRYdUIxays4STM2N01QY1ljdFU2bEVwYzdJN0l1?=
 =?utf-8?B?L1RDMEx6UWFackdiMlAvWGVSeStEYW1sdFpWZUlXLzNXUEQ0K2c1Z1poTkZK?=
 =?utf-8?B?ZnV3WForTEtZOGgvdmpBM0tzdU5hZzBQSFppVzlXNXNZSE9zLzlRNCs3WFg2?=
 =?utf-8?B?aVFWOFZPbjhHMTNGSkR6NStsdXpUZmc5QXRpempiRnR0MlhhUU1wOEI0Y1Yr?=
 =?utf-8?B?eGlQc3FhdHdMckswSDU0bHhZNlhScnlDYTRWRWZaS3lmZlJwRnBQSitwWnBR?=
 =?utf-8?B?eFNhelkxdyt2Ukp5UE4zR2NPZVl0Ylltb0puYlRLenhjeHBTdkRsQm4rYVdo?=
 =?utf-8?B?Mll3OUY4WHpUN2VJdG9WNmd4ZWxjZVBBdnpQMUZnUXNYV0QvZ3VVU2dmbDhG?=
 =?utf-8?B?VmZHc3NkQnpVcU5IWGRJK3Y4K1dkT2xBQjFpTG4rVWR3UHcxTFZmdDY1SnN5?=
 =?utf-8?B?QUVJUngyYWNKYkdCcEhHVWxPME5JblZqYzRSNGsydnA1M0ZqYnN1UWl6SXJi?=
 =?utf-8?B?MTdJeEVQaXZEVXY3Umd3N1E0RDNEUlVuYzVLTTVaZDE3cS9PcW44NzVPVmx4?=
 =?utf-8?B?NGdZZlQ5bDF1bklGbWxnSHRpNkRnZlVObGc4L0NhZzBZSFc1MEVkWFk4NnRs?=
 =?utf-8?B?bzZoRWIzcUV1cjhSTnFCWWFsZTg0c1JoU0F2QkFPdXZHa0xZZlRJUlZOQkRY?=
 =?utf-8?B?VHNLeWN6eDU1ejJGZ2gwaGFJVGpHaTFQQkRoVGZKTys0U0dYQzhBdmlZbk1v?=
 =?utf-8?B?dFNwbFdjLzFYNGtKNHFMakpKMXNhN0pZdi92QnF6RWp1SU9HQ1lrZ2N5a1Qz?=
 =?utf-8?B?SEgwcENNeVpZVlhZU2t4VitqSU1iVkJ2NDF3NWhXM21SdUVhVnVCaDVJRjcz?=
 =?utf-8?B?ZEFZbFV6Y2tZa3pwZmZGdlRuVEtIQ3BYSTRFUWJ4UGo3WktPMnNpMXNUQ1JZ?=
 =?utf-8?B?c0FtWXZ2OHp4TTVjZFB1WW11R2M5WHU5WENUQnMwYndwLy9wN0NiV2hFQkc2?=
 =?utf-8?B?eld5VTZhUWpDZUh4T1Z3SlR4QmllcURFaUhlWk8yRVJQdWNFdy9nRE0ybEVv?=
 =?utf-8?B?VFFzTURBYjkyZ04reTlFbzNGQWU0WjBlenVrMWdFeDUvQXdCTjBZcGtSWXBa?=
 =?utf-8?B?bXFHOGdJZGh4RFNRTjVXRGFsUnJpN1EwWW4xR2pkTGJPcURMSytRcUpzemNQ?=
 =?utf-8?B?MldIdTVpR3FCYWNGcVdRd0hHVUxxakt2elpNaTNpN3phMzBkeVo5ckRSZUJX?=
 =?utf-8?B?RUx2cCt3N2svNzh0ODAvYlRhSkVVS1FoM0tiQnBId1Byc0xWLy8rYlVpV2Fm?=
 =?utf-8?B?ZlZGYThydkUvNnRmL1BJeVVrY015dmYrYUplV1NwQUp2NGdydENzTFB1L2RD?=
 =?utf-8?B?QTdvSkpKTWI5Nkh6blNYU252cHBrUjh4ZDN6M0Uvc0xQTEQ3a2ZhaEpxVnpv?=
 =?utf-8?B?S255dmVueUNNNjhnVzRaa3FTS0hCMjRDZnpTUjBTZkVLVGNaNTFic05HcjU2?=
 =?utf-8?B?TUIrVmpIKzdSSHlYcmRyc1pkNnBxdzIyRzJRWkRHM3pUS0pubzRKTnR2dXl6?=
 =?utf-8?B?ell3R2RITlJYMWNzV0ZIYjFia0xGQmx1WFNRU3AyWUdpb3B6bzZYeXJHaUZQ?=
 =?utf-8?B?Z3VBSHFVUkNjTXJJdjR6aGJIN21JOTcwdlpEQnpHa0JHSXNhMjZjRzBOc21I?=
 =?utf-8?B?UnRJMW9QZ1JPS0ZNSk1LNnBpa21reENoK0VZdVhESEd3T05TTHZMTkhSSHZB?=
 =?utf-8?B?Y1hFWW9ZZEIwcWtveEVnK0NZNEllZk84ZDh5TzFmSmdCRE9yNnc3bG9mRnRr?=
 =?utf-8?Q?DbFyW2bLZk3iRZ4YTQ2DX/DNW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b11d79-bca1-4076-e014-08ddd55475ac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 01:48:08.5957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Ucqw5Ms58UBkhfU1ghpKPZDKNBCnV/HUE7PdKhzhTduzcdq9B2ZfZVw+e+yCk7eaev9rMIpQq2J6pgQjXaCOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7683
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_184818_242902_A6A831D5 
X-CRM114-Status: GOOD (  11.03  )
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

To ensure successful builds when CONFIG_IMX_SCMI_MISC_DRV is not enabled,
this patch adds static inline stub implementations for the following
functions:

  - scmi_imx_misc_ctrl_get()
  - scmi_imx_misc_ctrl_set()

These stubs return -EOPNOTSUPP to indicate that the functionality is not
supported in the current configuration. This avoids potential build or
link errors in code that conditionally calls these functions based on
feature availability.

Fixes: 540c830212ed ("firmware: imx: remove duplicate scmi_imx_misc_ctrl_get()")
Fixes: 0b4f8a68b292 ("firmware: imx: Add i.MX95 MISC driver")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/linux/firmware/imx/sm.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
index d4212bc42b2c17fb8f94d58856a75beb5611ce4b..99c15bbb46aa8329b5aa8e03017e152074cdf492 100644
--- a/include/linux/firmware/imx/sm.h
+++ b/include/linux/firmware/imx/sm.h
@@ -26,8 +26,20 @@
 #define SCMI_IMX94_CTRL_SAI3_MCLK	5U	/*!< WAKE SAI3 MCLK */
 #define SCMI_IMX94_CTRL_SAI4_MCLK	6U	/*!< WAKE SAI4 MCLK */
 
+#if IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV)
 int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
 int scmi_imx_misc_ctrl_set(u32 id, u32 val);
+#else
+static inline int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int scmi_imx_misc_ctrl_set(u32 id, u32 val)
+{
+	return -EOPNOTSUPP;
+}
+#endif
 
 int scmi_imx_cpu_start(u32 cpuid, bool start);
 int scmi_imx_cpu_started(u32 cpuid, bool *started);

-- 
2.37.1


