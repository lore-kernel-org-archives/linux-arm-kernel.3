Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB61BCDC167
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cIukhywCborQLVARFynxTTSIWWJRj+Uh72cS664roM8=; b=IqeRDPgkufZwRnyHLAs6dadj+C
	wqQUJGwiTDM8xhWdIA8m09DH3wVHW1BZe7Eo9+JJEYNy8tZBDVMp96OjL3VH2mQvkAxLHv83yBS2L
	xi1Xki+2mjbJVa37uTCY1yQgoYu/2c+a26W0e8kibYeEz9WdyA6yNnIPOPZQ4w1+rzaW0phwPnWQg
	Th974By87uZxx4qjlXMCdftpWRPhD7ghxZGTAngS852hvysg+e7TPolY0ZhjuKZpEVOfDhmISsk/X
	kBL0cuiyJZhjy6c8B3aiNUIqi3h1XcgU6Hl4xpwZiKgBb5Erc3cjgQra2ckxq/qQ38kd7R/eGerNI
	RfeD9XBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5dh-0000000CvSd-10bE;
	Tue, 06 Jan 2026 11:54:17 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5de-0000000CvSE-0uTr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:54:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbNI91Im+ZFxpCX8l3Y6KwQUb2gg56KoljREAnHDOyDxh8Ex6jKqnakzKVrdoSqFjzeoYDIY2/8QmMZC+jEZ7otZt1QhQcFCOD7ejYzpiVCxx7vdV48ue91poLYdE0nHfz7BFpL+uhqykwYBrZ8+1GYWE7BwMGzVipsHDtitxc/NAdJ9QPmqCilX9ck5LY0rZ0bE9684Lvl3AIoXsJ0qQkb5uObCFE0Mykiu63taqXN8T/o9FEIR7QJ4ZmbC8WIvQk+KgmzHdHZ3vojKQnIcUOvymFgtuTkhBOLmvDSEuCZvYnByddoh/FS4fK21/rP+hDYzb1DeN+OBWwJIs8rCXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIukhywCborQLVARFynxTTSIWWJRj+Uh72cS664roM8=;
 b=x5CHd622Lnsc2mDxAMR9m/X6A0iiRRc52zg4yioFKg2yxjNAxSCMRZzN/Ia6SPDyKM2G2cZqxf/n2/gYSinXwrkdfe6rHeIlswhCcrc2T9tdQlAQkRyyOOvucoP6eOVIZOZkF7uizmHELKOduv/BwOoXmlWzqOgltf9PsV2YjclFf+tvljndjMyMuyQXceUDNRF/lA31SMKncXYFkrgOHDH2WhmM1uNYtDu5D1CEFOc5JfSezTdUawRbes+kxdh7rZXM9rFRpFBE3o3hy1o5WuswN1FvYeQKzs5srizqUvzOqpNvynIeCGXhE/zwLjXwfBnl1UGlNz7kF/14tbDwBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIukhywCborQLVARFynxTTSIWWJRj+Uh72cS664roM8=;
 b=EJfaHQFf/YqUoY/0NYM8xQ4NVJ+nf/05Iljkg8u8VUUUL3FCYppexQC3B1XFifiPCeqalYSJrCf0/9dyJWGv6AfYxbrtzTxSJJO4mBzICmP7J/txBl8t/LL4NYOQmQ17xaCLHIK4mwqj5HLKYHwfuQMVSI4pMdPrRSZ/azsHU3w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 11:54:09 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 11:54:09 +0000
