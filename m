Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30810C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 20:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hd8H2ar05sIyTyi/fm3Qc9PxK/wDpQkaauDrq6W/aX0=; b=sePyf8/cySQ4cHfEHjD8Qq4T/s
	SsL6aQCbBLVu3xdN/AkyG6S+66Vc3p26vldXogUkBXe7XKy+Rga2xs+4dZEz+mglUcGZZx3LDm8/V
	bFw4iGbD0YN1ID4bt0vpJq3IYaWrohUuwTNnZK8I8t98b2dA4Tk7m0Y+l+PSB5t1A+oMnhvfM9O7X
	ZPc+xXd8nAyQCOFN4kAOGclTbqfoirBG6vQBEUOcdIRk3oytenKkzXhAAcqKx+5wjZlu6HWKrHORI
	CuVkE+CVZbAlQa1xOyLomUrOefy4XzuVCM37Jq4mTOvSxI2ICgzQkybJiZPH8UE21G40+UIZHG/fo
	BrD2OPEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkqMC-0000000EnbB-2xjm;
	Wed, 19 Feb 2025 20:07:44 +0000
Received: from mail-mw2nam04on2060c.outbound.protection.outlook.com ([2a01:111:f403:240a::60c] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkqKi-0000000EnJs-02yq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 20:06:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=movIocIpFOu4m2ABTaH27Y3ipvRqJnxjTB20DJrhAXQ2l3Iraxejr+soROdLhPTZvj11u4qvv4cIuC7QIHicxVwKbu82YE47KUqYvHRHJAAzmxVYzGnNzYkFSmf8g540EgXZDTqdC45s9kD8aXWYnq533jQ/fbsz7Q/jTRBgzvjCFlIxt6vRxLW42dYUqKmnlk4Dt8MY4yvehDn3OimZE9rwy0ie+K8ic8YeN2/paYFfbLNKkrwl67ZaZGTxdVc2AbRN2/sNUDlP7Iois4EaG8eD0HCstjdrzaWM5hjZy3hRJpN4dG027JD7vr/774EjriKWQlZNdAv+9ov5AyuIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hd8H2ar05sIyTyi/fm3Qc9PxK/wDpQkaauDrq6W/aX0=;
 b=Kt9k8IXoWyeiqkTB3GYamPtlaaObFSrgt4T4QkX5sAZfxwxxE8JmKuPo2frn3hIQo2RXieS2yQ8p4H8APlCr5nFEoyPHqmUpC2WKJoV8kad6YkTpwSF0IG6QVZ6wsHpiQoOkunUxmyGIIJLSOBpFAXD9CMzYq1dR1TKmlBP+qN2Sz73fY1LjFYDJz3/pjZ2Wv/5yQL/rd0S2t+I8klrU3w07QGPEeAgmBPHhtPvG6kmv+6ACg+EfGNDqmSpqNnLaOUIVZp+mRCUYxS649g29j5fODDOnE9ffqICJ7CrOxawHohIyITQAVb5D/XNDa7/oku5t+pCJ8ZJhLikZObSvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hd8H2ar05sIyTyi/fm3Qc9PxK/wDpQkaauDrq6W/aX0=;
 b=f1PXcNa+v+hAxijXz4RD2vSYgfIl99Y/3i0M+o/ffEy+mqDVMIFU2offVYbyThvgSx6I9GqgoCVZ2Y2a8HQ1Bn0zeOgT8RUBI1iS8dhPvAO1NLtdr1OCbMKp+QUdGZrIZUXEbSwNjwUiy9hlGlcfDNY7Dr40QbjJzeBEZQyi+7SWld11mAyma4j3ARBjb0nQ4+9cmRw+4x++kX8nEk9FjiIoi8zOayxwK/+qGYdMj5ca+YGWWL5ix/kIhSiFEu/llT5Xpd8aet46ouMH8EUwBMklchJUQkyzVpyKVa3XVJQ6j4Gs+Ray2F/jFaZ0T/nyYk8iyRMRkp/nFyPk8T0PPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA1PR12MB6971.namprd12.prod.outlook.com (2603:10b6:806:24e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 20:06:05 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%6]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 20:06:04 +0000
Message-ID: <fd4af708-0c92-4295-9801-bf53db3a16cc@nvidia.com>
Date: Wed, 19 Feb 2025 20:05:57 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 9/9] net: stmmac: convert to phylink managed EEE
 support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, UNGLinuxDriver@microchip.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
 <E1tYAEG-0014QH-9O@rmk-PC.armlinux.org.uk>
 <6ab08068-7d70-4616-8e88-b6915cbf7b1d@nvidia.com>
 <Z63Zbaf_4Rt57sox@shell.armlinux.org.uk>
 <Z63e-aFlvKMfqNBj@shell.armlinux.org.uk>
 <05987b45-94b9-4744-a90d-9812cf3566d9@nvidia.com>
 <Z68nSJqVxcnCc1YB@shell.armlinux.org.uk>
 <86fae995-1700-420b-8d84-33ab1e1f6353@nvidia.com>
 <Z7X6Z8yLMsQ1wa2D@shell.armlinux.org.uk>
 <203871c2-c673-4a98-a0a3-299d1cf71cf0@nvidia.com>
 <Z7YtWmkVl0rWFvQO@shell.armlinux.org.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <Z7YtWmkVl0rWFvQO@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0204.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::11) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA1PR12MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f730d84-dda5-4174-f143-08dd5120d710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3N2NXVsZjR6Y2hiaHlQZU50N1JSc0dCa2ZteHkvL1VObDB0MTFaTGRXa1Zy?=
 =?utf-8?B?Z0J1cWFJQjZXUStrcWFwUTlnUHJXNkNqVnBGTFBVUmpkVlE5Z2VYVFFxaC9N?=
 =?utf-8?B?TGxTYmpXL2RlczZqcUFiVFZOVWp4WjYvR0NFRUtsbXZIVTBkUTNhZ3oydUIr?=
 =?utf-8?B?Nm1KbkpKaUVPNVlidGFscnVheVFyUWQzdFRUWEVrdjJybU1UdUU5V2pXYnNo?=
 =?utf-8?B?OHBUQktFemRoMkFTcXFNaEc0YjZCVFliUHZXb2xuck5CWTY4SWpCOEx4RUY3?=
 =?utf-8?B?NEc4RjROMUpMZFdkdkNSdHc0eFJoaFMyWDdTaWJIYzlnYVVGT25Wd0dXRm5W?=
 =?utf-8?B?SERHNzFWb3hkUklZbm9yUktGK0FZUXhiRW40MGRWUzBnS0t4Qi84SlN6VHhT?=
 =?utf-8?B?TjVYRnBFSUlleWF5dWdKWER4RHJ2Rk9sR0Y3SzM1TjNSNHZQV0NnTzc5UzJl?=
 =?utf-8?B?TU5ScXZYQkVtS0g4MHpVYzlINzVGRTFaZGVRNFhxYzVmWFNOWWE3NVVyT1VM?=
 =?utf-8?B?cTFpQjJYMWx5ZzU4SlR2K1Y3ei9CZzhoZWFuQVM2N2lJZXRtZHBxSDRna2Vk?=
 =?utf-8?B?MUlxd3U0Q1NsNVArUmtZMXhBRFFLRzVTWHE3NU0vVU5PMEUyM1JjUjJKVFVv?=
 =?utf-8?B?VVVSWjdWcHpxWGM2bmdFOVJvUzZ0ajd0TWlRV0R0Wnh5NTBsNkE1Q1lMK0dV?=
 =?utf-8?B?dkJvamZ3ZTc3cnZOMGMxaWJ5OWU2K1VBYnFyTURnTUJBLzRsYkpxeUlkQ205?=
 =?utf-8?B?bVFsL0ROWCtrb3lTODIyelh6MHZvb1oveERWWEpGY1BKbEw3TlV1bkJDbG4v?=
 =?utf-8?B?STBlbVpoWHUrbm5DVDFwdXoyRVRUbUdGejFmOFNkSFZwSXA3YlI5SkJQc0J0?=
 =?utf-8?B?UFFmUkp6MzFLMzBITlo0MmVOd01mTHRGTjg3Y0N3VWJvYUFhazZpdDdGWCt2?=
 =?utf-8?B?dkg0a3ZoODVVeDdIdmZ0UitLL2hvUmhUNUtqcm1MYlNJR0RPRTg4STNEV3dP?=
 =?utf-8?B?WS9OU09JT2dMRllYUTN1aGI5ZE0vM0N2cGlqb2pRamY0Ynh2RGtKMUprYzhh?=
 =?utf-8?B?cHhsM1ZDNXZlL2l0clBkSlJLVTF1VjBxaHB4L3hrRkVpbHBKbllpTjQ2WU9Q?=
 =?utf-8?B?VUlZQVBKWTBmNTY1eHJkdkhTZWFVVDRNZFg3UG9COXBKcFRhaWdpM09nb2to?=
 =?utf-8?B?YVFVUkdvWUp1VkRZVE5RaWE4SUY2MjJ3TTNVaHlQU0Q0WWdCcHY0emljdUtB?=
 =?utf-8?B?VjNQRHNuY01ZZ0lMQjRkSmp3K0Vqam92Rm01a3FBSHpIdmhyVVQvMW8xY0d2?=
 =?utf-8?B?VGczdTg0SmxsUmdHczU3bHkrZ3hiWmtCV1dpa0VhcC95Q2dIRS9qNDg1cVBo?=
 =?utf-8?B?RnlZN2JtRWY2eGczNjNZR0U4WXpkWS95cmNaaEtwZ2thNkprMFRnNFM5QVdq?=
 =?utf-8?B?akIzUFJVY3BZenQ4dzQxYmFHbnVvWmhaekJiL1IvRzNncmRET2NUNDNDVDQ3?=
 =?utf-8?B?MUtmWWUyNENsYzErMkJtbmlaQytPdHo2bFgwRWFsSFBXQWhrSnQ1Qlo4dk5q?=
 =?utf-8?B?MHMwTGp6amFPQS9IOFVCYjVZZEhvWkpqQjJZN1EvRDJQSXFmbzJOc09LZFVz?=
 =?utf-8?B?MWN3ZkV3RVVQMkc0UFdKZHJsbjJPVC9QVHc4SmxENGF1RVF3cXp4bjR1QTFQ?=
 =?utf-8?B?ZXJkeHRFNy9OTk03bkxJWEZ3SVhjQ3diaDl5Rm1oVlBZK2pYWkNoWmlzeXFQ?=
 =?utf-8?B?d0x5SGl0OWhKZnhrdnBPdFFQY3MrcXVPcXFxZlQ1ajRPVHZqT0pJWXZWTjBa?=
 =?utf-8?B?aXJBOVY3UFNkV1EycVluV3U3QTdrNzZVVXUwd2lLQUQ5NXl4Sm13SG5VT0Yz?=
 =?utf-8?Q?MsD4HxkTjxjDN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHcxRFhOaktYa1p4WGswTCtNd1hHQ2R4R0pkSWg3ZjQ0WkwvY29DRUY5anJr?=
 =?utf-8?B?UlVIQ1lqdWJnVkQzS2Z6L1A5a2NZUXNNdHZYZ1hPWUJqSGdFRGZhQS9RenVy?=
 =?utf-8?B?REtNMnhPUURwcWoxMy9DSFJua1FWakZRTCtKSHRKY3A4R2hIczJyeGdjV0g0?=
 =?utf-8?B?aGRtRk5sekdSdkhtUDNzN05UWndnbkFWdUJlMDNUbllBV052eEhiL2J1TDB6?=
 =?utf-8?B?Qk1SQXlNUzlRV2pneUEwUEkwNUljZThSTXc0N084NXF6b0s3M3ZUVVljVkpX?=
 =?utf-8?B?ZitaUHc4ZlVxcXRzQ0FqbDM2Zm0yTGx2SytoSkxqaFF5dWFDWnFHeGxJd05q?=
 =?utf-8?B?OTNGTGRQY1h1d2RnT2RSTUJwdTZqZGw1cElhcDJBZmx3UTh2ZXZOZUw3TnhE?=
 =?utf-8?B?dzNWRitaRi95dG5vaHFOQmFEdUFjS2tkbjBLblB2dWRlVlBGQ2JCdmd3RTBa?=
 =?utf-8?B?WFBiZk1LNCtHYy8xamZBTVkxUExGMDExY3R4YmdINHZTb0JoVGJxUzlRSXkv?=
 =?utf-8?B?SXJOS0RvRXRrR2Zkc2JSNWJqWlV5Wm9SL1FqNExpTkU0aStGUWtsWWUxVkVS?=
 =?utf-8?B?bEduU3ozYkxOZjQ4Wkhta3pNQ2dKcFdjZWtEdWVlS1crY1RKU1hFTGNkbVVQ?=
 =?utf-8?B?SkU4NlZ3RjZJZVpFUnplNDNBSHgycm9WYm14VmpvazVNY1F6dzBPQm5UVllX?=
 =?utf-8?B?MnVpYnE3TTVsQW5ieTFmVVNqaE5ZeU9Od0dlalptMkNSYU5ScDV2Qm1CZTRB?=
 =?utf-8?B?bFo1VkhwU3BIRG5zd0Mrcml5eS91MmorODhDR0dabVVlRmJJempnRUtBNTkv?=
 =?utf-8?B?eTU5OWZXN0RuVU9qeVVtZ3hPSXJwcXhyeEZ5anRLQlh3ajJyTjRmTzh3QjJU?=
 =?utf-8?B?aWFVckF1eU1PQ3kycDJWQTdjd3ZaVlkrK0xjdTgzQnQvMnFweFcrK21kaGNy?=
 =?utf-8?B?bHhvellKT3VpQklXQmdybmc2S3N3LzNiN2FJZHlqTllocENvZjRRM0txVStn?=
 =?utf-8?B?UElPellBWUtqbks0Z3ZkS082bjhxZUZlS0RRZy8yM0NyK1I1dTcwN0tsMzFW?=
 =?utf-8?B?ZGg3VWsrVlJxenVsODJFN2VDdHF2R0NVZkNUYW9DU1plWWU5SlNMTkJadXow?=
 =?utf-8?B?cldPeEtuSW9pQnVJeGpQLzhwS2MwbVEvajhsSkNadlA1OXdxSm1CWGpBd1A0?=
 =?utf-8?B?b0dyazlIVjQvZ0lZejBoRjFZNjNjYWsraEZENEV0ZTBPZzhWeC9hbm5RWm5Y?=
 =?utf-8?B?VU1qOEhDZHdTMjQzOTRDSW5TZm43RnR6VTIrWGI0Yk5HbHpjZTRCUVd2VUNE?=
 =?utf-8?B?UXJublFsRzU3azgwZ0tjN3BIMWYzenMwRkF0K2tqSlBOODBzUzloQTRCV2h4?=
 =?utf-8?B?enFzeWVqVFJzVzVQQitOOWh5Szl6Y3FEWHl2K2hPcmFnQVI3T0duUGloajRK?=
 =?utf-8?B?VUF4dUhVanN3TFk4K1RzRWJrem9aSGpIZ3NqUkZOKzYzTG9ncFU4ZUdldHc4?=
 =?utf-8?B?K2tLdTNIWXVnYUVmU0NrVzNmMGNKM0xUUDc3UUlhZmRrbEQyZnRsakZwY084?=
 =?utf-8?B?WERJLy84eDY4eUtaQmtXKzNJVmlRZUYwb1AzY0V5MENVZ2xnVnFiL2hhYzE5?=
 =?utf-8?B?UldyRzlpR2Rsbm5lb1l5ZnZzMVpwYVJnbXB1dE8ybTlQdkNSamErR2VvV3dH?=
 =?utf-8?B?K05ZZFd5R2N4UGN2d0twbjE5OGtNNStIbVpYZVNia01pYk9WRmlJK1pqNW91?=
 =?utf-8?B?S2paOU82N2dhdmFxRWtIYzNlVndzVWNkRFRZZkpuU0RmUzIyOVhyK3BhTXB5?=
 =?utf-8?B?c0tiQUs1WXB2YVZHUDI5eVNNMTZsWk04UWUvdFU4MFcwbkZ0U1VZY2lHd1hT?=
 =?utf-8?B?S1FKYklmYTJzc2dVQ21wdmJld1ZzcG5GaUtVNmRvSWg2OVk4VW03VUhtMUtJ?=
 =?utf-8?B?QjIzaVp0bEhxNkRlL1NqeDBqdHlmNTR5QzVzdFIwWnU3MXZiMm9qK1d0bUxn?=
 =?utf-8?B?TU13dXFhWmQvMmN6OVMzNHNDN1o1cUkraUczWUVsdkZlVlRCbXBQZXFVWUkv?=
 =?utf-8?B?L1lZQkxvdi9FTW1nMmU3azNlYXgrR2ZsS0c2QWlob0lRSi9wZkFCM3p6eTlk?=
 =?utf-8?Q?tmNOrdvr4BqUc99EFYvOkAitb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f730d84-dda5-4174-f143-08dd5120d710
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 20:06:04.7446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0mmoCw3AsdJVVviTVCOxtxZsxwfRPnkyY/f1ZjsARKj05PQt7yImfsGN3Wrzm8aE87Ou9xfMU1MfausX20u1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_120612_058583_A61F6766 
X-CRM114-Status: GOOD (  14.45  )
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


