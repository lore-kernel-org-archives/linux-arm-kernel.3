Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46D3C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 00:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtotfDLsSBzumBRFpWCEuAA0vZAhS8c3rkK3UyT78T8=; b=FHU4jEqMEhbEOI1sJFFZBNqDlP
	d4Qhx+N/tmRjsOBzy1BI2VQNVuZgeR/ucqpc88heNC+othrQ7Tn6YZ6lCn0DQYR+sduqoZYAHhfq8
	4u4gq5qQB8shemWTxSEQNC1pA0EVZy5RXWQUooE5+9ymnNjSsKSNyZEWqCUv6tjtuabcBo8PaF7zx
	PrSmh8g/EIuHp8nVsD7iPtcqgxRV18VubLtMWZzWH6UiTpAhW3uFJx9oAMO9sjqdLe+mDk64M4vR3
	2JxSR9gbLSDNxuIWHH8CHrMfex2M1wL6ved9Z/E3Zbc7to0MO2Zxry2ampLmOyyLErqh17LRZkqFf
	br6Zx3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhdd2-00000004jco-24qC;
	Fri, 01 Aug 2025 00:28:08 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcZd-00000004bm8-0kVF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 23:20:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3Ud81Rc1xLqtHjyhY8S137oopOiM/94nJvnnPoOcYqGI0rWIA53/0+Y6OCvZ/CXgV0qUs9zOLCZ3Dsvzfp6Bp5a7ERmEDnFqQh09Ee+s6FNFXhI1k8F2wWKdK12jMYxd3GrH7huAZb+ABGQfEMcVnZCYuVh6wYjQ1RohbPJv5bkTXQNi7MsudcgbNq14xIB1zFFZMHbmjuB3dJIaoHH+bxbxv7E78Zdq4IyMu0x0lsvT+Lo+21pnrRqWTE8DSSVymseAAd+wVlC1v3bg6G4iMxyHabrzaNJxNHhwLtkJRrjx+sd3Ic2nXPf/9jGNk4jlg7zDr55biSlFZQANefvVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtotfDLsSBzumBRFpWCEuAA0vZAhS8c3rkK3UyT78T8=;
 b=ZwF03nyCwqDY9HB5pIM/hAKd8Oz3GJWGhx4v8eKGcaBQdHkhyhGmYt3EVUWlg9xYV/4rlLSY1VF7w3cDQe81vFmfqgiOV9Cb5hT76DFQANJJA4CAbx/U8P8KRTapt7sxljKPJqbjZsWi4r3AllG9S/cUwmWKkECTUI/3y3icSuFeOQtdRx1UPilKNlbSdpWly77HOXb+sojQUE0xIL/JiXqto/cHyKGbGWd29jSHOXkh254xXSxmk6LZqeGyYC2PGslnI8B24ybQ3QcXLVfh7J1L0GXELJX6G0Gu+tPl5Eu4i/OKwxw3lwHO3bFru5/ObSFp5Z568Sy5sFXgYShLpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtotfDLsSBzumBRFpWCEuAA0vZAhS8c3rkK3UyT78T8=;
 b=iCGBcPdV79QlREO/L1mjc6fMRqXhIupAHJDIhsNVVB5Y4YI9HwydRD3FNk33vL8M+DRLO03nC/b27xOejA3ONhsqGZCPffyihkUNhc8WNXE8yIEfu5aYPmA9WfqYdn4Cqu6TDIM4diPz3mf4p/wSxEYxtKnoPGP5jUGEnG6rcULG2GxUFyjPdmdVhAFZi8cjPg/QBDAv4hYOyUBQMzQC34d2rtvgOa9bKrpyQsrppg3tjBurwpJDBkTTU5gfetxpeYuVjsMzXpLgV5qMBoqFbyenbecZRHQ1cKevf+ljEsDl05PeVWmNNPTxtgw3qjWeoiig1vQ9vxZ7FZ8OZ4Z60w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Thu, 31 Jul
 2025 23:20:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 23:20:24 +0000
