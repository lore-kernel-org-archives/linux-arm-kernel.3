Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46F6D690FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 11:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6tAA5aaKnot30BgPce8peoaI4LF8mzEstbKPkegUjs=; b=ExG+VOtkDBa7cRgiVgL9bgUPZ8
	xy9wKXAVE1eCzDZKM+zCvdzvo5VPC7jHuiYsQ9QJcNbo1Zd/FyJFa0e4C08894sQ4eemk1dbmkRSr
	dkC7IzyQPn4eJdmR0Hma+XEhPtPa5odkVmBZHdsQgH6fBVLqWkH5xFu5rOyOql7EQG6RFYLCSjG6b
	VubKZdZiMKRrKarAjSiSZ2DiaBArBJIqC9rRtDrRYrxh9BdHaD515alaLGXdZNdO54TOme7ZwgzOq
	9loD+0s0m/4ddIvsjyV/H5YWBhku8GDkF5imEHxCqoAGPsVxR1JRv3cX1+Jy1ddA2VNCmWr7wSNwL
	pmwcJKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGd1j-0000000FPOF-2tHk;
	Thu, 28 Nov 2024 11:49:43 +0000
Received: from mail-vi1eur05on2061e.outbound.protection.outlook.com ([2a01:111:f403:2613::61e] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGd0k-0000000FPE8-0x6j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 11:48:44 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EUuPTlIRBVY5Ly7EFGJKn7pfJTDzL7Aa2VdB8ZC0iWSurC2dYxNv3+pqgdu3GNNO1kJaFiGwcbiR5MnTXRqTc6mDZtI2x7xXLYog93FdtnZbsT3faK1kec5gTllhKtiygI1n8FZB7nCMFL2bGQeZb0JkyFbmrr+wV/sGufG+aKQA9VQI8ygewxFgJWckndq0ywsEN8dKPALH9igf4UIv1F1X01IXWJSAOXWs7RJ1XNpef+tUni4IBH6aN2ySK7706/yf2iZFcDJrsgDIgUN++QaBZNK4sZYq+Pmjw8bcuQUxfZZrQo2a1RSToXxUmW0fazpykT34uvHP84B8w6QAQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6tAA5aaKnot30BgPce8peoaI4LF8mzEstbKPkegUjs=;
 b=N8s5SipGS0bCD5iHqrlZWKWL20HHwANQJ8iKQS8ywxCgYHdlgBKRH24Z3PRmMOKZ+2EccEVwsLCiggZAsGTcY9JvRl5J1ti+Z8YtFK+eJbJN22462qpKi2Py917jKfb/41oLvrwnoB8IiYdCZs6P2r20YZHyOyhIStvkGUdMZspr+LyAfXX36OADqsGvqO+UKzGMRGs6w6PQkPY+guVOvYlthSNAOUg82jeTbyjkUwRYh2u0EYATTlAnezZUjEqb023Q3DkJms6pbjqMnLXdl0UdO4BZ592CPPkDvYg/Y4ohWUrIoz8arJVD6krSTQRTJlAXkrC7PD3LllVIEkoN/A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6tAA5aaKnot30BgPce8peoaI4LF8mzEstbKPkegUjs=;
 b=EMdxhjZzd/DC5zuHYUIQU3BKWDnvrpl5xqpf6h7wGrgVmXFYTiA+CY0m9lnFYQ5MPMMXzKSAKO2vmpcaAJBWyV/8H+vsCt4spbUlNznv1g1yxKCAjOhzNcB7DoXRNvDlYel12ZkIC5SFTXHNAEHlibll6RABHIkDXWNyuKOMxo8=
Received: from AM9P192CA0027.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::32)
 by DU0PR08MB8953.eurprd08.prod.outlook.com (2603:10a6:10:464::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Thu, 28 Nov
 2024 11:48:32 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:21d:cafe::69) by AM9P192CA0027.outlook.office365.com
 (2603:10a6:20b:21d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Thu,
 28 Nov 2024 11:48:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Thu, 28 Nov 2024 11:48:31 +0000
Received: ("Tessian outbound 2e0b2b8680ec:v514"); Thu, 28 Nov 2024 11:48:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b348ce1b391b9a5d
X-TessianGatewayMetadata: nUK6oYivwG2G7E2uohxImhE1SoWReXekYxQhTqmUpOraRiNUMf+3NAJYwhr7k8D9h8aDYihJak+89Lsd4oTktspE3TV6ykAFCg+emnL4IuLJf+CbudGqttry+U7bDK8/jvAxyzKsRFEJWdWPPpXU1lIbubxcRNMTfpu0RWTnju6+d0fJP/W4wj22JJRQOvqxJIugNAUucmh2iUXX6NYYGg==
X-CR-MTA-TID: 64aa7808
Received: from L2329cca40ef8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 930D6589-CC51-4C38-8237-FB58A3725D55.1;
	Thu, 28 Nov 2024 11:48:19 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L2329cca40ef8.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 28 Nov 2024 11:48:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psxYATY/sM/o1EIN5Y3EF1RS9BT+6IJnKku2zk1lO8Ah+2co3iBklcRQuTGfX8HUApZ+tnTxcK2BkdEWqHGodquyuXUup2zqaDKMhO0vu302RnJqnN2gnHK2Ns1hUXDeqST3I0Ar6TXvY6wx2c1IC2EX/wjC+uWxHi0EbPj9T2tWdFpdxHaYpEIDVgIJhCNSlg7SWk/yx6nm1kkxXv7846bbZSUcGTnZB4/ZbdrZnw+tTcaV5vRkWp1MgZW2M47bF7jwcQerJnBqqzLgl01dXLTNJG+qCcUDI8k3oKsmEBURzrq/g4M5h9vXDaNDuzLK7Lgh9eOblguOgJcVrw3Lng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6tAA5aaKnot30BgPce8peoaI4LF8mzEstbKPkegUjs=;
 b=Gz0oDnXtWoOqpjsdTxOf3CkJFJy/qG8lbyvQzBEn4AlMoWJ2OsRcWc/eNtLt5wyWac616/YVPCrP5bJ5/3OsrBNcLSBFRe+XcAq4s4X3ZJn8BtKT4eSsTKrLqbpLDlcn/C01d5b4hvRNdMORaCFLk1hlULHu/jPNc6ZaKIedJhT7zneOQJe3VTEWXMC1F0mSnZjDNhslSn8BiTycJgYGYWg0ggcHmkYNIIt/JjKzWWwatVCTnAF6yTy/hDCzkXAIyg912cUP+eUBIwZxNA0b/C2hrP/E8MqiElA/FK8rHEDnNoCju4buBDI1hk/FBWBBNYx4VfGOyMAMGKpGB4hgYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6tAA5aaKnot30BgPce8peoaI4LF8mzEstbKPkegUjs=;
 b=EMdxhjZzd/DC5zuHYUIQU3BKWDnvrpl5xqpf6h7wGrgVmXFYTiA+CY0m9lnFYQ5MPMMXzKSAKO2vmpcaAJBWyV/8H+vsCt4spbUlNznv1g1yxKCAjOhzNcB7DoXRNvDlYel12ZkIC5SFTXHNAEHlibll6RABHIkDXWNyuKOMxo8=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AM8PR08MB5796.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 11:48:16 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 11:48:15 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: James Clark <james.clark@linaro.org>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "mike.leach@linaro.org" <mike.leach@linaro.org>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rt-devel@lists.linux.dev"
	<linux-rt-devel@lists.linux.dev>, nd <nd@arm.com>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "clrkwllms@kernel.org"
	<clrkwllms@kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>
Subject: Re: [PATCH 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Thread-Topic: [PATCH 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Thread-Index: AQHbPx8wr3p+WgsBJEaSjUrN0UERgLLMifcAgAAL+/8=
Date: Thu, 28 Nov 2024 11:48:15 +0000
Message-ID: <GV1PR08MB10521E2C28D14B8A0FCB3A59EFB292@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
 <6468302c-f1f1-4edb-a6b6-ca248944cbbf@linaro.org>
In-Reply-To: <6468302c-f1f1-4edb-a6b6-ca248944cbbf@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|AM8PR08MB5796:EE_|AM1PEPF000252E0:EE_|DU0PR08MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e49259-7536-4dfa-f868-08dd0fa294b9
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?G8PzYcQer1ZXy2CbVa3vD4QMWaGB1WYvfsajf6RAd3ipXC25CzF7b9I1Bb?=
 =?iso-8859-1?Q?dwFrKtjQYa+OA3wSufARDvXIOIARKab405FzBEo2mbC2QkyQV1tGI87X1h?=
 =?iso-8859-1?Q?WyK/n+bET/XaI+irE1aQWVAVdwD9/ho91eDg63usZoEwz1swULflf72Ria?=
 =?iso-8859-1?Q?O7QKLxCAB0wqiOj3s+L4ycLBIYam3fm/o8iGmgefNK7wXus+kktvu9l/rp?=
 =?iso-8859-1?Q?8Oj3jjGgzL5pA0dqB3Wf15Nc4L02SHEI5G4b7Me9olWppIujosOrbmbq7z?=
 =?iso-8859-1?Q?7YnFOsuX3l6UDT2Jgkb1ZyaUPTkjtpvfs96juFAJXC7KPCctGuKbaDdNhJ?=
 =?iso-8859-1?Q?mXvsvkx7Dbk2KFeX+r/iKG6RsL+OcD1023E7uIqmT7rAcUPWZ8vZgRZ186?=
 =?iso-8859-1?Q?snSThhUuVVhY9zDYc6ytypZxVJH6ky3SOU8AQK4OLYbjAggRaP52IWQeFD?=
 =?iso-8859-1?Q?CRlI+PRcgKrgSUpwJMXKzCP/KmfT4vGrHx0DuNfjc3IaChzPwtWKmjf0ie?=
 =?iso-8859-1?Q?ts1YCLTCWaY92aOLzWg5kx7KiYQHpputXZI0B2j5ITqgfbv96kVjQH1LTc?=
 =?iso-8859-1?Q?21Ql9dM3IOHndla1fNLlcxr0fhvDCu1RrZseUjnl4PrY5SCFE1t8Knzc00?=
 =?iso-8859-1?Q?yOyQTs+9D4dhiZ1/Y46KL/G3tZdjMZrx7gevbcTAOju0Ohpu1mB74QS60E?=
 =?iso-8859-1?Q?3lgmVt5qMeUJu9+MFOLM+1hrILt5QXZboOTOhrl3aA0fLicrSjTq3+Cqbo?=
 =?iso-8859-1?Q?STKaLtI4RniSo3sVFiGmWri1o2gWDB/AJzs4KpyUK9rX7jRiUxO8hIVlza?=
 =?iso-8859-1?Q?rLdjJoHOXFxF13JX7A33GEZKLHJ0qol2ZFDxtauW/qgFP6SC6mP1lBLkIk?=
 =?iso-8859-1?Q?YWYgO3lgOfr75sIZ5pln9QwyGYxxE0/k7/KC7L9I956sQ+GJO0iAbAXMQo?=
 =?iso-8859-1?Q?SOrCWd3tFat46kXQM0NfjDHhHYJD0KNwuS+Gtqzm8dNQZT63WbwxuAFEij?=
 =?iso-8859-1?Q?mxK/Frd52wrqza/77k8hQr9lG2HyFuy9NXot167hzV7yKHOoQiLzor+58X?=
 =?iso-8859-1?Q?OXz2quNzRnnIN3ddrGJh8/Ke61pGTFaUCFw9XPXZjM8Q4/FXeWZJcmRWa6?=
 =?iso-8859-1?Q?g9iMevc5XkXM5/VdVPZnSNuQcpmqOGYciq/+s32eGiTVSLUWLAyA1lsYjm?=
 =?iso-8859-1?Q?DzvKUuO7AVhG8hIUJhWBpyiGTbrP1sOYJTINMB6nC2sSnCQTO6vBlWClqT?=
 =?iso-8859-1?Q?tHltnmWEvwM/Hlsp0AjAQyffsiwhEqB31H8BH5GTQO4WzyTulOmV9okgrD?=
 =?iso-8859-1?Q?g+0jKwVkO/ggVssXrPCw7AzyYQPkMMVrl+cwB5Es2wl069h1jEYxq7KVOC?=
 =?iso-8859-1?Q?3sGkf+42J1KbQVK6hqtbwkV6VIAYidezDocqKMaV1YOqPoxXsNwDwIwFxZ?=
 =?iso-8859-1?Q?4Q881KdVgicePYjXAXKANHgzLgUOqIfvorAj0g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5796
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 749ef02b-b6fb-4ff6-1318-08dd0fa28b8e
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|376014|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?pFdj5dwiySfRM49jXBmzY0jmliIhtu3uMzDO0LYumsDc2K3Nx4ZiCo/Sr6?=
 =?iso-8859-1?Q?Ye3xRkB4b81UKbdNcOhv361yZMO4RAKwsArpXEgIW2QB2rMp8QSehTUvtV?=
 =?iso-8859-1?Q?O+S9Uw97bhm4DNr4baU+wmk0WegH5g2eNOF3xFNOiizY1uPsCUgZ6D/nVS?=
 =?iso-8859-1?Q?PlVsnnMjnbDL+ljM3qIzaSIJIfrZ5dChDna+EbVRuhTP/DxoWHQmfjLn7O?=
 =?iso-8859-1?Q?fxkAbz682SuJUO+fy0ZZAsSBNAa8neQ6U35DfXNm4l8gJaRdF/8vv864UG?=
 =?iso-8859-1?Q?6cGd+GZhKjpxGhrFj2JieKAmFmj6DsIgP4EU42e4nhQfLthFKGCLRG78Bs?=
 =?iso-8859-1?Q?gXTsHAuglsDaO8BDNOw79lSqfbyEViZC1Kzbk8QAz+TlXZaYsrt9Woxwni?=
 =?iso-8859-1?Q?HyOcqa2Teqp+Xw8UDioEyK7m/WGrJn1r+jqMn7DBzRO7tk4ed06rmdkOb6?=
 =?iso-8859-1?Q?1gycuOVztzx0TJrNI/pzYkusmWg33FXPl1n4TLEBEYO5ypgbySrY4FUN5J?=
 =?iso-8859-1?Q?Ggd7pPxv12f4tN+0ZFcT7SPr8kB/neGR2rJSM+JC0tfcheIaOTV5+1rRm5?=
 =?iso-8859-1?Q?ogKSC85ERH/M6xVxxyET2m56UDXyVFyB5ucP0kCRkV4N76b2tdHyUUkXZz?=
 =?iso-8859-1?Q?4YpeuiJvvjUFpCeJsU6Zx+iVp2/UHLVF0RsreSaFiAhlWb9TObUNzw2A+k?=
 =?iso-8859-1?Q?HMNrDq3I7AXxAXM80Pro/z9tKURPOEFot4WLUFvnQw9sikgd+m6EK0re6x?=
 =?iso-8859-1?Q?uMXD/w9R02t8ctxWQ7HUsos9BAUwaDfq11c3LdYSBXZ9ot14vIs8yo71gi?=
 =?iso-8859-1?Q?9WyqD7P9+gG5nPPHJRXPvuwILpXQ58vhTpwLHCpKIso/xLhy9CrA2MpVbM?=
 =?iso-8859-1?Q?i1+r61mOn/tu2AVqt2hTxToU6C7WyB/TGTAZAV0+KEEMu65paXfOCoLgvk?=
 =?iso-8859-1?Q?h/AkO3P72c0d28zswJPVMGVKMdrDJjJadd9jPf7cqPLD/x4LdbUDQJm/3k?=
 =?iso-8859-1?Q?vm1Jg4wGN+rBdQx7l2nS2e5/ZBY+rWW7U9lUrqsgVkmnqqh251vzvc3ci6?=
 =?iso-8859-1?Q?TAp04xYqIufB0S1CFhck0+vvRQAcZVY74lxrVrbB09Ap7GEq/4j2FcRHSi?=
 =?iso-8859-1?Q?Gf+NvJ8VMO7+c7KRYaVlHPWHW2SedSgltt7UVo4SoYsPxP+9ZIQh74E5Kj?=
 =?iso-8859-1?Q?JdyfvmyGu1g7r/5Nb1zYxeE+/bV+33Hn838LgQm/0t0qfsoDYdbSWYrl0C?=
 =?iso-8859-1?Q?nj9x0YygWBEj2Yxx+IgIyTtb9/voPs+zX9BIdIiyQcRuYzYZwgXgULTcr0?=
 =?iso-8859-1?Q?ggxyBiiE2RaWP5LIrvA8OvkUbwXYP0AFCk+mOwhMAmIZuZpmJINaKil8h+?=
 =?iso-8859-1?Q?huIKjJd1AgPgXIW6BD7EtkyvDhU9zDwIECVmFfn0T7qbL98BcPdrrq8LEr?=
 =?iso-8859-1?Q?qBydh9KNovs9xaZ5SHfQzsImY2eaIrIgoTt+6BV8+TJ604QqunFJeN0BPT?=
 =?iso-8859-1?Q?ijeGqjujqfSUczc6TVa5fv?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 11:48:31.0187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e49259-7536-4dfa-f868-08dd0fa294b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8953
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_034842_536773_E34FA36C 
X-CRM114-Status: GOOD (  11.27  )
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

Hi James,=0A=
=0A=
> Can TPIU be used as a sink with Perf? If so that one is missing the updat=
e.=0A=
=0A=
No. IIRC from feedback from Suzuki, TPIU not used in perf mode.=0A=
=0A=
> Makes me wonder if something like a "perf_component" flag in=0A=
> coresight_device or a #define would make sense. Then the lock type gets=
=0A=
> auto picked. Seems like in a few years we will have completely forgotten=
=0A=
> why some of the coresight locks are raw and others aren't.=0A=
=0A=
I think later then do define new flags to solve=0A=
sharing data between perf and sysfs (i.e. etm4x config),=0A=
=0A=
it would be more resonable seperate config for perf and sysfs.=0A=
so that, sysfs shared data could be manged with inside of SYSFS subsystem=
=0A=
and it can have sepearte lock to synchronize under SYSFS.=0A=
it doesn't need to define that lock type as raw_spin_lock_t and=0A=
solve the data modifying between perf and sysfs setup.=0A=
=0A=
But, This is another story.=0A=
=0A=
And I'll seperate this patchset to two part.=0A=
     - Change locktype from spin_lock_t to raw_spin_lock_t=0A=
     - Apply scoped_guard =0A=
=0A=
so that backward portiable.=0A=
=0A=
Thanks for your review again :)=0A=
=0A=
=0A=
=0A=
=0A=

