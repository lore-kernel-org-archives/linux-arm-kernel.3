Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF29AD0E6C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 11:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjnSPrzUiJu2u2yUE5fiZuS6DhKWbvL+/Snp0lfeeZA=; b=KCONUnzvxVVWBKJQCzE1VCRW9F
	n0gdUiTzQwHo8kpwQ4VgmUzQjfIsXCQGoD8cmIxuSGwkTaukQX2hufb1/chTVFQr8utnCAyfILWTn
	Tpu3J+Kl8IJmH+ElXR8OcDUyqtdCXUWeSU6GchGLm7GSbksHbfhpfhmKZlccOIbab3u2ltaJWvy2B
	4CXCyeyCeix/ZQpFoqF+M+ijQCHcIxm8+cpxXRmry/L9n3NW1Tab8SJwfRDdWM5/ILAwRxeS5sdC9
	DCkLWGUh8ubCp2HczBt1q4IzP058p6d3wl/KUX05+hNQbZZ7dL266EanVQVZV2ms83V2jh7Ndz0ed
	O7tSy+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNr0v-0000000DCQ8-3FI7;
	Tue, 25 Nov 2025 11:15:17 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNr0t-0000000DCP2-1Zap;
	Tue, 25 Nov 2025 11:15:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giFBNYSmD8FWAUfijNYqUARJyz9W9qsdKtw8nsB64nDsrGKU2BPER30U/we0MRbPQlhNRtNQ9EQe7QRFg5UrgAH6XVRrE1iLjskh+WHZsIv9hudlLKuU+uU7WlujKoMkc7apCARyuwm5cWO0VREDz+kU1pwakEmBJMao/5gYfo1FkG2YWeNAYbP3yc1+W7eXq8CKY+qIoSdDGd85rnbomiO5X/mFZUDiqINTSi4skbMU3w11RuupV0u8ZFprHklneagOgdM9gCJ1uNYTPWR+g0+wGCj8QgsuE2bEJKFLrtqHllfOq/RaGPuzGaOQ8oTLCalDnWeQhsj/gWmy5K3Q4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjnSPrzUiJu2u2yUE5fiZuS6DhKWbvL+/Snp0lfeeZA=;
 b=Fw8ZKUwbvsuiGzlZO7/p90yp8c6OlJReEeNfFMpCb8KaTNvb2tokaNCJTomzea4wxKxaXFzWpcWeiwEFxnDPG8mRRLj4aW1ZKg2As5vphilgfqvduC3YwYnGkSgkf6Y3XomneI+Bytya0K4SI1K1UFiSAdT6xSFv5a3HJheib0QbU0Sjpa1XqRQlVxVpO1xcyK44tjHtjcj2nH411G/H67k85sFXsrAmcaETSQJgAcgZTJ1LvCct++RbIRrzBH2TzcQDoeM4GjEb3kQDPDw6cl1FSvZMyznXNzcQeZoFChinUZurEEH+OC5PY9j7/RaXuAI3/VC2YSXX4hKO916R2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjnSPrzUiJu2u2yUE5fiZuS6DhKWbvL+/Snp0lfeeZA=;
 b=JBJ/B+YwRQzXMLA5Okroel812Hw4/7d9QU+KJdsKgM+tnidnNTrfXUbisbJhfdkC0XB50HLBuuzEC7V4si4YYQqPlOLlOf5TEbTPKmWBLFXAeIZ9tjgboS2K7tGy8Ord0oTMWrV4XOsNWJjMky9ispx4ZjMaVzF+IRpYU2Pgqh1tu/FIT/n6AvxAozL5sEqZosrmsLNWgA2cNRMahmarDJ+EbeP8X1otnjhZVghr7yukmHwj6c1SznbMRqB9OvrSgnGqRXC477m8SjbtmA2K704i/2gzMxjgWal6kl2GR1c9HgfkHkij5IfvXV42Lfz50FyN41C74RrtNPTImiV8+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by KL1PR03MB8119.apcprd03.prod.outlook.com (2603:1096:820:fb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 11:15:08 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 11:15:07 +0000
Message-ID: <9051a983-97e5-46d9-b428-335fa9769441@amlogic.com>
Date: Tue, 25 Nov 2025 19:15:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/3] Add Amlogic stateless H.264 video decoder for
 S4
