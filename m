Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C58D6EC0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 14:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAYk1NDlsrRk+ebp13m6UKwvkmEwaVHKlYCTcWtpRPQ=; b=yV8j5HnJXi1aD4xdZVF0vtBg4E
	vrEkU6KCu5oOSM4CqfLwTa4AZvcSemIaAMrY8qiDUr2f3c/HUz99oDw2C2GAI5a8Hm/zxEOeMYa8L
	RNKMW9Xf+cFle+DXkTJvvy06s/fMYzH+p/SJBxBlO/qKA+eAxji2qs0Es2qgvLehqpFkUMuFxP4ih
	CxU5Bw7jKhKPPJUyJhwXsLYiAN0WYM6Iif0VBWqvhMqpTZ4R/POIB0sO7bQY31A3cdXToQm19+pCc
	2m9s8vgjWXg01cGBH6jkzxtPROOcdEB1V6RYteNzcXJyKt7I94nuSXUFbxD7Txdbp17i4Sk2sidji
	KK7hVoKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH1bS-00000000Ggz-2ByT;
	Fri, 29 Nov 2024 14:04:14 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH1aU-00000000GbT-0SGj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 14:03:15 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT9j0Eb021810;
	Fri, 29 Nov 2024 06:03:07 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 437b8ggcn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 06:03:06 -0800 (PST)