Message-ID: <5262fa29-4094-4c5d-be3f-2c73ee322ef6@amd.com>
Date: Tue, 6 Jan 2026 12:54:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Coding Style: Format arch/arm/boot/dts/xilinx
To: kylebonnici <kylebonnici@proton.me>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kyle Bonnici <kylebonnici@hotmail.com>
References: <20251218125034.248-1-kylebonnici@proton.me>
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
In-Reply-To: <20251218125034.248-1-kylebonnici@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:a03:333::10) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|CY5PR12MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cde3021-4853-4502-9903-08de4d1a4d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEFSaDA3Q1lxMXRaYUNzcUJSeXhkR3RicDFYNVNRSEdFZjlmZ2cwOHkxcXpI?=
 =?utf-8?B?V0VlM3FUTzVJQmxDRkRVODBaVVVpVzlENkYxaTBoaTdBQmVUSnVrbkhVejRY?=
 =?utf-8?B?bmZlYTNsSmw2WGtwT3ZsUXdDNytTaDF5YnZzMDlWT24yUTRkaEVxUFpkN0s0?=
 =?utf-8?B?em5KU1pzMlVSRjNzNlZEckRtb1VKWWFDZ3BUV1V0bk4wVDZiRDhIZ2VKc0gw?=
 =?utf-8?B?QUtpeDEyemx6VmhSVmR6M01rYXk3QzJINVpEbHBsUHJ5YlVlVkhYVlZQZDda?=
 =?utf-8?B?VEEvZGJiS251WjQxSkRlaWlVQkhNb1NJT2N5WThLUmZUNVpNUFJFeCswazlI?=
 =?utf-8?B?Ykw0MjFjRHRieDJaWTBhZjl1Y2VZa2lCMGhnc1BBdEQzQUpLZE9JVVRNbzVo?=
 =?utf-8?B?SkFydElSVTlXWnZWbUlZQ1JKWm50em9WajhSa2p4UW15aC9oejlncldlaDJQ?=
 =?utf-8?B?MlcxbkxlMXZUTHpjYm5WMXpSSWJCdWxVUUN5Ky94NUtzT2FSVGZhQnlIaW5w?=
 =?utf-8?B?UWhUbTl6STNlNWNXeGoxU2kxMmQ5SWZvWkFiYWJESXlDVitwc0VzRjQzNjZK?=
 =?utf-8?B?cnlVMThMcE91S0FTTVpnZTRCRjhpRDFSUmM4OU9qZlZvUmNBNUowKzl6Qzd1?=
 =?utf-8?B?S0h1Zm5PQ2FUY1FlazRjeW5LUnk0UW9BejA0S3lSdU1tNXNiNnFsWHZoM01u?=
 =?utf-8?B?bnJ0cFJmV3prY1FJR0l5Tk5CUEd6N2lGcWJ5V0dzYmRRbmtMZFpGVDZPcUFi?=
 =?utf-8?B?eVVNSTM5WWI3SjViYVNrWmcrdFRFL2JWV005aGljMHN6eHhENlMxTzZkVjhT?=
 =?utf-8?B?YllRRUpZU2VkMVZyYTFJRzZwZ1ArYjlrKzNMRmxDaHdvWTBFeEE1K2FmZnZ3?=
 =?utf-8?B?cDJaQzB5bzRCcWNYRjE2Vkt4dmU0TnEvMkFUTEh3SkJRN2tzZHJGd3dyTzJN?=
 =?utf-8?B?S1RSQ2NGcVRKTlNHTmI2T2JraDJRY3cyQXBYTnJlNVAzNWFXdzV3bkkyNy9L?=
 =?utf-8?B?WTNsbWlTdEdUYVNCVms5STJmWEZVdHczS2x1dWNyUXF2dmgxcGJJVHRmZEQw?=
 =?utf-8?B?eDRSbGQ0TitUZjNrdnI3bGtVclE1ZUFzWCt1b2g5dW5LTDlza09rSjdQekpU?=
 =?utf-8?B?ZVNkOEh6ZEQ2L2lVaHA0dDZwWTgrTHRZMVUyOSt5MlIwVWRHS1p4ZEJLS29E?=
 =?utf-8?B?dElyZEx2QTNkMVFUMmtSU1JFa3FzQ1VWRDBKU21ta1hsaCtmSGpDYlFRRDhF?=
 =?utf-8?B?eWh4a1A5ZWNXOFB5bzVmZWtrdFlGU0pIRU10STRJNXhQZ3huR0dPK0M4ekpa?=
 =?utf-8?B?bm5sMnBKQnprQ250azU2K2dyNk9tUjFaOTZwYUdpYmplaUFXbmNRQ01WTlBS?=
 =?utf-8?B?NHFMdlF6SXl4UmtoUk1iR0V6R040eCtoL044a1o2bjlKV1pvMThURTRiZnAr?=
 =?utf-8?B?d3UySnFsL1UwTTJVMURma0ZaenVCZ0NRTmpycWVzb2VYZnkwRlhZdjVCUDdp?=
 =?utf-8?B?cmM4ZklZd3NKMG1iTGZ6ZVRrS0NoSmJvdU9FMlBwdWRISWh2QXBKdG9rV0xH?=
 =?utf-8?B?TXVWSUk5c2tUL2MvVzByRnhaV1RKMG1HYnBMWGhKNGJrQW01OGdUdUJCNkRK?=
 =?utf-8?B?UDJGd3R3WVZGSmRqUzZhRXBYM3YxNG50bDJ3K1FFSFpVRFlneDFBbER2OWls?=
 =?utf-8?B?Z3IyWktRcDgrSXNLNW1HQXRFTENBRk5OYmJ5RVNQRkFZcWxMcUg3WEUwNGpH?=
 =?utf-8?B?WVhCRnRyRnNlT09KaVZZNkRPWkFmV2ZzSHhPVlNyMllsRDhKN1JVZGk5bWwy?=
 =?utf-8?B?TDlOK3hXYUdONm1zc0VpWXMvWjZER00zOHRuTWZkL2JvLzV3V0lOT21zc1Iz?=
 =?utf-8?B?YVJMY2g3ZkdFbWhmTTdYc1ZBMThZWWNCdDQ1dmROcm02TWVhUlRaQk1Jd2xr?=
 =?utf-8?Q?x01w1vdv+encg7vJD6T8YyFkY2RAasUr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzlWOTU1K1BMakgwNDdDSUxOeGJ0VDBIR25WNEIxNmdpb2RzdDZ3Mkw3d0Vs?=
 =?utf-8?B?RUFDUmZZekdzeUM4U2lVTEsyQjZqdWRnKzZHc0ZkU3Vkbk9LT3RVMFFFYzdB?=
 =?utf-8?B?VUZ0ZFE0U2Fyb29xZnhZbHB4cGhCbmhFNU9ZRTZFSlZDekJpZmJLQVZrRGhl?=
 =?utf-8?B?V0pYdXkyTGN6Qk5ldmhhd3RMeFNDRS9OblpJcUlmUy9wWXZaUllNTzJSdFoy?=
 =?utf-8?B?UE94UjlEbUo2SS9BOUxURktzT3IwaDduWjFrcUd1MGRObXpJUHRiNWhmOFlp?=
 =?utf-8?B?RWV4UGZUYytYSkpoOEE4ZHpWZmR6UFc2MmdRTW1ZdzhESHRjVEMzSDdLZE9t?=
 =?utf-8?B?MTBxSUpoNHJNTW1RbFlkeSsxWDhFZkpBMmxqNWtKVnp2VjU5WFdoclZjcExC?=
 =?utf-8?B?VHVreWlSQ0dMUG5Kc21sZEdJZUNwQUZtdjNWNExnR0prWHhOK3JOU3VyNmg1?=
 =?utf-8?B?UjhnV1NZM3phRTZZT1JSVURrb05JRDhxRnArd2habDdaYmZTajUyakFodk82?=
 =?utf-8?B?Z2dRbTNNbHpYUUFuWHk0aFFnZVl5WWM5RlYxVFVkcDVKNE9ZSGhydU9FUXdn?=
 =?utf-8?B?d1JjbEZNTWg3V3BxK1l4NjdnQzRIWjNMRzM2a3k0RklMK3RRRmZMUU55WFp0?=
 =?utf-8?B?TXpSNkJXLzZ5aWxraktmOWxyZnFhdDE4MFZBOExoVmh2RTdrWGF0a3RuLzZO?=
 =?utf-8?B?WTdsVU0zZ1gyYWhvbnNkK0hPWHU1MkhsYkI1NUZqbFlEclorK2R6YWsxWXRZ?=
 =?utf-8?B?Zkgrc2NMWllKVmovUFdNc0tqTkZIWmNmcmFUZUUyYkpFSENUczVjL3NFTFd3?=
 =?utf-8?B?WVh3akQvdWJaMnRlNGtVTFFrM1pZVUludGlRNkg3bWRCaXBBY3BCdE1YQ05X?=
 =?utf-8?B?S0xLZ2k2cDNFZjBHd0dTWjB4Z3Z4TmJWckdxdGdXOXlCM3MyNmVsQXFqZis1?=
 =?utf-8?B?MDd4UERRL2I2eGVvQlMvS0FQTU9HalovWDVQRU9abFloZGlHbWZneExQeldN?=
 =?utf-8?B?aGFpWUpTU1IrMW1xNlRJYnlGSG1TaTU4RHIwZGUyYWJnWStaM01wMlVjM3hp?=
 =?utf-8?B?ZUdMamNiTzlMVTNEWm82SmRJV3lFTHRLLzcvN2VtYkZZSWZ2YmNLS1YrTWI5?=
 =?utf-8?B?L1dGMWVHaS9VbDYxeFNIZUVNR05wL1hiVmt5b1RTaWIva3ViK2FOOTNkRFlo?=
 =?utf-8?B?Mk5xMmE3alZJOXlYb0tmT25FOUN2VG85K3JQSk9hejE3cUZpSDNLejVlVXZH?=
 =?utf-8?B?YkRBOU1TbnVHVmNEa0RmcjR6MmJvMEFlcm9XTURIQmJrdk1pTTR4WWdYK1Fx?=
 =?utf-8?B?YXJLTEZpMUlqbFk3RmNxZzJHdTU5MHV4cjAwUG4wcDg5WEQ2bkpKWmE5am9D?=
 =?utf-8?B?OWNKLzBmdk5oOXhsVXBEQThETHh0b1RGYzBBVTQ0YXM3cWdERnZZSzVmK0VY?=
 =?utf-8?B?RHY0Mnc2UEhic1ZoeEw0VGd5VkpjWm82eDA4VFZSbko0TVQvTzViQTU5RzF1?=
 =?utf-8?B?K3pCam9NQ1ZKSzRPRnVKV2pWNHhqTTNPOWR2Z0hUdEYrL1FrVXdnNFlpQWZT?=
 =?utf-8?B?bVhrWUhQTmR1dDJ5cXF0M0poQU1ndG81bEIzYk53UFNoSlQybFNLTkFGYSs3?=
 =?utf-8?B?U0tWOGp0cUhCenFiU0VBYk9NMTdSZFVzK3kzSEtjTDlENGpZUVR0VFo3eldh?=
 =?utf-8?B?Sm1wSmV1MHBGSEl4N3NyQXZJWkhNNkd6eDQyZ0VscVBDWEcrcjMxejZLTTBN?=
 =?utf-8?B?UzdXZUZZdzR5ekRRcEhmSWd2aU1nSjZsWkFzWkNBQ0ZWZjRWWitMbjRJSFpR?=
 =?utf-8?B?Um1weHN3NWVDUjU0YXQvaFJuTmU3cGZjZDVTbDUvamxXM1o4TnRrb2hBV0JI?=
 =?utf-8?B?dHp6bnl0Qkh6aWY0SHVqb1VqV3J1eEdLWnJ5QXAyeGoxb2hvRDVzL1pvMUdJ?=
 =?utf-8?B?SWhGaFlHbFhnRitpYzYxdkl1RVJ3ZG9QaGRDWElBWUpTQWo2emE0UUZUSGdp?=
 =?utf-8?B?N1RraGhoN3FpenRzKzRGc1ZsQlQ5RDJIYW9hK2ZBSFVJbk1iaUxrdkNtRVE1?=
 =?utf-8?B?OHpWa0dmdUJxOVkrNXBXVlE1dHpoQ0pUa0U1ZUxyRVhoaVkzS21BWlZUaXQ1?=
 =?utf-8?B?ZTRmdUVNU29JNkE5QVU0dFdDT3cyUGhjWVFCMnVqTjB4L1lLd3k4a2lyWnVj?=
 =?utf-8?B?akJKM3pGVERmeUNsMlYvMndFeHFiTThuTHBOVnFJd09maW9VVjl1cGx5aFNW?=
 =?utf-8?B?NklvYU1lWm1scXRTSGQyajR2SmlHY2hneWdoS255NEFNSTlFS09oTzA3R1FQ?=
 =?utf-8?B?MjJCT3Z1c1YvQUV3WWpSWHhObTJwcVFaeldFUVNOaG52K2lXWDMvdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cde3021-4853-4502-9903-08de4d1a4d0f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:54:09.1460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnj0evOB7SfG6uJnI9EChL3YaMIHtkqLgg6oeEfoe6pFCjL4RedHHBhedyddG6jB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_035414_346832_3528F9A8 
