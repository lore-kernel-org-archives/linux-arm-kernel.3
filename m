Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47EBC55170
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 09:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUQKxXSIZT8ygegJiBymeyE0RrRiMdjf9zk2ji3lEdo=; b=0GYWeKlUuYB2IoT9gzr7SLpEox
	Ihdamw9EFinbQha105NmBwS2oaTaLBsefjIKOPtcUJ9z2JbQfD0C8efupFsAOL+VJbdwJgkOfQXaz
	TrZjb6tqTKuUvNJ3TZ2ANAyXR7lk76xpGvu401c7FKwPml1Ozh1fcYH8qSICVNBn0cyxen9ZE7y7p
	cMkxsDsR1sjp78vjLq7gi2ZTlcxP7hLO0PAJviqd4oNK/39fy9sBXAiwd5kyhXh70+hXEWS0tWUGJ
	BkFxjme9oftVYVM7/4giQkvsnylnSnNzHaMswuH7qm7Ljdl7OWi2ex1wy31fNtd2lBHdcLO5RZ22a
	lL4+2wcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMqq-0000000DWhF-3xWU;
	Fri, 20 Feb 2026 09:31:08 +0000
Received: from mail-centralusazon11010046.outbound.protection.outlook.com ([52.101.61.46] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMqo-0000000DWfD-2CkK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 09:31:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nbybcqdv/uTVMMf3XwXEuDHLLga2hXUrHjsLuH0NMkhEDBNWSShyIz+l6AFzyoJS70VsXHNHUeHIMVnUe0136Gn5QI5TcdzCr2ZRZB6G4vnq9gWfwCvhLcw3u8GMfMCb8ID4AZo90cFjFvuVYXD8miHTNtJWEFkyVoagjUR8tFCyjnLeO8mnOkeR/7YeCipJYbojaV2qwjF8BRFPfoR6XZH2k64DeP5CwR5YOWayQF83rli8obXBb81xxHDXY5G5WNSns36qWvIqLuKjoiavLwuCUv/V19lBTbayLvI+O67VwrEtt5+s9ZzBGelBuGeeX8dNAZ5Y+0XIYGg301vivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUQKxXSIZT8ygegJiBymeyE0RrRiMdjf9zk2ji3lEdo=;
 b=Fl9C/dR6h0bg8xkH5jvCTK9UVHNV1rcJdN5OrpbmMb+QiiVILvtY1FEn+msyEoNB6iU+iRGo59/Z31iMaUflg+Q9zy+MU7G8uPiOxL0FbAkl7MEebiHhG1TnhGwvA+L7iTxx142m7THrNGE/jsVlRvaH5rdwCH1AWNOEqc+xraIlcSKZB0QZCXdFZLUHofCJzczoiKpSpFMDBCAjnHl1Vmot3tT56wZOp0eEFIMXa8y9+ij5sqcgCydrEiJsvLjB0ms1SeWAfqSBCzJ9pp09/+7NYXW23ydR/StubZ/rZXfoALRgc3RbbKFrIVdez/4Ou+0kkjaGoOVMkK93W7n9sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUQKxXSIZT8ygegJiBymeyE0RrRiMdjf9zk2ji3lEdo=;
 b=0CSbowkoqpE5At/lIMWt39n2VXA5nmAlDT4cofEk8FzHG3YHyekZxGIzeG6cOH9UAtrVTnGuKJGmf/oy7GFQ8VeLM8+C5NFzZLrG0P3uZ5S6RSUaeeiodn6WkYdNGgL7Q0OWSPLEBLTomUIFI+h4jkdV+HbBoMwH/ADDkymf+Yo=
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by CY3PR12MB9632.namprd12.prod.outlook.com (2603:10b6:930:100::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 09:30:58 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%4]) with mapi id 15.20.9632.017; Fri, 20 Feb 2026
 09:30:58 +0000
From: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
To: Rahul Navale <rahulnavale04@gmail.com>, Folker Schwesinger
	<dev@folker-schwesinger.de>
CC: Rahul Navale <rahul.navale@ifm.com>, "dmaengine@vger.kernel.org"
	<dmaengine@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>, "Simek, Michal"
	<michal.simek@amd.com>, "Gupta, Suraj" <Suraj.Gupta2@amd.com>,
	"thomas.gessler@brueckmann-gmbh.de" <thomas.gessler@brueckmann-gmbh.de>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>
