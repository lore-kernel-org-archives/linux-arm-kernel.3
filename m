Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F76CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5qDGzy/eJv9xKySx6sUI/7xHHsOek27l0jNegZHLmY=; b=PmXbRnB1qHHfu9J3GDY56c7OmA
	sRgtUCdlXNv3/jrCwWz7Bcx0WMN0YekkCJG0OtXsc2NJhdKgvA+TmfSxsbfUYu9pqYD/ks53S5OiI
	78E8rp2z16ir5ige1MHvGxXman0/lSqRFN+B7tARZYYRMbUVFwZ35LyHdDPkA/vNg71siXb5GRvE9
	5PaNdSCObh+1c5DgFGmWjJKo8M0u8kwq5XRvaUU7Czk5K6PLabEPriPWwrq9Tgdi1Mj6Bwj2yjwvj
	nyLkecbe9uFvJIIzN3PRh3bd5+vHzCNMaY8GLioVlD14qVacRkswXEGvjJcA218lK4MSaOCysy/Jt
	mVL96mYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdEh-00000004An9-1gVe;
	Wed, 20 May 2026 09:29:07 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdEe-00000004AmE-0D8o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:29:06 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bBmPlyeeFdvc94Jy0/4uZJ5yRf6E3fVw+xo3d0PutkTqltVHxZ/DhDGgHWUTxoWOG1aoMTwDExcTMiMDVhG8NXqer8gOLBc4WtfaFTXdRs5R0OGCgQhDwIOeW5bcG1IB4sLY8SS7XZ7U0pwQqEMcQwDNSbYdlt5pnx4p7+mGHxCNr8Ip5zn2O4mlh5ID3R7L2t3t0BX2HknOU9W05UTOh7+hcKKwa/B0AosHTX+jm3JA426xrJo6KD8DO977Javfld1SbuLpdl80PvDA65LnDHKYBmlj3OosahFWb/fdasNVYCPOy+n7cjrbirJXePdQiUPIlwpZME8dL0Rr+MyqoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5qDGzy/eJv9xKySx6sUI/7xHHsOek27l0jNegZHLmY=;
 b=Y54/itMw8lm+XCopibjVgZNWTUuVmjcHOGIRhaAM9dQIQxKEkZXZtqcLGS2I5xUCNBZSX632dBmC4QNQ7Gkkg4ojm2SoNR4DlVrd+Ee7d9n6cdRRzov+KLYuSxtocxkIvM7eaJbJfsViFDQQaopYQJJMHv9I5n7M3LblZQExQtRxqi9uWkeom87dBqbAnI6apNcfu1t+uc70QwvgeugsfiXrvEXFOCqloU4tKenH80hxY3IB09mE7CfZJg5CJVAyrnHNEcCWcjXGGqZTolIMjmV5y3rbA/qwzHn0gJ7A5F/2AF49iXVJyiQHce+1dpdGukivT2VkU/AhNd+0rz8KTg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5qDGzy/eJv9xKySx6sUI/7xHHsOek27l0jNegZHLmY=;
 b=NTj8OsXjbyVfTOzT/JOX7fp6a+l9q9zNh7O+M5+/fNkTfhvqA3G8/mtVmsx4KL5YL00KfZx5XkjN2uGLva4B5kz8ry3rFYkiW3knsbN4Oj1S/fRA5tnPehrfTnLEsfvgNBg5A0O2PYeIqu84OrGqnz7fb/BKKbONrfDQHZfeUG4=
