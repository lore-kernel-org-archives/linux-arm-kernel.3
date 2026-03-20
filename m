Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1511099B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 18:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUcYjS85/LvSSA+FAT96AIyI1rVlyG82B15pU2KK+oo=; b=K1Ys4PJTvult9/IRQLbf6Hu8hy
	qOx3p8LI3jn65NFpiQ7ESwUeYvOVOzERdMVx7sPmlhuyeDbQuN8LBavrMl4XsAGK/0f7ah1rSI9tM
	q7Uu+QgxsNQ9sHj+HaXri89AbzPFC6deoVfmMFgY037xROKKQFQPz7ThIZZFwD5LYC5RI1Oo8K8p8
	34TUn/tL4fK+MHfwHpWaQBIoIMXtCy4+F+PpKQrWmv+DsnCxheFW9AwkdaiVij9vO7S+YGRyLOgAy
	WBOJAUfim46sfbcVZTIJuuQJ/5teHgWJZJ2jIA7zNR2M/ZamvjLdnpuuSmsm8jFoFgVzdwLhkS6CK
	q/BC+V7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eOV-0000000DMXy-1v1y;
	Fri, 20 Mar 2026 18:16:23 +0000
Received: from mail-eastusazolkn190120001.outbound.protection.outlook.com ([2a01:111:f403:d100::1] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eOT-0000000DMX5-08xG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 18:16:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoBRy96edW3BF2G70j9RStlno9SUm9XgdG+eQ57bYAXOtABbsJgZLC4wuMZxvB4nHyGKe7nhHe7HZibrwSEDQXQSk6rlmf881XXkIM/vJQKSHMQ/JlrsR/Uju4FOHk9ew6gbuXP/+GTJ1Z1qo9HKcBC4SB8Uab0bRSV9FIprG09SpQJuOiktz3GQC4IAESZaqMI7/Lgs2R9U4YGHRGntUC0XlmKn6T0NCmRZYhqqHo1OLxUhGypp5fYU4qTbX2lPApMeRAwfBIO+89FLFhscCdO+XHakdF/DmnWdOEmu7CdfbLFhLOmOIqf+BooP6vCW18tOZNaYwsMUwsDppftWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUcYjS85/LvSSA+FAT96AIyI1rVlyG82B15pU2KK+oo=;
 b=xeOoQV8sgAf374ssdxU6WrVph47hwmyeIlrZcv1ZxltALhQNSuEIFvHzSy/6Sjj9lhvFE2212YFgUjxs24uKXq1dro329eAQ0fw1uTB0+GK0KgooTlWA+386oGH6t5iH5nP/D2/3u4lKYP+F4BzuGh0I1DdwwIg2lk9vCxVOG41s7lIwiChOzPgeZWzsmfPUbknvT3ubVA9n6ofnt3M68E0RbOufS2HS3RGj3O3nA2ms8tb1Ja1PyW1IwskJa4QDYxaelBCbNvccc7U9rrRw2+33el1Qc2lOA7n5tbAUNPV3bAIVcxp55YVN3BQGtmGjcK8q0x4Vx6Q47J+bBPuJew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUcYjS85/LvSSA+FAT96AIyI1rVlyG82B15pU2KK+oo=;
 b=SwWUp4GQL18czZlPTEFcM4V3q1PiER3VKrgjMZok+BFAOyvP8pRK9PCj9+qfnlOAncAkhCdzsgo9hC43Ebv+VM2eUaPlh6ua32F1K+ESUwgQLqw5s8VlLEU1s34fNV1YTUL4fy6l1KYZ39ibKIp5xZoAU4eK4pxyA9E9OW8W6CQn/UGtZAdUjnbA7qQ2OyQj+YCFQNKUxZsNCy/wIAN3G0XWc9XO58skIkXfBBblSj2+nWSbMV6c7dXOowWlLPGi8V+wpm7E5ATGILlC21CoQJN/GtmKr2Eo98rgiQHQqB6M7vAhPWMR7SxCadrA1a/C8zGkpqRijnK3jD6mmkFGHg==
Received: from EA2P220MB0946.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:25c::11)
 by MN0P220MB0816.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:382::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 18:16:16 +0000
