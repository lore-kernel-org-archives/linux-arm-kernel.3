Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B540C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 04:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKqxfQf2va8iF6rknQE3Eo2k71ACQEJfQYAc0ZzHvA0=; b=2/apXVzvBdfI8Bq9DFAaSUWqlI
	8SM5GPM7Kb+1k5HoA1WapTUD/sMEVDby03ybb9lnRe9XD91tRCG/YMLMiyTPsggMpAui+DwtyDaRQ
	HJDUbvpUctxSzuXa55x3ssRucHvi30oEO6SGIti5UbdXmuI0GdTXYMpJCeQ1iDW6RjT4G/oOcsLZs
	FMmWwyG/f8PlXfoVLNoxqTmCV/anZVRIzY+A8GC6N4a0m5adBcDSbFezWi8LbfgAeO+MmXCUmQKo1
	oEhHkUJYeP60NLRPnitiMjxXtkOSXCN4aChmD0TwkXfUixhQrmsqNMVpfdXRSq17JMFOUpBNWaqEw
	MsOp7wDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubAzJ-00000001861-21Bn;
	Mon, 14 Jul 2025 04:40:25 +0000
Received: from mail-dm6nam10on20627.outbound.protection.outlook.com ([2a01:111:f403:2413::627] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubAwu-0000000180X-43bz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 04:37:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdANPgIfclJmNBqaoO+CqoipCiehukiz/Repf3RIY2K4BYvkyetbMeslq03PV1URyKNQDEKpTxIAxdCFIzzc+GEBrz3iD+y615ZabTFgdpRI71ithIiCERCsGtMtovRxhsqAtlM8pC192jNOhT7CZm28vi4w80ukMZ7Id0NKXoTA342xu2AZyJrejMDxMRwtTp8csliZsm2FguA6tPc29sD7KJdBXjBWJ7Yt+Us+zkdayqu4kQt3l9WhaMSsbE5OWiy7bzeOVqp7lTfVaqTkKOpN31/l4r+U5LM+YnH4iOUslCnmYhP3tGrAkJ5KOtGVzzn/u4aUK+ghSon83RQJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKqxfQf2va8iF6rknQE3Eo2k71ACQEJfQYAc0ZzHvA0=;
 b=XamIJqPK0rKTXiIb67QfAOjNZa2qIHiwP568av9Ks5uAEpBJyCoz3dGdcVzXCfox2d7dMiMjxbNV9sG30okfPoR4OWwWRSawZ2q+PdlzJZNSpzkhBmKTjxKlpL6A1tveEVIC83C93hrO2t7t1yWeKPow2hFUQQWjsMeXUpTtBfS9WUbWf/3MKQQmMtpm8jgE3B8IYyAvYd4uux6uSTp1F/QE/C49BSp0dYSvTD6/BHDh1tN0W7OvB8Qt3U317tEuQfFq8y9zIfwBCrY7PR0xTEQpcDRbM/pZ3LaxCFjaocYdAlEH3lA7ZM+UwBK8aBeUt6k5vieh0TG2d7gzX6LwZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKqxfQf2va8iF6rknQE3Eo2k71ACQEJfQYAc0ZzHvA0=;
 b=ERzzx1fNuOwdIKwlVC7iCqBoEKapq2841a8eFvOOtORS6vPbCC32GVHGbbWrfPuag2JSq7WobM4308LLWi2lGX1JhsMsLpH/1MVxIi6WqhNf20rqJ3gF9fvsQBYXCb4UiHo2883dmr/oWcDvRuDwAF7did9/QfU/neiPiYBjx3k=
Received: from MN0PR12MB5953.namprd12.prod.outlook.com (2603:10b6:208:37c::15)
 by SA3PR12MB8809.namprd12.prod.outlook.com (2603:10b6:806:31f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 04:37:29 +0000
Received: from MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::6798:13c6:d7ba:e01c]) by MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::6798:13c6:d7ba:e01c%4]) with mapi id 15.20.8901.024; Mon, 14 Jul 2025
 04:37:29 +0000
From: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
To: "Joseph, Abin" <Abin.Joseph@amd.com>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
	"yanzhen@vivo.com" <yanzhen@vivo.com>, "palmer@rivosinc.com"
	<palmer@rivosinc.com>, "u.kleine-koenig@baylibre.com"
	<u.kleine-koenig@baylibre.com>