On 19/02/2025 19:13, Russell King (Oracle) wrote:
> On Wed, Feb 19, 2025 at 05:52:34PM +0000, Jon Hunter wrote:
>> On 19/02/2025 15:36, Russell King (Oracle) wrote:
>>> So clearly the phylink resolver is racing with the rest of the stmmac
>>> resume path - which doesn't surprise me in the least. I believe I raised
>>> the fact that calling phylink_resume() before the hardware was ready to
>>> handle link-up is a bad idea precisely because of races like this.
>>>
>>> The reason stmmac does this is because of it's quirk that it needs the
>>> receive clock from the PHY in order for stmmac_reset() to work.
>>
>> I do see the reset fail infrequently on previous kernels with this device
>> and when it does I see these messages ...
>>
>>   dwc-eth-dwmac 2490000.ethernet: Failed to reset the dma
>>   dwc-eth-dwmac 2490000.ethernet eth0: stmmac_hw_setup: DMA engine
>>    initialization failed
> 
> I wonder whether it's also racing with phylib, but phylink_resume()
> calling phylink_start() going in to call phy_start() is all synchronous.
> That causes __phy_resume() to be called.
> 
> Which PHY device/driver is being used?


Looks like it is this Broadcom driver ...

  Broadcom BCM89610 stmmac-0:00: phy_eee_rx_clock_stop: clk_stop_enable 1

Thanks
Jon

-- 
nvpublic