Received: from EA2P220MB0946.NAMP220.PROD.OUTLOOK.COM
 ([fe80::f8c4:7f0c:3f7f:501b]) by EA2P220MB0946.NAMP220.PROD.OUTLOOK.COM
 ([fe80::f8c4:7f0c:3f7f:501b%4]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 18:16:15 +0000
From: Amber Espinal <Amber.leadswap@outlook.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: =?Windows-1252?Q?RE:_Business_Leaders_List_=96_National_Restaurant_Associ?=
 =?Windows-1252?Q?ation_-_NRA_Show_2026?=
Thread-Topic: =?Windows-1252?Q?Business_Leaders_List_=96_National_Restaurant_Associatio?=
 =?Windows-1252?Q?n_-_NRA_Show_2026?=
Thread-Index: Ady1cl/D1NkxueRrTYCvrOoyDknzJADIhq7Q
Importance: high
X-Priority: 1
Date: Fri, 20 Mar 2026 18:16:15 +0000
Message-ID: <EA2P220MB0946FC22E78754DCE06B6D70924CA@EA2P220MB0946.NAMP220.PROD.OUTLOOK.COM>
References: <EA2P220MB09460F1A49BFDDA9664E190E9240A@EA2P220MB0946.NAMP220.PROD.OUTLOOK.COM>
In-Reply-To: <EA2P220MB09460F1A49BFDDA9664E190E9240A@EA2P220MB0946.NAMP220.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2P220MB0946:EE_|MN0P220MB0816:EE_
x-ms-office365-filtering-correlation-id: a3fe6227-f5c9-4a49-e3e6-08de86acc644
x-microsoft-antispam: BCL:0;ARA:14566002|37011999003|31061999003|24071999003|13091999003|41001999006|19110799012|39105399006|8062599012|8060799015|461199028|20031999003|15080799012|56899033|102099032|19061999003|40105399003|440099028|3412199025;
x-microsoft-antispam-message-info: =?Windows-1252?Q?F6jq7vLtn6gVYpJuErLh4n/uYsP4LASQOlC0kse6j2+g/9RB4Bh2yCMn?=
 =?Windows-1252?Q?DIB96zITVsH92LP1wc0e1BXsjOvCxIrNHFrfiD5PeXKT9ayUEMAUTK/i?=
 =?Windows-1252?Q?KmTdIBzUJ4tqyiCXBJmL3TTn2a5DXmaibKFsbqek04JefrTrdl0WD2aw?=
 =?Windows-1252?Q?yxSr28DB72XMtI0ig4jndx40/xnbPzrEUsj6NPZe/SnZRAxwRM+DY0j6?=
 =?Windows-1252?Q?cj3PoZMv8MRF2SdyRkfmOo7bRW80QIxEWj2WKB45Y5zPi9fO1vNND59m?=
 =?Windows-1252?Q?E6WU+RpFrl80SJyLJjRFItJviM/be0fa2tuHmLt7U50s2OKVFkBAknoh?=
 =?Windows-1252?Q?ef5WiNSleju1pY4jHqnTUSaUHksm835Gs/AvLQqJuOXGwPCFZe7Ja2pK?=
 =?Windows-1252?Q?KvV5pr89uApg5l02T5cfYvpyTGDOmhq9y1uuhhfCCcaVrtCGrqHSc0I4?=
 =?Windows-1252?Q?NpYvjM6zJSNKdcr/Z8kicPDI1XR7EznJYWNSGiRTnRwNJ5Tn9vm+Ve5l?=
 =?Windows-1252?Q?ndhJYQRNO5RKhLSVnPZsxMRzGkf/4azN3iQ55ajD3HqqoshDEJ/3VNaN?=
 =?Windows-1252?Q?2zabkE2AK2FCiYd4iqwTRv6dLfvGivvtzxRyjaABRamVVyypu+nKM6d7?=
 =?Windows-1252?Q?iGyNlIF/VE4TwoUKVrHak4RoJorlj2dSdJ8FqtG3Xb8IZxZUDg5tXChx?=
 =?Windows-1252?Q?XF4qPcYQcENUyfzoQ4l4RrB62fLyu09RnvIJAuimxNtU5cyYnTJ/pz1U?=
 =?Windows-1252?Q?2HyoJ2Ts/r4bTBcEbaPRycv4FS/ETGI/1jBV2nox3LcgjE/yTKCEa+Yn?=
 =?Windows-1252?Q?hod40kL+hKoWOyCteqJYnYJeS+Q0R9IV4NTWp/TPEEd0mcOvIX69KUcP?=
 =?Windows-1252?Q?dugQLtil96cjneqJSwM1/APOmJsk5I+/+mXp9Y/CydYPCkrh/KlusbsY?=
 =?Windows-1252?Q?M9wSWpffuyPgohoCDbid/qHq2b+wMFuvjVL1Myl9rbHcNNdt0xYRIhJO?=
 =?Windows-1252?Q?2yEEpwBULkK7c6nUWS+8/MW7dM7HpYisHco+5fgiwYJ7WwDl6N1LaPys?=
 =?Windows-1252?Q?RyWOcYh++KWqqpt5H5KfCbEiM2omNd2VJidAN9xFy0ONWeSAcxMZPC2o?=
 =?Windows-1252?Q?/LaXPgr1bP5x+bKTAvJ1l72W5DK17vwekG4wqqAouT9KeHWXQKKrPmLv?=
 =?Windows-1252?Q?Ghi4bP+WX7o=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?E29Y4aRuWWXvhW6sHiq6+MfyHkAe5pXoicscS0f3AIFLl/lcLyT26j6T?=
 =?Windows-1252?Q?rKhxmh8RpkiyO7gaC4h9GDLcKp6BUl3bKRyp8bu5sV0I/tedzLs9Tuud?=
 =?Windows-1252?Q?2Lir5rGm/B9EJ6H6Zi6WAA8uCsINgym534G2hJagbEhQsPPJHMtHpR5Z?=
 =?Windows-1252?Q?BXlBlsDPqv0mFAgAHkuvJae8ejXrmoWa5b++aE2DqhGDhk8ojhrX8Xnx?=
 =?Windows-1252?Q?kcci/U5ZKZHcJ9WucsQ6DQeeuZnF9NnRbgndZ5x3Ykj0IsOE4E0fF2F2?=
 =?Windows-1252?Q?gKT14oU7anx7+Qwuqt785UeNBaKupufySgKOf5tTv/4SVaogBUJ1dL04?=
 =?Windows-1252?Q?u4MKC8ay1LnTxG4eXCyT/+IJcYfE9t0PLs/pQst3z5jibPir7x/2tz5H?=
 =?Windows-1252?Q?dHebt1sT+cw5rPXA/M4AHm0DLY/C934cd1G34vEzTkzt3lsN/bHZ20zp?=
 =?Windows-1252?Q?sfM34kQfkkYpJbveFfh930UTLh9faFEy6bO28Sts71ryK3cbQ01MRinZ?=
 =?Windows-1252?Q?KOpIy9V6PLA5k9j9e2fOiR7gu9qYt/cIzmZ38SriDNY7Bv9wNaN0WpNp?=
 =?Windows-1252?Q?/mt/IlRA1/SxBe/fBRJ1KBbHk2NudHuIaiq8Q+ymsbiRzkrf6MaWBLMb?=
 =?Windows-1252?Q?8pBFuEm4KyLsmX7gU5pmJM3Oe8yjH10ackJauyRzl6+2vt3ghilUS0b/?=
 =?Windows-1252?Q?4LBZ9ATmISZ9XZba7iaZ4GuDb5VJz5UN4S1AGmWmopf6dU9b0nQq3iJk?=
 =?Windows-1252?Q?aCoN1eCIf5MCWjVs7An8ssZfC+aKqZNPW5CepFRTqmQnANNIZIEergSH?=
 =?Windows-1252?Q?vc7Ww/4U48AiP9AzY7M9HiJXw/alSc8ggia4Qd1sbCTh+TsC+zXul/N7?=
 =?Windows-1252?Q?DGgbmyi/nrP7uuveNOMe0gx8zLNJBZbemvMjmsRva/Ol5ZJRtvMVKXxZ?=
 =?Windows-1252?Q?KNrjU1KiWyoALYZCOczKTkQwDVunpnOl1m4Y/YrTv+iML8wrpbhAMCOR?=
 =?Windows-1252?Q?bDVuYjMR+zUKkjefq/cNsYIiKBKfqVq7v+AxvsqIn5vSelRqNX4SdVRX?=
 =?Windows-1252?Q?4VmPb3oRouy7XmeQxM8BYQUS5IiQKXFyDj9dykw+rlbFIWOil+M+xV3N?=
 =?Windows-1252?Q?EmGC7X3ZS8S+z1WD3OUQ2HtqnEAfHjg3wcAAQNghmynhx8hTZE10o3BB?=
 =?Windows-1252?Q?MCaedyIrMpu+GePFMacPASCqOmdIy0xD5VdmOWXzQJ8dZa4E4UMylssL?=
 =?Windows-1252?Q?aU2uP7Vo0buUgFCirtKVqDLHnUN2LOg4iKoNO0zZZwRxnhlzTJ5w1l2f?=
 =?Windows-1252?Q?nkVpNyI05WqcLpdw/faJ4KnDdk02IfyDJizlpINPvGtkKG9eJp0WNdOf?=
 =?Windows-1252?Q?9KyL5RXi5BAnUMpoq1DIOOKadiO1Cp4j8CAK7XFiVJyagJRm4+YPMHzC?=
 =?Windows-1252?Q?RULq0DP1ISKR4yXgLmP0MFEC3CZV55ygmA2Irpxs3Wy15N8ry7+nebN3?=
 =?Windows-1252?Q?Ydx35iCd?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2P220MB0946.NAMP220.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a3fe6227-f5c9-4a49-e3e6-08de86acc644
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 18:16:15.1904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0P220MB0816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_111621_083483_CBF78FEC 
X-CRM114-Status: UNSURE (   3.03  )
X-CRM114-Notice: Please train this message.
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

I thought of sharing the attendee data to you.

Reply, YES i can come up with all details including Quotation.

Regards,
Amber


-----Original Message-----
From: Amber Espinal=20
Sent: Monday, March 16, 2026 2:29 PM
To: linux-arm-kernel@lists.infradead.org
Subject: Business Leaders List =96 National Restaurant Association - NRA Sh=
ow 2026
Importance: High

Greetings,

We=92ve curated the outreach contacts of buyers from National Restaurant As=
sociation - NRA Show 2026

Event Attendees Are =96 Restaurant and Bar Owners, Management and Executive=
-Level Reps from Top Restaurant, Hospitality, and Food Service Brands, Reta=
il Food Service Professionals, Food Distributors, Equipment Dealers and Oth=
ers

What you get: Contact Name, Title, Company Name, Website, Physical Address,=
 Phone Number, Fax Number, SIC, Industry type, Employees, Direct Emails and=
 Verification results.

Say YES and I=92ll share full attendee counts with verified cost info insta=
ntly.

Thanks
Amber - Trade Show & Events Coordinator

If you do not wish to receive any future mails from us reply us Not Interes=
ted.