Subject: RE: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
Thread-Topic: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
Thread-Index: AQHcoD9f2cfSxQbzEUSBYfw+paFnGrWLUguAgAADeKA=
Date: Fri, 20 Feb 2026 09:30:58 +0000
Message-ID: <CY1PR12MB9697A08FE2856D455B84E85DB768A@CY1PR12MB9697.namprd12.prod.outlook.com>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260220091417.5865-1-rahulnavale04@gmail.com>
In-Reply-To: <20260220091417.5865-1-rahulnavale04@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-02-20T09:29:15.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY1PR12MB9697:EE_|CY3PR12MB9632:EE_
x-ms-office365-filtering-correlation-id: 2d90c55b-4301-4a1a-2d9c-08de7062c15f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?/cgiGOM1hJ22Dx8FozxQMz6BsgiJO671OshzueAbjeqL8bM5b5C49kHP3VQJ?=
 =?us-ascii?Q?wKcoRdLUiqB0Mo30IYtBI2pVjMx6m5B88SeUqgdbVNJQE/FWGfPg4/iU/sCP?=
 =?us-ascii?Q?SyBXPXmWBgStk/jtFpoSbzRmYXmk4MKzDIOr7uZ6LhSNkUWb7rTQeF1U3WIJ?=
 =?us-ascii?Q?ZWlrOHfM0A13YgZgn10hGaXb829nZmCwpcqYy6e+cwpd9PDI7tic7lWwkomK?=
 =?us-ascii?Q?4r2j1jlU3YU4aOLWP74pYfb5zKz8wTHOhj3PeA9SFIs2Vx9prrgyKLNidurI?=
 =?us-ascii?Q?F9fuo7xoW/C/OXBs3meGnLiJcqAvyyRbyDUr5egKXEKUk0pb1gEpiSnpysSc?=
 =?us-ascii?Q?7pneGqNu+whauqBBA6HsdWV57EZWxPm5lgCYz2b6+8Z96z96h6krQbPw5WCu?=
 =?us-ascii?Q?7pRiNT6TvsLRYAq49yNb3qNwA+AnnnT0eJ2zz/y+cVJ2v+3UtoLmYVHYuIQD?=
 =?us-ascii?Q?VX6YDW9zNKwnjbttO9U2udNdArIF36+X4OvrTbZqr/kGywFk1mE3N665geJ/?=
 =?us-ascii?Q?YpKqCxjsANAyyR3r/80/V4VEbSZfPHscE9lV9V1MDbjAg5JnaKuWNyCwsYEA?=
 =?us-ascii?Q?xy2s6hTHzasu6K/kfWwxkEWLPcQG6HKbgrWpwZRbS740+PlUtYZGwks3Xrrt?=
 =?us-ascii?Q?+OLfhPJApgZFLZ2tABs+QG9OPbm3TffZ7N8MhZvAfcFVBh49VuY4QYPZ7wxE?=
 =?us-ascii?Q?4f1gs++D9tnOkwVhyBGtLkdY0cKGYQXh8kIszqZ3ALo1RJcw8dPNiWUPm4Mk?=
 =?us-ascii?Q?6YKLnyvTReNqzZFKxwMc0NDMZ8kvkVT+LoreqpMuevGfmHK6FD4IbNXZ+bUA?=
 =?us-ascii?Q?kFWztSYXrmaIaPMvu3XpGRJWAVLq9/vhdh/XRBVqOjMrP56TyQ6JGLK1zNHX?=
 =?us-ascii?Q?c5jFxW+yIaKgadH7xJuS7gizz24kUVneNJ7TsHylQq4aTnMsQoQNi9vy1U9G?=
 =?us-ascii?Q?t4R1KtIBeesHm8tcnfJibyh6SgkfWEVWw8SpCKZn9iwmRX7bkw7YkeZQkKca?=
 =?us-ascii?Q?X6hl6JFErOuHPmRUSCbjvfFF/oVuEQk+S7HBAXQdMVKqz47LvkMG734gx/y4?=
 =?us-ascii?Q?123S5NiVyhMpsW59yaFkTtSQhjk2df/isyQtWWHlY5ftVGovcThRA4c9EqYw?=
 =?us-ascii?Q?FqcFwVaV46dVbqIceKYQiqG7J15H8VWbCenUAelBxDXkzBkJMODM+OjaJzub?=
 =?us-ascii?Q?mBTc3neNTtMf7YcO3G3YdRezSz0pxettIPEEqnKjXgMTeSKchDzUCYYCXED2?=
 =?us-ascii?Q?04xVdGO6eumEoM95jBokehcP97puoVsTtT7HKUm7tKdiQXK492j+pc0zDt30?=
 =?us-ascii?Q?GrOFip2gb2IVUUUUzFJN57qz7pevXwuSnJ+h1nmsxdcOtIj7Z4tgmv4G+48L?=
 =?us-ascii?Q?tIqmjQN42iwraP0fNTW8cRo5I/KyHzGwYmm9V2xMXybonc0/cqU1WkOQngJx?=
 =?us-ascii?Q?rxhazCA1K3nmCVabZg60OuXIzOtmrf53dvVmTlpEhBl4g9OFPdwfHWNUlH4j?=
 =?us-ascii?Q?I4H+JZ28QxgaaVEhIvlMkhuFyy4Tm4DfskX39dGJUzx7AtE1b9tAvOE7AIjY?=
 =?us-ascii?Q?ImTnren7+WyFmz8EkDkcNMuLLgwJt/9zpluXbTeI64fXKd2z9h6esQbScBT0?=
 =?us-ascii?Q?bIyiuJjtfaTzW1w/wbhKN0M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mwcbxe8jB64+XiCbzWatKzYEjIDLY/kFQ7pBHgfqQdTMRgcge7Ue0fGQpLgD?=
 =?us-ascii?Q?jD7OzBX9dG/DuW0r/fLlStc0PK43AaoY62crdeUVGjfbvO1xrq7qlMWO0FZJ?=
 =?us-ascii?Q?AzO0EpaXJb08+QSflvTM45lYtMQRLC77ETfQoBGU1hP6hDiEywJVa0eHOjVh?=
 =?us-ascii?Q?HlEFA+Hqc+OO/SmUBSvys+3GP6+RKb1vyBwR/rMN4za/t+lNo85Ruc2hCvuK?=
 =?us-ascii?Q?2z/CFgxKDuY9QJWfVbvXCDUvPyrRt8ikjfw4tJuv9jbyP+AyAWvWcDXsh6Lh?=
 =?us-ascii?Q?8bYyqSXL18rqSgdbMjnwrSgztt2r1XtF80Vatj1F/qp3c/CdJ5JRVxdHOrKg?=
 =?us-ascii?Q?pLXXvAHNb7zI0sx07fnLRmn+n+f1MXFsC5Md5sTOA2xhwtys3lPvHBkbsbWd?=
 =?us-ascii?Q?n3SQzuo4e72YPHEnNkGTIrRna9k7+N69BES8ciVdGjKdOpTlOSx95xUPFP+6?=
 =?us-ascii?Q?xU7ONNmSDi+WnP8JPEq23KDYB7xemeQggqKcHPbHW7OO4auDlrs/T3xYfS3Y?=
 =?us-ascii?Q?uS0al+6I4tmx5Ixr63ztah1qsjPJz1O8K8bqTL1sSc84DlHajhb5z2hZkrRf?=
 =?us-ascii?Q?A/r/AayiZrkekjlxR6stG43AL3UBG7kRYJExsDvJjYI7PDnGYMFVJQ2mAuf1?=
 =?us-ascii?Q?U0jduf7mclqD4Xr6qtRVZK37PAaErP1w22L+SihIcCDh/zfCELXIrE9NLRRH?=
 =?us-ascii?Q?SVyY983E+34sp4Ii7GH9PEp6ado3xTzVJy5pIJ0o/ssyaI5gjwkIigQLQYyN?=
 =?us-ascii?Q?3yvwXfqDlKvOLpQHJCZYk9GcP2Kd+HmiHUkVBHBmtYrJoEvEUvB6Nnn8aX7K?=
 =?us-ascii?Q?m0xZ7sDCguAnZEldhGjevP5zlkrbZSkejzEtziv1JH2V0XORGBW8ziIGuvpM?=
 =?us-ascii?Q?K9FBpbwYslAxhGy3+tDf/RfFmOl7YhYRLGHnxDmb+NcISXWxrFpYiUqzAQOv?=
 =?us-ascii?Q?0Fg6+49g9/euADt3VHeUFjCdj1mGsTbI48E85Qw7JpMjjfiMyI4yNq+SDsSp?=
 =?us-ascii?Q?CZN5IG+IcxCPY5hZQUF7dROFR51uaQEwFnjNzPCW9MHfNOAez2MxGDEyEGjS?=
 =?us-ascii?Q?tHTXjsmejSADQy56DFquGO2xw+3F8FFU5PU5OlD5kR4/kyZoLhi3eF7HWhBV?=
 =?us-ascii?Q?eR01GeeL/14Qtr5VpEXjp44rhiwWCG6/58zIpwTGKRSL5pMxY90sJGB8/0tY?=
 =?us-ascii?Q?ykICJOw1gknEva04SIOa+nx8rSwf+EOY2bVUnR8iYCuCdg61pZmrTF/bG7az?=
 =?us-ascii?Q?6nyuLV0uBkOltgEHeCiKAKw+4dq187ZgvXYcpWTk0L7zNI2SDbw556lNwUPg?=
 =?us-ascii?Q?dtuUlyDO6PIXhvXRZ8R5jDUsZggcAZ2Qad6cfXfKmr4cdMN9eFqLoiB/wxee?=
 =?us-ascii?Q?7lIhyGiZli26W2UBUv8WRNued1BecuRcGG0Or89aeifbWVzIkqPbAqOM2OXl?=
 =?us-ascii?Q?adCgl/VM50ERtKBdW13fYWL+pIAHqqJ8QwPn4QMROtNXLt7GjY7vuKESIQ1A?=
 =?us-ascii?Q?dHsq50e5rRX3CfJhbPHXh7jAd4ru11KtiWSDJuA4ZdftqLDWg5j2WhUwLZfI?=
 =?us-ascii?Q?pqhg0tM9tUGRx94Tg6Xzs7PD7XE8OLr1teVYFIdyTFfthR144kdWgWcgtpVt?=
 =?us-ascii?Q?p3egDgaeZ51mLFEMK6NJFHxNOBPIoePgg3mHvi/Fp1BfWPUc1wP804JFYQ6W?=
 =?us-ascii?Q?593icEeib3o4TbZPmLiNcwLnQyoVnjbPK+6Gmk+bYg+bxupt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d90c55b-4301-4a1a-2d9c-08de7062c15f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 09:30:58.5889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eEazXDol4IFncRqA9Gj4QuEcJGo1aLaTEK3jvqUqhKPv7EsfoXHhVzy58hxx7uJf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9632
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_013106_712577_BFFCA951 
X-CRM114-Status: GOOD (  16.07  )
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

