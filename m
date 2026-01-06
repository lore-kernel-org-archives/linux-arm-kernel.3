Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E92C47BEA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGGAbvMeHz9zukQbbT34H2U4/rOBdTSab5O3UmKZpJc=; b=hSVo7XbiesCKuP8CXrCUUgov0v
	+qNUhQKIZmfqZZWxGhh2OBC910lgI3mJRWIwqxQeK8Hf3CmV3v5IVpGTnplE1cGxPf8cXIOM+vMyv
	9hnEUSKCpZsdMVu6jb2DvYT0UIbZsWfvERJiMjUtCeu55whLghP2eYy07skohfxyHzFChf+vCKuir
	8MBDPhad3IYCA1zJmcSyH2DXWk95hsk53siTSCzJ66VdRPUglVzXc3V6Pi7Z56z2PCIGe86Ijzsel
	SPhd8cU0Rsea9I0DAtz99k+NChol4xKwJY8+V8Ss9x02mAv57L9bqQlXtzUrxJJcmnhjEGy2etmJK
	psQslBtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5K4-0000000Ct6j-3DB4;
	Tue, 06 Jan 2026 11:34:00 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5K2-0000000Ct5m-2KIi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:34:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXZjrPeAjAa13HBOVWN5Rvgs8omGLOk7mq4s6uFPZke9gTauSOqBfUXeD+NoAsPuxOjgpn/S/MgD7qDgyvcnZW36KAbK47b8thT9WGIZEqIKVeXE9D+MYhcM4UpSDBwSG37bA7Z4yGao3FOEyTaeqRo6LOpincbbcQBlNhbDqYNbkPDQO0VxR00jo7mjgDT4C4YeGSviL/AwlaFFmbchOiNDkUFdJg2SO78Z6jmvXDVDelS0QFr4uF7AcP9jtAWQMpJDdf+asg8HOVr9bvDYRvAmrn+05TbkrONTdjQqK/fKDc81fsJ2V2Pc0suvONeaTpjthFDkWGH1KChk9ZK3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGGAbvMeHz9zukQbbT34H2U4/rOBdTSab5O3UmKZpJc=;
 b=SJBz+A/7H1uh4snXvevmgHn6EABwH6sXLsk++yzePORE1x55FbkLPlW4tJD8RAWXR3MeXkxrZmMHnXtAEdtLkzt3y0sYkfDWprkrAGJcWeS2TlZfqAekvvnBQBgH4nTbV+6MsfnO5No/c2logiwwSACH1neqTvjeGX6LfNunjns81e5BZBjeN5uJahH2t2xD+qWPFSox+DLrObHa+3a78IFNZC5qxoM2lrzLyTQsTM1EuHCjzGGbPXxvVp+z3ddpQdkZzeQFU5ZDu5EWGoNDgahggW2aBkD7CXzblebevdBRpxACgFngbZxten+cfl/PhCDkW4gPtFDkpUVB1FLawg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGGAbvMeHz9zukQbbT34H2U4/rOBdTSab5O3UmKZpJc=;
 b=bux1u4jbWrD0lUD2AoiRwmLru6f9nTdvFAIwsBi1islYHCwGzMOHZuC0fPbNiazuisb0H0ovHXxRARjfx3T/0OS7A80oqI9qHkSFPbKpPg3jPYCFzylq0E0TQQHMjIG+bWze9N932+0AVE5yBwq0P5AHvm4vZ2aj4/Fgg+hwyBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SA1PR12MB9002.namprd12.prod.outlook.com (2603:10b6:806:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:33:51 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 11:33:51 +0000
Message-ID: <41d14f57-8db5-4639-930b-6853cf2344fd@amd.com>
Date: Tue, 6 Jan 2026 12:33:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: zynqmp: Remove ina260 IIO description
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <7e57f76deca9e73be3fcb914aed119f567c9bf8a.1765785722.git.michal.simek@amd.com>
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
In-Reply-To: <7e57f76deca9e73be3fcb914aed119f567c9bf8a.1765785722.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:40::39) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SA1PR12MB9002:EE_
X-MS-Office365-Filtering-Correlation-Id: f7314f76-10b5-4da4-0be1-08de4d177741
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFpWSkYvalhXUktrdThsVVk4MWQyMjlJOU9mcjZpeUdqNHcrTEhRaW1GK2FS?=
 =?utf-8?B?MU1VWkRoMmhzUTZSaVNrTnpYOGxTd0hmdmJzQTZwZHM4M2VDNExyTnNVWkJJ?=
 =?utf-8?B?RXFZbzg0RmVweDNQWEhhc3BrTWZ4OWNoZGp1Z3FXTTFpRnJGQTQvZTYzTjkx?=
 =?utf-8?B?RDFjVkVyaUNiQ01mVUVLZnRkYS91OGx5N1E5NFNnVUJLNGtOZzY0U0Ywa0Ry?=
 =?utf-8?B?bWl0a0dqL0o0Ykt4aEZHWnRsUjFJa25tZHhaK0xQN09GYmlqSlk0eUFQRnk4?=
 =?utf-8?B?a2RjTHhSMHV6MHplaDF2U0FzMEtaNHVVWUlPekpNRHRJWnBaazRBdDh1RER5?=
 =?utf-8?B?azJGeVQwcDRPSlRwNE96akpTQWtlaFBVQUp2NUJQanR3bXVjN1p3bE54RlNV?=
 =?utf-8?B?Z3VKcW5pc3p4a3JuZU8vSWtkUzF4Nmlac0VLanVKRkNrNENaUk5YWHFLSE1v?=
 =?utf-8?B?b29FOWl3RGF4d3h1Uk1GNm1wVXFkNTFvUVlzYnlJMGNtVjZrcTlNZHl0dzQ2?=
 =?utf-8?B?Slh4a1k5SmpKaitjQVlLZ1c2d2QzbjJIV2lTRVp4ZVVkTk54d0JoU2hCTzNw?=
 =?utf-8?B?dGZHUnovTW5LeDg2alRGaEZZRFMxV2kxUFNZeHpLZ1dGbEhLdkxhYWdvekpo?=
 =?utf-8?B?TExtRUxXUG16WlBQM1FMeU1VanFFQThzYnBLN3VLOFltTFZxa09lZlBxYk9n?=
 =?utf-8?B?ZnFqcVo0ZmhHUVEwMTEzVnpBMUdORjhYaVdmeTRrVFRpR3JpeFpWY04zR0VP?=
 =?utf-8?B?WFh6dm1xQ0k4RmhTR2d3ZThLTmY1Z0NwWEVVeDFVenptWHg4cTZwamVEd01p?=
 =?utf-8?B?SzNJeTNiMUFkeURDR1NPSkxaUzZFSFI1cHdEL2s5NmIwWVhxRU9wQ3RqYW5i?=
 =?utf-8?B?cjNXd3V2cnVGNTQ1bHdzRmhFRmFYUnE0V003d1FGQkRYUlNwU1hSbVZObVV1?=
 =?utf-8?B?M1QrcWtFQW1yaDE2UXJWSUtxL3JVeCtzTkh2MXNKb2pEbUdNUHNNWUJRVElF?=
 =?utf-8?B?Y0FGMW1OcHdGUnd0UitvVEFtTlBEOTdYYU00M3lPZHZyL1kxdHgyeGVVVVhH?=
 =?utf-8?B?YmlIQk5Nd0k2MUZVWjFZU1ZrRFM4bDBZb1d6ekExV2xQMW16Z05tdW9pTjBy?=
 =?utf-8?B?RjJPN3ZXOEIrU2VkM0Z5QUxiUFZNNHR5WVpnaGFCaGEwSmtZY2QyVEw5aXZq?=
 =?utf-8?B?ek1SYml0a1BnNk9MekF3T0Z1SXk5ZHZyOStYT1VjZkQ2MnhvOUpoTml4MDlW?=
 =?utf-8?B?RGYycDdLRHdicEw5ZHZYMzNjdk05enNVVUpaUUZDZEQrZlpGemFMZWJhQVdQ?=
 =?utf-8?B?djdYNzVFZWlZbUkzRmhQZGRWdzhYVHIzYW53T3prZVVxMEw3Y1FzcTF4dm5T?=
 =?utf-8?B?ODhCaTNMVHRPN20zbnhCelptSXVaR09JUzZPSUlCYjNjTVRvZW1Lam9ZOEc5?=
 =?utf-8?B?M3pRdUtZa2FINEJGVktObTgwR3kxeWI1dzlDbXpBbTdpS1NjNkZ3UExMTlZt?=
 =?utf-8?B?b1ZDT3MreURpMjNYVnNrR3hSbC80cFBuNDU0c1h2YXRyS3ozOUhFZXNyTXRM?=
 =?utf-8?B?QjA3aWt0TGE4bkY5VjFsYVlDVEZlYnF4L3Y2clVHa1djVlNtZTFoMXMyazZw?=
 =?utf-8?B?SHkyRDg1aWdVRTlkaUViWHdTWlJzN2hjdmVnZHYvVWQyNDEwWFNraWF2eUN2?=
 =?utf-8?B?ZTlvN1RZdTJPY1M3R1JZOFl4ZWp0Mks1ZFJHM2dVV1VGbDcweis1d0Q3aHRB?=
 =?utf-8?B?VTJUZUxmY0N2V2E3UlRIMmdqa3lQRTdneTFXYjI2czc0aXNHbGlJWE1QMkYv?=
 =?utf-8?B?a2JOd2tBSFJabzdhUmRZN0pRakZrdnFwMyt6cnZ2am4vZUxHWDMrQmZrdmR5?=
 =?utf-8?B?YzhTeGJEMHNFVVNrd01kWUJvODhvelYxRmpmUnp6MGtJNmRzam1zT05WYUxs?=
 =?utf-8?Q?TE/5T2iLi4gqZcdZPDTxS5nrEbljg5Vp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHprRFJ1cEp1U3V6MENGbU5KNUw5MHVrUEFCTk1WaXZJanVtaHVmdGFQTFc1?=
 =?utf-8?B?MzgwVDRnV055ZFVhY0dqWTdRVjRKcHRaaWNoMER4SkdheTJlbzduQlh1Wmti?=
 =?utf-8?B?b1kxYzFnNWsxVWR1KzRGdWZFRDBNUmdhbGZpeGl5RTYwSUQraHZBMEV2MWZI?=
 =?utf-8?B?Rk9manVNamd6UWt4RVFObGx0UDk1ek9GWFdxc2ZrVWRQbmM4OSszeTNyYnhx?=
 =?utf-8?B?enR5cUxVemMrVkZZdldjbHFTTUh0eUkxV21BcS9YRU9haVR5MExYZ3FNUDlt?=
 =?utf-8?B?c0U5NXp2bjk0ZWVPZ1JmOFlpM1FtdGVLUU13Vk1KSWtyaDg1TWdJcElqeW5R?=
 =?utf-8?B?UW1NclQ3QTFJTWFLRG10VlhqY3VvK1R0OWo1VFZZbXFCSUc4RlhlRU9FZUFu?=
 =?utf-8?B?c1dHR1prSklkL0VNZ2VnQWdjdW9sS2FmQUpjRllPd1ZNRGZOYW5qQnJWaDk1?=
 =?utf-8?B?RXA4SHhTaEdCR2tnL3JiaG1CVGVMbTVmMjFLTlRvUnlrUFFNK3duckFGT2Vt?=
 =?utf-8?B?U2E3cTBibDhwT2huOStZRWU2akQrSWJYRkZsM29DVTFralZIYUdPNzJScXlp?=
 =?utf-8?B?bjVsQ2djd1hJWlBVQ2RQNUcyQzVIb0kvQWhnemlNcEJXRmNZenhlcExIc0RK?=
 =?utf-8?B?Z09ub3hjUE1zckhPclZMRU1ySXBrNGl0azJaREMrNzN3eVNuVnVjVnU5ZEFO?=
 =?utf-8?B?WVVVS0ZBYmdiYUZnZlZRdVZ5R2lKNGZHRnhScE5TNE5PVEdTK1NyY2YydEVE?=
 =?utf-8?B?TUcxbHNnRFk5eWtybUMxcHNBamZ3NTNYRGN0ZVZpK3d4WWdWQkdaNkpOQnVI?=
 =?utf-8?B?RmlNcHJBV0FkajFTVmd1Vng4M1JNbHJqWVBpc1ozSDNFeVpFUSs1bG5TVGoy?=
 =?utf-8?B?cUM5Rk9rRTR0L1Jxd0ZyR1N2NkJGMEt5RktRSXJXMW9mY2UwTkNUbzRkUzd1?=
 =?utf-8?B?QkZUY3VTT1ZrWE1jYkV1ZXdkcHFNOGhneVhiSXhBZ2hWTVdqWVRQQmIxaFEx?=
 =?utf-8?B?dVBleVFQRCtjVFdFTkdDMGlkVUYvOEdXYmltbmdQN1g4eWtsVDd3ZFVLSzVC?=
 =?utf-8?B?U3VPVDBGVWs3eGI1Tm1jMDl6WUl2cGFQYTlpSlZQUkxCQnR0Z04zWkViMFpC?=
 =?utf-8?B?b1FwVVZoTTFtR0x1Mjhxc3BXcGlXanM3cll6YWI2MFJzcHU5TkpTeFpqZjNM?=
 =?utf-8?B?VzdxMXRHM3l3ZEtvRWZWaEFFOE5wcDdmQzBvbVdsRnpIMkliUXlmUUlhcWtB?=
 =?utf-8?B?R2VnQnI4T202YWU4eHZRUDNMR2QrZjkrR21lZW5ZUjEyU1BvVTAzMDIxSXVU?=
 =?utf-8?B?NnZnck96TlhuUVZZVnRha21NWHFrL1hVNkt3bFA1OGpYOGkydTFWMmxPcGo5?=
 =?utf-8?B?TkI3eWdFUTFSL05hUHBKalJjZmRiSGxlWlF4NCtDcjhSUzBvWStBa2ZvSU5T?=
 =?utf-8?B?WGpkZC94SlJlWXpyNnk2UjdJYmlCSWlLYmRBNXZVWlZSK0RZT09OOGtzdjdn?=
 =?utf-8?B?T1pEaWRZOU9KRHhycC9TR1ZYc0s3cXkvRjlVVCtjZVJ3Nkw4RnNtNVZTRVdE?=
 =?utf-8?B?aUU3ZGtVS3NWZDJ5cWh0MXU4YXZLb2Q3MytSdjR6SC9rT2FDRHM3M2RESHBS?=
 =?utf-8?B?NlBHWUllaUtRd1VDVnQwRXNQZGRqSDExeE5XQ1FzMTYvQ1gxTEE2V2RYZjdr?=
 =?utf-8?B?K1ZnVmJLNnVIaFo0Ri81QUZhRit4bmpVa1JJNEJWQnN4S0ZmYU9RR1NWcThD?=
 =?utf-8?B?RVJXZ0FRdnVvMlIzQUZld050RFo5eG1adUE2MjJhMUs5Rm9kcDRsaTVMMWlu?=
 =?utf-8?B?UFZ5QVpGQWRaK3dqS2lYTmE4djJsTEpiTElwQ1RiY2xVaTBzZmRaNWc0d3ph?=
 =?utf-8?B?cUlhMlVsZmZYVmN4enh3SktYYmJDOXAxTno5blJ3UFF3U2tkQ0JUdFZZa3pp?=
 =?utf-8?B?MVFpRkRoMGZTT3VxdnJ5VDhJYVZDWGxRSFpYbXNHOWdRbHlZNkExTkhFaHBy?=
 =?utf-8?B?OVEvekNvMUJoRk10M09BanFlcU9VNDlOd28wOFRxU0o5bnNEWXhHK1ZGOGF5?=
 =?utf-8?B?ZS9yQ0FrWFVicXRNdUtxSzlsMFhBM2NobWtiMWZ0K2Z2dGR5cUdUSTEyZmZN?=
 =?utf-8?B?UnovcURtM2t3OWxIY2RVdFpiSVl0YmZJOCtiTE4xNHFob203eVp6a0dJZk1j?=
 =?utf-8?B?M1IxR2IwbTRQcE1LUlgySmYvYXVpcDQyQnpBSjJGcUFFc3o1MW9qbmUwYXNp?=
 =?utf-8?B?Nm15K1lnU1dCcHRyaEVzZkE5dW5MT0ttbHBPY3NLbU9NVTdhRzBMWjBYU0tR?=
 =?utf-8?B?RHY1dzRaMUpKOXJBWVRYcXJjTEdva29zbHo2ajJBTE1IV2RVZlhqUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7314f76-10b5-4da4-0be1-08de4d177741
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:33:51.4421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyd/6BEpU82YyqmsjkD++kPiWOm/uZybBRQ5GAE5HIiKScojO/T++v+Ffb9sPO8c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_033358_651339_BCF7FD09 
X-CRM114-Status: GOOD (  15.01  )
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