CC: "git (AMD-Xilinx)" <git@amd.com>, "Joseph, Abin" <Abin.Joseph@amd.com>,
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] dmaengine: zynqmp_dma: Add shutdown operation support
Thread-Topic: [PATCH v2] dmaengine: zynqmp_dma: Add shutdown operation support
Thread-Index: AQHb80AoIWVqZT5Gd02Yi00/tmBBlLQxCfTw
Date: Mon, 14 Jul 2025 04:37:28 +0000
Message-ID: <MN0PR12MB5953CBA7D5D05F0D9F0A4400B754A@MN0PR12MB5953.namprd12.prod.outlook.com>
References: <20250712151752.3669944-1-abin.joseph@amd.com>
In-Reply-To: <20250712151752.3669944-1-abin.joseph@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-14T04:31:55.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5953:EE_|SA3PR12MB8809:EE_
x-ms-office365-filtering-correlation-id: d35394db-df04-4c95-9607-08ddc29023ed
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?PMFxErFSIg/jiFMD2v+fm8NVxzz3mMmc+OQDWoXhOyQHODLPzPMQUxquXom6?=
 =?us-ascii?Q?JHkbesM+1G6EC0lTZUOAtoF2wrnhFKnE0LXc3sy3yNIR55zZ79/5uTPHkppT?=
 =?us-ascii?Q?HcaNOlbndfBkGH+41gPHcFy2m9Y8l6us+6fjjI70/YDTSKFNqXCOKsJH9ZhY?=
 =?us-ascii?Q?MhB8ynZzI1STBWA6k9VUsSzdQkHqIjQwIJeAYjt1KXeNF9hKDZm746qLjM7P?=
 =?us-ascii?Q?9QqvcAuSTltndPaIJ8UaeCKjIH6AOGTv3uyHHC0bqKT+iDkSHLayBDvNhHih?=
 =?us-ascii?Q?t10YmtlR7Otdt/Ih8TaXw/an4Hpuo5ltrxyGbja5h2qpAnMvTd6nPH3Umwtm?=
 =?us-ascii?Q?Ti563vpIatyctSvZk/VY9bkKqU+cxwDLu69xR/T1t8DY7A4k9X+8+ZQG//Rd?=
 =?us-ascii?Q?thh6Ikw8W+Zd3MoYcR8QD059eNcQAFv++O3Y5Qf7XIagI8HGCqt8vj/5H6Sd?=
 =?us-ascii?Q?DLd4FeVDvPQ+R6M4atG4aV8yy7rsz5SYGcDkOhyzPcN7gLUYAPeTMiE3m17g?=
 =?us-ascii?Q?cLTzf7k54lJsP5CGn5ZnhqEu/MKjt53eKRcVyIDzyG+EOuiYJOTOmG1T/dVD?=
 =?us-ascii?Q?FdChfD3Wgjz8on6M3p1wO4axtJyZhxLukxiHBd7weH+K3xHEi6BHYBfjbozm?=
 =?us-ascii?Q?wigFSrCzbmPv8Kcyf36t5JrFT4JSpp0+Qb8q6VDpkDNr6MG5yegKxBHWSE6e?=
 =?us-ascii?Q?m5j1Vxxfoa8umpWMBkaLDt1owXb3E71Vo90lVAEy81MEJyuNCCAzG7hGAu+w?=
 =?us-ascii?Q?VYBixQ4m/odRx2uoiBeMkNNMEy4gIxAY05oArph8YWBglNy4S82WLlM2ETLC?=
 =?us-ascii?Q?hwqdNpmHxWGZLn4/jrtfbNIjheCBEmiKmj8MzPO7cF48gxz5ikVf84g9ZLpF?=
 =?us-ascii?Q?InygELMUUyKbOx6UgJc2Z+uaG98hhvhsXQtum8vwczF/k7BaP1LDSBt4aWMh?=
 =?us-ascii?Q?rEpOHRDVTKCexcPSbw/1ZyvFxvM1DZVMrs18C9tobygUnjMxmC4wIsXcnEPl?=
 =?us-ascii?Q?2DUpr2LYXZYc1DppQp/1L1BOAUxXF8+5uY+etme6v7bVvQ7CMUhaha/sQtsT?=
 =?us-ascii?Q?3L8y2QrRF36qKC8463C0pQBQQMhy36hqHREy5IU948AKdg8C8ntHpgSlIZs/?=
 =?us-ascii?Q?hhqdoiZONd6nnL7ljEHpbMDO8G9ajAi4E1ZuojqPsn4R8WUlkYb+yGVjJL5y?=
 =?us-ascii?Q?ebOoLhPnnaMChjFRezvW1ORMcqfYDiNoDjxym0YPTinho2qcMV3d/llnJOyE?=
 =?us-ascii?Q?/sP7ewnzkS34TLwIQxVqisavEgV5LwhZWLE9WuIpnW7kD2SGSBsNxjqKxlb5?=
 =?us-ascii?Q?bkzoattBZNoifmR+qK+EMqJ+9NbIqU9N+bgMDwE2xt4vKPyua5Q7qNdF9AbJ?=
 =?us-ascii?Q?IA4vry+cER2aFRfDfNhCmaua1c8e0dgM0WPe6yHPP2DT+UGdFL18y/xo2D+G?=
 =?us-ascii?Q?bGi+7I8/roL6Gk+DxxSYYPc76Gd6wwNs1OCUVbp0QxJVTtZJIlSIwTOwfRsL?=
 =?us-ascii?Q?kdCB3VydY3Nnri4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dunoBDv/L5J8ymrML9ZC3XSgfAYAPZ98WA/zzmPltI5/l1jnf7tai3LFnDmn?=
 =?us-ascii?Q?qadtzaW269P6j54EObBgKoBK3XA3+aqZAQJ13+MGw2LgEPyffY+XgVrihmbs?=
 =?us-ascii?Q?7dCmODVfFzpqzQo2fuvvjpDOzBgCG1jP92pFydpKur4B0MaUhzJs6kg0EYis?=
 =?us-ascii?Q?okA+w0fhqPfE39gwuDRPOPNeujurS/UxBjQ6WoUmDd77Wz6Y/NliKxOconnK?=
 =?us-ascii?Q?xglJbwTQNkaXOQT727sJx5nVdw9UqSd8n8TfFG1Xvjc58Q2veYi2dt0QuGN8?=
 =?us-ascii?Q?jfty6g2IeCeV83scaqQNC5zhp+5yYiJRCb00lGRtLomKy3Wo0dgDD21A2kyR?=
 =?us-ascii?Q?v533K0kwKtMINwZlsG/IIEf8Ro8zLPmvXux6OWES8Oog3pjnG7DeutJpeslH?=
 =?us-ascii?Q?EJhHSHDgTWFioSQSSv6EFVYFCuxRTELfVHNjgGo3hzlXBdqfx5AWyF82dBY3?=
 =?us-ascii?Q?RYqsvq/PTlHMPYzi6rHPue1ZEu/UqFdhHWI6muolHcJ+d/OgV8xLjM/hbBJp?=
 =?us-ascii?Q?Gwvs9kJaVkB5tGTTwuPpvy8coUBrPiT0VyTcyWBGZ4s2GNpZdOc8fUQS3jVL?=
 =?us-ascii?Q?uxL9P1kTQ/C/KYavZ7Gj4G8IkREJr8GUygDQGKeM9wOCycVvmLU8dv5BwihQ?=
 =?us-ascii?Q?jJH6GocXFFYu3NPF0rOUSfmkVJ1GjfrtJVzGjCmWqXahNiOEanGl4k7oAYAP?=
 =?us-ascii?Q?PGZmheNxfTDeTDTJAfu+rI2X6jjNwZh2CPeSUhbCn08H4r4u1yOiqCADQ3Jp?=
 =?us-ascii?Q?vr6EUjI/FnUrvOUoFcOOwI7PIn0uD5JQNgI7tlzZDyvdnyZSJDUJ33JQ0rx3?=
 =?us-ascii?Q?V+YrbBDZ85H4wxrN387weRg4izsHeeXQ7SeNuPF3XCVypcs0T/r/mbgyBkrm?=
 =?us-ascii?Q?W4DlD3YugK7zrUzkBa+pFHN39tCLe6voS8nvPYr5WpKI9m63AqZX3oYgXIxP?=
 =?us-ascii?Q?8WwpHeC1T/3qUoQiuO+lWolaEM4qHTzN5STNsKLl+O3ZCvi4p28wfy6PaSdj?=
 =?us-ascii?Q?0M3HYeLlgAu0fmjRU0ZJiNdFpyqNoeyDADJ8SegxbNGY/R9cVutGz+ktkV8q?=
 =?us-ascii?Q?BRwVL99hp791uPRzL9Vl/rB6UJCW9RvJscpo9CMTIuJYSJzXG8vCMewiCdXY?=
 =?us-ascii?Q?qce/S7e1MR2QjGVedc9QS7KUcFfzAvTTnPnR0OwVCXIbehkoAEEgGYjatPC/?=
 =?us-ascii?Q?2ySFJs8ZAyM7Ew8fZQIwcMlwCI083XhtIvRd0ZOsorf5HqK2ZQQsNjjm4HjM?=
 =?us-ascii?Q?rRkPOElmsx9hIxlbqhQLBL1l2t+459jFjwo6suraUPS7kLR6mbo9DpjDJqt6?=
 =?us-ascii?Q?NwMIGe4DmcNvvQ1cuYfj+5SmupH1Ht8VN2T2yVkwEfpkVs7yNOgmPx4uTdOa?=
 =?us-ascii?Q?bdYLuG0zVN2XMCPnMbWRbJ9JFAMaJuw1OmGzQPwnAXHdhIBPA8e+tLTpVSMD?=
 =?us-ascii?Q?IBlFqwYxHOq0sIBlWiNwNQlyYAqXFPcmYVG2xSA9ug06N0Ksnyb3KT4GEEhI?=
 =?us-ascii?Q?NiEQHqrT2Rir5BGCvrb9BkD5PNhhlWMiisIR87DHy3/DbGjWsOFu8oPmQRuQ?=
 =?us-ascii?Q?AFjq+cbEIzhTm5l8ZKA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5953.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35394db-df04-4c95-9607-08ddc29023ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 04:37:29.0150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0mkrYOxE3vFIF18QjU7v8bLLwkAElKOax9A+zH+yTSI/kuIFnQfI/I27B0BKynT/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8809
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_213757_000413_48D5E301 
X-CRM114-Status: GOOD (  24.75  )
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

