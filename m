Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6C1D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 09:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JI/D2Kx2Bk0K2s/JCqhAUhaaLEhiZcnhgsL47849p1Q=; b=d6BKAfIA4nijRYofupdkVmqhoP
	zpApzKukktsfzkaSKK7WOpkEEKByhkiy6k176dEjvZ4vDkRQbjxisVvJBu60eqk7xFU/f1OMJQT+R
	tGG6ZhZtynqOlRq6USFlWkcuQyMNztmO/FhOJN+qJeSfTpyoVMtJJHFdO1h57H9DxfmdugI085nFy
	B9lUD2F+WgQ1LXQC65w9E1XPIEHvwk/pIZx6+kdtLB571owNKtG2lk3evGP4s70EsBcFf2BEO0Eye
	LjerW+T7mL7imtcRabk4OfYT77ZTBaHVe4OWtwvZrIahX4j6ATrlEG12uKDYSa9rFjdrF0DbArQjT
	XUuzX9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ06j-00000003Ct9-2Prs;
	Mon, 01 Dec 2025 09:22:09 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ06f-00000003CsW-2zUQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 09:22:07 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WrvCnNBRbI6483rb4ukZUoGpqN7L1XLbpKwMMwesbDkNF9+uFpOUHgCjM+bq63fMimKuF82CL4Z06bZBYn7/mCWwXTqrAeGJDtMKIHmzc2RsA6nbO0HHaWcHRsnERzel8C5zKsNiboVu7/vzRidHoRqOpP+3MCaCWun/TJgQdPPOaH24s/Eopt9ck3uCb7cXX/CjsmIDWVnEkYEpQIsXQbUjj73eTzdR2uuDMZkkpnWctyjprgU7q+IUWWHpvXDHYS1Il9kVUz2OCHrby0tjxtqYvqOVczgsEncecnPffert7bFULaM/jPAbrP8Mb7LTHisk2uJX7ZCW2DrSItAIPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JI/D2Kx2Bk0K2s/JCqhAUhaaLEhiZcnhgsL47849p1Q=;
 b=D18bdfDRaznZWNAEmvS3WcmC6D4YgY3NdEbIeiMg7NAxVrFlQBTIfySI0sI9uJ772bj8f316F6v0yHbiTOEVq9O3aKoTQh+Or+Vw4etrYz8StDieZrp5PWbJWgLy9ICZN55/fWtP1uCnM2AlKNsNRR0sUs5iaWkzLciDbUmCYTkb0TVkGIHXZmGpzOpsZ47GwvHrnyDQwx60H/1V88ov3/AIe9IRPqpBun9LC/A33HE8OxYF0bohHk+qhJUdYd98zDouqG4O4lzkS1UwLzlBvnmBsRLG7TW00it5MyDtu9DFZmE6UApKnoTTj6ftYE+YsFaMJqwlONXCSRQNLRqb6A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JI/D2Kx2Bk0K2s/JCqhAUhaaLEhiZcnhgsL47849p1Q=;
 b=cvVYj4XOuo5F/Ph3fCTlqmbR5djnvHsP5m6Egt39frUTqE1DRnKLxVkZ+7hXAsgvlPdK0jP1FehfpZ8Tq9hxp7Mh9oLgJZ02Zl5b37tVcAFGzcxxihoPgKT/uq7seVgmTOxdJC4PB4Io92hJ6VHTloC7+tFHXDme1nfwlKFr+n0=