[Public]

> -----Original Message-----
> From: Rahul Navale <rahulnavale04@gmail.com>
> Sent: Friday, February 20, 2026 2:44 PM
> To: Folker Schwesinger <dev@folker-schwesinger.de>
> Cc: Rahul Navale <rahul.navale@ifm.com>; dmaengine@vger.kernel.org; linux=
-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; vkoul@kernel.or=
g;
> Frank.Li@kernel.org; Simek, Michal <michal.simek@amd.com>; Gupta, Suraj
> <Suraj.Gupta2@amd.com>; thomas.gessler@brueckmann-gmbh.de; Pandey,
> Radhey Shyam <radhey.shyam.pandey@amd.com>;
> tomi.valkeinen@ideasonboard.com; rahulnavale04@gmail.com
> Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
> reporting via device_caps
>
> [You don't often get email from rahulnavale04@gmail.com. Learn why this i=
s
> important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Rahul Navale <rahul.navale@ifm.com>
>
> Hi Folker,
>
> > Posting this as RFC because I can't verify this actually fixes the
> > regression as I don't have a ZynqMP. So Rahul, could you test if this
> > fixes the issue and report back?
>
> I tested this patch on my ZynqMP platform.
>

Can you help reproduce the issue at our end. How does your setup
looks like? Is it dependent on PL design ? Unless there is some
dependency I can try and triage it.


> Unfortunately, the issue still persists. Cyclic playback fails after the =
first buffer period.
>
> Regards,
> Rahul Navale