On 12/15/25 09:02, Michal Simek wrote:
> Kernel has only hwmon driver that's why there is no reason to wire iio to
> hwmon converter which was describing out of tree ina260 IIO.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
> Upstreaming of ina260 IIO driver was tried here.
> https://lore.kernel.org/all/20210322105056.30571-1-raviteja.narayanam@xilinx.com/
> ---
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso | 6 ------
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 6 ------
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 6 ------
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 6 ------
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 6 ------
>   5 files changed, 30 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
> index 02be5e1e8686..832dc5ab2458 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
> @@ -26,11 +26,6 @@ aliases {
>   		ethernet0 = "/axi/ethernet@ff0c0000"; /* &gem1 */
>   	};
>   
> -	ina260-u3 {
> -		compatible = "iio-hwmon";
> -		io-channels = <&u3 0>, <&u3 1>, <&u3 2>;
> -	};
> -
>   	clk_26: clock2 { /* u17 - USB */
>   		compatible = "fixed-clock";
>   		#clock-cells = <0>;
> @@ -67,7 +62,6 @@ &i2c1 { /* I2C_SCK C26/C27 - MIO from SOM */
>   
>   	u3: ina260@40 { /* u3 */
>   		compatible = "ti,ina260";
> -		#io-channel-cells = <1>;
>   		label = "ina260-u14";
>   		reg = <0x40>;
>   	};
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
> index b92dcb86e87e..b88efcce0162 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
> @@ -25,11 +25,6 @@ aliases {
>   		ethernet1 = "/axi/ethernet@ff0c0000"; /* &gem1 */
>   	};
>   
> -	ina260-u14 {
> -		compatible = "iio-hwmon";
> -		io-channels = <&u14 0>, <&u14 1>, <&u14 2>;
> -	};
> -
>   	clk_27: clock0 { /* u86 - DP */
>   		compatible = "fixed-clock";
>   		#clock-cells = <0>;
> @@ -95,7 +90,6 @@ &i2c1 { /* I2C_SCK C26/C27 - MIO from SOM */
>   
>   	u14: ina260@40 { /* u14 */
>   		compatible = "ti,ina260";
> -		#io-channel-cells = <1>;
>   		label = "ina260-u14";
>   		reg = <0x40>;
>   	};
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
> index 99ad220d13d6..817797b21679 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
> @@ -25,11 +25,6 @@ aliases {
>   		ethernet1 = "/axi/ethernet@ff0c0000"; /* &gem1 */
>   	};
>   
> -	ina260-u14 {
> -		compatible = "iio-hwmon";
> -		io-channels = <&u14 0>, <&u14 1>, <&u14 2>;
> -	};
> -
>   	clk_125: clock0 { /* u87 - GEM0/1 */
>   		compatible = "fixed-clock";
>   		#clock-cells = <0>;
> @@ -96,7 +91,6 @@ &i2c1 { /* I2C_SCK C26/C27 - MIO from SOM */
>   
>   	u14: ina260@40 { /* u14 */
>   		compatible = "ti,ina260";
> -		#io-channel-cells = <1>;
>   		label = "ina260-u14";
>   		reg = <0x40>;
>   	};
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
> index d7351a17d3e8..923a70d750bf 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
> @@ -32,11 +32,6 @@ aliases {
>   		ethernet0 = "/axi/ethernet@ff0e0000"; /* &gem3 */
>   	};
>   
> -	ina260-u14 {
> -		compatible = "iio-hwmon";
> -		io-channels = <&u14 0>, <&u14 1>, <&u14 2>;
> -	};
> -
>   	si5332_0: si5332-0 { /* u17 */
>   		compatible = "fixed-clock";
>   		#clock-cells = <0>;
> @@ -96,7 +91,6 @@ &i2c1 { /* I2C_SCK C23/C24 - MIO from SOM */
>   
>   	u14: ina260@40 { /* u14 */
>   		compatible = "ti,ina260";
> -		#io-channel-cells = <1>;
>   		label = "ina260-u14";
>   		reg = <0x40>;
>   	};
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
> index a4ae37ebaccf..563e750b0e08 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
> @@ -27,11 +27,6 @@ aliases {
>   		ethernet0 = "/axi/ethernet@ff0e0000"; /* &gem3 */
>   	};
>   
> -	ina260-u14 {
> -		compatible = "iio-hwmon";
> -		io-channels = <&u14 0>, <&u14 1>, <&u14 2>;
> -	};
> -
>   	si5332_0: si5332-0 { /* u17 */
>   		compatible = "fixed-clock";
>   		#clock-cells = <0>;
> @@ -92,7 +87,6 @@ &i2c1 { /* I2C_SCK C23/C24 - MIO from SOM */
>   
>   	u14: ina260@40 { /* u14 */
>   		compatible = "ti,ina260";
> -		#io-channel-cells = <1>;
>   		label = "ina260-u14";
>   		reg = <0x40>;
>   	};

Applied.
M

