Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC3C103A9A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 02:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpn0rDnjnzvJpU4z7dVI9Q7oYxtRFijK8aIwg4LQNwY=; b=sE2kiQGMQ0RpaF/8arKN3p286N
	IbWPa78Zj7akefccxSGmatkMbClPbEznNpxQgly4puiXBpkGE1UAFCYqTODqxdolav0jKVSecAkJw
	P6N/Lw166oXBRHK1nBjKVP26DZiqBWwZIE1KZyq7/K8L5MECfPGpROGMpsXKuABxVBD49k/AxWNKZ
	WBTfVbE5mnaN1drDQrHTF8ieFhSLyStGO6DiLXx+JDYNUPpgkAKJvPxdrW+aeTApGaWktn1nH0CnO
	pWP9PXAIoxV3MQzi7UGMMiOvratoKitZggEVxtQZu0Gc+Sfj+T/APGlNPJt1C+7Y00rgSJKXDdLvl
	RHE0E+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5E90-00000002WGk-448w;
	Wed, 25 Mar 2026 02:38:54 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5E8y-00000002WGI-0nXu;
	Wed, 25 Mar 2026 02:38:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KyIrij5yRghDvyw5j63ceXkhvxX64TVQffC9hQB6OsP/k2vSUj8gz2gDWDIky7ClL9zWpFSt+o59F15R7YnZj0NJTwlVyPCCqhQbQkeMPh8O0Eb2pzXz2fcOYe27a/6l2wGes4r3//I4enjU2Pkmmw0FTfTcnSLaRkLgCO9/8Ih+dfMrXQoZ2xXUrCmuTqf/mEGcF5mrJQXpCyBhv6yddqEG5YO0GUwspGimaVpVKtZVv4rwiNX7IfZXcZWId/Rzwy1lRTHrkp3Hhvy0ZmU+EvtMx7lqj3DRlBa+KLiGokkOvHCV6W+F7HnZNB+ukfZbOaPy+n9gYHqMk5S8JHd+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpn0rDnjnzvJpU4z7dVI9Q7oYxtRFijK8aIwg4LQNwY=;
 b=E6QidK5PY3F43sw7pcN3KICl8LBc9tGsPoq6Ta0weldLyM5/4a7ENfnKm6ZkvufUKqRMFYrueBDCzJ/PFapqpO9aqUjCyRPpsdbshsUW8az3kfrETx7+JUv3mIwaNWepihh1uOSI8kirDzksPtumaiSa+8nKhF1/iHuTJfajcEMsSQDYV1DA6aqSbAXRlMKZTlC6jp3s//4Vk1/ZfjEM6zsYJItZTMAmwFUUY2uTSwM1wPTkYLIWPHpXUT6fQbE5gggQaqTtCWT/TiAen1PgM4Mz/R38sGv+WUx1XVLm5LZPEb+PTAOg4hgBm6AbeJgJjVw+Xt0P0O7hpGF+u4VuIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpn0rDnjnzvJpU4z7dVI9Q7oYxtRFijK8aIwg4LQNwY=;
 b=aqg8/lHrgdgEIUiIIwot9gJyra6zV4/YrTy97y9Iv+XzNp6DTtfkugCZCcZZnde5+uj8ciRgAkrkd9EKQj7vWfaOO2Usvs3MeSVACD61gG6RQ74ZYyrTDi9IAP+b1GkZRJpfEwzlNi7P9p3BXXBOxCoAz2Lids6+K1pxqbhRGYj13GHMO/j1+fRoOIuuVvzvXxUV5M4N6wM5j2SydE00prHt1TMrBUc1uHNL47kPfKZoBMCtzwySHsMjuetlZS51ClSqIVKnv8bL3r1LPhqlRDw4uUpIAJXIvYxzyIlRVH8yaZUd1RABSLM5cpwAalOOdR5RclHg+YiiUfccou48iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB7259.apcprd03.prod.outlook.com (2603:1096:820:bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 02:38:41 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 02:38:41 +0000
Message-ID: <c01c4e7e-1c0c-4bbf-b126-831160c8e32b@amlogic.com>
Date: Wed, 25 Mar 2026 10:38:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] dt-bindings: mmc: amlogic: Add compatible for T7
 mmc
