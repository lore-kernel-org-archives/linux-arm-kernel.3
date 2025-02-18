Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B370EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g66rGXUQGYyuS2Eo+qkj4zV3LVGZaz+edNogDzi9nzo=; b=zqEIG7rPTHsSPecpYRk2CMkj5a
	cYzzfWTtJeCzNnVVIGxRyYjX+81ffN3vKteOh2VBlusldgmx9Eiu9O2os+QAQCMtHHCdhwP9O3ekH
	JUCX104qIjFEBLfGdzGthK9da/AGYSUjT1cG53lcJPcenlU4grbs5P3D4VeC7FYonOpOgPMIhjHR8
	ahoHwFCkfpmGmHHPs5EyARqNAv0ypkFB8vi6W3yhYVWLS/zeRLdMzdN5+ErltVoZKNY49VVz9WtqG
	JhxCSKH1DHLus7lmLgIfvs02QzZNwlJ7L1jIGHPNaBv/9D7ACdvWTDXf+Lv75TwxXGsqgrCzrZ4B/
	l/8y3v8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKYF-00000007gP9-1Yta;
	Tue, 18 Feb 2025 10:10:03 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKLr-00000007d1S-1cyz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:57:17 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Wiczstxp79Z7xOe/CmdkjKK6C4j94Epu1Y059OyAtWd/xMjMQVL3qUlr4Owd9YWrTGPW/Vbf2Lp432FnKtYBf+RUWfUl+H5jUptOu6QHfT7sxeLr2A0/DBOZHAQSB4QQDVgIUSj4CZXWzTKw+FKuVwV3tKfdB2lHznUXMiAfvxG2+SWlT5I0KyUZETas+O+B5G25EfORcSA14wVAg+QpINUp0FTQrTjwHcomB2tvd58YnUUJG+XfkgA39Qfrg5iWMgeShc32aTBhGMKTYuROJQwePo+wvQ5/Rkn2utGDWrgbwgK9K07xEbMyJG31pVFB9Eav/OpHa8JtWCte+2x6YA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g66rGXUQGYyuS2Eo+qkj4zV3LVGZaz+edNogDzi9nzo=;
 b=GGTVyoSbqq0dicR0R97KIDw/2IlJnEgT+df9SMI3ecnpAC8SkPTsDLa/0leD0lFdHEKnI3Q63kiPXMc7oR0UIaUfQ9loU4dmLhjRqau0CzBKtde1SVYO2jZ2X81bTGrzlacOZyp4NNrQVwmn9js9fem8SBgKnvA5G4eWPDiHoLPcLXDpV99zkcqcx7lT9fmz9YNXGvWKZoUfzsYSHFuYaNnbbtReokNYGCMYJ7+1IqytEn/OdH167XUQ+7duuVWEBVqp35s5AgkI3dvm2n2ughWz8EL4Wx2QonDsQyU/MxbppKB906q0nHeny83B0Nbe25wDcL5Bh1sgYWMVVTYGYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=0
 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g66rGXUQGYyuS2Eo+qkj4zV3LVGZaz+edNogDzi9nzo=;
 b=c/qx+bLNr4jrVxLOMBnVPTpugQ4xn9bvJq/xwJf63SzEAlCj0AfbRqLA5xf8Emdo5+1SecA8MUkX8qcdnohbeIW4CVTPKLhq+m23M5B91pk5XHB/nYg+mw4/NPwb2iMXVmY9ZzYCNKiaI9MmGxIcouHRA5YsVcNQLPB29kMGnYo=
