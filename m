Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716C3CD98FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/IhicxQAFcjKbw4pBdVmM9seqtL+ttQeiIvnnV/eek=; b=LYWrpYC7PfVWiMZk0anhyzELwO
	iay6jxtynx6WyAl19Mt3GXxEFZhcSCl4eUY0LDzExVsEVokVe7sTd6VxCzjcHEb5BnFzuOxWPMp53
	WksLzhOtHOQRmEYhYblp3frgZtRnDGP2fY1BZ2zBYEV9+hCUy8S3pReoYLyX0pWnnhhE2Lv6KyxZ7
	4ob0clAf6i3wh5PBEvW8eeG0m0aNU+0QGRrDZH8J8nyZFW5Pi79nU9imW1IRYCmWEfCXaGGj2wct9
	qbkyBU7NLYnxt3OcHj/0Sf2rmiPB7HFmofHQnJ4tjAGPOTXZlhMTBlB0gj5YPnRlm1hWP9ZFc5rM5
	Bu7B3NdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgOT-0000000BF2X-1yaL;
	Thu, 13 Nov 2025 23:06:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgOJ-0000000BEzj-1l6F
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Nov 2025 23:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=W/IhicxQAFcjKbw4pBdVmM9seqtL+ttQeiIvnnV/eek=; b=W9QxmhB5hRkjGwDCalmPXixOI5
	zoQdNRBhiQmVmf8sG181LtR1OrVOa2QtDqwbv5ti6riSEIlZujQq09zoADDaCJdO6BvkHXc2Tyz0l
	VK3uh1UupFWr6uienoxq61KBq+0T8fyH52+bccLpGUECHPlBUuTYRUCqiMf3NvahL3wvj5oq5XLJS
	Cbk/VJf3s5HHPkzLFMybCq8Ew8UZGaPt9lg9KjDLRPG5n21W1MjWyYzywg7Jm6szZ5WHTXWsCKPcG
	HqZNDPV/Irv8P0xfpjOdl2HIjSsJF/7bVrg5NaMnGAh5CFpJQWgOs+HBlKz6GMpvwo4UoOSsfFXZP
	ZaonAkIQ==;
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJfWH-00000001IzF-3yUf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 22:10:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SK3JL+fpapsbhJ/agxSXGpi4gDZpg9i38LU3+uHNp1BtOxqJtHmlj6K30JJgxsJ7XLsPKBJPnXPa9oDcheaTAvkyV5G23LdrQoi4jXxeHH55JSKqaVxO7n7pi12e4L1Hb4yoTHoOW1ugt2xUnx3Zxfq7GODo1KTZFZqaA1oOmnQPM4q7WN9F99LkcXIl4/NZKwV53+X/Y3goig79/YVms1VRYlBPcfxNzicb+z3fUfW7uM7ZDuwwXTb/phjBZlIqCROU1nHhhHLhMy9g3ajg+lF7+sjYnVJZgVmBAtmyntrJwj5Hcob5SY++vtskhkoS9ViAnmrU+jM2+TQ+kOjeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/IhicxQAFcjKbw4pBdVmM9seqtL+ttQeiIvnnV/eek=;
 b=huFAuO6ENjb3WLV+lfGdkUrxSnTmCVFUCFvjQmM2G0ZsNf7wHIA/5BAIzx2l/YTgCwBltN++ZC0oA4hJC427fzlhEBrxG25btqu7iN0LyknKDwKRfzMieO459Z4/+cUI48jB0Mw+rFf0LaHC2H2YWPOubwC+hdX+URHk7Cabgc9ki7BK5bCelWaKHiiemaMpEb6CTt7evPbZD8YDJutBOMqAa0nmD46tobtx4pmvTOjlpIPTqIUEVjniBMZGpD1Nj6bRrFZisu8Pass7MddUG9VyIwO94NaP2litVD1DvP4ZCXj8JAFvA5Zp1rq//+aCJYZT0UVwwuqHnVXdR0slQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/IhicxQAFcjKbw4pBdVmM9seqtL+ttQeiIvnnV/eek=;
 b=ix7QUKe3f6xQZ7XG3sRb16zuABOnkTM4M3hQtPQE9khV+b6lnNlSG5e9bzFoI/53oeENZ0NSiUaUSIKA58GTs4/Ku/OBRLZ19aGnFpGQ2ythncCfEF1AWdrS2Rj8d4PvcNWXwgq8pHaKOCWyUI9J6PTrafqRItfVIkYawCM/zOA=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by CH3PR12MB8583.namprd12.prod.outlook.com (2603:10b6:610:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 23:05:34 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076%5]) with mapi id 15.20.9298.010; Thu, 13 Nov 2025
 23:05:34 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Sean Anderson <sean.anderson@linux.dev>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mike
 Looijmans <mike.looijmans@topic.nl>, David Airlie <airlied@gmail.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Simona Vetter <simona@ffwll.ch>,
	"Simek, Michal" <michal.simek@amd.com>