Date: Thu, 31 Jul 2025 19:20:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: mbrugger@suse.com, chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, s32@nxp.com, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: Re: [PATCH 1/8] arm64: dts: s32g2: Add the STM description
Message-ID: <aIv6L30mf5bzUqup@lizhi-Precision-Tower-5810>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
 <20250730195022.449894-2-daniel.lezcano@linaro.org>
 <aIp+XTCSpNGee2qx@lizhi-Precision-Tower-5810>
 <5be6d858-01e1-4c2d-bd5c-0e3385251af7@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5be6d858-01e1-4c2d-bd5c-0e3385251af7@linaro.org>
X-ClientProxiedBy: SJ0PR03CA0214.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e74b517-b6c9-4af6-af1f-08ddd088d39d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|19092799006|1800799024|366016|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?em03ZysxakIxNnV6OEhUQm5uSWpPTDVLcENjRWhqaDFIV1NpSnluSTlBbG1p?=
 =?utf-8?B?b0cvbko3c0FBVGJFem03TlNXQlNSeDJpRmZkSGliV2hDanZTUlJHTDVDR3hD?=
 =?utf-8?B?SmdOQlpNczIzUS92UUE0bDlISkNYc0YyTDRWRzQ1bUNjSG5LeHJUeFdmeU1T?=
 =?utf-8?B?dGt2Snc5OXNmMWxJTk9EQkJZek1QWjFKdnhXNjJDRlRWbWh5azRFcUtZcDFQ?=
 =?utf-8?B?bnVyQzNxOE1xWUJncXlYcExlS0QxSjlPcC84eFpkRVNwRFN5d2Nqdks4aTd5?=
 =?utf-8?B?OXV2VjhoWktVT1MySENOWE1OT1R2aHBvUHhQYWFPbVFDcFlXQ0c4bS8wUUtz?=
 =?utf-8?B?NUZCZTFsTGxwUDR5Q3FkRTFuVE94NGRSU05VL0JmUzhYWVowcmdJREVUaXFH?=
 =?utf-8?B?S2Fzck5ZNjFNNnYzWnV4cU1PQmdEcUxGWG9aekhDSDBIS2dUVDgxSWZqMzVN?=
 =?utf-8?B?eVlUVStiMXJtVHdNL2dSOVRjeHhDT2cxcGVCaHllV1VmMG02a0hkYW9vZlJq?=
 =?utf-8?B?QWRYbjdTVms4ZkVsZm5qUE5uNTYxM21zRGZBVWdLWlJKNWdGTC9YTm9LMExM?=
 =?utf-8?B?SDEvTGhZd0s5cUlWK3RNVW84bW9wbVB5eEErZ1lQRGNrR1F1SWxJZkdUdkRQ?=
 =?utf-8?B?OUplUkdPVXJib21CVitpNWhFRVNJNGJNVCs3NWUxWXlVZGtxKzdjaFFhcjlE?=
 =?utf-8?B?YlBzVktOdHNEcytxZXFicFUvR3ExNlcyM3lyZ29IcSsxZGgrZ2RYVWQwRkNW?=
 =?utf-8?B?QXdVT2lEbEV3NExGNFhGQk9ZR0Z0OGdXTExaaWxWTUdiYXU2OFZuNi9ZNml3?=
 =?utf-8?B?a2dUeUNjWmFwVWY2MDljN0poZ2tvTitKSWlRZlV0R0EwYzh1blF5eEZ6OGE0?=
 =?utf-8?B?cUUzNVhWRmxkemxVVHA5OVBpWWY0cTJnODM4c1hTTnlDaU11M3cxWENHRHVF?=
 =?utf-8?B?OVpFc2QvcEs3MHZHRGpmazlwMHlwbEMvZ09LaEliWklOTERLcTVYNlAvdUxY?=
 =?utf-8?B?QTdKdFJvWEYwR2IvUHg3Mkl3RVdOS1UwQTEwS293LzIzZlBHckYyZGhkbXl6?=
 =?utf-8?B?UHpXTFJ5VE05ZUpwaWpSRmJJUHY3ZVo0ZytEaDlFWG1JQ1lhbktWRUx1WUNU?=
 =?utf-8?B?eW92R2JGOEN0MmRORGY4VVZMeHRCSmRoKzcwN0EzTTllT1ZQS1JwKzIxeERs?=
 =?utf-8?B?bmtxMTdoeXc0WEk3NCt6T0xtU0drZHg4RmFEaWQxNERobXNnUFJSVWRrR1lh?=
 =?utf-8?B?KzVacDFaUDl4M3Z6VnZkcnh6eVdva0xaRlJFNW9ad1pQc2Mwb1phamN2NzVl?=
 =?utf-8?B?QTFIWjBnR0t2TTZ1YitLekQ2L2swaEFBN1FOREU2OWV0cE0vc01haWRNVGE0?=
 =?utf-8?B?NDg1VEFEU1NlZkJLTmxMSUFPZTJQZUt5QTh6MC9HMkFyR0NRQ2NCOW1iQTB4?=
 =?utf-8?B?ZzBrazNrVFR1ZU15ZE5TV1pwaGRnRCtRL3RCSjBsSFBGUDZET0hqQmhBRmlC?=
 =?utf-8?B?QUlsa0o1c2lPUSsyb2lxSTRpdVBnT1VKbWNGMEdOS1UzejJMODBMMDc1RUtl?=
 =?utf-8?B?NE0vajV6Tlc1b0V1U0g0Z3h1TXFSNHdoR1EyWHdmZTVhWEJPdWdnY1J1cXRv?=
 =?utf-8?B?ekkyNTZFNmZvN2lMQ0tVS2JZVnVkT1orcWs4WUdVWnYyODJ6czhvTENUV3ZQ?=
 =?utf-8?B?MGttd09KTVBpT2hwNHJ0d3RPUm82M3JjT2U5QXBMSDIrd3FKNDkrdXF4V1J6?=
 =?utf-8?B?MDIvMmQzejREb3Z1NThtU3BUU0ZyblN0UWlSWFVSNUo5YVZTd3I3WTBJQmw1?=
 =?utf-8?B?UGlQY0dJSWxIZUpXdllScUFHM1Q1TW5jdC9aQkpESlU2aTljQ0Y2ZnZoLzNS?=
 =?utf-8?B?T2lEbWVxZ3Fvb0hsUThzSGQzWTErUS8zOTdFT0duaUxJV0g2NlEvbm0xTGxr?=
 =?utf-8?Q?TuLYdQDkXFo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(19092799006)(1800799024)(366016)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YndCRHV1eURuWnZoLzRZTGlsNGI3MnFzQzJRM2s4Yy94N01uMDJsaHBpTnBX?=
 =?utf-8?B?L05TbG50QVB0QXJXdUZlaW5JbDhnZGFoaW0vbmlPQlFLa3M0NzE1NHZSRGpE?=
 =?utf-8?B?VmVHbE9vMDRtYTl1djlQbGRrdVBXbm1IUmJ3dFpaTTJXRXdtLzY5NTUxc1Z0?=
 =?utf-8?B?WVdjeGl6NzRUM05KZ2YzR1ZmNzNHYU5EVGorSXo3VWlKa1dWZzJrTjJHaUhx?=
 =?utf-8?B?Q3E3SlRBRWR4cG5PNk9kQklyWTlPcVlWMmg3QnR0RWdGYWUydHFZU3NOK3ph?=
 =?utf-8?B?Y2ZWSnJybk1zNGs2QXNnQ3J6SHhQSGhzK21jRXBZdk9DRmpvR1hKcTVCTktX?=
 =?utf-8?B?NnNUb0Q0VmpHYWVWVHE4aGErS2VaOFpzdHBHbmppaTZzMHNZZEhLNnBuRWs5?=
 =?utf-8?B?NFRvZTV3YzhhUUJjbnNlWHoyaEI1RnhvUVhTSHl0OXFCUDU1Mm9DWnlzNXI2?=
 =?utf-8?B?QWVTMHY4SFZOSWZXNHVBOXRtYmQvV01nYmpFNDB6QStOa2ZVd3VpR3lhektG?=
 =?utf-8?B?MmhGWHA1b3IxaVNFRjhLTmtTTkpQc0ZIZ2dxL0prbEMwMVB6WmpVTmlJUzUr?=
 =?utf-8?B?QkhoSHpKajk5Q3JBclMvK1BlQndXQ1VvaFlHTUl1Z1dGUjI2WTBLMm9wTW9B?=
 =?utf-8?B?V3ZLQTBFUVlQQWxLMFNiNnBLWkNTcjdHbHZTU1FzdE1HRTY4NEx3OTlGb25k?=
 =?utf-8?B?M2NTY3BBK0hrNVpRbVJpSGxQdm5mNGJueWYxVVdEY0ZtbmkyNDVnTU9lZkRp?=
 =?utf-8?B?YXpFNm0vWlkzc2Z4L212MzJNcFZwVzcwWFBadnZSTnQrQW9sYXF1OHExYkdE?=
 =?utf-8?B?aGszMUV6YWpFSEhDdlpUNzYycGlqL1JJYlNhVnk4bWk4OUN2WklObjdpMzdw?=
 =?utf-8?B?Z3BWeEVjL2xUMFl0aFpTQ0Z6Rzc0V0hCY2dJbWU2T0xvclBRNlBWZUZBdmF5?=
 =?utf-8?B?ZnpGZHd4Y21CalVJWUZ2Uk9zRXVHZ2lrQnMrSVE0TmUybFNCaEVOcUxlNGRv?=
 =?utf-8?B?dndYdG1JUUpSNXNyUTh6Q3BFVWxFU2RWNlVCMDRxMHcxK2hiTjNFaHArdDhU?=
 =?utf-8?B?dUtpSTJEWmJEamc4azZkZE5qeGVrSDF1V1JxR1NQUjFLRlVRTjhZdFRFeWZB?=
 =?utf-8?B?aWdnQWI0cmRtSGliVG1reC9SOGc1ZmZ4V0FMKy9OVFA0bXVDNUtodmU1dkZI?=
 =?utf-8?B?QUhuYnBKL1pVVFJ1N1RaMnczTW02Ym9ZM21obzdFR0FmbDFFRkJrQW0zMlNo?=
 =?utf-8?B?QVVEVm5WZUd3RlA2OXM2UzhlREg5SWtpTURzSmZ3WDFRQTRpcXRhWkNCYytp?=
 =?utf-8?B?VDlLSXVReWViOXJLdElldTZTOVlaTFNXa3dVR245TGJLNFRwTVZqa2JCQ2xC?=
 =?utf-8?B?RDZiWUJCTjlhSDcwMG5jb0JhSWU1Nkg1OGtuOThBVlZ6Y0thVVU1RGNBeW1Y?=
 =?utf-8?B?TXZVYmVSOExRQy9MdHZKb01PV2ZGMm5QOHVJVnFCOUkvZ1NVYW9XSlVYbVRu?=
 =?utf-8?B?TE9zUnRlblBha2xsNTVzVXlYc3VwT2cwL3diK1dhbjhLaE8vYmhxUkRZL1J6?=
 =?utf-8?B?bFU3T0xhbWx6aVdiZ3dzVVRJUFV1dVVPU1BrUEpyUjF1emdZcVNkTElDV0pR?=
 =?utf-8?B?Q1FuMG1sY05tYStod0NleU5DWTB0MFZTWDFBby9PV25zVkpOZG4vUTUyYzI0?=
 =?utf-8?B?OTAwcUhGVXRFZ2xFbUhESTZxb1VGMzVjUDg4NnhYblFhSGZxeWFVSitYRWRQ?=
 =?utf-8?B?eG0yZTVJdWs0cnhPdjFHckp0ZmJ1TUwzV28xcFZlZGtUbTlaTTErSktSSjl6?=
 =?utf-8?B?SlJCcWhZTlREaEZWSGt2Z2lYOEl5OGxCOXRrbVR1d1R5MUhrT0QzQ2NTMVZm?=
 =?utf-8?B?SjEwS3prZ2RpaHlEbkF1Y2h1VUJwckZKNm03UmxGdUVWdS9rNE5mRnNOTmRl?=
 =?utf-8?B?MThnc0RwSldHUGd4blhGelp3MjNFd0JTbGIrME4wL3RaVDRyVFoySmdmSkZJ?=
 =?utf-8?B?WUU1MjhOTUV4ZFlscHBMZDlSRWdncHRoSTZ3Y1pxUmdmVk8wK0NJUiszblBY?=
 =?utf-8?B?M0JsVUtqUEZHMU9oUDhKK2pZM3NDSEtaK0RWbEU1Tm1XbTdVSkxWZGVrLzgy?=
 =?utf-8?Q?0zeQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e74b517-b6c9-4af6-af1f-08ddd088d39d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 23:20:24.2746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkfiO2KjSVZrL7UStruOUvyfsJSADk6iV6WixlMbqEwtZpiO5EPOzcTekJYn4JxBrWThSyqO5UqAPqOptNPokw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_162033_399444_08C008C0 
