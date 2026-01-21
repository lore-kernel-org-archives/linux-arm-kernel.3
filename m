Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4450DD2629F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 00:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJWpVLzJFYtFn+MKqxUr1ci+YrQjGtVDK63POwB08wI=; b=1LYsMVOatXXiGqBHheu/ZDE8MU
	cnENOoS81EWNYLIxxyM+hFKX8dmO9lA1P08axzfTGhEPRay1nsDEwDVtuP0ACOsS4zHp2p9amXymk
	Kh+eZqslEG1/xT6y3m0WBeIWFJFs6DDJNarY+XVfPw0wJyQrP6BTcpmI8kw1HCgsZO0GJACQWqPO2
	yhns7J3rv8DOEqdRIztNw1t6SzvTbDMyTsrwi4hAnUD07H52UAdoayjSqPBTUVIOZRAEPrTfoiVQ8
	dJRY0uQxrAUWZP9vzrxLK1U0fnWuHTmu9Q+IxlKDmlMkzTESBsat6i/dcJU5plmzNUgVpceIVU7Bu
	C+UfVHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viLv0-00000004f69-2eoZ;
	Wed, 21 Jan 2026 00:17:55 +0000
Received: from mail-southcentralusazon11021139.outbound.protection.outlook.com ([40.93.194.139] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viLuy-00000004f0l-0va4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 00:17:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6RiRfvcdaFb46Jtks5BQeSKA9D6fRLmN1KlO/WMCYJIr3EmpKc73EvKJQBezqpAi4baE6CzbSMuQ6IJ2q4rv4Rii0j8RWqFhhCrUZ7Ra1Azr1Q6+ZuqRm17jz0vJNW1EwLAFZy277nrjSf0UbUC4Ter8lY+T2J0QZb8dFPv/cdSNxyrBU7HokuM16/PkyqSDRpln1Cc6eGU9Fk9MtWVrLOrmffFirhfqaPLqURSzBQWND+jl64cpCMghaN6QtxtbICIBt04/80KMhDN2M8Maa/zwxR0y0k5LC4bgJ4T/ag/28r70ymcCCzuHjmSOzcBZYUtkcZ1noj/EuKqdMc/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJWpVLzJFYtFn+MKqxUr1ci+YrQjGtVDK63POwB08wI=;
 b=JvMX3XCoaawYAg5gAyPbkeQeYZ0Ttmuw1/Y0bhOB7TJAZycOnFaIsZZjPD4sAuDkpyO6AszYugSdTZgHC1I9SShkSPkErKcH0yIQtP/mQ6lX0+9mT40lKLLgGofXIIzbWNToyXeUKm6iPuLu1viPG8T+lhKa2NF/y0SLvZHxQ2m7MaJtUiw17soQ0Oeq+ZlgK+njhJjUcILLgO5R6nkTY5SvuNZL8g4jrECvsSSXsXKiE56crTstUH0MjQnhsSNdypz95M9hBR6VPBiOCoBHF4Zi0uK3aefuwcPkGAmM0epeOkv/tJF1I0GdybcyQ3Ubm3fUoHEhGP7eYJdDjYjOpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJWpVLzJFYtFn+MKqxUr1ci+YrQjGtVDK63POwB08wI=;
 b=jtHJTrpcKwdK1H2jPVrTWY68UmNutQNla7rE10Mf2mOH/4FspVIZHDjgO5gHgnY0ENx+w6oc++/1jWT87sNQZ3W92RMX/ug5fpEANcLkTn/xS6bmzZUx0lZN4dFUnHewnZk+kuvo9B5z5bb63sJU6J0Rw+HGUeuGrXCnbNZC3TQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 DS1PR01MB9086.prod.exchangelabs.com (2603:10b6:8:221::6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Wed, 21 Jan 2026 00:17:47 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 00:17:47 +0000
Message-ID: <c68d0449-b52a-42b7-aa5c-194af5e531e1@os.amperecomputing.com>
Date: Tue, 20 Jan 2026 16:17:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
From: Yang Shi <yang@os.amperecomputing.com>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <aWZYXhrT6D2M-7-N@willie-the-truck>
 <5f1bfe55-454c-40d5-ac45-1aed651b3747@os.amperecomputing.com>
Content-Language: en-US
In-Reply-To: <5f1bfe55-454c-40d5-ac45-1aed651b3747@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR22CA0027.namprd22.prod.outlook.com
 (2603:10b6:930:16::8) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|DS1PR01MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: 9962a7fe-ab0d-4815-498d-08de58827f2c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TW5EMlBKVkNVY0RSWkUzWWxIWU90Q09aaVpnWDJ2VTFtUU9yVmpNa3FFNWF0?=
 =?utf-8?B?L1d0dXVGcVZ2aDhmaElCTHJkeDB0TEF1VVJXK29ZZXF3dGFWZzNTSmRNN0hH?=
 =?utf-8?B?eGxIRWZyZ3d2dmhPbHV5S25OTHRLdC9OcCtqZ0NYeWpDYnNMT09OcysyYzk0?=
 =?utf-8?B?NHl3MnhBRm5QQTVhbzl2KzlTRUdXS3ZqV1dJQ2oxWkZKTEhQdzFkTDh5elQw?=
 =?utf-8?B?dzJ0QTBVeWJEaWRMcHJ3UzQ2Z1E0M3lMS1RuWlBxOHFUZUszZU5IQ25jU3Mv?=
 =?utf-8?B?VUJMWElWSlZ4ZVNpTXFnM2RZZ1NTZElWYWdRRmxnSFNud0xNb3dYMkdDSkJk?=
 =?utf-8?B?S1hDckYxNHV3bFRXdkplVVpqMVc0dHBvdjljNEJWQndlSElpdk84U1VCVXJo?=
 =?utf-8?B?aGU2SzJvMjM4UUQwUFllZXpyU3NzYVdVemJRdkQ5T2lKZ1krZlhFbExIeGJR?=
 =?utf-8?B?ZmNZS096NkswS2FSNXNJTWw4TEg3Tk14bFgvZVgzMm1PeFBaRE0vNkVJU1NN?=
 =?utf-8?B?OWJpK09KNGpOZklCTGVRODVrYU5UMDdNdjdVelZSdHE5Wk5sRWpEL09TUUNV?=
 =?utf-8?B?d0ttRFpVOGJRclVCQkZXa0FRcU9JMkpDU043NUJzQjZNakFUNk5RbWJWaGp1?=
 =?utf-8?B?RE1CMXVWODlyend2VTA3N2ZxKzhKUEdCcUxvbnltekJQR0RPTmpQMjEwd3N2?=
 =?utf-8?B?bnA4MEdndk5zSjJaRlU2cVNFZmxEaTZ2NlNETytwUmxMdkhwYi9CRFBONTRQ?=
 =?utf-8?B?clU1eERDR3lEdUUrUUx5Vm8yUWpkNUNFY1BkZGtsSUlycUM0a244SUVaYksy?=
 =?utf-8?B?S0p5N1B5UUhsdlBselg4eW1yUnh0Mng0OEFBUVp1UjJqekk2aTVYNXNyaDFH?=
 =?utf-8?B?NlJiY2NhWFpCa1JGdm9nZWdabWp2amlXWlU4bkFiUkVQR245QVVWRXRuYTJr?=
 =?utf-8?B?UjF1Nk1FZ1pnVm0zemRQN2hxK3h5cVNuVlFFYUc1SFkvcm5GclJnTmNQSVll?=
 =?utf-8?B?cVRDd0lDc25XU0xRUXZkeEJ4bEZVUk5UaEdEWFo3aXJUdXhidmdMTjZWN3Uy?=
 =?utf-8?B?Z2YrNlVIeVlSSzMrdUIreUllbnhwNkZaSzd2TFEyb0VWdmJ2YW1LaFUzdFVi?=
 =?utf-8?B?U3RDMXJZelc2UDI2am81TXh0dWdCYjVOZmtTck45NzJ1UUUvbDlpSXJOUFQy?=
 =?utf-8?B?bGRLYmxHcEhaS2xxU1JTeG9lVkd2b3NUT1N3elJGMDNVY2l2T3N1RzRTQ1l1?=
 =?utf-8?B?M0E4YjZsR1NmMFJXK2VraENsVndtNGRuVmVKbGdIMkpza1RJUFVQT0QycHM0?=
 =?utf-8?B?S2tjQlNvQWw4b0tCTzNEajhuTTFVVXBuaDlzT01Zb3ZDUWpka2d2UWludVdv?=
 =?utf-8?B?WElmN0UybWFCc2tmbzZTR2NxMS9tNFhoVmdGRXpBejJDVXRqNHMyYXBCZlNG?=
 =?utf-8?B?MmxLRGo2K3pKbHBvc0tNYkRtcHFEbVJ0d3I2YW9ybi9PRks3RlRLNTRlZW5E?=
 =?utf-8?B?SFpNLytsakx1N2lFMWNEZVMwcDVkUHprOU9vRlRGaEZwZkFuMzl4VENxdU8r?=
 =?utf-8?B?RndJQXRDV2xheWFtTlZSTkRzT2ROVFNoQVQyLzJ4dFl3dHg1VDBkMFhMVldu?=
 =?utf-8?B?c2poT01FQ3RKMGQ0VWV1Q3E5SGkvRnF6aHYxRlRHSFIzZDNHTkN5VEFHV09q?=
 =?utf-8?B?WWxRcU83T21OTnF1TFBzTVp0bDlKb0k4SUgzRUxmdDQ4TnJmQVZyajI5Wm8z?=
 =?utf-8?B?aENISUxodzRNWnJpK2FNZUgwTWZQS0I0OVNsZ3FOMnRLbFUwZzJOZ0V5QTJN?=
 =?utf-8?B?ZUJhSWx3cWJSaWlkRWhmNjQrZWw2M3BmMDlCN0ZsOUxQbTdUazcvakU4Y2xr?=
 =?utf-8?B?UmF6NXFGVkpHdEd1NFlveUVCK1ljRnNDcEJLZzdwMDZUdzJKbzdYTm9xQTNh?=
 =?utf-8?B?OVN0NG1pQm96bHZuMC8xR29jcXozQmJyc2NoS1RXSkNkQjh1UkVRekNNcjls?=
 =?utf-8?B?V2JpK09GQ1NEWlJsaXhzSEZyNGtBWjFnUUFuSWdaT042MEVFYTA5S3N1TUk5?=
 =?utf-8?B?NGNsRFAwZys4Y1krYmtQalFVSUFmUDcrRW41STZtSU9Ld2V6Y3V0Qmg4RmJh?=
 =?utf-8?Q?q6X4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVN2VWxqNDN6My9HRndTS0N6bWVzSmVaUXJVTnV4VHpHWDhiMGcra1lHUkpQ?=
 =?utf-8?B?UGd1aVpEYkVnSXJIekpXRFpkYW9tazUwZlJiRDRBeDVnL2swNzZ1RVgybk9u?=
 =?utf-8?B?eStGNTJlY2swajE5dDdObnN1dU9nalhxRFpaUTI2NS9NVzlUUGl4T0xCbHhh?=
 =?utf-8?B?SmJRcUR0ZHZPMVBmU0FHSWk5aEoxTW1jRkIvbzN0N3BrVDRUVzIySlV2clcv?=
 =?utf-8?B?S1lrM1FoSUk3QXF4VFVRWTZIOUZDMGdYT251T0lGeTVRK0NndWp6QWZBV0lR?=
 =?utf-8?B?MXRJM0RCWjRxN0txOWlSK2E3b0h6dnNseFI4Y081aEVqNkdFdGlnNnNIWk5j?=
 =?utf-8?B?MVV4L2NLUVpldmk2UzlhVFl0Vi9FZlgycXJ6aTR1djQ5bElVUW0wQlVodGdN?=
 =?utf-8?B?TEYrcEM1UGtmOU1KL05lcThVTzR4bkxlR2hObWVrbFFqOCtzQ1Y2cDU2dHdv?=
 =?utf-8?B?RGtTMGw0VXZOWkFUT3I3elhIZkxpR3BTVEtrS011dXFsUk1CTTlBMjE1NzBk?=
 =?utf-8?B?d0dEM1NxN085VXVreGxUaXB1MHN6YzBucTZwMnE2MW8yaHpUQzJyWmU0VVUx?=
 =?utf-8?B?TUxCV2p3d2FtQ1BsOXpHK1p1dkh3V0MwdkIyL3NBb0RVdXlmRi9aUnRCQWp6?=
 =?utf-8?B?YW5zcjg0aHFqeENhSkszYitQWXcvQlE0clNUcGdocE9mNFpOSUtKZUtJUVUy?=
 =?utf-8?B?S1M0Vk1kMUZMb2t3NUw2dk9EV3d0MGdXWG9pN3BVM0duQzdYckdHOTErTk1F?=
 =?utf-8?B?TE8rMnJEZ296M0x6L1JjcCtRbnJKSXVCeXo4Z1dXclBtcGd5WEpCMUxnZzdJ?=
 =?utf-8?B?MGFVR1htTGpnQ1MrMTlVV0w2TVRyaEdLQUVNbXE3clVtTzJWNDdmUGpGTkFp?=
 =?utf-8?B?VGJST1pNU0VjekZ0UnA1ZGdEVUp3VUU2cUF6V3FGb3JJM1FSckxqd25pY3VZ?=
 =?utf-8?B?UnlLME5qTldjTCsxYnpDSU56eCsxbHhyVkI5V2F1UXJMRlRGd0ltQ2Q4L0w3?=
 =?utf-8?B?ZmdBVEtsNWJOUkZSK1E1WGtUd1c3QUswY09TTXBnT0lCY0RVeUJFYmJaT3FN?=
 =?utf-8?B?eHIvdzhjWktkdGNOOVplVW80NUZKS1RVUGI4VE9adml1Qy93RVVZT0FZM0ZK?=
 =?utf-8?B?ay9UQVRaRHBlRVNkb2t1MDByRE1DZEMyTlZFb0hpcDZ4OFE2VXJXK1k4K0N6?=
 =?utf-8?B?aGdacEpObjd0WDh2YittZFA5ZTdnT1lhMVZFRXJHd29CaEhNc3d3WXk4N2Jt?=
 =?utf-8?B?NmZNRXpPeEFBVUFGeWhvMWt1eGNvbHZYbVM2WHByN3RsTENVM1NlbnJkZlV5?=
 =?utf-8?B?a3ZKSWdMdDRWMXVBK3ViL3owdmlKMVQ4eHZHSTJ5TndVNTU4eXhoSlVQZzBq?=
 =?utf-8?B?WmRIb1FIOHdBM2p3eUtaYmRzaVZoQklObXJtTEdQaWNRd1pDOXRLTng5Y05K?=
 =?utf-8?B?dDF4L2thYml6QWsxL2VoMFA1dVBGVDhud3RYa01SS2J4b1F4b3Q1a0ZORnJY?=
 =?utf-8?B?QS9ubU9TTGZ0TVVhWHh1dTJmQVlMZVJkUklLMjQ0dlEwdVNPZGNMWGQzVk8z?=
 =?utf-8?B?bFlmSjBBS2EzeHYzN2NLdjE2UUlhVUxqRTNSYVZUSFNwUzdNaWZmN2tjS2Jv?=
 =?utf-8?B?L0NrcWltS3ZFUityY0lwUi9mTnlNMkxiUFhhczlENW93dEUwcWo2TE54WDZS?=
 =?utf-8?B?VHdtVFJYZEg1Y1F6TFRpOVlyZkJMa2ZUamdZT0VWdHNIZUMzSzM2cjFNcFdB?=
 =?utf-8?B?Z3hEWE0wcDJXOWhUL3BMY1JJU0VvZXNKbWNFZnd3U2Vsby9nM0dJY3p0NVNU?=
 =?utf-8?B?cEtYMGRqc0lyVHpMMEcva1VoRVF2Z001VUJJOUtSWlJuOUxMeEtZWmw1Tm5w?=
 =?utf-8?B?MVlENmdaODl6YlM3K0RocSsyaW5NUDBWaWphWkoranZjb2plYlBubWlpYjFF?=
 =?utf-8?B?ancwcTl4Qytnelo3ZENYN01iVWNZcFA4ZFNqbWFYckRldkFrOTFvV1ZRellY?=
 =?utf-8?B?clU1UUwzbk5waksyeFNXa1A0Y1h0L3hRK2J4cVo2QXZaUXBuTytoQng4NlZQ?=
 =?utf-8?B?VW5lblNmaFNrSUlHSVlYUm1RUUlMaGxMK0VwNzc1VVpYTk1kMUZZY2c0YjVx?=
 =?utf-8?B?aktva1BFdUVDc1BjREduNjVqREdVNytaem5zakY1ZmI4UUpDNnFtKzBGTE80?=
 =?utf-8?B?WnlUbTd4aHEveGFqMEJTSHBKZGdsWkVxcDA3LzMvMEhxYVE0YWdnWndyWjV1?=
 =?utf-8?B?VldMenZ3QWxzamtZNThFbXhCTGxyUUtTV0MzYWkvdWR2SXBqY2JTdnZUUEdK?=
 =?utf-8?B?U1ljV2tRSW5iZHNBR0RVRklJeWZPNVp2UXdjMVgzRVBjZlc2dlI1Qkc2L2VT?=
 =?utf-8?Q?5V7pcYTncYgsr1+E=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9962a7fe-ab0d-4815-498d-08de58827f2c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 00:17:46.9555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFMGuDJ2RKFG253qXTxst2W0TQXNkXgo0cmERl1XPVMNXn/2A8xcL72xdH3ZY8vM+KoQY/HJyfUqKIW5YS5pnNjFk0bIfuR7vc1+YUTka8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR01MB9086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_161752_311954_D186862B 
X-CRM114-Status: GOOD (  21.94  )
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

Hi Will,

Gently ping, does the proposed change solve your concerns? If they do, I 
can send v6, hopefully it can be merged in the coming merge window.

Thanks,
Yang


On 1/13/26 4:36 PM, Yang Shi wrote:
>
>
> On 1/13/26 6:36 AM, Will Deacon wrote:
>> On Tue, Jan 06, 2026 at 04:29:44PM -0800, Yang Shi wrote:
>>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>>> rodata=full"), the direct mapping may be split on some machines instead
>>> keeping static since boot. It makes more sense to show the direct 
>>> mapping
>>> use in /proc/meminfo than before.
>>> This patch will make /proc/meminfo show the direct mapping use like the
>>> below (4K base page size):
>>> DirectMap4K:       94792 kB
>>> DirectMap64K:      134208 kB
>>> DirectMap2M:     1173504 kB
>>> DirectMap32M:     5636096 kB
>>> DirectMap1G:    529530880 kB
>>>
>>> Although just the machines which support BBML2_NOABORT can split the
>>> direct mapping, show it on all machines regardless of BBML2_NOABORT so
>>> that the users have consistent view in order to avoid confusion.
>>>
>>> Although ptdump also can tell the direct map use, but it needs to dump
>>> the whole kernel page table. It is costly and overkilling. It is also
>>> in debugfs which may not be enabled by all distros. So showing direct
>>> map use in /proc/meminfo seems more convenient and has less overhead.
>>>
>>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>>> ---
>>> v5: * Rebased to v6.19-rc4
>>>      * Fixed the build error for !CONFIG_PROC_FS
>>> v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
>>>      * Used shorter name for the helpers and variables per Ryan
>>>      * Fixed accounting for memory hotunplug
>>> v3: * Fixed the over-accounting problems per Ryan
>>>      * Introduced helpers for add/sub direct map use and #ifdef them 
>>> with
>>>        CONFIG_PROC_FS per Ryan
>>>      * v3 is a fix patch on top of v2
>>> v2: * Counted in size instead of the number of entries per Ryan
>>>      * Removed shift array per Ryan
>>>      * Use lower case "k" per Ryan
>>>      * Fixed a couple of build warnings reported by kernel test robot
>>>      * Fixed a couple of poential miscounts
>>>
>>>   arch/arm64/mm/mmu.c | 202 
>>> +++++++++++++++++++++++++++++++++++++++-----
>>>   1 file changed, 181 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index 8e1d80a7033e..422441c9a992 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -29,6 +29,7 @@
>>>   #include <linux/mm_inline.h>
>>>   #include <linux/pagewalk.h>
>>>   #include <linux/stop_machine.h>
>>> +#include <linux/proc_fs.h>
>>>     #include <asm/barrier.h>
>>>   #include <asm/cputype.h>
>>> @@ -171,6 +172,85 @@ static void init_clear_pgtable(void *table)
>>>       dsb(ishst);
>>>   }
>>>   +enum dm_type {
>>> +    PTE,
>>> +    CONT_PTE,
>>> +    PMD,
>>> +    CONT_PMD,
>>> +    PUD,
>>> +    NR_DM_TYPE,
>>> +};
>>> +
>>> +#ifdef CONFIG_PROC_FS
>>> +static unsigned long dm_meminfo[NR_DM_TYPE];
>>> +
>>> +void arch_report_meminfo(struct seq_file *m)
>>> +{
>>> +    char *size[NR_DM_TYPE];
>> const?
>
> Yeah, it can be const.
>
>>
>>> +
>>> +#if defined(CONFIG_ARM64_4K_PAGES)
>>> +    size[PTE] = "4k";
>>> +    size[CONT_PTE] = "64k";
>>> +    size[PMD] = "2M";
>>> +    size[CONT_PMD] = "32M";
>>> +    size[PUD] = "1G";
>>> +#elif defined(CONFIG_ARM64_16K_PAGES)
>>> +    size[PTE] = "16k";
>>> +    size[CONT_PTE] = "2M";
>>> +    size[PMD] = "32M";
>>> +    size[CONT_PMD] = "1G";
>>> +#elif defined(CONFIG_ARM64_64K_PAGES)
>>> +    size[PTE] = "64k";
>>> +    size[CONT_PTE] = "2M";
>>> +    size[PMD] = "512M";
>>> +    size[CONT_PMD] = "16G";
>>> +#endif
>>> +
>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>> +            size[PTE], dm_meminfo[PTE] >> 10);
>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>> +            size[CONT_PTE],
>>> +            dm_meminfo[CONT_PTE] >> 10);
>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>> +            size[PMD], dm_meminfo[PMD] >> 10);
>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>> +            size[CONT_PMD],
>>> +            dm_meminfo[CONT_PMD] >> 10);
>>> +    if (pud_sect_supported())
>>> +        seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>> +            size[PUD], dm_meminfo[PUD] >> 10);
>> This seems a bit brittle to me. If somebody adds support for l1 block
>> mappings for !4k pages in future, they will forget to update this and
>> we'll end up returning kernel stack in /proc/meminfo afaict.
>
> I can initialize size[PUD] to "NON_SUPPORT" by default. If the case 
> happens, /proc/meminfo just shows "DirectMapNON_SUPPORT", then we will 
> notice something is missed, but no kernel stack data will be leak.
>
>>
>>> +static inline bool is_dm_addr(unsigned long addr)
>>> +{
>>> +    return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
>>> +}
>>> +
>>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long 
>>> size,
>>> +                  enum dm_type type)
>>> +{
>>> +    if (is_dm_addr(addr))
>>> +        dm_meminfo[type] += size;
>>> +}
>>> +
>>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long 
>>> size,
>>> +                  enum dm_type type)
>>> +{
>>> +    if (is_dm_addr(addr))
>>> +        dm_meminfo[type] -= size;
>>> +}
>>> +#else
>>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long 
>>> size,
>>> +                  enum dm_type type)
>>> +{
>>> +}
>>> +
>>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long 
>>> size,
>>> +                  enum dm_type type)
>>> +{
>>> +}
>>> +#endif
>>> +
>>>   static void init_pte(pte_t *ptep, unsigned long addr, unsigned 
>>> long end,
>>>                phys_addr_t phys, pgprot_t prot)
>>>   {
>>> @@ -236,6 +316,11 @@ static int alloc_init_cont_pte(pmd_t *pmdp, 
>>> unsigned long addr,
>>>             init_pte(ptep, addr, next, phys, __prot);
>>>   +        if (pgprot_val(__prot) & PTE_CONT)
>>> +            dm_meminfo_add(addr, (next - addr), CONT_PTE);
>>> +        else
>>> +            dm_meminfo_add(addr, (next - addr), PTE);
>>> +
>>>           ptep += pte_index(next) - pte_index(addr);
>>>           phys += next - addr;
>>>       } while (addr = next, addr != end);
>>> @@ -266,6 +351,17 @@ static int init_pmd(pmd_t *pmdp, unsigned long 
>>> addr, unsigned long end,
>>>               (flags & NO_BLOCK_MAPPINGS) == 0) {
>>>               pmd_set_huge(pmdp, phys, prot);
>>>   +            /*
>>> +             * It is possible to have mappings allow cont mapping
>>> +             * but disallow block mapping. For example,
>>> +             * map_entry_trampoline().
>>> +             * So we have to increase CONT_PMD and PMD size here
>>> +             * to avoid double counting.
>>> +             */
>>> +            if (pgprot_val(prot) & PTE_CONT)
>>> +                dm_meminfo_add(addr, (next - addr), CONT_PMD);
>>> +            else
>>> +                dm_meminfo_add(addr, (next - addr), PMD);
>> I don't understand the comment you're adding here. If somebody passes
>> NO_BLOCK_MAPPINGS then that also prevents contiguous entries except at
>> level 3.
>
> The comment may be misleading. I meant if we have the accounting code 
> for CONT_PMD in alloc_init_cont_pmd(), for example,
>
> @@ -433,6 +433,11 @@ static int alloc_init_cont_pmd(pud_t *pudp, 
> unsigned long addr,
>                 if (ret)
>                         goto out;
>
> +               if (pgprot_val(prot) & PTE_CONT)
> +                       dm_meminfo_add(addr, (next - addr), CONT_PMD);
>
>                 pmdp += pmd_index(next) - pmd_index(addr);
>                 phys += next - addr;
>         } while (addr = next, addr != end);
>
> If the described case happens, we actually miscount CONT_PMD. So I 
> need to check whether it is CONT in init_pmd() instead. If the comment 
> is confusing, I can just remove it.
>
>> It also doesn't look you handle the error case properly when the mapping
>> fails.
>
> I don't quite get what fail do you mean? pmd_set_huge() doesn't fail. 
> Or you meant hotplug fails? If so the hot unplug will decrease the 
> counters, which is called in the error handling path.
>
>>
>>> -static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>>> +static void unmap_hotplug_pte_range(pte_t *ptep, unsigned long addr,
>>>                       unsigned long end, bool free_mapped,
>>>                       struct vmem_altmap *altmap)
>>>   {
>>> -    pte_t *ptep, pte;
>>> +    pte_t pte;
>>>         do {
>>> -        ptep = pte_offset_kernel(pmdp, addr);
>>>           pte = __ptep_get(ptep);
>>>           if (pte_none(pte))
>>>               continue;
>>>             WARN_ON(!pte_present(pte));
>>>           __pte_clear(&init_mm, addr, ptep);
>>> +        dm_meminfo_sub(addr, PAGE_SIZE, PTE);
>>>           flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>>           if (free_mapped)
>>>               free_hotplug_page_range(pte_page(pte),
>>>                           PAGE_SIZE, altmap);
>> Is the existing code correct for contiguous entries here? I'd have
>> thought that we'd need to make the range non-contiguous before knocking
>> out the TLB.
>
> Thanks for pointing this out. I didn't pay too much attention to such 
> details to the existing code. Actually I did notice hot unplug code 
> doesn't handle contiguous mappings, so I added 
> unmap_hotplug_cont_{pmd|pte}_range() in this patch in order to 
> maintain the counters correctly. I'm not sure it is intended (or maybe 
> just unnecessary) or just an overlook.
>
> You are concerned this may result in misprogramming issue? TBH, I'm a 
> little bit confused by the "misprogramming contiguous bit" described 
> in ARM ARM. In this case, the TLB flush should remove the large 
> contiguous TLB entry, so there should be no overlapping entries in 
> TLB. Or this is still a problem because some entries have contiguous 
> bit set, but some don't? But when we change the contiguous bit for a 
> range of entries, there is always a moment that some have contiguous 
> bit set, but some don't. My understanding is it is fine as long as 
> there is no overlapping entries in TLB. Anyway I may misunderstand it.
>
> Thanks,
> Yang
>
>>
>> Will
>


