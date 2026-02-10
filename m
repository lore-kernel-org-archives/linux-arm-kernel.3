Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632B3EA3F33
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 09:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1MFqXqP2PlVINf4Xa8h/EQMn7MKGGTzWGfkz3niJ6x4=; b=TubNmDSjXOX5YhxUmCoDGg2+d7
	JYuVeD5lIo7uDylY59B+A8RPCwQ5c/LKSq8Yynehgix7It/zF9+02QBZCtBc0LKNKHjjqozkEoV6X
	5PnyFrHl7OD0fSPbmUpejB9mVheCRQUqFJBZTFyaSzAWKb5UG+g9goIHQqwJSDde+H8JqSjt658hi
	IBW+gLYhpBuzbYn5lVU4BZo3t9wis5FQ9NFS20YX2ytAPf02AyHzY5Ai720ux/Frh/TNbjgVoqEWI
	OUgD83GbVnRGNA7YlVTFFS91kvgbwosvNul/e0x28gDSOemnxdRnqcu1Jkrkgv2SgO8R2z8vkA9H5
	T+b6Fw4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkOP-0000000GmWd-1IXr;
	Tue, 10 Feb 2026 09:50:49 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkON-0000000GmW5-0TI2;
	Tue, 10 Feb 2026 09:50:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVD13gRPqTQLcUxmEO+p5Xq2OET6N4UpefoT17+AwICagLtwg0tHC4Seg5pe7ll2d8BESsHuNKojUElFUetOmLZhzZpZCFyaRtmzRGqcQK5wkTE9s6aMCdMq52AIm6GruNulPM9EkJuW9UD+xYH8+6o20elbROc3oTz75FbEOHCq6bK1lOSnVu+1G6kWcEnbP/9xGsQEEDlxpaFaFDsIEV4GXwkzWoUeTMs74MPtyS3VMdZ8RcBUMuJ0t6JV4r+iOVhm3l7dZdrRCQDjI2C2Ee6185pQIl5g7e/ZnZf0naAUQQCi+kFQjDkmS+Vt/9xWEID08hg90GIU00CfT30BXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MFqXqP2PlVINf4Xa8h/EQMn7MKGGTzWGfkz3niJ6x4=;
 b=D2OK9XUhS7bUwFTeSglK//wX8VDkiovPV/N4XonEMe9Fp+J62opV7mmOYMfaY9w+/22pW8HF2BgBK9ZkhCAe9bg4ZsKj5erD8iCLF7VNYKeDMcJJDQRRj+t/469PLeQVUfeNGTts3++GzSEBXGbHzqYr4wUFKdHYHRNZXhVjy5nHcM7VFPsQgKPGxKgjt8bLOFmr1YW+n2mh/FRpBz0C2QqqB47vAXlHHFtxYDh2Gi2HESwXMl3w/8zbeVcJsja8DdG6ZQB84Kg9YhnmCQKtl/LJYWQR67aeOqHmifylFJdlagB/A9RK4dtOBfZySiVLJWzuj29XGUG02ZKcX2OKLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MFqXqP2PlVINf4Xa8h/EQMn7MKGGTzWGfkz3niJ6x4=;
 b=mRLUpL0g63MEJ0ecqB3tQWfB710RiRPobbK3QEPVj9u+er9gk/o5TdRepRR9eTPa3Ev1wt8+az7/gTYitdgDt+Nx5eJEeQt6ARQUCjZATIiVdQciKSs/8O+aEJ4kK4KwUdskyASRaszuOXdN32CA5Am9XQpJdA6MoZkJtOuWLps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB10657.eurprd04.prod.outlook.com (2603:10a6:150:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 09:50:40 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 09:50:39 +0000
Message-ID: <ef0569ca-bf27-4e64-bee1-4eba551b91c1@cherry.de>
Date: Tue, 10 Feb 2026 10:50:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: Make Jaguar PCIe-refclk pin
 use pull-up config
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260210080303.680403-1-heiko@sntech.de>
 <20260210080303.680403-5-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260210080303.680403-5-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB10657:EE_
X-MS-Office365-Filtering-Correlation-Id: b7804567-c52d-498d-2c1c-08de6889d924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3VHTlVaVHlCQ3E0bmFEU1hrSUx6bldpeTRXbUVKa0pUSkZwL3o4VkkvaWZn?=
 =?utf-8?B?U3djTFVFM1ZDN3V5QUFFZHptbDhNZTVOazdRS1llNzZ2R0lZYnh3UjJPeGow?=
 =?utf-8?B?MFQzcWNqSnQrc2pjbDlldTFhb2dEbFQxMDVjRTdPSlVHazlqTW1jV0Z2WlU1?=
 =?utf-8?B?dUNKTGQxT2hQNk01TGZ3VjdVOVFkOUpqTTRrT1c1MUpsdTRMSmxuVWloTWtv?=
 =?utf-8?B?N2NXYmZrbGcvRkJSbGxQS01IdmdDU2Y5UVM4YWU4OUVwTC9WQm1ZTDBhVUl2?=
 =?utf-8?B?V0lNcUQrWTZYRnRxMGEwZURIRTl1MGozZklMWFJCMmZsNUhNR3JKUGt5L3U3?=
 =?utf-8?B?a1FIcm5RaTF3bjNwWTZ0bmVGWmxrQ3ZFZ2hRYnpnWTdIbnVRYVVmeHJnQ2xP?=
 =?utf-8?B?ck13ZCtUajh0bW5kVXlxbmU2NjFZOHNTTjZ4UityeDV5bE9MdmM2ZnFkbU03?=
 =?utf-8?B?b2dFK3Q3WWpST1JMTjhoSS83MjByTnVQbVAyaFNyWGpPdFdEMzA1RDlzbzVF?=
 =?utf-8?B?bUxza1BZNUcyWGE4KzRRS1hob3hTT0VjQW5yM0xkSzVJTFJJR3hTcllYaGxv?=
 =?utf-8?B?YkhyaHNPTFg5YWtYdmhtd1JnTGJlbCtZbnJBMUMwTFdGOCs3b0ZLQjdkWWpU?=
 =?utf-8?B?ZGRURkVFb3h0dlAwNFFFRWNsOS9OeElKMDZQajZ1VFVqQjVRNDdsZ2p0NndG?=
 =?utf-8?B?R0pXdkN5Slpva2lWeUloUlJ1R09vanZzRGtKbzlMQ2RiWG9ReXVjSTlHSjZq?=
 =?utf-8?B?aVdxUkZnbUIvYXMrempxN2NRS2dGdm1yVWNxSXhNc2sxb0J2ZlBHZzVqNVQ4?=
 =?utf-8?B?R0VqdDZ4UWowNXJYSEsvcU9pUHo5NHVsY2hDTkx0RzhPUkk2V0wwd0o4NXBr?=
 =?utf-8?B?VlRyMEtPenRDL01nRnlYR1BkaHA2NHFmZ3NwZm41TWIrUWxmK2hkKytvRkJp?=
 =?utf-8?B?bnlrelRNd1dvU29qSU1LaTE0ZlFqN1dLaEN3KzhtWEZxUDdTMmVzRXpHMy90?=
 =?utf-8?B?MytJVENlb3FlaGsyUGxEZ0pVM0thUkw4VXEyNkYzTkZlZnVBZ1c2OFdkS2NZ?=
 =?utf-8?B?MFhKaStlV0JlRUpqVmhWcUlNSUJ0TGVGUlpSTzBjMjArQ1NRL2pURTZiUTRw?=
 =?utf-8?B?clNvNUVkZTBZSFQ5R1hHS0p2ZVlScTR6RTVEWlordXpVemUrUWtFTTNRQ0cz?=
 =?utf-8?B?Y3FIdmpPWWVSd3N1Um11TjNCTDJ1MGNzZjJ4dEk4U3VwcFJxNHYzMS96R05B?=
 =?utf-8?B?eGhxU0dZSEdIczcvZy83Qk9iNzRHN3psY1ZINkR6RXh0YklhK2tGR2lGaGVv?=
 =?utf-8?B?cnhkbW5CZEhUVjdZVHF5dU5tcU52T0lDNUI3elowbmdNbUF5YzZ1cEFzbGhN?=
 =?utf-8?B?NG5NaDJmYWhWZDVlcEx2QUFHMVp3VG8yR2FjTG81bzBIaEFJTFBoSERCSTZw?=
 =?utf-8?B?Ly9Lb0RWTjkyU29UYUsrSWZwYXJ5ZFBTTm9FbHg1U1VVOGN4ZXNmYzdBdHYz?=
 =?utf-8?B?eE9MZmJpZzBlbFhwUCsvb01ka2d2aXdBWW5VK0dYRFI2S1BrQmliWFZIcER3?=
 =?utf-8?B?M29Jakx3MURFUkNOeER3VjNmdmovcG5Ram9BM0MzeWU1K0hmUXFwZkRjVUhx?=
 =?utf-8?B?bTl2aEl3OEFaNEIyaDdRL0tFbStMeXhOcDc4blRsKzJnSEJ4NnNRNEpnUTZU?=
 =?utf-8?B?TEtoTVBBRHR0TUl3ZHo5eHNvTHBzUW9pbnQyZ3ZmOEIzNW9IbWRjaTVaZGp6?=
 =?utf-8?B?NHN4dzJobDdlRHlCOUlPNGRBazNnRXVaanFtZi9DVVFNaFBmS1NreklFUzFu?=
 =?utf-8?B?YnZ4WEo4bkVqdDBJY2Z5UXlHalhzNSs5N0RiZUcyWC9QamRHQU56U1hDTHdJ?=
 =?utf-8?B?cUVoamlZQU9xekk3bjJnZjVlekQ5K1dGVFhtNVRaREVOTXhSSnIyZk4wSHY5?=
 =?utf-8?B?eWFpVzRITjBwRUNUOGpudW5BU1dtYjFpT3d2RndLL0QxamN0V0ljY0piTHhj?=
 =?utf-8?B?dGMrSko0U1k0L3pZeG5YK09BQkpNM09aVkFPb1FVWGl0N1Jzd0pwSXY0NFN1?=
 =?utf-8?B?ejcrak5BVTN3Wktpc2NaNnhGUE4wT1VlYlhuQ2lNUVIxNldoYnNxT3hGNDRO?=
 =?utf-8?Q?Gphg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2hGZi9RblFUWUppUlpVNDNXRjZPSjZjWTkvdmlwNENVSXR1c2dLQ2lzK1lJ?=
 =?utf-8?B?RldzODBWaHcyRTN0cWdNcG1ud3IwV0RIUzBTOGF6TElkWTJ3YXhtZ1A4T2tL?=
 =?utf-8?B?NGVtcVlGNmVMdlgxRko3cG92eDdwaG1MWkxIczdwOHRUT1JmdkhEVlNxTm41?=
 =?utf-8?B?cUQwa0kzT21QWXJIdWkrN2NZcG1jNDFZcGJNRi9ZWGpMNllOVk1MeFc2ZEM1?=
 =?utf-8?B?Z0FOMzkzYzBVOHBSQUw0K0lFVkRqWmN0Slpra0UyKzVBNXRyVW00YkM5Z0Nz?=
 =?utf-8?B?dDZaLy9vTjBXbThUNUlMZlIrcmo5Ly9oMFhsVllhdVN0S095cUVlazQzRFNV?=
 =?utf-8?B?d3dxYUZGMUtUS3pZaVU3QnRhb2drcGwycURYZ0xpaTNLamN5ZW5JMmpqbExq?=
 =?utf-8?B?T21BdnhSYWJnVzd6ckpqMlpSR3JHSVRGbEVySW52OVVLSVFPSGM1SEJ1K3Z1?=
 =?utf-8?B?SGtPYko3bTRFNGd2NGhwRUNaemFjUWo5ZWhMcVdRclJxTnVKWEpCc0p2VHcr?=
 =?utf-8?B?Y212VVRZMEY2V1BXL2FWaGZWRE04dVg3UkpWbjV2b0I3NkFBR1ZLSFdDL1J5?=
 =?utf-8?B?MTRmbXhad0pFNVRyRTV6Y3JtS216RFBPZTZ2ODVYN1hFN2FIYS9yN2dvbXg3?=
 =?utf-8?B?REM3aVJ3NGtkOW14c1c4OUdNaThWdEc5U0Z0M3dLNjRJZC8wUTQzSGFEN3Bm?=
 =?utf-8?B?TnJBN3dIcXFJcEJYZjRieE8rMmNTMmRKbjMxM2JZMG1YZGE5UEVQdWpFL3Ey?=
 =?utf-8?B?TTNoWlRvWjZyZHlLc3ZFNW5RUXMyWVlzc0NOUGxCTm9wWTgwT1FEd2VkWkp5?=
 =?utf-8?B?QzNnQXk4Ti91VjJ1WDlRYndrQWZnV0NSdUxWL1VTYlcrU3F5ejlyMmdJaWgr?=
 =?utf-8?B?S0R6UWdUVGxVZElYb0YvT2lLNDV3OEZOTWhVd2N0dWF6QkhYdU9SMHBiWFZL?=
 =?utf-8?B?M1pGRjZQK3haVCt0RHU3RFF4SG5sbkhsVnRUeElBVG1BTmZJZjNCN1Vpd0lQ?=
 =?utf-8?B?ejVxdU5VRk5KYy80SmdpQ0x0eWk0SnVZWlp3SGhCMFZtOEtSc0hjVUZobjVu?=
 =?utf-8?B?d29lQmx1TURqUWpockUzY09KdFUwYXJqaEJiOUx6U2VMeE4rYXI3Y0N2ek4w?=
 =?utf-8?B?eWM1TCtQQVozOEc0ZFpjQS9yQ09JVEg0N3VWNUhkZ2xDODJRUUF3MCs0S0t6?=
 =?utf-8?B?VHp0MHU5SkVGWjFBczUyeTJqLzVTdHRqZnlFL0hYYkRPY2lZUFBFc1diVkJW?=
 =?utf-8?B?TSttWFU2akRLYzVBbXpybytGalhUc0R4N05Hc0tuTkR0ZGtvVGNzdXlOV2dD?=
 =?utf-8?B?Wlg1ZHFCR1pQYTJYSTJ4Z3J0MW55ZlBobWdhc01mOC9vbmRFampUWnRBTGlC?=
 =?utf-8?B?eE95a3Q0dWtzTnhzajZWblFSeXZjcEo1bGErNldqT0swbS9DVWlSNitqRlRm?=
 =?utf-8?B?SW1hTzhLLzZ2dW0wOHYxUEpVMW0yQXd0eEhGMlRSSkh2UjRhMGZySkhXc2pw?=
 =?utf-8?B?ejJTSGhEWVdrdVdPejVRZEtsVTJoZExTQXBkUzlBVzh2UmRyV09xejJNRlVi?=
 =?utf-8?B?ZVFPVEFjSVk0Ylo0emRWcWM4cENmRWh6L1pPVi9XU0RTN1dLZUZGWDliL3pR?=
 =?utf-8?B?SStFZm9ScXByZmlUWEpsWWJCRklZNGpYVmgwa0ROM21TcExuTkdrNStWSTFB?=
 =?utf-8?B?OEhnSnI1UEZyYnU1NnlpakZLUjFtWkdzN05lRXFzbk5NK3FBTTd0ZisydDNy?=
 =?utf-8?B?S0RYTXNQY1A2cUtFMjU0Y2crZFgxY0VCdGxQQkpKK2JaRXd1Zk5jRllwN2dl?=
 =?utf-8?B?Rm1IVnRHSTA0MXVWdThxQk5IYjEzcXlqcTd3TUt5U2lHT2NFTTVWWWhodU9P?=
 =?utf-8?B?ZDZTZmhUa2w0UXNxZkh5blhDYXppZ2I3MzU5MkVNY3pqSVJPMW9BK0tkODdy?=
 =?utf-8?B?ejZBYWV3RzJsd3VOVWdVYW5GVnFXQitoYzEvRjJaZ1JHZkp6NVpQc0psM0lm?=
 =?utf-8?B?UXJwdERiQnZoZ2djZ2tzKzZ4YVQxbnJGZzlWNFFEckdWNENiSVJJWXlFcmEx?=
 =?utf-8?B?TTJjMGI3ajE2ZG9oZDArWXNTWWc2UkpueXpxaDlxLzlpdFZSU2FKemZuZ1p6?=
 =?utf-8?B?UERqVGNma0JHa1hsaDBiQm9zaUNmejgzUUIvZ2hGSUtMSFE4RXJ6K3Z1UEVo?=
 =?utf-8?B?RkhsZys4NGYyOEJCTFpPT2t3bFlldlV6OHZtemxzVXJ5ZzJNaTcrWWZxN1Vv?=
 =?utf-8?B?ZVdxbWh5cEUyZlp1WkVJQVNRNkgyMVVFRWJBS2VjOWVNNk9aekV4MzIzVmlj?=
 =?utf-8?B?ZHJvRTlCUXo1cmRJTmtlZUlGd0hFdjRnaTdtb2VkcDdualRoZUovRFRZbmpH?=
 =?utf-8?Q?fozcJrLXmPGCBL4GR5s3ogIxDZEzXZ0Z35Wej?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b7804567-c52d-498d-2c1c-08de6889d924
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 09:50:39.7059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qggWdY6OG0MsMUm+yzR9mEzkgzYglAc36RsaXND2UYc3gJMpOqr57eS7/9BuZWk/rUF3gUq6YQZhpLvOznoCtw4kwemmgj2U3604jaWv0ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10657
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_015047_181343_5CF9B044 
X-CRM114-Status: GOOD (  14.81  )
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

Hi Heiko,

On 2/10/26 9:03 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Different to RK3588-Tiger, on RK3588-Jaguar the signal enabling the
> PCIe-refclk generator controls a transistor which in turn controls the
> output-enable input of the PI6C557 and there's no external Pull-Up or
> Pull-Down between the SoC and the transistor gate.
> 
> On Tiger the pin is directly connected to the PDn input which has an
> internal pull up.
> 
> So match that behaviour on Jaguar by changing the pin config to enable
> the SoC's pull-up config.
> 

I think we've a different behavior on Jaguar and Tiger (see polarity of 
enable-gpios), so this is a bit misleading. I would simply say this 
matches the default PU/PD pinconf of the SoC after reset according to 
the TRM. It also means we keep the clock generator in reset until the 
device driver drives the enable pin. On Tiger, since we would need a 
pull-down to have it disabled by default, but that it's only an internal 
pull-down on RK3588-side and a pull-up on the clock generator IC-side, I 
don't know if that would work and reliably at that if we were to have 
opposite internal pull-up/down resistors on each side of the line, hence 
the no PU/PD on RK3588 side.

With the commit log reworked:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