Received: from AM0PR02CA0140.eurprd02.prod.outlook.com (2603:10a6:20b:28d::7)
 by DU0PR08MB9875.eurprd08.prod.outlook.com (2603:10a6:10:423::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Tue, 18 Feb
 2025 09:57:07 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d:cafe::c) by AM0PR02CA0140.outlook.office365.com
 (2603:10a6:20b:28d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.17 via Frontend Transport; Tue,
 18 Feb 2025 09:57:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Tue, 18 Feb 2025 09:57:07 +0000
Received: ("Tessian outbound 4fd325905615:v567"); Tue, 18 Feb 2025 09:57:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7c466d3c344f8571
X-TessianGatewayMetadata: ZVu9O+5+SCETLaQVGQnm9J/e8lYP1K1MHeX18ZDZphmXlFU4/rC1A/hcGyDlEvaVW2z0fm26Kh4uerMtlPzm6j0pbcMiJ5cqtpe616vrhPEktC+X2uACQNCCSqxSm4U7LQGchsGvQAQXPdlns5p0DA==
X-CR-MTA-TID: 64aa7808
Received: from L783cfa010d18.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0F570B93-EAF7-4E84-86BD-D35F3CFBCEC4.1;
	Tue, 18 Feb 2025 09:56:59 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L783cfa010d18.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 18 Feb 2025 09:56:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azfghCHKiirEDsUYuV1OD/xdaPIc4QUlYnWw/LYwvOjMKQc3mqqf5QiK594+P0DRIZESaLK4NN+Ee4sjbGogNT3yyz4GbH+KLLpxiJuSXsKZuOUCRi78jAAr1Hp6J27nt6z0XT+j0cA/+4j1rgEv+ZhqOXsQEtG7+EWXAm2JNAoPGoBGGxJVUScU5WpiLdyvEpxEHa/NeV+BXG2nTWa13vsS2y3vTYlBYkXfITi70YvLsDhiJufw+YRdYNGnGX1YTgjAhVYU0A2LJjwDeY9w2Tug9p8OqNAjrfYwZkMTRrhfURRkD/5OaTBXh9bB06ZM1P8lo0nn3hSgcmtnsy54lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g66rGXUQGYyuS2Eo+qkj4zV3LVGZaz+edNogDzi9nzo=;
 b=bWZXju5genozlyQo6ySmUpEsoid/rEMopSYJEb6QUssagzHZ+5qHa7rLQIsVaGlyHyi6OCS89iCoHIpvk5Qnqw/zG2TnmrFO6XDc6dxnA7MczHkIYYIzQk5Kvs+wd0RIq45qXwY8dx1cNcDhcoSLGGwMM8QZI2/XP4p2yLi+sMKLwvXQZM9+f+ELaEXfgLSEQE/r0yj+cL7xeAw8jOlGDgjLkDgiUKONVo9qoawOvI/Se6TOzHlmnqI5ZkyyDAnR9pSAe1HSVGcpPtoR1GnCFsjF4g3lhf3xOuBOuw4jple542UaIwheIhHXGxT+HSjTvQNoKM71+irsURpgZWGZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g66rGXUQGYyuS2Eo+qkj4zV3LVGZaz+edNogDzi9nzo=;
 b=c/qx+bLNr4jrVxLOMBnVPTpugQ4xn9bvJq/xwJf63SzEAlCj0AfbRqLA5xf8Emdo5+1SecA8MUkX8qcdnohbeIW4CVTPKLhq+m23M5B91pk5XHB/nYg+mw4/NPwb2iMXVmY9ZzYCNKiaI9MmGxIcouHRA5YsVcNQLPB29kMGnYo=
Received: from PA7P264CA0362.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:37c::28)
 by DB9PR08MB7422.eurprd08.prod.outlook.com (2603:10a6:10:371::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 09:56:49 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:102:37c:cafe::1a) by PA7P264CA0362.outlook.office365.com
 (2603:10a6:102:37c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Tue,
 18 Feb 2025 09:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 09:56:48 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX06.Arm.com
 (10.240.25.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 09:56:48 +0000
Received: from AZ-NEU-EX05.Arm.com (10.240.25.133) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 09:56:47 +0000
Received: from arm.com (10.1.32.37) by mail.arm.com (10.240.25.133) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Feb 2025 09:56:46 +0000
Date: Tue, 18 Feb 2025 09:56:45 +0000
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
CC: <linux-arch@vger.kernel.org>, Will Deacon <will@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Kevin Brodsky <kevin.brodsky@arm.com>, Joey Gouly
	<joey.gouly@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Sandipan Das
	<sandipan@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<x86@kernel.org>, <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, <nd@arm.com>
Subject: Re: [RESEND v4 0/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Message-ID: <Z7RZXef1LqE0_lMf@arm.com>
References: <20250113170619.484698-1-yury.khrustalev@arm.com>
 <173982794521.4020985.15838989967891150260.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173982794521.4020985.15838989967891150260.b4-ty@arm.com>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004B:EE_|DB9PR08MB7422:EE_|AM3PEPF00009B9C:EE_|DU0PR08MB9875:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d504d82-f0f8-48b3-6002-08dd50029ae8
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?AIlgGOO3RTw7jxHPhdW3RqRyZCNSlgMrzpBV7Hshcz6wpHqOvGtR927zJ9Sf?=
 =?us-ascii?Q?D52zi1U/B5aJdQpxLdty2XZ3kSaVDoXncqTd/nw3baxDwfxsnQfpt5pnBBOB?=
 =?us-ascii?Q?uGFo3QsYUwO2EvkJ9FQ7jT24YwvzjkHNX7DZXvNwCPE4mLEa68P5KSu9m06+?=
 =?us-ascii?Q?MMOOjgxT9AxhCGyavBWYr7Tpk9ay0YXIE4akSmy/5XPm2EjGdVIe7MukY+s5?=
 =?us-ascii?Q?CSpUvW8wnKbnV/+oRlDof0yaHu7ZhkYYcTLcYObeJXSo1pGULK2h2d9gtKwx?=
 =?us-ascii?Q?3DyPJku96R2ivQ5v+R1NAYNg+pCGbi9ktlRagsLvtxVsgxCwaa173WQ8Htam?=
 =?us-ascii?Q?PykaLHOjy3tZua1eI0HjtyBjrmJkYjkTE/f5Ehe60GcC77FhQQnYyStsjLEG?=
 =?us-ascii?Q?3oKSuBYByPGqKB4+3QLRvvs5Jqv3Gkqc9+lh3+PawWyJBoQuLJf4YoReG2mH?=
 =?us-ascii?Q?hr823vRy99rLFkcPQQScd1RgXiStBbtsKfVFF+CYXRXlxRnRseG7lZNPcAJe?=
 =?us-ascii?Q?MlWNqIUnbXJTL/20H4jcTHtouoaeOsH1qCUhdnHwd3Akrgz8yn+pL4nClwHe?=
 =?us-ascii?Q?DCOakFGEu2DD25cDclWTpxK2GzatWP7ltiPfcIV294f6MfoMI87l8Auw13g0?=
 =?us-ascii?Q?hchdqTyaT4K4xiviRdria4447DaEHvMqm/idnM+JI5N/hahpCxQB15Wp7rO3?=
 =?us-ascii?Q?/2v8F0pSEfUd7h/kvFtohivrpfvm15dlCzar9WIwqaUcOESl9emUN4jw3P9Y?=
 =?us-ascii?Q?4kBV5SeGVZQHJtMMhLSYsW+KkXwzh+nO39pAPls8oLw53dTkBNsALvJ3LZ1p?=
 =?us-ascii?Q?qTq1wPuJkd2ecc27cHkIjqDVoulzkcYOYXJZ7FhYhmaU7ja0o5avI0z1x+kG?=
 =?us-ascii?Q?LU/PAlNnQxuhbiEAbQjXO6P2Ur1mnKx+4DZtaY5WwuggrEMC24a0qRkDBZfl?=
 =?us-ascii?Q?fbWjNJxoqX4+0lBFNl9LB5NHRmU6Q6I/R6BGRJeOCdUygiAfGZD8zogyLnsZ?=
 =?us-ascii?Q?dv3fn+gdiB3vxEoKDBgFIDSbWqp5GwrxsyuzyndTv4N1oPsH4qxylztcOvTu?=
 =?us-ascii?Q?0diE1W1CN6mhkc14c8jugM5BVbBMSlLW7VUOdWIPVcRS+y4dSs9im5Mbp95l?=
 =?us-ascii?Q?I1rO0525HxrEaSLSdmeAQ+GyIwSnuVz4CpaLSUg/BogWlqxG+zclei9hZxUI?=
 =?us-ascii?Q?5VX5yPiGLVup24ouKahnH5jWy6Q+Ef2pp0AoWU5nV3wac6f+VkO/9yEnFKUw?=
 =?us-ascii?Q?BszRQBOhf+XKupUR5uEwxr/sXbKULzK3lr0L4YiK2qLFhDhWUieT2HfwBw7k?=
 =?us-ascii?Q?f91XX78A4E51A4oOkwNjQ+fZUf/gjBayBK5iNO8wygAPoRQQ/CqNqUbxfs9q?=
 =?us-ascii?Q?vw5SBT5IHlc+Y6BeXSsiXbt6cTVRradGNBkIDBtvdsYdcfNXrCJIWASrzMVx?=
 =?us-ascii?Q?paWzU+CWloelRS+WU4l5XffStoNQYbQt?=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7422
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:102:37c::28];domain=PA7P264CA0362.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a0b6e54f-f525-48fd-e885-08dd50028fd2
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|35042699022|82310400026|36860700013|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?88DoyvOa8mL8IoYCsWSXfiDzlb7XIu5hCj64w/oGO8XKWzBGp6uYTLn+oYI+?=
 =?us-ascii?Q?P3Qf4iQkEP5msq9Wk+/4QQv0q9Wx4T6HPBu7f8dWzlOTBDTBN8I3UFmRCPrG?=
 =?us-ascii?Q?AzOrGfeVA89dMZNpjzWOdNQAKbZW4IM54dDwyCMlJIg9vcecCFQK0tn+aCLe?=
 =?us-ascii?Q?+79zYjzxTYh/FE0B+xZnIcMvrrnX8dq5fTSuBHWxCDM8Escu4xOYXwF/Q7hy?=
 =?us-ascii?Q?XebAtnunuDMqk1jOnCgnznYjbDOsF6vtVVEv2QalHN3uTTJciaFAYqBQ3JML?=
 =?us-ascii?Q?V4B0zT/Fn07Wk/3FwONsrnXJRAfWEbWddk5himt4y40N+QXmgpUDxtw7+zs4?=
 =?us-ascii?Q?vUaqfDr4SzaOYSZRM9TZvdzelwyVi7SW4MMDzeCIDI0eCm/J+cIUilqoS0jd?=
 =?us-ascii?Q?bDilX7qh9CaWCDiNiXxAMLF3/paL2+T4kAsJCKRM8kw/jmWaaxj+3IieFpsd?=
 =?us-ascii?Q?uU++S+0mrIVoalxDyXAeLJA7EN2Ql5qep99mBDXdaETW0Z3EDG60raNke9oU?=
 =?us-ascii?Q?ZfmV+4fRGOvW/VVs+B8EXDvyGkdeJ5fUvfmYdwvgqEjHLZd9zCe5gpFriT5Y?=
 =?us-ascii?Q?FZ6/f0uL5Qh6uM/vEbZe8eFFYZleP5H4jaqTJcFcLKtY+MOmUoEVnVW4TcQ9?=
 =?us-ascii?Q?VE1BB5wZ+tZXHL1ckB3LUnvZNNOCMcX06HypgrUn5JCoYPuRfMKzIwhb4OUf?=
 =?us-ascii?Q?avV2U2XKZtGDk5Tn3+zYn8DHSYP56+OcoSVdeJiNQln3Bqw5IZV3BOvErfI+?=
 =?us-ascii?Q?W9nGUMsQp1/qx86KY0Dw7sj1/AvxANIlFP+lQZiLik57ZBMHE/i2nnC3hwgr?=
 =?us-ascii?Q?B/0lGyWmRYRHFWICzsivsW+yiv9bLz3B6m3nT1W1xEomdM7JIXh1YRyv3OwC?=
 =?us-ascii?Q?DLrr3/pEx++E3N89ANM1C9ExlvwFfXyPTAzPNrvX1bwXvz7mKg8kzaAE2oNZ?=
 =?us-ascii?Q?SzGFJ5ZT80prqN/LpTbYmvgLDc7Opv0mhZ9AovfsdGWSZO5JuKA88nWajdZJ?=
 =?us-ascii?Q?Y4KGSTuRoonKQIbBdD8AsdOj/gvReCxilKF92ZMcwTZS4OPnbfKqupcnFm5K?=
 =?us-ascii?Q?tjZMpDhVRZQ24IgdgrhDTyAVY9usYN6o+/961dGN20ZLwavU1eem76BXgqz6?=
 =?us-ascii?Q?9sdeYDftvALEPAE0XtUGyUB7Io4SeQ+h1meLAQGKiEyxIYVNBW4f2n0FU2+D?=
 =?us-ascii?Q?XMrR2dR8Z9/x80XCqGZDpszm5l5NfhVd1yWrVVpRxdxlLjV4QnpVzZWyYA3L?=
 =?us-ascii?Q?Cht/zgZ8rHsvAmYBVMQIM/dSaDghROE0XKDs2ksESL1bo4Bt6fgdpStYF/hA?=
 =?us-ascii?Q?l+jc25WL22v/BnYCTAh2bII1rFJN5hgmuDeRsKKTd7b5e08U3OwPEiz4wXRf?=
 =?us-ascii?Q?jPy6VZAb8guWsGCxy0rNUkYfpu298hBpYMnmh6jkqje+wmXXnWQNQ72QueG1?=
 =?us-ascii?Q?vWEhJFxx8a5cPBK5cxz86w1aHaNx1lJD?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(82310400026)(36860700013)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 09:57:07.4930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d504d82-f0f8-48b3-6002-08dd50029ae8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9875
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_015715_721946_E1A35ED5 
X-CRM114-Status: GOOD (  11.06  )
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

On Mon, Feb 17, 2025 at 09:33:10PM +0000, Catalin Marinas wrote:
> On Mon, 13 Jan 2025 17:06:16 +0000, Yury Khrustalev wrote:
> > Add PKEY_UNRESTRICTED macro to mman.h and use it in selftests.
> > 
> > For context, this change will also allow for more consistent update of the
> > Glibc manual which in turn will help with introducing memory protection
> > keys on AArch64 targets.
> > 
> > Applies to 5bc55a333a2f (tag: v6.13-rc7).
> > 
> > [...]
> 
> Applied to arm64 (for-next/pkey_unrestricted), thanks!

Thank you!

Kind regards,
Yury

> 
> [1/3] mm/pkey: Add PKEY_UNRESTRICTED macro
>       https://git.kernel.org/arm64/c/6d61527d931b
> [2/3] selftests/mm: Use PKEY_UNRESTRICTED macro
>       https://git.kernel.org/arm64/c/3809cefe93f6
> [3/3] selftests/powerpc: Use PKEY_UNRESTRICTED macro
>       https://git.kernel.org/arm64/c/00894c3fc917
> 
> -- 
> Catalin
> 

