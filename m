Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC214C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcqgxtGFghFUjR5XzA3mRByTanwPwKuAUihWstSD6QY=; b=qLq7YS5ET19EuzN7cVjL7oOQB/
	yFdMatZ+5wA+et3k/DVHhSPHWrkjJI5oFCcdtoc8JnzrAyJCOt2XvKKoYbt3Jmtehc2tN7vIGzZtL
	QZJGT9Bihp11+cd8rdqZ5gVsLjRyfOvx5qv8dBPC1p5WoSzcihGbAvoh0p0nKdkzBVonjuWi/lPEf
	hagSDqseEmSeVU39gD8kWki3n85VZJf08E8nqA6yzEvWSXZT0Pce/VHIEbugay6Z2tcyiKRtEffe4
	2HvqtkHjov2pgxBbc5vFjQ+kmpux3EQPeGZrQH2YhBRoqq3jJo2EbSa21jXWT/VLOSbeMsC2gN173
	+OShS/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPqWn-0000000EmvN-2ojd;
	Thu, 12 Jun 2025 22:36:09 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPqUd-0000000EmmA-2gD6;
	Thu, 12 Jun 2025 22:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1749767635; x=1781303635;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pcqgxtGFghFUjR5XzA3mRByTanwPwKuAUihWstSD6QY=;
  b=l47Ar3Xy6SUIOHu0A7oRmwUiEmNpAOUDVxHKv8CN+P9uCW6QW374OsUi
   QvhPoyy1MU6eG4WQpDyAurQBx6ZCmjNqV4QdYryW6EL+UWl2+zVjUgrOQ
   dFsiRib3v1777iv3mYXjhXQZopupOoQi6g36DYhVXllcbi3n85zMKPMXM
   0ViegorfITvdja+58uDpq7xM0j0uKazO2L6J2olKTvABTQoy9VLRh3pPZ
   QmgLoRffp02IzX+1c2wFS/SaC1UGn+Ja3tOHXF8i++gleqWTwOuFR+zRp
   +/0ArtTIaRk6oDyjA9/z3NAMQdEoRTpbV9iL7+PG+tFAoAlXUJCoOFtuo
   w==;
X-CSE-ConnectionGUID: CWp1Hm09T7KoI5cjO+Vuwg==
X-CSE-MsgGUID: dJFlS2LTSPG3R8Q8h1XHwQ==
X-IronPort-AV: E=Sophos;i="6.16,231,1744041600"; 
   d="scan'208";a="86482828"
Received: from mail-dm6nam10on2046.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([40.107.93.46])
  by ob1.hgst.iphmx.com with ESMTP; 13 Jun 2025 06:33:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnNwwGc7Mp7r42TxuQkc3DSeuEQvPxGFMhxa8DQFyKBSATdcyukIRvardiLZVfr8YYD6HSeRsZXb8LCY8+XCO6CPoZlzVDW+44Rc1YgNVkL3xfrd47AEL8CC1WiV/QUtMk/wdHeFS2qT/oyWn4Tn6uyPmB6b9PogTdZvZILIBKYuwkB4i+VM5NedbhfoLsgVkGrobiUxZpakOchKQgSfwJQVbVkUdrr6WEfv4Di2UDkQ4UYzg2TrhFaQ37q8EcfJD/hy+nhQt3gOGzGh3fXs47U7ZgiPf4vxBHfiu4I1XS+oFBSyHd4Gl6NFpLYbXVop0oyFBbRxQfluiNJnT/E1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcqgxtGFghFUjR5XzA3mRByTanwPwKuAUihWstSD6QY=;
 b=lIf1xc3KO4qS38IkfCSmLjAHSiTYK+kwPmsxg3Kn2qL79K5PmQ9z106YrpyCT5DtRaSyrZzqEgQMIoTBBnUfofJXHAqKj8aX3ot31DmbNLXOK4eongSz4gJhRIjdIYCScJyIoG6+uM9/2E1kJXExfpzudfRIZZoQ+sqq+EMbREm2vUIB6G434zqgOdSwNQWdCighqBJ1zFqo+SLYCK4wuqqFCXZiBG6cTzncvKDqdKdH1UUABDWBSFVdMCDhKGrJOj4UQNdBm8ejIUBNfpQgazQfw85EwQVziGnKneNg6Z+57Exo7o/hiWHSodLduuHIKxOGuAv23TnEQGBF3OloJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcqgxtGFghFUjR5XzA3mRByTanwPwKuAUihWstSD6QY=;
 b=ivZdSX/1lCCFL7dMLe4AxY8tqsW4KGPkIPlmljxTatBafZEUg74kapK3nJX3qoNxFCRv99pMLiNyycfbaT4OW385yVDChDcmimlyzXU4QNPy1wzcrqn1a9b2iDyTxxT8BAnUX8cUoruvTtMLEXfFhET4xBHeCzC5vlveIVFM6Nw=
