Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B489DC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8I+24Z/2C7ms+i0r0yJYi6qsrMWIvTSR0HJVW4E9v78=; b=Ofr+grt03aYNBz3L4bbKjx6vwZ
	H+Fkd9NXkvmUt+HxHYGYV20DhOkz1ikGmPYZ825vNbkIdmtYd5LzOuXh28t4/AV9wSkGUQL6J3rNl
	CX3uw+xV7J0z8WqtMHmCjr5vy7GRhtyIfy6K0qIjvQFRpyImOz6OmY/gFBCyeynV8pW4SPTj/EWLF
	6r8Pe8BvUV09X+ObibrFbKoy9aBeSpEQE0byxuwqZR1U0QORxCJd41gUy0hFXpnRr7sYmvyCI3Rbo
	GGRo1lfGE9k86sduxqa2hDOUgNv5UcH/VrmuaRzqJGWlT4tl9eSzdNhEN8pdWJEyPt8kQczh8FXsz
	cB7b7OCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrGT-00000007Rx9-46Tb;
	Mon, 20 Jul 2026 16:54:49 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrGM-00000007RuO-2R8h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:54:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPCQImLvBSDymNgU9+j9GNlhQg4+IUHQf8wvEm6EJPIbesci5a2lN0K8HoyEllKtXx0E34qyBX4Z3eruxJqsIf0WXsW8MADSCykHGPzUl3Qo39tPe1ZYlPbVgVqcSCGOQ4sskWsH/PC/etyDOlViz7gra68+ROW1kZkpI/a1M3mHI9E2joOPsZOrPi/GJhjz8eiiRDgpCTNDNBrhkgXUg9YK9LRy+74BSHTnLSH+0bv/LwTctl+UbAyFhwwOx2vrMtjM0Ooms5AfWd2csafs6RjDBT+UyfVYp18dsUzj3SkjKWFMZs5EA5GheiTct6lKDgFKVcm+t0oLF2qaL33SHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8I+24Z/2C7ms+i0r0yJYi6qsrMWIvTSR0HJVW4E9v78=;
 b=hSgvYxnp7noF/DeRJF2qQTLZ3xvCfF86vlc18tjSs8gLT0oLxVN+2Hflao+djoHiJwZFUfrau3/mrprmAiYeoCJv9xAsr+7VXvkPU097ZnG+6rmOy1t3PRF0FCxd68J0UjXNAVnHMywG2pJnKrUI4X1R2zLpmANmsGkVdg84gQuo3ySK5XuYAC8bxtccgLDfCeOC7P9RAckAIz/H4BdkXMWxt8n1XG1fd4bEwaCTp0ULK82+gLdLjX/jtJQajE4avjZEjTf2tMuq1PVWXwp04TzlxlN2jMcgstBBblNDIA8mHG8BUhZu/GGB0py2o2XCkkrgqiOaAomZKDqO+Zm3RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8I+24Z/2C7ms+i0r0yJYi6qsrMWIvTSR0HJVW4E9v78=;
 b=IyAPHZaP5IlPazgADgVeHvfShsWXSck1WU8nh/I47geWEejxmkwtFo/1jxWo62K9kFgJEf/PCSLZWiESz8DcvFVZS1xUi7FM+8fhnKc0937FSDv46Ot1kWHMYgzavYECdfwe8NIZuJGFtdTYWUE/vSbtG0YfcNk3hvPYimUc6ac5ZzZsR27KjLtlsb9zixuVLhUGTC4JPPKnOzL0Gpu2BQb4R0VADTi45ScD2Gmh3NRYQrGeD2wPqZG8KhAJ3mo1GAfu/oHbMOTY1RREjw9srPNV3HjPDhvtIq+69TTR6TpBRxEPEOBCqyUEOXTG6KjWVd7OqaJq/j0AAtKBAbMg9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12) by DU2PR04MB8552.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:54:38 +0000
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953]) by VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 16:54:38 +0000
From: Frank.Li@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	hongxing.zhu@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v1] arm64: dts: imx943-evk: Remove 'supports-clkreq' from PCIe1
Date: Mon, 20 Jul 2026 12:53:59 -0400
Message-ID: <178456639596.3786312.9757154040573872144.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714040518.241871-1-hongxing.zhu@oss.nxp.com>
References: <20260714040518.241871-1-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0050.namprd13.prod.outlook.com
 (2603:10b6:806:22::25) To VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB11784:EE_|DU2PR04MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8c1a62-a51c-44a7-69ba-08dee67f9567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|7416014|376014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: zwPqbaQi4r1tsqR2ulbv/NQH7NqUa/j1p45L5b+63GosDkfJBJKpdGJBO1jMwEZ80vz6Ldf+YqoBxfgU1+LZhHgltMGSO4X7e4WfF+8JypaKNP/FRTj06MxpGsOcvKiEC1kvR3c3HWwiBwWhcTufBgdnrqj4CLnvsKPZhaIsMubUse+gdcD+ibbFlTOMA3R8ytSuKD86kDil/j3rEZcAC2nfKZN8qY+ZXF76kUXqJvAYuMM2COJmFWaw/emkmrAvMXlkeLUsK8yKk5+1JIl20lolehk+0jARvQZ7BxxSCfvxE+4zn6YDGlmFTrCcivIfc+ILw+VhvNMO1kvcq1dP79xNzRxDBT5T/Onzw3EVxna6egetnPW6zsjPLZIaQd8zKSSyjqrm3uL/Jo6W5QTrX1a2J1oL2jLA1cXd70zghfMDIbONOnsOodOSB7nSo1V6s1rsuPhXHwjECrbIF1e9k3GFuW70A2PwpR9FHUnf6NMHpiac1wkF3QewkMp1va73LxUGI5sefDdXXm/xfLqS0TZ7Z1cjxTpSHlvDIEFXHossVdufPHxUR4I+4S01rCLeMzd53BwncgkvnNwTJiYAJY94TlUTcRnJjWtIuuLAlkED1Gqu8o5iIgyai5jwLe9IXqhdDRypgsU6rVSBfIiVgf4uKbcGlcw9SdYcx4M0Aak=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(7416014)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHpZY3lLc1hHeDh6TmVha0RCeXNjaXdGL1NDOHVja0xGbDlUbnBUcTlmRW9E?=
 =?utf-8?B?YmcrR0xzZDhqRUJ5Q09ocXpjRjVFc1NLQWVONTBIWFlGWklhUHAvdTBNeUpl?=
 =?utf-8?B?aU9qS00waCt4KzRYNHlyamZxeGJhRHo1NkJ1T05MMGMxd3BGUVhsTUZ5TDN4?=
 =?utf-8?B?ZndHQ3pOTU5xaHRFSCthRW1QUEpMbTNLd2E2NDV5Q0wybWo5YjVnVnNjK3JW?=
 =?utf-8?B?QUs0clBJeFBZY3hWTWx6K3VUV05WU1JrV3NVUXNIVUZ0N0dFeWl6U0Z3eHVM?=
 =?utf-8?B?RjJOeXdRcUs0VUlaMTYxOW1TMmdDclYxS2xZNHZ3Q0l6blliUUt2aENvSVEw?=
 =?utf-8?B?SkR0VzNzSjBVa2xMWEl3VUZtZlZsdkRKak5HNDVUUTJ0NThva0NaYXNHaWk3?=
 =?utf-8?B?d0t3MGVZc0hEdU9wSjNxV3kzcDAwajB2MFhQY2NRUU5xZ2ZKeG8xdXkwTVh4?=
 =?utf-8?B?NkdSS0lpNHdPNFVyemdDUVdDMnd4NnNobXdhd3BhSXhLdnlwTHB1NEFYc1F4?=
 =?utf-8?B?UUlRNU9iWUx0M2hCL1FFVWEzM3FBRlQyTXMxSmNvY1YxaUlneTZ3cjRmMzd2?=
 =?utf-8?B?L1h3cjVkWVdVUVk4VzZqVDYxdmRNQnFSc3BBeHhMcjV0a2NmdVkyUFZXRmVB?=
 =?utf-8?B?eWlkRUNmRXI2dURDazZEYlV0alZXb2ZTRUtseVZmM1MwWWVSeWVWejZsV2VZ?=
 =?utf-8?B?eUJzTi9RWm43cUhGZ01QeU9aK2NWTjk2UmdEOEFNZXJ4RHlycHhNRjlGSkVr?=
 =?utf-8?B?Zld0a3M3NW1oSnJTaDNGOWxUdkNUTVNuRGhzS3M4VUhPMFJjck44cTdoR201?=
 =?utf-8?B?cTJqRmh4V1BjbkVTY0Q0RDh1a0JLTGRMaVdWZk5vWjBnQ25zL1RaSzFCY3BM?=
 =?utf-8?B?bWNoMmw0REZRK25KM2FtenVjS29yNDF1TW0vUHIrU0JQbEtiZWxoTDQ3N29W?=
 =?utf-8?B?M1VQbE5HUkI2TTdPazV5QVFUU29VVUxTdHlGaFBOSUZrSXVnWXRYcGdoNWFX?=
 =?utf-8?B?R0phT1phclBPYmxuUVNQQkFOSHpwWHZnYnh2NXllbW5CVDUzbXR1WGZ0OXc2?=
 =?utf-8?B?bEUyMVQ4Z2IrU0JWcFN1eEVLWWJvTFVUK2dIZHF0K3JDRHRHYmV0dlRlNWdl?=
 =?utf-8?B?L2ZtTEZKYUZ4SzUvM051Tm1HNXZhYVlqOXIzOVhuNkJmekRKT2xOSnFYcUZz?=
 =?utf-8?B?WmN6eDVPejlnV2NBbTBVVzNMS1VUQmtCYUZYMlcxVTVtQzU3eFJVSFh5UG9k?=
 =?utf-8?B?Vnl2MkhneU5GbHlvU1FNRlhOQWxkSG56Z1YyL3A0YWppQXBMc2tCQWRjRWdW?=
 =?utf-8?B?Ri9MemRKZnRPRkxUOFRvRVo2QnBYczQ1UVIrNENZa2lXR2c4NythWkF3N3g0?=
 =?utf-8?B?TU5WUVZoODZFWVV0OGs2MzJkeElBUStUdFZNVXBZTHJmdS9wazQ5ZHcxdHdN?=
 =?utf-8?B?MGF3SUJLSmZ6T2J4TnF2WmlNM0IxMHNhWmp5UDVGdGdxSGR5RTRFWkdvZU42?=
 =?utf-8?B?cWlObGo4d2NLVWZUdmFZckVpak1oVnVrNmRMRXFLZW5weFBORXR1UGhsa1FZ?=
 =?utf-8?B?eUIraTduUFhNangrSVNpMnIzV0JxQmhoNStJbzRGUzc1cXNaa1pReVRtMWQ4?=
 =?utf-8?B?VHV2UjJvWnRXaGVTOTRLUEhJRnNyQXRiek9qWFkxZ3RmSW9ZTjlNS2krc2Rj?=
 =?utf-8?B?MENQa0VrUFBvWUxPdFFJVXNjdG5id3MvZDNUZm0vREFNanJRZGc5azZ2bklB?=
 =?utf-8?B?R0I3bkdpYk5sTGl2ZnJ0aWd6R3BXZ2o3bUVldTVuVDMvZlVxWFppcWRwd2Jm?=
 =?utf-8?B?d2IxQXlqVXVuZnFJaUcvL1pNS3oxYk5kQzBhSVRvaTBaTkFZZ0IwWTR0NUNw?=
 =?utf-8?B?QXB2VExDakR2RG00QkdvV1BVMVMyQW8yM2RoSkNocUswTzVuUVRnUE5wTWJ6?=
 =?utf-8?B?VUdjb3N0V1dHV3RRa0hTREpyTHkyeFF2ZnEvU25EdlRHN3BxejYwNFhCT3VY?=
 =?utf-8?B?bGVYKzFtTm5LK0wxQlpCaHkwbjdieFEwUEgzdjA3TXIrQWxDZkFxVHo5dWVI?=
 =?utf-8?B?SVhkenVEQUR3NGlhSzd0MnB2L3UrVTNTZVdINytrVDFuU3VLdVg2MjM3MHBV?=
 =?utf-8?B?VjdId0FoRjR6dnJjWUFJV0pKTzZsaUovK3hLWGU1U2pDZjArNi9kcmE4SWR6?=
 =?utf-8?B?L2x3OUtSNFdUajJBakROTnRvcTJUbko4Vy9MQzBMbldWQXJNOEtPdU9IeWV4?=
 =?utf-8?B?ZGVZSHBuN1lENitIbWw1L3VlOFRWVXlyTXRXZi9BM2VPOVc1QUc0b3hKNm1l?=
 =?utf-8?B?T1BtQUxaVXh5OUNvalJLa2p2MlFOdzZ0SHg1R3Z3NTJuWHROVjYzVkxKMEly?=
 =?utf-8?Q?NAUjHmoTkmPXn/7c0/jRL9eH0jS+loCexghcu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8c1a62-a51c-44a7-69ba-08dee67f9567
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:54:37.9882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBePLmZR8oyzyj4pBmS740dGN/2D7aok5VIkzwndD5SNQwKF10hUxAGLVbWki4ybDOTNC7414kXYUBpbstL9Sw6JjzIiRSr1X1XNb8YMgZpjV5ZisPSnFK1L5LdK/Ppz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_095442_627014_BEDF0D28 
X-CRM114-Status: UNSURE (   6.08  )
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

From: Frank Li <Frank.Li@nxp.com>


On Tue, 14 Jul 2026 12:05:18 +0800, hongxing.zhu@oss.nxp.com wrote:
> Remove the 'supports-clkreq' property from PCIe1 as the standard PCIe
> slot on i.MX943 EVK may not have CLKREQ# signal wired, causing
> compatibility issues with some PCIe cards.

Applied, thanks!

[1/1] arm64: dts: imx943-evk: Remove 'supports-clkreq' from PCIe1
      commit: e0e1a9712fb1767dcf5ab69ae47dac2d1a080c3c

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

