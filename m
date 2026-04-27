Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F8DFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asi+LzmzMUf1FUl+laLPF527xXTHbM60SlgAZo8Yloo=; b=ObCHxRMHj+X09Cz8hTrjYHgDob
	rnAZ9MEYOOIcRAnGUbp78cDQmt63q4ANWIHKkopDUUgFqt5QQte6vE+etuRBtAlHoWiMfUb5Kl9cA
	dlgU8C8YfsWkVukirtqMUjBkjn/kijHc9WwBYHCShr5ojof79A1Azh8+qt0iSuoJeKGElFJKmQV6C
	oMiA+Hb0gKOOg1mAgmoq392KxaKIuTYJscKeytCPKDrkNmXqZz/NIKXN6UjLnqe0f3QdJvq8pWpr/
	U479xPO71ZGiCI7eJxPZLppEMACwdPexZqkd5KTnYeBRs8SyE0obtKsWuU/z4NEJBZnDfU7Z09BoV
	hF9DgV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOUf-0000000HGy0-11j0;
	Mon, 27 Apr 2026 16:07:33 +0000
Received: from mail-northeuropeazon11012004.outbound.protection.outlook.com ([52.101.66.4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOUd-0000000HGxO-1uOR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 16:07:32 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UwhVbNRRtFZQgbNnMKhVjws9p3YYND4xtuNoMFBAcBw8jVzaSjnCC5xiGpLdFHsTWdlB/ulQeRxduRKIcVMuAJ9jtJfPiLcuDCzNq7KfEuxjmCcVyWwdrvqSCAEvvxiPs7t8oedOQuHv7e3Zu/4KsTCu0hDTqsb4PaSPMW+Uf/DF/OJzggwkujVetvIsoL+L+9dnShvVFxoSHhBgRrbU+SMSd4na85Iq/bNQ43iJJqbh2C/v8Uo2ZipBDBaAI+1yvt6LaFn5EWaUyUdxtcNpteIteo3DfkfdKKA5R8Sy8Yt2CajKLlaCHTycUDsZVxzmUQdJs9kNhI7G3vboEDK2EQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asi+LzmzMUf1FUl+laLPF527xXTHbM60SlgAZo8Yloo=;
 b=HOvgkSycKJ/OWGgXwPhHd19Ciz7LxrY1/VAkI3xVS2AMrEmcANJpl3DbHT2Am1bcl5xBDlpB7uenYWobG7tERGW2EML7CV6I4yk98+ZAKC/hjezbNtj4dTR3Doak9QZU4KUAhVGv+fUxh/tTyLhznD07WKukyvupaucs/qeBurW25KOnYsp7dOMdkqI6BCAH4mlz0SZf7YjC4z8zr65uE7bz/FyXmLJ+o6XeU+mXEJQ/txINhfeCl4ZVQ7GigNKqZ42dWL5qKb/x68mWVmfH/w7ayWmHK8EKINMwvTO7tMRvAHsOnP/G0bV4weAHin76GS6lfnQ1xKmPD09herHx0A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asi+LzmzMUf1FUl+laLPF527xXTHbM60SlgAZo8Yloo=;
 b=NaIOthhvsL0r99oRCCyMFuBgM/ZgY6MHz4KPEhCKxOhVyqQR4oOLrj8zzCDB9fkoCT+V1+Up3jq14mpe+8K3NFfhyl3ynVr64mnfsGX4k5sBQR3gd0InMSZbpjpne4SvXqnwX2hkDF16u/c+e+ODNhYi4dszmS/j/a6mmTIDSes=
Received: from CW1P123CA0004.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:293::15)
 by AM8PR08MB5634.eurprd08.prod.outlook.com (2603:10a6:20b:1d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 16:07:25 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:400:293:cafe::3b) by CW1P123CA0004.outlook.office365.com
 (2603:10a6:400:293::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Mon,
 27 Apr 2026 16:07:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 16:07:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z97RTjOkkGbIyENCuUB34ZM/55v3Zgs+Gv0yZRu4iWy0E4oDRQFRp/3Dd5VZhkMOddKp7/AD1ZF2VlHWyphxn/LiOT2POXR6dF5oMr6xHDqKdkvpq3LPCGIxvitrx94R//lSCVLJBvZ8r0tzytHVs8aPB2gi3WEQepvlELODFevK/FRLu8PcHB0g9AYlviqExuoJW+CtAbxBS8QY1c49vmONE+YMolWL62WU1bD2sQ73BsFOLJZ46GGLcAfpV6TOhoIYByv7uyYFialnmet6tUs9cpXFYGvpLzPihBRir1QSSPgvr5qk0gbIgswCoK9IwCly7YZFkp+2X439wuAxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asi+LzmzMUf1FUl+laLPF527xXTHbM60SlgAZo8Yloo=;
 b=TsdfBYLtC5vm1wdOPg7oaFEs3IK9kopQkUjw4BOMzrefT1nYobZCB8w5YZudq+C8+4Ypaf8hYb1Ch5VjWP6WGEgbvi3BDOFd+OOVMty/CZUQuPgiZHSUJag9l/r0EcRPqSpo1aea9MQAFQitvY3NgxCWldLwuiyKRmJSmhoGkTBFs3w0WsLg+EgTFTilfTgXz02v8ASvfP0Wm2gJ7lPflgzptKyq72WKs2KZnq5uV/XATXQXrJFQJVHjJg3cL+EoG5Xiyf32LLyWy5mGz8pZpb4t8U5vMddpopBixwxiVQVNBNsRl9UsDvnAf9hm0LZ5HHuJq0Xhx25//U3C7fTGgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asi+LzmzMUf1FUl+laLPF527xXTHbM60SlgAZo8Yloo=;
 b=NaIOthhvsL0r99oRCCyMFuBgM/ZgY6MHz4KPEhCKxOhVyqQR4oOLrj8zzCDB9fkoCT+V1+Up3jq14mpe+8K3NFfhyl3ynVr64mnfsGX4k5sBQR3gd0InMSZbpjpne4SvXqnwX2hkDF16u/c+e+ODNhYi4dszmS/j/a6mmTIDSes=
Received: from VI1PR08MB3408.eurprd08.prod.outlook.com (2603:10a6:803:7c::10)
 by VE1PR08MB5792.eurprd08.prod.outlook.com (2603:10a6:800:1a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 27 Apr
 2026 16:06:22 +0000
Received: from VI1PR08MB3408.eurprd08.prod.outlook.com
 ([fe80::6daa:d2f4:acf1:84ba]) by VI1PR08MB3408.eurprd08.prod.outlook.com
 ([fe80::6daa:d2f4:acf1:84ba%7]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 16:06:22 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: [PATCH 01/43] arm64/sysreg: Add GICv5 GIC VDPEND and VDRCFG encodings
Thread-Topic: [PATCH 01/43] arm64/sysreg: Add GICv5 GIC VDPEND and VDRCFG
 encodings
Thread-Index: AQHc1l/K3pEt7aNDJUWFgXONfccmBA==
Date: Mon, 27 Apr 2026 16:06:22 +0000
Message-ID: <20260427160547.3129448-2-sascha.bischoff@arm.com>
References: <20260427160547.3129448-1-sascha.bischoff@arm.com>
In-Reply-To: <20260427160547.3129448-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: VI1PR08MB3408:EE_|VE1PR08MB5792:EE_|AM1PEPF000252E1:EE_|AM8PR08MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c1eb76-88ad-4372-6142-08dea4771287
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|11006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: qD1+DL/5btEAh9mIRwKJq7Qj05FwvIeH4vlz0vgvngB6KJa7i37KiL7Rugjss9AhGVknQ0NXACbH3lu/+CQyVIaYTKl2+SUuCf0x8wlqft20eyA3sKIldMjkiLtSUovlgyHiKc2mNCnufs+W6TVWc9k028q9b20dcxYkYqia7hITn7KucMGklhntp+56aCrCH6edsb5CanIB3WZTyXyQ6hDYxmDniWDnAAGeN4uO9M2NtczfEyV7BNps18El6jpK+Wg4O850fUuC6l3ijAzAVvnCGpFXqLEmIa5DXwkdpepF0t7gd0edVHH7j5MdTpT1iJz9NH7+a+qjLHl9JVVgDPTJUQrQIUqkMYQZwKx1/g0z7hv69+PrWEdpyurMNwUVyiW8rQxXU/zk537QxCGdlsRZK65CB0CHuItnglT414bCnbVtAfWZ070jX82akBKnkfTcwfDfA2aGyD73QoJi7hYgLK7Hf+LPfUTgVJLTzXJxCkv9t6dBf2bnYUQ3Aio8yKnyVCbqKGsaxvhCJOH8idKNT8ZPcdm9K/te296+va6PgUXQVvs3vPl0/ghgLiMMQhxp6Zsu2j/eV3gSutLQcTAOrBtOpJvu/UN+LPHALqj5Att9aF0hbFC/cBq9eBZgp4ICQrhzqRWjQ4WNnIgw5cBdjW3RDWiwvFNznloqlyitLDsVDp0d8KiwQxQ6bTqI1A7T5hpOm/ofgQLe4hTnB2Z56l9pOkEYh/hD8m/wfMiDS86afmyJpR+LSHIKeh3jeGpUSVCg8T9B+thlEUnIWImgZ9UdT38JEXZWHseBhDg=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3408.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(11006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YrUvqKBSrpbOxHjtT71cwAFV/lhq49Fophm1Yztt80m4sh7nWHW0rt6slrB5NrD6fsjDLMwoqyxlz8UMdcfe/V6puDt2c62LjW6Vaj+FxSp9mR95IGOc+W0wqSe1Tm7CSQIsBFNScWjN3eNRckUXZcJOs+BwKdGbP9vPjK3vYZwCKuGsqlmo/PEpz2XLzU0XEcXZTlsw+FTAqmRKZesPWjPR4Db0x5MzukO1PleH7DeutGvzI+tmPUsUA8ZtWq7Ydgrz5dd/+1bwCp4S2PbEDBghAAfuQs5hqRq7lCFN1bpAvrEoW0CjNswh/H/RD5m0SuRkH+ryJhXzhGnbAl54lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5792
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: edeebade-f9e4-45bd-db9f-08dea476ed28
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|14060799003|36860700016|35042699022|18002099003|22082099003|56012099003|11006099003;
X-Microsoft-Antispam-Message-Info: tgw1+wKMrGWg3r6Um4dAe15zWy5tmOKM3q9+heUvYMSMm6DHu1b2B1VqHKVIzrqqIa47DERoMkFecYkeMJFEtYo4uNz74AVTl60v6hvM3iJZcjlpeOO9Fn+GjJD89+6fT9qHKtjKJXfX/hVdBAq0JjNZJt5lirfr4Ts2ISXTbsX/XnA0958Yj6PnJJ3kSx06fFEK6cbFrrcl8BdDl6b+h02U1rapVr3HiJRjlsffE8GfZkrmlTC3Sg3UFf++Pe/j9Z3AUHWZ/5UrrjE6b/RaUWxMre4yj7KTZMQu47rvuHMeXVj8DcpctyWh/0AvN1RcwvS1l0UMy/LfSJmOO1mhqROkEGMFaGiHHiLTDdKDjCZYYEHeYKCT3PBTofv1xQ6KBEsye+l7xdnKEyJdcHGsxWnoLFtZlKgViAiDcYLZFEnPevCMgZPMiRKibcnxJP6mZG8oXi8K2vEAQIe7Y7z7+B/j3UrsNJpCUinUM7gyjyyL/6kaw0f1p3uD7Pti9RF1EhCOWju/zUB1nmEN8/VisHAmUwb9wXyW/DnhKze1nJotOKTqccrbuxKDI4unXm6+5N2SOqb/dm/NPyCOh5ywvifQPFxdQJStjIXoMfP0mqUEpsozO1GmWQN/v3wI+ZMy/zZoTAv0vthMBwLFpOegWS0xPnc2igAoxeor6fylwkWwQoPY0390RmTn+N5ZK8VO8uY4DtmqZ/9Lr4t2Jn8lJd7JWiQQyla7+wS+eSP5cB/9WOJmDSTuY5+KiEEXqIs2bvbAunuThzVhcrA3DnRYRg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(14060799003)(36860700016)(35042699022)(18002099003)(22082099003)(56012099003)(11006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +4gIdflzCDP3nPRMBdXdbYNufTR1dfJu0JmXOhFWlZNeffUWYLzTPcqQ89PzbQ1k9infF7tNQ5xaBrdvah1N+2ZOrNxtRy9n8wXOcc1+vxmcRqIBDbC4JidUrLrdJTMWiIzlhcK7odjnC8AfhWhwcQZsR9/r2lUHyLI7roXnTA5Iwi0ZVb+wzjQbusknVzFql8zHkomUYyUN9zF8sww6OTyryCSYifWvCbLPg4nMVwpwEu66OVMDZY9+PZY8OgToX7JiR5UI9iN32ac53mCRby1Vw2HxapYK4gwkESLeioIwxlZJacGiSHGSR4HaMBLIq5MqLOrlJHEoV4FuHGkmCB+P8OE1yhwheBSr+6n8yCicptGigJcHhPICg+6Fx8OWgebQ9mEzeYIQONy3qRBYV+HbWFcPoFpfHj3EZTpurhkmF0I5qlRA2+JU/o+naYqZ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 16:07:25.1252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c1eb76-88ad-4372-6142-08dea4771287
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5634
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_090731_497610_A82F6368 
X-CRM114-Status: GOOD (  11.41  )
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

Add the system register encodings for the GIC VDPEND and GIC VDRCFG
system instructions. These operate on the virtual interrupt domain,
and are used to make interrupts pending for a VM and to read back the
configuration of a VM's interrupts.

This is part of enabling GICv5 KVM support, and is required for
injection of SPIs and LPIs, and querying the state of in-flight SPIs
to detect their deactivation.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/include/asm/sysreg.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysre=
g.h
index 736561480f365..e00b32f0a8d9f 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1040,7 +1040,7 @@
 #define GCS_CAP(x)	((((unsigned long)x) & GCS_CAP_ADDR_MASK) | \
 					       GCS_CAP_VALID_TOKEN)
 /*
- * Definitions for GICv5 instructions
+ * Definitions for GICv5 instructions for the Current Domain
  */
 #define GICV5_OP_GIC_CDAFF		sys_insn(1, 0, 12, 1, 3)
 #define GICV5_OP_GIC_CDDI		sys_insn(1, 0, 12, 2, 0)
@@ -1105,6 +1105,22 @@
 #define GICV5_GICR_CDNMIA_TYPE_MASK	GENMASK_ULL(31, 29)
 #define GICV5_GICR_CDNMIA_ID_MASK	GENMASK_ULL(23, 0)
=20
+/*
+ * Definitions for GICv5 instructions for the Virtual Domain
+ */
+#define GICV5_OP_GIC_VDPEND		sys_insn(1, 4, 12, 1, 4)
+#define GICV5_OP_GIC_VDRCFG		sys_insn(1, 4, 12, 1, 5)
+
+/* Shift and mask definitions for GIC VDPEND */
+#define GICV5_GIC_VDPEND_PENDING_MASK	BIT_ULL(63)
+#define GICV5_GIC_VDPEND_VM_MASK	GENMASK_ULL(47, 32)
+#define GICV5_GIC_VDPEND_TYPE_MASK	GENMASK_ULL(31, 29)
+#define GICV5_GIC_VDPEND_ID_MASK	GENMASK_ULL(23, 0)
+
+/* Shift and mask definitions for GIC VDRCFG */
+#define GICV5_GIC_VDRCFG_TYPE_MASK	GENMASK_ULL(31, 29)
+#define GICV5_GIC_VDRCFG_ID_MASK	GENMASK_ULL(23, 0)
+
 #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
 #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
=20
--=20
2.34.1