Received: from PH0PR04MB8549.namprd04.prod.outlook.com (2603:10b6:510:294::20)
 by BY5PR04MB6327.namprd04.prod.outlook.com (2603:10b6:a03:1e8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 22:33:49 +0000
Received: from PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e]) by PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 22:33:49 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "shawn.lin@rock-chips.com" <shawn.lin@rock-chips.com>, "cassel@kernel.org"
	<cassel@kernel.org>, "xxm@rock-chips.com" <xxm@rock-chips.com>,
	"robh@kernel.org" <robh@kernel.org>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kever.yang@rock-chips.com"
	<kever.yang@rock-chips.com>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "heiko@sntech.de" <heiko@sntech.de>,
	"mani@kernel.org" <mani@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "laszlo.fiat@proton.me" <laszlo.fiat@proton.me>,
	"dlemoal@kernel.org" <dlemoal@kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] PCI: dw-rockchip: Wait
 PCIE_RESET_CONFIG_DEVICE_WAIT_MS after link-up IRQ
Thread-Topic: [PATCH v2 1/5] PCI: dw-rockchip: Wait
 PCIE_RESET_CONFIG_DEVICE_WAIT_MS after link-up IRQ
Thread-Index: AQHb25Af0uh9iSjylkOLhY594X104rQAHQAA
Date: Thu, 12 Jun 2025 22:33:49 +0000
Message-ID: <da98153a859449e08003fd0d13ba5b28b12bdbf3.camel@wdc.com>
References: <20250612114923.2074895-7-cassel@kernel.org>
	 <20250612114923.2074895-8-cassel@kernel.org>
