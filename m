Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33740E74AC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfLrDR02eXRs7mLK7mPmodLUQekUo5xUaIK/CIJvgug=; b=lBiLigzyUO1YxpUe178To+BI+y
	/qk9xht+Px8uj2fJ4WSg/T5bgap90XozFAolBKzWmt6fA6nkUQEepg+ZfZN/HtjWlwKQ0DpjwhDJO
	IMO/MR6tYSLQk9/CTyrryuFEu8SLRN6ZWg6kjpIMIZJPrLgf01PqoQ9w2shUDCkEtbJoZDH7D+RKp
	HAMQoBBRLQjnPLKtQJCMDYy8rdxcqEvufnzStYzpjUb+5a0uC8cs7ssqxYUrnC0Nykzj4vIJUUq+p
	3oilen6nQgm1BZ88c16lLtTG6oVgG5MbM5c0rX+39m8hCC5WoHkWs1DtI0LpiDK1gQqpbearIlEQi
	z8B1s9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIW0A-0000000A8TH-1NYM;
	Tue, 03 Dec 2024 16:43:54 +0000
Received: from mail-am6eur05on2061c.outbound.protection.outlook.com ([2a01:111:f403:2612::61c] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUrf-00000009w4H-2Y9a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 15:31:05 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ij5Oq5zGB2XknG8GO8LEcb59QifuEGB2VwlJG2U62mFIeQBugu+p15ScsdorDa6RdeWJX47g2sePEOiP0hNo84N1+R/gqUaKshbVUGZF5KnXXBRnGXIoeyb58O4ZrIzys3OGJNy9P4JS1UFaob0NU/KKLp9QjRpZPDM/UZjQQmxAAaBXh6KSx8gRCPE+KDmCUVmz/nc5DMbrptMamdTmlQ5kk4RJgmmv+dRFJt3z6juk9mUUqoieOUH7PO4UMQIlwETi/OfkjNi2eemQJSICB/vVm+MDWfcGcTncfRMIB1pYB1Qfx6hoTA0CI2Jpq9kHDmHa9kSYjHNoZBeBmcs19Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfLrDR02eXRs7mLK7mPmodLUQekUo5xUaIK/CIJvgug=;
 b=M4528yTNm30ZzN0Te0f+bV7Bk1kc+rcf0m48uRkqaJB45Sxs31bVJCSVPWII1sMIoZGjZEou83AjR94lU1BMbzTFF051tSQ91r+dNrqkzylsSgbQI+BFqqGr9Ur2u4VAmzJTtHf2qkMgzpIdBUFPwJxnE0r12Mqs7ye7BUnTyGNtXEeLxtAwLjgUK8A0tXmHcA3tR/QlbKLEeSVnzPMp7KDdm5HuDbFR5EdA73GJcxBd3EVTifxAQl6c/loyq+B0aslpxTA4k2QehI9kaDQqNWIWDFBbSUDPPCfeIY6ZHaq3nCaUqupmszbHOUzjMRlB2cnyE0NXVM9xcQI3s0aRjA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfLrDR02eXRs7mLK7mPmodLUQekUo5xUaIK/CIJvgug=;
 b=Z29DVIqDhBj0lObZJPLBVXuBdY+CYJ+afk9ibTRiBaHHu2X76nMiSy4CWku218q/BE8R2Wq9tw27oaULPrfNHw4gKFCQxJXSNM+nFL1v2ThwKssM2yGVIIdzeYaheTYEBJ4zg7sDYW33ztFO8EUn/7XIEfsmw7/q+87Jpts++9M=
Received: from AS9PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:20b:488::17)
 by AS2PR08MB10207.eurprd08.prod.outlook.com (2603:10a6:20b:647::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 15:30:55 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:488:cafe::78) by AS9PR05CA0021.outlook.office365.com
 (2603:10a6:20b:488::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Tue,
 3 Dec 2024 15:30:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 15:30:55 +0000
Received: ("Tessian outbound 206fab1c37e0:v514"); Tue, 03 Dec 2024 15:30:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c393e09ce843bb2d
X-TessianGatewayMetadata: nCgfyCV/rkCti776tiCSQahB+vKsrsTG+Vbhaj8sw3pEvWi64XD5BhIVh5V6E2AVg+K3dRNd193+6ASpZku4SFDlEvaYbTFa3W4nmJP1uii/BIgas1zplPeKlqpshUo7asCAVGUUFowW3OW/q7KHGZGhPseYeaz2LU9j/zKFvsZkOLf7IrHRYR4tys+DFNblC70iHMFIfnsfWezRIPSvug==
X-CR-MTA-TID: 64aa7808
Received: from Lc94fc43f3c7a.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2A27920B-5733-4BE7-A5A3-46525A7984E9.1;
	Tue, 03 Dec 2024 15:30:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lc94fc43f3c7a.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 03 Dec 2024 15:30:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lATzZ0Ca88qqjh2QkJclLfYy+Hg03a0GX6jaBRN9wGxsZSnM5Zjt6d2dPOz0lj8jyMDs4EMjrRHIJxL4K0mbGpxJNA25LKJ61ILqEw2Cj1t54dAwgUxrdUBWBFazVGO9QDDEzG2Nxr6iDqb1JyrBjpfUME/2MLc5UJAs6ORr5xrJhjgzXWDTKRX8gRJIcZEKYA0hu4xVEpfF1MqH0Kv8kPkGBxBRq9V6mncB9A/mHTVpEbZzk6vzeB7eBqyEU58RWAD4zOFV5icuHkF2Ugooe3vHka+BG8VUcQeFElXhSUOtlL4Sk8ZBf69a8w8rv4EMfUneTtTDjgqIkVEteqo9Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfLrDR02eXRs7mLK7mPmodLUQekUo5xUaIK/CIJvgug=;
 b=ReMIwdCO2lsyNDX70/tz57QN4nU0f9sA6H9UzQYz99rzdZbUd3sKkAk9iuOetTJNPSLegnQQXuADAJ6RXZM8wzYAWU17y99IycrUKkRzDlORQzuyEOGqPIkBLYalrdw3Pcb9k/+atmWd6YVa7ER0dWydK/EV7xyKVfB65T54Y7yKsetYFgGpwDAlPoypC9vmAfbphv/L5vsPJyvK7d8E+8lOa+/RDkH7Ipd8+Ilif0DnWeQjq7iQuanP1TNfaFG/FyDJsMVMA9jjE8Vziu4YFoh1u5OXbCc/6Wt4Y6yHEcORBbP/BlQcR40IzxQJ0nTwJvFnLc0FpKuxKF0QK6rapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfLrDR02eXRs7mLK7mPmodLUQekUo5xUaIK/CIJvgug=;
 b=Z29DVIqDhBj0lObZJPLBVXuBdY+CYJ+afk9ibTRiBaHHu2X76nMiSy4CWku218q/BE8R2Wq9tw27oaULPrfNHw4gKFCQxJXSNM+nFL1v2ThwKssM2yGVIIdzeYaheTYEBJ4zg7sDYW33ztFO8EUn/7XIEfsmw7/q+87Jpts++9M=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB8443.eurprd08.prod.outlook.com
 (2603:10a6:20b:567::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 15:30:44 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 15:30:43 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: Suzuki Poulose <Suzuki.Poulose@arm.com>, "mike.leach@linaro.org"
	<mike.leach@linaro.org>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "clrkwllms@kernel.org"
	<clrkwllms@kernel.org>, "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rt-devel@lists.linux.dev"
	<linux-rt-devel@lists.linux.dev>, nd <nd@arm.com>
Subject: Re: [PATCH 1/9] coresight: change coresight_device lock type to
 raw_spinlock_t
Thread-Topic: [PATCH 1/9] coresight: change coresight_device lock type to
 raw_spinlock_t
Thread-Index: AQHbPx8vuTignQOEcE2iGTau3pde/LLLYBwAgADpbc6ABtjNgIABGYcAgABzv4CAAAFbSA==
Date: Tue, 3 Dec 2024 15:30:43 +0000
Message-ID: <GV1PR08MB105213222FB18FF328443148BFB362@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
	<20241125094816.365472-2-yeoreum.yun@arm.com>
	<20241127120954.0facd34f@gandalf.local.home>
	<GV1PR08MB10521520ABD7B72D92FD60DE9FB292@GV1PR08MB10521.eurprd08.prod.outlook.com>
	<20241202103853.26db0c13@gandalf.local.home>
	<GV1PR08MB105212FEF9251CA2B3AAF7FFFFB362@GV1PR08MB10521.eurprd08.prod.outlook.com>
 <20241203102047.5844de81@gandalf.local.home>
In-Reply-To: <20241203102047.5844de81@gandalf.local.home>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|AS8PR08MB8443:EE_|AM4PEPF00027A63:EE_|AS2PR08MB10207:EE_
X-MS-Office365-Filtering-Correlation-Id: e2702a94-7eb7-495b-746f-08dd13af7aa2
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?0nmgu/jXWswkb/7UbmOE3d1GWfjlOQE9o3WLZio6GRy/BHZvzSg+9I5Q1K?=
 =?iso-8859-1?Q?B0+/wWfPqNrQOLqY6/BTtIZTduBx03Igk3zRs5UN0RFH4ej/A6lLwSyBJ6?=
 =?iso-8859-1?Q?1kCNQM5MeME7iH3xesmu7et598jCtV4CxtyL84uoK/Z81ryKSYqYNfPD2z?=
 =?iso-8859-1?Q?wqgil/WzkhnTl7mhiySyjqJ9aOc6y1nA8AaHtQ1tp9S39Q+XdnEQ3PfxAF?=
 =?iso-8859-1?Q?U09rs9dPchbwh4A+CMhZdLl35pYEoDspLFIQjw5LZ0kyACC27QSAI7g16E?=
 =?iso-8859-1?Q?s9QrY0c4uHp7yBi8F4fVALsRjvYJp98BI1dZoShy1G47boVqGkcX1xgbql?=
 =?iso-8859-1?Q?7RuoALDm7HKki9cXVDa8GVx3gle4dF6IhDY6XuMXMWqyvCZlsS0M+qCm7g?=
 =?iso-8859-1?Q?wMi4uf76mmNjJSDVZJapF7vXIsZH0HA/abUuAbOkhoovBzmYhPAJLU0jtP?=
 =?iso-8859-1?Q?AxCOyJQ4rF/2iLMgGbxMtMWzr1rq6FDHoFkEwkWoFHghxv0BX/gexiVgRB?=
 =?iso-8859-1?Q?yHPZTeRdcBCL7utKezMjmi6eevtPDdoZkOnlIUg4M8bqU3lviPEO+CLwqc?=
 =?iso-8859-1?Q?QcnNwXUgGP5jgtFweP8fN7LTlNEpqs28GfaCJvPCrc5xnhfSxlNBczxZR5?=
 =?iso-8859-1?Q?8S5DLkQqSY0BCw2o6c3nGgUqujhxhpeN8fA8+wUaM2H7LSb/n/laMfmPj9?=
 =?iso-8859-1?Q?2pjQGzeiVtuNgzwaBLYycrAxKfX5DnprG7h1Zok9A/x0TN4rQUuDlHOPEm?=
 =?iso-8859-1?Q?4W1zFiQuyDsABUATz2pQe7FZQnlj7TPi4Ih300mV10Uj6gnOCP4VXZ9YRG?=
 =?iso-8859-1?Q?4XYxF3xHvGih7PGOoQLlQHHQHhdnt9kBXIZ2prjE7HUchxxFdynF2a61mu?=
 =?iso-8859-1?Q?AgykghpjhWB85ZharRZgg8ySBOw7MZ5czwaL8pV75k1uk5iUyKNZbbtyDL?=
 =?iso-8859-1?Q?kT0yFdr7UC2CxXJ97nZ/u6Vsb0xIRye107+amqTgSfyo1OH09+SvKmfhGk?=
 =?iso-8859-1?Q?ihm7AfD3Ko0FBodJ98lxw0C7tzPs7VStBZ4Wg2Ry/vzud/Nj52jMQgBD8R?=
 =?iso-8859-1?Q?iBCHGMg5Dhgt0oXGkkZbGbw8pJHRGkTtJpuoFhRwvzvi3ULAwgl7TXtlan?=
 =?iso-8859-1?Q?LK0iptdLBGPiVfXX0bC+BM9jTqoIhrbc0/Pz2Kcjvkw+aMirNZyWCrhAjG?=
 =?iso-8859-1?Q?bWtBiVp7niAB910Lswg84K9idMyZF2jeHDoqW+9+PQmWnXy+0ziI+Q5SFD?=
 =?iso-8859-1?Q?A+373k3/C4F9rYfgTKev94+9gjJy+g/imFS+Mu4BcZwg4wE6Zls1r+CL/m?=
 =?iso-8859-1?Q?i0jbGVLSxLro+3QnheILygfPmGCkKLxiDBOCEDnjS6/I+gWwF3GNFTgy6n?=
 =?iso-8859-1?Q?1P4Pja89+YFtSd4REpdlPAQRDzC+1WSCQQwEPji+Kz2EN+M6lHjZ84867w?=
 =?iso-8859-1?Q?HvUYP17r8y5Ph5kTwfgytFFxsmbkJWaHuGXRYg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8443
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d57271d3-3062-4220-5c7b-08dd13af73a9
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|35042699022|14060799003|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?e4OJFYqIrAz9J3J6+9TIoPPETlYPLcxnatAqrxFPhMiDBh1uyu4bNLYDGc?=
 =?iso-8859-1?Q?1yusTJu5zTbfUM5VGP2/JKTMt7+Uy5tHQUOLIBBSi8eyvFzjW+WgGbby44?=
 =?iso-8859-1?Q?MvehR47RB0yTjM6V1gzsbo69bwL8UaJaLXgDIabPl077VWxnEQZ3ZQemeD?=
 =?iso-8859-1?Q?mqlpQxJvrqj9/x3ThLPI+OqL2EUy/TmKI1bMOrbQ/wAggBOx0pQENoIMCN?=
 =?iso-8859-1?Q?BZCfZtgcjbBworbLzELBmNRebzCkN+pIDOGPu/JwKCxfgZe9TaibArg91Q?=
 =?iso-8859-1?Q?J4Cxmc6AyFcQF640Wci4J8wvXSGlHKp225Jhaj1Fw+Tdc2yNQ6DSC0gkaG?=
 =?iso-8859-1?Q?rgBWBgqAut9OgjuRtySaPn51/HdFBXIlfb9JdPHzdd2chavFyISaW3dzlt?=
 =?iso-8859-1?Q?p4zBT4X6Uus3MMWz5YbDOThZh8kChDhCxOBMJcHl0icra148bGh8G5ThQ8?=
 =?iso-8859-1?Q?MAXxVEgT5SkfjMUkyojgb36W2iGrjwRJTdoLvowYk/OWqQzUMPs4Csdz08?=
 =?iso-8859-1?Q?0xAtVh2/qv6zvNweNh+LjDKoIPU0k/MXAa3eQzFyVkKYncCyCieQYVNxQI?=
 =?iso-8859-1?Q?dE92YNso/ycqxGJlt+c/41vmu76tHvzhW/2fOjA2UgFKXmlz9VOyLXevIj?=
 =?iso-8859-1?Q?wnNwoesr27n7ULyWdVQC4s9AfbX7Gdywjji/1krmcrskTtwCx+gAc98mxu?=
 =?iso-8859-1?Q?VGsuslkIckOdPpI7sp5cUUPxy6VweM9CtUyUAqeLTfzlT+YLjuz9S9b8dD?=
 =?iso-8859-1?Q?393G52YPS0P3YLBw5/ZEtKtM2oNzy6Vo4Ku5FBWuB5QRElYYI3hl8Wzgad?=
 =?iso-8859-1?Q?2bZDCo3F1u9NHH0q6RITmFfcR5dvO5U0GC+lEVbYCRCb20jFQkay5jGGDe?=
 =?iso-8859-1?Q?bkLwXA2PDk6PnsV1esztUJfXXGK4XzHqdTwHYlq6L2Xy12YCc2zP+Gm8wj?=
 =?iso-8859-1?Q?AUZ6Nqay9nxtEMHjgKc5xuylNzhZIseFLRvsRTQcuu0Cj8uk90kKPf9sfg?=
 =?iso-8859-1?Q?agwNCLVPz8m0JkqCVeNdD4OjZfy+NiIxz+B6qwVZuahxb09jPYOtyzCBvI?=
 =?iso-8859-1?Q?XRWlwDX0e4QDbvYP0aFPsRZAJsKaPnjr0l3ixrjJTP+eTARvC52fjgjd5E?=
 =?iso-8859-1?Q?4rmt5YhmMQfOe+AOgOShgHlY7ZugtapaWCU4VghVgjM4SmcjYuQbQGtM+/?=
 =?iso-8859-1?Q?Jc6BaOEuttE0Ev68JEFqFp9lYaDlEOBmL1KZJ9NgTFCMzOxqTfP5Gi2lLq?=
 =?iso-8859-1?Q?76dbTneoZvC3C3GD58vYeiqAOFFz08PZI3OP4CfNeIEUEv9hzDhhL5H2/f?=
 =?iso-8859-1?Q?4Lt4xoht4u80lnd8Dk+IEQaWoaM/m7we+bwGhH9dXDx1qtW7bRwB43UVqf?=
 =?iso-8859-1?Q?YBlPSjXQSqf2ytuVMIXnJSnawIZ8FZflftM9qzF156voFBCH1V1615blP2?=
 =?iso-8859-1?Q?OIds5HlYB0qLPc412LBDXRsF8bwInkWIhmF3ITI7xdXPzqZM419XjUO4rw?=
 =?iso-8859-1?Q?CYDrFnr/jfeNOc/glJDYoh?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(14060799003)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 15:30:55.2274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2702a94-7eb7-495b-746f-08dd13af7aa2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_073103_806391_410E112D 
X-CRM114-Status: GOOD (  12.56  )
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

 Hi Steve,=0A=
=0A=
> > > Still should be documented somewhere. It should describe the maximum =
number=0A=
> > > of feats that will ever be loaded. If there's a max, it makes it back=
 to=0A=
> > > O(1). With a 'k' of how long it takes to process the max number of fe=
ats.=0A=
> >=0A=
> > But with other patchset seems better=0A=
> > since not only this function, but also for other functions too.=0A=
=0A=
> Which other patchset?=0A=
=0A=
I mean I'll send with seperate patchset to documents this.=0A=
Because I'm not sure documents here or in other file...=0A=
=0A=
>=0A=
> BTW, is there any example describing this I can refer?=0A=
=0A=
> No, it's on our todo list for RT. To document the RT behavior of the=0A=
> kernel. This is just one location.=0A=
=0A=
Thanks to let me know :)=0A=

