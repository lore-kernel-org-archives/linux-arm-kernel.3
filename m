Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D67FF89246
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozwQT1y+Q1fPwH9b2LIcDrWOA8g6EXbBCBOJzrlpydg=; b=ivhqWHFJ2j1znKAc5/d4eM2T++
	zce3t1o8Ap7abaFp+3ciFzdlkEvjvtqrQP+mu2LKRe+4y+lxxd6i/8ZibFaUqYHswEruPKQr1FrCE
	8sW048/7DBm6S/okdc9/Seou4uoU3RvuPMumTmAdcq7pPgJA//tdAws/WKyevw5zv0eLVWKvf9Ieh
	01ifq3jLZNYLzUZDhIxNzrfs4ZCAzs1rm+u3pWw+3b1laKvaxgWhiZtYyXeBJeMGQl2dlCGvidDvS
	I7hSxFqYtu2aYnp1ycODU7OPhvb/H5GjUrNotTOJWsHig5MFxzO9QR1rh770frZ2FN/RUHWimMVg9
	3f7sQ5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7tl-00000008Nym-3sCO;
	Tue, 21 Apr 2026 10:00:05 +0000
Received: from mail-francecentralazon11013031.outbound.protection.outlook.com ([40.107.162.31] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7ti-00000008NxE-0e1V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:00:03 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZlilkQqOY9QdbKqnlX8xdPVPNFzPbcNwhP9LmfCP+zdPi99hnTLgDElL0szcmSscgt7UXbWBmLp3A7F/EWzLWQRR0AcuNo4ZxgBVVX3GzKo0kS0wKg6DeeJ64x8QtkKvJSuDSIgCQgtoX9yUar31YbCRkQAcN9EMOYsJjgFK9YiXPDjSlp9qjMqoss/diLjAbertpsFO55M0Qk1EZZCm/Y9w/6xkm9w78ADoty2O9PATqbxFUmR5T7AFN48NIFixauMUEgGOhQQWHDAxcElyaaomJBig0jSZ0wydXEtf9X0gF2HlT/RtZlbrQ+xVn0C2CdErAgD7Q7L1UIfqk1A9cQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozwQT1y+Q1fPwH9b2LIcDrWOA8g6EXbBCBOJzrlpydg=;
 b=C7QebSMgMVsJiVjS8w8cjSywEpXbI8Jd60CDZ18lB2B13j0YMPkWZR87+RiWyR9jwHLeIRGcouk7lu7ZV3WjoIm7Arj+8dQuGWmIlUcN5Rnmrtd4EGBDW+BCE5uSwA0MM6n3PY1BR1JE3dgRVOJF6R5CpAkD5lH16WOvj6UoeKOSSE57Zfuzc7yGn1jOrl96aVPGx+ERhZVVNCc2RlzTUYmtoktq7C0INfbTMjhVyBvw/av7CyDGc9+ccyiTawPLo07ILCF57xMzYdJZNtqYqH5n7iaOUU2bzHMa2affpHrKS3JnK+4vRKcpjZl25z+j09MTtQjOpv87R24r7b9Q4g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozwQT1y+Q1fPwH9b2LIcDrWOA8g6EXbBCBOJzrlpydg=;
 b=N0V0HyVSkoYv55Ireu2/X5+biQ4cUqN1Hmib4QuYSa07JZocsnnXQ3k3YOKnRMPgrzcd6bTgLMpFdaplW3NH7bbMVwZsxs8ukEpIJU0+bx8mIwoVnVX34W+O1vQXCMPRAB5u9gvxYQsaIZNPmV5kh18enwh9vyAYYZXXRPLEteU=
Received: from AS4P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::18)
 by VI0PR08MB11685.eurprd08.prod.outlook.com (2603:10a6:800:316::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 09:59:53 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::8d) by AS4P191CA0003.outlook.office365.com
 (2603:10a6:20b:5d5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 09:59:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Tue, 21 Apr 2026 09:59:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8ePxtkqGHgquB1gA+GL1RzTOMZWUCLhz2q+AqKh1caypgTQZE83Hn4qSf/Arnwj9brbBFeb6qfZT+0dTGehoq7FYjBzT9uxkm6caEGp4w+TjRRrRbFFKTg6+kmar3k688ZaMRmWRSiXuHVnpzeviP7gc9zo9AklCcZcDRNlpJ7yeVzCk5ud37yUg1OffWI/VT+Dj5lfcTLt5p0zyHyg0VtvwgIAM38T1SeUAlN+x0+XOQgV15fEdyGLtCCBWj8avaS+r2ix218TvD/A3bp1x0IybFHZqD/Kg4JhyVQUkgdKchvag9kK2EZ0AeIZx8/soEadTKBpDILawTjnhDUGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozwQT1y+Q1fPwH9b2LIcDrWOA8g6EXbBCBOJzrlpydg=;
 b=WgAXGKqif+DTVfTIkDmluwu8TMpxT5r4ow4CSy4wiTg5RGBiRHL+km4ltTPSxaVDe9jH3z0hPd2U3mzL+o//fSv595INxt4a0DPv+vg1tZbn1qg2DqCRV2MyHH0ItsaXXoNR8VtcctdJvyjXHz4s5auVumfmnd2LC1jlb+ZxQd5S43N0cmGQ23GiFojd4zp7TLX/iR8EuuKC4ZPB8BCgFlRdKLQQHxsVjCPE3o42X0BBbUD/X4k06KF4yKRkfx9xArA0fk1WV1+x5Y1zR0E+OJOMZU3AkTxkx00GDnxGyfuwRAwhNw3EcjC4yvSbSmg4P7i5tWsZaKu4Avf4WoRPuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozwQT1y+Q1fPwH9b2LIcDrWOA8g6EXbBCBOJzrlpydg=;
 b=N0V0HyVSkoYv55Ireu2/X5+biQ4cUqN1Hmib4QuYSa07JZocsnnXQ3k3YOKnRMPgrzcd6bTgLMpFdaplW3NH7bbMVwZsxs8ukEpIJU0+bx8mIwoVnVX34W+O1vQXCMPRAB5u9gvxYQsaIZNPmV5kh18enwh9vyAYYZXXRPLEteU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by DU0PR08MB9201.eurprd08.prod.outlook.com (2603:10a6:10:415::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 09:58:50 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%4]) with mapi id 15.20.9818.032; Tue, 21 Apr 2026
 09:58:50 +0000
