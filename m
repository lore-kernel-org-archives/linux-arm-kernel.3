Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912BBC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvC+d5PgVuMNxTXMlLRFuZwh9R6de+79dCqOvI5qqus=; b=DpQ/G9JYWK1BdcRh+26dBKw1Ni
	g35uZT0HZS+JrdZHJBBW1ZL4WPVdy9RhEm9YsckpO1MmcoPPRfnEYZU2D0J7vsgI4sgwEFi+N5I9X
	E63SCMc1msIb02BDWhfte+sU3oSIETfuNbqwugouoSnxI/tLC6y7oB1/8lqc7N/pua7L45XaetE+q
	MPxpcJeqtjKTKPUWOTOCefvfu9F0yovSRm1oaCasu+jXmyqnvg0ZeZFAGY3nW1iMHvBBd7BaKWBNw
	PZ7xMbEG45GEKAlpPVoDiPYKOZY0oEKx3zowyKKwMp3seDrnk9l0puMF7gxXgmY/64r3BQ8B0/OI8
	f/+EnoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxxU-00000000GQI-3kSk;
	Tue, 25 Feb 2025 16:39:00 +0000
Received: from mail-db8eur05on20619.outbound.protection.outlook.com ([2a01:111:f403:2614::619] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvNa-0000000HR7n-46vu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 13:53:48 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bI6ov0UNMdPVXQfX61ZxVSo6YkdnHQHTHAQ5LXw7DC/rFL+IKp4ngvm0Wabt6kp57OtT3k6/KRbdZlYipzR2cjEl+6KzkGp9uiRjUgjv7GSv5jrvyFU4acSS3flUx4JDHhbsFs0xam3iB+SXmn16sf7+keozxoMnUn4d+47NAxqkMEU3EfIWe4wax9t0r5afJBHIrztSJyqaqNUu39+YUm/LPvyCgYyBHXIA47UBFr3XPk3imOrzev/95rHA24IT6Ej9AaAa88Kc4xCfuxFLPpgcPoSxrBaTETpm0ItCt8BU5MO9PKJSBm0agXyggbncX+Voc8uUAKzJ+69DguWz4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvC+d5PgVuMNxTXMlLRFuZwh9R6de+79dCqOvI5qqus=;
 b=mCxbHiEhVMdTVCPpaRmdqgumM6PSHHN44uzLL1vJ5EO+wpxnPs18H+WVjtS/nvbrQ4styMpQ+P997gSSrfTDtCfxkreLebot04Kab5x4TXnPXgVEF/cYDlBsdVLeC0Hm7rdafZjBsT98bpMTk7ypXcKddLQdIMwowzeeXTePLujhiufU8cBfi1RHhPQ0c8RNniKKxckITdibvbZUgoRj35xIb6XKxOg81xrEwBt4PjVPKujoqeIrSCk5osN+sW8L7rkFdcKqZOZ2DW7r77ZsgoMityfU8fZqSozqzyBJlfiSrIz0tl8HjW+wGxiJkSSQqgK3iaSyc8QHGVc7Ze7lbQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvC+d5PgVuMNxTXMlLRFuZwh9R6de+79dCqOvI5qqus=;
 b=JW1ETh2nVispAx8KTGVyoKZ12XURKXBOeGR8RCa26FwAllZe48Ymq4us5brL3qjUSUYr4sZhSK/q3lUSqtpf39j0/2eUWfYSzA0zKFmfUsN+JHNiUUKz+yU6KoeUr6eScD7RIolbEgMZl6MkWquSFKIje16d4TOCf43euRdBAHE=
Received: from DUZP191CA0040.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::18)
 by DB9PR08MB8579.eurprd08.prod.outlook.com (2603:10a6:10:3d4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 13:53:39 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::f4) by DUZP191CA0040.outlook.office365.com
 (2603:10a6:10:4f8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Tue,
 25 Feb 2025 13:53:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16 via
 Frontend Transport; Tue, 25 Feb 2025 13:53:38 +0000
Received: ("Tessian outbound 678e42ac23ee:v585"); Tue, 25 Feb 2025 13:53:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f3990364643ee3d2
X-TessianGatewayMetadata: HIIHIEr2RltcOeSVcrWdxBeyCedQ2VE9NtVB3loUAh2hWZ3xsZqUNcI/RPklh9RWdfU9jef3o+P0iUsPhoJ3nEUlsKQaF81bSid26Wyg9yZBEWDJ+LIlSAJWx5jJWmAZf7qEoZiXLQDMT4fO/mXDFQ3QY2/5gKlrWzO1Y5RWH/aNw/AHvulL7lzCHJfhXlb3LcJcqYnojgxMzkOJ9jsizQ==
X-CR-MTA-TID: 64aa7808
Received: from Lf76c0b68e131.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BE01BE9C-1BEF-4BCD-85E7-E2149E05173C.1;
	Tue, 25 Feb 2025 13:53:31 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf76c0b68e131.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 25 Feb 2025 13:53:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJEo+diJm/w8ccvTC1522QuoMHge0+BK8nWBc/fAND21LvGjuj2cYKmUi8Ecj4fbdEhAsHaDSMRce4zgDoJJgleUh6SkPBQuGJwznObeyqF984NtnUUB4gIYVuM6Tgg58pe3hiqtwsSl0enij/jsEVUi7I8I8wl2S62l/fZQGKZixxSuf894K/Zxz7lzeRsmmc1q2lM0Uoiudnb1fBnxT4eszP2xG4mdPo39wcl0+x+oJNgwCzx/GBS4OSxT9ImCQMiNPkBqbRFbGQv0joRFJll5DoZgvawFjkEavu2M1XOkZ3aoOb17OZ48Y5qrMc/3G0009CfPlLwVWzROXHfiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvC+d5PgVuMNxTXMlLRFuZwh9R6de+79dCqOvI5qqus=;
 b=IUlsdB4FAXSmnxa3R55LPSHIZCXUrR3gJtAF4/FdHK2o07xVgsxkPCftArL7xfniL/dfFIvzkSz3YgdM4oPEnJ5jNGeWVJZg7wiP4uj7UQK4XQ2vSaq1iqSbB1rfjLXXom5CJ0kBsRI8KGejWgNVesr1hPrIFM0rpvB6FLuJv27HENWbHpihD04AKjiE3GV7lj6MCQbMu1IQg4TibVNHx8/9/Wb4am8QtiCiyE5zoDkhDteYyhpV1zrON0sM7xfSX35LQdGN+lGAVLQijw/QFyFdFpU2njVi4wUI3121coh3aoGfqK/uI0tnrDAKBrYCZ/dRdJgnphEvL2Ig20cC8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvC+d5PgVuMNxTXMlLRFuZwh9R6de+79dCqOvI5qqus=;
 b=JW1ETh2nVispAx8KTGVyoKZ12XURKXBOeGR8RCa26FwAllZe48Ymq4us5brL3qjUSUYr4sZhSK/q3lUSqtpf39j0/2eUWfYSzA0zKFmfUsN+JHNiUUKz+yU6KoeUr6eScD7RIolbEgMZl6MkWquSFKIje16d4TOCf43euRdBAHE=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AM8PR08MB6402.eurprd08.prod.outlook.com
 (2603:10a6:20b:363::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 13:53:30 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 13:53:29 +0000
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
Subject: Re: [PATCH v4 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Thread-Topic: [PATCH v4 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Thread-Index: AQHbUsxKiei+YMVvyEi0xBNF5qncLbNYOPGAgAA6bCs=
Date: Tue, 25 Feb 2025 13:53:29 +0000
Message-ID: <GV1PR08MB105213206BC42F2968A2F638EFBC32@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241220104521.809071-1-yeoreum.yun@arm.com>
 <6c00cf65-af68-49fb-b762-675186f45abe@arm.com>
In-Reply-To: <6c00cf65-af68-49fb-b762-675186f45abe@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|AM8PR08MB6402:EE_|DU6PEPF00009528:EE_|DB9PR08MB8579:EE_
X-MS-Office365-Filtering-Correlation-Id: 2308e5de-c566-442a-cdee-08dd55a3ce4a
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?rnDP5ClQ3LTBVegLFRLy1JkJuqckqmmAWA92TxkIUUdTjQteAivK6awUHL?=
 =?iso-8859-1?Q?U4KPN4/EnFFZGbRQBbw1th+qnxmr7+kaQFgyyzb9cOrPFNdlMKOoYu9o5j?=
 =?iso-8859-1?Q?IfPBX3Q8na+yPyAlv/1UedvQUdd3r1+mJn4TexeAfICGxhG/n1++Mr/1Ak?=
 =?iso-8859-1?Q?qOA0bHnYF2aFWHV1FtFsAqiAGpfP5kAevvkVndS+MjfeLYxq/MD7PF5qS7?=
 =?iso-8859-1?Q?QjT3FkMt+dP665UeYIdbtOB2f4sN/aBv07wLsGLoVy1lloSEzkFe4C7GJ4?=
 =?iso-8859-1?Q?Xj98TCGyrus1frs74OmkC/e+jKU/Mohm1o7bMBpJZ3yvBsKmx+OMd/ntke?=
 =?iso-8859-1?Q?3wnSY2RYAs0yn1VyMMJA7orVbY/VsNi02q5qAY/m0KCmRezUJHNVOYST0W?=
 =?iso-8859-1?Q?hKVEw8di9MG+oY9OUCMkEyprkToGY56XWMAQCdUfMxyZNwzOPeYgZEfRrx?=
 =?iso-8859-1?Q?YuEsXnQUHLPBHLqfgLyV4ESqPzlBYydKkOs46VBxb3tBH2pVuMYVzVf7Z7?=
 =?iso-8859-1?Q?dlr7eCuzJ9o3Q3+MUonc4N5lYYGw8+nBd2nxmrpXyVb2pdRhMblZHUFWVi?=
 =?iso-8859-1?Q?MTB1mntMAvW0kj/k5ZoVCyYgBCaEE/TsOZkT/Ris6RzkyF4nMPW8AIKx+n?=
 =?iso-8859-1?Q?LL0IbjZWISH4Q3kIVqxNPCs/vRVyjpDlekmtyUJR/tnDSLnOoEsuYrBcnG?=
 =?iso-8859-1?Q?Uee7B3TIcI5l8ssFiO3TZgPsO0UXJnwYLKBoAZY5yGDdMWZtrf9aaFkaut?=
 =?iso-8859-1?Q?wN19ueQ8ATllu4keWZ50YtkVxlk+3n6/iXYYuCvHaB4d7tK9B1obAGgP18?=
 =?iso-8859-1?Q?1TDX/Ib52xJhs3/dAsZ3POAwjFjOp63xgZcQCsUSKDaCusK0bI2Tv0pHUm?=
 =?iso-8859-1?Q?A2JrSCBpFGurF9tDmnFtXybjMuC61aEH5NspdU8Rx8WQTsQMAmxagOdH9e?=
 =?iso-8859-1?Q?59eV5pnSNfspgcErKH6pGjXtzPSfmdLC7gm7t+i6hn54EHQksmJwvOHomD?=
 =?iso-8859-1?Q?m8hOloaP8PPYnJmEoMDlUDxVv0WdTVu8L2au4eQgCnxAIrwWSIlGMbJ3bF?=
 =?iso-8859-1?Q?HkwYdzIl/lHoO7bTu9wx0neQqVgHcD2qW+bdBFKmIrMyzdGbEHeUhj7aWj?=
 =?iso-8859-1?Q?emv5vaiecybN+nH8jRoUzIIayhjno3aIGCCbK9VeTplZ8txzJfefMC9ekM?=
 =?iso-8859-1?Q?LdqlKpj+twIbUap4EgS/KkBZVJNTM6kXhSPqtRR317hkgcMoHy2MWqbeda?=
 =?iso-8859-1?Q?VHgUKdfim9vtfNUxKp3vhmktD6IhaTTfDFWSVI+raEXuqnYeWKZu69zeCs?=
 =?iso-8859-1?Q?Oldw+squuhbSQ7Q8CDOoI+/WIPc9Pah+JEUd/K3ZE+PMdDqCbHs3MjXgSr?=
 =?iso-8859-1?Q?dkhjnDx5lb1dX3ktPl/qfggcDSAFgbovOJWG1u/057rSvSH3J4GrJ4BaI9?=
 =?iso-8859-1?Q?oCEO1+gFktVse9l2u0YLkilpAKz3vPg5uEbxMpgayPLHLoC0h0mI5OkOfi?=
 =?iso-8859-1?Q?CSoUKUeeYWuB0DVmJ38bPS?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6402
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 96aabd7d-6208-409f-f647-08dd55a3c91a
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HjLnkyDrddzIxjYSgTai2Yfeyh5+TukHLos+7ASJoyJsEmM60xuSbcc4z+?=
 =?iso-8859-1?Q?HbN8KqMpOuuEBxd1Hc2r+OYK6vKkEm9L0D5QDbBCpgol4Gi5nLHCplAQCZ?=
 =?iso-8859-1?Q?IUAVjXUE3PqucEQ9kV0gJdRPjNSKxW52zD+ramDCMA3XpxpWBlh3WsFQeD?=
 =?iso-8859-1?Q?hbmLio0VW42HJjNPW8d4YgWf27E7/6F0ofRISBCOZWXJuEtBQS/oT9svYN?=
 =?iso-8859-1?Q?2gyvu4Q39OEFQylrF29l6RufyvIA+Lm2HY3Wdrz9NmVwA1x6ktVbCD6KPr?=
 =?iso-8859-1?Q?Nj6uyxaRAVCJv5cRE0A4iRyyc6lB5lhO2oE3Gvs2N2aBDMfD3/8KWs1g13?=
 =?iso-8859-1?Q?EHt9CCDoWP/vdtEPKs4izebwmCrDWfS3hp0Hck0szgSFXuc/WA34G4Q3iM?=
 =?iso-8859-1?Q?C2OgMtW5620O7zUpCwV9+18bGbRpiEftB7DhGEFqfHcZqEx6asA23SELFp?=
 =?iso-8859-1?Q?bNRdDfPVIKxSOKLGidScanmLKZO+OPCMMHHlxxhCVysYe5HHDlqNfz1A4g?=
 =?iso-8859-1?Q?DxuPJl5Uos6mpKkWHAgCLu7WixtaTM3aHKSLU1cpUbzzTb0PSSQwVX7EXf?=
 =?iso-8859-1?Q?amjMOvv+Nm+NwPgzScTPKROyHUEgNc95KYNP0UbCu5/VzFgPcKj7rolEE+?=
 =?iso-8859-1?Q?ll4ZdH2pfGuoNihNhcnUl1bI2ELDV9sxtXCj46PLFDVqWC1Od7GgwrPax9?=
 =?iso-8859-1?Q?xYY6GrTPGy/j+6C0UzqmptD7iEj2vXoZY5848xA4mwU/vSthona+rayCYZ?=
 =?iso-8859-1?Q?L3pI0jCrmU0nUh0QfDjLJrfx320LZPvolENzxYssq27EFysUchqa+yuZeJ?=
 =?iso-8859-1?Q?gfHn4FzBTCEmAbv9za5DIHZRf6zzARAv/j3h4KWLQLXs4Sp2LLnidmrc9I?=
 =?iso-8859-1?Q?0+i5HUS9lIWiawN6P5uPc8Cy/godWHf06M5CxZ33w2V3iO3egQqLLFXQyJ?=
 =?iso-8859-1?Q?ciTeB3R//Et5tO0bholESGqxpZ7Ty7Jw+OQtnCZfrYUkb0VjlVgsh+v2ii?=
 =?iso-8859-1?Q?1/Ycv8p+7dhavS+xwDhLAcvKDj9tsQBNNcbABWegoYwTBWca86t5ORuPvx?=
 =?iso-8859-1?Q?ba4CnFFmsblEqi2P3Jadq3hV/UO/i0QCwkTEdY6CfXJsw7jCxkqUAQD/h9?=
 =?iso-8859-1?Q?oSAJR3EC9dqR2pV6rKOtj13BTAIJOb8aRjREc//vEXXpuoEJ1X3nqb1UDV?=
 =?iso-8859-1?Q?9lLIkTOwa2ySSlpW8fe0dV9Ktv0j1n0wtkfleqDEl81g4yEoup5HJu2iQ2?=
 =?iso-8859-1?Q?W3AZs1/1e91AWR+ha/UmSaalcSCnWHWdJY6Kh4gmRSu5FuPE+d2KbM6K2F?=
 =?iso-8859-1?Q?VGjXUyJ7u5UhG5ah9rTiUTFDRty40OsdA93Mmh7FKGVewL0dJpvjDqtrmC?=
 =?iso-8859-1?Q?82q7tHVBqykhn7OvI5g30yj+QXTwadRNwLHarJHsivkP/xXRjJAd08f41W?=
 =?iso-8859-1?Q?BGcK09ImZt9w5AQD+Hazb9FKgtOygSH69NDmHPE8DcRVjUrgnK+sbeDczW?=
 =?iso-8859-1?Q?e9l685sQM8PuY3sCEKley9BJFhpMmCh4qNg1BpiZu+mUmwy07Phwp05zKo?=
 =?iso-8859-1?Q?iFODnEU=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(35042699022)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 13:53:38.5048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2308e5de-c566-442a-cdee-08dd55a3ce4a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8579
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_055347_163015_6B8A76D5 
X-CRM114-Status: UNSURE (   5.66  )
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

Hi Suzuki.=0A=
=0A=
> This doesn't apply cleanly on coresight next branch. Please could you=0A=
> rebase on coresight /next ?=0A=
>=0A=
> Cheers=0A=
> Suzuki=0A=
=0A=
Thanks. I'll rebase and send again :)=