Content-Language: en-US
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
 <20260323-add-emmc-t7-vim4-v3-2-5159d90a984c@aliel.fr>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260323-add-emmc-t7-vim4-v3-2-5159d90a984c@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0135.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::12) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: d3903e1e-fdd2-41b1-89a9-08de8a17a0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007|18002099003|22082099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info: kdmP+dAVnRtW2hUN6P+eQ2/qp2YpsLmJxqXXKnoNUKG3cRdAoHqfWpb0Ls/GEIRfPCnnBPQUzzfJMkLogmcSkgH+4NKCSWH4NjcIbaAajsMDL12mtgfgQ+vftruQD8GpXp1Nk3cvIti30liuuK8n/rBnWzbb0Cvb6jDGk3DLau/DOlL6m78cFw/EgTAAutAhF3KoXILkGf41+xRfjdIqP0BT476ws9FkiK31s8+aCT9NAq/4fFMOm4MY/3P+sG7g59HlEUaMbLnMVJsrz53wYA+JQDkxL9fLkU1+IZdpiOMFILQoIrqF+fFIxgsAZVyji1yWcegppeHOzN/OqsrIB3WyrbziNdyy4dEaiKA8F9eem33E/XKeQsyszRGILNj8hRVyYyR+1YcRKOYO1PUXcpb60xCT7XKGkqxeoqR0C10ZloBf7MWJ2VCIGyfneGj4VTdzzDuITgTQ5fTPlE70Uag8draFHdODWqIRAmVYBfDl8OFOpQe08ZbvSU3DtD/taIgnUHY4QfhPFymmZsczN3/0ET3/GrpAaiYRghwn3Iup3xCP3qi3x+cR+03REwAua7F46YyvkZp/QXJxP20P2/4cSL86nZCOOf8smGVQHlayRiVX5XbVq3a+05jNONexNAM/7crcbUDpQKDB31MIWGPMA4FmPxXRRvUDOHU42AWlrwGjOMDZSFpmXYSt3BPV8DMbr5SLzAjAInZ67np2lDIZPllu4s+PvlgtArGWBg7ms3mH/10TbHagrjqGhfy3PlBhDmr/BFNZiYeDZ3DtZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(18002099003)(22082099003)(56012099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGRrS1prdysyYzVXVmtPYnNOQXZuY2pvRGFnaWt2RkdXeG5ZTjlveEF3MEtN?=
 =?utf-8?B?bGhINFlEdFFaaHBhdHBTbFA4NG5QK3pPYWh3VUlsN0h3QTFhVlZwQzlhdTFa?=
 =?utf-8?B?WXhWd1VzMHViZ2ZyY3gzdU9Rb2VMeXM1TUhKSVJDbXV0cDFUU0UvQ2Q4YU95?=
 =?utf-8?B?NkNrbjFrL0JxN2Vld2lsdUF0NXc1SE1KSWZtTkQybUxHdi9QSkhRYk85cHQx?=
 =?utf-8?B?bEUvUU5rcGZRMUNrMVpWMkRvMXc0d1I2WkdtNE01cmhQcHhCQW5yVjQ3c0Q0?=
 =?utf-8?B?K2RoeGU0anRUUlZuODQ0YUt2U0lwTVVLdTZkMU5wSUp3TnU2b1hGT0pMMm03?=
 =?utf-8?B?bEZVWFI3R1dqeUlrbEpUcW1SUjVnMGJKdE85cXh0eWF4QjhUZTZNMUQ0cHJm?=
 =?utf-8?B?bWNaRzd3ZWZlRlYwMkRoeWhxdmYyS0VxbmVPNnRSS0h1TVcya1dUWGU0SElX?=
 =?utf-8?B?WXhiZUVKRXRZbG4vVWZxdks2Q3lVbWRhU3dZaTUxcW9JbnJkYkFDOTlFZXJO?=
 =?utf-8?B?QmJnTnppZXVrTU9zYUxOd0ppMmJwRVBPVGJudmJmMGNNaXBtR3ZsdE9ndm1D?=
 =?utf-8?B?ek5iNHJpWEl1WldobTNqZ3RtVmNNaVhwQUdTTzJmSW9tYkUyVmtzQzhqZXhz?=
 =?utf-8?B?bXByU0hIVWx1bnhOYXNINHFTWTlUMERKQVRKUUhLMSsyMUsyMHJkTTRHYndZ?=
 =?utf-8?B?RHFuUWprTXUvQ2N0aE5zSkRpWnp0VDRodFE3YW9sZ2s0VlpRZXM3NWxLQWpm?=
 =?utf-8?B?TnNqemFKejZYOEh2YnFVUGdTRjNMbSt1RWhKSG04ajUwV0o3aDB3MnJ5QU5l?=
 =?utf-8?B?T2NYdG9LTjV5bU1tN0lReXpBQWt6SnhsUG5EOGM3WWhzbjZ1ZmJqTEsvMTJ5?=
 =?utf-8?B?bkpjeW1OSndoMEkyU2lERUQrTVIzU2tWMWM0SlgxM2pzNjNGcmJFSWdBdnVO?=
 =?utf-8?B?MWRLU3BJVzYwUWhkVXpXWm1FZEo5WnZ2RVBNUG51SWFuSXozeFhNd1VTdHRs?=
 =?utf-8?B?TUkzNm9ublV3Y3NjR1lyNEZ3L0lndHd3WXlxODJjRUJ0MXZ3UzgwQ2M1ZkFp?=
 =?utf-8?B?R01wNkJtSDY2WU5XRW9sdy9BT0g4aytnQXd5YjZFaTd2OHJqempIQ3V0dXI1?=
 =?utf-8?B?WlNDc3JrZml5ZjB5aEkvNHRrdkY1aU8yM2JDRWV2dDRkTU1lanF0ekc4WGFq?=
 =?utf-8?B?dTVuRzZweUdETWtMbEVpa3NXTDNlMXpEdDBGRGZuZ3hrdXd0VEJ4S3lQdERu?=
 =?utf-8?B?eXU1YmJ1RDRBU0RuU0x5TnJWU3YybGZhYWtoeXRsUVNMaVFuNWNRdHFybW1h?=
 =?utf-8?B?dFhXcWR3bE9QTS85eVFHajlYRG5Qem1BU1grK2tYQ1RTL21PVG5vdDJzOWU5?=
 =?utf-8?B?RnN6NGlVL01SckE4SDVsOWJodjNmMzRaODV6UGlvby9wVUxST0lvSisvYUZp?=
 =?utf-8?B?TVBLOWl1SHJmYW1NSXR5NSs0SS93QnlqRkxtdGlZNEFXY2RjWENUMldQV1V6?=
 =?utf-8?B?WlJiTUpYMk1QdEd3dUY2MzN2STN3ZXBYTzNmcmVSQVM3ZTNjSGJRbC9GNjlN?=
 =?utf-8?B?RHdxWUhXejVtVVpCbmhXS2lZc3N3d1ErL2ZqMmRkSExkYzZlWFRUR3lxTmVR?=
 =?utf-8?B?MFpKMGFXcWhSTE92UUFLSTIwU0N3N1J0KzJuYjVRNjhHVkVKMk1BR0FzVE0z?=
 =?utf-8?B?ZERONTk1NHBiN0FkY2o2QlFTenRhY1RNV1QvYmxkanVnVUw2WG9YVStqSjFs?=
 =?utf-8?B?TkU1bFM1YmpuWklFSGlGcG4yZjlab250bkxwSnVNV0tFSzBYb0FmbnlhaUF1?=
 =?utf-8?B?TXN0aWswYzk3UHhTT0hHOUJOT0JUTXRkTkNxcmNqZE5KTzZmTCtHVTlmelhm?=
 =?utf-8?B?L0Y2YUk3enlsazR0bG80ZWVlQjAya3Q1ZnhzNTgvOE1uYmIzUHNXY2ZjYnJG?=
 =?utf-8?B?dFRCSkJYR0lMKzc4elZTQ3NFKzVNenBxWUFseGtIUC9WVTZETFlnT2tRWkhU?=
 =?utf-8?B?QzVsbWpoSTFUOVdSL0Z2WnJsaFFydHV0ZDlhNWpERlR3bjJYRUwvSWYxS2t3?=
 =?utf-8?B?c3pKaitLYURib3lhSVhybndXQ0VzSTIrVll6ZXdYZVU3WDdVWXdsZVRCVkpX?=
 =?utf-8?B?all5bmN0SW1MT2FaTUNHUHVIdGdmbVEyMXg4Mmc2bjJwL0VJY0ZUMWpGeDZF?=
 =?utf-8?B?dFdJRzFhakt6K25tNWVnMVJ0QTMwZURRY1pzNHlRZ1JBajF3L2N1SHlmUnJJ?=
 =?utf-8?B?dGsvTHQ1WDJvMzFlclZXUjZ4N3Q2bUgwZmdSRzVYUW0zQ3VxQkhPMUVvd0RB?=
 =?utf-8?B?ZDd4RmJtZmtNaHVFNXl2YTdjT3FrYk5EK2hEU0lXeXU1TEdrbURpQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3903e1e-fdd2-41b1-89a9-08de8a17a0a8
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 02:38:41.9083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +iHsRORJ1tXV6MzHMybFtUt3IHkH/J8ki9G1UAyIiyiBbIgX5UPZ9WkxI8poLVA6X02e17BeGWDuOVhZQg92dEptp+CwjVv5Ju5hk1RzKAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7259
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_193852_246436_B463E40C 
X-CRM114-Status: GOOD (  13.25  )
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

Hi Ronald,

On 2026/3/23 17:55, Ronald Claveau wrote:
> Add amlogic,t7-mmc compatible string, falling back to amlogic,meson-axg-mmc
> as the T7 MMC controller is compatible with the AXG implementation.
> 
> Signed-off-by: Ronald Claveau<linux-kernel-dev@aliel.fr>
> ---
>   Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 5
> ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> index 57646575a13f8..40dccf9715781 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> @@ -19,7 +19,10 @@ allOf:
>   properties:
>     compatible:
>       oneOf:
> -      - const: amlogic,meson-axg-mmc
> +      - items:
> +          - enum:
> +              - amlogic,t7-mmc
> +          - const: amlogic,meson-axg-mmc

It seems that break API here.
One item should be added here instead of being replaced.

>         - items:
>             - const: amlogic,meson-gx-mmc
>             - const: amlogic,meson-gxbb-mmc
> 
> --
> 2.49.0

