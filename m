Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78895C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 06:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RES2k4ap3Nrqs11/YAgUGKIj+LgmhtABE1Sd43JDLzU=; b=483iurK8jRAh7MVzhFrgsvfhUf
	TZr1GAiDmm9cTYY7Uyx/5c13gJ0c9nNTGlfqC3QIADN1QEKqr/D4ogba+6SQs9MWr/Z6T0Wd770lA
	uwR7qxUHJkaWjHtxEtRRYWsEjvNbGG9mMDyfvunluTdYFh7yBHjn7Pwk751ar+gHOesLdQGivH+8s
	G6h9E31/MH8PNIliFOaFnF3C9PXy97BHDPVFL8F5DDm3YxDMYrQYqptPflsFk6hvjNe+VaWOONna/
	A56A+LbPOfy+q9necyCsz4ORJ5jwS7rMWCl7zAinNe+vLoNxBUNdI8Hcbk5yv/DWo+BlR/qum5BU/
	JIDfq4xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAJZ-0000000CIan-3BwG;
	Wed, 28 May 2025 06:31:01 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAHP-0000000CILu-1zWv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 06:28:49 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S5qnKG021288;
	Tue, 27 May 2025 23:28:23 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2113.outbound.protection.outlook.com [40.107.92.113])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 46wq820ncu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 23:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1qpjrYWZXcZNSzx3bqGLnWZ6LoduVL9m2QAeEiBDitRQJU3ge0BNngGrkDEPsnrvWBOgxhVblq6GbGL+nci3CgVvbsAzT9Xtu7Mqxcv1kO6/6HTH/LGCmzv3ehTEiAwxcQuxQbqNxeVGDVCUmqRUym2Z74d51ZqUBxvQ8XfHuqhUWXzOA1kg0OMmVprnMAClt4m2MLCuSUVPY+7esHmK3AfzN3hF1J5otNlgI9+Occh20TI91hl5wAe1Y+J0l88Ba074Ibw5LAQHBoL1O8h8mlV10O6tGVrBUyjax8P0DYjIJVu8veOtV1BAuFJ67m9gAps1bSrpHMdUqoQTzGT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RES2k4ap3Nrqs11/YAgUGKIj+LgmhtABE1Sd43JDLzU=;
 b=yjMgRzoL5xJf34UE5lGh3lrh/YQXuiFnLdPbc2S1pTLGI08AzMIsIdfP5BtqvMvz2X6JfMVSEYRHCULe4Tl4aDUiqRCGmV2PiWI16NwFG3SUeaBMkt5IC0CfckMKzUpObXA3CpNYQ3bMIWaBg5wN9FVNa394wo5GwBSTLwru9fmfH6SNhAsZW/TxGi6D7Kej+L55tvKyEaayoXUaOhNYY297Tpziz9xZdafgwVg2RzBKJOaNbvX/2an5nGIShEFbCOJyEUgrXG/SXF/7ZiNxw+huxPkRwCb+bMsAtBXrSBe7egVwpgh17i/oH/+yy4+Cp5qIIXE0Tviw7soQhT1kRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RES2k4ap3Nrqs11/YAgUGKIj+LgmhtABE1Sd43JDLzU=;
 b=tM/UB9MkdnfWkJ7l6VK538jnOPjL0OIOsMT4iE/Bsy8bov51yQObMiE1hKJ3+0Y8/iTjr5Pvr149r703iZUht5DZnVbOpJtMhkgZfDcy7gl9ptlRBO8ipgztSjeqtw4oxQb1ChjLBzUKpN9b0YkwHQnehEdV3LcnJYR+FjQdHbU=
