Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBE7E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucrrzOtJ1wKzvwrAtKuC8aTIEH0RFhRvYLz9jruy9nA=; b=x4KDFyCRpCulwzpGX0bRnnzobd
	pzPdfLzfp47soI/mfGWEB/yWP2Lq7rzKwuTJMgnNvuK0o49WKC0XpIjCxRa7flMrmqan48EdBbLsS
	6mTQo7b0WONhzcS39tMR0TFvbN6gPHqhcAQc5NvBY6O/b7a8mWh8qHTgF9hwp7Na2uXSoDlRPPytk
	SlMyCWMKQtUtbFCkZ8R8uTgVNzPVHVA4NRryQ4Khkz2EtTwPfy3SlelC4zngDWLowUSLSvn/s2EEO
	xTuEkMo2yYuMmMHCjijVVhZ52TCC6SISXzIQtyUQLFTSP3bt+THzrVFxJl/U8bp8j2vjVqESgQjUs
	vghGsATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaxD-00000004i7z-33UJ;
	Fri, 20 Dec 2024 11:13:59 +0000
Received: from mail-am7eur03on2061f.outbound.protection.outlook.com ([2a01:111:f403:260e::61f] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaWb-00000004dJ2-0fc2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:46:30 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WasPxumuxmgF+lQOCF/SyVaPm7oe9+QjI7atOfDQrMCKpRFvz2GHFEUf/hkuy71XYaN5uJsMERkoByaHaF3RgdVkMPaUOPnmDyERLZP6GFCgfyHWvGhNbf8c3EfKbM6nItR7glC+/65hLpzVtnSS5L91VuBNHuzmAzvJazUsFnshy6Bxs7BLrc2qUhXn5mnoYQs+FmZ+fqUuaeiOCKbDkeYPM6/YkuR1HujEK7HqaiWLWCEBNs3S98pRBXtC767SSi7g80Qs8a/3OYj9QramERfboiGLa/v3GTGTrn9bYOG2M7ClGjwgqnS1RcfzAcT0Joeg6QayktorrppurXERhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucrrzOtJ1wKzvwrAtKuC8aTIEH0RFhRvYLz9jruy9nA=;
 b=myGdZvn2A4xxYx8WmLwJ5DzRyHP86WYfwk2wWwim9/wAuOuGZgWY/s8cnqtBO0+4Z2FuQLf0OtoTVe7UcQ0VsACpI0zIOqoP1Xh3WuGc9yJfXYzzN/9V+lhhuXk0LMp3b5uGFxoSGRhfuvtkOZ21c9Ez+mPxXnr2vYwpDyNAkVtBhNolfDWMwFwTeudDeCLvLwKgNO5ycS+q5gt53agsliy+XQh0H5rzL2ZzDbqKB+tWmj76PHwHQPsYGcdywXcZxiJM9YXV8RtWloYfWrNMR++IP3+eL8PxNssvsndC93PqBECa6BMx6MCrp/s7Zfb9B5fRYyvudUwxCD5W1m15AQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucrrzOtJ1wKzvwrAtKuC8aTIEH0RFhRvYLz9jruy9nA=;
 b=RYSKkRDLytfBnNTXDMFcaJiAy10jUE9pGzFPekauAt/FIOE3LZaKrSNt9HKpVE2eqz7yU/Wp1nLh1I8rreF3taD5aBR992PYtWdT98+W+UEypLMW/yEWrz36bmYf8seJs9I+T6yAt49utfnpMg1+UGki4eQiVic0Q/RbvWQ1tN4=
Received: from DU7PR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::27) by DU0PR08MB9631.eurprd08.prod.outlook.com
 (2603:10a6:10:448::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 10:46:22 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::48) by DU7PR01CA0009.outlook.office365.com
 (2603:10a6:10:50f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 10:46:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via
 Frontend Transport; Fri, 20 Dec 2024 10:46:20 +0000
Received: ("Tessian outbound b519d6c64997:v528"); Fri, 20 Dec 2024 10:46:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: caf29a228932468d
X-TessianGatewayMetadata: 1mhTiMhiFYMpzbpdQxNinrksObBoVJj3mj8yz6t7oafrKEN/VS1ejEe2kZARRfRPcFxwLfZPKtOHKnVWJoLMjgQkW6ZjfPdHs9DHzhXNl9q5mN/lbmpoJ1Eqf787Rci2Nt90kx2Bm0FQxdyp2SJEbjvQTuBmXtKL6frpo06gZi2RIgifNJTxvXAt4GkWLd2awrq0jbfy5oRh7oarEWnxGg==
X-CR-MTA-TID: 64aa7808
Received: from L801c627d585f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DA222FBD-B492-4F3A-B752-AD3A79151BA5.1;
	Fri, 20 Dec 2024 10:46:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L801c627d585f.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 20 Dec 2024 10:46:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XU8jXWE67Uum7EiBJwVq4Edh6Q6oaBuYTkY1a4w9CGlIL0ujw6MFoEcW56wbuOcR5jYbIHJRFQTrVDjnR2KdFv1nHSYHiOqq/aEo1jor8QrYlnED5gNd5C57pdsEyN2tqTODhCTj4AdAAwMUXozQ7pyNnW0SXXA99JuwEQ/j9udT/Gjr+Iwi4QJ1wz8QzZBvRrF7lBPYYcac0wZ5U1ZgqElmwftLUClX+oUzZ62OJqHKZrRsb87RRIlj0mC7NOSb9xa6EyyQn4FUgqZQelCV1yT/J/9BBfjICWSVt2Ks77RBq2gSRc8TzaMD6rN/2ZOYOIdUgQLo9DZUnPcxyXD8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucrrzOtJ1wKzvwrAtKuC8aTIEH0RFhRvYLz9jruy9nA=;
 b=iid3aS+2llfCfSxo8ag24ix055YCG1s3pwvGUQ4p35iS9rbI4dhJ0Ne4T+F1XqYXT/VCTOdv0MjrkjLdp5G0/qWUT+AvI/0uX25fqhRGFUG5cYbyVZ7JtLh++Jxnuk1k01Bf9KQkknhS28kkmD+EskPb/VAK/HT50EVXUZCqHvBP4mEXqPMEppe3Oj5DVxBC5C3kJ+LvYswH0z+HZ4qdgtr1u5isnR/rDENZfCcydnD0JC6kC1JrNKFxi4CE1lJaMZA3b/zzIxqgl2Vlgmf2jIZeyihX3eJWP8wqdLpxjxYha2tu8KdGIlFKd5xhBoWCyLAqnJq9gBLqBwCC7PUygA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucrrzOtJ1wKzvwrAtKuC8aTIEH0RFhRvYLz9jruy9nA=;
 b=RYSKkRDLytfBnNTXDMFcaJiAy10jUE9pGzFPekauAt/FIOE3LZaKrSNt9HKpVE2eqz7yU/Wp1nLh1I8rreF3taD5aBR992PYtWdT98+W+UEypLMW/yEWrz36bmYf8seJs9I+T6yAt49utfnpMg1+UGki4eQiVic0Q/RbvWQ1tN4=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AM8PR08MB6563.eurprd08.prod.outlook.com
 (2603:10a6:20b:315::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 10:46:11 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 10:46:11 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Suzuki Poulose <Suzuki.Poulose@arm.com>, "james.clark@linaro.org"
	<james.clark@linaro.org>, "alexander.shishkin@linux.intel.com"
	<alexander.shishkin@linux.intel.com>, "bigeasy@linutronix.de"
	<bigeasy@linutronix.de>, "clrkwllms@kernel.org" <clrkwllms@kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "mike.leach@linaro.org"
	<mike.leach@linaro.org>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rt-devel@lists.linux.dev"
	<linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH v4 1/1] coresight/ultrasoc: change smb_drv_data spinlock's
 type to raw_spinlock_t
Thread-Topic: [PATCH v4 1/1] coresight/ultrasoc: change smb_drv_data
 spinlock's type to raw_spinlock_t
Thread-Index: AQHbUsxOz8IOz3S8LECaChqyC+YaZ7Lu8xqe
Date: Fri, 20 Dec 2024 10:46:11 +0000
Message-ID: <GV1PR08MB105219ACE97D596BA78FCEE8EFB072@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241220104521.809071-1-yeoreum.yun@arm.com>
 <20241220104521.809071-3-yeoreum.yun@arm.com>
In-Reply-To: <20241220104521.809071-3-yeoreum.yun@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|AM8PR08MB6563:EE_|DU6PEPF00009528:EE_|DU0PR08MB9631:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6e54d8-3a50-46d0-cea4-08dd20e38a98
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?VM2I/0hBrVEm3g9xMA1EXKp5wx5wIBA/mZ5dDC7UlgpN4cRLSEFT2WwpYn28?=
 =?us-ascii?Q?MuQSycaFYUq44QR1AvlkBB6Kpefze9HJP5EE6tTH8mQbosPoGjO/2bINoEFk?=
 =?us-ascii?Q?BJH7hPozv4sRui6dkw3ichf2Iq9TWrCYZAVFIUBYUmh5qTtifgjplkyJAizZ?=
 =?us-ascii?Q?WfW/gRXHXJhS8QI3mlHoXz7jf4RwPBOF2lMpESJBRpMmG0sIyWceKN4QQA5i?=
 =?us-ascii?Q?P3ESu/Auz/+apWvmlmxltjbVv/3vspPhgUlLjGkX+nW7CSGw1CX8TWYIKLwG?=
 =?us-ascii?Q?K32nksaCu53o6LUt8Lq+jhSfDa/QdDCPV4l/YOkejYZCkwIq82Z3OC0cLuqu?=
 =?us-ascii?Q?3N9MbsTsGHWw48lqycqndrYzpa2G0c6XjWqrw5m5fljiECMt+4n89J+sPjWu?=
 =?us-ascii?Q?DNij3tPt2qh4C5yXfZJ5OJeuy13ZriNIq8atWOmdQB5iqmgHMbsGRMFUy79P?=
 =?us-ascii?Q?Xyk0BT5NZtRx1CJZrQ8f+tpEfAY7FUujv9ivvHSoIJixuaZ3e3E8A5F46I3T?=
 =?us-ascii?Q?qkFPIoqSH+EO727Tt2mwn8WmY1mODSp3WFHpiiB2XGtMc4gOBw+XduO7OPim?=
 =?us-ascii?Q?JCwzQkji+7cyqYR4uoLTfkOqBOQnx/gCTaZ4/xkfomObSbfNak/suXElyKsw?=
 =?us-ascii?Q?aryBDhTIMPXr+tIMD4Xij9RXX7LRxlewz1Auq3iwZ2mzWVKgt9tmgyHubgx0?=
 =?us-ascii?Q?IOVztsA9NscBBn4Fw68QdJzN4ZzVwxaGF30uW5nmvIOGowhhUwveCEz+Xpa6?=
 =?us-ascii?Q?GSlHVJNcUnICO1ve6rJV8WM5qMNPvqZrfLs5XHUNt51omfrv9p4chYTRCQaM?=
 =?us-ascii?Q?FhvADyeS5A3bL27iGV9/mYQ7gO084CBEImFV/IJq6IHAuNgMsg2LRAh85Z5E?=
 =?us-ascii?Q?x4eEdPHMcEaPcQjObMM23WfHR5qZiMWq/B3mWLXaHUGijbFJBnhKHt6q8sE9?=
 =?us-ascii?Q?hTyapG5u7HudZhwMscL2nSy7YhEfJxsxkHKmhGsIoAqJrSfB4a/VKmY5dHAW?=
 =?us-ascii?Q?rq5yk35vB/rHlTqmZXRmrOC+kqVCKh+vNwa2cQn7LYK3/3s5bFOHDtNM8PB5?=
 =?us-ascii?Q?n09vTOzwZ/CNDB3hTzrgEFmrD11UrVVnthPrh1YJmrQSDkGcEj4lhVScz7h5?=
 =?us-ascii?Q?yVK33ZaUfyfYwkIzqK4YSrLwVnEnZ9DW9PUgr6FZOYnM65sfFfV2CweLW14Z?=
 =?us-ascii?Q?6ONTH0fljf5QzRgXWnhIyjQeg8Pk67KuzDYm1cKtfSGIC8wHc/zyw/GyJKL+?=
 =?us-ascii?Q?xEqxGzSKXbhn9RbKHKzx64mf0PRgJ4oV9Ol0iQWGEchWZQTghf7yjgi+VAhD?=
 =?us-ascii?Q?8kDmDTqKnp0oSw4HZr9pCyEQGlYgxtmUwW27sVEnb2lK2b8trg2tS3PTbWle?=
 =?us-ascii?Q?Shis1mFhjbNpyoFe3LtAJ2/8/HUqXSe2pmdFSwsYJUWaONjY7iQNIH6D8igd?=
 =?us-ascii?Q?z6J/4ToVWWZ8sfR7CUeo4bSe+bh63Y4d?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6563
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: aa696f76-4f69-403e-1113-08dd20e384c7
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|14060799003|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hNHcGfo/kB628Ecdh/7Kr6ksywRUz6J84j+qw6vAl7R2KSgeh70UrTQzhT0z?=
 =?us-ascii?Q?gvCJEJy5GSH0HaTYWuMw+olAfsiSOzo5h2IBl5fV4zN/U4UtTTr3L+rv2GLL?=
 =?us-ascii?Q?X6bnY4I2k1wyhsOKvdr0bv5ZbA5RBRZ1Evm4+WP4RVg8LaCAW1tqWol8QbZl?=
 =?us-ascii?Q?ahIwNmmlSv0J1X0sdjlU2rGSToCiVA9SiLyD7hqbbrNaBo6vynEeiZEECJEI?=
 =?us-ascii?Q?1r1sAq7vocaklIuCwsWet0B3YBJWiEFq3dNlyv9fk5l3ZkbUoYGtPO6YBAuo?=
 =?us-ascii?Q?HKvC4ryff6N/PQVLDOSIaWd3RPnNq/uF+k63DEIcjhvWEgtuyW6Xk4PfjfwJ?=
 =?us-ascii?Q?VAuY1LGdKlYpYdkdj3Jvn6/3U+30xEVCyWa8EflD9J/CljLGgysLLkOaxyK5?=
 =?us-ascii?Q?o0nlCXwnVBYaTpC830bQB5FDP0IEpN9OPWOt14eN0UadkVgvq673luefUNr8?=
 =?us-ascii?Q?5dlwCC/jEghfIPQm1NcsCzpRMhGXPKEpeRgrlhsQ8sg5uKXK8t55b2GBbT5p?=
 =?us-ascii?Q?Rcrj+/LClfAxIl6bRlivZfzdRlaMDcvhyqEXGXLonOxYAlSrx0kpxw9Ce05r?=
 =?us-ascii?Q?OxDShdXQrUe1Xl42Byj0HFtfmc3T/DvfvJuzRpjAzW/zrIhHykD68JIg3OLn?=
 =?us-ascii?Q?eWd1CapB5e7141LgW1GCliybHo0TpYbljfYMRblS5bJFYkmRGSba5c7lgxI/?=
 =?us-ascii?Q?vnzYRcJ7fv893Ei7c0mmQlssm58W7T9Sxwfcxi65hFEHJ745JpaBwBKUKdIK?=
 =?us-ascii?Q?Vm1yah+oCw5rwFBqNt3dbT4Flx0Mnlarilubb9HfXQTP/jYVHPUucixnWNJb?=
 =?us-ascii?Q?E49LK8brNQx12QGrXeaJCajT/cDPuWlPFpbYBS1/skH6vcfq+WLnpRlTMlv1?=
 =?us-ascii?Q?a2iTK9fx/6x3Bupwa/vJIj+yjOdB+fI8KodHHv6G9e54RC1cpRSQbdCf+G2H?=
 =?us-ascii?Q?9SmZ4iEf1+PoBZ1YKoAyHTMKWE7KHl35Cd1rzOPiQ9Yy6OQpY1xzkHZXU+1k?=
 =?us-ascii?Q?EO24Xdud09/zs8OV8/Vf8a8QGasEuQsS072+osovkXmVc04zrmruqgIYySLP?=
 =?us-ascii?Q?QYn1uwA11jqeTv4drQPaUj9+3RH8z2JQjG15/UTwNCdwbM6UPXJdKCoXlAxG?=
 =?us-ascii?Q?x+zwvcuTXNVUp36GAaDdlDXnmw3g+OAQNzpI9onggtXXOiSQBk/cCiLxqOXw?=
 =?us-ascii?Q?fzHp6Le0oyFzD7/kyS5+q5FxSSDxUNLVGSIRGcmpGVfdN/WuFOWnUIdHe7D1?=
 =?us-ascii?Q?nS7lIsv5sj8/PjNUlpqLJVIop3wArFWNiWHHAvF4MvpqR4pmXIPGxthjftO2?=
 =?us-ascii?Q?2K2DY1WjR6gIY5aNiPwr2wowLnwmrQDBI4MNok2nOfHlgm7l0O8+dYnDB0Jc?=
 =?us-ascii?Q?h4LBp5CbCDiap22qOce18fyVowWMX1fxZaL8kHYgkCzuEJmRalYp6C/l8oK2?=
 =?us-ascii?Q?YOUi6vH/UvJoM/rfmDpeviHS+CnjAv0+dv4wSYfSdBk4N/ixERGjJ86CkIIz?=
 =?us-ascii?Q?qm7wXoMXNz/PnAc=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:46:20.8601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6e54d8-3a50-46d0-cea4-08dd20e38a98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9631
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_024629_365490_214E5DDF 
X-CRM114-Status: UNSURE (   9.84  )
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

Sorry this patch is sent duplicate.

________________________________________
From: Yeoreum Yun <yeoreum.yun@arm.com>
Sent: 20 December 2024 10:45
To: Suzuki Poulose; james.clark@linaro.org; alexander.shishkin@linux.intel.=
com; bigeasy@linutronix.de; clrkwllms@kernel.org; rostedt@goodmis.org; mike=
.leach@linaro.org
Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; linux=
-kernel@vger.kernel.org; linux-rt-devel@lists.linux.dev; Yeo Reum Yun
Subject: [PATCH v4 1/1] coresight/ultrasoc: change smb_drv_data spinlock's =
type to raw_spinlock_t

In ultrasoc-smb drivers, smb_drv_data->spinlock can be held
during __schedule() by perf_event_task_sched_out()/in().

Since smb__drv_data->spinlock type is spinlock_t and
perf_event_task_sched_out()/in() is called after acquiring rq_lock,
which is raw_spinlock_t (an unsleepable lock),
this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.

To address this, change type smb_drv_data->spinlock in ultrasoc-smb drivers=
,
which can be called by perf_event_task_sched_out()/in(),
from spinlock_t to raw_spinlock_t.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/ultrasoc-smb.c | 12 ++++++------
 drivers/hwtracing/coresight/ultrasoc-smb.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing=
/coresight/ultrasoc-smb.c
index dc3c9504dd7c..26cfc939e5bd 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -98,7 +98,7 @@ static int smb_open(struct inode *inode, struct file *fil=
e)
        struct smb_drv_data *drvdata =3D container_of(file->private_data,
                                        struct smb_drv_data, miscdev);

-       guard(spinlock)(&drvdata->spinlock);
+       guard(raw_spinlock)(&drvdata->spinlock);

        if (drvdata->reading)
                return -EBUSY;
@@ -152,7 +152,7 @@ static int smb_release(struct inode *inode, struct file=
 *file)
        struct smb_drv_data *drvdata =3D container_of(file->private_data,
                                        struct smb_drv_data, miscdev);

-       guard(spinlock)(&drvdata->spinlock);
+       guard(raw_spinlock)(&drvdata->spinlock);
        drvdata->reading =3D false;

        return 0;
@@ -245,7 +245,7 @@ static int smb_enable(struct coresight_device *csdev, e=
num cs_mode mode,
        struct smb_drv_data *drvdata =3D dev_get_drvdata(csdev->dev.parent)=
;
        int ret =3D 0;

-       guard(spinlock)(&drvdata->spinlock);
+       guard(raw_spinlock)(&drvdata->spinlock);

        /* Do nothing, the trace data is reading by other interface now */
        if (drvdata->reading)
@@ -280,7 +280,7 @@ static int smb_disable(struct coresight_device *csdev)
 {
        struct smb_drv_data *drvdata =3D dev_get_drvdata(csdev->dev.parent)=
;

-       guard(spinlock)(&drvdata->spinlock);
+       guard(raw_spinlock)(&drvdata->spinlock);

        if (drvdata->reading)
                return -EBUSY;
@@ -378,7 +378,7 @@ static unsigned long smb_update_buffer(struct coresight=
_device *csdev,
        if (!buf)
                return 0;

-       guard(spinlock)(&drvdata->spinlock);
+       guard(raw_spinlock)(&drvdata->spinlock);

        /* Don't do anything if another tracer is using this sink. */
        if (csdev->refcnt !=3D 1)
@@ -563,7 +563,7 @@ static int smb_probe(struct platform_device *pdev)

        smb_reset_buffer(drvdata);
        platform_set_drvdata(pdev, drvdata);
-       spin_lock_init(&drvdata->spinlock);
+       raw_spin_lock_init(&drvdata->spinlock);
        drvdata->pid =3D -1;

        ret =3D smb_register_sink(pdev, drvdata);
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.h b/drivers/hwtracing=
/coresight/ultrasoc-smb.h
index a91d39cfccb8..c4c111275627 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.h
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.h
@@ -115,7 +115,7 @@ struct smb_drv_data {
        struct coresight_device *csdev;
        struct smb_data_buffer sdb;
        struct miscdevice miscdev;
-       spinlock_t spinlock;
+       raw_spinlock_t spinlock;
        bool reading;
        pid_t pid;
 };
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