In-Reply-To: <20250612114923.2074895-8-cassel@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8549:EE_|BY5PR04MB6327:EE_
x-ms-office365-filtering-correlation-id: dbf4d429-7e3e-4378-1707-08ddaa0133a8
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?cnBybFhBem90dEZqZk01ejJlclZxYWs3VlJPdmE1d3lmMmdkS252MXZYdk5G?=
 =?utf-8?B?TUVFUmdTV2tNL2NuUFU3MXIyZG1PL3JFK2sxRDdJMUV4aW1yd2JvZHlESmFy?=
 =?utf-8?B?bWgycXk0SUNMQXNueldHMm9yNVpiRFJwS25FeGJxM2pzcnNscWRhTjJqLzBj?=
 =?utf-8?B?Y0hlaFdPNENNdFVGZk5MamtVM2VmT2krZjhwSDVXbkpjTzY1NnlqOHVJQ2ty?=
 =?utf-8?B?bG16QUt3cWlvVFVPQzdUMmZ0YmFOMUJVQm1zbDBZUUExVXRGYzZOU1RVQkFm?=
 =?utf-8?B?MkxIc3RuSlFwWnN5eGJ6RitpRUE3VFBGNTE2bElhZXFvZGxnZ05zazlhU2ZI?=
 =?utf-8?B?aTNwVzlxNVV4T1NCSi9MZXRyTnpFejliWnV4Zk96Yk1VaHJ2SEVVOVpPOFJs?=
 =?utf-8?B?TkdORkFRdGpEdmxqS0JEVDdHQzJON3MxN2FkNzBYZFY0ajRCMXZ2U0toOVI1?=
 =?utf-8?B?eklJclZOeE9oNVkzMHhJVThsdW9DSTAxMHNNUnVHZThuZU9ZUDYzeHpydW93?=
 =?utf-8?B?Q1NGZWhFSXI1cGxHREN0OXZZU0F0UXBXNXN6SUdoaHhUb2lWVnlqamRvb1E3?=
 =?utf-8?B?MWM5eDNMS0dTMEF1YTRROW9sT1dYRHZTVi80QXZjZXNoUC9xbE1FWE1XZHZa?=
 =?utf-8?B?VG14UVZuZjhtWjJYaU5JcXV6b0lKWE5XaUVVVGcrclcrYWhlZ2ROK0k4Nzdi?=
 =?utf-8?B?eVVUQVBrMURqMGFZd0NDa0dPblZwY0I4a2hpVW8rTGdQOGtBWWNnVytENVp5?=
 =?utf-8?B?STBWZUNmU3BwOHZrSm9jZjFvSVU1ZG1uNXdhUW9LYW9hVlBabHdiNDhHdTRq?=
 =?utf-8?B?aGgzWjlNRmY4ODc3VzFJdGE2clA0amtvcGtyNEN6eUdKUmhGU1p1VCtaWDBt?=
 =?utf-8?B?NDFCWUIvVWlGbjQzZk9VdGx2aHhWeXcyQjRVbzk4WHdMNFVNMlpBUjFicUJL?=
 =?utf-8?B?MWhZYnBLWi9SNW40bGlCOGh5NHpGcnJrK0lXV1pzRlJucWR2dktsTEJlTVA0?=
 =?utf-8?B?bkc0cFgxVUxJeVp1QXprRTVSNGhJeGtrVkJYTDN3a3k2M3V0d0l2UU43b0pX?=
 =?utf-8?B?c0MwUjZpcHJ5UFJpYlU3TkVHSDJUdkp6NGoyTHlPUXZqdDNqRVluZUg5ZVpL?=
 =?utf-8?B?a1psSW0zZ0lCTEtvQkNGT3VhcHhWRDhGSGlXUmFmNzRVbkRRZURxTURkcjUr?=
 =?utf-8?B?UGZCaUNoVk5xMEhXTmFPZVJHTnBVcU9ZZGxvejZQcVdHb1NlaVhST2VZSFJR?=
 =?utf-8?B?RkRGTzVOcCs2b0cvS0hUKzg0MnJkbDFYNGIzTis3OTMxN3J5WHYrcGRVS2Zu?=
 =?utf-8?B?UXhJaklWeHpPWDQvOUpPWis2bS9YaStWZFROVmJHWmJBa0srYWQrR0MvS3Zs?=
 =?utf-8?B?RWhlSGUxL1ZxNWxoVFN2ZUhIeVQ4TGxyLzNLOUcwdTl4Q3NYVzJOZ0ZnYmlT?=
 =?utf-8?B?RWpSWUJydmVQM0k4MW5YZk1RdjNPU2p4ZnRqM3RibWJyL1ZyaDlhT05yYmM4?=
 =?utf-8?B?M050aHRhWTU4Wit5SExlVkRrV1VIcVBaN1RwN2V1Z3NyOUFMakxQY2F1TUkw?=
 =?utf-8?B?MzhieENpUHV1SENjcWdTUVd2c1M1K0lXUFZUNXh1QUNZTVBYUEdlVk0xczc1?=
 =?utf-8?B?a2I5VDV5ZklCUWJtZ1N6L29jR1h4TjJjZU9yNWZJaUVlZmpmczVjOHRHUHlo?=
 =?utf-8?B?U29SVy9GTDg5T1RNdjhuYlBCaW5wVWpRYlhxZ21KbEIybnBCWFVZQnRnRXFM?=
 =?utf-8?B?Vk95WmFXMGRNUmUyeWZaU28ydHdXUk1JN09veWdMOWFZbVpHM2FIQWhUT1lG?=
 =?utf-8?B?bmE2YjYrYWN6QjZ1ck9Bam52b3BwOGlCS28ydStYOHV4NWluekFCSlJkTnBU?=
 =?utf-8?B?dlcyOEpVLy96aHdBUGx1M21GbGU4ck1JQW5tRHAvTFozeEQzZXc2WmVrVWxY?=
 =?utf-8?B?RWJ6Tm9KY1FnK2tDMmM3Y3lMTU01L25oeFJ1L0U0dElsSWU5dkFnblF3a1dM?=
 =?utf-8?Q?+pEnGBNovRc5I1535KMYDCMmlPaAws=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR04MB8549.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vmh2TDJSZDFzSGU3ZkdWUWxadzlXaldGODVOWEx3TEc0TXRYWTJ4b3VQWWth?=
 =?utf-8?B?d0dTS2tsL1VSN2hIeEZtcTluQSt5VnRYS2VnVVFSNGdPMm5XTGM5T2RNdGI4?=
 =?utf-8?B?R3VsWkM0YU8xc2twVFJ2QXBXZFhScThpc0JLSHZpWnJTdUYwc0tTQzhDcXNx?=
 =?utf-8?B?c3dqTXBIaW5DVTFTcnNFRDZXMGxic0ttNUVmbVNXcm9MRW9UaVYvck4wOVZ4?=
 =?utf-8?B?S2lLa2huVXhaVGUwNEd6VGpLTk9VcjV4NUx1dlMrdHJNUnY4NkF5a1VBQW5N?=
 =?utf-8?B?ZCt4cDY2cnZvVVZhUFJHRGdFaXB0UjltV2t3alErUmNDODlwOGFvTXE3QjZV?=
 =?utf-8?B?bDREN0ZHR3JGL1o4NWpKR242blFOVTZkR091Mno3RTZtUWRyY1k4d1Nsa01M?=
 =?utf-8?B?WDREQXhkeHZpZHgxWWJpN2Y2V0pNV2VtQVozbUlNRXpwU0RDSjZQbXNyZTJ4?=
 =?utf-8?B?c2hyVktLUVFJcVB5S1FjeWVtSWFVMThhbHNxOGpJN1JQd083SkdudFJNSGs1?=
 =?utf-8?B?b0dYdHN1UWNKTUhqWmMwSzV6akhMWjBDY2FaS0J3WW1sMkszd29aMjhHYmd0?=
 =?utf-8?B?QWZ6OTBWd1UrZGdveUNQemhkcjBSaEFBTFpoZG1xeTh2Qk5YbWV2aDRiRUda?=
 =?utf-8?B?amZ6KzYySXNuQzMzMnZBdG5YNVRsekNMcFgxTDZXdUJtcUdDZVdpMjMrcDll?=
 =?utf-8?B?c0tpc21nNWtZdDFQNzIwYU4rcXlCcjN0OHNWcHZVSE5nUVIxYUhpaUV4UlhE?=
 =?utf-8?B?WDhaN1htVXdtRUxSVUwrWXl3alNtVnl0a1ZIK21PRlFvT0tYVm9venNWTFdG?=
 =?utf-8?B?Z0p6d0tqWmxaL0RPRzJVQ3RYYVRacWl5VmZUeTNybmlLR2RPcXpNMzZtd0Zo?=
 =?utf-8?B?OG5INkJDR0Z0a09rd0cxTWgrNC96ZWs3YytYdFhqMmhxdFNnSzF1MlNWTzY3?=
 =?utf-8?B?VjZDay92QnA1YnRnWE5pTFk3OFBNNElFU1RBeHQ3YytidnAyeEZ0b2twSXdw?=
 =?utf-8?B?RnJ4UFN5TVZycFY2MFZnWGhzUGJoN3M2K0M3NHNRNUNDbnBaRDdsUVlOZW42?=
 =?utf-8?B?L3dVeVB1RHVmSWdyYTdnOWk2OVowRVN2VXZvaTBKM0xySUg5a0ZsVmpyamdk?=
 =?utf-8?B?ekFtaG5VNzlib21rR3AvRXV4T1pKZVZXSkRFNG9Na3hha2UzODhSRndZV082?=
 =?utf-8?B?N1RGcCtGczVsZTFoYkdyKzRUUC9KRkpQUzQxZHZzeXZRYmovT255V2VVU0lR?=
 =?utf-8?B?WFpPSmhJd09URml1YVF5RlVIR2RIa3dVckxwRUwrVDVwYXUyQUR3YWNQYmo5?=
 =?utf-8?B?WUYyQUZnSTZ1ZXd2SUVZOFlhVWRqZWhaZW5vTm9kWFAvVHd0WUJLZFVTcHF0?=
 =?utf-8?B?WkVVM3NyRzg4dEg0TkgvWVh1eEQrSTlUZWJVVkdPL0ZGRlc1SlU2OStPSkNV?=
 =?utf-8?B?ckVSOGxqNEF6UCtlNzNRTkRncEcyeDJBMm5VcFNnVitieTFWN3BzcnBBc0pw?=
 =?utf-8?B?VzNoQW1mTmhGMDVMYjFGS05WNElqTitsU0p4R1I1Wk5td0ZHOTlMbDZNYTly?=
 =?utf-8?B?R0lRUllocnhCUEpLWDE0L0hHWERDaTNRRWkvcWdpZ0ZpOVp5YUNHYWZvOC9Z?=
 =?utf-8?B?c05XNDhFemFMclU1eUZpRDQxWlhNMy8wV2VWZzBtSnZXMnRJZENHNm5zbXVD?=
 =?utf-8?B?Q0xwQ3BOOFNTQitJck1Zd0hCYnVUK3lwQTAySnpEOE56eElJRTlsR0t1dERk?=
 =?utf-8?B?Z1NGQ29UVElJY0tIQ1dGMXRqTkpmeVdaeUwwQW4raUo0YmQ1QmNQeEE1SFhZ?=
 =?utf-8?B?UDVEUGtWNHN3allXRVE0VGRrN0NLV0hYRkdJSVVhWURRaGMySEN1aE80d01Y?=
 =?utf-8?B?UHJNOU14MVRGOXJUM1hyNllSVHRlK1BQd0hHcndiYkNtODZiaGZZWmdUanQ5?=
 =?utf-8?B?bU9Ma01xQXQyLzhCWWQ2RUdvVzlUZmd6OGZjYlI4OFFxRDFTcnM2NTV3WlRU?=
 =?utf-8?B?N2cyd1NqMFFpOGdQdGFHZEVmTWs4R2lYVCtXd1ZOWVZmcmxXREJxMDFoQTdt?=
 =?utf-8?B?RTEwTG9FT1JUNWpoYjlFVlZjazNHSjd1L0ppZDJ3ZmI1Nk83L1VqWkVnTm5n?=
 =?utf-8?B?czg4ZVRFSUtPUWFkMEE4UGpYcTltQ2djVC94NmFmWU1TUCs1NU9oYUU3ZXF6?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A484ACD8D8AA0044B88CC835B463BE9D@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: bHmsEf6NWVO+tii4rT1yLEvZyIqDHjOHmMf4MQuaxxtBd2m8lGvYKuIoT6aPHvUDNRalgPuriw/eVrKz4GMnF2bpdmAe1Ei3qaJfcLeCOmZ3+KBu50IHw2DX7GtFF9oEO2LI4E8POJNMkcIQiO7fEXbRxaTzyDfJagrT9Rs9wsFhiz8m8hvv/RQZ56ql2n/MyKfRq5gcrhfNNh5bbT68g7jfrRGpzaoSAzyXetnZXGPtoV9BN6FbE3uMQOjQWTfX7wcIpeAw+lyDzAfyOnyh5LiKj2jLyspwDeMn1WOqdbf0kR04puEkzHo6SbKJzlkMFqns0+G42IUdLHYa2Dhygxip38JHIQcYA9VyIcWOKYE/Ao6TbefMxRCtX/3SumTcxpGj9FUTbzGGYr48kVzChFvZpgoidOr5Zn53MhQduEgYL4Rw2EAywk6glng0jcW/r1Rz29oklJcQUKVnhfnGccjYjlUeG363DVg7QyZSrA8hQ22sVQhMT1HhKm19Aka80Hdn0CPAuWNvGn6mw8yRcKiPg7Nxh4bV/Dl9U43ftXkXjq+FGJOn/YbeG/hjO+91+zAG+p6QkRNmBfpmoA4kucEBy4RW88G/WPveDN0bBH3hHT02FewIDWfDKhQUS522
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8549.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf4d429-7e3e-4378-1707-08ddaa0133a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 22:33:49.4668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mlxmug1Ub1hVlOHGsrTk7uhu8urpQszIsX7nTDZhxvcOGL0KgMD2hL2rJXMgz+VExHH7TNUh/kbLHUFckz+haw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6327
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_153355_795379_79EC277F 
X-CRM114-Status: GOOD (  21.06  )
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