Received: from m0431384.ppops.net (m0431384.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4ATE36ub025593;
	Fri, 29 Nov 2024 06:03:06 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 437b8ggcn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 06:03:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StqAuIIupckJywekixjHisg1bhp5hEjkYTfYA/FXgqE1fZ5gc8lo5plOGJEgm11Wvlj1MH5pDQgGPYB1hQVOGfHBVd1SCFyHCXuCejzcK6l2JLVdDRTmfX8eXX1ZBzNgeyiGj5uD2UOVZqggVj6Yx9oiujOJQDbXaXjckMcNCpKuHGjGJ/LdcycyL7tc8CGiI3UEMtthebZbRKp1O6ZdGQgX5s0DTSfJdYVmG9MsXm5NG/xQ3h20gdOnkT6+AgGAgF9eh2adYxCpaojqrTr2rr4RlIk6khmTXFVpybofWhWyjZZ9gy+n2YYSNCjcuQbR6EpdSUfE1ta8bgdnbeP81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAYk1NDlsrRk+ebp13m6UKwvkmEwaVHKlYCTcWtpRPQ=;
 b=huFalunBiTKGXVtzD4V9Ba/0NWUJvepb89ZPCXs8miCCoe42woWYPBjxcjHsyUZVzGKBXdqfsneQLAiC3ZLGPpUmEV1gbNB19pZeiDKCv2D3PhhTPWvHhPssKkSkbeWNFhUusd71c50sK06IRNYJG0vtZRiCqUoPRi6+9vd4k4iUavzHCAPotaJxZ5OOw27R22VDxjQw9VZPWfZ2uHitVUWt8Sdurt048TCU9eI0TF06NV0qcGpXa7Bm00NmotSdNJs5m/FNPc+pRmCRRYNPbzCnaAcIFJV7eUKWZ54hDQzkqG/Sd/1vLLwNLZhVGWReiu8mS2Xv6J4Jv2Nu11mZ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAYk1NDlsrRk+ebp13m6UKwvkmEwaVHKlYCTcWtpRPQ=;
 b=fnHGfbmTPzwCs9fi9WE/xm2PkCsRSCuLjY2OzjCK5GWlRLRoyGuOfESzF0ikjPdyqus/w1S6hQbPf4u3CG1jiXouuaLa5HizLw9fc0FTYumz6a9BvXdHCKXeba+Hv5opCGDHt2Xz+6B4gW1KGOPLTvxRCp3a/iMZYtsvcJhxCdI=
Received: from MW4PR18MB5084.namprd18.prod.outlook.com (2603:10b6:303:1a7::8)
 by MN2PR18MB3637.namprd18.prod.outlook.com (2603:10b6:208:24e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Fri, 29 Nov
 2024 14:03:02 +0000
Received: from MW4PR18MB5084.namprd18.prod.outlook.com
 ([fe80::1fe2:3c84:eebf:a905]) by MW4PR18MB5084.namprd18.prod.outlook.com
 ([fe80::1fe2:3c84:eebf:a905%7]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 14:03:02 +0000
Message-ID: <a7182597-b45e-40cf-baeb-60f69ec2365d@marvell.com>
Date: Fri, 29 Nov 2024 19:33:19 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 2/2] power: supply: max17042: add platform driver variant
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Purism Kernel Team <kernel@puri.sm>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20241108-b4-max17042-v4-0-87c6d99b3d3d@gmail.com>
 <20241108-b4-max17042-v4-2-87c6d99b3d3d@gmail.com>
Content-Language: en-US
From: Amit Singh Tomar <amitsinght@marvell.com>
In-Reply-To: <20241108-b4-max17042-v4-2-87c6d99b3d3d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::34) To MW4PR18MB5084.namprd18.prod.outlook.com
 (2603:10b6:303:1a7::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR18MB5084:EE_|MN2PR18MB3637:EE_
X-MS-Office365-Filtering-Correlation-Id: 3840427a-82eb-4c9b-5d23-08dd107e89db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTFKWGtMcEttZk1teUxRKzJnOW5yYjZ4OHhPbE5NTm5pYzQ5K0JyVUpEbHk3?=
 =?utf-8?B?RHpRQ254K1ZuTW5kdW00MkVuZmNnRDI0eWdlZHdZRlZvcHFUdHhaQUJTTnJa?=
 =?utf-8?B?UGNicytIMW9wT1JvQWhzczNYUUh4UDJIZktTbGtRNHRLanlIWEw3a3gycnFz?=
 =?utf-8?B?Y3ZLSXJaL3lHT3gzNTRYRkw4c1piUW5pL0lqSUk2ZTJ5MCtVcUdyS1B0NUxq?=
 =?utf-8?B?V3JZNjQrWTRBWGQxMDd1eXZCZFE0ZWZnL0RZS2Q5RVhmd0R6ODFneUVKNm15?=
 =?utf-8?B?bDI0Y2lkVlVTd2FIOGxNaU9LMVMvVjUrTi94Ymt3TjFPTTVtc3prcXdFRS94?=
 =?utf-8?B?ZDRxOFJTanhhcmxncnlLQlZBVlM0STJDRTg1YWFmNG5UUTBZekhnQkJVaEk5?=
 =?utf-8?B?QkhoZDJmTEJmVnNWbGRwa0RYeUFPUFJmZkFvWmhqUUxPUFdYTmVabVpzazVo?=
 =?utf-8?B?dnAwdWxpSzZwSkd2MFFkZndiOHlaZkdrRlVTVm1sV2V5WktzTFFHMlI5d2JO?=
 =?utf-8?B?bnhJUkR5NHZaYzQ2NUI1VGF5MVRDd3ZZbmhVY1p1MGhQVmJWakRlN1E3aG00?=
 =?utf-8?B?TVMreG1MZS9QNHczaXBDMlBsM0hOcjd2NTFGcTJzTmxjRGF1U3NzUVZYcnFR?=
 =?utf-8?B?cjVxSS9MV01LblJsVFRqTmMyQkp2a2FQekswejBBWEhUckhzYVNtVjRyejBU?=
 =?utf-8?B?Sm5ITVZ5S2VKcUZTUFE5UGFNelpqMS80NXhPZnJUcVFLdGRkSmY2Yzkyb01Y?=
 =?utf-8?B?WVpkc0tVK1lOUVQzdHhaYXdySVN0djR6akp6QTdLQmpzdUtZYjMybDVjejZi?=
 =?utf-8?B?eVdZNWU4N2p3ZnBQci9SUmtMY0lpT3NSY1VJZUFpdElTSVVjdG1rdWFjdU15?=
 =?utf-8?B?SWdMNHYxZGtSSlV4ZUJtQWNvTjloRTRFOGFYTXpvK2t2aHBnY0tERklNb0Jq?=
 =?utf-8?B?Tzl6WHFraDFVeVB1TEVlbjhhN3FpY2NBTWgxOEFJeTBoWEw2OTBFb01pUWNp?=
 =?utf-8?B?SG9MbVkxYWJqUTVEZ21RaXZ6QmljWk51S05OUHdWZHVuMlNCOW1TK1NDb1F4?=
 =?utf-8?B?TTM3VWtNb2NhQzJ0b3kwbVNJQzRqUU4rcU53aDZQTGVhellBWkNDN1gwdm5i?=
 =?utf-8?B?M09ONm02YXRudTkrNHZidTh4d3hQaXVPdTZKQ0NwT2htWFVlcXZEZWhadXJl?=
 =?utf-8?B?bEVhZGZvUGpCeTdkei91MENkMUhQUmExR3Ruc2hHS0xxQnFPVkhmeGRxQkp2?=
 =?utf-8?B?WWRTcXY0aEFNRDNyekxFeWcvOUJDRUNyMzRmWm1DU0VIRWl2d2d2aFZ6d3A1?=
 =?utf-8?B?RksvNklHeVpaSUttcmNVaHlUVDdQQUZKWkJTU1pUb3lIUElrUzAwblI0QTBl?=
 =?utf-8?B?NitIQTlJVHZrTk5YRlpKQnF5ZWtjMmh4dXYvN0FoT0ZUU05ITTNZM3BqM09n?=
 =?utf-8?B?c01mako4YWh3VXlFN01kRmY2b0g1VjZKWVdTUzR2eHB5YVBENEZOdVk0V3Rn?=
 =?utf-8?B?RlpaZTJ0emdpUFhuTXY5bXFMdHc3Y2w0bGxwMGc3b2d1WjM3cGRQb3lNbVJo?=
 =?utf-8?B?NHZyZ0s5aGx2ZTdpeDUxY3VtOVh2ZC95ZEtVeHBBM3A1WDl4dUpDNGdqY0pv?=
 =?utf-8?B?SU1kbXpleHBhbFBNUXRpSCtUenp5Z0NJTktONnRERlRnd1NGTVI5aStUUS9Z?=
 =?utf-8?B?RDZkVW16dHFtaGlRUTJ3T3l4MkxYVFJObGdVMDZTclZyM1AwYVZQSFlxcWpZ?=
 =?utf-8?B?MWtVSDgxRnlSZWl4SlFpQ1RmWXZaTFdXQkF3Ukx4cU9sSGltU3ltUWhxdllo?=
 =?utf-8?B?bitWNGtPRlJBYW81Y250NUQwM2ROZ0x5aTBVeXlteHVjbGVRc0tpQzBsaGF1?=
 =?utf-8?Q?zD3p7RUuwUp7K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR18MB5084.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVo4V1c5SHBrVUdrZW52eXdVZmRWc0ZOR3RjWFdwZjhFK0Y2YldxWjlRcVVM?=
 =?utf-8?B?RFdTY28xZFFxcjNLTmNmcFVlUHpkSFAwaW90S0xCV2NIN2xBQ3hoMGJSbmF2?=
 =?utf-8?B?RHhIOXdTc2JGeXcxcVU5OURPWlZBaDN5VXNXZWtROGtTbXdGQVVLRThjWWRa?=
 =?utf-8?B?cUVwempyTFVLRi9lRlJnZlZVcjRsbTBjY2Njd0NBQWpoSVdXZDBnTUhtampP?=
 =?utf-8?B?N1Z0QldnWko0NzhFSXAxYkZyRWoxOVhCSVVUeHZCbk5nOEFPVHZQdUMxM055?=
 =?utf-8?B?NDFUQ1dVVm1kdVo3bWhhOGpQUWFDazlGMGFUbms3dnhwNjdCdEo2VjdFVnhY?=
 =?utf-8?B?WmlxdURmSndrbXJUY1MwQnk5VUZPb0FMd0phcHFrSjB2TzBKUi9FcTN4V2Rj?=
 =?utf-8?B?akJBNFBlNmlwVU5QTEhGS0NtNUZmWmxQK0tYUmRBTE9aVDI4M2pZUWE4L0M2?=
 =?utf-8?B?Y1lFSmJTbGhUWFBRMEYvSzJSK0NId0NnYmRBNW5CRzJGY2tDV2ZXSzhnNjA3?=
 =?utf-8?B?Sms2Vms1eDRZM3IxWTJNUGUyVysxclBkQTJEVURjZlpwYjZWZS9QV2RxY2M5?=
 =?utf-8?B?L3lKQUU2Tzhmd29yQzNCS1I0T0poSGtxM1JFRlpRendURUlXRTltenVTOGZS?=
 =?utf-8?B?ZTNVS0V5WE5aNys5NlJYR3piK1J4aGVBTXNFTWUwM1ExRWxrRWFCTDdzbllC?=
 =?utf-8?B?UU9HNjZhQ1pZOXdUUFJFVktJWFh2dDJzRlhJYi9HU2Q3aE9wREJKK2wzZHUx?=
 =?utf-8?B?dXlFT0V1WGNCQ2pjVWVBWUNPMlZyL0o2N0hxOGdFaVlRUHBrRnk2QkFxTnEr?=
 =?utf-8?B?b1NJQ0Z0WjJkTFduOGo3dFRSeVhIWitPZUxoNWdtVVFWaHQwRWJBYjJMbC9S?=
 =?utf-8?B?MjNvSTNpZ3g2Nm9VeWVNL3c0cUVUQ0JKdDNlNncxVXZqWVBiMXgrY1dVbFVO?=
 =?utf-8?B?L2RqV3FFK0M3RnIrKzA2RTBEbjVuZmd0SkZlcEh0cWFIL3hKdlFNT3VvaUIr?=
 =?utf-8?B?bVhvM0FKa2x3VndDWjFQbkppaEFxMlVuZ1IvTnJua0JKeWVQT01uWG4zOEV1?=
 =?utf-8?B?NDR6azdtcnBhQ3RxNGtsV0JYcWlyNzlrbTNLMHcrMlhXOVQxN0JoRnpBS3Na?=
 =?utf-8?B?WWhiYk1qS0hNK3ZlYjZlRTFsTkU3SW9CUDhOK2ZQVk8vMzlSU1ArZWFCRTZs?=
 =?utf-8?B?bEpJWDRBNEFOc0JtNU1wck1nT1dZcmxJRTB0TG0vVHN3N2tINXVNaXVnRVc2?=
 =?utf-8?B?c3FYczFwN092NkcxTmVUNVRsSU9tOFhOUC9RbjVEaUNhSG9CVkh3L0J3OGt0?=
 =?utf-8?B?dmVlbWNhdnNKWWtaRGdDdi9aUlpoYkhLUXVCMjc0ZjhJU1M0SVdLYytoQ0Fr?=
 =?utf-8?B?Uy9NYit6MDZFL2VRYklxMDZKaStvRW42SjEvZHBtWnBrVTZxY21wczRhcGo1?=
 =?utf-8?B?eTdOZnBFWERIdWJLTmFRdDlDM3hLWXdLWk9IR2lxaEQ5MDArQmg2UUM0WWx6?=
 =?utf-8?B?cHJZRzNGSzRYRnVXRDh2dGxWeUFTSHY0ZzJhZjVJZlBsSXZFaktEN0FsZm5B?=
 =?utf-8?B?b3RvZzl1bWppaFJGTmxPU1Nrcno5NVp4QWNwdnBKNnpObjZJaFg3SHhxZW83?=
 =?utf-8?B?RzljMVo4cXpQM2tmbEVFK1FWY0NpMEs1RlpUcDAwOGZ4ajNwNTBtZ1lLVTJv?=
 =?utf-8?B?dWV2aWJ0VkZpOGFUNkVOeUxaVk9tbE9VZU1kZkNBcFJkVE4xY2RlN3A5dUdi?=
 =?utf-8?B?aG9HZVlHNkFDeTRjOEVRaW5WVXFxcUFCMUd1dUpwQzR4WFdWak5OL09WYWsr?=
 =?utf-8?B?RThtVlB3K2hSQXA1OUVzcy8yWHNBd0tvRGM3WWFILzlMU044NGxja3BBYlRj?=
 =?utf-8?B?bnVodk5ZR3JqQkI0SVJiazRHN2lQY1laRUlRVVpTRlVKWWZoMTlQYkw0Sjk0?=
 =?utf-8?B?anJ6Z0M2eUNLNU4vRVhVcStwSEx1a1FhdHZXUklId0JBTzh3c25TKytVTmhO?=
 =?utf-8?B?YUtCbGYrVm0zTlNKK2JGclJPT2hEenViWm9NbDNtdWtZd2lhKzNCa21HNFFw?=
 =?utf-8?B?d3FSd1ppZ3l6VEZxOEtIVWFmVnVlQ29kQUdwOHNneXhHelVYNHZxQmFadkhi?=
 =?utf-8?Q?MBjk1K07t7YvziX/n7LWF93Fl?=
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3840427a-82eb-4c9b-5d23-08dd107e89db
X-MS-Exchange-CrossTenant-AuthSource: MW4PR18MB5084.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 14:03:02.4813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wzmYohqbP3K2tYD/OisWrvf7aJczDXzxz8pcugJ/DK86lLUIe/Vp4chZ0wOTQ7X+wn3HGbtS3AKi++iFkvyzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3637
X-Proofpoint-ORIG-GUID: 9dUd_2lhdgGamfVVSUgfbrdwU96RfY2I
X-Proofpoint-GUID: hDWr5eL1obYM89H7nHmavnjrevDyJqH-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_060314_183774_C362D4B9 
X-CRM114-Status: GOOD (  22.24  )
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

> 
> The solution here add and option to use max17042 driver as a MFD
> sub device, thus allowing any additional functionality be implemented as
> another sub device. This will help to reduce code duplication in MFD
> fuel gauge drivers.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Changes in v4:
> - rename module_init and module_exit fuctions
> - rework max17042_init
> - assign chip_type in probe function
> - pass i2c_client as pointer on pointer, to use same pointer created in
>     MFD. This allows devm_regmap_init_i2c to cleanup gracefully.
> 
> Changes in v3:
> - pass dev pointer in max17042_probe
> - remove prints
> ---
>    drivers/power/supply/max17042_battery.c | 116 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------
>    1 file changed, 92 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
> index 99bf6915aa23..6a1bfc4a7b13 100644
> --- a/drivers/power/supply/max17042_battery.c
> +++ b/drivers/power/supply/max17042_battery.c
> @@ -16,6 +16,7 @@
>    #include <linux/i2c.h>
>    #include <linux/delay.h>
>    #include <linux/interrupt.h>
> +#include <linux/platform_device.h>
>    #include <linux/pm.h>
>    #include <linux/mod_devicetable.h>
>    #include <linux/power_supply.h>
> @@ -1029,14 +1030,12 @@ static const struct power_supply_desc max17042_no_current_sense_psy_desc = {
>    	.num_properties	= ARRAY_SIZE(max17042_battery_props) - 2,
>    };
>    
> -static int max17042_probe(struct i2c_client *client)
> +static int max17042_probe(struct i2c_client *client, struct device *dev,
> +			  enum max170xx_chip_type chip_type)
>    {
> -	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>    	struct i2c_adapter *adapter = client->adapter;
>    	const struct power_supply_desc *max17042_desc = &max17042_psy_desc;
>    	struct power_supply_config psy_cfg = {};
> -	const struct acpi_device_id *acpi_id = NULL;
> -	struct device *dev = &client->dev;
>    	struct max17042_chip *chip;
>    	int ret;
>    	int i;
> @@ -1045,33 +1044,25 @@ static int max17042_probe(struct i2c_client *client)
>    	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
>    		return -EIO;
>    
> -	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
>    	if (!chip)
>    		return -ENOMEM;
>    
>    	chip->client = client;
> -	if (id) {
> -		chip->chip_type = id->driver_data;
> -	} else {
> -		acpi_id = acpi_match_device(dev->driver->acpi_match_table, dev);
> -		if (!acpi_id)
> -			return -ENODEV;
> -
> -		chip->chip_type = acpi_id->driver_data;
> -	}
> +	chip->chip_type = chip_type;
>    	chip->regmap = devm_regmap_init_i2c(client, &max17042_regmap_config);
>    	if (IS_ERR(chip->regmap)) {
> -		dev_err(&client->dev, "Failed to initialize regmap\n");
> +		dev_err(dev, "Failed to initialize regmap\n");
>    		return -EINVAL;
>    	}
>    
>    	chip->pdata = max17042_get_pdata(chip);
>    	if (!chip->pdata) {
> -		dev_err(&client->dev, "no platform data provided\n");
> +		dev_err(dev, "no platform data provided\n");
>    		return -EINVAL;
>    	}
>    
> -	i2c_set_clientdata(client, chip);
> +	dev_set_drvdata(dev, chip);
>    	psy_cfg.drv_data = chip;
>    	psy_cfg.of_node = dev->of_node;
>    
> @@ -1095,17 +1086,17 @@ static int max17042_probe(struct i2c_client *client)
>    		regmap_write(chip->regmap, MAX17042_LearnCFG, 0x0007);
>    	}
>    
> -	chip->battery = devm_power_supply_register(&client->dev, max17042_desc,
> +	chip->battery = devm_power_supply_register(dev, max17042_desc,
>    						   &psy_cfg);
>    	if (IS_ERR(chip->battery)) {
> -		dev_err(&client->dev, "failed: power supply register\n");
> +		dev_err(dev, "failed: power supply register\n");
>    		return PTR_ERR(chip->battery);
>    	}
>    
>    	if (client->irq) {
>    		unsigned int flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED;
>    
> -		ret = devm_request_threaded_irq(&client->dev, client->irq,
> +		ret = devm_request_threaded_irq(dev, client->irq,
>    						NULL,
>    						max17042_thread_handler, flags,
>    						chip->battery->desc->name,
> @@ -1118,7 +1109,7 @@ static int max17042_probe(struct i2c_client *client)
>    		} else {
>    			client->irq = 0;
>    			if (ret != -EBUSY)
> -				dev_err(&client->dev, "Failed to get IRQ\n");
> +				dev_err(dev, "Failed to get IRQ\n");
>    		}
>    	}
>    	/* Not able to update the charge threshold when exceeded? -> disable */
> @@ -1127,7 +1118,7 @@ static int max17042_probe(struct i2c_client *client)
>    
>    	regmap_read(chip->regmap, MAX17042_STATUS, &val);
>    	if (val & STATUS_POR_BIT) {
> -		ret = devm_work_autocancel(&client->dev, &chip->work,
> +		ret = devm_work_autocancel(dev, &chip->work,
>    					   max17042_init_worker);
>    		if (ret)
>    			return ret;
> @@ -1139,6 +1130,38 @@ static int max17042_probe(struct i2c_client *client)
>    	return 0;
>    }
>    
> +static int max17042_i2c_probe(struct i2c_client *client)
> +{
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);
> +	const struct acpi_device_id *acpi_id = NULL;
> +	struct device *dev = &client->dev;
> +	enum max170xx_chip_type chip_type;
> +
> +	if (id) {
> +		chip_type = id->driver_data;
> +	} else {
> +		acpi_id = acpi_match_device(dev->driver->acpi_match_table, dev);
> +		if (!acpi_id)
> +			return -ENODEV;
> +
> +		chip_type = acpi_id->driver_data;
> +	}
> +
> +	return max17042_probe(client, dev, chip_type);
> +}
> +
> +static int max17042_platform_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct i2c_client **i2c = dev_get_platdata(dev);
This seems a bit unusual; can't we just use:
struct i2c_client *i2c = dev_get_platdata(&pdev->dev); instead?
> +	const struct platform_device_id *id = platform_get_device_id(pdev);
> +
> +	if (!i2c)
> +		return -EINVAL;
> +
> +	return max17042_probe(*i2c, dev, id->driver_data);
and then just pass "i2c" here ?
> +}
> +
>    #ifdef CONFIG_PM_SLEEP
>    static int max17042_suspend(struct device *dev)
>    {
> @@ -1204,6 +1227,16 @@ static const struct i2c_device_id max17042_id[] = {
>    };
>    MODULE_DEVICE_TABLE(i2c, max17042_id);
>    
> +static const struct platform_device_id max17042_platform_id[] = {
> +	{ "max17042", MAXIM_DEVICE_TYPE_MAX17042 },
> +	{ "max17047", MAXIM_DEVICE_TYPE_MAX17047 },
> +	{ "max17050", MAXIM_DEVICE_TYPE_MAX17050 },
> +	{ "max17055", MAXIM_DEVICE_TYPE_MAX17055 },
> +	{ "max77849-battery", MAXIM_DEVICE_TYPE_MAX17047 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(platform, max17042_platform_id);
> +
>    static struct i2c_driver max17042_i2c_driver = {
>    	.driver	= {
>    		.name	= "max17042",
> @@ -1211,10 +1244,45 @@ static struct i2c_driver max17042_i2c_driver = {
>    		.of_match_table = of_match_ptr(max17042_dt_match),
>    		.pm	= &max17042_pm_ops,
>    	},
> -	.probe		= max17042_probe,
> +	.probe		= max17042_i2c_probe,
>    	.id_table	= max17042_id,
>    };
> -module_i2c_driver(max17042_i2c_driver);
> +
> +static struct platform_driver max17042_platform_driver = {
> +	.driver	= {
> +		.name	= "max17042",
> +		.acpi_match_table = ACPI_PTR(max17042_acpi_match),
> +		.of_match_table = of_match_ptr(max17042_dt_match),
> +		.pm	= &max17042_pm_ops,
> +	},
> +	.probe		= max17042_platform_probe,
> +	.id_table	= max17042_platform_id,
> +};
> +
> +static int __init max17042_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&max17042_platform_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = i2c_add_driver(&max17042_i2c_driver);
> +	if (ret) {
> +		platform_driver_unregister(&max17042_platform_driver);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +module_init(max17042_init);
> +
> +static void __exit max17042_exit(void)
> +{
> +	i2c_del_driver(&max17042_i2c_driver);
> +	platform_driver_unregister(&max17042_platform_driver);
> +}
> +module_exit(max17042_exit);
>    
>    MODULE_AUTHOR("MyungJoo Ham <myungjoo.ham@samsung.com>");
>    MODULE_DESCRIPTION("MAX17042 Fuel Gauge");
> 
> -- 
> 2.39.5
> 
> 


