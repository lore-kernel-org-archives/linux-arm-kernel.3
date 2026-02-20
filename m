Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB32EC531F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 00:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+0djC6fzUubWx/nf9DDHfmqxKY1E4u0GjepDjFPGWk=; b=4J+7rZ2LrfLZv9r8IBvPntbUcP
	e9ifqokM65y8/S0EepBQsoRi40WmsurHwvquHBkLeUOBUvkTQD5L7Mh5Fxaw0c3tWn3lDPmR0TIJt
	ec2qa70Qq7Z9V8HN4kEFOKo0NXnoHN4vIMVLV+r2QXBhOchDTJdv4aWzpfrZ+sDnRGdxJg+s11cW+
	yzt9FLlbSw3mWxEe2QbKk4yWbgTG0FNaNYDXFBhE1D8Rf8MLelzE9OGhQkwEdfXfB6Tz6DKS65pXy
	kUekgs8pmpwbLO+O0Yub3PvktS4BLHlaueIPdV0z6mglYqX9S+U2V5GnFfxij98rpHsNNuFfWHP9u
	8mfpc5Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtE6Q-0000000Cgm6-089a;
	Fri, 20 Feb 2026 00:10:38 +0000
Received: from mail-westusazon11010056.outbound.protection.outlook.com ([52.101.85.56] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtE6J-0000000CglW-2L46
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 00:10:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ataiTu9Be29O1u5iedo2K4Y2JiRSlIGOiTMDiOi2eqvhCpP8gR32W0dC/c4xgnh/13oHu6CEMk8O+WvoVzjRws5gEGCkdGtZG1QGqqH8q0jKq6qkrr11Whq7j3Qvetes+2Mdwz+uNEZ5T9jJq0b+1E8RsqNxqGaJHLLMFKD9z1kSI5vSnV5Vix9lxlhoDw2tBydPCRQGbyTqR1hQk6xCkodAfDZGerK/9rvhG3aNy+c1YYk6jpjj1R0YaF6Vjxz2zIycXTglACgF4TirM68JWHgvPHlczHW42KeeNjS2RSisvwGPChMKpPRJwRP4qPWOg4zcNHUKonIZpCrrCQ3LCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+0djC6fzUubWx/nf9DDHfmqxKY1E4u0GjepDjFPGWk=;
 b=ZoHv2DNqYm7Uco9pr3pjKybzIe3BsCgH38hdpDW6Na3FqBet6HfljqYWPsY/melUm2UUf3pnt7aZwbXTbd0d/7mYE9MRdsEFLj6RWn8UEQuhN92zNaZMacS+rnBcyC7ewcQQ7v8m2Pmv/VLVYJx9oPTSzmNkLHB/wsDMWi54KsE1DGTOTuuQ32Iy8s2GQ6LO6nn/+cU9YDWIXZnbVO6Jzg8qcAR2ydlvKxJRXNNVOBHWGXYqjY7AJ5Az2oM8AEk/sAtbyDQcXIDYGpDRJKR4nCuaKa2nbR3qaQQKWR5488PX80fsvDbgYG3rPeyEwmSq3tHTaG3S3Wrbef2Q+4QdEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+0djC6fzUubWx/nf9DDHfmqxKY1E4u0GjepDjFPGWk=;
 b=ABT4kv/MfYwLjbFoEPUBL57xvy2AgXDDlK6dlADHIY7mmTxebyAB3pM6gJtm8lzkKzYDqLvI5aZGvTnXaANmnrojyD2zE/4/FmS3zy3KD2fF1hQqnxY12EWjNtTxqgzUVJhJY6MeU0v610VpLXVNrdSoFkt9QqgRiMD8XbFfPCQ=
Received: from SJ0PR03CA0145.namprd03.prod.outlook.com (2603:10b6:a03:33c::30)
 by SJ0PR10MB5858.namprd10.prod.outlook.com (2603:10b6:a03:421::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 00:10:26 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::b) by SJ0PR03CA0145.outlook.office365.com
 (2603:10b6:a03:33c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Fri,
 20 Feb 2026 00:10:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 00:10:26 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 18:10:25 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 18:10:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 18:10:25 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61K0APc72943455;
	Thu, 19 Feb 2026 18:10:25 -0600
Message-ID: <7ad9d8bf-a962-40f0-bc8a-92228aeb0b4e@ti.com>
Date: Thu, 19 Feb 2026 18:10:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt Trigger
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, "msp@baylibre.com"
	<msp@baylibre.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
 <c47697b4-6ebb-4af9-be96-c964d990835d@ti.com>
 <DFO764ES0FNP.1SUQK9R0EUUDQ@baylibre.com>
 <1a91fd40-e814-4b4c-8914-d8f0c4768e07@ti.com>
 <DG59D7WGM35A.1WNIIMNCQ8U3C@baylibre.com>
 <7ae7f6a1-0ee1-4d56-b1d0-f038a7d22b4c@ti.com>
 <b649669afe4e2c829389a6bedabe47446d2f3d2b.camel@siemens.com>
 <615c56c4564b38fe82585e9873949b538f24ae7b.camel@siemens.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <615c56c4564b38fe82585e9873949b538f24ae7b.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|SJ0PR10MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 69747ab3-3e3c-4427-1df2-08de7014733b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWtXQ0lIRjRpT2NiS25IRStyU3BSakFQR1MrNnlUZ2x5dFlPeUtCTUdvSjR6?=
 =?utf-8?B?cytMTkRVb2VOTGptQTFMV2pzV2E2Zy8yMmxDbkhnWGRWSHFnVFd1d0dKSHh4?=
 =?utf-8?B?SEtxYWZFZmthclBLa3JJTmRoTWRkU01zTVdBUXZ3Mnh6VzBEa0kxTGtZN3pW?=
 =?utf-8?B?cTVab1U5eFlLWGZnNHlkWmlnUnpQaDBnMGZqeUJWczFnYStVdEcyUGN1amhx?=
 =?utf-8?B?TEhEbDhyeFhOY0sydkppVGhjWE9HSkRadDBHajdzSnVESUlHVVJTVmpzdzlH?=
 =?utf-8?B?ZForVkpaTm5Sak1KazlxVlBrczZjcUxoV0RVUXdZSjBIcjhSRVFIdXBiM1dJ?=
 =?utf-8?B?ZklIcHlDclh6UWtUWFZ0ZjhQK1FrUDdYNXNMOTk3U0syOE1zVVdaWHVlcnE0?=
 =?utf-8?B?VVZPTVZBQTZwS25Sc01lbUh4VEc2WmFhbGJOUklySGU5ZzhtT29pdGh1aEdG?=
 =?utf-8?B?MGV1amh0S3U3RHc4M2FIdUdwNEJSSTZIdlpwNEl4ZDh4SUwyeFhTQjVzWHg2?=
 =?utf-8?B?Rnc4MnFBUHF6eEhLZFBQcG5hVlpXQnBDWGh3SzYvalVZU3piTU4rKzVrV3E2?=
 =?utf-8?B?d0FwMXBsN3cyR0o2NXN0ckd4Z0RUb01VSE5zRVMxSitFejE5VVZ1cnlSblp0?=
 =?utf-8?B?blVPQzFzUHdLVFEydWQrVzYvb09MRmZleHh4MWt1S3lHTFB2Ulc2bnVLeHo5?=
 =?utf-8?B?R0lZcFU1MzBTVE1rZHNxbVhUOVYzTEVHL1lRaVo2UFdQMFZFNnJuMSs0b0Iw?=
 =?utf-8?B?eGIzTTIvZVNxQ3ZIY1JuQjZ1TUsrT295Z1JRbmFXWURXdzFCcktFMGFidzFq?=
 =?utf-8?B?dndmbmwyOWpXcko2aUw5L2szbEhySzg5Tlo5WUdmTU1hUnZ2OGpTaFlaMEIw?=
 =?utf-8?B?a1RQZmIzVzJaVDlTdzV4V3JSeXg5UTRKcjU4a2VLVTZidVhkVzR6UlQwQTZy?=
 =?utf-8?B?UHA0Ymc1MHBlRHRkUDc3M3NRRDRVb1dWYS8yZFFaTk1KVnpKY3p5N0h2cER6?=
 =?utf-8?B?eFhFck53dUhxVVJyM3pDMStFSjAydXFyUzRDblBDWjZGYXFGVkVLTXQwdFI5?=
 =?utf-8?B?Z0FNQ2cyako0dVVsSmVscXdrVm1tUUl1d25CbmJoa2hxQmtqbmkvdCs2ZnQ0?=
 =?utf-8?B?UG9aSm5yQmxOL3ZyNVlPdWhmZS92ZmlHS0xzNzB3MnFxK1p1U3BVL2hobTR1?=
 =?utf-8?B?Q2hNOTN5WmFGRWRlT0RGRWxqNUxDTXB4R0Nra1hObVBhS3RDK3dwdENaeFo0?=
 =?utf-8?B?c3JoWi9iSDFhMFR0UDRsQ3dFSzN6QnFnb3krdUlqbTk1alk2RWtXU2Y5SDgy?=
 =?utf-8?B?dUdKYm1QQStKalpKdUtkQ21XdzBDeHBDRHFHLzFKN3FnbTNHVkU1bm1mV0FC?=
 =?utf-8?B?Z3F0SmNCcXlIQ3RwUS9HQU1odUVHcjZGUUdaVlRMN1o1bTdESU53SFR5Y2tj?=
 =?utf-8?B?VUNROG5hQ2RvY2dZQmZzcFY0amJUc1RyakQ1NXJPSTN2TzE0bURtOFVBbXUv?=
 =?utf-8?B?TGRiaWtKZHdacEhWTUd4OWFaVnJzZ3pObTZYakdlc1dGSnd4dU1oVjRtdHlp?=
 =?utf-8?B?WVVjdVZVYTdSQjVDWWpKeXBpT0J2ZGxFc0VPc0xPQXF1VUhnN2phbDhZcndr?=
 =?utf-8?B?d1VaeGhwUDEveC9aUXlzaHE5Y1lxRWR5MkR6M0xBYmVlTkJMRjFDdjJBeHdx?=
 =?utf-8?B?NDZoMlQ0bHpRTDFBV3VjTmlUMm42VmJ2Vkk1RTkzVEhYNTdJbFVWSW1qZkN0?=
 =?utf-8?B?NmRaL1l3WUlpQlpkNEpoMUZsT200L0kwcG1ZcXJ1VG04MG9kazV2UmVNai80?=
 =?utf-8?B?enAwN3NrUGRsSHh5SzlVUk9lR0NxZFVITFh5NzA0OFhwRjNZdVlHSTRhYmFw?=
 =?utf-8?B?bHc2SDFua0Z2dHROc3JnNGF5b1dkelF3RWJpbndCTWdXWGlnbTkyTm9UUlhS?=
 =?utf-8?B?MGNsdDFuTkZKMWR1UzdTKzFCY3F1YlZzVmZGcDRreVA3a2pkMGgzMmZzVy96?=
 =?utf-8?B?ZHNGK0dGbjhFVkl1UW04L3h0eVRtMFd6NGZ4c3l1RngyeXVXRS94UFhpaDZQ?=
 =?utf-8?B?K21Bd0NIVHkreFVCazdrNzNCTzhTTkMxZStVa25uOGFXSkpxbkNENkwzQmVp?=
 =?utf-8?B?anBQeGplcHA2TUVJMEg3Q0NjM0ErMXlvREJCR2pvc2ZRODZuai91WFl4M25p?=
 =?utf-8?Q?4zikY7quKJ7ypfW4PCPNL1Y=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +6dtfliIMqVL/igl/9c0KkqQYeEmSLHOJcqCeYWR51pBQPe/KijjFlcK46ij3EV71F6T4x+7XOKJzjUZV/Z/CU2/t9vGQCf2HHXSnkCNGYGNKIGYWJlpW/9l8JSUTnsC3GOoDl6reXCEpAolP8uCxSVDO8iTp/WMoIEJvlk3reTHmh6RaRBmHL3b45h1p366SGqjkCvKZiPTUEvx6amRZxpnr0W7V5JLUBVqODAAqmytDFtUz9WUKTjP6uw/DnG0dU1VtdiElp5XJ6OEGvs7a+9tHOy5qbCbutco5KXARztzUpSNm95aztTCPfQ+bKR1D9AA0IV2rHQNTM/2P6eMWk5uSYXHwwLpn9KbEJ8/p4w/LPwnMUdyBZRvDMQJGXGrdynNzhmDAGpwcX8nPrzmCpiGDXZJ7h9Q6KY7a5ZBCFfryEB2Twl3oOs0m9xdQqPc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 00:10:26.6724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69747ab3-3e3c-4427-1df2-08de7014733b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5858
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_161031_801561_1AD74B38 
X-CRM114-Status: GOOD (  13.66  )
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

Hi Alexander,

On 2/17/26 7:23 AM, Sverdlin, Alexander wrote:
> On Tue, 2026-02-17 at 13:57 +0100, Alexander Sverdlin wrote:
>>>>>>> Can you please run a quick tap sweep on MMC1 and MMC0 interfaces like
>>>>>>> so? https://gist.github.com/jmenti/f4a73a8323e44bf717c6d2c528c499ca
>>>>>>>
>>>>>>> This will give me an idea if whether we should be talking about
>>>>>>> revisiting characterization with ST_ENA=1.
>>
>> I wanted to apply your patch and test on our HW, but I have some doubts, if
>> the patch maybe missing something:
>>
>> - am654_sdhci_write_otapdly() turns out to be unused in any upstream U-Boot version
>> - new "omap" variable in am654_sdhci_execute_tuning() is in fact unused as well
> 
> and
> 
> | /home/sverdlin/u-boot/drivers/mmc/am654_sdhci.c: In function 'j721e_4bit_sdhci_set_ios_post':
> | /home/sverdlin/u-boot/drivers/mmc/am654_sdhci.c:598:9: error: 'itap_del_sel' is used uninitialized [-Werror=uninitialized]
> |   598 |         printf("j721e_4bit_sdhci_set_ios_post, mode=%d, otap=%d, itap=%d\n", mode, otap_del_sel, itap_del_sel);
> |       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | /home/sverdlin/u-boot/drivers/mmc/am654_sdhci.c:594:13: note: 'itap_del_sel' was declared here
> |   594 |         u32 itap_del_sel;
> |       |             ^~~~~~~~~~~~
> 
> 
> so I'm not sure regarding the previous test results at all any longer..

Sorry for the late reply, somehow I missed this email.

Oh my, I am not sure what happend but seems like I did not copy the
whole patch correctly. Were you able to bypass or do you need me
to rebase the patch and copy correctly?

~ Judith


