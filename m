Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A5DC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sd1fzw1o9aRU/VThlOgeuB9BaGKtB9ZF31lhK8HxMlg=; b=hy9BRJz0XaC0bktLa8j3Ku8TmL
	PrEKIguzZgT6Z6Yp7+iKpMCk9wTUALxQeDHf60z5UtUSdHkOrDUybT+XxWNmTQDuL5ne0rK4xfCM1
	7NSY3mWl1Jh0a6M2XYd3P3kgChu0/8ky/Hj/F5yxv0oejTzvKL90+q8C6biaQ3LG6CokF2BHlITAc
	UfirfLeG9WPCMAx+gEqrTQGP2JOl71GuUsClHulia18kUQyzl/c7ckHL534gqxCHTiKuaiJagXH0p
	d8yEWl+9/W8lh0s6FF0Ty6XTL771AMwo6VseI5cqjtGrRZ+oS9aqo31zw27zWbUUA6hmnY/W4k6o3
	D+LGX3SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnIY-00000006ife-1j2h;
	Mon, 20 Jul 2026 12:40:42 +0000
Received: from mail-southcentralusazon11012009.outbound.protection.outlook.com ([40.93.195.9] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnIU-00000006iei-3VM1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 12:40:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tB52AISD9B3yBjl6U30y9aGgPUaMQcxF8v3yQuHQ5/88H6wDpJlxrIAOnEIkjNTQoERtfKuukP84aExxS0T91sQdX3+TZDapqFAFrB4NK1ZpeYfC8B9XKKeyC9WF2RxyIlDB5iZuPjQaLjiGKeSTzvQtyPnt08qfbp+Zz/7co7rDw5HlCU1Pc2acsMj1/qvKrnLR2VD3Y2NGGgO1z++iStQMbyFqXdrQSaaqQBquMjBKPv7QZarabUm1vbRXipuY16BFKJjShrSPiAAFz7sZwFkgAG6l1KPpVKWj3A08vTh8xj36425oEgNJO3EMdPEW0xChzqJH8Hg60vqdYytbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sd1fzw1o9aRU/VThlOgeuB9BaGKtB9ZF31lhK8HxMlg=;
 b=ChTIxyjzV95Tj8gewsLgZLRG4bBKgA4cbJ2UDRv4I5PpM74rh0bsb+CgFnwG9wyWrlMj+iATOoClDUb4r/SK+AtYJNlqBTXYlBemr5MW0FWBMJYITHbP8hW+7IJczh4GoAnhUbJBxgU+2neMaQekJopb/jM0J8uAQkwPGiTnazNDrS94nFReGwHqnex0cmMulheZoZJKeUIbRn7uaEyNJbrLQp3IK+o6u4QNJLjv6zYKwGR4jh/gnGPFmGO5REgd6aEnQKRkM+2XFtcQs7zbdWUwmPf33lmkTlisz6ESfTejEp0SM0P4fhLq2CxfTiBld58lNEYlibpfR3Sq5ydIcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sd1fzw1o9aRU/VThlOgeuB9BaGKtB9ZF31lhK8HxMlg=;
 b=SEbdNRT27Z2AH7JKm5rtd4GI5WrMh9DZTfX9Ca4+okkTfjfHozfsXXrSozNCgsTntJTEKFeKhWNGa/xX+03rD6iKfrZ/MsUAgkhnu9OCVoArrLf8Ul58b4EnbbRussH/+Ipjaononm2VwfiBeWOpunjvGcgICpvJKOwSYJkBoMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by BL3PR12MB6404.namprd12.prod.outlook.com (2603:10b6:208:3b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 12:40:26 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 12:40:26 +0000
Message-ID: <dad54c5f-34d1-4aab-bf7c-590ed5f638e6@amd.com>
Date: Mon, 20 Jul 2026 14:40:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] driver: fpga: xilinx-selectmap: add csi and rdwr
 support
To: Heiko Schocher <hs@nabladev.com>, linux-kernel@vger.kernel.org
Cc: linux-fpga@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Xu Yilun <yilun.xu@intel.com>
References: <20260716070020.4113618-1-hs@nabladev.com>
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
In-Reply-To: <20260716070020.4113618-1-hs@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0047.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::22) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|BL3PR12MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: a2dc34b4-88dc-4375-3f7a-08dee65c130d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hTX8ADJTRWcXt87+9Qp+ALoEyEJBENHS9jKgLmpvV8x0qlATj9wtzpdzQCxsuonF4Gjnbxgz9eDw2s8j9/qSRWCguvP21GDCDVRCmjhMjYcn8ukO0hI2Dw9uQC1mrinOTvz44jdomHeX+2rp3LBEG3d8sksUsNY2kR2rXajLMjHY6vl/E73lfsb0/ViqZfYctEl7xoUH+JpiX911FVW41eTEtdOs5tNwvz/cXthbrqDZVfhwzv/Q9AWcKY4IPoEWy18FyXFUAhIvLtydxGFBXF33/VnTxQumG5LOBP9sRwcEPGKPnF1gKaGBmfO4PhqDivBfuUrdY61v/TfLhFwlccoUf+sERHSUaYPikJJAsjIiPVkBQlIXGZKR3u8siPJr+2Nv7oSwotKt2wP9dwgFEDmLpI56jVEKKeCmVelelhzhDGwEcJJoymdXEaei0/fXBvnojj0jCmM9ZlgPQ8lPMFGFTCC0/y+2fjrpI4AdmgJUGYUnfAWO9Rt89ZbDR5ztjNzqs/hz8UN/uRcc8h1kgmzNbMga3b1cEw6Mwf3j/3bdwO9vqW/P60XVofRdywQ5eJ/gH+/5sd8X7jDfRyxVwYvC5gG9WliOENFu+TZg/5JtHPjfkgvfhbtpMO+z4Ct6Bsv6r6i/GTSISzlk/4J4XB873FflFWKrhDSFeFv3Z5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVBLRzVYRzZmN3lyV05TamNKSHlvSzdKV3ZabDNXbnJqd1VTejUzMVoxQTNJ?=
 =?utf-8?B?Y2puaktWak9haGxFK1lCYVN2UlluM3lkY201Ym16V1RxTGpQcDdhTzFqVnQ4?=
 =?utf-8?B?dmJHdVFpV1R4cXcxR3l6cCt6QjhlenNJMVh5dFI4Ym51Tlc0MHZvSGc1aUtO?=
 =?utf-8?B?VWQyTjJ3QkQ4Q0FRRDUyVE9yemdDS1I5WlZHWTlYb2o0bzJreEFRK083V0d1?=
 =?utf-8?B?ZjN1OXJOS0hoY1lqQ01oQ096UE9nNFQ5Yk80cjlhdS9rK2NOZjlkVHdEK0pp?=
 =?utf-8?B?b0UzTlZGdmE4d0l1eDZoVy9tMGtXMHJRRHQ0NXloUHFZbWR0cVU3TmxOQlBE?=
 =?utf-8?B?alg3ZjJseEpHTS80UWo1QnpvZlR3Rm9mLytEUm1yaEZyQkF2RjQ5YUR2Q3Z2?=
 =?utf-8?B?djRTRnE5VVkzamZ3dWduWjkxMjI0NDJIMW94YXpnTDJKZm1jODQrc20yNStx?=
 =?utf-8?B?TE1BS1BQYW8zVjhUNFdqM1A3R3NRQzBxR0JPNzV0VCtlT3oyM0pIcVljL1lv?=
 =?utf-8?B?eTVZbVNibHFHZTZ2anZZL0Mwa2p4ZDdScHliM2xrbzJiZlByQ0R0T2xRdEpL?=
 =?utf-8?B?Mm1XaGV4aElkNXJEdkVJQ2s3dEFQcVhqbStYZXlKc1phdmpVR3RxaGJNeU9o?=
 =?utf-8?B?MWorRDZDdERSZ28rdXA0ejZvV0l0QjlaM2tpS3p3Q3lJM3gyZVVoTFprV2Jo?=
 =?utf-8?B?TkVyNm5ZcXdDbTZWODdvU1dFc2RFVHQrbkc1WHM0eWFzb0FxTllqUjM3dkhZ?=
 =?utf-8?B?TGxWLytVdm5VOEZhUEFPTmlsM3BNTFJCOHRFT3JRZHZCbmlVQlpOS3VEK0xi?=
 =?utf-8?B?eVdhQmFXV1YxSGVHNlpiUm94ZnNndDNhdVZ4U3ZBeHRia3c2SlBXUEVwS1lO?=
 =?utf-8?B?dGJUc2IxTGJwSHZ0Wm1CYVZqczBMWDV4Wjh5Y3FYYXJBYVRMbzQwUzhyaXVO?=
 =?utf-8?B?aDFqaGdCMWxhYWtwTXduS09neGZTOWJneC93TlJIQXlNNlduMHNwT0xNMXNt?=
 =?utf-8?B?RHp1UnZzRVluN0FFaUJsQS9IUlR0cGU0VWJSOExKQXdNQTVIUU1mdTlxRDBw?=
 =?utf-8?B?TWVHaUdWcng1OXE3US9rSURPbWRNNkFJT2YrbTlxUnQ3OUFMTlg0emtKMUt1?=
 =?utf-8?B?ai84RmNwajhRMXBHUS9kMGxyS2FpeFBEQXdsVEppbHhYQ0ZTeWJFOUFNcWxi?=
 =?utf-8?B?YkU2WkZMaTZEYnFkY3hPb05xT1htSDRMSWEvWmRCOHlUbUpwaWNBMGpnVlFs?=
 =?utf-8?B?TEpMWUJHSm1HUlpIYzVBbHpzTUpTd2VZWDROZUdRT3puT2hVV2ovOVJZNElS?=
 =?utf-8?B?OXd5US9WTFBXVjhjTnM4dXdJVHEzQmM1eWV2TDVsUVVzYmw4c2JhaktjbFU3?=
 =?utf-8?B?akplUkV1cGhqUEprUENkNXlTTGxxK3RkcE50b0xrU2FWam5NTmEzNUZ2RXdx?=
 =?utf-8?B?SytTa0oreG5XWktXK2lad0pROWlkbVlhVlF3YUFPcDFkSXJlM0l3YkVPSWN4?=
 =?utf-8?B?cnYxMHU3d0Zwb0l2Tys4NTZWeE9LdmZuWFpMWEkzZ0ZHd0JlQm4xSjk0c0E3?=
 =?utf-8?B?QUJCbHdHK2FUZmlXZzBaS2s5Ynpxam9ZaGdJc0xMYjJMOUgwdHBwd1FxS05H?=
 =?utf-8?B?NHlheXNaMktNWXp1VHplZkIzS2x1NkRvRWNyOXNYRkc0eG15eGdHOXFLS3Fk?=
 =?utf-8?B?b0hJYThyNVNFZ3FQaWdGdDJzSTRXNXpIUXdoN2l0Q1IraFZCa2RRekNMRWdr?=
 =?utf-8?B?U1A3VGpvRVRmL2hNVmVFVURNU2FMMlNUaVNIZnM1cDkxRkdKbXAyUWlCbUxM?=
 =?utf-8?B?aExOQzJrUkcvb2dMQURIaU5BNlZRN1Z6VnJ5R25CWi9kZlpOVG9ZTGhMY1F0?=
 =?utf-8?B?WVNheTZ4Nlp6eUg2OVcwdUUraERPbGlObXR2RnZrVnZXQjZjUnlDM3Q5SHgr?=
 =?utf-8?B?Wm9GVEJXS05KOFdweFl0RXM3cEE1ZzNETUhzNzBoNksvdEdqZ1JjZU4zWnZu?=
 =?utf-8?B?UjdiZHJoY0pBVUdsV1pRVlNNUVY2bHZIYUZNcWpNOUluVjRhMFRBeXJxRHJ1?=
 =?utf-8?B?Wm96M0JNZ2FablRJTkZrZVEwUlZaV2MvekxoWTMxMVZIQmRXQnRpZU9DaE5v?=
 =?utf-8?B?MCs2SkkxVnl4SFJwMmh5QjFobFFZNXY3V3ZlSklrUklEUEZsdHZCa3BsRjBR?=
 =?utf-8?B?dTRGdEt1ZTN6VHFUTEZOakhCMS83cVZKbmpyQ0QxUWpiRlF0RUFaVFJyVmRn?=
 =?utf-8?B?TWMvN25jbTZUTGRpTFEzbU5oNTllZCtweFdtbERFTkJEbTYzb21TUDcyY1lV?=
 =?utf-8?B?LzJ1cVNpcURzbFVkaEZVQW5Gc2x2eGQ1WVhqZ1hRNzdXSGtzVnlrdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2dc34b4-88dc-4375-3f7a-08dee65c130d
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 12:40:26.5349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7P80Zi/NWpze51uz5/Jyy5rqojjVqvXX+phIQowKQEOjczNB8zOjyjL0MuR6tKmv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6404
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_054039_031544_9AFD88DA 
X-CRM114-Status: GOOD (  23.93  )
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



