Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854BECFD37F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fp3Dl1ZCcEYGKhZUGRP4ksHEmfktjexBqe1SDoCLf1c=; b=x9SJciDVt9QKdA+5ocVH1e7IQe
	eieO/wIFP526tNeIKa1zIrrneNPN+Fpk/iuK9LPj9J5R4H4Mu0dvFjJ/TxXaCDmxirXl9mjnXr+kB
	+yOh8j8Uxz80A88gFTJPo/nhFOwZMuPbRymZuJJUVotJdjUX+3KDoeZDYWr05rWtLsyQAWhhJuvzz
	1W05wXh+S3hwgMp3LeoS6mpvexY7j0d0N2WFv3RNJFtcf0F1qJ6wQ/tDUjgFLxix3+rtr6U9ygXGf
	FeuLhUEiIldUFPcLGcsJD+SVy66XzT/E2OlLz5lRfzc4jyX50g7E77GMC9F0wKEWkdFN3P5fG0EXO
	LwSp1DMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqJx-0000000D8JF-36yA;
	Tue, 25 Nov 2025 10:30:53 +0000
Received: from mail-eastusazon11011061.outbound.protection.outlook.com ([52.101.52.61] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqJv-0000000D8Io-2EYe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 10:30:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9JKT3xpUxgVY81Q+Eg4SKhheTfqmldLhs0td+lJFqvg6iEM/XtEX68gcVxgFdirF/+jB2WsZzrWRIvDRb61FJCb/FrUdTuvelUI7CTtQtamFmMtt1ayCHUiNB/mOL/gz28U8Pb2SGdCdlDmwKdq6dSYec4rRlI54uzkaW5+AD74TD3+W7bsPBZd7PwaQeB0ponjiI9h0Sutb/fy6KNyquKVRH9QCmdpYwNzPEOeSt4Sm9VmRN61PbhruWFWj2Dg4rj7zQoC7SpAW4OkULQwmBEJ00U1nTzwQFXtl3ByjJ085JqNMy4Lg/vCOKEcqgJqqsJNvcLx18InNkEBcyuWXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fp3Dl1ZCcEYGKhZUGRP4ksHEmfktjexBqe1SDoCLf1c=;
 b=vJ5zHW7aDJ6+weAx1Jm5MQDIWRKEQ3bM47I5HOXZZ/IVLgNgkDmC9P4jSLwVDdvBll8dsBd4F33Lf3oW3+mGfSd4GctKTJsxrjvNGRtJGLJq2OKTcx89mDvi1qyWytTa3+LfdodhT3K0NpsLb5munLf/Xj0XCkWwEP+HCzfiF/sKtw5OVSrYxS0HnZZxJYxeyYED9K8j2LmhsBXz926i5rywNEHcwuwmRI9cff/iCihO4+qzOKK/AKzrmGXo/wJXn+rxTBDIgV507SQLQNjX/qviaX/LPSJ5ji46ps4VEAcSKTqXIAfU2sw5/dO/fTT7El1s32KDrxV4WYHQU3U0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fp3Dl1ZCcEYGKhZUGRP4ksHEmfktjexBqe1SDoCLf1c=;
 b=C35oaaFVv8MLF0K2INgopEBl+pttXh5PBg7OTzGkLUyLvkL3NX5IINE+LpU0CusZssYpoc6kYxAXqcB8i9w7DmR9YuSZceTq71V5U0BHBY/DajxinWkWOTYG7TPuY0U3eBvqTu9RT2hhZq/rfrbBSH/NwXfPbFVbVzHnFoQuOFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by PH7PR12MB5783.namprd12.prod.outlook.com (2603:10b6:510:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 10:30:46 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 10:30:46 +0000
Message-ID: <88b72343-e86f-4b13-adcc-ba09683eb898@amd.com>
Date: Tue, 25 Nov 2025 11:30:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "arm64: zynqmp: Add an OP-TEE node to the device
 tree"
To: Tomas Melin <tomas.melin@vaisala.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0001.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::17) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|PH7PR12MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d5afaa7-7e2c-43ef-8028-08de2c0db13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzZKYlVTblNUc0Nhay8yNDBYNi9tbFdpWDNuUDMrY3VrM2t3cVlUc0tEeGgx?=
 =?utf-8?B?QVVVSUhpT0lyczgvTlhZcU9xTmxyRnF2eFlEdkJua1ZKSDhyV0t4RUVBY2Jn?=
 =?utf-8?B?RStnaW9IdmtSMHk2ekpEblA1Q0xwYVFHa05Pai83YnRIclFNS1JYemJUUmx6?=
 =?utf-8?B?dENOcTBVdzBpWEk2U1AxRlZCaFlwWDBYWWVYSjltQm9tcUQ3VGV1RTIzRnFa?=
 =?utf-8?B?NkFMSWZNT1ovS0lCK04rVUxEWEFqQTBDOE4xU0s2ZnpxUkIwYXhkR1NoS3BD?=
 =?utf-8?B?T0p6U1NNcFE3OC9BWWxwZXJDQ0hheEx6UHFpSDRPMHI4VWJCcytlaDY4WWJx?=
 =?utf-8?B?MGU3cjNLdEd2Qm5sOEFBa1FQdEdDSDZqU3FpQmp6SmhZSFI4cXVaTW1jaW9W?=
 =?utf-8?B?a3FyQ29takxCVUdKeGZnOUFISmhZK0JvNUhXU0ZqMFI0OHJWOUU1RUo1ZG9B?=
 =?utf-8?B?Qm83TlhiUDBQQ0VxbWdUNG82RGR1czIwSnV1TldBdFVsY0pGQS96MldnbWw4?=
 =?utf-8?B?TVhpVkwycDJXaG41WjkzZ2t5K09FbGt3UnJ0UmVPZ2F1MlFsRW5WamdqdWI0?=
 =?utf-8?B?cTA5TEtnWU42ekZ6a0dud1J6TVM0RTB6NndickdrUExpUE9IU2p5bzRqYUxF?=
 =?utf-8?B?RFdEa1hNWXF0WjQ5ZVFWS0lkcWJPUmtCUmR0b3hZYXJsUWZWeEEyQ1pNaGtv?=
 =?utf-8?B?MVU3SWRtNkhRWDhTd012NnVRU2tyMEJTbHgyWUNjRDhKNm13blNQVnhtRTh6?=
 =?utf-8?B?WVc2U21wQ1BXS3pCOGZBcTVKVDhUUC9yS0l1NFpSYjBYbGZVU2xHVGlKSnFz?=
 =?utf-8?B?ckFRT21oSHA0TDFvSE1QQjdiUzRnU3Z6Nm1mZ0FvNEtKU1JBcW1yT1VBa2dD?=
 =?utf-8?B?emFBeDJaOVF2bWNHNmpsR21pcHBiaTdzS0xUQkJHb21TcW5WVHR1bHM5aCs0?=
 =?utf-8?B?Mi9pV3M0R0dNYkhNL05jWW1mdzArWFMrZlVXN3dGNlgrN0RieHIxNlZLMU9t?=
 =?utf-8?B?Y2x0MWRVL1VCL0ZFNW1uTG9vUkg3SUFrYmoxSGZUeElRV1VrMlBuaFZvbm4z?=
 =?utf-8?B?TE1aUFZmc0p5STQvWFAydjBZdGxaODRxQlRTNSs0Q3lZVFpDQVhYQWJqNy9N?=
 =?utf-8?B?YUlxTmlkaUJKMmJtRXZHb082eUFJTFI5cHNEMUt5T3Q1UVR2ZlgxMlMvSXhG?=
 =?utf-8?B?bVVTY3lhV0RVWWljaXpZbHJrTitrMkZIcVN5ZFUzN21XRnI3WTJTNG9QQjVu?=
 =?utf-8?B?QTJOOUhaZnNXaDkyZ1FTbVpMdlBhRGpzcU1pQ1hVWnQxWTZZaXFiTEViL2p4?=
 =?utf-8?B?SkhieDVNbGZraFA2K2M2eWwxbVI0Wm1qdW5uSlRZZlBWOGwrNDBFb2ZSVnhS?=
 =?utf-8?B?eGloR0xwNmlYREVENlhzVS9OekpzcUgrNU5WZHZPUy9reXlIaHh1NHEyQzlL?=
 =?utf-8?B?WjNlcXJ3MlVpNWYzUS9wOFdzamhmQm5iY2ZkbTRqc21Gdks5akE0M0lzK2hm?=
 =?utf-8?B?bUFkbmJLVTRwZW90Z1R1UGtwaGg3MFYvZFJxUThUZE8rS3FhdktIaDFOYUVL?=
 =?utf-8?B?UDFaM2V4U05jemNNTlB4NGxKdGNHaHF2QU16K01OUXJXMW9zSTErQWh6VHdw?=
 =?utf-8?B?UXVTWE0vU3ZnWkpmVTFiaUZpL2Z3dkVHcFk4ckJVd3d1cFRWcUc5bUxnOFZm?=
 =?utf-8?B?R3M0UzZZekFxeWM3c21vUHltTnh4UlNva2oxNTdQZWo5SDluUEdRamV1Q045?=
 =?utf-8?B?ajdDNzZkRnQvVGxwaFN3K21MdUhPekJ6WjRDTG8zSUg2MktER3lFQ0tEUDl0?=
 =?utf-8?B?ZnR6VHlXYStMb3NCK3BMVkp2ZlVtSHprSU1SL2w5N1AzRzJ2T1Y3K0l4T0Fu?=
 =?utf-8?B?bUhJTlpLdG9uUW9CMFRET3RIbGsyU05TN3NNd1dXN1dsOWFBSFFFeGVlRzdu?=
 =?utf-8?Q?9O3WQfWd5481jN8g/aDGZFk1dOi2pL+B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vkh5SjA2bG5Dak9UWVprVFppMFVRcS91QkRtWVZHSkZDZHhBQmo1c3dlN3Rk?=
 =?utf-8?B?WWEwMFpsSm1TN3IzUVU5b0N3TERrTlhFTm9EK3dCTG1wdlJOcWVUSVg0c3NB?=
 =?utf-8?B?SncwRzZiNzJKdmJ3YmYvMXkveGlYMnBxUjRnN1hJd0hVYWQrelhWTldNU3h5?=
 =?utf-8?B?M0EzWGVCZjFSNThFRDZaSGh3aCthWmFUK3ZuQ0x2UEM3dlI5WTFTZHAxWXQ5?=
 =?utf-8?B?ckFoTkpLNFZBTVdpa3M2VHZDWExhRlVVUWpBL1FWakN6V052OGYrbWs5cHVh?=
 =?utf-8?B?WmxFTHpsaEE2Sk5rM00yYWFwVkpJWXJ6cjlYbDJtV0F3dC9EVUF3WFB6NzJX?=
 =?utf-8?B?eERiQXJMUmJoYkpkL25tQTkzQzRLWUZwT2E3VmVZK2dtWENUR1NEbmd3azY5?=
 =?utf-8?B?SXRKaGZuMjd2RnpsRTk2ZW0wTW1NV25Sb295ZkJTN3VIbHRpYi9KZWl4enh6?=
 =?utf-8?B?MXVnQ2RhQ1NqNnJSZ21XaTBWaHVRaHFNM2FtZDRicjN3VldJZjFjQ3IwVnFr?=
 =?utf-8?B?V0hpWXpwWkE3d0ZQSGpvYkh0TU9hVHczdGhYRU5wT05XM2JpTVpUempMNTVZ?=
 =?utf-8?B?OGwvT0g0RlRRY3htWFZ2dk1MbXZYQWRvNFZxaUpxek1wT3BNNkREWlNKMmlO?=
 =?utf-8?B?YnZDemdOTDl3aXFhOVpaWHJFSDFVdFRuaDNLc1gyQ2FYcVdsN0daUFVWZG9R?=
 =?utf-8?B?OEdxYjBZY3AyTGYrclBTMUdZRmViMHBBSmRUTFNRZGEybmtPOGlsd2owRzVB?=
 =?utf-8?B?SDg5VUc5QW5iUlZsUTZodk5NRS9JNE9SUm1LUDNYalI1RHVScmhLMmlSbi9m?=
 =?utf-8?B?NkhKQURCazRpYmpaektlWFpJSzk5dXVMWktXZ0dBQU43czNxMHBVd2tCL25I?=
 =?utf-8?B?UHNpaUozMTYxR2I3dzd0NExuTEFPd0RYb05ZdGRVbW9EOHhuU1RjVG9RTTdS?=
 =?utf-8?B?bG9IMDloVVp2N1loOVR2bG5lZmN0YUV5TVNWdlcwczQxRzdFdmx0TDh5Z0Vz?=
 =?utf-8?B?d1ZuS1JpM1Jac2VnaC9mWUd5ald3UFNUbWwyOWhNYWE1KzBoUE13cCt6UW4x?=
 =?utf-8?B?c29hQXovcHp5dTI0Q1I4N3hzcTJjb29NRFZGQkd2aHF4U0hXTGJOZnplU1pF?=
 =?utf-8?B?YmtLZ01oUnExTitEMGY5WmhKVlZ6K2NJUHVvRFpGSGZidUNpMVdOYWo4K2JG?=
 =?utf-8?B?L2RyV3BHb2VYTHhLL0pUZkk1azh4Smg5ZlFoeGtHems4WEFsd2NzMG1lZ1lF?=
 =?utf-8?B?S0VLbE5XQS9IZHZzb3AwUlV2S2k5YjYweXQydUVJaEVyRFVYMlpkcWM1USs2?=
 =?utf-8?B?ckVOQXpIZ2ZDVzVoUk05ZlNGOElwaVBDOVFETDUyb29ZNjk1VGhqK3NxVHBS?=
 =?utf-8?B?Nk8xYlZhd2duRWRTZWNlNnFBUUczOGJncXg1YXhsRWZJenZrQ0JlZEorZ2Ji?=
 =?utf-8?B?ZWVONVVzSG1ZNFJlVnprWDJtcmRwTGVYczF2S2FxeStsM0NPZkN4bGlaRUlP?=
 =?utf-8?B?am9ETmQrdllsYjZnUEdFUElnVlAvNmxwLzBRK1ByRk9nam1yZC9CWExrNnNm?=
 =?utf-8?B?OWhieW80QnZGWThCY1lEQzRoUi9acGNZSkluU09LaFlWbi9aT0gzc3F0T3Fm?=
 =?utf-8?B?S1lyMFNZa015LzAvdDVmNmY4Qnh5cVpreGxlSk1Da1RUVTZnYUZFUDlXWUsy?=
 =?utf-8?B?ejdYNFBET1YwVjIycEhMR0dtU2JwWlVoM25iSytCc1RVZkhPcHYxK2xaRGRi?=
 =?utf-8?B?VDJ6YTB2WHhUQ0w1aVhFcmEyN2hDK0QxcXdOQ1JQaXJ2V011VkR5TGJDSW9E?=
 =?utf-8?B?LzNudytTa0hBdWRpb3AreFJ6RXUyMTJxZUc4dy9PUnVldGpMd25RaXJ0VHpF?=
 =?utf-8?B?T3J2NFUwaDBicTUvQklETVJaTndmcC9hQTFtMHFwVDBPWUcxYWlseGVTMDdq?=
 =?utf-8?B?b3lFTzdCL213eGZzY2pRcDc2aVluVnVISXhIWnNTT1grNCt3UGlSSnZvdW53?=
 =?utf-8?B?d01MWk94VWQ2WEd2bFRRVW00OHFmR2dIK2pZOWF0WVpJUWhMUEdKWjhoTDFL?=
 =?utf-8?B?Yzl3SVZ1VGFnUGljVllUcG96Kzg1cTIzM0xXOEVLTVlXNHF0U3NvME5vRE1O?=
 =?utf-8?Q?gWowLVETts0D8hguFM5xPRJfx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5afaa7-7e2c-43ef-8028-08de2c0db13c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 10:30:46.0845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwTTtJVVndc7qSJN2Qa536KzIDiTqGHhjftNEBqIl3C+1PXjTLn+4Xvwpzy1gD5N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5783
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_023051_633045_5345432D 
X-CRM114-Status: GOOD (  11.95  )
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



On 11/25/25 08:53, Tomas Melin wrote:
> This reverts commit 06d22ed6b6635b17551f386b50bb5aaff9b75fbe.
> 
> OP-TEE logic in U-Boot automatically injects a reserved-memory
> node along with optee firmware node to kernel device tree.
> The injection logic is dependent on that there is no manually
> defined optee node. Having the node in zynqmp.dtsi effectively
> breaks OP-TEE's insertion of the reserved-memory node, causing
> memory access violations during runtime.
> 
> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> ---
> For further information about the U-Boot logic related
> to this, see lib/optee/optee.c in U-Boot repository.

What's the behavior with EDK2?

U-Boot also have optee driver. How is it probed when you remove this node?

Thanks,
Michal



