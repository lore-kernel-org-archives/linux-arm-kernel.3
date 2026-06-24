Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C81CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 06:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdcSpiNpisCrHTXqbJDtxaxSik6e4ATGXJv9Rv0aiIY=; b=ByJ6DQLpXqiP2r2Fwi9nknqCf2
	dD698KdOTrHyvKnET1KALEnDKYZln6vdVeIFAWfLLxcTfRuL5Eyu8VAUzbXo+ZoJ+IgkA+rJbxBwI
	M5o57r2oejnMestb1r6PyK1Wx0xYKJC7mhyy21kGtV3KRWKHiNicJBfg50ceCgfaALGqAkmfbGyx9
	diphwgqinuObvvB5fXRQ1YSogB/ALLkI2CXkh8v6nS3Ojeaje9/nA64xK8kzLITZARMXW3st4+KqF
	k/d5yThMT7gv27w5Z4Scuri9vJlEiThsV/tFd4xvyC899JmP02XJ81LsgR9wIM1toJDWZwptMInyG
	VGLRbpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGqo-00000007DC9-0xmY;
	Wed, 24 Jun 2026 06:12:42 +0000
Received: from mail-southcentralusazon11013026.outbound.protection.outlook.com ([40.93.196.26] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGqk-00000007DBf-2MbZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 06:12:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1KyALuXTcYm9bbuOsQNEJsklsyEZC9AKEgW/EGpbNKH2HQZEDXeMQHiTrz2vfyNMFWtHL3RazC2Mt+sVqdwdtFAv0ATTtvigRAtGId529eikIsga3uFKl9eXxCn30ynRGILgJgJ6MniqX5MNEOPKcC1kKOElZL61ZfoJ5ctrb8HVPoQ+X1ySBGpBme8WR8Gd5LVlHALChXXuy/Un/zy6BPWoboQeSMG0wGEUg/p+oBiMSt8Cdg1wyRrcot2uACQnyk+ZnvrFG2myAP3p0l0VUXlkEB9iSbAPXLu8Lk/lnk6ExFIeJcnI0GlcKw8AVkwox7Ef1+suh4/rZG8RJlkSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdcSpiNpisCrHTXqbJDtxaxSik6e4ATGXJv9Rv0aiIY=;
 b=g4E0wfTboXXb1C1+OruhpVeKkwTfQtXyboGj8aru2xfmCAaIZpi2vLhmYH6qqR0OiQrCxbVm/vidbcNIdCn4Dd694SfyDCSzC/jN4w9HQWogG1OTpCr23YtkkXEhS6qIhhPhZaU3/LREb1+E668cgTdDEADgkyKbuExrZ6BIPFW0lYSQsOY1rlUl/DDyd9BygRs1yLZNEjKM4UGFDDAHnEOOmFqffJbIeAQPocjhM3wZ71eCgyvzgkqxtfsVje4OxE/5EZuZnViM835fg4igf1uLc+MeFopicxWPospYTiFeO87Ebx1Sj75GbFHg6ak17BhC9DbwBW7wGPOWo4TYJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdcSpiNpisCrHTXqbJDtxaxSik6e4ATGXJv9Rv0aiIY=;
 b=DzY8tZhkZg/0KD6X5RwjmbuOkB4MKcEYZWBn5cmGbUvlojPSATgSz4Wz3t5vYxp8b+3RAULTDPlnRZRdcavsNipm7svWjARyjEXeVOETU96xi4lIjKYOoyGdn/rAIMen4wJWzs6iashhXwX1DJUkjJjV3yLSlSkRttgpnU/0ZSw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by PH7PR12MB6538.namprd12.prod.outlook.com (2603:10b6:510:1f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 06:12:26 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 06:12:26 +0000
Message-ID: <59d9a4c9-1f12-4de9-a0d6-613d2f5e9852@amd.com>
Date: Wed, 24 Jun 2026 08:12:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: xlnx: refactor start & stop ops
To: tanmay.shah@amd.com, andersson@kernel.org, mathieu.poirier@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20260619163854.410392-1-tanmay.shah@amd.com>
 <4a4e518a-61e6-4beb-aaeb-5056fbe2a07a@amd.com>
 <a9baf2c9-d4d9-4152-9188-c33fce2daf15@amd.com>
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
In-Reply-To: <a9baf2c9-d4d9-4152-9188-c33fce2daf15@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF000132E8.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::28) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|PH7PR12MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 41626138-253c-4fe9-d882-08ded1b7902b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|6133799003|11063799006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Dq6o1iRDvX2qPFf1nMGSHEMIyVEWl6vIuuGBx3j3ipUqzMlB0kJm9eFv0D9xmYszTvaL3no2PhdMHh+iPJLsR4pxGyNl2uNWh0hlhrndqKvRBKs4YlykhZAtEMX7YrsIdLygPD0qAqB2G8xGJjPLHnz3/xC9jooJfVRZAGYEr1NUjCIKYwdkFT4UomYv4p3yzx4Foxlu3zE1ortH7EpzKgFSkTdSOzf7RJ368qCdZ/muqRoBKHcrqrobrVh8ls6YRDHpTGW+iH+zbwDQrLenGG+R0Db5qajSDm+jnit/loZ7sPSDhaE5C6610pCjTCRdSsFcylqQpw9p0qX7WTcioCxhi3LNAjiQm2/fzfiA4aESfkBge3/Xm+fYdz4N6z9h83K3tsLEsaxwBNUTAGdN4j7kNpt4Ayy9YStdkvDvBnpR6jFCaF07c1k/zc4Y8noSTx3I+8kCgFFeVlN+uj07/RT8e+5/TRS2ZfspTv1tFUB7n9KPGXzZzM2rdgGS4vxss9miR+oD7e2nzjOnrFBdNrK5k+KYB91EWGw1SUkFpZpo5FPH5Nc++c9C6uG1ZsVjb25k9y0zBaQkUFBnGmIJv4bEB5vM4aKkeg+N8cOj0Qiy0FjQfYuXPSkpKhZ1YZPQqECP50d2HNhiedPZbbvTpK1/6yq18C2mCiTqyEQNeDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(6133799003)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RklBWGN3aitHM3VkNFJRZktFRmlCc2d4MGNQYi9HbytmMWxTYTVZZ3c4QnYr?=
 =?utf-8?B?WHdoeDFFOEl5b01VMFhIMmhpQWVrNXk3ZzlhVmJkL0xhR29BVU5Qd0NURjF3?=
 =?utf-8?B?a1h3ay9RTHRnemVCb0d3VkV2N2RSWEFENm9wbjQ1bVd3YWJFU3Vsc29aZHB5?=
 =?utf-8?B?ays5Q3lDaitsdUo1M21vNW9oeHkreUJkeHVZdHJtK0Q4UVdmSzRRWlFQb0t4?=
 =?utf-8?B?SFFkS2h5NElNQUxUSTZBZmRkQnJieTY3dVpYenJoQkFZaTZOb3Z0V2oxelF6?=
 =?utf-8?B?dngrSTRIZVI0NzdBSFgvWGg4eG00L25TeTRZZVdiUFZnMEVNaS9zZDNlY2tR?=
 =?utf-8?B?cWhPTkhMMTRkOVk0b05oYnFtdDhiZGVIR2UwckxuSTAvNXdaUzZONWIyanV4?=
 =?utf-8?B?R3k1ZlhzdWMvT0szWCtUSjFhSjNtdXF5SXFpd1luaGF3Z0JxaXRyWm9qVzlt?=
 =?utf-8?B?Q2NmajlTTmZqeWRkR2ZNdTd2QUxBRGlqTXZaaVh2Mmd3b3loS25ZYVIzZkc0?=
 =?utf-8?B?bGl5cTc2RVhhTmVzakFZeUtkM1B6TDdESGJRQlVpUy9PTXNLQ3pyVWVJVXFn?=
 =?utf-8?B?eGo4NzVYT294Y0NpWEViMWJ1L0lXZWNRRWR3YSthM0EvYTZuZzlnYXFhL0s5?=
 =?utf-8?B?dWozV3hWUUlZNjFPSW5TUHdhNE12NlhDQlNmNTNDVm1qMTZKV01ocTdnUzRM?=
 =?utf-8?B?amJJbytNWTkybEozWSs5L0hob1pVbisyVkhDM0V6Qzg4OEQzRFRKT08wUDQ5?=
 =?utf-8?B?UUR0eGhKRG1hOWQ2cFQwZkQxZkdpY0FhQVVtTmg0SXJrdVUrM0VqS1hzRHJu?=
 =?utf-8?B?eFJuUXVtRmkyNTdKMjNCeGZxVnRhbUNUNldvN3U0bXBGbFhRN3FlNnFGNDlR?=
 =?utf-8?B?ZUxkUEFKQi9weGpFZXVkb2Zna2pWbllPbGZaWXNCTDFlK2lYZzdNa0ZmOWhU?=
 =?utf-8?B?ZXY5MzRhTzYwUmRZSSs0T0pWSUFkdk1qRVk5cHlTbG15KytxaEFja0RzMVpi?=
 =?utf-8?B?TlZiOEtSckVMclFLQVJMNnJpVUxWV2U1cStud0pDSzVhM1NFVVlTSE45QVgy?=
 =?utf-8?B?R2hkUmgzYlh3RVgvNlljcTZtN0d0MFVEUFZ1d3M4d0VhOTl6bGZoL0RtbGxy?=
 =?utf-8?B?SjFLbGNWVS9RUlgxRldVb3BVS0lHbi9VcW85UXN3K2ZXcGx4YmlYbW5wekFM?=
 =?utf-8?B?QldxTUh2V0pXbUhSaFIvdDV5OVZFZ0E0TzB4V2NZbDAwYzZpKzArelQ3T2lw?=
 =?utf-8?B?SjNlMldKL1lZaW1CbHBLZ1c0bHhTVzRrcnp2bnlJTzFvaU9LSXpvNWE5bVJi?=
 =?utf-8?B?V0VPSFNvUVRQc1psSjRsbXNYaWlHNFRuU1hjdmpMVHB3WUVGRkF1ak9NaHF3?=
 =?utf-8?B?RktYMm0wMUpyU1FwajF5T1FjZEdrY3pUOTFacFRiWXFhVmxGbWRzczltZXhB?=
 =?utf-8?B?cGN6R0h3SFREeGFPUVJFM1ZiTVBzUzg4KzJNWWpYeDF1YVByeHZwbDhSbkNR?=
 =?utf-8?B?Tk9vWE1QZW1QMncrTWRGeE1FaHBUQU1MckYrUGlvWnRYbi9JS3dqbE5GRFBH?=
 =?utf-8?B?Q2k5dmJJaVhTY1NIZFlKWmRZZVo2OWhxM25tWHlVTDQxaEdDbVFpTDA5Z1lh?=
 =?utf-8?B?UmowQTJ1RW1BMDE3K3Z4U2VPRUJYOUQxS0QyQ3pWUkF4aGN2Nyszbno0T2Rh?=
 =?utf-8?B?U3M4RzVpRXhoYk10bE5oNVR3R1FTRkZWeXlNYjRVODhyWlNvczk2R3FtaDd1?=
 =?utf-8?B?OWl1cldMQ1g4aU9HNzlqVFk5NmZTenNubTdqMUh2cll5N2xlQUVoWHR6V090?=
 =?utf-8?B?KzNDQVNubVpIckdoYVVZK3pWRkc1dHVHajUvVEtsS0NHT2d2eWc3dDNMMVFq?=
 =?utf-8?B?dld1NE9XR3MvMnFLZ2Q1bkJ2OXRETXlJaCtaZDV1N1BDR3UvNmRRVklDUlJ5?=
 =?utf-8?B?SUNXclg5NThOTkJjd1MxZ3FJTS9GSUV1RmlTejlSYW9rVTFlL2tqdlBINjYx?=
 =?utf-8?B?V3lvZ21wakplSzJsaXRTc3ZScmFqYVRNd2hCTjA2M3lKcGU4K2lKdVllU2RY?=
 =?utf-8?B?MnZWdkJBMXhyQzJyY0tjSWcrM0FKQmVCOW5rZGQ2VFl0SXRUenY2RklVK2dO?=
 =?utf-8?B?V1ZyYWpLbjYyWFl2VW8zVC8wZEl5N0gyaFFTbjRweDEzUWlXVGk3ek1GMWQ2?=
 =?utf-8?B?U0Qrc0R0MTV4cWY1Q3ZWdDRuTGZvaWdUSS9FS09WUzRFNHd3TkFEWjBDN0pr?=
 =?utf-8?B?cndTZGZQUmNWRU5RSDNWYVFPaUg5aFVXZzhlaDJ0TzFncVgzYWhyRDhSclRx?=
 =?utf-8?B?bjZtUVgwSUZHSit2cHp4T2RsdGpOUEdXUGZHNTlnSVB1VmdEVlI0dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41626138-253c-4fe9-d882-08ded1b7902b
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 06:12:26.2329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbvnWW4vAEoQK2fQPDG9bg2U4bEViMi53mI9f0CNRhW9OuLXoOimHD2wYaoc7RXH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6538
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_231238_928605_6672F35A 
X-CRM114-Status: GOOD (  20.85  )
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



On 6/23/26 00:29, Shah, Tanmay wrote:
> Hello,
> 
> 
> On 6/22/2026 7:25 AM, Michal Simek wrote:
>>
>>
>> On 6/19/26 18:38, Tanmay Shah wrote:
>>> Current _start and _stop ops are implemented using various APIs from the
>>> platform management firmware driver. Instead provide respective RPU
>>> start and stop API in the firmware driver and move the logic to interact
>>> with the PM firmware in the firmware driver. The remoteproc driver
>>> doesn't
>>> need to know actual logic, but only the final result i.e. RPU start/stop
>>> was success or not. This refactor keeps the remoteproc driver simple and
>>> moves firmware interaction logic to the firmware driver.
>>>
>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>> ---
>>>    drivers/firmware/xilinx/zynqmp.c        | 93 +++++++++++++++++++++++++
>>>    drivers/remoteproc/xlnx_r5_remoteproc.c | 68 ++----------------
>>>    include/linux/firmware/xlnx-zynqmp.h    | 12 ++++
>>>    3 files changed, 110 insertions(+), 63 deletions(-)
>>>
>>> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/
>>> xilinx/zynqmp.c
>>> index af838b2dc327..f9a3a95b0638 100644
>>> --- a/drivers/firmware/xilinx/zynqmp.c
>>> +++ b/drivers/firmware/xilinx/zynqmp.c
>>> @@ -1513,6 +1513,99 @@ int zynqmp_pm_request_wake(const u32 node,
>>>    }
>>>    EXPORT_SYMBOL_GPL(zynqmp_pm_request_wake);
>>>    +/**
>>> + * zynqmp_pm_start_rpu - Boot Real-time Processing Unit (Cortex-R) on
>>> SoC
>>> + *
>>> + * @node: power-domains id of the core
>>> + * @bootaddr: Boot address of elf
>>> + *
>>> + * Return: status, either success or error+reason
>>> + */
>>> +int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
>>> +{
>>> +    enum rpu_boot_mem bootmem;
>>> +    int ret;
>>> +
>>> +    /*
>>> +     * The exception vector pointers (EVP) refer to the base-address of
>>> +     * exception vectors (for reset, IRQ, FIQ, etc). The reset-vector
>>> +     * starts at the base-address and subsequent vectors are on 4-byte
>>> +     * boundaries.
>>> +     *
>>> +     * Exception vectors can start either from 0x0000_0000 (LOVEC) or
>>> +     * from 0xFFFF_0000 (HIVEC) which is mapped in the OCM (On-Chip
>>> Memory)
>>
>> here
>>
>>> +     *
>>> +     * Usually firmware will put Exception vectors at LOVEC.
>>> +     *
>>> +     * It is not recommend that you change the exception vector.
>>> +     * Changing the EVP to HIVEC will result in increased interrupt
>>> latency
>>> +     * and jitter. Also, if the OCM is secured and the Cortex-R5F
>>> processor
>>> +     * is non-secured, then the Cortex-R5F processor cannot access the
>>> +     * HIVEC exception vectors in the OCM.
>>> +     */
>>> +    bootmem = (bootaddr >= 0xFFFC0000) ?
>>
>> and here you have different values without any explanation why.
>>
> 
> The value in the comment is correct, but the check is done for all of
> OCM address range. This is just refactoring of the interfaces and not
> the actual logic. There is a separate patch which actually refactors the
> logic, I will send it later. I would like to keep this as it is because
> this was originally there, and the intent of the commit is not to modify it.

ok.

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