Message-ID: <f2b0dcc5-8002-4ee9-a219-fb361573a9c3@arm.com>
Date: Tue, 21 Apr 2026 10:58:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] coresight: etm4x: exclude ss_status from
 drvdata->config
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-5-yeoreum.yun@arm.com>
 <20260416155118.GM356832@e132581.arm.com>
 <57dbea1b-670b-4b8f-a590-1d4239bc2c76@arm.com>
Content-Language: en-US
From: Mike Leach <mike.leach@arm.com>
In-Reply-To: <57dbea1b-670b-4b8f-a590-1d4239bc2c76@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0206.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36d::12) To PAVPR08MB9674.eurprd08.prod.outlook.com
 (2603:10a6:102:31d::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAVPR08MB9674:EE_|DU0PR08MB9201:EE_|AMS0EPF0000019B:EE_|VI0PR08MB11685:EE_
X-MS-Office365-Filtering-Correlation-Id: 733de7b4-8925-4cab-c8fc-08de9f8cbbd2
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 5EdxTj2ZKehbiq7gTdjPfTqnz76o9Iw3rpzMMQ71SfIuTut9E5aee5RkvaV06Rz7iLaIeKVJ6G6WcVPO2E8TqzIrbPghT3qTH5u/ZLr3eIIh/DDltryZ5O3e393tvtm05+IMLn++7Sh0ycG4HgGq4fSApJSOgg0qJ0cDpy6CkOw6Ewwg7JVvUTgSCmWWUiZP8GCVaaOg3wH1Pfjf34yq9SFTZn41/tBnc7TgvCkZjw7rPaZgoM422GNDlGeaRYjZvHRE0oBfxCg2gawIWX5CQy5o5fEWA5BLMEMQLvP8lL7xK1/JDL8EX5OlocM7lE/Xohn1ittCVZWa5yIAkx2hrLz8vSKCrIH9dYYPkauKLr9+XMZPfsbRG/3t0zx/06d4U0xmfk5dauJeCUwS3WtHda9l+pN18OFZv6jnONulBwSKhvVqOSCS3PNwYyRauHZsUA8niAjd96l2h8UpxkyntvIiXGpVP169+Xy8ZDhUtUwe5+nbYbfElh2PuBv0mW/N0ikyqMWDmIz+LJMKP70ggc4EONKDyA4lminYCkPXAbUowl47Ln6D40G08zOZt5OWr1QcZJRb4ClQ47GL2cYI/9p7zplvqZMdi5+syUVJ4EHrbXFOD8tDxCyANLe9dmMHd2GZocrh+EAV73Im1ui9YFc37pVuaOPaXZtHXglBqj5bJ29JETHxokQUiPnH3drRDe2CG2s2mz28juVOn4AfHpNxH7M9zkIhKqeCAMcAeBw=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: qFe/wwQ4pZincx0/Wll10b0umLhPfFwX6UWigxBvHH6C7HTf4JBjijfBK3FAmFo878VTxy+dzLI4a33BTeeEjpmdKJBJFz2epBQxsjiobvxYfme/WsNQ4O52EzQRp7MKssSQLBxXMAaBslIT1em4ApCrLyoC6Tm7tUK1Z2nDnPVp4rAmMJhQl756T81HLe7i650Omv8F1oSyhW9pyulIbHsYZKjjCjSf2yVIidlH6ckh0qRUzAumvV19IepLPYY8pK7CFSLvaRGffBBIRVFYELQ/Ch+3Dmq2w3z0YE+uCOKVwK7L5x8BW+aTdAb3D8fS4w3X6hRbb8iTAuvRl3CDCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9201
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4d0d0118-f1e8-468d-f1f3-08de9f8c9661
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|14060799003|36860700016|1800799024|82310400026|35042699022|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: UnouLyYVps8a+vY7blWWCSR1wimvXQr5wWchgzPlfVXtNHnY9yzhBn4Qu8K997i2cpGB0cnSrtxbVk6m0FrsVMX1LnY5IlRDF67xor1dkPPX6SozDsorTxM5HBYX4bjHmpRoOP1xl+3yIMj8LBb3Vbui2SWSLY6pJKcORVR0BQIvH3alXZ4TOL6ja70Aoj+/e1myP32Hg/HPuCsI3t7nEmQhBzw/tszqu66p0+vyAD6aiuSmTfZj+DrPiaclJnojFXkORt5k2gIUnZ6WTebjpOikiiZIQ4ovXoT25WjS7pUhhLp+leokPbr7rhWo31V5gdXJlz/JvGYka6wR727kwSS1ccXbTx9Il9JqgKQxfUc8jbN2FbrVjwrmnByrN1rQaPKUWcVNYIbvBVis6uuHuF9BbA5p/okr3afGvRmdiP6eI2dufsCXd6N0VKcseTk+h/dC8DqsEfOkPDLMYURiruOnLGFeSCmQUw4XzpFab9Vn+J/B2Jl3EI96nsYh/+jAXGRAdoAi+sU5NHv+s+DRwv+K/bcnR2dZxNTTxFlCCkVvuBTub5RopgrLN+0UAfSWYaudg3Pn4qBp6GE3UQnojv2p5BzJtDFB9jtkeN3rNUWvPW1wanCS86m4gh9P58L07D7Uo5HPDMFvxGtUD+/2jAhrMKUULUgjaHLGCj+4skg/jo4ux5diYVw4r2mA/K8ZwHdyAC1jesGWJtbzd8dX2TlAqM52oP1xzL120XxuZMQXOHt2GjzDwzahzwQC5npw3VkBPRh3eDxb7AR1DaGzyA==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700016)(1800799024)(82310400026)(35042699022)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: W2U+VVxygx9T0GZ/ZCpdsLweffvUqRxZ0t0mXaA0KIfJduuoNUxdaU81b3l6fK+XbXNrosTLY7dMvuoS2QPntuJcr/qrBkgr1ynQLJZrMWPmrT6ZDs+R0WFXC1+NZt/tM7GupYV8Aw+EAColjwwRBvlR7KAPNp8/RdGqXdzpfvTlaJ3qcGkXDfRb7XXLowTMErnR/BlSgufOtcCS821TE5sDwLECh4VWVPbGghASBvWIK8S34Rp78hviNSI2sCaSd7Jawo67xRGw5ofgTt24SKL0jJe6rg6mnN+CzSb/fMg1SxgdJrmGJx7x/7+HZwI/5gG7HYtiq4+/j7CJ5piQrVbqfFgsWTSttsscrp7gvLdbS5AA7dTVjZ9+sFp/8VMKBi0IJyF9faOMq6dUrm7v4epvdPEyuBcxlWOYb0q7xF0/g1PBaWzkF9k+nWiU5zme
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 09:59:52.7683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 733de7b4-8925-4cab-c8fc-08de9f8cbbd2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11685
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_030002_318251_C85C55DD 
X-CRM114-Status: GOOD (  20.45  )
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