Subject: RE: [PATCH 1/3] drm: zynqmp: Check property creation status
Thread-Topic: [PATCH 1/3] drm: zynqmp: Check property creation status
Thread-Index: AQHcVN1dvvdzxTZ3Z0O/ShaViFTDK7TxOeNQ
Date: Thu, 13 Nov 2025 23:05:34 +0000
Message-ID: <MW4PR12MB71657E3EF2B400C4A583E500E6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
 <20251113203715.2768107-2-sean.anderson@linux.dev>
In-Reply-To: <20251113203715.2768107-2-sean.anderson@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-11-13T23:04:05.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|CH3PR12MB8583:EE_
x-ms-office365-filtering-correlation-id: a4c63178-5e11-4ad1-e25d-08de230926de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?qeprQ00NdWu2PpVFYMwuknShDhomwlB54J66CzddIcJ+lOste5T939f1X9gl?=
 =?us-ascii?Q?bT/EkF3W5+gs/qY1OdcjyL8b1LE6TG9LsEFw6oo0F4SDanUAzmkSh+GwGzOc?=
 =?us-ascii?Q?ddkntyaMorp6GwzEcmOz9U2LgjDBHxjKzSquzWk23owGpApdCfZ7QALOtE7j?=
 =?us-ascii?Q?2CXgVp4KhS5PID63UN2IYSTEG6YOtRu5UdvHinLnQWvbPcgBZ39t/cMzhVaT?=
 =?us-ascii?Q?e+7ypFHh1ZecqwWvWdsgiUCH13JEmodGs1N8nz5FLRSIdr2SOzeF38HK6lMl?=
 =?us-ascii?Q?9kE01n6rKiLQ3GhsVwv6QWP0KYWbMMbXrrxVxqHytyZglYlL5v9dMK7gQIS4?=
 =?us-ascii?Q?m8i0zBbdJPXt3dQKnVOTyJxafKitg95uAtCxwINczsuMGKI6+L0aDNtqMhc+?=
 =?us-ascii?Q?QdN5hdrQ/nSsVYk8bRxXd36xDUHBkOBu/FZPs0IsodATK9F11MEYcYNvNbgW?=
 =?us-ascii?Q?+ei0jfQ/a4nOoa+WjlOf+9GHIflY6aFzdIHLAFDyQFmegDoLr5Yh99ao863A?=
 =?us-ascii?Q?MPbx996skpE8BMLKh70hiX+D0t3REa4zTwN0AQw9xARDBBWLYQu82E2x2Zlb?=
 =?us-ascii?Q?rnxVWEFqDLwa1KzyeiotbJ2fLqV6afarp7z1OC2M2ZqdTRQDv08Q2XTILf1s?=
 =?us-ascii?Q?wyGDGlwoeMjT2uD69Nqc+GYXS4oEaZ+iHGISD5X0oNTWJPlmQ1Jn1clqnVQR?=
 =?us-ascii?Q?TM9gX/RMDPy/saKuMa+hl920+k4V1SbHDsYVVZPySYh0iQ9kQClDv8R4shJG?=
 =?us-ascii?Q?xptVLpybq8g9cRLvQHZGJaYCjaq/fG0XqgqT1fRJyfE8zT/W6CScWuqdU7wd?=
 =?us-ascii?Q?S4EWDb/PfvW6QtcgGVFxPmPl9Kw/BBIhnTwvZF+jEk6GN/JGZuiVRwmWjLpj?=
 =?us-ascii?Q?HNei7lcxgKdLaVOdkPmzLrh/hFAa9fNhkfuO6Gjj9ULlUdG7PVDeItlZzMWo?=
 =?us-ascii?Q?0mCXjKYiD0fN9YrwZCL48YoNtyTX/Dgd5usnTdq6SGow/+YUyZiNUEBFAdnc?=
 =?us-ascii?Q?H6PWbmgRpTKRrFAgGhytUoA3Bk10il8Sp6jNQ8c39yXJob1SNFKDQA2Pfrxe?=
 =?us-ascii?Q?/DWZHC11hiw0xkdyt5qp29cc2cEw/j1QmITgGF10cSGDpNxw9saCjy6N1UCe?=
 =?us-ascii?Q?+A/EWPQ3WRjQ682nXKtOuhVkF0xLwM6VcGEC9zc5XBOLLc0ebGwGMy0hFaZI?=
 =?us-ascii?Q?ekT3Ty7lDkViRp0ZQJNW2+jOM2GnHcOROi31Q2fkDJMGQmca9FBFBsUOb14z?=
 =?us-ascii?Q?HL35rwfzQINVH61B5q5gE3ngk/xezAiLmYODHYhfd8gvTgBeg5fUjoyqJnms?=
 =?us-ascii?Q?4zAIPgeclxf+NSkgQ0ru9Ektom4zyxpuDnqA3ofTafQ5iatPcauzuV9L2+pa?=
 =?us-ascii?Q?2zHFqf5yPsUDSpm2k90LuiBmvfMHAAYpFBTe0bt96w/3ivqsiR4M1CB4jy+v?=
 =?us-ascii?Q?5xfVyfiDnvSYXpIoCqskGJbT3C5CQczi9povv2n3LLgwqcEpOqaGuWtgoB8X?=
 =?us-ascii?Q?k67MW8vj7DwFwaLfX93OLCk9DJUg51X7BUL0?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7165.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WXjQ0PJ0vgl8Lt+KIHATndPqSQLXeQVBm00hMZG2J4yddUJqzebIazQipisy?=
 =?us-ascii?Q?OQaRf6xvQJRwertmBmxnc+sAhdnuIi0zn8RMbGkM2Osg6CZjES3t3EfnFoZ+?=
 =?us-ascii?Q?WMezQfBjoXqoyuic6yBQAAMd5IgjLFochT85QVhReae+7vEYbVdDHyhje0UP?=
 =?us-ascii?Q?5K1MrZx9z+FL/suLXK+Ta2uvcJ2GbJHiS9jAVJ72fwID4wXKxn/DpZG6qJZA?=
 =?us-ascii?Q?l3hbA/DcJy1HGogIyLyGON5JYkxM1rRpOiheCdFpHRuX8CYh4n4OhvTJN18H?=
 =?us-ascii?Q?njrjMukEPM1tHmy0VTrnWzzgMYOG4U3W00UhxPY70Um4DsC2vFxQJ8RLKpiK?=
 =?us-ascii?Q?HpZ1vvjl+J/8RuYHwXUsf4d9FlLXI5J2X0dnQHsGb9p+P/gWbUU1kRUtNSvB?=
 =?us-ascii?Q?zZfXnVZcMvOaKux0PKLCxUEzZ0nfRFQxuWeVKO3b1sJxEdtyR8hWzqKCsqcX?=
 =?us-ascii?Q?fRwx3DL6td14rmqgwvfksMOBZoGvg/hzcNxzp9Wg9HTxWCW+Uuw2E1zlEMpY?=
 =?us-ascii?Q?9gH9BuHxcQvt9Jnq5EYRKLWXW+o5UK5lUPkpWG2ddofZ2xHnDxVIzq2NaHoA?=
 =?us-ascii?Q?lkJbs+OHajZWu0Nuylq6SsCGVKHpIhO6L+Ou6gsBOlLtHiQMmWwFb4bNFF5n?=
 =?us-ascii?Q?B6UwusfLyx0y0drdvq4QDelN05KS2xk7b4ZxEs1puTDf+Al/5jjUUSlye+AU?=
 =?us-ascii?Q?vMiyEUF+wlPccZgQ9K4YekMudXxU6rqjiKI6Qhii3Fol4/GmCN0/EuSQYREO?=
 =?us-ascii?Q?K/DyjNqz6cSQDNwZ2hWuMeWMhu396PQS5XwRHib+CJn0cAuJrghBsV+ciwAX?=
 =?us-ascii?Q?qTPbsmqUaKas5MNalJ2xTOL0+Jmge42a/JEVaJtWO0S94antcS8bqtgu4pJZ?=
 =?us-ascii?Q?CkxHTqCYLHt5WEK/MT+SZIjagAK4M5ii4E1rVcFBFL3ldvVt+vi1NqsqTNpW?=
 =?us-ascii?Q?2pKqR/QA3bo3joEwHxRvpOLsrspmxnMMXftqDBIL53Dcj2O1zve13mSQSjRx?=
 =?us-ascii?Q?Fo7ZvetRpKBe7fA0gZ8kpNdoY8enuX8Oq+z167cSfz104VwYiKwZLjVVX2KN?=
 =?us-ascii?Q?zpLewywbN4S3e7wiYlk0cZ4Tewh9lEusIT1wjpa+ABJzQHd0Z6O4MGFlyW5U?=
 =?us-ascii?Q?qnNS9Qmq6mt3NFibR5YZF8kZv+2XnvXWy7SRlyuTxb4m5c6OQ2UCXw2YcjAZ?=
 =?us-ascii?Q?WFmUxuziEXOiWUen7gW51XmOl/jFcVqhnZ7ibGVNprtDw8R/1cuzb18nY0aJ?=
 =?us-ascii?Q?U8ZvGZtDwdDP4ld46lUL+FazQ6uYSp3R1a5LPjCgw+ZsPGAR8Iu9ctGB2ogB?=
 =?us-ascii?Q?lgOr6FUjXPXU3dcenX2sSRWdETJAkYLMl3xELmzpb7zCdhBFPLkVLswsrJ50?=
 =?us-ascii?Q?90NctfCJ3ygDAj/mgNgeouHmn5aVMT4+Rvz0W58ctcI1BxG48nG5TzymmpQE?=
 =?us-ascii?Q?iT5xp6X56H6GyrwOJ78Prm83vP2A2FX+JMsaXnEWFJlA+pszGqleLJn5p4om?=
 =?us-ascii?Q?gUxvSkMqKoZtt083hLtNmubenOTVFwUKEOdzsEsOCpjL79KJWQAuv06ewGkG?=
 =?us-ascii?Q?irln4aRkeSQMwK009ng=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c63178-5e11-4ad1-e25d-08de230926de
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 23:05:34.6504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pkYyvt5xpfcCtzuvDtDgTmWAv1UZgrzuGjo+1UMFUoV4NvsCySTR8mEI75UPtvh9Fzyjb/8Cjp5pdWmIH6ogrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8583
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_221034_830247_12BE4678 
X-CRM114-Status: GOOD (  19.06  )
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