Received: from DUZP191CA0024.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::21)
 by AS8PR08MB6407.eurprd08.prod.outlook.com (2603:10a6:20b:33e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:21:56 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::2) by DUZP191CA0024.outlook.office365.com
 (2603:10a6:10:4f9::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 09:21:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8 via
 Frontend Transport; Mon, 1 Dec 2025 09:21:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grB3v2PJjdftbgy9IR+I7j6KGa36S/tI11XwixHo1CjBydDa4suAGDa9paS9Iz0Ktb9CiloAMoMVfOk1mXVKhBusYTBJtkrWx4Jo1co8bP3o4DkAGyN1h6Ux5bC02BC5ThgFqUk/reIQ9U1EIWNiJ4aLh/GqELACeIfsjnXreuGBHgw1hUuDVA3OVc7BYnSc9XrIQGjB3YJmNLbHfAXOTnScs1HYnTcwHDB7hXhQhNwhgKhF/W1AOBIRq5Px/b6CTIHP5QdvhFSrqObSCZswYPS0heAQfsClsPhebBXLJh/6FR1+kQVW+073fARE3j0htECOb6KwjG0B6gynzLQwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JI/D2Kx2Bk0K2s/JCqhAUhaaLEhiZcnhgsL47849p1Q=;
 b=hbak6EyMbzWDP8R7I8VwYuQXMfWf+Xtf5ezPjng6Etl/z8tuq1HheZBMoI0YJb7JioSlFZIE28rQtrRDcPHk2IK3nbZF9xI/0CPFaFRhvazQk9YpvAtX8kB8BbKk8KQrCXTeKLXR1BCJQYXy09qL2MH1UAm7ubK57IpVpxzQMmomZs0w92QJGtksWhti/BPXD/MUsOVND8LNaLvay+h5w6wgm8+MIehlu59nX340L0WlC0tT/ldulXu1MVo3bYu0ErgLnzHtEM6sV3qNP/wKN+CX/9neAUTC++YRQibuCtUJOQeJmYOfFXteZoCr7QxzK+XmUJ3iIgzyyh5M/8h4qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 172.205.89.229) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JI/D2Kx2Bk0K2s/JCqhAUhaaLEhiZcnhgsL47849p1Q=;
 b=cvVYj4XOuo5F/Ph3fCTlqmbR5djnvHsP5m6Egt39frUTqE1DRnKLxVkZ+7hXAsgvlPdK0jP1FehfpZ8Tq9hxp7Mh9oLgJZ02Zl5b37tVcAFGzcxxihoPgKT/uq7seVgmTOxdJC4PB4Io92hJ6VHTloC7+tFHXDme1nfwlKFr+n0=
Received: from DUZPR01CA0263.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::11) by PAWPR08MB11329.eurprd08.prod.outlook.com
 (2603:10a6:102:50a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:19:21 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::f8) by DUZPR01CA0263.outlook.office365.com
 (2603:10a6:10:4b9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 09:19:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 172.205.89.229 as permitted sender) receiver=protection.outlook.com;
 client-ip=172.205.89.229; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (172.205.89.229) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 09:19:20 +0000
Received: from AZ-NEU-EX04.Arm.com (10.240.25.138) by AZ-NEU-EX03.Arm.com
 (10.240.25.137) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 1 Dec
 2025 09:19:19 +0000
Received: from arm.com (10.1.34.153) by mail.arm.com (10.240.25.138) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29 via Frontend
 Transport; Mon, 1 Dec 2025 09:19:19 +0000
