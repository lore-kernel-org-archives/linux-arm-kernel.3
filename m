Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E23D59D66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rs3GV8hCAz9wnEbmgdOWszfU+0mYNP/1paDBtENcZVo=; b=tCKxk5ukQQY87l4AUXBbPAdzIl
	li/kYunBJjHn9aIOB11Fza0yX+CicxESFa47sMExSRR88c3FWRdGgfRJt3QjjbzIr1xfKsL0RLtYk
	PhflTPHGHSpN1vLJt1WKEYZJiYCUnuJAzoHT9esjNE9xFPygeGvMsO+hhIN43kSeEN9d9HBoRDw4U
	D42w99ejb+VjcAfzks4GzuYXAnr7C0EeheokJCfM4WwL1x9apJqaO4fHwl/KuFs6LI09xwarN0MlX
	MkFPmcQrLSN5H/bCLaYw6zFc9FViu9amZnbbzDF/1+kscNx5+cboUFsGLUsscgrCnCbJTXuyR0T+W
	/s8FETWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU50n-00000000gpl-3RYw;
	Fri, 12 Dec 2025 15:24:54 +0000
Received: from mail-francesouthazon11011069.outbound.protection.outlook.com ([40.107.130.69] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4zv-00000000fbD-1tWo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:24:01 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JNGEWRhCJNJ9JtdVYOHv0/dTRevL+VuVCqL0Ga4SySKd7RO/NrLdFkbAHExZfYlCYlqo+WSQnK2+NZerFXLICMhm4ADrUjMo/toUVNItr8kZ4asa9u3VQqJM7JOm5miCKvgGZO8BZjJHSypM121IudBd3xjJa3xXC0mqX1qSCj/+uQIwEHvgHdKm12lQbAnaEHRSXLKLgLDRL7oMOW7riBmb8R9+c9iyDrD7GO9WAFFyIlODuqsWZgrI0qivUbrFEKCfCCCLkrzXdFsNRrmmr8N3WB7d6nv9+BIWjAEbcR1bWkLl/um1eYomUKnN4trrPjsAi9AKQq4ncRy3xGVwIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rs3GV8hCAz9wnEbmgdOWszfU+0mYNP/1paDBtENcZVo=;
 b=p9a0z7onwwgNlTKN6ihpWVmiQM09XRN0cxlB5jtJor7OYcCowD4vHK5gvvSnplTK6IofcznE5+0rZtzrzQlL4cCr73/iDHrHGwzQa2tSA+GB7f0ZcUQVt9sYlbxyJ4zx3tcMv+B14fH1u6NtOE9bAoMv0sbl7gmW7bOmHB6oQDC5SFhdPYKmvUALdIa2L5KuH0aveyswT8qSsck9/v1IB38FgLsTi0EekH9W+ykNLgNGKEUHnYABoCq3y1R5Nm0gsuKiIvCTtd9IBfafzOTDSreMMKG1Nbq2m0VOYctaJfcIxMGCkTOjKsfAy/uEIVnVvwqZg1GsgalX5rXE+8DjFg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rs3GV8hCAz9wnEbmgdOWszfU+0mYNP/1paDBtENcZVo=;
 b=nm2OFG0xmihEKXztX1xfVmumfwaUzSCvAO2JL+gk8UTd0W8GTVlD1wNcR0JmwTCkI4a9hqk/mosBRDem+CXNXSyL2G7ugcNG4GAOXH5yvptYVPW5ZdZrS1vNBgQiacX32ly9w+RjikvZJChrlxubgBAoF8alEgZWt5FQpET+HWU=
Received: from AS4P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::9)
 by DBBPR08MB6220.eurprd08.prod.outlook.com (2603:10a6:10:205::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 15:23:51 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::7a) by AS4P190CA0023.outlook.office365.com
 (2603:10a6:20b:5d0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 15:23:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Fri, 12 Dec 2025 15:23:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZ723MpOydoOciZ9XS0xXsTiW0uQch/REZyY3puNg78j3++QQKG7MQmm12om/ASJxxQUoP88kXowh+5HPhehBAQwJYsF0AidiTE1oj4AclTC0W23iuxQzjUNzPb56Pwm/wqofvQA85DcKMRL+HzH8zlUp8ajtlnzQXhKwrpLTwcVsD3FiRuzojjMFm1ucEEPH11tBV6b27e/2o3azdzpCko2NQHnqgO8/IQibAYQDiJBkttkxVVYHHXUZQcSyqmfmZoq0zud/p3VOZiG1k/g/uapNR+fu6/VP7rrimbGu85STHv+z39i2tZMAjWZTxXsPulYqnwdyek6zN51ebR6qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rs3GV8hCAz9wnEbmgdOWszfU+0mYNP/1paDBtENcZVo=;
 b=SXALZ6asVRv2OYnkwXY/bS/KFiDiL9C3tQfpTZLA8jilYXj/WHB0PkvXD+UJKa+0NvqCmCTv7WjRetGJvqSyYSY9cplcnif/Gu+0L+p6MWVhMBM/9/B2RAcq3cfVwPpW0TZbTqdr1/Bj8obV4VufX6XZy7g+qDCHwMomlcKbWfJD9la+Ojt0ulULPaBgL2iyvVAW9I1+zspzZmzgS6VHEb1EeVaYLBrJGoktbndOie/Yel7QKi1Ih6L+zCBuLZJoODVePzrGiqYDLiW1OJRTadpq6LNJckM5aVKha7xKnz3fZALwJKnSV474LXs56ZPvSCEg9w3s9XUPYu+RzfdDSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rs3GV8hCAz9wnEbmgdOWszfU+0mYNP/1paDBtENcZVo=;
 b=nm2OFG0xmihEKXztX1xfVmumfwaUzSCvAO2JL+gk8UTd0W8GTVlD1wNcR0JmwTCkI4a9hqk/mosBRDem+CXNXSyL2G7ugcNG4GAOXH5yvptYVPW5ZdZrS1vNBgQiacX32ly9w+RjikvZJChrlxubgBAoF8alEgZWt5FQpET+HWU=
Received: from VI1PR08MB3871.eurprd08.prod.outlook.com (2603:10a6:803:b7::17)
 by AS8PR08MB9386.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 15:22:46 +0000
Received: from VI1PR08MB3871.eurprd08.prod.outlook.com
 ([fe80::98c3:33df:8fd4:b704]) by VI1PR08MB3871.eurprd08.prod.outlook.com
 ([fe80::98c3:33df:8fd4:b704%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:22:46 +0000
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
Subject: [PATCH 24/32] KVM: arm64: gic-v5: Mandate architected PPI for PMU
 emulation on GICv5
Thread-Topic: [PATCH 24/32] KVM: arm64: gic-v5: Mandate architected PPI for
 PMU emulation on GICv5
Thread-Index: AQHca3spqQAldB8bvUaZEbBscYfcbg==
Date: Fri, 12 Dec 2025 15:22:43 +0000
Message-ID: <20251212152215.675767-25-sascha.bischoff@arm.com>
References: <20251212152215.675767-1-sascha.bischoff@arm.com>
In-Reply-To: <20251212152215.675767-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: VI1PR08MB3871:EE_|AS8PR08MB9386:EE_|AM3PEPF0000A78D:EE_|DBBPR08MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 45fcb43c-0780-462a-ad12-08de39927419
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?GSDe6zP6SNEPaSqmuz3ecwPEJDFwP3WmJVyQihFzhXO/PIfqJjWjLbPD9K?=
 =?iso-8859-1?Q?Yt+baVau6V49HK2m2G+0xtLnnaU+64SAgDpU4OOTJhjThOQr8rY+qeIZSC?=
 =?iso-8859-1?Q?hZK1ahy5NG3o48nLD4Q5msuvIhg0LSGcFh6J1mSngDwXSqYKgMdSF4XiST?=
 =?iso-8859-1?Q?DQq3elRYFVY9Bi8VgOHMBWPTNyTBINzcwrlq+TIOQ+sgjtPNrH7M45DOxl?=
 =?iso-8859-1?Q?EIx5fPLiZb/VnIQnMERqhmG4R7ST+N/Bo3vt4TWp5oZQP8lqdPCogi7DZN?=
 =?iso-8859-1?Q?NUYap4flizn1Ij8fU/w957zRigUcZcD2UaM9SqAVrQolei9voEbp7xpvd1?=
 =?iso-8859-1?Q?D82djfhlKW+a/iZwgaF0JqsEzM7uZuqHp2K569+Ae1CpBnQ8tv5K1kZkMW?=
 =?iso-8859-1?Q?mzUiRemsiJALNM1tKWxGc+oiO8h5/dgizEbzsJegmSdF2jezJ7oGzzuxGp?=
 =?iso-8859-1?Q?XLZPU/mAIj9XRzyUvB2116reqRmeKqh/wrsc7+S2xznDOdxX7ydQAK8kRM?=
 =?iso-8859-1?Q?vPnQ/Jee0ft8T6iR0uGD6SLliMqDwNXjLFODBaFpXxYeMtFwkteoDuZKEm?=
 =?iso-8859-1?Q?kwlBMZn3ctiwSk0537OV0UiFvKVOvdxog8mKy+86vMLWuW996Z17ZGUOh/?=
 =?iso-8859-1?Q?XD2RrzXRRwuqIIcloZ8tQl1JnwR5iTGt5jz3rbPHXMXDQnwvlt2nVEFvfg?=
 =?iso-8859-1?Q?M1T4lUYNk0ZRcRzGPN0AQYsJyXEnvERWrM+3LH9Gl0qld9PJRf6Fiv8xu8?=
 =?iso-8859-1?Q?jlQYmPKxoDojJu+fCxMTJih4XqxBKyy4mfPS4MjrCichgLyVokqV1oo5r3?=
 =?iso-8859-1?Q?wdM9jkBUjYGZDeLfh0NI5x/opQvRFXYURoqjU0o7eCgZ01raI700+aapLb?=
 =?iso-8859-1?Q?uOxYNPDgvILyNrp16nuT+X800Q2j3O2c8lKgk5QUhJZddWf5affM3mYI1t?=
 =?iso-8859-1?Q?YSdH/HIS/68NQzo03SI++TAGsE/oscofXuvrWfYgQPkTi4jur1ur+pN9BW?=
 =?iso-8859-1?Q?SlJIFses5RmJ5E7OPUaLe8LWt+Uf/+Ca+5UZ328Zaclf15+kwLY0XcOIAj?=
 =?iso-8859-1?Q?7+MIydpZ8x1BNL5+kjGzxrIkbTvE0pDRfmK3INSbLXkmOCVz0/MQo4qwtd?=
 =?iso-8859-1?Q?/xoQrFh0e4n9AmfofC0GwjgXuMQycKaN//YYzBHkc45b30mxhjz94Ho05R?=
 =?iso-8859-1?Q?ayr/AaTs5VC8A/WYJsPhI2IwiZHz0/LgLYrCRCsQ6medVWA+Y6r0kQM7iY?=
 =?iso-8859-1?Q?i08H+PDtMDaeA2CPAj3YLGj841G3Bs0oAvgQM1hrlUOyPpJUq7arzQPm1x?=
 =?iso-8859-1?Q?3abEKIaccg8kSJg6eOm+W1BdHAVRhEvnzhc15CjpKTCbi03/ASRoVGrTar?=
 =?iso-8859-1?Q?5ooSQr3jxLxZmADxn8NJyEGyY+sVldztjYQyWrgV7f4s6VeuMCvvkzhi6F?=
 =?iso-8859-1?Q?W+SjCbzS7zQHLpEdUy6173lkUz3/JFWThRMBOlA3D77dxXvgICsG0+AMtp?=
 =?iso-8859-1?Q?dlOFMqzmR5qecc9u7XABGO5+fPetVdgwdk+tQHcre4O0xQ2aXU0rdK2cje?=
 =?iso-8859-1?Q?YmMBcMpfENiGAw3yD5yZNDL0YQu8?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3871.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9386
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4683413b-4934-41d7-0044-08de39924da0
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|36860700013|376014|35042699022|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FOC9Ba8VE+kjO7uV+n3tlsh6UWbWuCq3yDcb+1nOmoTaMfcmqgqv6nF5Xn?=
 =?iso-8859-1?Q?hBHCZEFM32LygFLM6REF7JKzW0ImuEZzd5Q6LqxaTP7oaHX6Wi1tz30ARf?=
 =?iso-8859-1?Q?rYwqHTaLX1ob9hGLlMlUrf5uhjMghbhy8kTmcHXOtddYwf2i2ApTT2sMQh?=
 =?iso-8859-1?Q?+Gavj85I1xnPkL0Rzp0RYMvcteg2bJzBO9lQM+PaGdZCLDa6X6eSa4/FVz?=
 =?iso-8859-1?Q?0MY7Xj5QUhK0lkPq4kLpSEKfRAmB1XeEgF03bNl8ZonOHs/GL+S+/g2Dp2?=
 =?iso-8859-1?Q?gvdmaU7tlBut22DY+jGh16iSEKyDeMb2X9xBKw27SOwd6sfeqXL2rFeT2/?=
 =?iso-8859-1?Q?UFhD3+fsEYA2CN9g9fLlxliPyFHy70ZuZ0RiTLp6S8FyBmUtREMfekCfBM?=
 =?iso-8859-1?Q?DrPtVM+VQJyB2G2oQiMIK3+7VmMRZs1+2C7frUHa/UIHNPJ1Qt9/77CCZr?=
 =?iso-8859-1?Q?Y9AAp6VtVz8q5nALcmu6tNF2Yxc875XaPVN8GRQ1h1cw65t4QSQc7Q6SPA?=
 =?iso-8859-1?Q?v8xw9BRQXaO2lrxbIXGuZohaCjpDAa4ilnrFy3qJEAw3DwqZcxkUdkx2yX?=
 =?iso-8859-1?Q?m9Eq4sTxFRJdIZFEcguZ1J7Gs2hx6lMx6ZW1ey/Xm2hIsSdB/4EfhBUoRo?=
 =?iso-8859-1?Q?TKLMX8rD7fXrDxLwan5mTQSVkz8Cvu6T0MUYNhspJgVV3TNY/grsx8WFb8?=
 =?iso-8859-1?Q?8jCClLoqLa5IuzaHNEiS54jlQzb8PREwU/vC5CEthvMDpKjb9eF/MCgYJF?=
 =?iso-8859-1?Q?VXsnX4hmH3b3R3gRqTvC3nQk5NDzf8yLeDXojPnu3IGukcFg0etIGcbplD?=
 =?iso-8859-1?Q?7WZpsaYlkhl3WCzcDw056hD49d2UyB2UJkhoMunIlmuvgVkgbrK1e8TvzO?=
 =?iso-8859-1?Q?t8ZH55ywHZbVLAYU4nh3bPM63001z3eJ+J6rhRg2P4oLszk4VraSq03pgd?=
 =?iso-8859-1?Q?aPexoPxly521SZtLvPNkWUgclRphTmvnin73eYrAFt8vAtjW/SOhC4uFnJ?=
 =?iso-8859-1?Q?3mZyvJ/8eDEfJp86gDFALzAMbCJp8KTv+5xsQfJpB4ZHOfG+COO3Wu/wT+?=
 =?iso-8859-1?Q?d+WW8Dz/RDgTGaxZdDNTk9aDxvYXmZTBA6FPWFxLK+KRaMNaCWLmK52CzE?=
 =?iso-8859-1?Q?58/Ib7UUC8s8/5rYnLRIkXe3taGAM0123/RcOCQQqk3M1wUXRzl/2jA6Od?=
 =?iso-8859-1?Q?2PFHC8poXiF52nLaLLn1eMtqgURhMR3YHRC4y4GcRCc+j8wkKG/4FhVLz4?=
 =?iso-8859-1?Q?nkxUA0mfWM8R6Ht6zHHzFal2IkYMM6htRYawQ0tWNDT04fHdKvjW6e+x7Z?=
 =?iso-8859-1?Q?1L/iinD710R6OEB94S+2j1Ts88xbsFrXT7L2cXhyrHt+VZhiuFS97wS2oT?=
 =?iso-8859-1?Q?WlL0RADodzGbYdzxK1hLEXA+9Sr3e0NUTEaJhDMlqh2koiOSAApThGadeS?=
 =?iso-8859-1?Q?6sSnhCn5djp5hr39W82ulT9oUH/rVd34jfJIYWfI22PDvjX8EYf37DJIxV?=
 =?iso-8859-1?Q?TohGkWEh6G4ljhjyYJMTz1C4f8DYDNl7AKw8ulYol6vFlAHuxutoryGurn?=
 =?iso-8859-1?Q?Hqt3/9xmbqzGMHU04lCuzYJIIwmy4CpG774FiPmqo8mlxR7+kD09TKV1op?=
 =?iso-8859-1?Q?B/3lqjFUj6MPo=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(376014)(35042699022)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:23:50.8156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fcb43c-0780-462a-ad12-08de39927419
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_072359_750063_F43A82F5 
X-CRM114-Status: GOOD (  13.82  )
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

Make it mandatory to use the architected PPI when running a GICv5
guest. Attempts to set anything other than the architected PPI (23)
are rejected.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/pmu-emul.c | 14 ++++++++++++--
 include/kvm/arm_pmu.h     |  5 ++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 0baf8e0fe23bd..9925f10aa4fce 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -961,8 +961,13 @@ static int kvm_arm_pmu_v3_init(struct kvm_vcpu *vcpu)
 		if (!vgic_initialized(vcpu->kvm))
 			return -ENODEV;
=20
-		if (!kvm_arm_pmu_irq_initialized(vcpu))
-			return -ENXIO;
+		if (!kvm_arm_pmu_irq_initialized(vcpu)) {
+			/* Use the architected irq number for GICv5. */
+			if (vcpu->kvm->arch.vgic.vgic_model =3D=3D KVM_DEV_TYPE_ARM_VGIC_V5)
+				vcpu->arch.pmu.irq_num =3D KVM_ARMV8_PMU_GICV5_IRQ;
+			else
+				return -ENXIO;
+		}
=20
 		ret =3D kvm_vgic_set_owner(vcpu, vcpu->arch.pmu.irq_num,
 					 &vcpu->arch.pmu);
@@ -987,6 +992,11 @@ static bool pmu_irq_is_valid(struct kvm *kvm, int irq)
 	unsigned long i;
 	struct kvm_vcpu *vcpu;
=20
+	/* On GICv5, the PMUIRQ is architecturally mandated to be PPI 23 */
+	if (kvm->arch.vgic.vgic_model =3D=3D KVM_DEV_TYPE_ARM_VGIC_V5 &&
+	    irq !=3D KVM_ARMV8_PMU_GICV5_IRQ)
+		return false;
+
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (!kvm_arm_pmu_irq_initialized(vcpu))
 			continue;
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 96754b51b4116..0a36a3d5c8944 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -12,6 +12,9 @@
=20
 #define KVM_ARMV8_PMU_MAX_COUNTERS	32
=20
+/* PPI #23 - architecturally specified for GICv5 */
+#define KVM_ARMV8_PMU_GICV5_IRQ		0x20000017
+
 #if IS_ENABLED(CONFIG_HW_PERF_EVENTS) && IS_ENABLED(CONFIG_KVM)
 struct kvm_pmc {
 	u8 idx;	/* index into the pmu->pmc array */
@@ -38,7 +41,7 @@ struct arm_pmu_entry {
 };
=20
 bool kvm_supports_guest_pmuv3(void);
-#define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num >=3D VGIC_NR=
_SGIS)
+#define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num !=3D 0)
 u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx);
 void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 =
val);
 void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu, u64 select_idx,=
 u64 val);
--=20
2.34.1