T24gVGh1LCAyMDI1LTA2LTEyIGF0IDEzOjQ5ICswMjAwLCBOaWtsYXMgQ2Fzc2VsIHdyb3RlOg0K
PiBQZXIgUENJZSByNi4wLCBzZWMgNi42LjEsIHNvZnR3YXJlIG11c3QgZ2VuZXJhbGx5IHdhaXQg
YSBtaW5pbXVtIG9mDQo+IDEwMG1zIChQQ0lFX1JFU0VUX0NPTkZJR19ERVZJQ0VfV0FJVF9NUykg
YWZ0ZXIgTGluayB0cmFpbmluZw0KPiBjb21wbGV0ZXMNCj4gYmVmb3JlIHNlbmRpbmcgYSBDb25m
aWd1cmF0aW9uIFJlcXVlc3QuDQo+IA0KPiBQcmlvciB0byBlYzlmZDQ5OWI5YzYgKCJQQ0k6IGR3
LXJvY2tjaGlwOiBEb24ndCB3YWl0IGZvciBsaW5rIHNpbmNlDQo+IHdlIGNhbiBkZXRlY3QgTGlu
ayBVcCIpLCBkdy1yb2NrY2hpcCB1c2VkIGR3X3BjaWVfd2FpdF9mb3JfbGluaygpLA0KPiB3aGlj
aCB3YWl0ZWQgYmV0d2VlbiAwIGFuZCA5MG1zIGFmdGVyIHRoZSBsaW5rIGNhbWUgdXAgYmVmb3Jl
IHdlDQo+IGVudW1lcmF0ZSB0aGUgYnVzLCBhbmQgdGhpcyB3YXMgYXBwYXJlbnRseSBlbm91Z2gg
Zm9yIG1vc3QgZGV2aWNlcy4NCj4gDQo+IEFmdGVyIGVjOWZkNDk5YjljNiwgcm9ja2NoaXBfcGNp
ZV9yY19zeXNfaXJxX3RocmVhZCgpIHN0YXJ0ZWQNCj4gZW51bWVyYXRpb24gaW1tZWRpYXRlbHkg
d2hlbiBoYW5kbGluZyB0aGUgbGluay11cCBJUlEsIGFuZCBkZXZpY2VzDQo+IChlLmcuLCBMYXN6
bG8gRmlhdCdzIFBMRVhUT1IgUFgtMjU2TThQZUdOIE5WTWUgU1NEKSBtYXkgbm90IGJlIHJlYWR5
DQo+IHRvIGhhbmRsZSBjb25maWcgcmVxdWVzdHMgeWV0Lg0KPiANCj4gRGVsYXkgUENJRV9SRVNF
VF9DT05GSUdfREVWSUNFX1dBSVRfTVMgYWZ0ZXIgdGhlIGxpbmstdXAgSVJRIGJlZm9yZQ0KPiBz
dGFydGluZyBlbnVtZXJhdGlvbi4NCj4gDQo+IENjOiBMYXN6bG8gRmlhdCA8bGFzemxvLmZpYXRA
cHJvdG9uLm1lPg0KPiBSZXZpZXdlZC1ieTogRGFtaWVuIExlIE1vYWwgPGRsZW1vYWxAa2VybmVs
Lm9yZz4NCj4gRml4ZXM6IDBlODk4ZWI4ZGY0ZSAoIlBDSTogcm9ja2NoaXAtZHdjOiBBZGQgUm9j
a2NoaXAgUkszNTZYIGhvc3QNCj4gY29udHJvbGxlciBkcml2ZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBOaWtsYXMgQ2Fzc2VsIDxjYXNzZWxAa2VybmVsLm9yZz4NCj4gLS0tDQo+IMKgZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpZS1kdy1yb2NrY2hpcC5jIHwgMSArDQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpZS1kdy1yb2NrY2hpcC5jDQo+IGIvZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpZS1kdy1yb2NrY2hpcC5jDQo+IGluZGV4IDkzMTcxYTM5Mjg3OS4uOGEwNjhmZDRm
ODY3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWR3LXJv
Y2tjaGlwLmMNCj4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kdy1yb2Nr
Y2hpcC5jDQo+IEBAIC00NTgsNiArNDU4LDcgQEAgc3RhdGljIGlycXJldHVybl90DQo+IHJvY2tj
aGlwX3BjaWVfcmNfc3lzX2lycV90aHJlYWQoaW50IGlycSwgdm9pZCAqYXJnKQ0KPiDCoA0KPiDC
oAlpZiAocmVnICYgUENJRV9SRExIX0xJTktfVVBfQ0hHRUQpIHsNCj4gwqAJCWlmIChyb2NrY2hp
cF9wY2llX2xpbmtfdXAocGNpKSkgew0KPiArCQkJbXNsZWVwKFBDSUVfUkVTRVRfQ09ORklHX0RF
VklDRV9XQUlUX01TKTsNCj4gwqAJCQlkZXZfZGJnKGRldiwgIlJlY2VpdmVkIExpbmsgdXAgZXZl
bnQuDQo+IFN0YXJ0aW5nIGVudW1lcmF0aW9uIVxuIik7DQo+IMKgCQkJLyogUmVzY2FuIHRoZSBi
dXMgdG8gZW51bWVyYXRlIGVuZHBvaW50DQo+IGRldmljZXMgKi8NCj4gwqAJCQlwY2lfbG9ja19y
ZXNjYW5fcmVtb3ZlKCk7DQpSZXZpZXdlZC1ieTogV2lsZnJlZCBNYWxsYXdhIDx3aWxmcmVkLm1h
bGxhd2FAd2RjLmNvbT4NCg==