Received: from LV8PR18MB5914.namprd18.prod.outlook.com (2603:10b6:408:226::21)
 by MW3PR18MB3625.namprd18.prod.outlook.com (2603:10b6:303:56::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 06:28:20 +0000
Received: from LV8PR18MB5914.namprd18.prod.outlook.com
 ([fe80::30f2:fc3d:f58e:8305]) by LV8PR18MB5914.namprd18.prod.outlook.com
 ([fe80::30f2:fc3d:f58e:8305%2]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 06:28:20 +0000
From: Linu Cherian <lcherian@marvell.com>
To: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: Suzuki Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Sunil Kovvuri
 Goutham <sgoutham@marvell.com>,
        George Cherian <gcherian@marvell.com>
Subject: Possibility of using Coresight STM - ETR as console for  System
 Control Processor 
Thread-Topic: Possibility of using Coresight STM - ETR as console for  System
 Control Processor 
Thread-Index: AdvPmRx3iCLKuwfyT4aOsliJqfc4hg==
Date: Wed, 28 May 2025 06:28:19 +0000
Message-ID: <LV8PR18MB5914F2903E66BABB272F02F3CE67A@LV8PR18MB5914.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR18MB5914:EE_|MW3PR18MB3625:EE_
x-ms-office365-filtering-correlation-id: 96937b73-a2b7-43e5-7eda-08dd9db0d6c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?D3UlQhJ7m31d+6z3l9mYhtIzeBEtMOqfW2gDbH4IWOi1c5Pcx3rrRJESpvuk?=
 =?us-ascii?Q?B8BDrojo65cDnqDh04ncVMXtZxKOBWemdCt5c82TtClwfWlQX1R1S0OXfJRP?=
 =?us-ascii?Q?/qAbc8payCj1fi7okUC6E3eRVlAN6q/bf+zrvfNqmGsmp+z7VETt472/jmPX?=
 =?us-ascii?Q?cG6D+V5cxN0cstEx78fHLiZNUvwRZjH2d6U4FJrT+GBAA8zQWRxZUlNhjYHN?=
 =?us-ascii?Q?AXhN7thtsQiiNzMxxaKoUtAhSWew0NoOu7Q5KE7t4Z4HRjIQVx+1EjazEEmz?=
 =?us-ascii?Q?ioF2mB90S88zkKlGGEypI41rv+l+ywsn2+Ym4K7wGjlzaHWe/CMWptJ1dmtS?=
 =?us-ascii?Q?YggVEoHIlUWcbj0ELSB/vQgpmbD17vgAUKoSUC5mOCKwtJdpgeYlTHpXcgy2?=
 =?us-ascii?Q?NNj5MUM/TTqpbk45PuOGQGmrJ2uj94XfkFHtPkSun4Bwa7OCJxQalPRvd5ps?=
 =?us-ascii?Q?KxBTekjCK2lT+m/1qvioGLVJ118gO1ACdxK9iUchgogwvjOlKnfyBU/EqzOC?=
 =?us-ascii?Q?jBa2zuN62HkuZgFyxFYWzsk/JOBXw68Yg5K365NL82+EnLkTJR6Jfc4spdwp?=
 =?us-ascii?Q?z3m6imSp3BXyxaDgnopN0eSC2cG+XKesY7BdctH0aAEOCsDGBYTzA1DVzMDR?=
 =?us-ascii?Q?7U3hOlegYSN8Po9dNgzJ5RCcn2Q+IuCC7EqF5PP7GEQJclSNMtPlmhHzdaW4?=
 =?us-ascii?Q?qLCvnNS+d2gsaD3HUb7NFv+D7YzZodG3CRXLapksFxZmPA/TGj5LE43ha75v?=
 =?us-ascii?Q?kFSTH0DY8dVlo/ZBz1DKWgEO9uUrsS3c/3IwAm9HymFG3LYlAg44ocBAwhcf?=
 =?us-ascii?Q?jfzRWzsjWm9mvNOr0GfrD8TA/QgDSUXRnOLqShKFkvuxuX3J5X9GgK34Wy6J?=
 =?us-ascii?Q?qp6QdAShY3eJ5YMYQNMOUj6Vm8EMXduXAhLMzc2016kG3csbryaqiCueC+zx?=
 =?us-ascii?Q?A9iFV+ES3ndJLHVG1WDuaJHlKcs5MJSA6zYfTl/G2ERcW24QBKPelhXeYwrZ?=
 =?us-ascii?Q?hCc2CQ7H11upSKAHNie/BdUYTS7/UL1qCtlQKHFP4zCWqj4t4eLugIyacjDF?=
 =?us-ascii?Q?67CIv74I1v8dDf4IpNA2iuhqESbRdleegRW6sKs4zroqzkoZuokM0k0WGdOL?=
 =?us-ascii?Q?nufyz8Kce1H7yz+7YsupYCUkqY6CbWXBN9R1LkiX0Uzrh8QYwtQFWvXnEQMI?=
 =?us-ascii?Q?qgI+5H1pkEQnhSHGv/ZEb+8qR2f6LLrJrf3KNvy6MOprQT5eLFxjlNHG5UUB?=
 =?us-ascii?Q?0KTZufSQSwNOtiQXseXVTrwSzquc4NWhTlDlIwba3VLkNnpTQ+EXA35ZUGss?=
 =?us-ascii?Q?jnyGdk/O5wBkypBhj3mjPUnhAOQkS90SeYEtM28THRuC5b3DAMzkTDz24pdX?=
 =?us-ascii?Q?+UuJiPD2TND8yYDhLZmBCB2SBHyyRL00pvdX+EUjSX0fPM1MM91SxsnHU7Sq?=
 =?us-ascii?Q?GeJzI7bRavavUcOej5VRTqUW6J2ACx+Pt3/oVC8JCxOI4S1OXCk22QTUTrXl?=
 =?us-ascii?Q?/AzsIqDI0KnAh+o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR18MB5914.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GRhzeWZ+CUCWf4hKdGy4vD2/McvPRS035KwGUmbKR5ZGz6YLZ2w8inut2XRu?=
 =?us-ascii?Q?WfP+sduH93ax2ysU5Z+9g6bvfRWbYmu+MzpePEkSGbAq0DhfFvhULKPalG54?=
 =?us-ascii?Q?2CiVDaVdgC/WNp4Mz519dc3DWD8uUwtqU0rbRFvUirfyxcqKUoiRbngVtQMn?=
 =?us-ascii?Q?QWdW9BN1VaMQbngSWyW1SUnGvnuPyOKL1La0Tmg4t++wb7Dy5r5DRZo+piAu?=
 =?us-ascii?Q?zCM3X9YPlfjdRv15QA2NCUr9Z8uc7Ca3LZTpVL+tEAaA+D+JqnkEKIFqPt7+?=
 =?us-ascii?Q?g+EltHt/N4ns5GCp0lj3+MbGHNGN6rWarpjWbLd8M7zUewxWGHO1DFN6UNxe?=
 =?us-ascii?Q?u9w9iQMvpHzg10wiJp0QBbwL12+7f5e/5TU7njXoaSSqwmZlKKi80Sf4e7Rk?=
 =?us-ascii?Q?zizb/QrAEyc8CneZmzUplUpwYLi3qoC3k2dUowmnoBmt75PVvY+HueXWTxFN?=
 =?us-ascii?Q?1L0Zwzz4Oszgc6iNm6z+soZrBVykYN9tk2wVa37PSP06RIR22J1dcwwmuS4J?=
 =?us-ascii?Q?ThMj/2R3X5kyvlN3ekLgLXDnlL2MVMNFIdtKlzCRYQHd9G8aJsGOMYG+TAoi?=
 =?us-ascii?Q?dyp2hlJ385La0PPUgbgT42vcl2pega9ARo3p3/gEYm57nm+zBncb+pf5myHF?=
 =?us-ascii?Q?2eZtFQxp2ECeanOqGIHeFjU78xoNQayp2TVpuancQ2RUTHZu7opgvwARf+o7?=
 =?us-ascii?Q?xUWPcCRwiwJ+rWUdzKBiRhIwXd8Dqbay4JICwvdLNCmflgcec82Hl+DLSkv9?=
 =?us-ascii?Q?XK2Zk1+kKt93LD5MHkxoLYZ/LMdfW+9jZvsCqwoh8JOctV6Q2tSZcLv3rM1Z?=
 =?us-ascii?Q?Bgr9dJxPF8kx0PckInnK483NFJd/yOxMlXWhAPER0Z0w/FzHvWPKiOGaR3lg?=
 =?us-ascii?Q?lK+so3RILVXDJgUpN8uAZ88LG/vQ8firTYx9uddWkPm4Odvt4LppP9JWfO50?=
 =?us-ascii?Q?4RxRKLxIEgqGO6K6m7m1NL7bl7CtuQJ+AGFkXetovmUXaCpEyYZ48OSu4wDd?=
 =?us-ascii?Q?2xBXBilGnbdOWPei7Qo4D/XIY9pGZGKELD9hgSOoSBAzK/Q2e0SyF6/hK7bv?=
 =?us-ascii?Q?+2yexTU0o09MrIOXNaUifY2TSIocz24Aice6g/lwvvwe1KRVNNdZMkD6ClS6?=
 =?us-ascii?Q?2ieTXjWnamoAzqKe/12mLugrKjxNEsAUbaNgJgxGt/zXkzFTAxRplWlnr5Wi?=
 =?us-ascii?Q?0CbCDmm0qoIo7iKVGqDHRFvs4LNZ1z6/AmEsLLAGCXSheTE9beqH0PevYdgh?=
 =?us-ascii?Q?mhABHQ+6NZJxqV2wpV+X38CzXdhcKHjrhWMyy0DBh1+mBuk8fFljgQXOe8sv?=
 =?us-ascii?Q?peCWyM+YMrC5j6jsuLu8JJk8npJelGTeNNHhAaWGYEqzgW7y9ZCmjsvNt0Cc?=
 =?us-ascii?Q?TTspAdck+yFi5O8DHViGa7n47f6n0oGYJoajLony7opz2nDMv/+gqG2tJFUK?=
 =?us-ascii?Q?PmrGnK0ZVeI2t7zEyymwKA2GDcyTacwzDxUutY3r8jJtqZqrSL6hJbZbtIF6?=
 =?us-ascii?Q?zJiCM7isU78+arKvrVIw8JCtbdlOzx5rYYXvBvZB5VN0uwrI4KcWCgudyrfw?=
 =?us-ascii?Q?DWfL/LDXprnq2zdNJKXKt9YRK3JZpQ7Yo75dKxgJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR18MB5914.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96937b73-a2b7-43e5-7eda-08dd9db0d6c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 06:28:19.9131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJ1d1BZAGQc0GJud+Z3zfEO8XDeuuo4hCKmplfxEQ/+16H1pmzbGqwgi9CStLJVIouDATUvS7oXkopuP1bLZAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR18MB3625
X-Proofpoint-ORIG-GUID: JUlCWntYg_ydMnSi_YQ_hQbvS5b6zTF4
X-Authority-Analysis: v=2.4 cv=EfnIQOmC c=1 sm=1 tr=0 ts=6836ad07 cx=c_pps a=6JPPvL0+Kp/bephKfSor1Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=-AAbraWEqlQA:10 a=IM6E2jOgcGZly9E7YVAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA1NSBTYWx0ZWRfX+GOHYYlqSSaM y5dPoOSaYh6tNir4LaaXOHcjsziK1ipien8UFd7R50lI8fpp3jpVj3qR5kX0K9en4uqqo1gkGr1 HjwA3ZMFuIihSDOH2AKYJT5j1g1ocbnthJzua+pJUHsykp6jFy20f/9Tdif+l52uTuq/btG3sdQ
 BvRg9yFK1GWbXzTR2Q5U6L7cdah0nvKg7Rdby39MXstN2Mdwx+IISs71HWPJgCvkyf9/wVHDlDe PRQwVKzfHB2kWRA7vgPAXLaXVAjR/OD0ccd9LERsZ1ZEV33FzzEK6Mb+hLPnEh7BTYw+EZdojKv p1t0i/ndV6pmT18zSnyNuyRjI80aNpT4O3OMjHCK7pi6omrF7rGW6OprTLCBs+GoR1S5EnGwGsm
 /Z9npU8c6hdFCVEidFyGJ2hz3U6iTnPPZFsQ7/AY4XStBbTgHbMWdHQ3o+461m+8OagcnMn+
X-Proofpoint-GUID: JUlCWntYg_ydMnSi_YQ_hQbvS5b6zTF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_03,2025-05-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_232847_871494_76B24AAC 
X-CRM114-Status: GOOD (  10.12  )
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

We are looking for console options( output only) for the SCP(system control=
 processor)cores in our SOC other than UART
and was considering STM as an option.

Something like this,

SCP ----> STM ---> ETR ---> DDR   <--- Linux=20

On the Linux system, some user space scripts can retrieve the ETR trace buf=
fers and move it to a file on a periodic basis.

Do you see any basic issue with this approach or have better alternatives t=
o suggest ?

Few issues we could think of,=20
1.  SCP wont be able to route the messages to the STM -> ETR path until tho=
se are initialized by
the Linux user space. Hence any messages until Linux comes up need to be bu=
ffered in the SCP local memory=20
and should get flushed once the STM - ETR path is ready.

2. Possible message loss due to buffer overwrite
We might have to reserve the ETR trace buffers only to the SCP and keep suf=
ficiently large buffers to reduce the message loss.=20

Assume that reserving a STM port for use by an external core can be achieve=
d from the Linux STM sysfs interface.

Thanks,
Linu Cherian.