On 7/16/26 09:00, Heiko Schocher wrote:
> Add csi_b and rdwr pin support for the xilinx,selectmap driver.
> 
> In current driver the pins are configured from DTS and set to
> GPIOD_OUT_HIGH. This works in case you have one FPGA.
> 
> Extend this to really implement csi_b and rdwr pin function in
> driver, so it works with more than one FPGA.
> 
> Tested on AM625 based board with 2 FPGAs connected to GPMC.
> 
> Signed-off-by: Heiko Schocher <hs@nabladev.com>
> ---
> 
>   drivers/fpga/xilinx-selectmap.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/fpga/xilinx-selectmap.c b/drivers/fpga/xilinx-selectmap.c
> index d0cbb5fdfe3a..b5fbdedf8aec 100644
> --- a/drivers/fpga/xilinx-selectmap.c
> +++ b/drivers/fpga/xilinx-selectmap.c
> @@ -19,6 +19,8 @@
>   struct xilinx_selectmap_conf {
>   	struct xilinx_fpga_core core;
>   	void __iomem *base;
> +	struct gpio_desc *csi_b;
> +	struct gpio_desc *rdwr_b;
>   };
>   
>   #define to_xilinx_selectmap_conf(obj) \
> @@ -30,9 +32,21 @@ static int xilinx_selectmap_write(struct xilinx_fpga_core *core,
>   	struct xilinx_selectmap_conf *conf = to_xilinx_selectmap_conf(core);
>   	size_t i;
>   
> +	if (conf->csi_b)

Is this really needed?

4023 int gpiod_set_value(struct gpio_desc *desc, int value)
4024 {
4025         VALIDATE_DESC(desc);
4026         /* Should be using gpiod_set_value_cansleep() */
4027         WARN_ON(desc->gdev->can_sleep);
4028         return gpiod_set_value_nocheck(desc, value);
4029 }
4030 EXPORT_SYMBOL_GPL(gpiod_set_value);

  398 #define VALIDATE_DESC(desc) do { \
  399         int __valid = validate_desc(desc, __func__); \
  400         if (__valid <= 0) \
  401                 return __valid; \
  402         } while (0)

  385 static int validate_desc(const struct gpio_desc *desc, const char *func)
  386 {
  387         if (!desc)
  388                 return 0;
  389
  390         if (IS_ERR(desc)) {
  391                 pr_warn("%s: invalid GPIO (errorpointer: %pe)\n", func, desc);
  392                 return PTR_ERR(desc);
  393         }
  394
  395         return 1;
  396 }
  397

You should be able to just skip it because validate_desc is checking it for you.



> +		gpiod_set_value(conf->csi_b, GPIOD_OUT_HIGH);
> +
> +	if (conf->rdwr_b)
> +		gpiod_set_value(conf->rdwr_b, GPIOD_OUT_HIGH);
> +
>   	for (i = 0; i < count; ++i)
>   		writeb(buf[i], conf->base);
>   
> +	if (conf->rdwr_b)
> +		gpiod_set_value(conf->rdwr_b, GPIOD_OUT_LOW);
> +
> +	if (conf->csi_b)
> +		gpiod_set_value(conf->csi_b, GPIOD_OUT_LOW);
> +
>   	return 0;
>   }
>   
> @@ -56,16 +70,18 @@ static int xilinx_selectmap_probe(struct platform_device *pdev)
>   	conf->base = base;
>   
>   	/* CSI_B is active low */
> -	gpio = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_HIGH);
> +	gpio = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_LOW);
>   	if (IS_ERR(gpio))
>   		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
>   				     "Failed to get CSI_B gpio\n");
> +	conf->csi_b = gpio;

Isn't it easier to simply call to avoid it?

conf->csi_b = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_LOW);

Thanks,
Michal

