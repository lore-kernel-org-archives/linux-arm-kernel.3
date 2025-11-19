Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2E2CF256A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 02:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPyKUQ6UwAxeXmFHE90N/mHH3xHxp9lXO94nmn8YwQg=; b=FtiWNPSp21erX2GOlStU7jv5+H
	qXs3YgURkyTxQ197Z/m6h+e1oECAoFduefBtl65u8RoSjP0esJHzhDlgWK6gPHR8RV5MVs5EuxK3J
	2zE3w5LBsvyIUOCPa2BnLppgCBShwSnVY8DBQZI2hKirK/GDB+BOVfzNyjv6CghGekmEwt8iHce1o
	zTaan8m+/tVCjdEeFfkTdDFZ7xAN0NIOqUf74+xp4QZDeXIegXmt5galGuQzTIV/tDAUBe9e5nvvJ
	CiwgWmDbVpnXDRUglktk/ONIZJ7+QPDs5PP5CInOmdWy+bhohs+Z2lkqZvbASYgD8owcOXaNzYVEv
	dRC2JcNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYOg-00000001Qqm-1snt;
	Wed, 19 Nov 2025 02:58:18 +0000
Received: from mail-koreacentralazon11023081.outbound.protection.outlook.com ([40.107.44.81] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYOe-00000001QpL-0ZKj;
	Wed, 19 Nov 2025 02:58:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ez8vLCUEbMHBBCZUBD2Mllnhu0MaKenNRUx8fapeQoIt8yxFXxxE5muiJJo8lTgv2pR5dd6vnzZIfhEPt1Qft/mVVQjanyqFQpqBwJygR/b60eU9izYit+P3pZpfOxJkZPPTLO6iUyg8W4DWQzJ2aSKSGcM1GrHt8KUj8Bz958ub3aOXt3kEVOH+EGbxaS6FgbVOMtvMVyTgDK0ckiD0MHJE2PiW2iAG3Y1IoyfJCV1Fhxp1DS3XptsRN0K7HB5jgjK40F+jNprebYyQ9HBuWNMBEaiDqH9RQxstUyUPn3GgPvOv1gwKg++b9w1ouMdPShHM6//KXl2HwiSXyePc3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPyKUQ6UwAxeXmFHE90N/mHH3xHxp9lXO94nmn8YwQg=;
 b=lBo+XDuuvA3fY+V95BhLi29QaBIXjjVJlvy7sKfSBqevtFTBIgVyYlfDiOGNxIBY/7ZsKQXHdA4BSWU2yWX7RYJkh/LEcl1mnNguYOn+B6HIAYejxMzq5ePRPHQo8BqqxXf+s8isjP7oYpZydr5qdHywW8N7ZLt1dlvEXL5uYd2aZV7KXFcnieZISbyzW8YUIdZezWvznLUW1RwfFaQAmDsjsrin55ZGo62FHK+bhkWBjNQwfz6v2b615acersbIVJJSaFrOVr+Fx3OGEAF5ZYuEg/ytzii9SO7by+Msoq6m2GiSqn6dt6f4cg9eumhMyatCeELIhbgiYQnTF4RoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPyKUQ6UwAxeXmFHE90N/mHH3xHxp9lXO94nmn8YwQg=;
 b=HXJ3ERNMRU6hlws9ffkRUJ5W9Ms48dkwOh5APyWCxp08WrDYwO0jLj6F5r8egwUzSOH5AFugN1fpeOP9Xl7KqhjnEX5qGfag5QCQXW8XQiriQ8Hs18tvscHXjR/LZvLrWddaGtv6VRUBzi7E4AG+ibNFTCow4/ElW+MiP23IdB35u31ZFrqJHjfPGBTi+l3fc7eDza8a/Eaqu/S1ElmAY2LDXAKKc631A5EThbj2rzMKwz3p+OfsjiQ5fnLE6j0j8eTM9FopSLza4aQffe5wWLpIVjDoAkpiHmPeXLN8AhfoWPqBHrwlaiz8OosSpaMNgVS5seZcGXJuJmTfeY4zhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by KL1PR03MB7311.apcprd03.prod.outlook.com (2603:1096:820:cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.23; Wed, 19 Nov
 2025 02:57:59 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 02:57:59 +0000
Message-ID: <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
Date: Wed, 19 Nov 2025 10:57:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, ao.xu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|KL1PR03MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 141fd3d6-d1be-45fd-a31a-08de27177249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGtlNG9YWTZvM3k0cGgybGxCU1dlMjMzSEtXckFOQUhIL3V2NVdEZVNyYXJH?=
 =?utf-8?B?cTAyL01tOHZJdmVLM21vU2VqSEhLN3BFbVBsaW82cXdZeWpZbGtqOXByQ3Ar?=
 =?utf-8?B?QWhCRTNGMXNBUWlPVHlYb2EzS0lOa2tZMDBQNDZEaHJYd3ZVSTRDeG9qVE1Z?=
 =?utf-8?B?RWxObHluTUw2UFhaRmV1aDZJMTFnUytKbDZzakUyWDRzazVxckozNVRsOWpT?=
 =?utf-8?B?STVOQ2p2cXg5RVMveUFwOHZUVEtRQVFteEpkZ1A2RmtSeFpudjRYbFczb2ps?=
 =?utf-8?B?R05uakE1bmZuQTc1eVUrRG9peU9tL2NZVUZ2RC9xYzBiSjVLYWYrUkhPL1dI?=
 =?utf-8?B?QXN5bFVYN3N5ZjZnRUNHeFdqMjRTbGdwcGJxNEhxQ09OUEpQS1U0bEVmZ0lC?=
 =?utf-8?B?aGR0V3A2R1VzV2c1M1I1Y2VmNWVMV016OGgvemtxMm5iamtudDBIaU8xN1FX?=
 =?utf-8?B?NHdmYnQ2Wk1iQ2FEeTN3TmFoWnExcWtIeHhRN09ZUGxreU8wNWtPM2owcEU2?=
 =?utf-8?B?Zm1nVDJYc1ppSXJsUnRZNjFIc0ZzUmpVTWFoZUo3SU0wb09kVFhqY2U2emxC?=
 =?utf-8?B?MDNITm9oQkZJdWl2eVdCT1dXM0dCN1B0TUdoNlFBTjBVQUpCWnM4L0h5MWNu?=
 =?utf-8?B?TStjak9CdUJVMTRIMUxIUm9yUmlhYnhUdklNTitOdUozMGFXd3pCZGwza3Z1?=
 =?utf-8?B?WEVzNmQ1OTNoK1RZdnRUaHVrMWZJcTRKMnJqalNxSUtCWHN5OUFlS0pOMFpz?=
 =?utf-8?B?eVJVTGNjaEs1MTdmVnB1TTdQNkNVQlFpVzRpb2lRSURRYlJSYWlQbEY5RUZy?=
 =?utf-8?B?WkNjM3BMbkNuamtQTzlsTm0rVmpTcURJdGxmVDVvNXhXekRjelpIdmQvcVJT?=
 =?utf-8?B?QXN0WG5xWnExTTRpejV2S1JwNHNyMGpvZmI5QmdiNUdmektXMWcxdkNKL1RO?=
 =?utf-8?B?YStHOWpabGQrREM1OERhVlN1UkVnS3l5SUVTcXBQcHBWMFZOemErL0tzUks1?=
 =?utf-8?B?cWxYSEN6L2lCb2dDekkyTTU2Rzg0TUhBSFpUNllhN2ZiS3NSeTArcWdsM3RL?=
 =?utf-8?B?Wk5tOVI0bGMrcEVaalhKZ2VPQTNWaXZtbU1ZWXFkenVHMUkxYVVNVWtHZGZq?=
 =?utf-8?B?eGZjaUxITk5hbEVDTUU2OXFoT1VxSVpPZ2RrUWJNRGdSSEdrZ2dhbUpvYVV0?=
 =?utf-8?B?RkhUWjRHUm9udWpkMVRKMUhqTEZob0RLYmhVL0VCT21RMFdaTUlGYmYxeW9Z?=
 =?utf-8?B?b2xxczgzRkhPWmNsUHl4WW5yRC9NTDZObUhoU0gwcDQrL2FPdnB2dW91UVV1?=
 =?utf-8?B?eHUvVXp4N2xEK0V2RWNZbWZYdXNpUW5CMklNU0lUeTNuV1J3L2xFRGRXOUZO?=
 =?utf-8?B?ZG5NTFVsS2FOeXYyR1hXbmNjZ1pLOUR1U2dVUmJsUmxJM1BEYXhDZE8xVC82?=
 =?utf-8?B?NDhla3pSVjZpbVd3U2hKQzYwek5pWWtiWEZUMit2NjJOK0ZKb05oWEJBeG1U?=
 =?utf-8?B?aFIwUCt6NmdkU0E1aUJDQ01TRGlvRjgzcTRCQ2VRcmFGM2hDQllud0hxTVo1?=
 =?utf-8?B?UFVoNWJCSkMvczNYbW1vRkdSNUhHQlZpNDJyMFViK2ltR3l3NXpJYk90N05p?=
 =?utf-8?B?Q2pqbFdPNzBDMDNyOXVLaXVla2ZPZk8yeVZUUFhZaXRuTWdtcDNDek8vV0E5?=
 =?utf-8?B?bENOc0poeEF6QmY4V3E3RE1kYjYzTmNmeXlvbHd0NW83bnNROWw2VWdzN3RY?=
 =?utf-8?B?UkNYZ3lhSThPbXhDNVc3Z1FrQmdQTUdYZkU2TTVBcTA1K015RlA4Wk5NNkVa?=
 =?utf-8?B?RkJzdFhSN3FCMmhKL2pvV1h2YWN3TjFVSTFrS1lRUjh3SkRvSkVCUCtkaE1M?=
 =?utf-8?B?U1I3ZURQWjk1OGJpdkNaMmpac3NqcmVjTHhiakMxb0FjdDlhL1JhY3ZET3lT?=
 =?utf-8?B?ZklNZEtUc2MwbWRuS1kyaTFzT3RTeTVORnE3aDlWdDRnb0FSanRSU2JhM1Mx?=
 =?utf-8?B?bDZVNTFnMEpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXYrcStaZlRmMWJrSFBadExFdUN3dHpNVXBZaEN4NFhIT1JIOWFSYVZhQmhM?=
 =?utf-8?B?SGE3V0Z0bEhLQ0ZKUlZSRThXR29wUkVCa1dycUdLMDY4cHhtN1dWWTNuSW8y?=
 =?utf-8?B?aXJLM1B6bkcvRVcxMmsvaHFwSU05R3o4OXZNbXdiS2JHMzdVWjRyTDVXb2VV?=
 =?utf-8?B?Y0VxTjhQRmh1b2V2d1cvNnFqR2txVGVwaU1nWVFDNWlvR09Db1dIZjh6ZURu?=
 =?utf-8?B?WWk4YnJ6bCsreS9XUDBsMzlDVCtDVUsrd29hVWpDWDdSam40dVNwUEJ4bjdR?=
 =?utf-8?B?QXNaMEpLNU55ZEVremJpYUZuM0hDcnJoZjNheGpYSHpsYzRaNzgrOGZLMlE3?=
 =?utf-8?B?WWhrYVUrVVV0ZEM3RlJUSWpZb2VvQ3BpVERKV1J3UCtJL21PeWZQRHNPS0o3?=
 =?utf-8?B?cGJzVWFodnpRaE9Fc1lPN25xeGVCeVdLMVMrOGtLblJnT1FCc1F3MzQ3UHFz?=
 =?utf-8?B?NWd4a2F6K0ZYS0NDYTBWeDFtWkhReWd0Z05nN1k1OE5DR1BIOHczVk40SEFG?=
 =?utf-8?B?OE5CZlhmRE1oV0hEaVBrUEt1WUVmMDd4TEFJRTF5dUF6cWlUb2RJc1YxRnA4?=
 =?utf-8?B?aDVPdmhQZFRPUk5JUy9YS3VML29yTWZLWG04aU8wejlPdGc4Z0hkY2RwclVt?=
 =?utf-8?B?bWxnSkNUZkZaNGFYTWhsNUhORFY0Zy9aVTB1NkpiQ2d0N2N6NFlIditOZ2V2?=
 =?utf-8?B?bGljZkJGRGRvZHR0eUNvdS91YlJ5VnVpLzY5VHZtVUtTVmZPWnk5aFdBbjVZ?=
 =?utf-8?B?WjIrRVpSYXRpWktoWnRRZnB5aXZiVm9NaUdWbTFJNjR1SVRRU1ZkK3MvcEFr?=
 =?utf-8?B?cnVkbWJ6NGJXR3NIb1lYWUIyR3NxZi94eWdLOFl0SmdwSXZnVnM4TGp0RnFW?=
 =?utf-8?B?SytSZE5TeUkrZi8rMW0wTkNVRUV3c2pCUTFscVc4TW1OMGdCcjhwMUc0VCtI?=
 =?utf-8?B?MHUvaE5NTXoxWi9VeHpMYTBpTXErL2hUYXgvaU9Cd0trcmEwT3ZxSDlMQStq?=
 =?utf-8?B?eW1IY3V2THNFVEc1ZmppRjc3ZXBDYldpT01ZRnVCN09KOGY4Unp2dDlNY2Rq?=
 =?utf-8?B?aDNZR2FPbjBqdmlpR052UWpjaUxSYjZpNVk1RDZpZ0V2SllVRFpuZncxcXB4?=
 =?utf-8?B?S2V1Nzg4ZGx1bTNkY0l2YWpqZ0hqUnA3MjlDNEJMNlRNVG5GT1pKVi8vWnMv?=
 =?utf-8?B?anBkM1FBMHE1RDBHVEFURGRHajFyMjNsVVhjQXJEdFY1alJGUWd5bk9MMzNh?=
 =?utf-8?B?YmJ0RW54YUJvME5sclNqOUUwVDF4bGdmN0V2Yi90cXJJbXcwTkZBeExFYWpL?=
 =?utf-8?B?SVpRMWtsSDR3UWpVL21Wc2N2akNEUFIrdWZWWHU4VTdQTEJ3OXF6bmRzRDlH?=
 =?utf-8?B?Ry9jcHc1NzI4M2V0VzFESlI1M3ZVaENUWFkzbGZxc00yUmhLYldNZXRXbk1u?=
 =?utf-8?B?aGNwd0wwakpRNFM3Vm9UZzc4QnpaZVUrY2hqRGowUGtMazlLU3NKV0FDUm9m?=
 =?utf-8?B?b0dzU3pBbHJXT3dlTURpeU5WcGhkeXc1eDFFaFJrNlVhTk16bkJxdDFOb3FU?=
 =?utf-8?B?Vzc1VWNaUUdYUVB2UEtWNnM3VFdtRkdtYjBaSVFaOVdzU201bFJhM2haZTdH?=
 =?utf-8?B?YXVuZTRERmZNNWgzL2ZvbUVKcWtJdzdWVEEveFhWRDZwcGpJSDAzbVpiM242?=
 =?utf-8?B?QmcwSzhEZjZQNUdzRVJqSWQ1ajByV0Z0YW5HOEdmbE82SFpUU2pFU1NHTnIr?=
 =?utf-8?B?MEppeW9OOExhL05iT0d3TWxKSmd3SDM3aysrbjJPQlJOLzNnTGNhUUhXc0dU?=
 =?utf-8?B?bVVzV00rUHkwRFN6YVV4WnNNajFhT2Q5cDgvRk52Nmx0TWVTOFRlVUJHMHlp?=
 =?utf-8?B?RWYvdlJsR0FlL00rVm1ITHVlOFFWaW5OZ05FNUozTGV0RHYzM0w4Mm1VUW4z?=
 =?utf-8?B?ak5mWXdNcGJDVXVrNExVUDNOa1FTZWpEZmxaa2ZsV0ZHOTNwdTY5aGZ1c05w?=
 =?utf-8?B?UnNYWlkzTzVCK0xLTWtURUMySytpY2NQOVFvZDE4S0RmdW1FZ3NWT3IzZ3NC?=
 =?utf-8?B?TEZQRS9PR2hsQW56RkI3eTBOYkdxNVBrSkc0SkduV2VjMFZCN0E1WS9odVMz?=
 =?utf-8?Q?rysODpJAv1Z4k9gvLZ/VqeVQ1?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141fd3d6-d1be-45fd-a31a-08de27177249
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 02:57:58.9788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvJdYc1rzInM2Maijk5UpjipaZmFN/ktzNXss3jbpTgoIJfuFnd5IoAOSTK8/PhsYrLmbPe3SI2X5zalWHm4gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7311
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_185816_174046_4042058A 
X-CRM114-Status: GOOD (  16.96  )
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

Hi Piotr,


On 11/18/2025 10:50 PM, Piotr Oniszczuk wrote:
> [You don't often get email from piotr.oniszczuk@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> [ EXTERNAL EMAIL ]
> 
> Ao,
> 
> Is there any chance to get this s4 drm hdmi series for current 6.18?
> 
> (i tried backport this series to 6.18 but have some issues with reparent vpu_0_sel to sysclk_b_sel)

Why do we need to reparent vpu_0_sel to sysclk_b_sel? is there any
background here?

The vpu_clk on S4 doesn't support sysclk_b_sel as one of its
selectable clock sources, so this reparent operation will definitely
fail. This has nothing to do with the kernel version.

> 
> 
> 
>> Wiadomość napisana przez Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org> w dniu 10 sty 2025, o godz. 06:39:
>>
>> From: Ao Xu <ao.xu@amlogic.com>
>>
>> Add devicetree document for S4 HDMI controller
>>
>> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
>> ---
>> Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>> index 84d68b8cfccc86fd87a6a0fd2b70af12e51eb8a4..6e0a8369eee915fab55af24d450a6c40e08def38 100644
>> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>> @@ -55,6 +55,7 @@ properties:
>>            - const: amlogic,meson-gx-dw-hdmi
>>        - enum:
>>            - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, S905D2)
>> +          - amlogic,meson-s4-dw-hdmi # S4 (S905Y4)
>>
>>    reg:
>>      maxItems: 1
>>
>> --
>> 2.43.0
>>
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


