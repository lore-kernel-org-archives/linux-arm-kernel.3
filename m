Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE8CC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 07:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XA8hL/ZWElz/4x2N6mtK+4EV1ZBU0NVLBXD6I3quTMo=; b=djIkTn0Ya46L3YFFASqAU+jZIt
	14XBPb3p7miPKGvojIq6WGAy0aS8O8Ucfwdxoab+IsCjTWsNShB4e5R59l7nRTcLfijdkwYBcPd3V
	ewLI4Lsonf/PMajeneOia+Jqjuw6yInpl85uTg5fknkaHT9RkLmmyGowm9kYebOFgfcLBH/0PjE6a
	vaxiB9CwKRJE7nb9vTe2jlasKkFwxFrSqT+JpZdPSOWU2+onVbTHLZnYWlKcoPrL8P459+qB3y/lu
	guB92bbksixPdSV2UirqOyT/cadOuJzn1hIBmYCb3Hb8xZ+WTMpnUJvurFz0M3q45Q/Jr+tdW2tda
	6YmNG/Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipON-00000009ncG-3SFQ;
	Mon, 04 Aug 2025 07:13:55 +0000
Received: from mail-dm6nam10on20601.outbound.protection.outlook.com ([2a01:111:f403:2413::601] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipLo-00000009nH0-2lhG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 07:11:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZEwa7EKhNOp9mg4ZAJ6QZcWdEhe3u9BODYxGflTvsNFFzzy4PEWQE0F9AzNUv3BE4Ea3jrRIXM2bCQI4NDZ68/E2/xr0PVnwjcravcOH2SvqHaT1EL1wQBz8CkBmO671x+94QDkyxnSyXopZ+NSBZNIufcnYnDesMZglIX4rePE9CkHtL3m0iz5HLlZucDk260undFsKyybvZt635qzeOEUNiw/GIfVV8YIteFG0Oodf3dcE9bhIwjP+tpbhkvHBQzVnPbSo+w7U5ZYWRJoWd/eWRE/UlEOnTmr0E354n39mouvosrQ3TPC7eBxjyq5U7qIrWeEwY/JQpqSGsJFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XA8hL/ZWElz/4x2N6mtK+4EV1ZBU0NVLBXD6I3quTMo=;
 b=g4w4ccwb5xnnn1culLdVsQKtdDCnt2T3JCFmxINnl/At5H7htWnz/Jkhh7YclMxeuZpEU5WhiTs1/aOD+RoReHzcH+1uht+H1tCbDyFP69E9QVAcoMCLJrTGzPPM+k0ak4yDjUZ7IjBf+N0zj5Jt49LifgyY7nAB/d133aPa2WDsjkPgFgH2OeD8kHeRyY6oBCrcMw3dROvlDXg3tER0Ha3MaDu3Mv5ZoA8p399UdkL28Fp0u4ILcfkZqedJn9GCT1vm0O99+0q+fftqURtSRpddPY36hcuGRvsytJKHWYl9T7rDw8xt1lp3M02UeApw0kvl8fJp3y7PKNyUPBNBIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XA8hL/ZWElz/4x2N6mtK+4EV1ZBU0NVLBXD6I3quTMo=;
 b=4OZpFbbGSD4DxRz8rc24eL5ZFbJjp3aXKQs0uBvmh/QzlT/BAf2lp/WBRlk7X7B+B4UxamjMGYR+fki88DlAeeErOL1dHr3yyQEzCNfCbiPCT9IZlrMAdw2am8F0dOyHcG6Cf137SfIvNkENf8CtP8vWevAiXu903f6ZXUtU+tI=
Received: from BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 by SJ0PR12MB6904.namprd12.prod.outlook.com (2603:10b6:a03:483::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Mon, 4 Aug
 2025 07:11:04 +0000
Received: from BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3]) by BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 07:11:03 +0000
From: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Adrian Hunter
	<adrian.hunter@intel.com>, "Simek, Michal" <michal.simek@amd.com>, Ulf
 Hansson <ulf.hansson@linaro.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
	"saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Subject: RE: [PATCH] mmc: sdhci-of-arasan: Ensure CD logic stabilization
 before power-up