Date: Mon, 1 Dec 2025 09:19:18 +0000
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: Mark Brown <broonie@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64/gcs: Flush the GCS locking state on exec
Message-ID: <aS1dlsDcV9cpD76z@arm.com>
References: <20251129-arm64-gcs-flush-lock-v1-1-902b3ba6f39d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251129-arm64-gcs-flush-lock-v1-1-902b3ba6f39d@kernel.org>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|PAWPR08MB11329:EE_|DU6PEPF00009528:EE_|AS8PR08MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: 160bfc4d-ffc6-45eb-c77d-08de30bb1216
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?j1OQkOuL4aqDfh1uAUKlGetIGw93U/mgXHdc0OqplwRaKXR4wQGBqB0o+PVr?=
 =?us-ascii?Q?KU51yAqTjRTg/Bj3zl4UH7cdfA3nGNQ+BXq8wGJNNOg+vSsbAMsid0TbP6vC?=
 =?us-ascii?Q?4fHbSk/j9HfDmWhGQVrmRUeDZXo0/efk0CrMETMADWOwszEhmgxFOnLWprp+?=
 =?us-ascii?Q?/VuDbLyGYWl8B801WSJ198f6PA7tzhsIRFJvK+p+C9NMo5Cfq4L3wGgivHu7?=
 =?us-ascii?Q?RIaKSRcW6/4Jv/V4b7V6B/bFf0szBBFnh0flZNas+3uwN4QHLPOPKTJqjngG?=
 =?us-ascii?Q?VMo/i6qPaZyoSYCsy2JdyHr3mH+JtD5kB3z48FBh7r4yRfwdY85mMuPd3Dlx?=
 =?us-ascii?Q?F8s8siViFHe/z73KNWvPZ65kyWbzjCLZT4o56A0yVJzjbLflhTCh52DhYKz0?=
 =?us-ascii?Q?1UdXvbAPC4vEZoyWlBbD+98ls7i8Cs38byS+w41ZaWYkkeUnkn3kvuTufDe6?=
 =?us-ascii?Q?3zRMMQ/lVO8u9JK/BGEgmBjHh6m+MuPF0jGYZlV8EIDUY57Z0NuUM6zXSEJx?=
 =?us-ascii?Q?DgWHPbnOuJsI8STE4WxfoXy3EA6EHcomFnAH1sRS9CbOPvxDsO4f//zBER3K?=
 =?us-ascii?Q?Rl3gTNYcspFpFD+c0SAPD1lFZ4UCpttb9nLGqE6ocNtpREkVGEDxY56v03wn?=
 =?us-ascii?Q?NE+3S/be+eB3CWfupwbAjKU55paXXErtZ6jYv0uCu88vnObOZ1+503canaB5?=
 =?us-ascii?Q?R3bcTzjI2+NkvhO+wB5tuPY9BQl2jTs/mQQPoO6rZ9Nj4a/fNb3s4bxklIoz?=
 =?us-ascii?Q?EtrWkG17K+pellLEEpjlMCKl5teYGYi+6K+1qqkue8GwMUDyCyW3d3yX/Y1/?=
 =?us-ascii?Q?Gw5TtbX4AdyrwBi7h8mRItk3VL2iFT02H12jCbRH2vhB1GLyowFHN+4m+UHv?=
 =?us-ascii?Q?Sa5ljnhoBrEE9pTlqyiqKZ2vhJLykk7AmRYWi7HukexOkkvKaJ8PIoVwva2/?=
 =?us-ascii?Q?GHjZewqiydK5QHGzwbXbCtH3tcKUhGK6xGS5gCXuczPpEDDJ1I5Z0+y/e1er?=
 =?us-ascii?Q?UpLQQD3iX8Dw8B8iwMvQwOp3Y3RbPaWZFF//+oo05ObFpbjO2dWvBYluxho4?=
 =?us-ascii?Q?QqA/TgggBQKrRkrNSpULtndNkHnxrK5hFraoB3vxxdw5x+h3vCeNsLiDLkYm?=
 =?us-ascii?Q?1eSR7I7HEgHZX/wyIVL/1gD1ua0zq/OKGBycu3rN8wL2cKZHjCgdwxqQ9O5v?=
 =?us-ascii?Q?C+tXcFF1DXygCL46HApNiNvRuZw1usHYSzEJe1wwnwtf1b8OXOpSYBdMB/Ku?=
 =?us-ascii?Q?neAc/Y/+Blz3FsyefPpJ3FUbzqUI0wC1qv1EOPF7DoPKet21ysVGz93GZjc3?=
 =?us-ascii?Q?RwXOzUz6JotpuG7R0dFcx2tNrF+jiJzq8IKpz7xU4dtt5dFfaKIqHtttHUJu?=
 =?us-ascii?Q?OMlZZFLqd5j3ISlB+djDvkL72Auum1mDC+dbPX0ym5g4nSooe8jSUgaWoy3r?=
 =?us-ascii?Q?c0Msp8S6y62PQVg2tce4vnwdtzPrGdbCo9YzSp766W+fpUj3PNy4oXZfK/EZ?=
 =?us-ascii?Q?WEMRVfOaqFwHQrNDdNad0JR6M4IG2JhNpr1fNJB5Kc6g97VWduw6nLKAg/Rb?=
 =?us-ascii?Q?LCi9NAToaWuMViSuqhk=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11329
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 11732070-0eb7-4e7b-1434-08de30bab60b
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|14060799003|36860700013|1800799024|376014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lkGM+m4asIAj/jaMafefDi0/CmZ8xM5hXhryxDDutK7oqqeZKnP+Zx4pEq2r?=
 =?us-ascii?Q?8VkFrzAsb42V81IHmMRfMa8SpBOSevOFVheg3wj52fUhLzligDuYkpsg4Ult?=
 =?us-ascii?Q?giYE0Dsi6W/MKV6JDNkbhrfim83epEhU+leTuRUK2LzVHROIe5ZMgU1qzabk?=
 =?us-ascii?Q?PmvX13Rl9i/HMQ8Ob6wsQ//ifjt5fueMvhByjk0+kCXdI6JduAddppBoCZMC?=
 =?us-ascii?Q?t6wNrnxA6zNk/hbCfQWMrVLjCbMk8tE4Uskfa38fHQmQx3B4y3n0c8ucfTgx?=
 =?us-ascii?Q?2vszz3fXsQRxeBdjmfsQyEWPCT6IMO8/COPda/YNmRFu4k4UhE5xR3fyJNPI?=
 =?us-ascii?Q?TI5nzkfQkmcAa2ljqwpx8R61K4xt6xYkj9XSE/yGEf+4Ge3ox7M4mnpoQIKi?=
 =?us-ascii?Q?ZP20R+ymLMf8FKGvwRM8rzKBgybejsuH3eFrhW9HNsLY20LpY6xcWB1IeZUi?=
 =?us-ascii?Q?H2OYM/qRvlUzz1FPrsJFEIIbODD/TxJdklc7VjY6XJ5mOnlzzXU0fTrBbghi?=
 =?us-ascii?Q?YKMSEQEvBCKbsAnVD+Y1/c5wjHqGZnG5IBPXetI7+4T2+L71lp8C4CG4HiPb?=
 =?us-ascii?Q?VCqOrQJsURVFjSMALdp07FRDI8ZLi5sXD1/fTHEmVSydUj1tvfdq8ciHJgBI?=
 =?us-ascii?Q?oUkfDwiBNa21WdbhqobvsQw6gMn5yUFQHGfEYtbY2tkVwusFYj+uNKVhlZtg?=
 =?us-ascii?Q?2qDPvWo1aut7adZ8FdGcUHcjHwDyPbnh2qxDRi3XySuJLGNnBQdnwOPuFXur?=
 =?us-ascii?Q?bR0uE2ymqTcewMt31KvBNEWR70OjhPMrqiLGp2gEe25pbk5uzEk1aK3hNHA9?=
 =?us-ascii?Q?P/XJg8MySPZMBEHeSEx1Te+ejbKkt/yIvTa8s+/+mSqWNY6KbYLFLlJoG8Pk?=
 =?us-ascii?Q?Bkt9QqkZenqeOd8EvEZKgRp1EQdcBStrG3nQj423JuSUhdmKXrWYGUd0LoX4?=
 =?us-ascii?Q?mwy5IiR0LurVLFmHKvDn9Tfixfl8T+Y2mtp4i5NTinhf9sTFuqQ1sQ35WnpP?=
 =?us-ascii?Q?i7Y5w+1nJ/7tawf7D3d4Tq7224qsivUepcpBEhfqodOmSYxxkZqPWuOcMOlT?=
 =?us-ascii?Q?Mv/yv4n8vT9urBJsyK5Jga1nEL9UAyLQNa4jk0kZclZ6nPNiOqhakdme18Fu?=
 =?us-ascii?Q?lgSJAvSoYKQHXOh7FUmpRIykXg5ii9iGj1O6+mObILuyMiGXmDIai/m7qGQS?=
 =?us-ascii?Q?rhKbtUEmn77/sK9peW+rDOGpxICQ0hDIqjtiG0xFRurxo5rn7H8Kz38iY7G4?=
 =?us-ascii?Q?PxbInKVDFcS7SCZv4eA+7iezQm4qjN1pRAJGxSnG3vVG1be+BC0cUyN5xjVM?=
 =?us-ascii?Q?nFUbs+HMM7kMIbcoqUUHgorbjJlftN9w5N2ko+jTA8XPV9jP5cRGm7QbyHGD?=
 =?us-ascii?Q?8Phi3i5OdfLYknZ//II+uWs33bjcKrzoDhAqRQ8/epWsctGqRjev2FfaHtA6?=
 =?us-ascii?Q?Sf1NnFplKF2vpPHhupTs1AGjnwoVG+6SZXuB5vmCjv+XPcqsVE6T1OLQ6o4A?=
 =?us-ascii?Q?WmZGzZXHU/F1VAQVJNPykd6ivEcCKBJeyCEjve8rhjaU/hb/HcfVRaArAxb9?=
 =?us-ascii?Q?wO92cslRUYuYm9RP9u0=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700013)(1800799024)(376014)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 09:21:55.2675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 160bfc4d-ffc6-45eb-c77d-08de30bb1216
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_012206_047203_2CFE565E 
X-CRM114-Status: GOOD (  16.51  )
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