Hi Sean,

> -----Original Message-----
> From: Sean Anderson <sean.anderson@linux.dev>
> Sent: Thursday, November 13, 2025 12:37 PM
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org; Mike Looijmans <mike.looijmans@topic.nl=
>;
> David Airlie <airlied@gmail.com>; Thomas Zimmermann
> <tzimmermann@suse.de>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Klymenko, Anatoliy
> <Anatoliy.Klymenko@amd.com>; Maxime Ripard <mripard@kernel.org>; linux-
> arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
> Michal <michal.simek@amd.com>; Sean Anderson
> <sean.anderson@linux.dev>
> Subject: [PATCH 1/3] drm: zynqmp: Check property creation status
>
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>
>
> Make sure to return an error in the event that we can't create our
> properties.
>
> Fixes: 650f12042b85 ("drm: xlnx: zynqmp_dpsub: Add global alpha support")
> Fixes: 8c772f0b2b8e ("drm: xlnx: zynqmp_dpsub: Expose plane ordering to
> userspace")
>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
>
>  drivers/gpu/drm/xlnx/zynqmp_kms.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index 2bee0a2275ed..c80a2d4034f3 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -174,9 +174,15 @@ static int zynqmp_dpsub_create_planes(struct
> zynqmp_dpsub *dpsub)
>
>                 drm_plane_helper_add(plane, &zynqmp_dpsub_plane_helper_fu=
ncs);
>
> -               drm_plane_create_zpos_immutable_property(plane, i);
> -               if (i =3D=3D ZYNQMP_DPSUB_LAYER_GFX)
> -                       drm_plane_create_alpha_property(plane);
> +               ret =3D drm_plane_create_zpos_immutable_property(plane, i=
);
> +               if (ret)
> +                       return ret;
> +
> +               if (i =3D=3D ZYNQMP_DPSUB_LAYER_GFX) {
> +                       ret =3D drm_plane_create_alpha_property(plane);
> +                       if (ret)
> +                               return ret;
> +               }
>         }
>
>         return 0;
> --
> 2.35.1.1320.gc452695387.dirty

Looks good to me.

Reviewed-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>

Thank you,
Anatoliy


