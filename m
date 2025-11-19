Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D686BCF256A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 02:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jniKW+gjSz6592uOFsyR1I+BCin6SAxvTYM+S2KdxFI=; b=Tx7LYD3dxF2BrID9AfSbXG8TWN
	PJZLwWZpf7jbokpL2eFyYnXKE1ylchQ549pikK5uN/IFcqpIz535Cm7TKIWkZc9wWkye9KxwgrjiC
	FoOl1awJaDap8lpXUVwrKWVUrw0iLvPM79ZkTWOwNExqthwDRdrjsi8FDVEPB8fIpcL6jA8xEvKxQ
	ePckbeeo62x632T+68wh+0w5rmOCa2NUdT8SDZYYElcPE+O0EtII6maZxCczLKyhaQ2+/WjkxHSQB
	nvoLkm2nXS49gNEMu2AFvZGqjZKe28QkOXnFn0X5PO6gc+V/FItvgbOnGk3s8XyVsdESVV1u3fsuP
	FESxcMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXyW-00000001OTu-2hPv;
	Wed, 19 Nov 2025 02:31:16 +0000
Received: from mail-japaneastazon11023121.outbound.protection.outlook.com ([52.101.127.121] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXyU-00000001OSg-1pRb;
	Wed, 19 Nov 2025 02:31:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKLTGawEZhqaQZ6B5tlQdEUgjRRBfwnayqkgg4vnyiYYr1yAnV1T6R0PLjf7bqlQuxofpBIympwDbLj6yVnpFlOHGs7tfY17dUVlZvvBm4wMD9kNeSc4hYKFhWUBwp5jPxORpUlHH7nvF8Vb5fxFjf5apjRTF7z3gqVrFVNCq8xmEDHGWDQfPvh2102H1xgtnB3oh5ZwB+0ukEmqvGLZ4QqyR9CnyZFp13Rl0hvfQQOwg53ZEZtNL8KP3/id9faJcw1dN/TWf0jRsZLEI/g+R7BKYRigt0FSvuue1GX3uI+pPcKnsegXNUqTAvi2tXq6vljuq4pfMJOlKswcxOSGaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jniKW+gjSz6592uOFsyR1I+BCin6SAxvTYM+S2KdxFI=;
 b=UuK7bVzQgGkv/dcSxlPm1zaG6mEcqoulk5MwZtOXivD9CbCTlYr2N9gzVrtl0D+/hVOqZp6+IMvnLsZZJ1lH4AsUKccHZMnEBeT8jtgzluoVF38+zt88kW73MHuLUO4/hM65uEmFSoConbqQ0V+X9Lu20OdovKbuXa35TRoDNDc09KuWxm2okliKdd59uCZoPe3FrJOE/TBWhUia94MNgKObsKfmSwfup6b+RWYmhBU8S2WqJOxDhvaFoVXpQzv0gXDgv793bpHINYH+f7PkemK3XggACZD8GfiHqLNNPuiQTVbowXkXYHuLqyC9m655fp+yh9aoY7Y/zPdnpkyd9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jniKW+gjSz6592uOFsyR1I+BCin6SAxvTYM+S2KdxFI=;
 b=MoMWDiM+5Ngyex1hrUzPGig7Sg+0xhOztU3in65UWFSfAte4jVU2ufVzXxA2YcFeEbuD50bfv9P057L8Bwa7zbSLGnc214P/utkB+GEZXIeRzKqQz0uFpuo11goPcrvJMRFvv0qaBebc6bSSUuunvZldcxm1aodkPmerRVeZN/Nh2IM+n3hRGUT8FapmW5qyK3/TkK6ibJRrvrdtmvk+FUGZ+zIQw6sgvKgdODsmQT3JlP3kNQCUUea6aTBu8Un0whZpntg9bjleK/aVe/9e4aV+Yav+Ci3NFmq0S9gYz6QSSUIc7JLgkp12hF0U4U4zuC8PvnGxQAOgsttJ2kI7OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB8162.apcprd03.prod.outlook.com (2603:1096:820:ff::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 02:31:04 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 02:31:02 +0000
Message-ID: <8e140ad4-3898-4756-9847-8d7fea0676e9@amlogic.com>
Date: Wed, 19 Nov 2025 10:30:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] soc: amlogic: meson-gx-socinfo: add new SoCs id
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
 <20251118-soc-info-s6-s7-s7d-v2-2-38e2b31a88d1@amlogic.com>
 <CAFBinCBnupgH=6NQH0oPTj3ETVkLfCB6aVyMySAqAxNEAHnuew@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAFBinCBnupgH=6NQH0oPTj3ETVkLfCB6aVyMySAqAxNEAHnuew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P286CA0020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::13) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: fd9b603e-ee49-4c93-9dd1-08de2713aecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N21MVHZkRW1vUFhhL3hrTXFyZzhmb0h6NEtvM0NFRnFTTTRxMERoTnFRNGpE?=
 =?utf-8?B?L0ZLM01mRmZrdmNNYVVINXJZeTAwSytNODQ2SU53RklBMkpVaVB4QWtYV1Na?=
 =?utf-8?B?YXZtbVJmdzM3UkRuNzcrZi9aVno1aTYwUUh4eVRKNXBieU5RTmFNVHdhOTdj?=
 =?utf-8?B?QUJPMkFyazcrb0pqb3kxY1czNUpybXEwK3EzL3ROMmlxVXpSTkZaQmpXR2U4?=
 =?utf-8?B?MWFSRDJRK1cwNTlEUVY5dk8yWnljLzVLb1VBcXFNdWlka1BwR2s3OURIUGV5?=
 =?utf-8?B?NWFBKzFvSlc1dWpndi9GTzFvSG8vVXlwcGpFS2xZdkJhUDBzN2lnODlxZnkr?=
 =?utf-8?B?bHh1MzQ3Q1l4c0g4NnZRc0JsYVJEMlhTcUx4czh1RDRVd3hwWGhFdC93SkVw?=
 =?utf-8?B?OTZrMWJpWldNcGxZTndRNkR0SHBkSVgvK0Q0WXBtM3VqalRCTEY0N1pVZ2Na?=
 =?utf-8?B?a1B3WFVsK3o5N2pZWE5hOUNaY3VaNHg3YjRlRXBpSnQvRVd3NE1tdjBWbjc4?=
 =?utf-8?B?VCt3MEFYeFlac0tBS1cwa3dYNW4wS3AreStKUjQ1amdpRWJqUThxdVVGTHVx?=
 =?utf-8?B?ZEI1NFFEZVprdVprVlhUQTBiSFZPZWVWcHpVVnVHckMvbUR3NTFnZytxTDdr?=
 =?utf-8?B?MEl2VERkRFJsZmR5LzZiRVBobUI5ZmxPem5waFZLMnNQQ0sraDYzVjhJTWxy?=
 =?utf-8?B?ZFN6OFE0bU5UL2tRTGQ2dlgybWRSS05hLzBlaUR5aW1YL3hZZUl6WmlkMzF4?=
 =?utf-8?B?bWlaUzFNRjFLSHp0M0t6Zkg1RXJ6SDFDU1hhazlWSDhycW85WmZLTzJkS0Vz?=
 =?utf-8?B?bGxnbG5LclRjNjE2Q1ljMzdkWTB2ZDgxMndZNENDa0dDZTZJMW9wclVqazEv?=
 =?utf-8?B?d3doZHNiZ0djVGpJcmpMWXNGZTA4WnQzT2FuOG05NWRQczBEOWU3MjB3WGQ3?=
 =?utf-8?B?SjBHWFdHNWw5NjdaKzhLUGJwc0tGeGdMV3NEOU1VakwxdXdpcVBPZkNXMS8r?=
 =?utf-8?B?a2cwWkYycXdxbm1jWWNBMXY5ait6eFhFUkVSME1zaUdIUkZuemxwQngraEZn?=
 =?utf-8?B?d3ZoZytPbkRSZy9qWGNDcTQ1aUNGRVJJVXA0Z3BpWG12Y0UwRnpoS0NVMFpw?=
 =?utf-8?B?ZVNxUHJvbzA1aUgrWTBUblpCQ21RZHM0KzJaZk5PTGFrRXdiWStxeXk1UWRD?=
 =?utf-8?B?cDJaSFd4THZxQThmK3VpSUpMeVFSNWlManRKeXgyL0kra0hHd1FTNmMxRVNQ?=
 =?utf-8?B?U0tYQlNOdmI1OGtvaEZIWi9wb0kxdVBHcUt6NFlMUngzQXphci9UeDVoVzBX?=
 =?utf-8?B?ZmZaMEpuNUwrZmxFQ2JDR2prcUxoc0d3MkJFM1JTUFg2a0lFRHBxVkFJWnNp?=
 =?utf-8?B?VnBHc1F4WUtXN3hHVGtpRVBPSDZhelhSdGpXNlZhelVHbnAzUDJKdlRPcm5I?=
 =?utf-8?B?SFFWMGFtS0NtdVNLczEwdHd5WDR1NWhGVjF5T1dKc3FMZ3A2cTh0TElPaGVX?=
 =?utf-8?B?UTJCUzduaFlWUFpOQ0tJRGQ3NzZ3a1BXK1paZlV2UFU0K3NGZ3pRdFZXYjJo?=
 =?utf-8?B?SjVGMjdpamVXb3dtMjlUb1FGWkNzV2FjY0I5Q2tjU3RtdEY5dE5PYmwveit4?=
 =?utf-8?B?eVFvdmJ4T0lXcHZhYUp3RDZjczNkYitQbytlM1VjbjNYZmtld0NrTTVMVStH?=
 =?utf-8?B?eDVPZzNqL01zSUMxSTRqeHV1UndVUzNtSythZGtpOE84c0RKeUxEeXZLL2pl?=
 =?utf-8?B?aU4rTE93d3h3TDdmOUMrWWxDdmFsOEhEak9VR2I0WEtsQm10YlNFeG9IRzhz?=
 =?utf-8?B?RVN3b2w4N25pTEduN3RPODNtT2ROT0Z1VDZGUjNzSzAwdEZKRkQ4N3NTV25j?=
 =?utf-8?B?OWNPWHZhU0xVSWVHdHloRVJSV2Y1UHVqVnVVdW5qTVBROVNzT1RPVFNNQUxm?=
 =?utf-8?Q?4S1QdHLIQunlY9iipWqqJe9ium1SAJRu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3hyNitWdFB3T0hzQW51Zk1VR1dkY2FMTThQTjNjb21MOG9kUXE2dzJHdDFt?=
 =?utf-8?B?MlVhQlg3cWRoT1djZW1oU1hJVmIvQUxwQUhLTjJKLzJoMFBNSW1jTS9IU0w4?=
 =?utf-8?B?ZlBjWlozMEE5RzgxdzRrQTVMMlI4WHp4aDRiSWlyVEFLOC9tdDJ6TmRha0w0?=
 =?utf-8?B?V0tBalZqOERmMzZYT3k5dlBKKzFPYkdGNmovTGxzd3dPM1NkS0dqMlU1UTk5?=
 =?utf-8?B?Y2JRSzNvSlZQR3BIbmZLeWpRbXZ3UHF5c0xQazBFdytCd3VpcFVUSnlCR3ZD?=
 =?utf-8?B?Ti9lU0wyQUEveHJNaFBGTEtKQ1JxcVA3U0FhOGhBaUVBTC9HVXFWMWdGV2Qw?=
 =?utf-8?B?dWtYWXE1bHJySi8rd3NZalNkUFQrNTlGUWV6ck9LT3RlTWliV0JLbVVkczBk?=
 =?utf-8?B?THBzV3BIRVNseURmZjdNLytXSlQwUjY5TTBmczJkMlJHK2ptWXorNXJKMHFj?=
 =?utf-8?B?eTdaQm1BZjN2a2VieldRZWplbXlkTXpUVm9wSFU4WVRhTjVwOHRXOXYrb25V?=
 =?utf-8?B?UDl2dXpHMW5GcDRhQ0ZGQjkvTmxyZlhuK1pGa2VrZ1dSZ01XZHdnaGRybzhu?=
 =?utf-8?B?d3gxQkxiV3Z4R3NaMlRqNDZVTGhSaFU5b0xLN0lMcXVFSHU1cGxrb1JteCs5?=
 =?utf-8?B?cFdvY1pyK2VtdUZFK2FrUTZTNG5GTzgvR1R2RHRQdDBDNnFBU0lyK3hhdENn?=
 =?utf-8?B?ZXUydUx3NW5SRDlJcllZYzI4Q3RHM0Irc0Vhc0JpQ09hS3AxUU52QnYrdzNn?=
 =?utf-8?B?bTZ2WUZUbDF5TGFJV1dDeHJpTWVqRWNRSXI0TERoc2ZYWXZwaEZpajZJSWtC?=
 =?utf-8?B?b1kzbmplSVZZRHVOMEpVbHkvZGVwTlk1eUZGSDdrd3BSMWMwQXNycGtvQ3BV?=
 =?utf-8?B?aUZVeFZ3U1kyeHlRbk93MndKb2huYzRiUVgzSlJBblExUHlqOVhBME1XQkF1?=
 =?utf-8?B?QjR1OXNzVUpzWlNybW10cVdQeDdaM3JSSU9hTU1rSVNER0RWUEozbTJRQWlI?=
 =?utf-8?B?TERXcVJ0d0pwc2VHSExPQkdOL2F5d0wvMzVFYWxGUnl4U0NYSy9ZcFpNN2lS?=
 =?utf-8?B?ODdiTU9mUkJkbEpYbjd6VnJnbHhWVUpaQWE5alBJQjNPQVF0RlhPT2o4dVNI?=
 =?utf-8?B?Y05TOGZaYUp1b2UxcUNsYk5UQVVZRURycTh3REJEenZ4NjVhQXBJcG92UUJZ?=
 =?utf-8?B?bi9LZ2o3VTBJZ3FURlQxOTcvclA4UjF5R2JKM3FXZERvaXNoeVVoREQrbmo2?=
 =?utf-8?B?VDlIZlJVbkJkdWRzOGV0WkRZYnBVbFlDL1BOVnFkcnVNdDJRaisvMWs1V1Zj?=
 =?utf-8?B?cUdWakwzMGdUV3E3cGFNYTdESHpKVStBVkoycDRPN3FYNXNSQWdObWhyay96?=
 =?utf-8?B?SndzVjc1LysyZ0h2MXBNdkgwWStoUjN5Ui81ZllRakV5UEtIb3RidjB1SEc3?=
 =?utf-8?B?Smg5K3JKTDIza1N1US9MeTdGZjRyblBEZVVhdmVkTE1SUzJkb0tmUU12OXRM?=
 =?utf-8?B?NnM2a3dOMmlvYXpxbW4yTUtod2YzUXIxdzNDdjZIeC9SMjhCVjlrUVRiMUlo?=
 =?utf-8?B?N3g1TnBGeUdBcnc2YllvNHpETkRtby9aSlpzY1hNMlN0ZVBabjhDWWJiL3VY?=
 =?utf-8?B?cm50Mkd6NDRrcFdxZUx4OG1tdGZGRmVuYTJZVnZyT0ZTbENwaDJZRm1GbE5w?=
 =?utf-8?B?RDhOaTlXNHJWbzFFQzhqR3N5aVE1RDhsa3Jmd2lJZzZGTHlvaVRXK01MMExG?=
 =?utf-8?B?Z0p6SjZZZEx0NnRwTzFXcGp5M1JTdkU3RjFkQzdYcWc5MVVEMFgrYTRhOHNR?=
 =?utf-8?B?ekpxd0cxOWwrR3JkOExsck5FRzRSdnBIQ3A3N2JzUnZPNFp0VHhuWitJWWcv?=
 =?utf-8?B?NmlxSWNMWDJYakVla2ZnS09TaUZxZmdxNmxhTXhoeC84blBjdHJtYmNXekVP?=
 =?utf-8?B?NklEZ1h4VDZKckhZWW1sQkxacVFra1hnQ2Y3WmI4OVk1UE9KdkdLWFMxU1pz?=
 =?utf-8?B?YnBCV2tQVkh6WEFsbFBUVGprUXphaFprTDZKalpPYWhDSTNsZzJDcFRVMGZa?=
 =?utf-8?B?M1AzdklTRy9oVmFQVHBOU25peXJ0ZnVmY0xqSUFhRi80K1Q3VG5hclpQS3pR?=
 =?utf-8?B?TElnZlgrNTQ3Nnh4ZzA4VHFvV1dmTTVLeGMvaGRpUXBwRGpEQldtVE10RFFR?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9b603e-ee49-4c93-9dd1-08de2713aecc
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 02:31:02.6916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmMrvSefvaRLJlPzvndh9IkD2CriXYrpg9ov6R71jSQwrIgdMN3956IzXrmQmG8At6OaKC/YWZc/tld6H4yIC7Cv+cHFELCxNhRO6VFkhtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_183114_488847_622893DF 
X-CRM114-Status: GOOD (  11.01  )
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

Hi Martin,
    Thanks for your reply.

On 2025/11/19 05:43, Martin Blumenstingl wrote:
> [ EXTERNAL EMAIL ]
> 
> On Tue, Nov 18, 2025 at 6:59 AM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>>
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Add new definition for Amlogi SoCs, include S6, S7, S7D.
> s/Amlogi/Amlogic/
> 
> Neil, is this something you can fixup while applying the patch or do
> we need a v3?

Thanks for points out, this patch is not applied, I will send v3 to fix it.

> 
> with that:
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

