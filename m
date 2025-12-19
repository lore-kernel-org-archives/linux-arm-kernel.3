Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DA3D78770
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 19:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDhDASX85hWswVnx0Ba7pO57rvqAW7V6bBdduGhz5lE=; b=qBY/6WZ+kcSAzKyyOajcqEWXpH
	uN1AnPfyZV853qYdx+hrNQygNkjtsQyNSJjx98XHZ/rEHIkrfII2hQ58s+D9kbHzmF7UvJ0PYKjXR
	sCE7p15IFP+uMz04Yez57j0qHSrA5+HHN/8S1EBfoIv+6hHz5qderoProX+X7AXtjicbm2MKRjwOg
	xkpttHNAEtVGZz6zAL7uqxwfYLicW+6i8ovQDqSHChEwNSD5/fJ71wAIsaD3ycD3nIezLQu0leRyx
	/Cdun25HXMOL+vt24ySzep4Xu4LlI4jlnIK9P7SW0k6c3cWsru98CzNR4zEOS9fgbaDhgsf6mbCU6
	74U8lD5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfmt-0000000ArtS-2dJG;
	Fri, 19 Dec 2025 19:05:15 +0000
Received: from mail-norwayeastazon11013038.outbound.protection.outlook.com ([40.107.159.38] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfmp-0000000ArsH-0ysi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 19:05:13 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lbehYas0D9XzjWj6tjNtyj1Ae97PXO6lfutcN2wsl6n9evXn+b/+cAaZLfDQiPGXi2/uV1Wu4esWcj+NxGBnt8P8IHJx7bixef3od8pFxVvrsSswbSHr/jWFIky8sdZ1nLStubsAGJd3ntybeHW///NnkB4psBUsHzWGlzLlRveqyp1cmKs+7VJKp8voHfMkL7Hb+gi6HanC7YiApic7rQPmpUcnHV9JQVKiBWwdHORRSQl/UT8LUbPsWmaoRkN9nQbCL09zNDqJvgV+PM0W14nyWWY67S/AQXlCxYvEcPEaS0nccif60oyOMoIVNPiNETzhl0op7k++FIDa0ORQpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDhDASX85hWswVnx0Ba7pO57rvqAW7V6bBdduGhz5lE=;
 b=eS9KFCoNrchEGRkXCJ71m49NO7akfYGbIcw7plbCq6FYAQ9PlkWDCuJ1blMOaroiOllgWyBe0LQqSC4NrzK75T4R3qOD3rzrB55qmGXAXK5F1tiRW0pvHZWOuCMsgyWcnLtkWZr5sXyfIfv4HSf44pFGdWG+lc5QxTAHmVXxXmDSTTkAhsX5TGl/Vp5phKrnEmthiCijcA9VdsuKsduRsHpiQwdnRFKTmBfQI+lsbqjzQ17VYpoKarEWNM/wKBRHI9vfThjdP5t+Cq3KWORvYAkX0ak8aD9PNsEN4iO0ieMDgeKKqWTL131+Yb7JYRlrLI+GvN5WQ5wCkaEhhkVLJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=huawei.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDhDASX85hWswVnx0Ba7pO57rvqAW7V6bBdduGhz5lE=;
 b=JqRw6YBUwIbQJghJJ/oOzShBw5LMMJCvQPFOGEnv/WFjhCuHimjMcAgMPCwURlfbAS6xjtQp47YOOdZvbFHgNipxn8dJAzSRBW2+0ALdIy3Fcl32CjDuSOxpMw+CABkJXNnV97abMVgfPzW+Cgw6FEntDCKFzIjFWJpBH3qFGro=
Received: from DU7P251CA0030.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::15)
 by GV2PR08MB11468.eurprd08.prod.outlook.com (2603:10a6:150:2b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 19:04:59 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::7f) by DU7P251CA0030.outlook.office365.com
 (2603:10a6:10:551::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 19:04:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via
 Frontend Transport; Fri, 19 Dec 2025 19:04:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZM8SGdtEpituO0MBRZiDt9J7otpyRZlt0qFLyRo162IAjdaV59jpKy4K+j6Jrj6k9NHn7wkjMFYVEXzg7mctFhIa9IyWZ8aS+fIFTL6XjlCbt75DX9JMQn4g9kb0mudmVe4DddZ4ULxxjCRa1xyDq4/eKCHvt/D+xO3EsR3udwYc133yevIIwRVhHl2ZMXmKc7GwfMGKYa83gQObQfxk4ddfeoVwi8lb/VJYNyuzROd/Q3Z5tTlDfLDTTmxJrTzHG6Ayt7JtDPXiHnlMmgPzKqE9UAXHQBHFWXjbkkfOxKuDLyQBH+hLReZpZ+y8hBYQEsJtEb3VFEBcGdtzv2oJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDhDASX85hWswVnx0Ba7pO57rvqAW7V6bBdduGhz5lE=;
 b=qOgm2haiVwy0UStX36QH/9Jm21J6K3QZbulMWxu8VcJiW7iouhPCxPwTnscKlpt8d29QYuEEixwNzTgGeoplAPXwxirjQmvMRRzyY2VovfImzPFm5YVn7euCMrtGL6MyDdmDZe8LhBE51MJk/smI/yqmDspFJOS8yR5PdxcZZSMmPl1PQvWwfdrZsosKYX8FEq5KIjew/K8UTBuU2/3d83VjadrmWNVrolzGkaV0OjntLsVPuwxm1sy4UeThBPzWD1ZdFbcTGjO3CPIsJrsnweRIf8Yuzb2HFuL06T+9BMx702Zc5wYZ6+KKhhOhsZpyXzYrUPnHKYrezV5DHy/Vbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDhDASX85hWswVnx0Ba7pO57rvqAW7V6bBdduGhz5lE=;
 b=JqRw6YBUwIbQJghJJ/oOzShBw5LMMJCvQPFOGEnv/WFjhCuHimjMcAgMPCwURlfbAS6xjtQp47YOOdZvbFHgNipxn8dJAzSRBW2+0ALdIy3Fcl32CjDuSOxpMw+CABkJXNnV97abMVgfPzW+Cgw6FEntDCKFzIjFWJpBH3qFGro=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB8447.eurprd08.prod.outlook.com (2603:10a6:10:405::17)
 by AS8PR08MB8275.eurprd08.prod.outlook.com (2603:10a6:20b:56f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 19:03:54 +0000
Received: from DU0PR08MB8447.eurprd08.prod.outlook.com
 ([fe80::d07a:810c:413:4c91]) by DU0PR08MB8447.eurprd08.prod.outlook.com
 ([fe80::d07a:810c:413:4c91%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 19:03:54 +0000
Message-ID: <fa925447-9bab-4429-ba9f-d708f6db0bb6@arm.com>
Date: Fri, 19 Dec 2025 19:03:52 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm64: introduce NEON based copy to/from user
To: Jinjiang Tu <tujinjiang@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, kristina.martsenko@arm.com, broonie@kernel.org,
 jeremy.linton@arm.com, mark.rutland@arm.com, ardb@kernel.org,
 ebiggers@kernel.org, martin.petersen@oracle.com, sohil.mehta@intel.com,
 herbert@gondor.apana.org.au
Cc: linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
 sunnanyong@huawei.com, wuchangye@huawei.com, huangliming5@huawei.com
References: <20251129065846.1656987-1-tujinjiang@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20251129065846.1656987-1-tujinjiang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::25) To DU0PR08MB8447.eurprd08.prod.outlook.com
 (2603:10a6:10:405::17)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU0PR08MB8447:EE_|AS8PR08MB8275:EE_|DU2PEPF0001E9C4:EE_|GV2PR08MB11468:EE_
X-MS-Office365-Filtering-Correlation-Id: 450805d2-1dee-4fb1-b7f2-08de3f3180a7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Y0RJeU1xdTFJZStZOG4wT1hBV0Z3bFU0aHhTTFMyZ0Q0WFlBTUFFNURmdWt6?=
 =?utf-8?B?RUNQZEVwTWFBbS8vYk8rWExNZEw4dGxRTWVlNXd1SG1nUlVrdmNYSnhhdWY0?=
 =?utf-8?B?SnNWdWpMNTNHMjhIQW83MnhLVkVudW5NblEvc090YkVmN1VkcS9QQnY5UVdn?=
 =?utf-8?B?QnJiN1hiRXRoMmIrWlZybnYwcHRmSm9LdmNsU1pWcG1jWVVtNmE1R1VmN0lr?=
 =?utf-8?B?cHNCMWtYbmxETTBkMzdjKzRvaUlnZm80Lzh0dDExRzFKdlo0RllJdzk2K1hp?=
 =?utf-8?B?MklMYTF1RjlkM2I0V1RoQ05QSjhkOWttRW9rN1llSzl1bFJlenI2SnovbTBR?=
 =?utf-8?B?SHlaUnhETitwOWYySThpelkwLzFrM200OVovZjJuczdmYmxONHdRRERSYnpG?=
 =?utf-8?B?NVdLdVkxdVZJVzkwbi80bWt2a01KTGxpSFJramxMMTZOUUdqY3NyNVdrZ0Vy?=
 =?utf-8?B?OUcybXpOWVQ0VWZlYjhBOFVrbWV3WkxRc2VzQ2p2YUV1SDc5Mk16UFhxNUdW?=
 =?utf-8?B?Q0MvNHNSTStKMHpNTDFCRjZxRmEyd3pSdTN1UjZkWWJZVFVxbGpNNWpGZHdR?=
 =?utf-8?B?R3p1WnlvVi9wVm94NEdYcHJpOFpTQnE3cnlrTUFQb25CTm04VjNhOGhaWk1z?=
 =?utf-8?B?MDNCMkVkRHpHRFNVMU9QMHREQ2VTSzhYRGVrdk11NlFLM3JISFR4VkFHamNM?=
 =?utf-8?B?ajVYemJIaEVVQVdxVTBObnFEMTNLSi9hMWVxOFR5U29KeEN4TzNxYytzckhl?=
 =?utf-8?B?dE82aGdUSmtmcmJLS1pqbkJ5UTRQRTc1aS9kd3diSHZoRytPQkdTdUNkNGdL?=
 =?utf-8?B?VGVZU25ISFJzcUFXVk4yWnA5NXlGUitBOE9OUEl2NzhuaHllZElmbEF1bENT?=
 =?utf-8?B?UU01RVRJcC96TUdLK2p2M2JQREg4OHM5UVc5MXVHdEc1VzM0ekNhWmgrdk00?=
 =?utf-8?B?ZW9tdWFDVkdVOHZqeDlrbWU3TnlYQmNIZTFCOFNZVkpCS1h2UGJ4d0ZRQTRK?=
 =?utf-8?B?U3VGN1g0dERxYTg4dWMyMDkvMEFndG90VTZqTG1RemM3djl1a2o3QnBPMWRv?=
 =?utf-8?B?MWdYT3lEeUp4REhQZWtpcHZpY0RCcC8rMmhZZXpZY3I4b1lBeCsvSGw4d2NP?=
 =?utf-8?B?RnBnWXRWUlZ3MmtMVmdDMGhtQ3didGJrT0JxZTM0d3FwSmI4UVQvODFJcWxr?=
 =?utf-8?B?T2hHZldKclpsWWJxRHRUYmJqNDJxYi9TSWg3WEt6aUt4T3hMdUlJVjY3QTN3?=
 =?utf-8?B?Wnh5dWxKMjYrSWw0UmJIeEErRndxRU1PWURQcjlhSENRMVlTWHhZbkEvTXYr?=
 =?utf-8?B?WG5ocG4rWkNqWkdhQjlqY2RWenhveS9XZkp3ZE5GdXFpZ054a2tXRnAwYmJR?=
 =?utf-8?B?aXlmTjVQTStiY0dtU0U0N3ZDNDV2bFhpK2xkMGtPekY1alZyc25wY0l5WG1Z?=
 =?utf-8?B?MWxIUk9VWCtzbEtjQUtrb2dXamVSZlF5NVVOckdpUlNiakdvcFZUVk5QNkZi?=
 =?utf-8?B?T3d6VSt3MFB3QnpkbVlvbHA1QzZNVWJvazcvMWhKczArdVVrZWRrVjB6Vm4x?=
 =?utf-8?B?d0lsOHpyem1SZm1Lam4xY1ozMDdLQWZ3UnMwSUFxSDdJWUhpV1AxY1grenZ5?=
 =?utf-8?B?Znh3bnBpUE5vNnhDcE8rdjl1aVd1UUNRQ2RRUVBqNFBYK3RZZHE0N0k4T1cz?=
 =?utf-8?B?eklNV0xST2V4ZkNBcUF6aWFWdGhIN1ByRXJZWUFFWW9halJPR3ZJZTQzbzlM?=
 =?utf-8?B?NWFzd2VrdlBzdFRDTDJacUpTSWF5dDExcjRXamhOdHVGNkp6ZHVwQkFoakRD?=
 =?utf-8?B?V0h4SWV6NUovVllwQXBheHgzcXN4b3RPdVBaTkhxd1hxcEhvUllNWFpCUVRz?=
 =?utf-8?B?OGN6YzF0V1dZVjV5ZUlRclRPcXE3TFpOUHkrWTd0MHpXblg3M01JWnRqckd1?=
 =?utf-8?B?Z1d2OEExeExzcTNaeExpQ2MrS3JYNXo4YlVJa1U2VXZuK3EvL25VOXYxNXIy?=
 =?utf-8?Q?0KPVr+HhTJeu/0JCp+AM/8tPXFmM9k=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB8447.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8275
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 14c3c913-ee05-4d9f-471a-08de3f315ac5
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|36860700013|14060799003|1800799024|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U21GRk1Ka3ZkZmkvcjNqbXhRU1B6UE11U2w5ZGVPWE1TdkRqK2wzbTBKRjlY?=
 =?utf-8?B?UEhmMUk1MFlaUTN6ajg5VW9UcUVXYVoySUVqeE80UDMxRWNpMVAwbzQxZmN4?=
 =?utf-8?B?TzM3Q3phMGZoWTZhZFA2TVE2aSt1VGNSWThaZkF0Y21OS1ZGRzR5bHlXKzND?=
 =?utf-8?B?MkpzMUZuRWlaQ3RaRkJ1SlUzTG9vbzY4L0ozRTRuVnltZHVWR1h5RGNWcXBl?=
 =?utf-8?B?TGt3bC95N0d3OHdyeTU3TE1FM0JPS0dtSHU3NFplVFJhdllKOWc2SXdyZTV3?=
 =?utf-8?B?ZjJNY3N6SVAwTVd1T2ttY2djeVVFTnBHWlJKL3gwQWxZNlhMYkZxQ3hRR0M5?=
 =?utf-8?B?SkxSL1E2ZXU3OEVaUjM3ME0xY01wMVZmRk1TVzdZaEhZVWl1a3RiMnFVM2VM?=
 =?utf-8?B?NGk3WUM3RC9nVWZ3SFExUVN3aGFPZWxGYkk1aG9WRVdwOERLRDlxbjhwbEtN?=
 =?utf-8?B?d3N1K3daTmE5Q3FCYVBiVUw4UzNTWUVVSXFHbGd5NXA5cGpkN3hzU1VNL0FI?=
 =?utf-8?B?MjFQNEh6MUNtbmVqUFpKUXh3Zk1reVl5U2MyeU96VnpvZDFuN2FLVzhhS1Bx?=
 =?utf-8?B?Z2UrRk9hRFNUWnJNQmwxWnZZRjUxODFQSzNSQ2M1cUtRVVlEY2V3Y0hqWmU5?=
 =?utf-8?B?RENrbXg5K3o2dGd2enFZNDAvUnlZUUtkMk5GUC9BTHBqdWFYc0h6R2dlSVFk?=
 =?utf-8?B?WVR2bjhSdGdkNVlRcUlUKzNqU3J3bmZVUnQ5UFVKaG5FdHhwK0FZQkVxUDY2?=
 =?utf-8?B?WTFQVnhFeUxaZDNPeURTUjdUdlJ5S1BrWjkyalJnakpNK3dUSjFKY1BZVk5C?=
 =?utf-8?B?V0V6S2dmUCtGL3I3UWNmblBCTG9tdmJtTWR3RHNMa0VtNGZLZ2s4cTZMRGFp?=
 =?utf-8?B?b01DSjVuY0txQUNPM2dsNmhSWGZsN0RMZTJuUE14TUdCMUkzUVRJeGJSUmhK?=
 =?utf-8?B?eENVMHpVemdXWENFYzZ5aWxPSzJQVUR3SFcvM2J5TlB2L3VFZFZkeFBOblBL?=
 =?utf-8?B?c3hQR3FRYVZLYkJValc3Vk5KY0IzeGlvWlpPSklSVWJSVkY5SXEwd2tXYU1l?=
 =?utf-8?B?bzBQcFhPSUxtdjE5aEp5c0ZWc2VyRTIvdStOYnRmSVVDem5rcXBEbVFYRnd6?=
 =?utf-8?B?dUVlenVzb2JhVFM2OHZHUWQxekFLM1hWekdyNURNOG96T01XbHJqSk9jQXZx?=
 =?utf-8?B?cnBuVkJkejBibEd1WVJoVlUxVGZiQnE0bVhsMUVnT01zcTlUOHVPU2FjNnpH?=
 =?utf-8?B?ZHZyclRtaTJsQnRxa0l5aGo3bmNvckRoQlVJUGdvR2JibEp2anA3WFlLWERw?=
 =?utf-8?B?TW9NWDdXMWYrNEQ5Ymh6MjhVTWFyTGJkWHRzSjJXaUdFMDY4V0VTRmYzSVcv?=
 =?utf-8?B?RTlubmVrVCtsT1RIaEdodkx4eGVRMUdvU2ZnVHBsblBJbHdySG92QWVFVjE5?=
 =?utf-8?B?Tmhpc0lWMGVLRDlpOFNXTnNnYkZzN3BnQ1g2a3hhWUxEajJ4aVlheUxBRkZv?=
 =?utf-8?B?QllKWjg2eGtGVEpBYTNEaGREMUNZVkxXQkUwMWR3ekVlMHFMOE1RazJJNExG?=
 =?utf-8?B?Ukt4V3lMbjBzdUFFb3pFeXIvUzR1a1d3R2dHVVlkTmwySk95U05MNW1HY2dv?=
 =?utf-8?B?VktzWENiYVpUaWpMOGNZcmZhc1J2dldzL2I0OUJjS0tUV3RkRmtFMXNyVisx?=
 =?utf-8?B?eWJKUGFrMUh0QjlJY1pXOXE4RUR0ZWJhVTVNc3dqM1BzVysxZ1BVTmF6MVU5?=
 =?utf-8?B?b2FvRFRYTUFPVHZ3WHczeGVXdWhRdEY0UDZZZEgxa1p4dGZRRnVsWU9DQVE4?=
 =?utf-8?B?UG92RnIvNDg2UmdrVkJWS2IyZG9VbkZQb1BaZEs3c3lpQ1BXa2VhK2NJNEZ0?=
 =?utf-8?B?WFVqRjgxaGFKK0pKQXJ5cUM4NzNjK3owdFBNQVhxRmJ3c2ZvcEh6UUFBb2R6?=
 =?utf-8?B?Y0FZUjJBZXFwRDZlVFRPalFlVHVlTnB0RVU1L2Jrd1dkeXRHUmVGTHhFTUlz?=
 =?utf-8?B?SER5cWJoYlVLS0Y4ZHpZZWJYYWtNa3QyNmpnVEhhVmY3Q25pL3BQV0MxZkUv?=
 =?utf-8?B?eEU1UnI5b3RMaW9qMEtJazlRdFhhcFRzMGI2M1RNNEVmK1dSQmlnNlJia24y?=
 =?utf-8?Q?/jVw4C7Gn1gyN0xaWsP8Jt4Ma?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(14060799003)(1800799024)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 19:04:57.6523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450805d2-1dee-4fb1-b7f2-08de3f3180a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_110511_550200_13F57C05 
X-CRM114-Status: GOOD (  12.73  )
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

On 29/11/2025 6:58 am, Jinjiang Tu wrote:
> From: Alexander Kozhevnikov <alexander.kozhevnikov@huawei-partners.com>
> 
> This implementation use st1/ld1 4-vector instrutions which allow to copy
> 64 bytes at once, and can be used on any ARMv8 variant.
> 
> During NEON instructions accessing user address, we must disable PAN
> temporarily, mark FPSIMD in use, and save FPSIMD context.
> 1) We only save the used FPSIMD registers context instead of all registers.
> 2) Trapped in FPSIMD context does not support user address page fault.
>     fallback to retry copy left at this point.
> 3) We find that although we have disabled PAN temporarily, performance will
>     decrease if copy size is below 4KB under CONFIG_ARM64_PAN=y, so use NEON
>     copy when not less than 4K bytes.
> 4) Add a /proc/sys/kernel/neon_copy_user switch that users can turn on as
>     needed.
> 
> The following table shows the performance testing of the copy_to/from_user
> based on Kunpeng platform. In addition, copy_to_user 1024KB has
> deteriorated, and the cause is still being investigated.
> 
> --------------------------------------------------------------------------
>            |           copy_from_user      |           copy_to_user
>            |           nsecs/call          |           nsecs/call
> --------------------------------------------------------------------------
>     size   | baseline  neon_copy  increase | baseline  neon_copy  increase
> --------------------------------------------------------------------------
>      1 KB  |     161      162     -0.62%   |    156       155      0.64%
>     16 KB  |     613      326     46.82%   |    549       325     40.80%
>     32 KB  |    1057      491     53.55%   |    991       486     50.96%
>     64 KB  |    2017      976     51.61%   |   1854       959     48.27%
>    128 KB  |    3737     1885     49.56%   |   3520      1870     46.88%
>    256 KB  |    7667     3744     51.17%   |   7106      3714     47.73%
>    512 KB  |   16518     9972     39.63%   |  14102     10583     24.95%
>   1024 KB  |   49843    46409      6.89%   |  32264     37082    -14.93%
>   1536 KB  |   94641    80999     14.41%   |  56756     57202     -0.79%
>   2048 KB  |  134955   116348     13.79%   |  81314     76292      6.18%
>   3072 KB  |  215230   188738     12.31%   | 123061    116767      5.11%
>   4096 KB  |  302353   264942     12.37%   | 167716    158134      5.71%
>   5120 KB  |  444801   348909     21.56%   | 213730    206918      3.19%
>   6144 KB  |  561146   428615     23.62%   | 271235    255034      5.97%
>   7168 KB  |  624656   521106     16.58%   | 326677    307703      5.81%
>   8192 KB  |  766439   603728     21.23%   | 391038    365387      6.56%
> --------------------------------------------------------------------------