To: Ferass El Hafidi <funderscore@postmarketos.org>,
 linux-amlogic@lists.infradead.org, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
 <t6a43h.17cuodq0mx1pi@postmarketos.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <t6a43h.17cuodq0mx1pi@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|KL1PR03MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: ea7c7c56-0096-43e2-2bdf-08de2c13e3ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGdNSDRMTjQ2MnNPR1pzOU9aQ3crS0duaDYrS2xzc0RoelFVcXlqSlBGTEMw?=
 =?utf-8?B?dGFFOW9QZCtFZXg4SDNpTElPRE1BSjROdHRvelg3SzhCVjhGVWQzKzhseDky?=
 =?utf-8?B?TTNYN205cENDcktoN3ZTWXlXblNRc1FEZFRYRzJWS2p4YitZSmxVME1CTHk1?=
 =?utf-8?B?VTFYN1JRcHVlWUNBT00yQmFDYmppeHBOc0h2Q0tieHIrekN6TmU1OFR4d21w?=
 =?utf-8?B?U2Z3ZmIwN0xkQUo4NG92c01KUEMzNnpKZFVoM2pCbFZLL21FaHdWQ2ZadzBl?=
 =?utf-8?B?VG9BZ2wyMmxHZll5ZkNMUENNWkxJaTIzR3NzbVcxTkVBM1NONU1Wb3NTMEZ1?=
 =?utf-8?B?bG5TNzc0SWdpanA5bVFLMTZFdzl5YzVFUmsya1dEV1AydFRLZ3N1a2lrZUpj?=
 =?utf-8?B?V0RUeUcvd2RleE1sK3ViZS9iYnB0U3I5QzhJNjdrNzFGUG1SL1lxRlFnZUdB?=
 =?utf-8?B?QzFxbnVxTEpRTFV3L2JIcFdGY0gzQys4bDRybENaeitFdTVPQnFsVmw3N2pz?=
 =?utf-8?B?MTg4NXc1eHBMRWhjWWxySUk3aDZ2dmRyd1pJTmlPM0R3blVHUTFzN2MwSWNP?=
 =?utf-8?B?THoyRlJtRmt5N3BXbFppK20vMHVhQUgvSXJPNmpaTTFlVnVVVXBYZG5DWU5N?=
 =?utf-8?B?MDlvQjJwbmVsanN5VTl4Sm42bG5RS0RzRko0MkF6cFlmS3o2Z1liblFoSWVH?=
 =?utf-8?B?TytxM2did1I1K1RBNXJMTFIvTXVVK25UalNZNWxmZWFGL3djN0xmcFA1N3Vl?=
 =?utf-8?B?M3NrYmpVdENYd1ZtbGlwTnVoVm51NzF5OWlERkxNbWViaTNHbFhaV3E2OTg1?=
 =?utf-8?B?WUdaSXltL043L2JlanpUN0VVcWRFL0l3ZjcwVEtUblBkaXVvb3NwNG9Sc2lp?=
 =?utf-8?B?amMwNFBLalV6eFR2L3dEcC81RmQveWRxZzBwOU04anowWVBDbUJoMVZRZ3N5?=
 =?utf-8?B?Mi9LZU1qSUtBWnRwc0JPZGdxYjI0UUo5R0ludVRGYjRnOTJBWmFhQ2RDdWpm?=
 =?utf-8?B?Vm90Y0F6SEFNTDRmc3ZRaTh1VFVJeVFva0Q3bDF5YkVmdDFyNFk5SnZIdk0w?=
 =?utf-8?B?QmwxcndJTXRTTXViWmVRUUEzeUU2T2JwRjhpT1RydjdyVnhlVE5JVXZMOHdY?=
 =?utf-8?B?QXREM29IOHZ4NmlwK1owaU5TNStPemphYmp0ZkZyQ08zdHpzdG1hNXVaZGVy?=
 =?utf-8?B?YTNSb21VR0orMkdERXllanBWRkVDcFdhRnZZUlFFSmFjRTh4a282SXBOTGdJ?=
 =?utf-8?B?TElUeXlieEpzd01aaHVVYjFOUUVXdm1kellZMzdaejU3cnAwdGVFdnRqZVB2?=
 =?utf-8?B?V1JXVEZ2M1h1aFNqVkNUMFNPSENSNnlUR0JYLzZwSnZMK1RtNmtTbi9iU0Fz?=
 =?utf-8?B?bGZ6WGJZMWl1UGdFRDVxUzlOVWpuQXpFaEZpdTZLTk0rZGcwdkhaYUxpczdQ?=
 =?utf-8?B?elRRYWhEdEhnMXhBZzZJU2p3bHJlcnpIeWFzenYzZVdwYzVqeDQrYVFzd3No?=
 =?utf-8?B?bzBPa0h5R25mMWRWdGlNcUdGMmQ4OVl5TzlqQS91VGdOZUdVNGhUcUJhRUNF?=
 =?utf-8?B?aDd2R3ExY3d3MktQREM3WnRWWWd3aUd1MC8vQXFjUG9FSVArcUFsWFRrU05w?=
 =?utf-8?B?Ykxxem5NVVk3MGQrNXJwc3pHZDFUc0VjOUszSXBjc20vVWxRU0lMaGwwUlU1?=
 =?utf-8?B?akpsNkxoUlhhdUpNWW1wOEVMZmNzZ1ZFRnl5WEIwWWdBbkFodnNUbVFQNnUw?=
 =?utf-8?B?cEdUN2xHbk1RTnNkdWFpSkFmR2JYenN6bWZkZ2NNVDlwSXlSZGJGZjVLRnlp?=
 =?utf-8?B?QmFGelNpb1E4VWprUXp3YWQ3c21rMVVJWmVpOFUvWitQT3BVZzZWTnZVYWJo?=
 =?utf-8?B?MzMyMmVWSFhWd1VOem8zblU4OTRGRUhqWUZrQStXYStsYjhHZ0dwS1ZBcCtq?=
 =?utf-8?B?V1FJQ2EwRHE2RWNBUXlSdDBnbE1mR093Smh6U2lPeVFGak0vRHRyM1hpUjdl?=
 =?utf-8?Q?aKe7OiYPU2KqDQSI8qwzEGQnucOub4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU93dGlYTW80U1g5TE1NSUpDRjdhdTE5K0JBSzA0VExrOW5qaUkvNWNMaEtN?=
 =?utf-8?B?a2hiMFdKdGZYblNyZm81QmxCRm0rc1NsbU9IbUVjS3NaM0FKa21odWdSUnRl?=
 =?utf-8?B?cEJMMExiMGgxRi9QaHlSSDZCaWtXU1VIUmNOTHl3dW1uNTl0TjhVT1RqVXgr?=
 =?utf-8?B?R3hYOWpzTWExTk5nbmpRSkRvVjZTVldOcHlKRWNkanRKZTZ0RVAzdE9kblhH?=
 =?utf-8?B?d2prVHR0RUdmdStqelNCNVRiWlRhcGtvT3JQeXIxanlrenpHUDFIbVd6RllZ?=
 =?utf-8?B?UU5ucFEvWWNmeTFBRC85aDR2a0wvRDRYZ3NWK3VVWjdYWTh4N0R2TDlSYTJr?=
 =?utf-8?B?RWZrUU5zQWFEa2NDcHg2ZGxRV2w5YUtPempxWHhlUTJzdkkyOWtsNk1FdGIr?=
 =?utf-8?B?bGEyaVJ3aldQd1NyM3RsSStmeVpYdGhwSnhsYlVpc3pEWCtxbTlPd2hoTFd2?=
 =?utf-8?B?K2xqZVNodWVLcGwwRGt2bVRYTnF2V1pYTVdyRzQ2QVBNNVdQNkpRUjBpS2Zs?=
 =?utf-8?B?SDZEb1YrSnkvb044UEdHdnlDbC81Q0QwOVRCM3RkV3M1WkVIVUhuemdzeVRp?=
 =?utf-8?B?cWhrNkhOMlUzSnF3WXBSdWx2RnV5bVZHcDBVUzgrdXRhNVhONW81d2ovK2lX?=
 =?utf-8?B?a1lNVmtTNnU3MWdZbm9jWVBSd2VRUDFNMGZoa1MyalVxNURNaFJSZGF6ZTcx?=
 =?utf-8?B?YVcxdnRSazVqZ05CWVJzWVY0a3ltSzFnQWtzM0MvdkVqTUZlQkt2ZlNhbWlB?=
 =?utf-8?B?MVllWFYzZFJvTURWYXJiS2lwRU5pYXcwbms0ZDNzNzBBY0ZnMEJuTWdRQjgr?=
 =?utf-8?B?c2x5YXd4elVjbXQ1YlAzdUhLU2oxU3NsYUdEZ1dtTCt4OTlFaDlwMVY3N1R6?=
 =?utf-8?B?SkFQdHJPYVBteC9ubmtlYTBZeFZMSmFxMjd4RHBWaUpmaXFqamtWYVVjMGlj?=
 =?utf-8?B?NW1jVHNDdkRtZU0xZHVTa1JaMU0wclhFZm1jTEd1N0ZZdWRKTG1aTTk2V1RY?=
 =?utf-8?B?V2dhaUlGcDB6YTZwZDFZck45a20wNGVEQmhCWXNjRWk0dGxEMmd2d054T2dn?=
 =?utf-8?B?OGZ5M20vWG1RTVRQUjNlemViZzN0emV1UnRMZ2tUYUdQaTNjTnJpaUluNHBw?=
 =?utf-8?B?MzNtWWY4Qi9xZm1mYXRhelNteDRZcDBvdUlJYThDdjd4VHMwYi9OVE1kRStn?=
 =?utf-8?B?SE0zbXVaRGVhaFNiYXhKSzVwNmNVaHpmZW1xNlRkVnlQREIxSTd0UHpWNUxv?=
 =?utf-8?B?OHVhbWhzWmpFcmI4MkExN3RGRVFxT2ZLVzl3ZnZXYTdHNTFnckdZbWg3VDhl?=
 =?utf-8?B?Y28rSDRQTmhVdnZRaHgzVmE4ejFZcEg4dit2UW90YURGalN5OUkvSUxRbStE?=
 =?utf-8?B?YnVzMFJ2eXFMak9DWnRRU21ySmw0bzVBY1dvc3A3S0o0Z1E5cHE4SW1lbTIw?=
 =?utf-8?B?ZWJwUCtYUWJzK0xKUmtFdjFPMFpIUFpzWFBOekE4TyttQmVXY2dCYWcvL0Zp?=
 =?utf-8?B?SXVLTDNuUG5ZRzRaSHc4TVhUV2M5bitFTHRTZUVrSG9NT0UyU3JOMitEcVpC?=
 =?utf-8?B?Mlpia1I3bUVtSWU1NGF3OU56ZjdxM01FYXJlZndjVHZWcDV6dkd2RlEvUGdq?=
 =?utf-8?B?OGFWaXdBUmhPbDYweHVqeTZTZTZKMEQyTFcyTGd1REFJOExMcS9vZnVyTTdQ?=
 =?utf-8?B?WXZ6dHB0bHQ5YmlJajlreDI1QjVGR05vd01leEZxdXVBZEFUMDZ6VnFHbHVv?=
 =?utf-8?B?akVRbzdQUlh1Ty8xVkRVRGV2WDhZbENkTS95WjhlWXVKWXlhNWpZR21RWWkz?=
 =?utf-8?B?bS9BdVRyaVZ1eGtSWWdDWFRCaFlTemtiNXhxMS9pUEVNWVM2N1RrMDQ0a1Jr?=
 =?utf-8?B?amhISnFXcEdXN05tUEJRd3YvQ2dUMzBIV2RxVTdRcCtMNHVPL1RqNENqQXly?=
 =?utf-8?B?enY5Wm5RMHhvQ0dWRW5aUGpYdW5zZUtrZVM2RlBkZDhyR094ZDgvYmZWNkFz?=
 =?utf-8?B?TDNrSXJWQnpnd2tnNjhvUktFdlcyZTFDcXJ6NEswSTNMT3VUcXJ3c05FcnVm?=
 =?utf-8?B?d3l6UmxERDlzaWtxN2IxSmplRzFCUk5MZlJuUk05VHc3NWRCam1jZnI0eU51?=
 =?utf-8?B?c3E2MTNoYXJBWHk5SkozZCswRThpMGhmenpCNnp4MUtJaG4yZVlzL1Vta1Zk?=
 =?utf-8?B?eHc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7c7c56-0096-43e2-2bdf-08de2c13e3ca
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 11:15:07.2287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oWM8ebGpHV6dc5TArZ+4J1tPvSJB6EyBQL0eYrL373LLhLevLkUZSNHZ1/lwzQUNY7lStd4n30ICaNXk3F03w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_031515_420315_79C43C66 
X-CRM114-Status: GOOD (  12.66  )
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


