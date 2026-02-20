Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC088C55AB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iobxDf5+wddxOdBdGXvZnbELGtYKl6IBQvaa8rUqfs0=; b=IdXUSil1L+0VhaKGN0824VT3H5
	MbA1FwMF/4O+fR7BxMnVI/w9g0+DlR5hdL91Y/isb0bqJRYVGzXB8tKxz9CjUDil4XP2vS17zNJSA
	Jtf2TkHeC4idLBIsY2df+IEYWx6bu6Ah8FHdcTslnPv+LSZzMJOzS/yiaR3txmF9pjJW6+kpvXsIU
	DlseCpDQxXHn8844XSRu3DWBVN+IeMNLfaAjCatcLPmyBR/ATv24rMh5FPC3N+LjRNvPXL2i/Z/L4
	j+CbB268LzSvL2cQ5uy5VEeuC8vmKQCOlzzXOYuPXQcraAVa3I9KL8Th9Eh2X/xVFYyzjX+QKO6qT
	MYrNqx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQFS-0000000EWUI-1Rrd;
	Fri, 20 Feb 2026 13:08:46 +0000
Received: from mail-northcentralusazon11013031.outbound.protection.outlook.com ([40.107.201.31] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQFP-0000000EWTx-2h1l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:08:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sN/yu1FQq8mRW3KTaP0qxtSlKODdiU06dLQXE4oC8NJhXjJBJqTlMHvxs6Uy5+dAPtv6tYhrXxhTAI/ys1ZdAdz89z1Zp0+41ydDq9OFPFBirQOPToP5JWNXi8toDLv50QJqkwPWzEEXqWf6LodmJ86zdGBIy/6CN8FS6UBVznP8NgsKdQR4u1IHJqnLcDQSfg0crMODBbDRCXxPnJMeV8k2cGPh/1gTUnuIucpaHEZp4iI5jwmdyY30RmdNB9xkUONv6lwQkmHsRl/WZE35BnPOL/xkkRboKDu7f56lRXcJGMae+cSvc3Iu296h3eQ+JTv0nAQrUh2BHwPhYtcToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iobxDf5+wddxOdBdGXvZnbELGtYKl6IBQvaa8rUqfs0=;
 b=h08Pt5kx4IT21WZEk74QEnCVO2ugZqgxPsqAAM7H0vLgFYe+uSIOK4dADV/ZMmawBJwv8qO8lPXHLeBXIohWGfikRLNEQ4EaOJ0Cd6LGZcoxNwF0ujRL4r9DNtRRiBaDsIvK7AQIO28nO11udlnaJfKjSphVc6vFJP6BHANn474nxD6pkbowhSXETJyQnzyQWuTXINO5Th36gqZZIqsLov3LrJ0Ii+GIjYbnJky6akM8y7YoeZT4N9wBewC1rDIH3ikn7rQEf4gVb4d0JISKcmrB5JxeskdOg+Xgmr1zvPJ7ExSyXIJCa/SnH2XqIPzbl2SIYn+oFDRcUq042vNfhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iobxDf5+wddxOdBdGXvZnbELGtYKl6IBQvaa8rUqfs0=;
 b=DAC+Fk/u54GSnNZOErz4KMWPO+LDb9Texc51ZE++pNrIszjmO7uN/IszY0leejAyeHCjuB7TL2VuzKZur1cCP+rI230D7GrN5aFsgHjfxqb8V2ZBa9aqgCor+elqRkOuwVApm3ctw/1mqI2wC+ZKN4txelX4jpUneUsaORQG1Mw=
Received: from SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5)
 by SN7PR12MB7369.namprd12.prod.outlook.com (2603:10b6:806:298::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 13:08:35 +0000
Received: from SN7PR12MB8147.namprd12.prod.outlook.com
 ([fe80::3923:c1a4:778b:56f2]) by SN7PR12MB8147.namprd12.prod.outlook.com
 ([fe80::3923:c1a4:778b:56f2%3]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 13:08:35 +0000
From: "Neeli, Srinivas" <srinivas.neeli@amd.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"Simek, Michal" <michal.simek@amd.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "richardcochran@gmail.com" <richardcochran@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [RFC PATCH 4/8] xilinx: tsn: Add Ethernet MAC (EMAC) and MDIO
 support to the TSN driver
Thread-Topic: [RFC PATCH 4/8] xilinx: tsn: Add Ethernet MAC (EMAC) and MDIO
 support to the TSN driver
Thread-Index: AQHcoWOqzDdhe8lnEUOy9LAm/yTeMbWKQTOAgAFOnMA=
Date: Fri, 20 Feb 2026 13:08:35 +0000
Message-ID: <SN7PR12MB8147BA0300639B61306EDC949368A@SN7PR12MB8147.namprd12.prod.outlook.com>
References: <20260219054911.2017362-1-srinivas.neeli@amd.com>
 <20260219054911.2017362-5-srinivas.neeli@amd.com>
 <b408cad2-90de-44df-85a6-64a028216290@lunn.ch>
In-Reply-To: <b408cad2-90de-44df-85a6-64a028216290@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-02-20T13:03:23.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8147:EE_|SN7PR12MB7369:EE_
x-ms-office365-filtering-correlation-id: 5ad26114-4890-4c4c-d7f3-08de7081280f
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?rPy2zvDkBLW+eP0IfAiHxFrjkw9r10asjdkiMJKUTBCkPwwb8cnqN57q6ZQP?=
 =?us-ascii?Q?fEC2yc5ZrC7ITUIWJ6B7ZsmVm0yQeJnYZeZk/ZMQZG3z9HIqhxzk2XqbwP4Z?=
 =?us-ascii?Q?cTI7jXVHgpc8jPRzXD6GyK5lbjwoSo4/c1ggxh2ywiC8pMePJvEIweN5M+p+?=
 =?us-ascii?Q?6/F7/CLS1mR+Mca235++/zuHVdW7JbAi35nzUj2weuC1rshg4BMmuJUwtPuu?=
 =?us-ascii?Q?ZBh/HHiHuzHQdc8uQh2T8N8o8by0KiIM/2PiR68aVK2J5d80R0IAiL2H1uby?=
 =?us-ascii?Q?dmjNcpSrGu4SO/xQoQf8XxScPqnAKHHLzr6f+rmAIpPi5mhymkE4nq63nMf/?=
 =?us-ascii?Q?VNNC/GmvVp7OxwO0u8ly0L5JZku3eqYhuulmfskHeYCW+hggyPjGe0TAJCDy?=
 =?us-ascii?Q?jH/G9Wz0PV6z7fy+7dfZYxjL04H+yEkC/Pbp2v8DlStkQttcwoSQL4guLi4P?=
 =?us-ascii?Q?X/wyiAfAiZCvhx29qPXJXJ0saku4IeOH7/tIuun+cVSHZvUAnK+VVZgZFTlq?=
 =?us-ascii?Q?45c5SVYCjkJWo7SomQDebiwK/iUaBEb463DBOPkMKb/C/qyWd/rfnUO5FhEY?=
 =?us-ascii?Q?hYyB+K/S6LW5ujhgWA3pFjCYKE6pUQ/SO0DRn22IKo00MzAjCYJnwlcJJb6s?=
 =?us-ascii?Q?1c/mU3Qmken3OZ+RZ1Xh9B835W42ZVh+ZPMWU6D9f+C+57Io4bKER81/kjZH?=
 =?us-ascii?Q?15BHIYWbAgpKbjUvU7qMv4Y8PSCeAL6PPyxV2+SQjloal40hdsTasGYdIUaD?=
 =?us-ascii?Q?gszJl+3jDD2LdFBTQf3BbAG3ncXaKmQ9lY5dqaj99brBIYl8YjAFnGKHHRjb?=
 =?us-ascii?Q?rYB7aoglog9QLxNbe3cXK4rt6TH6iQNMqZA4QTv2gYo+Pnrj/6QSQYCvEc7i?=
 =?us-ascii?Q?Go/nv17z8BVCKhc7RajG2FqDaRpKNcSAWKoQrRTeg99RA4LfDzl2GO5zsJVX?=
 =?us-ascii?Q?lH8PB9wPI8S9tcLO96KVzd2vMUaiXRhqghG8j8CEEYnIzoUPIccD94Rd2mTm?=
 =?us-ascii?Q?+kBYyAbXhQQ9gc7eqEo1m9o7clLu8NbKd5b0qGMpAtE3EFbs/N5sh0oHWAhg?=
 =?us-ascii?Q?3IQUW0+mqxNGY+cwqv1/CRBmGRu0J40fOY0mRTvBZmQK9D5L8OuXA0+9G+uT?=
 =?us-ascii?Q?8lb6fMTugBaj+2RIl/73TtAcJ+acnXIs1CWWnC9QfNCnLQBGyGgYTPnz642r?=
 =?us-ascii?Q?CcPcb6ceunVvBnZq9ZMn3wSkaUVizobCpmdAjgbaM5sITCpgdFSr7J5m/gw0?=
 =?us-ascii?Q?DWm8YWu5/qb4dz0atWUkk4THtca50Wnl8mDqFOGHzdvNaa2hExkO5DVJa8Sd?=
 =?us-ascii?Q?uS9K+r971WTjFwfVEC20udZBY0jAvITTKcfxgc+xnTKPXjVSnMp16s4+Y+ls?=
 =?us-ascii?Q?4pE3tr3ZFcmmZmSLh9GzKhI4Wxs16sP5/+CjrBkL2jCIyt4oT+SaQvo5sIfg?=
 =?us-ascii?Q?0o91J5GW4W/NpsmSuF1b9IBdCqWV3u2yayGXFRGng0H8NsKBNpY6ETdQLD/H?=
 =?us-ascii?Q?swJb8xnWSMSrNbAgpGXRBzNl3pV4Vn8fdZXJKgsiAfgRPDTvArfgYuwC+9Z4?=
 =?us-ascii?Q?q6EC/jla+8n1RlMijtMzXfjoHqNRLoNbGHMIIL3rRf5nyo5IuZGZ/JrXIRo0?=
 =?us-ascii?Q?uaESUCRIJGuXJxUxsDmK+ks=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L0ewJOULSIQpUS8Ju8rrs6n7ivwdm+GpHhmEWN7S0lynRHqCUXgmAQIpzBSj?=
 =?us-ascii?Q?y7E4Nu9m2XJ993B4/xSe+i5OlzN9QvrFIefC6ircVl4F5XiRa/gXpBOyzBYo?=
 =?us-ascii?Q?KeBlt36j9MGRodolly3BBaRTBrUr4+cpV6gVv9WZbpDhE1PEbqgVpiudxtUK?=
 =?us-ascii?Q?i0Zuq0w/M/QGI3D2xeF2+1QcxK4sVebIKEc2cgFleC/+cSxCfkGniOJE4FR0?=
 =?us-ascii?Q?bTkZvzrgjmChc1WA04QzMfvR4ox92aIpUjPN/1JYPpOwzjDHVm0uNiGj4zHe?=
 =?us-ascii?Q?Q/MdBD3oDAlej6O7u6vL9yCMbxlsiEMJbOJd8w25KxBpCtv3YtKRfmt9hiCW?=
 =?us-ascii?Q?ap97FfiK3GnObhDjnK2dDJW2ONlYBR+XrhyKw0ERGQEmkS8TuoTf6B6R1V11?=
 =?us-ascii?Q?SUVJZuQO2x63M1cmWXh5VA3Gwtnd7dCUtjfQxoRi6txVSk2Jq3cTqLGZry6Q?=
 =?us-ascii?Q?kaxG3mhWlMy5msipg669xviVqpXkJPGwzjsoTcaFJp2sYr2NLkegOte+wNE3?=
 =?us-ascii?Q?/0Yn9zyj4f4TpI/ldCGpZGWJIQMpGgYrOsYKEensQ0eSGizENLouPFCQmyG0?=
 =?us-ascii?Q?Iz2/t+nw5n170IsPeBuvYE9qm3GZDJ2o1evYNHZGoFhM7v6AEXiAKKQ0Rlsr?=
 =?us-ascii?Q?omEmPa9tzp5u6iswgmA6gKf1YEYYlXSBAFSjXD1keX1ln6GzgrlePs9p4Ln6?=
 =?us-ascii?Q?5MVL9+hWGHGJ+K5ZOzFY/2+RsCRgF3p0qMLCMIdZlUboXO1Lu/OQ485zuaR4?=
 =?us-ascii?Q?vir/dk3ckPgP9x1NeKURbTif0swdCF5ycphCx7nYT90jhbV4itIRux3m93rR?=
 =?us-ascii?Q?0uslg80LcsyD0ZQOTpQOjunDCfHufM/+/f034Glmxrax7LxsnN1Q9WYhTGsy?=
 =?us-ascii?Q?zekt2VhFOz/SqpletFAfhbnsXt7UvRZq3feuMbTiVDlGKM6L5VtVqwE72HaG?=
 =?us-ascii?Q?m4ne7d1juYVnEq4ROlPFosdxonpySgkyDGdgvrmr1RSalLJ2/V+SeUhNOMyU?=
 =?us-ascii?Q?6+Fk9vkTp3AMfWodaEetwH5ZXzO2e6x++lg5j688KI4Q7XeJ9pp3MMqVrM7Z?=
 =?us-ascii?Q?b0W4/8ZbDb7gAiYyS32blSmHU4hOGOTPAN9AeHG1nsfmPBbqqDOuDn6VdFyT?=
 =?us-ascii?Q?ikgt2mLoThpzCc2xIRfAoSzly4uBVQ71/uzfpIQg4g9xsGg5AVgESV9LWp40?=
 =?us-ascii?Q?FvGNdDpYU7y0r6mlzdZluzQxvB1sh1TN8tsHk4cX8YtyecivnI5B2YrA/uFd?=
 =?us-ascii?Q?AfykzzpRrV3W5u+2yv8ORc4Whgd54SiBXVYYHd/7/v6oQWQ5C/ZnKk+B7wLz?=
 =?us-ascii?Q?cYjH6+5gey7eBeyu9G/2WqnttSiq1g0aDfdB8f6RWJDQOAZ/Z3IbgQA92hKR?=
 =?us-ascii?Q?MVUn6FfTWcrcQnshz7QxsQHhfNtavCA4WYb83Df+ob4SQ+ELHMk/2PDaCjNq?=
 =?us-ascii?Q?TY0v5EpML4g4VK9vqxHzaZmESBN4CV8MgRJNmEI5nIIEtNQ6KFyOklNZM1x2?=
 =?us-ascii?Q?Zq4rANdO+Jywj2mI4YVzXGYs0bdafV8B6S3CzS3mmTAqT3jNnVHsKfD4k4ne?=
 =?us-ascii?Q?ngIYdhti22nbFm79l902dTz95O64i/dpDuilWRTlE8AB1AhBrXSuyL7gUeSB?=
 =?us-ascii?Q?J2WWRWzow0nibpNX890tIIZ3u0v8n2eyAmOV49c/sCyA5c53VF/NVedlZM9c?=
 =?us-ascii?Q?c3ATn48X9ARDVwApH+VRPy5RWkBAk2gtm2I3OtpvPBkGhYcM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad26114-4890-4c4c-d7f3-08de7081280f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 13:08:35.7906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wp1gYAqXCDSRwQO48gn6et/IyNAjxOieWyVJwBNLbZq2b0GoxZuw0SMsRnv6DZbM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_050843_686223_2E56F61E 
X-CRM114-Status: GOOD (  21.81  )
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

Hi,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Thursday, February 19, 2026 10:36 PM
> To: Neeli, Srinivas <srinivas.neeli@amd.com>
> Cc: andrew+netdev@lunn.ch; davem@davemloft.net;
> edumazet@google.com; kuba@kernel.org; pabeni@redhat.com; Simek,
> Michal <michal.simek@amd.com>; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; richardcochran@gmail.com; netdev@vger.kernel.org;
> linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; git (AMD-Xilinx) <git@amd.com>
> Subject: Re: [RFC PATCH 4/8] xilinx: tsn: Add Ethernet MAC (EMAC) and MDI=
O
> support to the TSN driver
>
> > +static int tsn_mdio_read(struct mii_bus *bus, int phy_id, int reg) {
> > +   u32 rc;
> > +   int ret;
> > +   struct tsn_emac *emac =3D bus->priv;
> > +   struct tsn_priv *common =3D emac->common;
> > +
> > +   scoped_guard(mutex, &common->mdio_lock) {
>
> What is this mutex protecting?
>

The mutex serializes access to the MDIO controller register block. The MDIO=
 core already serializes bus accesses via bus->mdio_lock,
so the additional driver level mutex is redundant.
I will remove the extra mutex from the driver and rely on the MDIO core loc=
king instead.

> > +           tsn_mdio_mdc_enable(emac);
>
> It is unusual to stop MDC. I suspect some PHYs will not like this.
> What is your reason for doing this.
>
The intention is to reduce power consumption by gating  the clock when it i=
s not required.

> > +/**
> > + * tsn_mdio_setup - Setup MDIO bus for TSN EMAC
> > + * @emac: Pointer to TSN EMAC structure
> > + * @mac_np: Device tree node for MAC
> > + *
> > + * This function initializes the MDIO bus for the TSN EMAC interface.
> > + * It allocates an MII bus structure, configures MDIO timing, finds
> > + * the MDIO device tree node, and registers the MDIO bus with the kern=
el.
> > + *
> > + * Return: 0 on success, negative error code on failure  */ int
> > +tsn_mdio_setup(struct tsn_emac *emac, struct device_node *mac_np) {
> > +   struct tsn_priv *common =3D emac->common;
> > +   struct device_node *mdio_node;
> > +   struct mii_bus *bus;
> > +   int ret;
> > +
> > +   bus =3D mdiobus_alloc();
> > +   if (!bus)
> > +           return -ENOMEM;
> > +
> > +   snprintf(bus->id, MII_BUS_ID_SIZE, "tsn-mac-%.8llx",
> > +            (unsigned long long)emac->regs_start);
> > +
> > +   bus->priv =3D emac;
> > +   bus->name =3D "Xilinx TSN Ethernet MDIO";
> > +   bus->read =3D tsn_mdio_read;
> > +   bus->write =3D tsn_mdio_write;
> > +   bus->parent =3D common->dev;
> > +   emac->mii_bus =3D bus;
> > +
> > +   mdio_node =3D of_get_child_by_name(mac_np, "mdio");
> > +   if (!mdio_node) {
> > +           dev_err(common->dev, "MAC%d: missing 'mdio' child
> node\n",
> > +                   emac->emac_num);
> > +           ret =3D -ENODEV;
> > +           goto unregister;
> > +   }
>
> I forget, does the binding have a required: for the MDIO node?
>

MDIO node is not mandatory in binding. I will update the driver to treat th=
e mdio chaild node as optional.

> > +   ret =3D tsn_mdio_enable(emac);
> > +   if (ret < 0)
> > +           goto unregister;
> > +   ret =3D of_mdiobus_register(bus, mdio_node);
>
> Having a node in DT is generally optional. You can pass NULL to
> of_mdiobus_register() and it will do the right thing.
>
>       Andrew
Yes, agreed. I will update the implementation to pass NULL to of_mdiobus_re=
gister() when the MDIO DT node is absent, instead of failing probe.

Thanks
Neeli Srinivas