FWIW at first glance these numbers don't look all that different from my
tests of different scalar code - hwo much of this is actually from using
NEON, and how much is just from *not* using ldtr/sttr? For instance on
my Neoverse N1, from about 4KB up to 64KB (I've not tried hacking the
microbenchmark to go larger), it's clearly bottlenecked on issue
capacity before actual data throughput, so gets a ~40% win just from
going to 2 load/store ops per 16B (ldp/stp) from 3 (ldp/sttr/sttr or
vice versa), and in fact NEON only seems to suffer some extra overhead:

Large memcpy (bytes/ns):
    __arch_copy_to_user 1K: 25.88 2K: 26.77 4K: 27.28 8K: 27.48 16K: 27.52 32K: 27.43 64K: 27.34
       copy_to_user_new 1K: 27.15 2K: 27.09 4K: 27.62 8K: 27.54 16K: 27.67 32K: 27.52 64K: 27.17
       __memcpy_aarch64 1K: 37.79 2K: 39.80 4K: 40.59 8K: 41.08 16K: 41.29 32K: 41.17 64K: 40.19
  __memcpy_aarch64_simd 1K: 36.43 2K: 38.26 4K: 39.34 8K: 39.91 16K: 39.87 32K: 39.89 64K: 39.63


And once again, while a best-case ~50% improvement in a targeted
microbenchmark is nice, it's still not exactly jaw-dropping when the
baseline is known to not necessarily be all that great to begin with.
Plus it's still likely to translate to a real-world effect 3 or 4 orders
of magnitude smaller, so the big question remains: Is there any real
workload that's significantly bottlenecked on large multi-page copies in
and out of userspace, without being able to use even more effective
mechanisms like mmap(), that actually justfies reviving the need to
reason about the potential security implications of PAN-toggling? (Which
IIRC we were all rather happy to finally get rid of a while back...)

