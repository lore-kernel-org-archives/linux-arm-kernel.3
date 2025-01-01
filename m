Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C993E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jan 2025 12:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z5bu/h/0PeY3uQkr5QiAsGQ97rRYAZtIOtt33fBcomg=; b=EtCyHvV0vtq9jAhEZVjCsnnavQ
	carOGAoPxn3yG3Fps8dNGrrmo1NRE6kP6G2EYPgOG8nLnRK3b0bkFsngXYXRD7a5+6oX6AW1UV9Hy
	2NBCCn1bazxmWK5qbPaewuvNoNbyeHTm0h9y74Wh4w1vWfRoHl7Ncp2MYA9ohDJaD1vo4yLqRZOeR
	N9pqTGwQvuAxJj0Xjwu2FEjdKdf1/v+r5Kby5zhvZNWHp7Lv3Fs/UIRz5x+Z8KTnIOy+7G+wlT0Q3
	xRXTfBO50vFbkztbvDYIDv0f5usA8/mlQ18HK7AlUPkIVGonVLznqrM62QJfJPqIzHVNGF3VZ1Or4
	YzSEDFzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSxt6-00000008cI8-3JE7;
	Wed, 01 Jan 2025 12:31:48 +0000
Received: from mail-vi1eur02on20704.outbound.protection.outlook.com ([2a01:111:f403:2607::704] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSxrr-00000008cBN-3Ipu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jan 2025 12:30:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSUNUsIqhs+L1zIXhWFEAv86xcIMfjteO1tGQEdi8ePNBoSkrvF+WfrUkkminyMITINDeRWCRz1ylD99Jx/exSpERrNa/px2GEnCfU5myUc1GCxuHXoOTFruBJr/n60OWdwWhV3bUevN69yJRtLFvrQKiYmyEtkamnvNhr/0mgqvH8VK9gjvZqHqp3jgdpRHJVqV6aM8DFlUm/rmbGlUbMoDiICKgqjmpqA+YWXR/adluTjL55BucVcGGt5Yf3cVZ/WvvMheRuiiv9ct3WDBLCEiQCxT8h3B2/WjRBLlexyllssAFMDFc8uekh887FGgR8vIqyUJIPyvgEEavq2ckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5bu/h/0PeY3uQkr5QiAsGQ97rRYAZtIOtt33fBcomg=;
 b=AqAsiC3KHkLIxZPuUp4fehIDdJOxQlg4dtLYh7QJ3lP2wL0TfvbE6MwzzRqKw2oobE2V1SY891sP5M74f6NXu+Cz8r0ayIdgD3+teTs8jcVfeWXWzeq36P6Ab/iThlEGmUhOL/rFIZxok0CXoGbavtRw4ek3+Nh0gGkzsxAEaPOFUOQGVi0g3Ts1UQTT7iH9UHdkkLPFJrukZ+XoPuCvvfkXtF344hoDJD/rng1PNBwqn8dPVwAiyjvk1G+b8OZuc0MhUyMH8j38okoDpVWCfwQLQipvhPnfxstrNFJonwrtwWKww/LECVop7nv7Dma3FLJxSkoDognQZfLhy3fiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5bu/h/0PeY3uQkr5QiAsGQ97rRYAZtIOtt33fBcomg=;
 b=Vn6CotZ2kOIAYtVlPcIGQE+3w1GnsRxXBBzlMmhmHgF73nYUTXp8gLZg7lZE97uYR3WsvgIjfdbYOWMLvbSHAwWe558PmhNtCuNp1rKPSR0yWeMo4MHThj4EFYWJCIMliPZZ3MBqV1Tw+MDz3OQTvHKQFDw09o5xtaHaYMBMVQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 by DB9PR04MB9844.eurprd04.prod.outlook.com (2603:10a6:10:4c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Wed, 1 Jan
 2025 12:30:24 +0000
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529]) by AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529%4]) with mapi id 15.20.8314.011; Wed, 1 Jan 2025
 12:30:24 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 01 Jan 2025 13:30:22 +0100
