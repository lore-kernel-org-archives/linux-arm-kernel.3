Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7B4E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMQJQVzc7P9bKsLn8Ea2B61USOsWnQWqEQfPOQ1Ko14=; b=yUJ7KIhxzq7ilp9VloxX2tAKX+
	psid7HoI0CnlzaVMS1Rg284TP+/hxR42LVI8yY+UPP9Mpy84TJXXUJHk2ULO9HUBhCc2GQfM3EB8W
	wn4c10t822OrmbiYPqfI3JadRur1Vl7se4NQ7oZxXH9HtdLgRz/vKtHbfgMUYlrdFIIy9/cdcVjLR
	/Uzt9WUbvJKumI/7U284AvCS7Y7MOv6rcFqHE7jQ8UH65rTJXNdOvfpCD+mxsshEzGcbCmbMYGcuJ
	PiLbkO9UnALGeyvW6J8dBMykw/APjoxn6GTlEX/TI6+rHqc5sS0AP4f3UqJ/M7g458zo4MLxN67FH
	e98qCOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVXzU-00000008yEs-24vx;
	Wed, 08 Jan 2025 15:29:04 +0000
Received: from mail-dm6nam10on2060b.outbound.protection.outlook.com ([2a01:111:f403:2413::60b] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVXyF-00000008xzg-2Ec1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 15:27:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHLM23XPVu3LvtqwI6m70beNr3JvlloZgNxiAqFkN8RUZCHFR/jwUjVmxhhhI/PKTb4hOaGX7tX4jfIEjw9F0RXcGNtql0wckSefc/hcoG/1QwKesk8xvprxDbrvCSAun06S8loT9WSpUgLlU6P5+7jh0tK3ljV+5TvOxpvGLQVI5U8A/xf5vjH4iokXr05YVxJ4dgHh+MSf/NidyrkRrt5wkH0SqrQbQWztcL5uew0VMtr7UdPiTxZ2qoksmBp3I368EOZTUvKF7MF+nDkrA6SC4aEQD7b4XrHC4JpuPsTV7MEnKuuI/vqq+EzcFOAww6QbVpe06LGUGDlUgnWwlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMQJQVzc7P9bKsLn8Ea2B61USOsWnQWqEQfPOQ1Ko14=;
 b=zG1wKswcAjnTE980uxWnjkDGlrixrOWuXsO2QCSwMXQ/87hNLzDSh2X+n066kOL4/prkj9d4Q5WPmvaEWZ0InWGn31jqnq2qPjAwPOxbGgN1NPvt7+sY6SMnwS0oeJihqtwD6O2WWGuCTgk0ebEUqmWKD214XwrEq4+DNnpUv305ggfYjE2cmUYOA7A8p/hjY9lglxqw2F6WsJp7wR1T8/TStSKO2EPqvl/Y0Y9BvgmYVa9xpR/Klv3/io+T0b6wWve8AWUhPumYl2vmfFEZdFUhIZxbCJGGxc3z7wGt1+8wTctCOH2AeKldcEs1qDNocOfTxreyDUw4BkQp/k9gUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMQJQVzc7P9bKsLn8Ea2B61USOsWnQWqEQfPOQ1Ko14=;
 b=2Yn00lhAPBN5xpyL4so/uZsftrKl7vGalUsubuoLU+GPaRxYBqHo8sP/hFUPl5Q6FERq+wHGrw9MWO6cKiqG13zLpYNMGvXMMimiXsxwDqFaDqeevwHuZmlVGsUc+FpGYRTY0JmF5lLxuKXDUQDXotjFPJfm+Tb/KKUw5wwb/Xg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by CH3PR12MB9283.namprd12.prod.outlook.com (2603:10b6:610:1cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 15:27:39 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%3]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 15:27:39 +0000
Message-ID: <b198c395-5aa1-418a-82fb-936377c3caa2@amd.com>
Date: Wed, 8 Jan 2025 16:27:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: soc: Add new board description for Versal
 NET
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: git@amd.com
References: <20250108113338.20289-1-shubhrajyoti.datta@amd.com>
 <8ff20f2c-fe72-48a6-ad00-872ca20f5e8c@kernel.org>
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
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJkK9VOBQkWf4AXAAoJEDd8
 fyH+PR+ROzEP/1IFM7J4Y58SKuvdWDddIvc7JXcal5DpUtMdpuV+ZiHSOgBQRqvwH4CVBK7p
 ktDCWQAoWCg0KhdGyBjfyVVpm+Gw4DkZovcvMGUlvY5p5w8XxTE5Xx+cj/iDnj83+gy+0Oyz
 VFU9pew9rnT5YjSRFNOmL2dsorxoT1DWuasDUyitGy9iBegj7vtyAsvEObbGiFcKYSjvurkm
 MaJ/AwuJehZouKVfWPY/i4UNsDVbQP6iwO8jgPy3pwjt4ztZrl3qs1gV1F4Zrak1k6qoDP5h
 19Q5XBVtq4VSS4uLKjofVxrw0J+sHHeTNa3Qgk9nXJEvH2s2JpX82an7U6ccJSdNLYbogQAS
 BW60bxq6hWEY/afbT+tepEsXepa0y04NjFccFsbECQ4DA3cdA34sFGupUy5h5la/eEf3/8Kd
 BYcDd+aoxWliMVmL3DudM0Fuj9Hqt7JJAaA0Kt3pwJYwzecl/noK7kFhWiKcJULXEbi3Yf/Y
 pwCf691kBfrbbP9uDmgm4ZbWIT5WUptt3ziYOWx9SSvaZP5MExlXF4z+/KfZAeJBpZ95Gwm+
 FD8WKYjJChMtTfd1VjC4oyFLDUMTvYq77ABkPeKB/WmiAoqMbGx+xQWxW113wZikDy+6WoCS
 MPXfgMPWpkIUnvTIpF+m1Nyerqf71fiA1W8l0oFmtCF5oTMkzsFNBFFuvDEBEACXqiX5h4IA
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
 If49H5EFAmQr1YsFCRZ/gFoACgkQN3x/If49H5H6BQ//TqDpfCh7Fa5v227mDISwU1VgOPFK
 eo/+4fF/KNtAtU/VYmBrwT/N6clBxjJYY1i60ekFfAEsCb+vAr1W9geYYpuA+lgR3/BOkHlJ
 eHf4Ez3D71GnqROIXsObFSFfZWGEgBtHBZ694hKwFmIVCg+lqeMV9nPQKlvfx2n+/lDkspGi
 epDwFUdfJLHOYxFZMQsFtKJX4fBiY85/U4X2xSp02DxQZj/N2lc9OFrKmFJHXJi9vQCkJdIj
 S6nuJlvWj/MZKud5QhlfZQsixT9wCeOa6Vgcd4vCzZuptx8gY9FDgb27RQxh/b1ZHalO1h3z
 kXyouA6Kf54Tv6ab7M/fhNqznnmSvWvQ4EWeh8gddpzHKk8ixw9INBWkGXzqSPOztlJbFiQ3
 YPi6o9Pw/IxdQJ9UZ8eCjvIMpXb4q9cZpRLT/BkD4ttpNxma1CUVljkF4DuGydxbQNvJFBK8
 ywyA0qgv+Mu+4r/Z2iQzoOgE1SymrNSDyC7u0RzmSnyqaQnZ3uj7OzRkq0fMmMbbrIvQYDS/
 y7RkYPOpmElF2pwWI/SXKOgMUgigedGCl1QRUio7iifBmXHkRrTgNT0PWQmeGsWTmfRit2+i
 l2dpB2lxha72cQ6MTEmL65HaoeANhtfO1se2R9dej57g+urO9V2v/UglZG1wsyaP/vOrgs+3
 3i3l5DA=
In-Reply-To: <8ff20f2c-fe72-48a6-ad00-872ca20f5e8c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0179.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::36) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|CH3PR12MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: 38586455-1507-4c5f-6701-08dd2ff8fcb8
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0dvMzA5NTV5NGdXdWVEQkFjeTZOdVRkTFU2eFZOODA2S3FtY01RdWwvMmNQ?=
 =?utf-8?B?MGtIZnpTaHdkbjJpR3d4cVRNYVR3bGF3bklKOE93VGtFY1Npbm1CaHdsekhT?=
 =?utf-8?B?L0hRamk1ZEVUQ1p3a0JMZCtuZm5heXNmS3lTY1FJZWRpNG9WWWUzQ3VlNlcv?=
 =?utf-8?B?dXRXNHI5eFZHYWErT1NpUEMyR1d6d1RRR0VoeDVwS3FrZVJyOVQybkJkVEFv?=
 =?utf-8?B?cEVVOUhOQzZ2Q290UFMycUFpL21sWTM5Tk42c1QxdXdoWi9FRlNWZStNNXJQ?=
 =?utf-8?B?cWpwU1R4dCtsalE3V3YwSkpxREZtdkYrbmQ1ajhXM0x1RU51alMzU3dXMjB1?=
 =?utf-8?B?d2V3VU1FZ3djNEkwRlc3R2lQZE8yT2tCdU84aUlxdzBVKzhuK1BVYlZLWXdT?=
 =?utf-8?B?Uy8vWXl6MWdKZU1qNXBWVDVvUUNLODdRRElnYktqWXFFczNKckgrVDgvWDd0?=
 =?utf-8?B?dzE0Z1Q5aUFUVm5ISDQ2b3IvSkxpM1c1cktLR2FGZGpWWEE0WFJtRjNxMTVE?=
 =?utf-8?B?eUt5UUZSczdUbWRmQnpsbnJHL2hkYzZvcllUbFBDWlpLUm5KSkZURTlBK2JJ?=
 =?utf-8?B?VWs5Z296eWtFNFliUElyT0haK2JSTTFBMVMyRWd6QmxuK1pERk00V202U2ox?=
 =?utf-8?B?NzlKa1ZBN09POUZKc2UvU0w5bG9HK1RSY2JVcVBaVjVUSFdhSkZTdW1RclQr?=
 =?utf-8?B?bVVjWVRlQ2lqS3BZeEdKd3NXMjI5VHFvTkpXU01oSlVHQlRtRnhLVmN6ZU95?=
 =?utf-8?B?Z2prczd3S3RUMCtYVjNHeldpZE1DVEZGZVhIRlNiWGVZWWpsNE1lc0t0bndw?=
 =?utf-8?B?dERjUGJiOGJnN1ZmaEU4OVVSRmVIck0vZ2VtSDRaWmdXTktTYXd5QnZtbzRN?=
 =?utf-8?B?UXlPQzdFQWV4WTd1NHdRbW5XYXYwVGlMQzVkODFXSklQSjJFNmRiZTNyS1dl?=
 =?utf-8?B?QUovMm1WZ25LR3dsRTROTXpwSTdZbXF2b1Q5ZVJ1TVMzdnpGWnhzRkRXQ0p6?=
 =?utf-8?B?bXp3aTZUbFNCNWNUbW4vaTNHMjhWODh5eTVMa1BvRXEySTJwamkyTU4yVDBx?=
 =?utf-8?B?elRKSU9rdFRYdE5oUWNsMnkrWkYxY29ESk1vR0NEQVhRYURjbkNkNU9MV1B0?=
 =?utf-8?B?dGNPVzg2MEV3NWlpRDd4TkN0U1I3RGVMaDEwTWFRU2orcEQvQ3pJRFRwT1BD?=
 =?utf-8?B?ZDFuUnFqVkgzKzNMQk1KNEpjMWw2Tm9ETzVPSElWdGVJdEtkZ2JPaHdaTmFT?=
 =?utf-8?B?dEs5RlVHRWRRMTlNTnF4RzBHL1hxcjhvcEw2eVFrdDRrTG91L081eWFEOXJi?=
 =?utf-8?B?VlhPV3MrcmhjYXhJbUdDT2hNdW83dkYydW54bW5LRmVlVVNreWswR2RCSkN4?=
 =?utf-8?B?ZFNtK0x6SitKTytHTXlYWHhiWXZTNWt4UExKTE9LdWt0ZzZTMEJCQ0Qveng4?=
 =?utf-8?B?bVZRNk9KMHNhZFJUM0xIVi9pbFlLell0OGlHak1zZC8zSmhEU3NkODYwUG1h?=
 =?utf-8?B?N09COVdQY3RwYmNibEZMVVM0c3YrNzVhWDhFQlFSNzVQKysyNENNMlQrOHBi?=
 =?utf-8?B?YUFwb09BU3BjQjBKOU02U0Mwb0RBM1F6UmVBbzdiam9IMUFTQlhvMUFzaDdU?=
 =?utf-8?B?Y2lFZGd0NnRxTlR3N3k4RFQ3aGp3M0RNSlNpZjg5QmF6REE1bVpJS3VNQUJv?=
 =?utf-8?B?NHdjaFFhVEdEWjBjU0JVTUVCSnI4MWx1KzNqWUp6MmwxMHlZRjNIWWRtU3RP?=
 =?utf-8?B?Vjk1WWZuT3JVTVJQcnNOYkVOZEhGVkNuNko3M2p1OTFhZVZIei8yVG9zL0VU?=
 =?utf-8?B?WWpXN0c1d1FCcHpqVktYYXRsK0cySmg4REhlUmZQeWtjRW9qRWx2RGtGbmpT?=
 =?utf-8?Q?s3h2cLGxBpT/Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTFoSzUzRytZNm91UWt5SlBocFo3ZWdXZ1Z5eStOb0I1TXp4dmhuODdvSGpj?=
 =?utf-8?B?ZmRPd2ZPOWlEMFhaYllJb1RZWjdXa0drYlh2K3dOK0pKbnRBTTE5NVdWNGsv?=
 =?utf-8?B?ZFpQdG5TZndOb1EvR2hoSTZMazgrRUl0c3F0V0ZuTWFIUW1EZDdabkZpL0lM?=
 =?utf-8?B?VDdiL25vUWk1MWRQazdDK2RPdklMQ2thR1NWcEZyVjRSZU1OZWpLQTJ6djhQ?=
 =?utf-8?B?OVBuRUluNzNsRFUyZmtrVjN6d0todWJXQWxkK2ptM3VLS2NESWV5aG5Lenl5?=
 =?utf-8?B?OEVaZmdRMHZ2R2l6eVZRQ2ROQ1dOTFFqQ3Z6b3ZwZDdxUTlNSWpCYnlEdXZ0?=
 =?utf-8?B?QUVGWW0vYlNsNm1hNGM1Uy93YWhaK3lwWUErTXppTm4wUk42SlFsVzFmVE43?=
 =?utf-8?B?UVN4MzJjdGR2ekdlNmpTSXE0cXFwWXZHbitmV3FHWUJOYmc4SlhEV0FmYzh0?=
 =?utf-8?B?VXRSTWQ4eHpMSWlBUmVvVTVqSDg1cmJYNDE2QVEvaGEweGlXU2ZTWmtyT2ll?=
 =?utf-8?B?bUFaNXFHQzhJMGVLNEtCZ1VYbFJQM2RIdDVaTmxiUCtuRVdRcTVGdzNsSFRG?=
 =?utf-8?B?dDBKMHdNRnhkTU5xZ2dqNnRvZGF3UWRsaGZzYWJUTENVWHMvZ1g3TEVxejZG?=
 =?utf-8?B?NDA2Ui9ERHhGZkFLNW5INjU4NDRZNTYzS2hGSENRaWsxZEFBNG52UGh3UjVv?=
 =?utf-8?B?OU9UT01oUE5oeWpuNytKMnJUbFVKeFY3ZVoyOGJzRjhOdmMvWmtlTURuaUZr?=
 =?utf-8?B?VURoTHdDb0Z3bDhGR04vVWJ4N0s5NXAyeWc5b3NqOHNlRFdydzc2T1JVcDUw?=
 =?utf-8?B?OXJUWGJMc0pPYmRDbTQ2MDBNNmNGQXUvdDBRUzBuRkFZdWFWYjJOV2xIOTJT?=
 =?utf-8?B?R2lPMkNZTFhrdWdHcUExNi9vUTVFaEVGMTZaOTJWb1E2UHN6Q09BSCtCMVhK?=
 =?utf-8?B?RzZ5Z0NTYmhJRWQzTjN2QWNsS2IxNFpMUTA2THlQeTBSWDlxTEgvYlpwNWZ2?=
 =?utf-8?B?TThQdFpXRmNUdTJCMStocEQ0T3R1MlR2UnpWZXJydXppdmhFQVRhN3ptVEZt?=
 =?utf-8?B?bFBtSVNEZm5RaDd5eVp4alpocVZHNVdGVFNOTHlnYmxySlFuSFdta2tZcEVt?=
 =?utf-8?B?UkNKVjk3YjBHZEswYVNjNldTT0dEVUVmWDFCYnR0c2Y3WTBFRWtna1oyU3BS?=
 =?utf-8?B?QUE5N0FoK1lnV0hXUXhFMVVZeFc0U0RhbVM4aWxIdFkrbHlheTFlU09YOWdB?=
 =?utf-8?B?T3d3ejl6SHpBMklmREcwb0o3TTU5QjNmNDZVL2RmQ1ZncnowWEtlcThDYzE5?=
 =?utf-8?B?eDJDOFVoR0R0UzhweVlHZGthbnJRdUx4cUFyYTYvdnVuMSs1ZzNVZnU2WDJQ?=
 =?utf-8?B?RDllMisxQk5JbU84TDhIQ2srb25DOWEvQWRFQk40RGplR2FIc0tuczUrVTBH?=
 =?utf-8?B?T1lxVTQxd3dtVmRISG42Q3Y5Q0VQeGp6TXhqb3A0eFArTlMwaEVYMWpMYWZD?=
 =?utf-8?B?ZUNjMGhPUmNGdmxFZW01R09HSWNjc3gzem5GVFF4NEJaRDJSMWpxbU5kSUJm?=
 =?utf-8?B?elpQdDBXbGtsUUlzSGN4YzAyZzBuK1UwdnY2OElOcm9lTFVIcFJoOXhqN1NE?=
 =?utf-8?B?aWw2enduaEpoNzZHOUZ2cE1jZzVscFdxNVhDWHUwUm91RHQxZUtBUVNZYUNQ?=
 =?utf-8?B?TE1rVmNHa3N5aWRraHdURmhnNnRib2F0L2hUZlQwZXZEb24rOEsyb1prZ0h4?=
 =?utf-8?B?ZE5zaVB4dkdaMzBzVUxZSnliVnMvRWFOQlMyVDZrZVd0RCt3djdzZkVyNXd0?=
 =?utf-8?B?dWtWMkhUU3FEQW9yY3RqVFhXa2hUdGdWNnYxWnlob2NNdkdKYldxKzdubUtL?=
 =?utf-8?B?Z0hWNkRnc2V1TVkyaEZnbDcyQU9tVWdTNEVmZnNDdnpXUDBZMTkwUFZCRGEz?=
 =?utf-8?B?WDkvc1FYaEs1NG13dE1TZ2JieXBTVjZldmFnWTU5VEFBVnEwYVIxQWtkUWwx?=
 =?utf-8?B?ak5ZYWwvbzc4Mk1DL0NyaWZ0TFh0SGJtYUN2M2VTSWlQTTI4cDdqdnMxNkYv?=
 =?utf-8?B?NkV6TWw3VlJhclo5SndCMTczR2d5ZGk3RW9hZXpTL0dxc2tsQ1Q2S0FwR0lr?=
 =?utf-8?Q?WXaSC5EJfQn4flA/9BCDRBy5o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38586455-1507-4c5f-6701-08dd2ff8fcb8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 15:27:39.7282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9IeHrwpJrmXaDowNnkVaBsgpNu9sowWWrpvMGxaGAAjLmSvuG4oTWUVW9/Eh6oj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_072747_582206_DCBE342E 
X-CRM114-Status: GOOD (  11.03  )
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



On 1/8/25 12:47, Krzysztof Kozlowski wrote:
> On 08/01/2025 12:33, Shubhrajyoti Datta wrote:
>>   description: |
>> -  Xilinx boards with Zynq-7000 SOC or Zynq UltraScale+ MPSoC
>> +  Xilinx boards with Zynq-7000 SOC or Zynq UltraScale+ MPSoC or Versal Adaptive SoCs
>>   
>>   properties:
>>     $nodename:
>> @@ -187,6 +187,10 @@ properties:
>>             - const: qemu,mbv
>>             - const: amd,mbv
>>   
>> +      - description: Xilinx Versal NET
>> +        items:
>> +          - const: xlnx,versal-net
> 
> It is usually too difficult to use SoCs on their own. Just too small
> pins for our clumsy fingers. Therefore I don't get how this is supposed
> to be used...
> 
> Anyway, provide the user for the binding (DTS).

ok. Let us strip our current DT from descriptions which are not upstreamed yet 
and wire one board to be also listed.

Thanks,
Michal