在 2025/11/25 18:55, Ferass El Hafidi 写道:
> [ EXTERNAL EMAIL ]
>
> Hello, quick drive-by comments:
>
> On Mon, 24 Nov 2025 03:32, Zhentao Guo via B4 Relay 
> <devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>> Introduce initial driver support for Amlogic's new video acceleration
>> hardware architecture, designed for video stream decoding.
>>
>> Compared to the current Amlogic video decoder hardware architecture,
>> this new implementation eliminates the Esparser hardware component,
>> enabling direct vb2 buffer input. The driver is designed to support
>> the V4L2 M2M stateless decoder API. The initial phase includes support
>> for H.264 decoding on Amlogic S805X2 platform.
>>
>> The driver is capable of:
>> - Supporting stateless H.264 decoding up to a resolution 1920x1088(on 
>> the S805X2 platform).
>
> nit: 1920x1080?
The hardware requires the height to be aligned to 16 pixels, so 1080 is 
not a multiple of 16, but 1088 is. Therefore, the hardware actually 
supports 1920x1088 for decoding, which covers 1920x1080 by padding the 
height to 1088.
>
>> - Supporting I/P/B frame handling.
>> - Supporting vb2 mmap and dma-buf modes.
>> - Supporting frame-based decode mode. (Note that some H.264 
>> bitstreams require
>>  DPB reordering to generate reference lists, the stateless decoder 
>> driver
>>  cannot access reordered reference lists in this mode, requiring the 
>> driver
>>  to perform reference list reordering itself)
>> - Supporting NV12/NV21 output.
>> - Supporting Annex B start codes.
>
> Best regards,
> Ferass

BRs

Zhentao