Subject: [PATCH v2] arm64: dts: ti: k3-am642-hummingboard-t: convert
 overlay to board dts
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250101-am64-hb-fix-overlay-v2-1-78143f5da28c@solid-run.com>
X-B4-Tracking: v=1; b=H4sIAF01dWcC/32NTQ6CMBCFr0Jm7ZhpLX+uvIdh0UKVSYCSVhsJ6
 d2tHMDl917e93YI1rMNcC128DZyYLdkkKcC+lEvT4s8ZAZJUglBAvVcKRwNPviDLlo/6Q3L/kK
 1amtF1EBert7m+rDeu8wjh5fz23ESxS/974sCBVJDpm0MlbWpbsFNPKB/L+fezdCllL4IQXL9u
 gAAAA==
X-Change-ID: 20241101-am64-hb-fix-overlay-5c3074974008
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: FR0P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::7) To AM9PR04MB7586.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB7586:EE_|DB9PR04MB9844:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eace0f3-e7ec-43b9-6b4c-08dd2a601082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUpXVW5KaU8wVVFKZ2VybU5KNEhHaEY5dDBWZE0ySFNpYS9sV1JrSVJEa1Fy?=
 =?utf-8?B?TFRMWEREQS9ZSnlENDdMRVlCZFNEd1BHVkptZ2U0d245T1l0MHJKWjR5T1F3?=
 =?utf-8?B?akNCWVYrdjRWYm81Rk1PZmhxSkNkZ3dlTW01QkZLYk1FQVdhWmZES0VKTHZ2?=
 =?utf-8?B?dHBIY1J3aVhEZmpYTWxnRmVUUW5MYXJRODQ3Tm1kWWVlOC91VUFES2RncGV0?=
 =?utf-8?B?TU5ndGVxbTdzN1psa09LZFdUaktiK0dhS0xiU0dtdVlOOFFFdEozNEMyc2FE?=
 =?utf-8?B?TWdScCtyeDg0OWtjOXVibkg3Q3R0S3VZRmFFQjIxalVLWWQ3TGtOTjNHekc4?=
 =?utf-8?B?enNRVURGbWgzTnR4NThkWTRxUHVUYjNWcG56WFlJYzBHWnlZeklKNWllOFNn?=
 =?utf-8?B?SHlsN2dMTHE4WUtkUjlnNC9ZbE9tb3gybUtOWi9IN0ZJVDlOMHdqNUxJM0lx?=
 =?utf-8?B?M3k3eHljNVNBTUJGWG1tRlFZVlFrTmFXMWc1NUZRUENzdm5qZVp6MVRibGl6?=
 =?utf-8?B?N0VKZTRmTEFmRE1CZFJ3ejh5WktNYm11SDBoaElzd1lIY3lmelpRakdlMGZh?=
 =?utf-8?B?RmVITW1LdGNlN2FBUzRmZVA1NUljcHVMSkY4MDVpQlpDTXdRUHpMY05aR1Jm?=
 =?utf-8?B?c0dHNU9wK09RSzdxZm5yOHkwdDM1TnRNcE9YUFBFNysyK3ZRWEZHcDB1bnhz?=
 =?utf-8?B?c0ZaRW5oS05veXVlYVFETW5sR2w5TW5Oc1puNmZsYVd4cHRaeEZLblB3WkNH?=
 =?utf-8?B?d29XenczaHpZY3RhVVpUcEdQWWVFUDBUQ2RybGw1MWF3UGg3Q0FYTHpBTGVz?=
 =?utf-8?B?dVpEZmFXSk9nVUtOaG0xamJUaFU1R2h3R2FHaVlnT2ZUTW9NZkdkbEMxNnoy?=
 =?utf-8?B?QWdtNHhDRG5HVUxPMkJMOXIzaHVZNTZUd285bGJXbG5CekNLMWtDUWdwcmdt?=
 =?utf-8?B?RTdzaWsvZWw2b1l2S0VPV3hFSGlTUTNmaFhLOUFNMlJHRFFNdzM4bWxZZXl6?=
 =?utf-8?B?VDljdmtvRWhFa21NeFY5S29RUnBuUzNpV0M4YUFybkUrL0pXV2hNRlozdUNN?=
 =?utf-8?B?a2lTMndQdm1tOUtmZEtFVGJYdzFkazlDYmplUWcxRkJ5UkhvZk81WGR0Risx?=
 =?utf-8?B?emkvQW1Zd0UrblJ1TERxQTFucmRWMmJNaVBLTTlrUlQ4ekx4T0pHNWhUamtv?=
 =?utf-8?B?YzBWYnVCY3JBWVhQVytKaERmbnU1TEZITEx1WFQ4MThmV0Q4d2FuV3pYUmRB?=
 =?utf-8?B?VGZJbE1JK2p0RTIwRUtVa01pQ1NUTjcxM3BrVXVRK2s5MmI3MGZ2UFdSWnNu?=
 =?utf-8?B?cXZ1eEg3WFNueFNQd25VNWFnNWM4Z3J3ZjRVT3NjR1pFdTFUcW5pTnJVOGZJ?=
 =?utf-8?B?ZDhMQ25JTTluVkRYaHg0Z2llbVRXVmV2a2NaWkZvT2wrZ1l3NEV1WDdPR1RQ?=
 =?utf-8?B?Mm5HbGdpaU9CZlZHNEVGR3Z3enBJWnNTTHVlZ1J0S3FXUU1GQThMbzFMN05S?=
 =?utf-8?B?WTM5WEE0bjRDcmtzeFVPYnBCMTVsN21mY0lZTU1oeUFpZTVHWFh5UUZsRmZ0?=
 =?utf-8?B?cDlub2djTHNFYXBPNEVKSXE4bkN6WTQwa2lwRGpNVmlYYXJjRHJLcW41TDYy?=
 =?utf-8?B?VzNKcWxUK2RoWGtOT2FCWE1SQm9rem9PWUlrcWJjRitDK1lhdkU2UjFOUTJp?=
 =?utf-8?B?bWZyWDNpV3FteExQQUt5b1YzUTBhQ2pHRk5lN3dhdVoraFRwZjRkU1BUM0tQ?=
 =?utf-8?B?MXVjYnhpUExRWHpaRmtiaTNJVmk2UkU4bW02aWs1OVB6cUszbFRsTS9qVGJC?=
 =?utf-8?B?bEVOL2dGYXplT1VySVhoRTM4dVM1ak5aZTdkaEsrU29ZZnUwWElUa09CckNI?=
 =?utf-8?B?eURGYmFmS3QvRHg2WmZKUWQyQmZEdVU0bWJJWE1iYUVhbHd6YmY2OEFuQTJ1?=
 =?utf-8?Q?PVNmA1CsO/EYbFmQiDHUOLrTs2awhtID?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB7586.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFJpc1J0MjZrNjE3ZmZEOEtYUzNkZUNOSFZxbkFmeE9wZzBBSkpySzMyN3l3?=
 =?utf-8?B?SGpyWXdjMnVtM0RZV3ZIWEQxQ3VyNzQwdDFzWEpJcDVHOXdtTFd2VWhBeDk0?=
 =?utf-8?B?QjhTTy9qYzAreW01UHFQRDVHSnZnVWUxd2hSQThNQUp6RG45VXo0MjZBYksz?=
 =?utf-8?B?UzJsTTRTSy9xR0drbGpFYlpMdFhSTHEvbFNFSGdiU1JsK1FlMlhFY0VuZjFY?=
 =?utf-8?B?WkhXbnZjNkdaWDQycEJ3ZjFBVCsrcmdRdmxtRGZyL2RaKzRxcHJLM3ZDaExv?=
 =?utf-8?B?am55ejh6RFVPK1N3ekYweWdpaE5BcWVXK1VUVXpPVm92cHJ0UVo4VVlXdENL?=
 =?utf-8?B?cWNyU2xxQzFzY01OK2tVMUM0VnRPc05od1loMWttekt3U2dmWGZ6dkRPTlRj?=
 =?utf-8?B?L0ZuSk9PTmN4N3ZxV3RJNXcrZGxoRjNpbW1DQ052Slc3aE5TYXJoWjVPeWNZ?=
 =?utf-8?B?ajhqaWpCT3dmYllHcVJMVFJ2ZVNUR3R4VG1CcDBmSXFNWU91akpkdGxtU2Uw?=
 =?utf-8?B?ZHJpZ2VQalBwcnZVcnovbTVxcWl2UUJrK0I1RXZFV3hLUytWV0gvRHREcVZm?=
 =?utf-8?B?ZzhFUTNNTHplUXB0VjVSVUZaVVl0c0sxMU1GYTVSUGpxY3NEc0RIL1E3ZGZP?=
 =?utf-8?B?dzNUejNzU1ZDbDZGQUV1L2lpaWJSOHJpaGFyMlBtQ1I4dEo1WVZwUmhZNHJQ?=
 =?utf-8?B?eGZZVVFXNEVtdHFEemFhTlFOMlNtVG9Wek5HdStIekJjUzBZYXY5ejNYOC93?=
 =?utf-8?B?VDJGQjdxZ0JDMXpCM05FK0lWZ2pVVitNdEZwb2pCRU1mZHFkOUMzWnRzQVI4?=
 =?utf-8?B?RHNidEZ5QnNHbFh5U3hlTGlENi9SRnZBcHJtWm15bDB4aUZOVkVmb3Zrbm9J?=
 =?utf-8?B?QzJXeEhsOWVjM2krNlhKYWdqNXo1TE5mTVJxN1BRVWptQjdJbUVWdVhqVXlH?=
 =?utf-8?B?cnBQbDBuSFAyOWxMR05tUENhMFdxTlJYczdIRXJYSUtoODdpL1FBLy9MVU1h?=
 =?utf-8?B?NXUzbkpzTDlBK2V0WTBRNDdjeHVLV2RYNVlFNHVsMlJJUHZITkNPdVBLVjNn?=
 =?utf-8?B?NnJmT3ZsSHdWWWpwclBuNnROR1U0THVqOVlTUE05aFl6blVJWE1XZDJRd1lE?=
 =?utf-8?B?Yi9LQmh6cEx3UEp2Sy9ucHYvSzZ0REZ2ZlJnR1hLYTNNbktFR3ArcnQ1VHkv?=
 =?utf-8?B?ejRIUnBKeExsbzU3MWNlZW1zNTdCb3Z1MjhWa01MNkZxWVgxdVh5SUZTV242?=
 =?utf-8?B?TzRCZ1d0aDg0VVl0ODBFdkUwRU1rTStFOW85Ym5relhOQ0ZHVkVNdzQvYjVD?=
 =?utf-8?B?N3d0amJCWDZic1pnc1ZwQWZKaG5GUFFDOFhlUUNBS0d1RVdpVDFaMjNkUVdr?=
 =?utf-8?B?TVA3VG42V05SYUY5THF0V0t5VytIcHNoa3U4bURrTXdONGVUWGYweTVRVmlR?=
 =?utf-8?B?bkF5T0t5Sk1neHF0aktEUm1uTkMxcnFaODluN3RLTS9pWnQzRXp6NHMvbFU3?=
 =?utf-8?B?dGZzNVBISFk1L1pLN3UwVS9PUlVNR2l3cEZTQVdEL3BXUjlYZ3grSEJGakw0?=
 =?utf-8?B?QUhrdFVXVUt0VTVxOTRqZU54YlhEZHFaYUIxSWVadjVjam81MmxsL0xJalVl?=
 =?utf-8?B?OUhYQUsyUnpHUmNZM1YvSFprOTU0RWxoNlRsREZPZGlublNTa2JiWTNBd3RR?=
 =?utf-8?B?ODQyVlEzVGZoRXg2bVkzUWplMDY1MW5UK3Y2cnpNa0ZFV3J1UEpteCtta0hY?=
 =?utf-8?B?V1VHajhxTEtCZWNITFdrWllWOXJnVkxDeVE2bW9DYUFaZ2c4R09hUjE0WjNt?=
 =?utf-8?B?czVpNVIwL3dkVWFQUGhaYTBIek52UHBldnB2WHo5NU5ZWVJ2OTVvdFdjTUhZ?=
 =?utf-8?B?NHp6WHZBZm1ZaXV5TlY0TERjMFVJTEYyeUtFUVNTcy81U1lJeWN1R2RaUFk3?=
 =?utf-8?B?UDNkbnJhaGVkcTV0K09PZno2MkJyd2w3MFYwYXNoeDJhVkZEMGdEWWdBaG9y?=
 =?utf-8?B?OGhOVHFGVWRUdnpsZ3pSWU9TdXNmelNQZ0U2eGNhc2xxYnRCamRZVlEwQWpj?=
 =?utf-8?B?L0FWcUphcm5qNWM2MTBlWW9NTzBiYmJWRDRBZElLR080OEU2Lzh3bHEzMGow?=
 =?utf-8?Q?Wrb5tm1HYKImuVHMKEMTYEgmC?=
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eace0f3-e7ec-43b9-6b4c-08dd2a601082
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB7586.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2025 12:30:23.9806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cVjk9uVnXNeAUPhMX6eBufvMG0FQqdzylvXj8H0KubB2P79L1Z+4R5W6Quj6OU6OM1mIXKG8Ko1LQfilIANgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9844
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_043031_908188_74F56B4E 
X-CRM114-Status: GOOD (  12.05  )
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