X-CRM114-Status: GOOD (  30.04  )
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

On Wed, Jul 30, 2025 at 11:15:40PM +0200, Daniel Lezcano wrote:
>
> Hi Frank,
>
> thanks for the reviews,
>
> On 30/07/2025 22:19, Frank Li wrote:
> > On Wed, Jul 30, 2025 at 09:50:14PM +0200, Daniel Lezcano wrote:
> >
> > I think replace all 'description' with 'node' is easy to read.
>
> Sure
>
> > > The s32g2 has a STM module containing 8 timers. Each timer has a
> > > dedicated interrupt and share the same clock.
> > >
> > > Add the timers STM0->STM6 description for the s32g2 SoC. The STM7 is
> > > not added because it is slightly different and needs an extra property
> > > which will be added later when supported by the driver.
> > >
> > > Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > Cc: Thomas Fossati <thomas.fossati@linaro.org>
> > > ---
> > >   arch/arm64/boot/dts/freescale/s32g2.dtsi | 63 ++++++++++++++++++++++++
> > >   1 file changed, 63 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> > > index ea1456d361a3..3e775d030e37 100644
> > > --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> > > @@ -503,5 +503,68 @@ gic: interrupt-controller@50800000 {
> > >   			interrupt-controller;
> > >   			#interrupt-cells = <3>;
> > >   		};
> > > +
> > > +		stm0: timer@4011c000 {
> >
> > keep order according to address.
> >
> > 4011c000 should less than 50800000.
>
> Ah, sure. I'll fix that.
>
> > > +			compatible = "nxp,s32g2-stm";
> > > +			reg = <0x4011c000 0x3000>;
> > > +			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
> > > +			clock-names = "counter", "module", "register";
> > > +			status = "disabled";
> >
> > why not default enable.
>
> The S32G2 and S32G3 can have different variants with 2, 4, 8 Cortex-A53 and
> 3 or 4 Cortex-M7. We enable the same number of CPUs present on the system.
>
> AFAIU:
> 	S32G233A : 2 x Cortex-A53
> 	S32G274A : 4 x Cortex-A53
>
> 	S32G399A : 8 x Cortex-A53
> 	S32G379A : 4 x Cortex-A53
>
> Otherwise we would have to do the opposite, that is disable the unused ones
> in the s32g274a-rdb2.dts, s32g399a-rdb3.dts and other dts which include the
> s32g2.dtsi and s32g3.dtsi.
>

That's fine by default disabled. but what's impact if it is enable but no
one use it?

Frank

>
> > > +		};
> > > +
> > > +		stm1: timer@40120000 {
> > > +			compatible = "nxp,s32g2-stm";
> > > +			reg = <0x40120000 0x3000>;
> > > +			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
> > > +			clock-names = "counter", "module", "register";
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		stm2: timer@40124000 {
> > > +			compatible = "nxp,s32g2-stm";
> > > +			reg = <0x40124000 0x3000>;
> > > +			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
> > > +			clock-names = "counter", "module", "register";
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		stm3: timer@40128000 {
> > > +			compatible = "nxp,s32g2-stm";
> > > +			reg = <0x40128000 0x3000>;
> > > +			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
> > > +			clock-names = "counter", "module", "register";
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		stm4: timer@4021c000 {
> > > +			compatible = "nxp,s32g2-stm";
> > > +			reg = <0x4021c000 0x3000>;
> > > +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
> > > +			clock-names = "counter", "module", "register";
> > > +			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		stm5: timer@40220000 {
> > > +			compatible = "nxp,s32g2-stm";
> > > +			reg = <0x40220000 0x3000>;
> > > +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
> > > +			clock-names = "counter", "module", "register";
> > > +			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		stm6: timer@40224000 {
> > > +			compatible = "nxp,s32g2-stm";
> > > +			reg = <0x40224000 0x3000>;
> > > +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
> > > +			clock-names = "counter", "module", "register";
> > > +			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> > > +			status = "disabled";
> > > +		};
> > >   	};
> > >   };
> > > --
> > > 2.43.0
> > >
>
>
> --
> <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