Thread-Topic: [PATCH] mmc: sdhci-of-arasan: Ensure CD logic stabilization
 before power-up
Thread-Index: AQHb+iV59JsftOMvbkGqvxMjsJtJdbRBeViAgAAfaPCADDxgAIAEN2AQ
Date: Mon, 4 Aug 2025 07:11:03 +0000
Message-ID: <BY5PR12MB4258DFBCF57951B76758417ADB23A@BY5PR12MB4258.namprd12.prod.outlook.com>
References: <20250721095357.3783222-1-sai.krishna.potthuri@amd.com>
 <cf04326b-4de4-4637-aa3b-fa1c358b9ae4@intel.com>
 <BY5PR12MB425804611D4B29ADDCC82906DB59A@BY5PR12MB4258.namprd12.prod.outlook.com>
 <300b5c01-33bc-4ce6-942c-e32b6e55e5c7@linux.microsoft.com>
In-Reply-To: <300b5c01-33bc-4ce6-942c-e32b6e55e5c7@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-04T05:26:57.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4258:EE_|SJ0PR12MB6904:EE_
x-ms-office365-filtering-correlation-id: 633bc4c8-7436-40ad-cc2e-08ddd3261307
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ajdGKzVRYXNtME15aVB1SzJidjBKcEthYnQxU28zbHhyOG85aUQ3cGs4TEJz?=
 =?utf-8?B?RnY5YTgvSUhUZ2l0MnpHK3BYMFExYlpaSnFOcTcvQnR1V2tBNGFsRUJ5eXBm?=
 =?utf-8?B?MUZRR0ZTYUNnU0VjZ0FWWEpHc3RsL0FGOWVXbHZpRmZmSHdKTks4Nmx1MFBs?=
 =?utf-8?B?SkNtZkdNM0xYSnY5eEYvN3RlWHhGSUM5RW1vYlRseUVXMHBIZ3VEMVRZU3hX?=
 =?utf-8?B?ZGhUMnZwQUxHRXdmd0lsTG5TZ2Vlc3dYaTd6S1I4UWNRM3NseWs2V1dFdWdP?=
 =?utf-8?B?TWI0Q205QWprT3JBV29VR2xjUFhSeUxCNDZtUHV1UU1tMFRJNUV2Ymp2UVNa?=
 =?utf-8?B?WEdPVHUvRDhYTzJON2E3THZBbjVob1B0K3JFOUluU2hxYjgwWVhQY25naG5i?=
 =?utf-8?B?eVV3K3l5Q1RiclVWVm5TTXROTzZYdDJ6dXV3VHVWcnc2d3UwcFF4ZzNvRnMz?=
 =?utf-8?B?OStoWUVXQys3THcxZGMvdFNhZTZ4QmlONXZYQzV5WHFiYVE1c2xRNzRINUo1?=
 =?utf-8?B?NFlEbmhkNFg0b1ozODBsTFN4L3I0Z09pcTcxbDRXdlVoaXc0V1ljRnZWcnN0?=
 =?utf-8?B?dWNIZ0k5cHcrZUwxUVRqU1JaaDkxVmw0RlpxOEUvSjRFamNqWDMwOCtPam5K?=
 =?utf-8?B?bkNwK3lLSFJScTRFQWxReXdsQk1sSTFhdDhNSXdBNDZ6Zlp6MTNQcCtmWTAw?=
 =?utf-8?B?dlg3aDBlQ3VRVXI4LzhTUHI3VjRQa1VpYVI5WmZLaVNrNm9TMFQyWFhDallU?=
 =?utf-8?B?RDlOa3owVmhPZVdwRDVnSXlqMXZ0dS9ud2U3SUdEbHNZdkxJOU9OUzN0M2JB?=
 =?utf-8?B?djFtOFh3WFpzU2lLblZwWDVpbXVreWwzakN5QVY1QXdwMGtHSGxKTGV2NXh1?=
 =?utf-8?B?dkZmdFN4WExYSDRnSlljaS9MRmF4SnlUUlBCR2RNTUhkSUZaaUxhZUpxM2lT?=
 =?utf-8?B?cTlmK1BoTWltTHRneTJaZmhtaVh5Mi9wb2p2WDBvSmx4QzFWKzdDT0ppc2pu?=
 =?utf-8?B?M1hQaDhrSUtrT1pjWU1mWTFNd3k4NmtRRTNBaFdPOStjc05ERzhFTDNVb01F?=
 =?utf-8?B?YXZJdnFmQWt6bHZ4Q21TelVrWHRBcjBybm9KNkRBVjlPVVNtcklaTm9sQ2Q0?=
 =?utf-8?B?ZXN6VTRiUFUzWWpqU3JNUGJhaWcxRXIzOC8vL3NlZnJpQ1VvaS9hYUZVOG5V?=
 =?utf-8?B?NmhQWlRQWHBEVEtEbWY3WmtZZWZRWFhZWEZSdVJ1SlpaVU9CSFJYdnNNMTZZ?=
 =?utf-8?B?bFg0YUhEY2ZOWFI1S0V4ekRXUHZpVWdDZUFaOExFTHVmTWRhbW1kM1J3bFFr?=
 =?utf-8?B?SGppNkNFbnJXcHlaZHZmS3VNRzFQNzZhUHpCVzc1V3dQcklsNHArb3NUOG4v?=
 =?utf-8?B?ajdKZVVSb1pHMW1KdGNxcGREZ1lIdnFRVUFKL3VzbzZ0bkFTV3gvWEpheml1?=
 =?utf-8?B?LzdvWVpYOUx0VUprMlR1VzRaYmJDbHVzQTI5ZDlPREN5VjVwaHBKM0lhd1U0?=
 =?utf-8?B?ZW9CMkRkNnhlVkczNnlkb04rZUo5RWtHcXhvZWtVZ2cxNUVvNVVzN21YKzI4?=
 =?utf-8?B?Z0Ywb2NGdlJLR3M2aHJiU2wwWDJjK0dmYU9tS2tob3IvTWtSMlhaYWZseVpt?=
 =?utf-8?B?VFpzRnUzRUE3TWEzSks0OW5LQVFhRHJjQTFxVElwaldOZHhLSDVzbWxCcVJs?=
 =?utf-8?B?aEhPenJ4UExjblJBQVNZUjB2VlFHM1NJM2RaSjErSXhXdjZ6aUFzOXNhSkZX?=
 =?utf-8?B?dzVVdGwwWmhEMm9xcjRWQ0k1R3ZsZkZUWmNLOXBZYlpseWpFWVNqM0xDS3Fq?=
 =?utf-8?B?WCttYVIzV1lGbDNMVlBxQXB3bll3cXd5aTJPcXhSWTNRY0xNdlNScHllaFll?=
 =?utf-8?B?bWtPMU9hZFNOdTdROXhVT2tKT2E0RkFnREVBTnJpb1dKUlkxbnN5RHZpMFpm?=
 =?utf-8?B?Ti9zbkZ5SFE0ODF2aFZCN2lpVnlnemxlakx4aDJFOW9adWUzUHhlVDV1Yk51?=
 =?utf-8?Q?QNORjTHdBulXhim7lgfwoEiGNpKBic=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4258.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXRJeTJqWW4rZmlXMTFkcTlGR3A5Z1pwK1BNUHFzMENLOUF1eGVyeE5LTlNt?=
 =?utf-8?B?d2Vaak9qMWd6YU5OaVFQb1ErSVVBV0xNdnBYckpEQitHTEhseVI3VUNpcWJx?=
 =?utf-8?B?ZklTcmRxM2FoeUtHU1plSVk5aSthRlJzSDdpTXloQzhTZ1IrcXlqb0ZlT3J4?=
 =?utf-8?B?bFRIdkdZSHc3RXFwNzZQQ2JpRmxKR0VrOHVNU1lSNXMxeEFDR0RKZ0lPK3Jh?=
 =?utf-8?B?VTNJdzV5RGRvcU9BMlQvMjZ4OGhMSkNSaDBGMVdLRXZqNm1iWXlPdVpFcnBi?=
 =?utf-8?B?MTE3cG5PbUhRejkxZVVMWkV3eDd0bFpCdGtzUHh0TnlaUmhXMEM3WmtTMWFm?=
 =?utf-8?B?d0ZEY0FIK3d3MldET2J4aDhSdjJOVjRlZWRkRzE3YmlCNEVvNW0wV3EreFJo?=
 =?utf-8?B?RWJVUXBUbExJSXdpYkxzaUxBbUZ6L0ZMNGVGb2VCMEMxSXZnOWxTZTJYL3Zk?=
 =?utf-8?B?MDkvRkVIQUpIbU9jdE8xaDI1NTI2SHVBNGgzK3ZOU1pQMVErSzA1b1NwbTVY?=
 =?utf-8?B?c0kwQ3hMb2tvZDdmR1RTanI5Rml6SVN6R2hxNEF4YjVLRC9TTXhFVWh0am4w?=
 =?utf-8?B?d3RERWlQTm4vOVhIUnlHUFVIcWl1WUI0S2NNNWo1Qkx5RnNjWTc4YVh6NUhB?=
 =?utf-8?B?d3BpMjNWTVIvaVdDaWtKUXl4VUtTOUtUZFNvRTNuSGFpUlBBMWRveENHZGNR?=
 =?utf-8?B?ZlBhbExkbDFwUDRtNlZhZkZxbUREUlZ4emROb3VvWGlGZDdhMUxjTjdtR21F?=
 =?utf-8?B?TXVOVVFpb1NaUXcweW1veVZzLytWaWpRdmhyb25ub0hDZkJKaXI5S0t3eGJS?=
 =?utf-8?B?L0ZJWnkySGNzNHdVWWovb0MrTVVwb0FtWkMrQ2FDWmhvdVFuNVZ4K21xSGpl?=
 =?utf-8?B?M2ZLaWJwckNYeVdodXMyQkdnNzVkczc0SisrZzYxWlVsZU5XaVpFaWFkTURp?=
 =?utf-8?B?dTFiV2FhZXBYcTNUeUYrMGNjeU9Uelh3TWJZbmdyWUM1Ujl3ZGlRRHNjeWJJ?=
 =?utf-8?B?TXllMjYvL2xWdEVJcDdmaFVwQi9oNUxnTnBaNmhWa25jRThGWU9CU3NGU1ZF?=
 =?utf-8?B?MjJiQjROZTNFRDdqc2hKK3IwS2luRmRIWnY2b01kelIxSXhUbVpXRm1Kd3BR?=
 =?utf-8?B?c00vSitqLzk2VWtPV1piSkNmV3ZKem9BN1N3dUtiK2RINEMvdFYzakJ4dDJL?=
 =?utf-8?B?RFZhWXJaSGNzb00xNmRmOUJBTkMyb21Lbzc4TTdUQllldWR2a0w2ZVY3UEtL?=
 =?utf-8?B?RWtTMUhMd0hCMGpVVmJ5TG1iaHJHN0tkU2lYMWNpS1I4TzBqTjZSQjVGd3ov?=
 =?utf-8?B?RGdKY01IV200OHQxRlNSemZlVWs2TWlUbFJERlZPSXBZSHl2QU5yTGhLbStl?=
 =?utf-8?B?NitMZDg0ekZtQ3VCMlE1Zi80N2RwZU9ORXB6T3J3Vk1OTnd6WDVhU3NHbEFw?=
 =?utf-8?B?TFArZkNHVTQzSlhPbWJOVVM5NkFlZTNacHRUQyt4TmtFRUpCUkJGa1NpTUx1?=
 =?utf-8?B?ejh1bTlSZkJQU2ZzT3RoQ3JvOFVWeUpiUzNkUUIydTdUQ2cyTndBL0UrUkJR?=
 =?utf-8?B?WXJJM2VDeVNUNCtJVWEvZlprVE12SkRrRVVOdEJQNXo5bytuZjdFNXNsbUVV?=
 =?utf-8?B?dlVnek8rdEs2RnV6NDZDK3dUR2U0QVprbS8xalJBOTZHdmFQUFkxSGF4S2lh?=
 =?utf-8?B?N2x0WEdPWlFUVHhFL043VUhKUGRXbGFmQWVOdWNrODJjZ0wvRmMvVFJGd3g0?=
 =?utf-8?B?V0ZxcG9nbjBvQWNzVnJLUW1VcUUxb2dBZEZUdldqNURZNXNvK3hpQ25pRXR0?=
 =?utf-8?B?TWJIb2F6UU9qL3JkMmZiYURHR1Z1b0tVbXh1WFdoU3JHSnI0QlQrSng4cGRu?=
 =?utf-8?B?R3lqcC9aOVN3amZsQ2psTVNGQUtIS0l3a1MzVXZKWW9MdmhEc3ZTZU5FZHZU?=
 =?utf-8?B?bFloM1d1Q3h2NUFRN3lqMVFtQ21MQWtSUFZMVndNQzRJL0tPZUtONmNCNG92?=
 =?utf-8?B?eU9VS29XSDdqNTNNclBod2dvQTBRUEtrSE1JZGtaZkNxREVhTWwrRS9KWVkr?=
 =?utf-8?B?R3dXS09pZVBRMHlWbVY1TWp6VUFNN1VRejlaTEM4cDArY05hQnJTZnplQ1Vl?=
 =?utf-8?Q?fdW8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4258.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633bc4c8-7436-40ad-cc2e-08ddd3261307
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 07:11:03.7929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gt9CWUMB5U0swOBtF9z73q+9rPJ9vBvCsIB1wBoMdDaGOpA99fDmQwQsX9oexcKVTWwfiuYwjhDmEebxoa2RnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6904
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_001116_702773_2DA37C40 
X-CRM114-Status: GOOD (  22.41  )
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkgUHJhc2FubmEgS3VtYXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogUHJhc2FubmEgS3VtYXIgVCBTIE0gPHB0c21AbGludXgubWljcm9zb2Z0LmNvbT4NCj4g
U2VudDogRnJpZGF5LCBBdWd1c3QgMSwgMjAyNSA2OjM0IFBNDQo+IFRvOiBQb3R0aHVyaSwgU2Fp
IEtyaXNobmEgPHNhaS5rcmlzaG5hLnBvdHRodXJpQGFtZC5jb20+OyBBZHJpYW4gSHVudGVyDQo+
IDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT47IFNpbWVrLCBNaWNoYWwgPG1pY2hhbC5zaW1la0Bh
bWQuY29tPjsgVWxmDQo+IEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+DQo+IENjOiBs
aW51eC1tbWNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBnaXQgKEFNRC1YaWxpbngp
IDxnaXRAYW1kLmNvbT47DQo+IHNhaWtyaXNobmExMjQ2OEBnbWFpbC5jb20NCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gbW1jOiBzZGhjaS1vZi1hcmFzYW46IEVuc3VyZSBDRCBsb2dpYyBzdGFiaWxp
emF0aW9uIGJlZm9yZQ0KPiBwb3dlci11cA0KPg0KPiBIaSBTYWkgS3Jpc2huYSwNCj4NCj4gT24g
MjUtMDctMjAyNSAxMToxOSwgUG90dGh1cmksIFNhaSBLcmlzaG5hIHdyb3RlOg0KPiA+PiBXaWxs
IHRoaXMgd29yayB3aXRoIGFsbCBBcmFzYW4gdmFyaWFudHM/DQo+ID4gWWVzLCB0aGlzIGlzIGV4
cGVjdGVkIHRvIHdvcmsgYWNyb3NzIGFsbCBBcmFzYW4gdmFyaWFudHMgdGhhdCBjb21wbHkgd2l0
aCB0aGUNCj4gc3RhbmRhcmQNCj4gPiBTREhDSSByZWdpc3RlciBkZWZpbml0aW9ucy4gVGhlIFNE
SENJX0NEX1NUQUJMRSBiaXQgaXMgZGVmaW5lZCBpbiBib3RoIHRoZQ0KPiA+IHN0YW5kYXJkIFNE
SENJIHNwZWNpZmljYXRpb24gYW5kIEFyYXNhbidzIHVzZXIgZ3VpZGUuDQo+DQo+IEFzIFNESENJ
X0NEX1NUQUJMRSBiaXQgaXMgZGVmaW5lZCBpbiBTREhDSSBzcGVjaWZpY2F0aW9uLCB3aHkgYXJl
IHlvdQ0KPiBtYWtpbmcgYSBkcml2ZXIgc3BlY2lmaWMgZml4PyBJcyB0aGlzIHByb2JsZW0gc3Bl
Y2lmaWMgdG8gQXJhc2FuIGVNTUM/DQo+IElmIG5vdCwgZG9lcyBpdCBtYWtlIHNlbnNlIHRvIG1h
a2UgdGhpcyBhIGZyYW1ld29yayBsZXZlbCBjaGFuZ2UgaW5zdGVhZA0KPiBvZiBhIGRyaXZlciBz
cGVjaWZpYyBjaGFuZ2U/DQo+DQo+IEdpdmVuIHRoYXQgeW91IGFyZSBwbGFubmluZyB0byBhZGQg
YSBxdWlyaywgZG9pbmcgdGhpcyBpbiBjb21tb24gY29kZQ0KPiB3b3VsZCBiZSBiZXR0ZXIuDQpB
Z3JlZSwgd2l0aCB0aGUgcXVpcmsgYXBwcm9hY2ggd2UgY2FuIG1vdmUgdGhlIGxvZ2ljIHRvIGZy
YW1ld29yayhzZGhjaS5jKSBhbmQNCm1ha2UgaXQgYXMgYSBjb21tb24gY29kZS4NCkkgd2lsbCBt
b3ZlIHRoZSBsb2dpYyB0byBzZGhjaV9zZXRfcG93ZXJfbm9yZWcoKSBmdW5jdGlvbi4NCg0KUmVn
YXJkcw0KU2FpIEtyaXNobmENCg0KPg0KPiA+IE9uIFhpbGlueC9BTUQgVmVyc2FsIGFuZCBaeW5x
TVAgcGxhdGZvcm1zLCB0aGUgQ0Qgc3RhYmxlIGJpdCBpcyB0eXBpY2FsbHkgc2V0DQo+IHdpdGhp
bg0KPiA+IGEgZmV3IG1pbGxpc2Vjb25kcy4gSG93ZXZlciwgdG8gYmUgb24gdGhlIHNhZmVyIHNp
ZGUgYW5kIGVuc3VyZSBjb21wYXRpYmlsaXR5DQo+IGFjcm9zcw0KPiA+IGFsbCBBcmFzYW4gdmFy
aWFudHMsIGEgdGltZW91dCBvZiAxIHNlY29uZCBpcyBhZGRlZC4NCj4gPiBQbGVhc2UgbGV0IG1l
IGtub3cgaWYgeW91IHByZWZlciB0byBpbmNyZWFzZSB0aGUgdGltZW91dCBvciBpZiB0aGlzIGxv
Z2ljIHNob3VsZCBiZQ0KPiA+IGVuYWJsZWQgYnkgYSBwbGF0Zm9ybSBzcGVjaWZpYyBxdWlyay4N
Cj4NCj4gVGhhbmtzLA0KPg0KPiBQcmFzYW5uYSBLdW1hcg0KDQo=