SolidRun HummingBoard-T has two options for M.2 connector, supporting
either PCI-E or USB-3.1 Gen 1 - depending on configuration of a mux
on the serdes lane.
The required configurations in device-tree were modeled as overlays.

The USB-3.1 overlay uses /delete-property/ to unset a boolean property
on the usb controller limiting it to USB-2.0 by default.
Overlays can not delete a property from the base dtb, therefore this
overlay is at this time useless.

Convert both overlays into full dts by including the base board dts.
While the pcie overlay was functional, both are converted for a
consistent user experience when selecting between the two mutually
exclusive configurations.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/linux-devicetree/CAMuHMdXTgpTnJ9U7egC2XjFXXNZ5uiY1O+WxNd6LPJW5Rs5KTw@mail.gmail.com
Fixes: bbef42084cc1 ("arm64: dts: ti: hummingboard-t: add overlays for m.2 pci-e and usb-3")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v2:
- rebased on v6.13-rc1
- Link to v1: https://lore.kernel.org/r/20241101-am64-hb-fix-overlay-v1-1-080b98b057b6@solid-run.com
---
 arch/arm64/boot/dts/ti/Makefile                            |  4 ----
 ...gboard-t-pcie.dtso => k3-am642-hummingboard-t-pcie.dts} | 14 ++++++++------
 ...gboard-t-usb3.dtso => k3-am642-hummingboard-t-usb3.dts} | 13 ++++++++-----
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index f71360f14f233cc8c60860c0e700d4791fb6f95c..3450f0751cab176a8f63c4faba4f736c53b62007 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -42,10 +42,6 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-hdmi-audio.dtbo
 
 # Boards with AM64x SoC