Thanks,
Robin.

> Signed-off-by: Alexander Kozhevnikov <alexander.kozhevnikov@huawei-partners.com>
> Signed-off-by: Lemmy Huang <huangliming5@huawei.com>
> ---
>   arch/arm64/Kconfig                   | 10 +++
>   arch/arm64/include/asm/asm-uaccess.h | 17 +++++
>   arch/arm64/include/asm/neon.h        |  7 ++
>   arch/arm64/include/asm/uaccess.h     | 65 +++++++++++++++++++
>   arch/arm64/kernel/fpsimd.c           | 91 ++++++++++++++++++++++++++
>   arch/arm64/lib/Makefile              |  2 +
>   arch/arm64/lib/copy_from_user.S      | 13 ++++
>   arch/arm64/lib/copy_from_user_neon.S | 96 ++++++++++++++++++++++++++++
>   arch/arm64/lib/copy_template.S       | 52 ++++++++++++++-
>   arch/arm64/lib/copy_to_user.S        | 13 ++++
>   arch/arm64/lib/copy_to_user_neon.S   | 96 ++++++++++++++++++++++++++++
>   11 files changed, 459 insertions(+), 3 deletions(-)
>   create mode 100644 arch/arm64/lib/copy_from_user_neon.S
>   create mode 100644 arch/arm64/lib/copy_to_user_neon.S
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 6663ffd23f..cf8f1d4d57 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -388,6 +388,16 @@ config SMP
>   config KERNEL_MODE_NEON
>   	def_bool y
>   
> +config NEON_COPY_USER
> +	bool "Use NEON instructions in copy_to/from_user"
> +	depends on KERNEL_MODE_NEON
> +	default n
> +	help
> +	  This option turns on using NEON instructions to speed up copy_to/from_user
> +	  routines. This implementation use st1/ld1 4-vector instrutions which allow
> +	  to copy 64 bytes at once, and is used only if size of data block to copy
> +	  is more than 4096 bytes.
> +
>   config FIX_EARLYCON_MEM
>   	def_bool y
>   
> diff --git a/arch/arm64/include/asm/asm-uaccess.h b/arch/arm64/include/asm/asm-uaccess.h
> index 9148f5a319..b2657d31cc 100644
> --- a/arch/arm64/include/asm/asm-uaccess.h
> +++ b/arch/arm64/include/asm/asm-uaccess.h
> @@ -94,4 +94,21 @@ alternative_else_nop_endif
>   
>   		_asm_extable_uaccess	8888b, \l;
>   	.endm
> +
> +#ifdef CONFIG_NEON_COPY_USER
> +	.macro user_ldneon l, reg1, reg2, reg3, reg4, ptr, post_inc
> +8888 :		ld1 {\reg1, \reg2, \reg3, \reg4}, [\ptr];
> +		add		\ptr, \ptr, \post_inc;
> +
> +		_asm_extable_uaccess	8888b, \l;
> +	.endm
> +
> +	.macro user_stneon l, reg1, reg2, reg3, reg4, ptr, post_inc
> +8888 :		st1 {\reg1, \reg2, \reg3, \reg4}, [\ptr];
> +		add		\ptr, \ptr, \post_inc;
> +
> +		_asm_extable_uaccess	8888b, \l;
> +	.endm
> +#endif
> +
>   #endif
> diff --git a/arch/arm64/include/asm/neon.h b/arch/arm64/include/asm/neon.h
> index d4b1d172a7..0c75baeba8 100644
> --- a/arch/arm64/include/asm/neon.h
> +++ b/arch/arm64/include/asm/neon.h
> @@ -16,4 +16,11 @@
>   void kernel_neon_begin(void);
>   void kernel_neon_end(void);
>   
> +#ifdef CONFIG_NEON_COPY_USER
> +bool kernel_neon_copy_enabled(void);
> +
> +void kernel_neon_copy_begin(void);
> +void kernel_neon_copy_end(void);
> +#endif
> +
>   #endif /* ! __ASM_NEON_H */
> diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> index 1aa4ecb734..c6e0f9adba 100644
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@ -25,6 +25,10 @@
>   #include <asm/ptrace.h>
>   #include <asm/memory.h>
>   #include <asm/extable.h>
> +#ifdef CONFIG_NEON_COPY_USER
> +#include <asm/neon.h>
> +#include <asm/simd.h>
> +#endif
>   
>   static inline int __access_ok(const void __user *ptr, unsigned long size);
>   
> @@ -391,6 +395,66 @@ do {									\
>   	} while (0);							\
>   } while(0)
>   
> +
> +#ifdef CONFIG_NEON_COPY_USER
> +extern unsigned long __must_check __arch_copy_from_user(
> +	void *to, const void __user *from, unsigned long n);
> +extern unsigned long __must_check __arch_copy_from_user_neon(
> +	void *to, const void __user *from, unsigned long n);
> +#define raw_copy_from_user(to, from, n)					\
> +({										\
> +	unsigned long __acfu_ret = n;		\
> +	if ((n) >= 4096 && kernel_neon_copy_enabled()) {	\
> +		if (may_use_simd()) {			\
> +			kernel_neon_copy_begin();		\
> +			uaccess_enable_privileged();	\
> +			__acfu_ret = __arch_copy_from_user_neon((to),	\
> +							__uaccess_mask_ptr(from), (n));	\
> +			uaccess_disable_privileged();	\
> +			kernel_neon_copy_end();			\
> +		}							\
> +	}								\
> +	/* fallback to retry copy left */	\
> +	if (__acfu_ret) {				\
> +		uaccess_ttbr0_enable();		\
> +		__acfu_ret = __arch_copy_from_user((u8 *)(to) + (n) - __acfu_ret,	\
> +			__uaccess_mask_ptr((u8 __user *)(from) + (n) - __acfu_ret),	\
> +			__acfu_ret);			\
> +		uaccess_ttbr0_disable();	\
> +	}								\
> +	__acfu_ret;						\
> +})
> +
> +extern unsigned long __must_check __arch_copy_to_user(
> +	void __user *to, const void *from, unsigned long n);
> +extern unsigned long __must_check __arch_copy_to_user_neon(
> +	void __user *to, const void *from, unsigned long n);
> +#define raw_copy_to_user(to, from, n)					\
> +({										\
> +	unsigned long __actu_ret = n;		\
> +	if ((n) >= 4096 && kernel_neon_copy_enabled()) {	\
> +		if (may_use_simd()) {			\
> +			kernel_neon_copy_begin();		\
> +			uaccess_enable_privileged();	\
> +			__actu_ret = __arch_copy_to_user_neon(__uaccess_mask_ptr(to),	\
> +							(from), (n));	\
> +			uaccess_disable_privileged();	\
> +			kernel_neon_copy_end();			\
> +		}							\
> +	}								\
> +	/* fallback to retry copy left */	\
> +	if (__actu_ret) {				\
> +		uaccess_ttbr0_enable();		\
> +		__actu_ret = __arch_copy_to_user(	\
> +			__uaccess_mask_ptr((u8 __user *)(to) + (n) - __actu_ret),	\
> +			(u8 *)(from)  + (n) - __actu_ret, __actu_ret);	\
> +		uaccess_ttbr0_disable();	\
> +	}								\
> +	__actu_ret;						\
> +})
> +
> +#else  /* CONFIG_NEON_COPY_USER */
> +
>   extern unsigned long __must_check __arch_copy_from_user(void *to, const void __user *from, unsigned long n);
>   #define raw_copy_from_user(to, from, n)					\
>   ({									\
> @@ -412,6 +476,7 @@ extern unsigned long __must_check __arch_copy_to_user(void __user *to, const voi
>   	uaccess_ttbr0_disable();					\
>   	__actu_ret;							\
>   })
> +#endif  /* CONFIG_NEON_COPY_USER */
>   
>   static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
>   {
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index e3f8f51748..ab71ffe5c7 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1905,6 +1905,97 @@ void kernel_neon_end(void)
>   }
>   EXPORT_SYMBOL_GPL(kernel_neon_end);
>   
> +#ifdef CONFIG_NEON_COPY_USER
> +DEFINE_STATIC_KEY_FALSE(kernel_neon_copy_user_used);
> +bool kernel_neon_copy_enabled(void)
> +{
> +	return static_key_enabled(&kernel_neon_copy_user_used);
> +}
> +EXPORT_SYMBOL_GPL(kernel_neon_copy_enabled);
> +
> +/*
> + * kernel_neon_copy_begin(): only set FPSIMD context busy
> + *
> + * The caller must save the used FPSIMD registers to stack and restore registers
> + */
> +void kernel_neon_copy_begin(void)
> +{
> +	get_cpu_fpsimd_context();
> +}
> +EXPORT_SYMBOL_GPL(kernel_neon_copy_begin);
> +
> +/*
> + * kernel_neon_copy_end(): relase FPSIMD context
> + *
> + * Must be called from a context in which kernel_neon_copy_begin() was previously
> + * called.
> + */
> +void kernel_neon_copy_end(void)
> +{
> +	put_cpu_fpsimd_context();
> +}
> +EXPORT_SYMBOL_GPL(kernel_neon_copy_end);
> +
> +static int neon_copy_sysctl_handler(const struct ctl_table *table, int write,
> +	void *buffer, size_t *lenp, loff_t *ppos)
> +{
> +	int ret, val;
> +	const struct ctl_table tmp = {
> +		.data	= &val,
> +		.maxlen	= sizeof(val),
> +		.mode	= table->mode,
> +		.extra1	= SYSCTL_ZERO,
> +		.extra2	= SYSCTL_ONE,
> +	};
> +	/* List of CPUs that support NEON copy */
> +	static const struct midr_range hip12_cpus[] = {
> +		MIDR_ALL_VERSIONS(MIDR_HISI_HIP12),
> +		{ }
> +	};
> +
> +	if (write && !capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +
> +	if (!system_supports_fpsimd())
> +		return -EPERM;
> +
> +	if (!is_midr_in_range_list(hip12_cpus))
> +		return -EPERM;
> +
> +	if (!write) {
> +		if (static_key_enabled(&kernel_neon_copy_user_used))
> +			val = 1;
> +		else
> +			val = 0;
> +	}
> +	ret = proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
> +	if (write && !ret) {
> +		if (val)
> +			static_branch_enable(&kernel_neon_copy_user_used);
> +		else
> +			static_branch_disable(&kernel_neon_copy_user_used);
> +	}
> +	return 0;
> +}
> +
> +static const struct ctl_table neon_copy_sysctl_table[] = {
> +	{
> +		.procname = "neon_copy_user",
> +		.mode = 0644,
> +		.proc_handler = neon_copy_sysctl_handler,
> +	},
> +	{ }
> +};
> +
> +static int __init neon_copy_sysctl_init(void)
> +{
> +	if (!register_sysctl("kernel", neon_copy_sysctl_table))
> +		return -EINVAL;
> +	return 0;
> +}
> +core_initcall(neon_copy_sysctl_init);
> +#endif
> +
>   #ifdef CONFIG_EFI
>   
>   static struct user_fpsimd_state efi_fpsimd_state;
> diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
> index 633e5223d9..2a92ae7bd7 100644
> --- a/arch/arm64/lib/Makefile
> +++ b/arch/arm64/lib/Makefile
> @@ -13,6 +13,8 @@ endif
>   
>   lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
>   
> +lib-$(CONFIG_NEON_COPY_USER) += copy_to_user_neon.o copy_from_user_neon.o
> +
>   obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
>   
>   obj-$(CONFIG_ARM64_MTE) += mte.o
> diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
> index 400057d607..db861eff78 100644
> --- a/arch/arm64/lib/copy_from_user.S
> +++ b/arch/arm64/lib/copy_from_user.S
> @@ -59,11 +59,24 @@
>   	USER_CPY(9996f, 0, cpyfert [\dst]!, [\src]!, \count!)
>   	.endm
>   
> +#ifdef CONFIG_NEON_COPY_USER
> +	.macro ldneon reg1, reg2, reg3, reg4, ptr, val
> +	b	9997f
> +	.endm
> +
> +	.macro stneon reg1, reg2, reg3, reg4, ptr, val
> +	b	9997f
> +	.endm
> +#endif
> +
>   end	.req	x5
>   srcin	.req	x15
>   SYM_FUNC_START(__arch_copy_from_user)
>   	add	end, x0, x2
>   	mov	srcin, x1
> +#ifdef CONFIG_NEON_COPY_USER
> +	mov	x3, #0		/* disable neon copy */
> +#endif
>   #include "copy_template.S"
>   	mov	x0, #0				// Nothing to copy
>   	ret
> diff --git a/arch/arm64/lib/copy_from_user_neon.S b/arch/arm64/lib/copy_from_user_neon.S
> new file mode 100644
> index 0000000000..4dc2b3dfdd
> --- /dev/null
> +++ b/arch/arm64/lib/copy_from_user_neon.S
> @@ -0,0 +1,96 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + * Copyright (C) 2025 Huawei Ltd.
> + */
> +
> +#include <linux/linkage.h>
> +
> +#include <asm/asm-uaccess.h>
> +#include <asm/assembler.h>
> +#include <asm/cache.h>
> +
> +/*
> + * Copy from user space to a kernel buffer (alignment handled by the hardware)
> + *
> + * Parameters:
> + *	x0 - to
> + *	x1 - from
> + *	x2 - n
> + * Returns:
> + *	x0 - bytes not copied
> + */
> +
> +	.macro ldrb1 reg, ptr, val
> +	user_ldst 9998f, ldtrb, \reg, \ptr, \val
> +	.endm
> +
> +	.macro strb1 reg, ptr, val
> +	strb \reg, [\ptr], \val
> +	.endm
> +
> +	.macro ldrh1 reg, ptr, val
> +	user_ldst 9997f, ldtrh, \reg, \ptr, \val
> +	.endm
> +
> +	.macro strh1 reg, ptr, val
> +	strh \reg, [\ptr], \val
> +	.endm
> +
> +	.macro ldr1 reg, ptr, val
> +	user_ldst 9997f, ldtr, \reg, \ptr, \val
> +	.endm
> +
> +	.macro str1 reg, ptr, val
> +	str \reg, [\ptr], \val
> +	.endm
> +
> +	.macro ldp1 reg1, reg2, ptr, val
> +	user_ldp 9997f, \reg1, \reg2, \ptr, \val
> +	.endm
> +
> +	.macro stp1 reg1, reg2, ptr, val
> +	stp \reg1, \reg2, [\ptr], \val
> +	.endm
> +
> +	.macro cpy1 dst, src, count
> +	.arch_extension mops
> +	USER_CPY(9997f, 0, cpyfprt [\dst]!, [\src]!, \count!)
> +	USER_CPY(9996f, 0, cpyfmrt [\dst]!, [\src]!, \count!)
> +	USER_CPY(9996f, 0, cpyfert [\dst]!, [\src]!, \count!)
> +	.endm
> +
> +	.macro ldneon reg1, reg2, reg3, reg4, ptr, val
> +	user_ldneon 9987f, \reg1, \reg2, \reg3, \reg4, \ptr, \val
> +	.endm
> +
> +	.macro stneon reg1, reg2, reg3, reg4, ptr, val
> +	st1 {\reg1, \reg2, \reg3, \reg4}, [\ptr]
> +	add \ptr, \ptr, \val
> +	.endm
> +
> +end	.req	x5
> +srcin	.req	x15
> +SYM_FUNC_START(__arch_copy_from_user_neon)
> +	add	end, x0, x2
> +	mov	srcin, x1
> +	mov	x3, #1		/* enable neon copy */
> +#include "copy_template.S"
> +	mov	x0, #0				// Nothing to copy
> +	ret
> +
> +	// Exception fixups
> +9987:	ld1	{V_a.16b, V_b.16b, V_c.16b, V_d.16b}, [sp]  /* restore current regs */
> +	add	sp, sp, #64
> +9996:	b.cs	9997f
> +	// Registers are in Option A format
> +	add	dst, dst, count
> +9997:	cmp	dst, dstin
> +	b.ne	9998f
> +	// Before being absolutely sure we couldn't copy anything, try harder
> +USER(9998f, ldtrb tmp1w, [srcin])
> +	strb	tmp1w, [dst], #1
> +9998:	sub	x0, end, dst			// bytes not copied
> +	ret
> +SYM_FUNC_END(__arch_copy_from_user_neon)
> +EXPORT_SYMBOL(__arch_copy_from_user_neon)
> diff --git a/arch/arm64/lib/copy_template.S b/arch/arm64/lib/copy_template.S
> index 7f2f5a0e2f..c92f967f96 100644
> --- a/arch/arm64/lib/copy_template.S
> +++ b/arch/arm64/lib/copy_template.S
> @@ -18,14 +18,16 @@
>    *	x0 - dest
>    *	x1 - src
>    *	x2 - n
> + *	x3 - useneon
>    * Returns:
>    *	x0 - dest
>    */
>   dstin	.req	x0
>   src	.req	x1
>   count	.req	x2
> -tmp1	.req	x3
> -tmp1w	.req	w3
> +useneon	.req	x3
> +tmp1	.req	x16
> +tmp1w	.req	w16
>   tmp2	.req	x4
>   tmp2w	.req	w4
>   dst	.req	x6
> @@ -38,6 +40,12 @@ C_l	.req	x11
>   C_h	.req	x12
>   D_l	.req	x13
>   D_h	.req	x14
> +#ifdef CONFIG_NEON_COPY_USER
> +V_a	.req	v20
> +V_b	.req	v21
> +V_c	.req	v22
> +V_d	.req	v23
> +#endif
>   
>   	mov	dst, dstin
>   
> @@ -155,12 +163,16 @@ alternative_else_nop_endif
>   	b.ne	.Ltail63
>   	b	.Lexitfunc
>   
> +.Lcpy_body_large:
> +#ifdef CONFIG_NEON_COPY_USER
> +	tbnz	useneon, #0, .Lcpy_body_large_useneon
> +#endif
>   	/*
>   	* Critical loop.  Start at a new cache line boundary.  Assuming
>   	* 64 bytes per line this ensures the entire loop is in one line.
>   	*/
>   	.p2align	L1_CACHE_SHIFT
> -.Lcpy_body_large:
> +.Lcpy_body_large_usex:
>   	/* pre-get 64 bytes data. */
>   	ldp1	A_l, A_h, src, #16
>   	ldp1	B_l, B_h, src, #16
> @@ -188,4 +200,38 @@ alternative_else_nop_endif
>   
>   	tst	count, #0x3f
>   	b.ne	.Ltail63
> +
> +#ifdef CONFIG_NEON_COPY_USER
> +	b	.Lexitfunc
> +
> +.Lcpy_body_large_useneon:
> +	/*
> +	* Critical loop.  Start at a new cache line boundary.  Assuming
> +	* 64 bytes per line this ensures the entire loop is in one line.
> +	*/
> +	.p2align	L1_CACHE_SHIFT
> +	sub	sp, sp, #64
> +	st1	{V_a.16b, V_b.16b, V_c.16b, V_d.16b}, [sp]  /* save current regs */
> +	/* pre-get 64 bytes data. */
> +	ldneon	V_a.16b, V_b.16b, V_c.16b, V_d.16b, src, #64
> +
> +1:
> +	/*
> +	* interlace the load of next 64 bytes data block with store of the last
> +	* loaded 64 bytes data.
> +	*/
> +	stneon	V_a.16b, V_b.16b, V_c.16b, V_d.16b, dst, #64
> +	ldneon	V_a.16b, V_b.16b, V_c.16b, V_d.16b, src, #64
> +
> +	subs	count, count, #64
> +	b.ge	1b
> +
> +	stneon	V_a.16b, V_b.16b, V_c.16b, V_d.16b, dst, #64
> +
> +	ld1	{V_a.16b, V_b.16b, V_c.16b, V_d.16b}, [sp]  /* restore current regs */
> +	add	sp, sp, #64
> +
> +	tst	count, #0x3f
> +	b.ne	.Ltail63
> +#endif
>   .Lexitfunc:
> diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
> index 819f2e3fc7..fbf058dfd5 100644
> --- a/arch/arm64/lib/copy_to_user.S
> +++ b/arch/arm64/lib/copy_to_user.S
> @@ -58,11 +58,24 @@
>   	USER_CPY(9996f, 1, cpyfewt [\dst]!, [\src]!, \count!)
>   	.endm
>   
> +#ifdef CONFIG_NEON_COPY_USER
> +	.macro ldneon reg1, reg2, reg3, reg4, ptr, val
> +	b	9997f
> +	.endm
> +
> +	.macro stneon reg1, reg2, reg3, reg4, ptr, val
> +	b	9997f
> +	.endm
> +#endif
> +
>   end	.req	x5
>   srcin	.req	x15
>   SYM_FUNC_START(__arch_copy_to_user)
>   	add	end, x0, x2
>   	mov	srcin, x1
> +#ifdef CONFIG_NEON_COPY_USER
> +	mov	x3, #0		/* disable neon copy */
> +#endif
>   #include "copy_template.S"
>   	mov	x0, #0
>   	ret
> diff --git a/arch/arm64/lib/copy_to_user_neon.S b/arch/arm64/lib/copy_to_user_neon.S
> new file mode 100644
> index 0000000000..51c2aba8a6
> --- /dev/null
> +++ b/arch/arm64/lib/copy_to_user_neon.S
> @@ -0,0 +1,96 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + * Copyright (C) 2025 Huawei Ltd.
> + */
> +
> +#include <linux/linkage.h>
> +
> +#include <asm/asm-uaccess.h>
> +#include <asm/assembler.h>
> +#include <asm/cache.h>
> +
> +/*
> + * Copy to user space from a kernel buffer (alignment handled by the hardware)
> + *
> + * Parameters:
> + *	x0 - to
> + *	x1 - from
> + *	x2 - n
> + * Returns:
> + *	x0 - bytes not copied
> + */
> +	.macro ldrb1 reg, ptr, val
> +	ldrb  \reg, [\ptr], \val
> +	.endm
> +
> +	.macro strb1 reg, ptr, val
> +	user_ldst 9998f, sttrb, \reg, \ptr, \val
> +	.endm
> +
> +	.macro ldrh1 reg, ptr, val
> +	ldrh  \reg, [\ptr], \val
> +	.endm
> +
> +	.macro strh1 reg, ptr, val
> +	user_ldst 9997f, sttrh, \reg, \ptr, \val
> +	.endm
> +
> +	.macro ldr1 reg, ptr, val
> +	ldr \reg, [\ptr], \val
> +	.endm
> +
> +	.macro str1 reg, ptr, val
> +	user_ldst 9997f, sttr, \reg, \ptr, \val
> +	.endm
> +
> +	.macro ldp1 reg1, reg2, ptr, val
> +	ldp \reg1, \reg2, [\ptr], \val
> +	.endm
> +
> +	.macro stp1 reg1, reg2, ptr, val
> +	user_stp 9997f, \reg1, \reg2, \ptr, \val
> +	.endm
> +
> +	.macro cpy1 dst, src, count
> +	.arch_extension mops
> +	USER_CPY(9997f, 1, cpyfpwt [\dst]!, [\src]!, \count!)
> +	USER_CPY(9996f, 1, cpyfmwt [\dst]!, [\src]!, \count!)
> +	USER_CPY(9996f, 1, cpyfewt [\dst]!, [\src]!, \count!)
> +	.endm
> +
> +	.macro stneon reg1, reg2, reg3, reg4, ptr, val
> +	user_stneon 9987f, \reg1, \reg2, \reg3, \reg4, \ptr, \val
> +	.endm
> +
> +	.macro ldneon reg1, reg2, reg3, reg4, ptr, val
> +	ld1 {\reg1, \reg2, \reg3, \reg4}, [\ptr]
> +	add \ptr, \ptr, \val
> +	.endm
> +
> +end	.req	x5
> +srcin	.req	x15
> +SYM_FUNC_START(__arch_copy_to_user_neon)
> +	add	end, x0, x2
> +	mov	srcin, x1
> +	mov	x3, #1		/* enable neon copy */
> +#include "copy_template.S"
> +	mov	x0, #0
> +	ret
> +
> +	// Exception fixups
> +9987:	ld1	{V_a.16b, V_b.16b, V_c.16b, V_d.16b}, [sp]  /* restore current regs */
> +	add	sp, sp, #64
> +9996:	b.cs	9997f
> +	// Registers are in Option A format
> +	add	dst, dst, count
> +9997:	cmp	dst, dstin
> +	b.ne	9998f
> +	// Before being absolutely sure we couldn't copy anything, try harder
> +	ldrb	tmp1w, [srcin]
> +USER(9998f, sttrb tmp1w, [dst])
> +	add	dst, dst, #1
> +9998:	sub	x0, end, dst			// bytes not copied
> +	ret
> +SYM_FUNC_END(__arch_copy_to_user_neon)
> +EXPORT_SYMBOL(__arch_copy_to_user_neon)