[AMD Official Use Only - AMD Internal Distribution Only]

> -----Original Message-----
> From: Abin Joseph <abin.joseph@amd.com>
> Sent: Saturday, July 12, 2025 8:48 PM
> To: vkoul@kernel.org; Simek, Michal <michal.simek@amd.com>;
> yanzhen@vivo.com; Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>;
> palmer@rivosinc.com; u.kleine-koenig@baylibre.com
> Cc: git (AMD-Xilinx) <git@amd.com>; Joseph, Abin <Abin.Joseph@amd.com>;
> dmaengine@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH v2] dmaengine: zynqmp_dma: Add shutdown operation support
>
> Add shutdown callback to ensure that DMA operations are properly stopped
> and resources are released during system shutdown or kexec.
> Fix incorrect PM state handling in the remove function that was causing
> clock disabled warning during the shutdown operation since the device

Rephrase - it. Shutdown was not implemented earlier.

Say extend remove function for shutdown usecase.

> may already be suspended with clock disabled, causing the clock
> framework to warn about the double-disable attempt. The current check
> ensures runtime_suspend is only called when the device is in active
> power state, preventing clock warnings during shutdown while maintaining

Explain pm_runtime_enabled/ pm_runtime_active usage.

> proper clean up during normal remove operations.
>
> Signed-off-by: Abin Joseph <abin.joseph@amd.com>
> ---
>
> Changes in v2:
> Update the shutdown to perform same operations
> as remove.
>
> ---
>  drivers/dma/xilinx/zynqmp_dma.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index d05fc5fcc77d..0b03c2092c28 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -1173,9 +1173,18 @@ static void zynqmp_dma_remove(struct platform_devi=
ce
> *pdev)
>       dma_async_device_unregister(&zdev->common);
>
>       zynqmp_dma_chan_remove(zdev->chan);
> -     pm_runtime_disable(zdev->dev);
> -     if (!pm_runtime_enabled(zdev->dev))
> +     if (pm_runtime_active(zdev->dev))
>               zynqmp_dma_runtime_suspend(zdev->dev);
> +     pm_runtime_disable(zdev->dev);
> +}
> +
> +/**
> + * zynqmp_dma_shutdown - Driver shutdown function
> + * @pdev: Pointer to the platform_device structure
> + */

Why we need separate handler ? Just reuse the remove directly ?
See https://lore.kernel.org/all/1748977771-714153-1-git-send-email-radhey.s=
hyam.pandey@amd.com/

> +static void zynqmp_dma_shutdown(struct platform_device *pdev)
> +{
> +     zynqmp_dma_remove(pdev);
>  }
>
>  static const struct of_device_id zynqmp_dma_of_match[] =3D {
> @@ -1193,6 +1202,7 @@ static struct platform_driver zynqmp_dma_driver =3D=
 {
>       },
>       .probe =3D zynqmp_dma_probe,
>       .remove =3D zynqmp_dma_remove,
> +     .shutdown =3D zynqmp_dma_shutdown,
>  };
>
>  module_platform_driver(zynqmp_dma_driver);
> --
> 2.34.1