X-CRM114-Status: GOOD (  22.21  )
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

Hi,

On 12/18/25 13:51, kylebonnici wrote:
> From: Kyle Bonnici <kylebonnici@hotmail.com>
> 
> - Convert hex value to lowercase
> - align property values to ' = '
> - clean up whitespaces
> - fix indentation
> - add new line between nodes
> 
> The changes are generated using the dts-linter.
> 
> This is just a sample of what the above tool can fix and this change is
> intended to start the conversation on how I should suggest fixes to this repo
> Without sending one big PR.
> 
> Also, this is my first attempt at such a submission. Hopefully I did not miss
> Anything fundamental in the submission process.

my issue is with subject. Where Coding Style: subsystem is not defined.

I tried your tool locally and I think handling in connection to long line should 
be improved.

But in general I don't have a problem to use any tool to do coding style 
formatting.

Newlines I don't really mind but lower case, additional spaces, tabs/spaces are 
nicely visible.

I think you should get ack from Rob, Krzysztof and Conor to run it in bigger scale.

Thanks,
Michal

> 
> Signed-off-by: Kyle Bonnici <kylebonnici@proton.me>
> ---
>   arch/arm/boot/dts/xilinx/zynq-7000.dtsi       | 72 +++++++++++--------
>   arch/arm/boot/dts/xilinx/zynq-cc108.dts       | 11 ++-
>   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts    |  1 +
>   arch/arm/boot/dts/xilinx/zynq-parallella.dts  |  7 +-
>   arch/arm/boot/dts/xilinx/zynq-zc702.dts       | 17 +++++
>   arch/arm/boot/dts/xilinx/zynq-zc706.dts       | 13 ++++
>   arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts | 10 +++
>   arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts |  5 ++
>   arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts |  6 ++
>   arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts |  8 +++
>   arch/arm/boot/dts/xilinx/zynq-zed.dts         |  7 ++
>   .../boot/dts/xilinx/zynq-zturn-common.dtsi    |  5 +-
>   12 files changed, 126 insertions(+), 36 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
> index 153b8d93cbee..dd8a6528e8a7 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
> @@ -27,10 +27,9 @@ cpu0: cpu@0 {
>   			clock-latency = <1000>;
>   			cpu0-supply = <&regulator_vccpint>;
>   			operating-points = <
> -				/* kHz    uV */
> -				666667  1000000
> -				333334  1000000
> -			>;
> +					    /* kHz    uV */
> +					    666667 1000000
> +					    333334 1000000>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -78,17 +77,21 @@ out-ports {
>   			/* replicator output ports */
>   			port@0 {
>   				reg = <0>;
> +
>   				replicator_out_port0: endpoint {
>   					remote-endpoint = <&tpiu_in_port>;
>   				};
>   			};
> +
>   			port@1 {
>   				reg = <1>;
> +
>   				replicator_out_port1: endpoint {
>   					remote-endpoint = <&etb_in_port>;
>   				};
>   			};
>   		};
> +
>   		in-ports {
>   			/* replicator input port */
>   			port {
> @@ -179,13 +182,13 @@ intc: interrupt-controller@f8f01000 {
>   			compatible = "arm,cortex-a9-gic";
>   			#interrupt-cells = <3>;
>   			interrupt-controller;
> -			reg = <0xF8F01000 0x1000>,
> -			      <0xF8F00100 0x100>;
> +			reg = <0xf8f01000 0x1000>,
> +			      <0xf8f00100 0x100>;
>   		};
>   
>   		L2: cache-controller@f8f02000 {
>   			compatible = "arm,pl310-cache";
> -			reg = <0xF8F02000 0x1000>;
> +			reg = <0xf8f02000 0x1000>;
>   			interrupts = <0 2 4>;
>   			arm,data-latency = <3 2 2>;
>   			arm,tag-latency = <2 2 2>;
> @@ -204,6 +207,7 @@ ocm: sram@fffc0000 {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges = <0 0xfffc0000 0x10000>;
> +
>   			ocm-sram@0 {
>   				reg = <0x0 0x10000>;
>   			};
> @@ -214,7 +218,7 @@ uart0: serial@e0000000 {
>   			status = "disabled";
>   			clocks = <&clkc 23>, <&clkc 40>;
>   			clock-names = "uart_clk", "pclk";
> -			reg = <0xE0000000 0x1000>;
> +			reg = <0xe0000000 0x1000>;
>   			interrupts = <0 27 4>;
>   		};
>   
> @@ -223,7 +227,7 @@ uart1: serial@e0001000 {
>   			status = "disabled";
>   			clocks = <&clkc 24>, <&clkc 41>;
>   			clock-names = "uart_clk", "pclk";
> -			reg = <0xE0001000 0x1000>;
> +			reg = <0xe0001000 0x1000>;
>   			interrupts = <0 50 4>;
>   		};
>   
> @@ -304,6 +308,7 @@ nfc0: nand-controller@0,0 {
>   				reg = <0 0 0x1000000>;
>   				status = "disabled";
>   			};
> +
>   			nor0: flash@1,0 {
>   				status = "disabled";
>   				compatible = "cfi-flash";
> @@ -336,24 +341,26 @@ slcr: slcr@f8000000 {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			compatible = "xlnx,zynq-slcr", "syscon", "simple-mfd";
> -			reg = <0xF8000000 0x1000>;
> +			reg = <0xf8000000 0x1000>;
>   			ranges;
> +
>   			clkc: clkc@100 {
>   				bootph-all;
>   				#clock-cells = <1>;
>   				compatible = "xlnx,ps7-clkc";
>   				fclk-enable = <0>;
>   				clock-output-names = "armpll", "ddrpll", "iopll", "cpu_6or4x",
> -						"cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x", "ddr3x",
> -						"dci", "lqspi", "smc", "pcap", "gem0", "gem1",
> -						"fclk0", "fclk1", "fclk2", "fclk3", "can0", "can1",
> -						"sdio0", "sdio1", "uart0", "uart1", "spi0", "spi1",
> -						"dma", "usb0_aper", "usb1_aper", "gem0_aper",
> -						"gem1_aper", "sdio0_aper", "sdio1_aper",
> -						"spi0_aper", "spi1_aper", "can0_aper", "can1_aper",
> -						"i2c0_aper", "i2c1_aper", "uart0_aper", "uart1_aper",
> -						"gpio_aper", "lqspi_aper", "smc_aper", "swdt",
> -						"dbg_trc", "dbg_apb";
> +						     "cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x",
> +						     "ddr3x", "dci", "lqspi", "smc", "pcap", "gem0",
> +						     "gem1", "fclk0", "fclk1", "fclk2", "fclk3",
> +						     "can0", "can1", "sdio0", "sdio1", "uart0",
> +						     "uart1", "spi0", "spi1", "dma", "usb0_aper",
> +						     "usb1_aper", "gem0_aper", "gem1_aper",
> +						     "sdio0_aper", "sdio1_aper", "spi0_aper",
> +						     "spi1_aper", "can0_aper", "can1_aper",
> +						     "i2c0_aper", "i2c1_aper", "uart0_aper",
> +						     "uart1_aper", "gpio_aper", "lqspi_aper",
> +						     "smc_aper", "swdt", "dbg_trc", "dbg_apb";
>   				reg = <0x100 0x100>;
>   			};
>   
> @@ -380,10 +387,10 @@ dmac_s: dma-controller@f8003000 {
>   			 * "dma4", "dma5", "dma6", "dma7";
>   			 */
>   			interrupts = <0 13 4>,
> -			             <0 14 4>, <0 15 4>,
> -			             <0 16 4>, <0 17 4>,
> -			             <0 40 4>, <0 41 4>,
> -			             <0 42 4>, <0 43 4>;
> +				     <0 14 4>, <0 15 4>,
> +				     <0 16 4>, <0 17 4>,
> +				     <0 40 4>, <0 41 4>,
> +				     <0 42 4>, <0 43 4>;
>   			#dma-cells = <1>;
>   			clocks = <&clkc 27>;
>   			clock-names = "apb_pclk";
> @@ -412,7 +419,7 @@ ttc0: timer@f8001000 {
>   			interrupts = <0 10 4>, <0 11 4>, <0 12 4>;
>   			compatible = "cdns,ttc";
>   			clocks = <&clkc 6>;
> -			reg = <0xF8001000 0x1000>;
> +			reg = <0xf8001000 0x1000>;
>   		};
>   
>   		ttc1: timer@f8002000 {
> @@ -420,7 +427,7 @@ ttc1: timer@f8002000 {
>   			interrupts = <0 37 4>, <0 38 4>, <0 39 4>;
>   			compatible = "cdns,ttc";
>   			clocks = <&clkc 6>;
> -			reg = <0xF8002000 0x1000>;
> +			reg = <0xf8002000 0x1000>;
>   		};
>   
>   		scutimer: timer@f8f00600 {
> @@ -466,6 +473,7 @@ etb@f8801000 {
>   			reg = <0xf8801000 0x1000>;
>   			clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
>   			clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
> +
>   			in-ports {
>   				port {
>   					etb_in_port: endpoint {
> @@ -480,6 +488,7 @@ tpiu@f8803000 {
>   			reg = <0xf8803000 0x1000>;
>   			clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
>   			clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
> +
>   			in-ports {
>   				port {
>   					tpiu_in_port: endpoint {
> @@ -499,8 +508,7 @@ funnel@f8804000 {
>   			out-ports {
>   				port {
>   					funnel_out_port: endpoint {
> -						remote-endpoint =
> -							<&replicator_in_port0>;
> +						remote-endpoint = <&replicator_in_port0>;
>   					};
>   				};
>   			};
> @@ -512,6 +520,7 @@ in-ports {
>   				/* funnel input ports */
>   				port@0 {
>   					reg = <0>;
> +
>   					funnel0_in_port0: endpoint {
>   						remote-endpoint = <&ptm0_out_port>;
>   					};
> @@ -519,6 +528,7 @@ funnel0_in_port0: endpoint {
>   
>   				port@1 {
>   					reg = <1>;
> +
>   					funnel0_in_port1: endpoint {
>   						remote-endpoint = <&ptm1_out_port>;
>   					};
> @@ -526,8 +536,8 @@ funnel0_in_port1: endpoint {
>   
>   				port@2 {
>   					reg = <2>;
> -					funnel0_in_port2: endpoint {
> -					};
> +
> +					funnel0_in_port2: endpoint {};
>   				};
>   				/* The other input ports are not connect to anything */
>   			};
> @@ -539,6 +549,7 @@ ptm@f889c000 {
>   			clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
>   			clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
>   			cpu = <&cpu0>;
> +
>   			out-ports {
>   				port {
>   					ptm0_out_port: endpoint {
> @@ -554,6 +565,7 @@ ptm@f889d000 {
>   			clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
>   			clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
>   			cpu = <&cpu1>;
> +
>   			out-ports {
>   				port {
>   					ptm1_out_port: endpoint {
> diff --git a/arch/arm/boot/dts/xilinx/zynq-cc108.dts b/arch/arm/boot/dts/xilinx/zynq-cc108.dts
> index f5525c048426..25828ba9fa16 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-cc108.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-cc108.dts
> @@ -55,6 +55,7 @@ ethernet_phy: ethernet-phy@1 {
>   &qspi {
>   	status = "okay";
>   	num-cs = <1>;
> +
>   	flash@0 { /* 16 MB */
>   		compatible = "jedec,spi-nor";
>   		reg = <0x0>;
> @@ -63,26 +64,32 @@ flash@0 { /* 16 MB */
>   		spi-rx-bus-width = <4>;
>   		#address-cells = <1>;
>   		#size-cells = <1>;
> +
>   		partition@0 {
>   			label = "qspi-fsbl-uboot-bs";
>   			reg = <0x0 0x400000>; /* 4MB */
>   		};
> +
>   		partition@400000 {
>   			label = "qspi-linux";
>   			reg = <0x400000 0x400000>; /* 4MB */
>   		};
> +
>   		partition@800000 {
>   			label = "qspi-rootfs";
>   			reg = <0x800000 0x400000>; /* 4MB */
>   		};
> +
>   		partition@c00000 {
>   			label = "qspi-devicetree";
>   			reg = <0xc00000 0x100000>; /* 1MB */
>   		};
> +
>   		partition@d00000 {
>   			label = "qspi-scratch";
>   			reg = <0xd00000 0x200000>; /* 2MB */
>   		};
> +
>   		partition@f00000 {
>   			label = "qspi-uboot-env";
>   			reg = <0xf00000 0x100000>; /* 1MB */
> @@ -92,8 +99,8 @@ partition@f00000 {
>   
>   &sdhci1 {
>   	status = "okay";
> -	broken-cd ;
> -	wp-inverted ;
> +	broken-cd;
> +	wp-inverted;
>   };
>   
>   &uart0 {
> diff --git a/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts b/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
> index 14f644156a6f..d4c07d28ec25 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
> @@ -53,6 +53,7 @@ &nfc0 {
>   
>   	#address-cells = <1>;
>   	#size-cells = <0>;
> +
>   	nand@0 {
>   		reg = <0>;
>   	};
> diff --git a/arch/arm/boot/dts/xilinx/zynq-parallella.dts b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
> index 366af4fcf8d9..e498feaa7ca4 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-parallella.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
> @@ -44,10 +44,10 @@ &gem0 {
>   	ethernet_phy: ethernet-phy@0 {
>   		/* Marvell 88E1318 */
>   		compatible = "ethernet-phy-id0141.0e90",
> -		             "ethernet-phy-ieee802.3-c22";
> +			     "ethernet-phy-ieee802.3-c22";
>   		reg = <0>;
>   		marvell,reg-init = <0x3 0x10 0xff00 0x1e>,
> -		                   <0x3 0x11 0xfff0 0xa>;
> +				   <0x3 0x11 0xfff0 0xa>;
>   	};
>   };
>   
> @@ -63,13 +63,16 @@ dcd1 {
>   				regulator-name = "VDD_DSP";
>   				regulator-always-on;
>   			};
> +
>   			dcd2 {
>   				regulator-name = "1P35V";
>   				regulator-always-on;
>   			};
> +
>   			ldo1 {
>   				regulator-name = "VDD_ADJ";
>   			};
> +
>   			ldo2 {
>   				regulator-name = "VDD_GPIO";
>   				regulator-always-on;
> diff --git a/arch/arm/boot/dts/xilinx/zynq-zc702.dts b/arch/arm/boot/dts/xilinx/zynq-zc702.dts
> index 6955637c5b1a..63eded827b37 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-zc702.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-zc702.dts
> @@ -34,6 +34,7 @@ chosen {
>   	gpio-keys {
>   		compatible = "gpio-keys";
>   		autorepeat;
> +
>   		switch-14 {
>   			label = "sw14";
>   			gpios = <&gpio0 12 0>;
> @@ -41,6 +42,7 @@ switch-14 {
>   			wakeup-source;
>   			autorepeat;
>   		};
> +
>   		switch-13 {
>   			label = "sw13";
>   			gpios = <&gpio0 14 0>;
> @@ -112,6 +114,7 @@ i2c@0 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			reg = <0>;
> +
>   			si570: clock-generator@5d {
>   				#clock-cells = <0>;
>   				compatible = "silabs,si570";
> @@ -126,6 +129,7 @@ i2c@1 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			reg = <1>;
> +
>   			adv7511: hdmi-tx@39 {
>   				compatible = "adi,adv7511";
>   				reg = <0x39>;
> @@ -141,6 +145,7 @@ i2c@2 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			reg = <2>;
> +
>   			eeprom: eeprom@54 {
>   				compatible = "atmel,24c08";
>   				reg = <0x54>;
> @@ -151,6 +156,7 @@ i2c@3 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			reg = <3>;
> +
>   			gpio@21 {
>   				compatible = "ti,tca6416";
>   				reg = <0x21>;
> @@ -163,6 +169,7 @@ i2c@4 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			reg = <4>;
> +
>   			rtc: rtc@51 {
>   				compatible = "nxp,pcf8563";
>   				reg = <0x51>;
> @@ -173,14 +180,17 @@ i2c@7 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			reg = <7>;
> +
>   			hwmon@34 {
>   				compatible = "ti,ucd9248";
>   				reg = <0x34>;
>   			};
> +
>   			hwmon@35 {
>   				compatible = "ti,ucd9248";
>   				reg = <0x35>;
>   			};
> +
>   			hwmon@36 {
>   				compatible = "ti,ucd9248";
>   				reg = <0x36>;
> @@ -396,32 +406,39 @@ &qspi {
>   	bootph-all;
>   	status = "okay";
>   	num-cs = <1>;
> +
>   	flash@0 {
>   		compatible = "jedec,spi-nor";
>   		reg = <0x0>;
>   		spi-tx-bus-width = <1>;
>   		spi-rx-bus-width = <4>;
>   		spi-max-frequency = <50000000>;
> +
>   		partitions {
>   			compatible = "fixed-partitions";
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> +
>   			partition@0 {
>   				label = "qspi-fsbl-uboot";
>   				reg = <0x0 0x100000>;
>   			};
> +
>   			partition@100000 {
>   				label = "qspi-linux";
>   				reg = <0x100000 0x500000>;
>   			};
> +
>   			partition@600000 {
>   				label = "qspi-device-tree";
>   				reg = <0x600000 0x20000>;
>   			};
> +
>   			partition@620000 {
>   				label = "qspi-rootfs";
>   				reg = <0x620000 0x5e0000>;
>   			};
> +
>   			partition@c00000 {
>   				label = "qspi-bitstream";
>   				reg = <0xc00000 0x400000>;
> diff --git a/arch/arm/boot/dts/xilinx/zynq-zc706.dts b/arch/arm/boot/dts/xilinx/zynq-zc706.dts
> index 3b803c698473..d6447e544d8f 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-zc706.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-zc706.dts
> @@ -73,6 +73,7 @@ i2c@0 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			reg = <0>;
> +
>   			si570: clock-generator@5d {
>   				#clock-cells = <0>;
>   				compatible = "silabs,si570";
> @@ -87,6 +88,7 @@ i2c@1 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			reg = <1>;
> +
>   			adv7511: hdmi-tx@39 {
>   				compatible = "adi,adv7511";
>   				reg = <0x39>;
> @@ -102,6 +104,7 @@ i2c@2 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			reg = <2>;
> +
>   			eeprom: eeprom@54 {
>   				compatible = "atmel,24c08";
>   				reg = <0x54>;
> @@ -112,6 +115,7 @@ i2c@3 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			reg = <3>;
> +
>   			gpio@21 {
>   				compatible = "ti,tca6416";
>   				reg = <0x21>;
> @@ -124,6 +128,7 @@ i2c@4 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			reg = <4>;
> +
>   			rtc: rtc@51 {
>   				compatible = "nxp,pcf8563";
>   				reg = <0x51>;
> @@ -134,6 +139,7 @@ i2c@7 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			reg = <7>;
> +
>   			ucd90120@65 {
>   				compatible = "ti,ucd90120";
>   				reg = <0x65>;
> @@ -309,6 +315,7 @@ &qspi {
>   	bootph-all;
>   	status = "okay";
>   	num-cs = <2>;
> +
>   	flash@0 {
>   		compatible = "jedec,spi-nor";
>   		reg = <0>, <1>;
> @@ -316,26 +323,32 @@ flash@0 {
>   		spi-tx-bus-width = <1>;
>   		spi-rx-bus-width = <4>;
>   		spi-max-frequency = <50000000>;
> +
>   		partitions {
>   			compatible = "fixed-partitions";
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> +
>   			partition@0 {
>   				label = "qspi-fsbl-uboot";
>   				reg = <0x0 0x100000>;
>   			};
> +
>   			partition@100000 {
>   				label = "qspi-linux";
>   				reg = <0x100000 0x500000>;
>   			};
> +
>   			partition@600000 {
>   				label = "qspi-device-tree";
>   				reg = <0x600000 0x20000>;
>   			};
> +
>   			partition@620000 {
>   				label = "qspi-rootfs";
>   				reg = <0x620000 0x5e0000>;
>   			};
> +
>   			partition@c00000 {
>   				label = "qspi-bitstream";
>   				reg = <0xc00000 0x400000>;
> diff --git a/arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts b/arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts
> index 5fe799c3c7cf..4929a5aa1678 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts
> @@ -62,32 +62,39 @@ eeprom: eeprom@52 {
>   &qspi {
>   	status = "okay";
>   	num-cs = <1>;
> +
>   	flash@0 {
>   		compatible = "jedec,spi-nor";
>   		reg = <0x0>;
>   		spi-tx-bus-width = <1>;
>   		spi-rx-bus-width = <4>;
>   		spi-max-frequency = <50000000>;
> +
>   		partitions {
>   			compatible = "fixed-partitions";
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> +
>   			partition@0 {
>   				label = "qspi-fsbl-uboot";
>   				reg = <0x0 0x100000>;
>   			};
> +
>   			partition@100000 {
>   				label = "qspi-linux";
>   				reg = <0x100000 0x500000>;
>   			};
> +
>   			partition@600000 {
>   				label = "qspi-device-tree";
>   				reg = <0x600000 0x20000>;
>   			};
> +
>   			partition@620000 {
>   				label = "qspi-rootfs";
>   				reg = <0x620000 0x5e0000>;
>   			};
> +
>   			partition@c00000 {
>   				label = "qspi-bitstream";
>   				reg = <0xc00000 0x400000>;
> @@ -104,14 +111,17 @@ &spi1 {
>   	status = "okay";
>   	num-cs = <4>;
>   	is-decoded-cs = <0>;
> +
>   	flash@1 {
>   		compatible = "sst25wf080", "jedec,spi-nor";
>   		reg = <1>;
>   		spi-max-frequency = <1000000>;
> +
>   		partitions {
>   			compatible = "fixed-partitions";
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> +
>   			partition@0 {
>   				label = "data";
>   				reg = <0x0 0x100000>;
> diff --git a/arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts b/arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts
> index f9a086fe66d3..d4e739772d7b 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts
> @@ -51,20 +51,25 @@ &nfc0 {
>   	status = "okay";
>   	#address-cells = <1>;
>   	#size-cells = <0>;
> +
>   	nand@0 {
>   		reg = <0>;
> +
>   		partitions {
>   			compatible = "fixed-partitions";
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> +
>   			partition@0 {
>   				label = "nand-fsbl-uboot";
>   				reg = <0x0 0x1000000>;
>   			};
> +
>   			partition@1000000 {
>   				label = "nand-linux";
>   				reg = <0x1000000 0x2000000>;
>   			};
> +
>   			partition@3000000 {
>   				label = "nand-rootfs";
>   				reg = <0x3000000 0x200000>;
> diff --git a/arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts b/arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts
> index 24520e7d3965..32422aed77a3 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts
> @@ -56,26 +56,32 @@ eeprom1: eeprom@52 {
>   &nor0 {
>   	status = "okay";
>   	bank-width = <1>;
> +
>   	partitions {
>   		compatible = "fixed-partitions";
>   		#address-cells = <1>;
>   		#size-cells = <1>;
> +
>   		partition@0 {
>   			label = "nor-fsbl-uboot";
>   			reg = <0x0 0x100000>;
>   		};
> +
>   		partition@100000 {
>   			label = "nor-linux";
>   			reg = <0x100000 0x500000>;
>   		};
> +
>   		partition@600000 {
>   			label = "nor-device-tree";
>   			reg = <0x600000 0x20000>;
>   		};
> +
>   		partition@620000 {
>   			label = "nor-rootfs";
>   			reg = <0x620000 0x5e0000>;
>   		};
> +
>   		partition@c00000 {
>   			label = "nor-bitstream";
>   			reg = <0xc00000 0x400000>;
> diff --git a/arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts b/arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts
> index 103e87ea7253..9c94421bf650 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts
> @@ -61,6 +61,7 @@ si570: clock-generator@55 {
>   &qspi {
>   	status = "okay";
>   	num-cs = <2>;
> +
>   	flash@0 {
>   		compatible = "jedec,spi-nor";
>   		reg = <0>, <1>;
> @@ -68,26 +69,32 @@ flash@0 {
>   		spi-tx-bus-width = <1>;
>   		spi-rx-bus-width = <4>;
>   		spi-max-frequency = <50000000>;
> +
>   		partitions {
>   			compatible = "fixed-partitions";
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> +
>   			partition@0 {
>   				label = "qspi-fsbl-uboot";
>   				reg = <0x0 0x100000>;
>   			};
> +
>   			partition@100000 {
>   				label = "qspi-linux";
>   				reg = <0x100000 0x500000>;
>   			};
> +
>   			partition@600000 {
>   				label = "qspi-device-tree";
>   				reg = <0x600000 0x20000>;
>   			};
> +
>   			partition@620000 {
>   				label = "qspi-rootfs";
>   				reg = <0x620000 0x5e0000>;
>   			};
> +
>   			partition@c00000 {
>   				label = "qspi-bitstream";
>   				reg = <0xc00000 0x400000>;
> @@ -100,6 +107,7 @@ &spi0 {
>   	status = "okay";
>   	num-cs = <4>;
>   	is-decoded-cs = <0>;
> +
>   	eeprom: eeprom@2 {
>   		compatible = "atmel,at25";
>   		reg = <2>;
> diff --git a/arch/arm/boot/dts/xilinx/zynq-zed.dts b/arch/arm/boot/dts/xilinx/zynq-zed.dts
> index 52ba569b2b9f..dd46d71e3f36 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-zed.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-zed.dts
> @@ -51,6 +51,7 @@ &qspi {
>   	bootph-all;
>   	status = "okay";
>   	num-cs = <1>;
> +
>   	flash@0 {
>   		compatible = "jedec,spi-nor";
>   		reg = <0>;
> @@ -58,26 +59,32 @@ flash@0 {
>   		spi-rx-bus-width = <4>;
>   		spi-max-frequency = <50000000>;
>   		m25p,fast-read;
> +
>   		partitions {
>   			compatible = "fixed-partitions";
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> +
>   			partition@0 {
>   				label = "qspi-fsbl-uboot";
>   				reg = <0x0 0x100000>;
>   			};
> +
>   			partition@100000 {
>   				label = "qspi-linux";
>   				reg = <0x100000 0x500000>;
>   			};
> +
>   			partition@600000 {
>   				label = "qspi-device-tree";
>   				reg = <0x600000 0x20000>;
>   			};
> +
>   			partition@620000 {
>   				label = "qspi-rootfs";
>   				reg = <0x620000 0x5e0000>;
>   			};
> +
>   			partition@c00000 {
>   				label = "qspi-bitstream";
>   				reg = <0xc00000 0x400000>;
> diff --git a/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi b/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
> index defef9c8da13..57e6cda1a798 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
> +++ b/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
> @@ -33,6 +33,7 @@ chosen {
>   
>   	gpio-leds {
>   		compatible = "gpio-leds";
> +
>   		usr-led1 {
>   			label = "usr-led1";
>   			gpios = <&gpio0 0x0 0x1>;
> @@ -49,6 +50,7 @@ usr-led2 {
>   	gpio-keys {
>   		compatible = "gpio-keys";
>   		autorepeat;
> +
>   		key {
>   			label = "K1";
>   			gpios = <&gpio0 0x32 0x1>;
> @@ -73,8 +75,7 @@ &gem0 {
>   	phy-mode = "rgmii-id";
>   	phy-handle = <&ethernet_phy>;
>   
> -	ethernet_phy: ethernet-phy@0 {
> -	};
> +	ethernet_phy: ethernet-phy@0 {};
>   };
>   
>   &sdhci0 {