On Sat, Nov 29, 2025 at 12:48:45AM +0000, Mark Brown wrote:
> When we exec a new task we forget to flush the set of locked GCS mode bits.
> Since we do flush the rest of the state this means that if GCS is locked
> the new task will be unable to enable GCS, it will be locked as being
> disabled. Add the expected flush.
> 
> Fixes: fc84bc5378a8 ("arm64/gcs: Context switch GCS state for EL0")
> Reported-by: Yury Khrustalev <Yury.Khrustalev@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Thanks! I've tested this patch and it works as expected.

Tested-by: Yury Khrustalev <yury.khrustalev@arm.com>

> ---
>  arch/arm64/kernel/process.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index fba7ca102a8c..489554931231 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -292,6 +292,7 @@ static void flush_gcs(void)
>  	current->thread.gcs_base = 0;
>  	current->thread.gcs_size = 0;
>  	current->thread.gcs_el0_mode = 0;
> +	current->thread.gcs_el0_locked = 0;
>  	write_sysreg_s(GCSCRE0_EL1_nTR, SYS_GCSCRE0_EL1);
>  	write_sysreg_s(0, SYS_GCSPR_EL0);
>  }
> 
> ---
> base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
> change-id: 20251128-arm64-gcs-flush-lock-163eab9c22f4
> 
> Best regards,
> --  
> Mark Brown <broonie@kernel.org>
> 

