Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5825D690E5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/tpeceYyYHj0O55HsKb0pEgU6wm0e653aMoxVz0HYc=; b=0eo9EdFF666NUBY3sYHnFyKGn+
	TXo0eNqioj7GUJmAbwHxbglcod4DzeUypK+hebeCXzbZf6XIV4kCgjDQdtP9G5v5HL77jbCj3+0Mp
	Q/5loQJ/SB4Hp11gwnuYRBpz5wNSEJx7eZjfDy6CkkTZRGTs6MxR7rgakyhADFoyoHPBfINf7Fo2b
	Goy5Csx/aZMbh2t2SozW4nSMcN4kh6CItOGdaF/skIICpkEXCvvROfjWxbVuWGbfHAOliBBCYJdf6
	2qwDSQxF9UUAa4DHE+fmiZeJDrk95w+cSfEtg/OnLMMUZ2x4QYiRRQp5SuWGDxf8QCDdaGiWD7ill
	QqccFrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZ8s-0000000EtqI-1AZ6;
	Thu, 28 Nov 2024 07:40:50 +0000
Received: from mail-db8eur05on20613.outbound.protection.outlook.com ([2a01:111:f403:2614::613] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZ7t-0000000Etjw-09sn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 07:39:51 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=da1j0DQ4AjOn4gAmP/2OmMM9/mZ2vcHEoOYULdw6QvjmL7TexbiZ+4STlPF0w6x3bnKCnUH4/u6Ii2oIgP4vymy4maapAp/I+70M0cVaXrwKnXvQemPti0mMuK0HOWNGUydFV/epYef4tuvt2BkoAjiKyyBLXEesD4BNiCPgQSxOgwSrsYjFw/bxKsaJ5HqMrdHFhYT6QNoYbgd/6c2GkaYuYGOcuNoSjO0AglrWjjb9kLMi44h/ygjKb92w8xeLH/tM/CjDdwwmUJv7pcTaqPjEyXHc6b1Xy885iYsfnTKX46NAq7I3dBfr8vKKCK2W5GVU+8nh8MleyZtvMvMR6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/tpeceYyYHj0O55HsKb0pEgU6wm0e653aMoxVz0HYc=;
 b=bZmb55RQbKvYq+49ePoZ4DMWO60nOckasFLOWMPreKu8QIiidpIlaJBwfh5+6/0+fRUsvT+yd37qZ800uWdsEFb2S44HKhjkNqoJPAC+KgOgFcUo/OnnNgMo9A8Hw0K3VZCwPtFv4hB9ELSaQ20kd4W9VIp5h9INRSyfhsxsFYu1jNWM2GwZixhY6ppRApdwW9jmr0S7THnHEAYdiCdIQsQY559k/LY7KauTylrX9FZMxENjX2x5cD00cbU5DfaX0Y8dmPELhdu5/ARkdXS+OQZnqoLOwnVjKxehr7K/llf4E8qVVSvWpvtkWEgVrG9s1pEQSv9qIb6ROB92UrsSRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/tpeceYyYHj0O55HsKb0pEgU6wm0e653aMoxVz0HYc=;
 b=Y//h4KPTKqYGbO0Z3jPqpdy8DEGaGVX6OHAY+ywYqvuu5THC1BemrOM95D+NkLQNSPjdv17icqywhAO9pGxc5MhEe6jEQANp9qiumJvC+SILrLkv/oYWYI0VNMRHjcm4DIMAs9+I+Z4KC2nYkFBUoTBMzQp/ajuVHetUYHG63wc=
Received: from AM7PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:20b:110::22)
 by AS2PR08MB10294.eurprd08.prod.outlook.com (2603:10a6:20b:643::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 07:39:40 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:110:cafe::5c) by AM7PR04CA0012.outlook.office365.com
 (2603:10a6:20b:110::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Thu,
 28 Nov 2024 07:39:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Thu, 28 Nov 2024 07:39:39 +0000
Received: ("Tessian outbound 206fab1c37e0:v514"); Thu, 28 Nov 2024 07:39:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 21a83b3e99bd773f
X-TessianGatewayMetadata: 9uG6KGrLTr25Wepjcigbts01uv/ZZHjcm5OenUyd/jiZNAa9dR7OzSLSyXG2O43/c0skvTdyKTJIwEAQyqyj5er0LdAmGbu18emnIX9FLRdINp+65OO0vgm9IzALO2Vsxz/NnlgQkXWBnJIcOfT/wSFlxpZSFanZMizJUnhFYQNRqLgvOMpFn/tvi5bJ6kVXGR+iQAUFGCohPF+Ic+hXlQ==
X-CR-MTA-TID: 64aa7808
Received: from L75f4656fc1b4.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 639224FC-C806-4482-9B48-2365545EA815.1;
	Thu, 28 Nov 2024 07:39:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L75f4656fc1b4.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 28 Nov 2024 07:39:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1jAqv3IQOYTC7l0RWfEaLHZwb8Z3f+Cy07uW9buhDZ4O5ITvPGxO3S6Z51HKOTP96H0Zsazf788zfk7PgWid+AiUtd9MYxPssfMqpvNJoqWNF6VN7x44b1hjjvx/IKltXlwZumY5/wsWU7i3zmL2EdKQWxTjJARzOcKHY5ISUqgpaPPFOUAvqeTe847AFRy2Fxj8RyUYbgN0oycWoV36VTlf4qUOxXdjD5RBzy+SN5ykghnzppI9TSkLlkf/e0BU2PzXlYZ0HMLyXWCkKV072mHH6MyaMLGpXIWDpA2mho7oiVNJmcFh94IW4yZ5Al8Mloyz2+w+Dju44DU9K+nSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/tpeceYyYHj0O55HsKb0pEgU6wm0e653aMoxVz0HYc=;
 b=Oe4J6TK5FlgV6ynsxiBcImH78jPK5U0R7H5ptnVxp/EQo5oOoxGKdeBwzBkauMlVE22aJ85QgzrjdUuGr/7sZc8CLShpqwNAmjaCQhrZMqLJi7CHFhMeLzgt6tXdK/ZvoxOlhAIwflpvS2gIOwcnxNDSkwH/Jn3FOw46tIQFshnWrvgJBp+r2CnJE6UIJLXIXYQzaZN18mf/PjHvnYjwg+EyFKO3DBRj8z/M2SLy9dk4jYi5yUhwZcuRzsaVYprfhh4PdYdmRVhD5dtU2l9kAuL/Mntn9Nxt6xGjGY9IlVWypvED6YDvrU9SOn2UrFURwjyiO2UuzNOwbA/OC/vBrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/tpeceYyYHj0O55HsKb0pEgU6wm0e653aMoxVz0HYc=;
 b=Y//h4KPTKqYGbO0Z3jPqpdy8DEGaGVX6OHAY+ywYqvuu5THC1BemrOM95D+NkLQNSPjdv17icqywhAO9pGxc5MhEe6jEQANp9qiumJvC+SILrLkv/oYWYI0VNMRHjcm4DIMAs9+I+Z4KC2nYkFBUoTBMzQp/ajuVHetUYHG63wc=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GVXPR08MB7727.eurprd08.prod.outlook.com
 (2603:10a6:150:6b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 07:39:22 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 07:39:22 +0000
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
Thread-Index: AQHbPx8vuTignQOEcE2iGTau3pde/LLLYBwAgADpbc4=
Date: Thu, 28 Nov 2024 07:39:22 +0000
Message-ID: <GV1PR08MB10521520ABD7B72D92FD60DE9FB292@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
	<20241125094816.365472-2-yeoreum.yun@arm.com>
 <20241127120954.0facd34f@gandalf.local.home>
In-Reply-To: <20241127120954.0facd34f@gandalf.local.home>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|GVXPR08MB7727:EE_|AM4PEPF00027A5D:EE_|AS2PR08MB10294:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea58555-06e9-440d-931b-08dd0f7fd115
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?r0ZJaUAeflkHBaPZJUlZW5efRs2KY7MT+IJIyQEdiXT0bD0wtt4BV9bxZW?=
 =?iso-8859-1?Q?TwMDIg8zIGMLq5LuXOshvmTFSCiRpKCobmRYA1/SmSEL0kV5FGQN0N7ftl?=
 =?iso-8859-1?Q?LeHcEmg+SZUuKvOzZjhT0khesWJ2kQh+mJ08e3uOgTmbXWw/TQDEhLohJQ?=
 =?iso-8859-1?Q?gkwwWSe8XI17+yeqBUI9aXjE4shwVhkrlKmU80UBnWMkkUFOEmwSN6RDmQ?=
 =?iso-8859-1?Q?MPOa/cmUr6cObR1vHvPvxp00SdK0O9iOgfCzQ1GCfvEBaBoARn96Ev79Ga?=
 =?iso-8859-1?Q?7q7O9uv2CrpNr31MssUk1OV9Q9pgnp+P94kK6X5wy0nkAAMFF9ZTVzk0lQ?=
 =?iso-8859-1?Q?9ubjqohF8nVbDsclv3Riu4eOpcZIxXKepRENXAZMfrnJBrxvkKUrUopYR/?=
 =?iso-8859-1?Q?myynqhO2xki5W+fnc3mOIsL8w7yulM9p8z6hcFJ+j9tiOArKVustY8CfWs?=
 =?iso-8859-1?Q?4z8Oa9yX/uNvNNNDOtJKFJnvMmHPpeNPKK6vdbMYzTM5MPVFWvbvwaWwz0?=
 =?iso-8859-1?Q?2vWIVhLANRtCj5torTXQpR0sxHCzdONO4h/LYkyWOx/YC8eH0fcc5JBGAe?=
 =?iso-8859-1?Q?MVOJOQFp0JRr2gFPZJJFNE6AwkXWNbUVw5ZEw7wkCt4scuoG5GbNs4DRy4?=
 =?iso-8859-1?Q?qgXjMs05ehR5PrumadWeotNrSqV2dEpfeYJS0YMzIxfAEG/v0ImgVjn2VJ?=
 =?iso-8859-1?Q?PyFmZufB0iA3nYYbYY2sF5qhxVAKbJZbLl6d9M11LKVZl7TA1A5hon4J9d?=
 =?iso-8859-1?Q?l76Jdy18O/mhcqEsaIXrhMHheCLtA8mm3lX5IFq6Enqi6xmXtZn6toxELQ?=
 =?iso-8859-1?Q?SZRTuNNSv/wPLkchyYgdV0Cd0uiP5KH4rwJmW0jQo4WZ65MzC4hRBV/Rge?=
 =?iso-8859-1?Q?Zt9VlivNdjd4VX2PIAgqQhn8oMorSLvtvBsFGCd4+KaUQ7AWEetAs6Aao2?=
 =?iso-8859-1?Q?gg33t2B/ZcnFRbONd5S7N3Q0Gw6SZAT4fnctmNhTFLj2l9/YfbmefStKV2?=
 =?iso-8859-1?Q?I8VY+HS9ZyuKE0/qErDKlKKJAPCS/eUuIP82ErFatxsy1TQ+KGL/7ojPVj?=
 =?iso-8859-1?Q?7kkS4HtVRQ6lGMMXaPes8hm5ZAH0ZaHvDlNmzHxzjKbNLLQrlOhkJro58k?=
 =?iso-8859-1?Q?MdZQk7V8WSyQ4hxeVoUEDg2QrA0jHet+KYYIi21lmREUCpRzQJw5nwo0/S?=
 =?iso-8859-1?Q?DRF2ARzRph7/lKQdbrVFjgUDY8HmBzGxHItMENoXjJEsKDiP9HHW/SdDUW?=
 =?iso-8859-1?Q?8GWuJ3GxF5hRNq6osnjjNzmmPzu1VgQd6j1v8Br/x2OiuU2BNdzg2ge31d?=
 =?iso-8859-1?Q?z9IgQ7J+BNBaLov+kMQaupnaftZ3uDtP/KeXL0oh4qyCi6TjWjo8lUWNKn?=
 =?iso-8859-1?Q?XkdSTAh/YuQ6Ivzph7uluFsPt2gn/xsR2JuR6dBk2KqweNXl4bV0Mdt4CO?=
 =?iso-8859-1?Q?tuInV9XX3EfWuLO3WO585MB8IXapBqS3H6GW6A=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7727
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f1421ad8-e3b8-4fa4-f27c-08dd0f7fc67e
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XQrUd1zJpDeTuzXK4VuCUcIqCS9MOr72rtceDmnrBema5QW4WsgNIPg2Y6?=
 =?iso-8859-1?Q?9vUoFkMzRCi17ODLMihjQ/XNho43u9Xw5+rrjiFKzKnmak1YjNLW4KmTc2?=
 =?iso-8859-1?Q?MxRaZ7JzQZJEQCda/NTS72xffQmjehP4YGOF+wOc0/B6K4qoV0BDg6OaHi?=
 =?iso-8859-1?Q?gTzJZxfTuPBkExacQAH1px7BEsXy0TXSGtG7mHNJM2jO1zDhy1EQVsU3nT?=
 =?iso-8859-1?Q?vAE6oFD2OqfsGkCsGvA20+KQpEqdt4Gu8fDxMmtuqN+50asqC/tFTDTVpa?=
 =?iso-8859-1?Q?wmhIrLyZhP3XRon/nIsRUoae+7YXFRwyuMfTJSerCwAoZnJbwWREbjEX5t?=
 =?iso-8859-1?Q?XWlpKxQUZOeqVCWKu0OuyfCJidumZO25G3o1AycB93XH0HQWEtlOX50xlP?=
 =?iso-8859-1?Q?Y0n/FhOgBI7LKeGy2OBVPmVYwrmD0iRNHxJt9a33n0tfFhs0OVdfbmpaQE?=
 =?iso-8859-1?Q?puKNzpGx1RIZb8462Iou8G278QSJw+o8KTErV8p9XHNFEE/MdSyIJJuHW0?=
 =?iso-8859-1?Q?jwZCCUslQoh3JNf82mIv8+Kvt4EPSNRAn3Bho9qwR54ZLPxfVIX81NREva?=
 =?iso-8859-1?Q?LU9dSCfKDi/E5ekLL0cvgN38y1rFqem7beu2Lo+8t0Oug5somLSxE2K2K3?=
 =?iso-8859-1?Q?9EwOJ9LqEQcXFgDN0JD+0liC3g0LXxNVsvZW17depPoprM1xFbOgugn/wv?=
 =?iso-8859-1?Q?kA7j6i7ZN9BfYGHxNtp57b2vJ2zhzgVkdosy171HPB/Egsx0XC2lcgsFYJ?=
 =?iso-8859-1?Q?7BiY+z+VPs5TTv+KnAOZAIt28qFWIJKoBj5rmke/G867n4CthuZAZfGDlG?=
 =?iso-8859-1?Q?D29eyFuij1jb8TZJEdC/6OGBDim/IpRUkdtES/e8yqF1wfGGFB+5L3lxro?=
 =?iso-8859-1?Q?qzLSiFbZOB2bbj+14QhPF2e4ywxha9+ovHfpDbzpg8ppJHAjiMSXF7375e?=
 =?iso-8859-1?Q?dnzRIOUfUXewWO2LxAFV0hPXkvN7wn56OtrAJsXr67vzeQf6vpuk129jk3?=
 =?iso-8859-1?Q?KULwiAI+fpMoQ8v20MpRLUhgP3PCjeNzMyO4Rkrw2ojqDwePuSibrXKjN9?=
 =?iso-8859-1?Q?s6HNvo7WIWpTxMm1Cr7SaRq/LVqERkg8tqakaMJmQm4bIw+0S5NT5O2AAC?=
 =?iso-8859-1?Q?Rq5uLbxgSKblJlDJCJ68RkabouGVcTmekXQymKfuw/seYAMJg9HeSoO2OW?=
 =?iso-8859-1?Q?5gx3v2Pt5esecvB/RZvO5pYgd7o3UcBTMTbBygvz+IC56g8QBdEySKFfgH?=
 =?iso-8859-1?Q?mrFaAr2J4tBET7hUrmclYRlT5OCubLGJQok5ndu44i8DXT4RxM/hHbsynb?=
 =?iso-8859-1?Q?eKl5lHcFSFP1aGeSKFBERTtqg2u0QiDe8LFA/6Lav0nmR6hEyBlqpMh/oJ?=
 =?iso-8859-1?Q?/6VP3+EEYzQZpf8DNdFGCTj6Xw3h66uLl54qCIzqPTzktjGaJKMh8BvUCn?=
 =?iso-8859-1?Q?eUjPU5PUVF3eL+PEATfHD9Bybgs5XQPFQ0ARR8/nN/KUcz+9CUbsHzwb/Y?=
 =?iso-8859-1?Q?p+x1sf9+vF1FCzvrDUxxfX?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(14060799003)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 07:39:39.8812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea58555-06e9-440d-931b-08dd0f7fd115
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10294
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_233949_329158_1F5F85EF 
X-CRM114-Status: GOOD (  10.38  )
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

Hi Steven,=0A=
=0A=
> We should start documenting what is not real-time "safe". That is, if thi=
s=0A=
> code is executed, we have a loop here that holds a raw spin lock. This=0A=
> appears to make the time the raw spin lock held to be non deterministic.=
=0A=
> =0A=
> If someone is running PREEMPT_RT and expects deterministic behavior, they=
=0A=
> cannot be using this code. That is fine, but we should probably create a=
=0A=
> document somewhere that notes this.=0A=
>=0A=
> -- Steve=0A=
=0A=
I think it's quite deterministic becase the number of loop currently=0A=
determined by the number of preload_feats.=0A=
=0A=
Also, I don't think the number of  feats will be loaded as much as=0A=
it can do undeterministic behavior since =0A=
the number is not many and it is quite predictable.=0A=
=0A=
Thanks.=0A=
   =0A=