Hi,

This register [bit 31] indicates if a single shot comparator has 
matched. So read-back provides information to the user post run to 
determine which if any of the comparators set in this way has actually 
matched.

Moreover, the specification states "Software must reset this bit to 0 to 
re-enable single-shot control" and "Reset state is unknown. STATUS must 
be written to set an initial state...."

Therefore this register must be written as part of any configuration so 
should be available in the drvdata->config for both read and write,

Regards

Mike

On 4/21/26 09:57, Suzuki K Poulose wrote:
> On 16/04/2026 16:51, Leo Yan wrote:
>> On Wed, Apr 15, 2026 at 05:55:20PM +0100, Yeoreum Yun wrote:
>>
>> [...]
>>
>>> @@ -573,11 +573,9 @@ static int etm4_enable_hw(struct etmv4_drvdata 
>>> *drvdata)
>>>           etm4x_relaxed_write32(csa, config->res_ctrl[i], 
>>> TRCRSCTLRn(i));
>>>       for (i = 0; i < caps->nr_ss_cmp; i++) {
>>> -        /* always clear status bit on restart if using single-shot */
>>> -        if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
>>> -            config->ss_status[i] &= ~TRCSSCSRn_STATUS;
>>>           etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
>>> -        etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
>>> +        /* always clear status and pending bits on restart if using 
>>> single-shot */
>>> +        etm4x_relaxed_write32(csa, 0x0, TRCSSCSRn(i));
>>
>> In Arm ARM, D24.4.60 TRCSSCSR<n>, bits[0..3] are RO.  I think it is
>> fine for directly clear the regiser with zero (means it will only
>> clear status / pending bits).
>>
>> [...]
>>
>>> @@ -1841,10 +1839,11 @@ static ssize_t sshot_status_show(struct 
>>> device *dev,
>>>   {
>>>       unsigned long val;
>>>       struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +    const struct etmv4_caps *caps = &drvdata->caps;
>>>       struct etmv4_config *config = &drvdata->config;
>>>       raw_spin_lock(&drvdata->spinlock);
>>> -    val = config->ss_status[config->ss_idx];
>>> +    val = caps->ss_cmp[config->ss_idx];
>>>       raw_spin_unlock(&drvdata->spinlock);
>>>       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>>>   }
>>
>> This sysfs knob never can print out a realtime status for sshot, I am
> 
> Won't it give the status, when the ETM was disabled (and saved back to
> config), for as sysfs mode operation, where the user collects
> information about the status via sysfs ? ( The question of if someone
> actually makes use of this is a different question )
> 
> 
> Cheers
> Suzuki
> 
> 
>> fine for only printing caps->ss_cmp, this can avoid any misleading.
>>
>> @Suzuki, @Mike, do you agree with the change above?
>>
>> If maintainers agree with this, as Jie suggested, it is good to add a
>> comment in the code and update the document:
>>
>>    Documentation/trace/coresight/coresight-etm4x-reference.rst
>>
>> Thanks,
>> Leo
> 