-k3-am642-hummingboard-t-pcie-dtbs := \
-	k3-am642-hummingboard-t.dtb k3-am642-hummingboard-t-pcie.dtbo
-k3-am642-hummingboard-t-usb3-dtbs := \
-	k3-am642-hummingboard-t.dtb k3-am642-hummingboard-t-usb3.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg1-dualemac.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg1-dualemac-mii.dtbo
diff --git a/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtso b/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dts
similarity index 78%
rename from arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtso
rename to arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dts
index bd9a5caf20da5b7f11266575f69f0f5dcc1a47ae..023b2a6aaa56689f712a6c1ede6ba427d746fe34 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dts
@@ -2,17 +2,19 @@
 /*
  * Copyright (C) 2023 Josua Mayer <josua@solid-run.com>
  *
- * Overlay for SolidRun AM642 HummingBoard-T to enable PCI-E.
+ * DTS for SolidRun AM642 HummingBoard-T,
+ * running on Cortex A53, with PCI-E.
+ *
  */
 
-/dts-v1/;
-/plugin/;
-
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/phy/phy.h>
+#include "k3-am642-hummingboard-t.dts"
 
 #include "k3-serdes.h"
 
+/ {
+	model = "SolidRun AM642 HummingBoard-T with PCI-E";
+};
+
 &pcie0_rc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_pins>;
diff --git a/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtso b/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dts
similarity index 74%
rename from arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtso
rename to arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dts
index ffcc3bd3c7bc5d47ce9926a95a13af3f61182a2b..ee9bd618f3701047be4ac7502cb70e7d3589ff5d 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dts
@@ -2,16 +2,19 @@
 /*
  * Copyright (C) 2023 Josua Mayer <josua@solid-run.com>
  *
- * Overlay for SolidRun AM642 HummingBoard-T to enable USB-3.1.
+ * DTS for SolidRun AM642 HummingBoard-T,
+ * running on Cortex A53, with USB-3.1 Gen 1.
+ *
  */
 
-/dts-v1/;
-/plugin/;
-
-#include <dt-bindings/phy/phy.h>
+#include "k3-am642-hummingboard-t.dts"
 
 #include "k3-serdes.h"
 
+/ {
+	model = "SolidRun AM642 HummingBoard-T with USB-3.1 Gen 1";
+};
+
 &serdes0 {
 	#address-cells = <1>;
 	#size-cells = <0>;

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241101-am64-hb-fix-overlay-5c3074974008

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