Received: from AS4P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::8)
 by PAWPR08MB8885.eurprd08.prod.outlook.com (2603:10a6:102:339::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 09:28:51 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::2a) by AS4P191CA0013.outlook.office365.com
 (2603:10a6:20b:5d5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 09:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 09:28:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+6Ujtg6lu9u5ALrI3RnI3kHvmVypgy4ZiUm398nPkxOaOOKCA5gQ1c2MWE1EUh/hahZR8mbA7gY9aUWt4iUBVjrm1w6d2eB21B5jtz6ZQd59bJaxBuIiQm6++AnGEUTWHY4+c6brth8q84lkGx//baO91i6jq3GbeT+vgbqjRd+0N5AMEW+684wxiqqQZRrnKwiM630otefrasEFhkCcutWPsr44LgKKzrz0KNNoZgErwMJaHlX+IKRSW031/bVbYBrnOWeMDUsZAIq5yJ5g4esJx/ox2EuV81Wj97OOYZBV93OB+k0nEL7zpLokJXz2GeUdKEzXjex4bRCz63lTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5qDGzy/eJv9xKySx6sUI/7xHHsOek27l0jNegZHLmY=;
 b=SpzLOJH4OU++d1R3LEkEchv+DYdRZwfLsNSFaT2xmFvk0SlRZ89rDs0iXlFoKTo7g92gBPKLzl4ib/+faTUwXhYrUc+9vuuyv9cnOPUOYtua+F1boc+3vzO2redK3mf/iYbEHV3g7khNJ5oYgW5YjEoAvU3VyOySyD+Q8B0zg3O4FvFVXFDVzWaiPpOYaKPXzRkbEFYqjvDOJW0COXjKE6+rpRd8BzqK4iXxlrS0PXl1uKuqHQPGDHBfuPAwGDm7/+70SQcMAeRVrwa9fIJ01oOXPhQNIx7Y1ccMsYtKD4ocXexsjnezYNKVdWipcHnD1Fneoz0f6/Y3bjddyeb+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5qDGzy/eJv9xKySx6sUI/7xHHsOek27l0jNegZHLmY=;
 b=NTj8OsXjbyVfTOzT/JOX7fp6a+l9q9zNh7O+M5+/fNkTfhvqA3G8/mtVmsx4KL5YL00KfZx5XkjN2uGLva4B5kz8ry3rFYkiW3knsbN4Oj1S/fRA5tnPehrfTnLEsfvgNBg5A0O2PYeIqu84OrGqnz7fb/BKKbONrfDQHZfeUG4=
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by PR3PR08MB5705.eurprd08.prod.outlook.com (2603:10a6:102:93::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 09:27:45 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%4]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 09:27:45 +0000
From: Mike Leach <Mike.Leach@arm.com>
To: James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Suzuki Poulose <Suzuki.Poulose@arm.com>, Leo
 Yan <Leo.Yan@arm.com>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nd <nd@arm.com>
Subject: RE: [PATCH] coresight: fix resource leaks on path build failure
Thread-Topic: [PATCH] coresight: fix resource leaks on path build failure
Thread-Index: AQHc4nh1UNdTL6T2lEiMM6p1wXD+wbYVagyAgADImwCAAHBxgIAACtHw
Date: Wed, 20 May 2026 09:27:45 +0000
Message-ID: <PAVPR08MB9674C4C58210122F3A6E07AB8C012@PAVPR08MB9674.eurprd08.prod.outlook.com>
References: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
 <f347bad3-4a11-4f65-b35f-f59c6360ac5b@linaro.org>
 <5b3785a1-0f53-4b61-bc18-880091c2ce12@oss.qualcomm.com>
 <dea28a56-a5d8-46ef-a782-a95073714377@linaro.org>
In-Reply-To: <dea28a56-a5d8-46ef-a782-a95073714377@linaro.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PAVPR08MB9674:EE_|PR3PR08MB5705:EE_|AMS1EPF00000091:EE_|PAWPR08MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd715f6-b49f-4ae5-e12e-08deb65233d1
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|38070700021|11063799006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info-Original: Q1G9073eKsOrF43Rd5dKRQjdnj1dkQexfhmSanib6zj3tbpVL37qD/BO9KCj8vr63d8vq9MY2RlyroFa9mNSD6xXoI5KlL9OVpOnpUrRFD6+fLoedWccJJ1Awsk+cqWS9ouoeGp+ih2sw7VGIpoJ3ii8MjYHXrB3lul+ePmllBkPhOYXm9cymE+Li0BxqjJX5l9+B2lqGGtSMtEZAVtBUDAdB0fw45PUKx7uoFlKEXGGT+jGkI401AHWI8TXr9Uo/tJ1YnEs2pta+u7sgqN0lonvabLsqbprdSJ4q9Nph5RYo35xnsystLfSjl0uIhxzRh/t1qbtmdQHbpf+vM9dtpBjTP1S0LDDkcikDsR3lXjqEtRAG/lfHFna/iVNtdZF+ZmMy2N4xx4YiXuyHJQaFe1w2GADMlsA/mWKFnrNd+te3Uh9Y80qCecV6cjgbp7yTPUoCIuuSDFZE3Vselv63tlBBSo0l/i5iB1CQlWE9dTNukLY3pxS2ftjGzeHi2Dr+Aorhi5RxBCI2cFezdq20nTtxnCtDNmEwhhRyd/JjSoLKVBGgyLesWVx0/J7Cnk6mSlH7Jf4NY63Ajt2XBo1wEVl+lgjluHSlx238CxqGGCaex1R2kyvIhxeSsAVWfDPbYGK3cleXpSfd5NjNFsuSCxcjoWxQPH1kthC2dU1R4EKuMH4WI6BjZxck7xWgX2L
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(5023799004);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kU5uC3kmLWe8PbItqlWTFgb/3JqAGFF1qFfMlHUddIbO2107WyPDScc7McCgn3F8uoX1TkqPogXUNcofX3O9mJMf25wYwRGET8y9GzFTEozH6TkfHDwGJb3795Bh51FsNniQmHk4AkgeyLHSwO6ywRfjUqmGvUUkGCRLIE9XHeVXZ4pBAsiAGLXPM5w32BcZ2CiA7vzNcx15s7WrZyx9ZXQaMQov37YWtIXh0I0zusOXsiG58R7dLS0wb8zKpNL/HseluKLg0oPSfYe5ivgLwcKClJ125tR3pZz1P7OwwOeKEkrlJR7PmE5gpIjIGzC+Ue8z9LwNFq4GT0bs4CSClA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5705
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c362a22c-15df-4a2a-5666-08deb6520ce2
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|14060799003|1800799024|35042699022|56012099003|22082099003|18002099003|11063799006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info: tz+ZpNYz0xRQbxUcVdaJ/kjVkz7lT9jMGXur/agBcFXLcRRyNsBTDmpjVYmtIXkltM79M+sBi0QzCdbLb1xufbhRhzL0+bRSAdAtbT7eaSr1cbBFbmLkdHWBNV1fnVll2wuoz894ZJ42FHW+67V97WW1HxpXM2EFo3Q6QZfN2vNwRk8Av1JuSWzMt1ucWa+sJs2N6exBkNz0ELH/9qcItoXIXQHgYj6dbyWlNT4RvDaMU/UTKxzHAcvm4yb0Lwp1sYaYRvecoA2J7IuQtVBbW3QdjFLeqDLIJeSmlWetjE3LaJGGgvcsL/5DzV5VU2tom5RDe17hP/1JrUqLxTNEf/y7AOsvWdKWIUfWOVRrOqEm5oRaudgXVoPyXN2xtbHbkkkgru8/4W/aSn4Nydl0uPf2KrQSjCD9L2CQCSvrNPqx3Rus5igY7vnd0L054TleqeShjkvZ00UxhYgmKF02qWLbBMUlDAwnLAWLVqfH2gKVolnE9+zuBhZlVM53ht6034qlQ4ZirUlmYjQf5OKZF7gkT2ZANmP7wPJVKKC9TbNqS5i9oltitAEvvA9e4WgKUqL4vMyNqu7lvd5ETTWCCQFpxTy+oKTDXSAX24tJQ8pyRYHWxjgEvDZ5TRPSQrMdpW+KZU4X+jyyN432/S2021ehJjosZXEC5eBU6Nd8Be7EyOnWAaB0YtcFnfF/YywY
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(14060799003)(1800799024)(35042699022)(56012099003)(22082099003)(18002099003)(11063799006)(4143699003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3JExt3oBbOxOcSyrnGEJEuL50HaTxvhg2i9fp727eooY7a9a9lRG2H8Np7LprMw4Yq++FSJ4IN+JWyxhEUWiuRDXal4sYKO/uhQNwBiMFyyMrxDiG/FYg/ChJKgJPXC2nzCgoWJVGcZtNaaUKQwdH6t59GtPVpVlqKKgpu4t1z+XU33GpRLZ3CunsjHxPiXtCCz1iHIAwISOSdAo8PxV6/J7no/cXGSHK2MNYm9hTJD5K7CcbLLI03ES/4RAwh6tAeFVhqfjSzTlLylhL6MqUsSDg7Ted/NFrlxOmMTEmo37hAWhP2igv1yKgvsKw0rwg4SKnB3V09RKLk7WL7VeOieq0hsoBcp1Fgucj7vXoeXx4lc/S3BQFHG8n5u2gDzkTMgilzZHmf05ZKBs/tiWk8eVwbAcrOBAnw6zbs66yb+V5bb/gEOKj9Kwh/YBzmsq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 09:28:50.5107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd715f6-b49f-4ae5-e12e-08deb65233d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8885
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_022904_236869_50FF6A8A 
X-CRM114-Status: GOOD (  19.79  )
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFtZXMgQ2xhcmsgPGph
bWVzLmNsYXJrQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDIwLCAyMDI2IDk6
MzggQU0NCj4gVG86IEppZSBHYW4gPGppZS5nYW5Ab3NzLnF1YWxjb21tLmNvbT4NCj4gQ2M6IGNv
cmVzaWdodEBsaXN0cy5saW5hcm8ub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBTdXp1a2kgUG91bG9zZSA8
U3V6dWtpLlBvdWxvc2VAYXJtLmNvbT47IE1pa2UNCj4gTGVhY2ggPE1pa2UuTGVhY2hAYXJtLmNv
bT47IExlbyBZYW4gPExlby5ZYW5AYXJtLmNvbT47IEFsZXhhbmRlcg0KPiBTaGlzaGtpbiA8YWxl
eGFuZGVyLnNoaXNoa2luQGxpbnV4LmludGVsLmNvbT47IE1hdGhpZXUgUG9pcmllcg0KPiA8bWF0
aGlldS5wb2lyaWVyQGxpbmFyby5vcmc+OyBUaW5nd2VpIFpoYW5nDQo+IDx0aW5nd2VpLnpoYW5n
QG9zcy5xdWFsY29tbS5jb20+OyBHcmVnIEtyb2FoLUhhcnRtYW4NCj4gPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBjb3Jlc2lnaHQ6IGZpeCByZXNv
dXJjZSBsZWFrcyBvbiBwYXRoIGJ1aWxkIGZhaWx1cmUNCj4gDQo+IA0KPiANCj4gT24gMjAvMDUv
MjAyNiAyOjU1IGFtLCBKaWUgR2FuIHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBPbiA1LzE5LzIwMjYg
OTo1NyBQTSwgSmFtZXMgQ2xhcmsgd3JvdGU6DQo+ID4+DQo+ID4+DQo+ID4+IE9uIDEzLzA1LzIw
MjYgMjozMiBhbSwgSmllIEdhbiB3cm90ZToNCj4gPj4+IFR3byByZWxhdGVkIGxlYWtzIHdoZW4g
X2NvcmVzaWdodF9idWlsZF9wYXRoKCkgZW5jb3VudGVycyBhbiBlcnJvciBhZnRlcg0KPiA+Pj4g
Y29yZXNpZ2h0X2dyYWJfZGV2aWNlKCkgaGFzIGFscmVhZHkgaW5jcmVtZW50ZWQgdGhlIHBtX3J1
bnRpbWUsDQo+IG1vZHVsZSwNCj4gPj4+IGFuZCBkZXZpY2UgcmVmZXJlbmNlcyBmb3IgYSBub2Rl
Og0KPiA+Pj4NCj4gPj4+IDEuIEluIF9jb3Jlc2lnaHRfYnVpbGRfcGF0aCgpLCBpZiBremFsbG9j
X29iaigpIGZvciB0aGUgcGF0aCBub2RlIGZhaWxzDQo+ID4+PiDCoMKgwqAgYWZ0ZXIgY29yZXNp
Z2h0X2dyYWJfZGV2aWNlKCkgc3VjY2VlZHMsIGNvcmVzaWdodF9kcm9wX2RldmljZSgpIHdhcw0K
PiA+Pj4gwqDCoMKgIG5ldmVyIGNhbGxlZCwgcGVybWFuZW50bHkgbGVha2luZyBhbGwgdGhyZWUg
cmVmZXJlbmNlcy4NCj4gPj4+DQo+ID4+PiAyLiBJbiBjb3Jlc2lnaHRfYnVpbGRfcGF0aCgpLCBv
biBmYWlsdXJlIHRoZSBwYXJ0aWFsIHBhdGggd2FzIGZyZWVkIHdpdGgNCj4gPj4+IMKgwqDCoCBr
ZnJlZShwYXRoKSBpbnN0ZWFkIG9mIGNvcmVzaWdodF9yZWxlYXNlX3BhdGgocGF0aCkuwqAga2Zy
ZWUoKSBvbmx5DQo+ID4+PiDCoMKgwqAgZnJlZXMgdGhlIGNvcmVzaWdodF9wYXRoIHN0cnVjdCBp
dHNlbGY7IGl0IGRvZXMgbm90IGl0ZXJhdGUNCj4gPj4+IHBhdGhfbGlzdA0KPiA+Pj4gwqDCoMKg
IHRvIGNhbGwgY29yZXNpZ2h0X2Ryb3BfZGV2aWNlKCkgYW5kIGtmcmVlKCkgZm9yIGVhY2ggY29y
ZXNpZ2h0X25vZGUNCj4gPj4+IMKgwqDCoCBhbHJlYWR5IGFkZGVkIGJ5IGRlZXBlciByZWN1cnNp
dmUgY2FsbHMsIGxlYWtpbmcgYm90aCB0aGUNCj4gPj4+IHBtX3J1bnRpbWUsDQo+ID4+PiDCoMKg
wqAgbW9kdWxlLCBhbmQgZGV2aWNlIHJlZmVyZW5jZXMgYW5kIHRoZSBub2RlIG1lbW9yeSBmb3Ig
ZXZlcnkgZWxlbWVudA0KPiA+Pj4gwqDCoMKgIG9uIHRoZSBwYXJ0aWFsIHBhdGguDQo+ID4+Pg0K
PiA+Pj4gRml4IGJvdGggYnkgYWRkaW5nIGNvcmVzaWdodF9kcm9wX2RldmljZSgpIGluIHRoZSBP
T00gdW53aW5kIG9mDQo+ID4+PiBfY29yZXNpZ2h0X2J1aWxkX3BhdGgoKSwgYW5kIHJlcGxhY2lu
ZyBrZnJlZShwYXRoKSB3aXRoDQo+ID4+PiBjb3Jlc2lnaHRfcmVsZWFzZV9wYXRoKHBhdGgpIGlu
IGNvcmVzaWdodF9idWlsZF9wYXRoKCkuDQo+ID4+Pg0KPiA+Pj4gRml4ZXM6IDMyYjA3MDdhNDE4
MiAoImNvcmVzaWdodDogQWRkIHRyeV9nZXRfbW9kdWxlKCkgaW4NCj4gPj4+IGNvcmVzaWdodF9n
cmFiX2RldmljZSgpIikNCj4gPj4+IEZpeGVzOiBiM2U5NDQwNTk0MWUgKCJjb3Jlc2lnaHQ6IGFz
c29jaWF0aW5nIHBhdGggd2l0aCBzZXNzaW9uIHJhdGhlcg0KPiA+Pj4gdGhhbiB0cmFjZXIiKQ0K
PiA+Pj4gU2lnbmVkLW9mZi1ieTogSmllIEdhbiA8amllLmdhbkBvc3MucXVhbGNvbW0uY29tPg0K
PiA+Pj4gLS0tDQo+ID4+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0
LWNvcmUuYyB8IDYgKysrKy0tDQo+ID4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3
dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWNvcmUuYyBiL2RyaXZlcnMvDQo+ID4+PiBod3Ry
YWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jb3JlLmMNCj4gPj4+IGluZGV4IDQ2ZjI0N2Y3M2Nm
Ni4uYzEzNTRlYThlMTFkIDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9od3RyYWNpbmcvY29y
ZXNpZ2h0L2NvcmVzaWdodC1jb3JlLmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvaHd0cmFjaW5nL2Nv
cmVzaWdodC9jb3Jlc2lnaHQtY29yZS5jDQo+ID4+PiBAQCAtODI1LDggKzgyNSwxMCBAQCBzdGF0
aWMgaW50IF9jb3Jlc2lnaHRfYnVpbGRfcGF0aChzdHJ1Y3QNCj4gPj4+IGNvcmVzaWdodF9kZXZp
Y2UgKmNzZGV2LA0KPiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+ID4+PiDC
oMKgwqDCoMKgIG5vZGUgPSBremFsbG9jX29iaihzdHJ1Y3QgY29yZXNpZ2h0X25vZGUpOw0KPiA+
Pj4gLcKgwqDCoCBpZiAoIW5vZGUpDQo+ID4+PiArwqDCoMKgIGlmICghbm9kZSkgew0KPiA+Pj4g
K8KgwqDCoMKgwqDCoMKgIGNvcmVzaWdodF9kcm9wX2RldmljZShjc2Rldik7DQo+ID4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07DQo+ID4+PiArwqDCoMKgIH0NCj4gPj4+IMKg
wqDCoMKgwqAgbm9kZS0+Y3NkZXYgPSBjc2RldjsNCj4gPj4+IMKgwqDCoMKgwqAgbGlzdF9hZGQo
Jm5vZGUtPmxpbmssICZwYXRoLT5wYXRoX2xpc3QpOw0KPiA+Pj4gQEAgLTg1MSw3ICs4NTMsNyBA
QCBzdHJ1Y3QgY29yZXNpZ2h0X3BhdGgNCj4gPj4+ICpjb3Jlc2lnaHRfYnVpbGRfcGF0aChzdHJ1
Y3QgY29yZXNpZ2h0X2RldmljZSAqc291cmNlLA0KPiA+Pj4gwqDCoMKgwqDCoCByYyA9IF9jb3Jl
c2lnaHRfYnVpbGRfcGF0aChzb3VyY2UsIHNvdXJjZSwgc2luaywgcGF0aCk7DQo+ID4+PiDCoMKg
wqDCoMKgIGlmIChyYykgew0KPiA+Pj4gLcKgwqDCoMKgwqDCoMKgIGtmcmVlKHBhdGgpOw0KPiA+
Pj4gK8KgwqDCoMKgwqDCoMKgIGNvcmVzaWdodF9yZWxlYXNlX3BhdGgocGF0aCk7DQo+ID4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVSUl9QVFIocmMpOw0KPiA+Pj4gwqDCoMKgwqDCoCB9
DQo+ID4+Pg0KPiA+Pj4gLS0tDQo+ID4+PiBiYXNlLWNvbW1pdDogZTk4ZDIxYzE3MGIwMWRkZWYz
NjZmMDIzYmJmY2Y2YjMxNTA5ZmE4Mw0KPiA+Pj4gY2hhbmdlLWlkOiAyMDI2MDUxMy1maXgtbWVt
b3J5LWxlYWstaXNzdWUtMDM0YjRhNDUyNjVlDQo+ID4+Pg0KPiA+Pj4gQmVzdCByZWdhcmRzLA0K
PiA+Pg0KPiA+PiBMb29rcyBnb29kIHRvIG1lLCBidXQgc2FzaGlrbyBpcyBjb21wbGFpbmluZzog
aHR0cHM6Ly9zYXNoaWtvLmRldi8jLw0KPiA+PiBwYXRjaHNldC8yMDI2MDUxMy1maXgtbWVtb3J5
LWxlYWstaXNzdWUtDQo+ID4+IHYxLTEtNDk4MjJkN2JjN2Q0JTQwb3NzLnF1YWxjb21tLmNvbQ0K
PiA+Pg0KPiA+PiBJJ20gdHJ5aW5nIHRvIHVuZGVyc3RhbmQgd2h5IGl0J3Mgc2F5aW5nIHRoYXQs
IGJ1dCBJIHRoaW5rIHRoZQ0KPiA+PiBzY2VuYXJpbyBpcyB0aGF0IGlmIHRoZXJlIGFyZSBtdWx0
aXBsZSBjb3JyZWN0IHBhdGhzIHRvIGEgc2luaywgd2hlbg0KPiA+PiBvbmUgcGF0aCBwYXJ0aWFs
bHkgZmFpbHMgYW5kIGEgc2Vjb25kIHBhdGggc3VjY2VlZHMgeW91IGNvdWxkIGdldCBhDQo+ID4+
IHBhdGhfbGlzdCB3aXRoIHNvbWUgZ2FyYmFnZSBlbnRyaWVzIGluIGl0Lg0KPiA+DQo+ID4gSSB0
aGluayB0aGUgY29yZXNpZ2h0X3JlbGVhc2VfcGF0aCBpcyBhZGRlZCB0byBhZGRyZXNzIHRoaXMg
c2l0dWF0aW9uLg0KPiA+IFdlIHN1ZmZlcmVkIHRoZSBwYXRoIHBhcnRpYWxseSBmYWlsdXJlLCBh
bmQgd2UgbmVlZCByZWxlYXNlIGFsbCBub2Rlcw0KPiA+IGFscmVhZHkgYWRkZWQgdG8gdGhlIHBh
dGguDQo+ID4NCj4gDQo+IEl0IHdvdWxkbid0IGNhbGwgY29yZXNpZ2h0X3JlbGVhc2VfcGF0aCgp
IGluIHRoaXMgY2FzZSB0aG91Z2guIElmIG9uZQ0KPiBwYXRoIGVuZHMgdXAgYnVpbGRpbmcgdG8g
c3VjY2VzcyBidXQgYSBwYXJhbGxlbCBwYXRoIHBhcnRpYWxseSBmYWlsZWQNCj4gdGhlbiBfY29y
ZXNpZ2h0X2J1aWxkX3BhdGgoKSBzdGlsbCByZXR1cm5zIHN1Y2Nlc3MuIER1cmluZyB0aGUgc2Vh
cmNoIGl0DQo+IHdvdWxkIGhhdmUgc3RpbGwgYWRkZWQgdGhlIG5vZGVzIGZyb20gdGhlIHBhcnRp
YWxseSBmYWlsZWQgcGF0aCB0byB0aGUNCj4gcGF0aF9saXN0LiBUaGlzIGlzIG9ubHkgYW4gaXNz
dWUgaWYgdGhlcmUgYXJlIG11bHRpcGxlIGNvcnJlY3QgcGF0aHMuDQo+IA0KPiA+Pg0KPiA+PiBU
aGF0J3Mga2luZCBvZiBhIGRpZmZlcmVudCBhbmQgZXhpc3RpbmcgaXNzdWUgdG8gdGhlIG9uZSB5
b3UndmUgZml4ZWQsDQo+ID4+IGFuZCBhc3N1bWVzIHRoYXQgbXVsdGlwbGUgcGF0aHMgdG8gb25l
IHNpbmsgYXJlIHBvc3NpYmxlLCB3aGljaCBJJ20NCj4gPj4gbm90IHN1cmUgaXMgc3VwcG9ydGVk
Pw0KPiA+DQo+ID4gRWFjaCBwYXRoIGlzIHVuaXF1ZS4gV2Ugb25seSBkZWFsIHdpdGggdGhlIGlz
c3VlIHBhdGggZm9yIGJhbGFuY2luZyB0aGUNCj4gPiByZWZlcmVuY2UgY291bnQuDQo+ID4NCj4g
PiBUaGFua3MsDQo+ID4gSmllDQo+ID4NCj4gDQo+IEknbSBub3QgZXhhY3RseSBzdXJlIHdoYXQg
eW91IG1lYW4gYnkgdW5pcXVlLCBidXQgdGhlIHNhbWUgc291cmNlIGFuZA0KPiBzaW5rIGNvdWxk
IHBvdGVudGlhbGx5IGJlIGNvbm5lY3RlZCB0aHJvdWdoIHR3byBkaWZmZXJlbnQgc2V0cyBvZiBs
aW5rcy4NCj4gDQoNCk11bHRpcGxlIHBhdGhzIGJldHdlZW4gYSBzb3VyY2UgYW5kIHNpbmsgYXJl
IG5vdCBwZXJtaXR0ZWQgdW5kZXIgdGhlIENvcmVTaWdodCBzcGVjLg0KDQpJZiBzdWNoIGEgc3lz
dGVtIHdhcyB0byBiZSBidWlsdCAtIHRoZW4gYSBmaXggd291bGQgbmVlZCB0byBiZSBpbiB0aGUg
ZGVjbGFyYXRpb24gb2YgY29ubmVjdGlvbnMgLSBlLmcuIG1pc3Mgb25lIHBhdGggb3V0IGluIHRo
ZSBkZXZpY2UgdHJlZSBmb3IgZXhhbXBsZS4gTm90IHVwIHRvIHRoZSBDb3Jlc2lnaHQgZHJpdmVy
cyB0byBoYW5kbGUgb3V0IG9mIHNwZWNpZmljYXRpb24gaGFyZHdhcmUuDQoNCk1pa2UNCg0KDQo+
ID4+DQo+ID4+IEl0IG1pZ2h0IGJlIGFzIGVhc3kgYXMgYnJlYWtpbmcgdGhlIGxvb3AgZWFybHkg
Zm9yIGFueSByZXR1cm4gdmFsdWUNCj4gPj4gb3RoZXIgdGhhbiAtRU5PREVWLCBidXQgSSdsbCBs
ZWF2ZSBpdCB0byB5b3UgdG8gZGVjaWRlIHdoZXRoZXIgdG8gZG8NCj4gPj4gdGhhdCBoZXJlIG9y
IG5vdC4NCj4gPj4NCj4gPj4gUmV2aWV3ZWQtYnk6IEphbWVzIENsYXJrIDxqYW1lcy5jbGFya0Bs
aW5hcm8ub3JnPg0KPiA+Pg0KPiA+DQoNCg==

