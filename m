Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED59CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 11:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FwfKb5gW+OgOU6wWzRQpOQtoJqb7kcmC/pMUFkZ1zs=; b=IvDu4qu97tSNBJeC7gTpT8q5Bn
	j/1ujqYOD3qnSqWshSg6o7DtFJGL/+kElNh9kPo02h+TcKYabHpaiNiPYdz4qGktXzfjoAqiebx+W
	vOXiVbCUAg8zGBJqU0Y74YO01kkEzXw3ae1SdkxQHVBg8OYnRbSjCBAD2KUFEOWhZzoE/hNZMX+i6
	S8+vde1sbM9lkIfp+nH1HIlbY1LrD51Jl6PqEg0jJwcjzttwS6GhOHdgtz45rnj1np2Jgv4y9hpCt
	gp1Gp45+IxOgkLd8WP1UM+76vP5rt65CK4UcDaCC3ZaVoSmpUk1a3fyt3LiUPQ1ZB3WvkJDN/TBq8
	4XE4doBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0ov-0000000AkCj-3FI4;
	Mon, 01 Jun 2026 11:28:37 +0000
Received: from mail-westeuropeazon11011067.outbound.protection.outlook.com ([52.101.70.67] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0os-0000000AkCL-4A0B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 11:28:36 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YiveOJ9Ggv29NMJLBFLuVXBlt18EmEz/RnKmFscIEUyI5iH9VucvrGHrzvpjY1wX/GY/OX8VrxzwoHCBvO2Fqu4i2KSfAqWnAKgtj/e3F9bXDCJaaDXSqCs5LNLu29LeyrZpMxdVNMD5hjExScYC3cqG54VozQspnv69W+DYdSwYLCxHBG+5HfAQLtg55jHz6hWObafDM9MNZapyuAwzxJpGQHJ89UI5DkEQKyOdxBthP+a2uyjGtv0GnkDnb1qjUeL4dEQmoaBRVmPTK4KhAD0VLQ3iKZV8rKS8S1x0BBsunSMBT2hJZBTYpeOJsnT6ZvnpyZaGfpNWJ4Uth/DlLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FwfKb5gW+OgOU6wWzRQpOQtoJqb7kcmC/pMUFkZ1zs=;
 b=MAyoGD3ZId7bxsirD3s1qjiXf4wE5/3DEZjnp2eoUd0SM9vEc0+otx8FZnmFpKkvgFTxWEb9wvGna2GEQt26ZEjxV9JU1QCf5uv78+K2KBF86DXkzkNPuRYn8VZKKsrVp2tBm94rPqHxoJbc2pTSvskozGOAuU5D01JGz9CJS2fbvSPFoQ6hzouvxPSI/D6W0P7g5/JGwm2bBEpQzA4c6t2RZ427XLDJSPLYFrlla2SgHLKwm7ylKpUu8s071NXeGz55ZZdciYLr59bu8VPKTZcIlHis5iFKGkpuyyHi6IX6mJEklKDWbC6qA/0XXJ6HZB8PzgSVAa5pyPmIrb66rA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FwfKb5gW+OgOU6wWzRQpOQtoJqb7kcmC/pMUFkZ1zs=;
 b=JcgY1HV6yPnrm7U23SLbMt1uYwI5EGBJQEw+j7QarlRYjgu+Uh6MFYEG+57mQEwFOwfaMTJq2ZVrf9XNjUL1KGFft09s9U2k7FTdq+Fxrw9jXpljSrLQfQ/yibpcNPHQlCocCGtcFd5H4+SM+8hqsUKnvUL/b/AwOW5PmX7uh9o=
Received: from DUZP191CA0061.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::16)
 by DU0PR08MB9751.eurprd08.prod.outlook.com (2603:10a6:10:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 11:28:26 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::9d) by DUZP191CA0061.outlook.office365.com
 (2603:10a6:10:4fa::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 11:28:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Mon, 1 Jun 2026 11:28:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJSTsHBi5go3F79sRC9oTbyLvC39GSihSbEp7D1bQ/H8sYt4QzWMJI0LvWLwZzGA8uUMD3hJnrnmbBOm/15JeA53mYSRv1qAQdoa5rHGO6hHdaAXb7jPnk+IDqp0dAZ6qAGoyUeRSZstn/oQiX0mizxuOs5dcVoKhBgPbsd9t7pnaWNGyKZojWISCqDVxIFB+WUULq7cBDOmxaakmBkyog8+XrlmXGKcsC3MjqFht36EM97w1DwuN0CQHaNLMRcl8bANDvQBEoZeXcrlDiZnlLzBy6C4Zt267MxpopB5xjSYKG8+PpZxtTTiYesNNlfinZmFg90AusAfFWM5foXPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FwfKb5gW+OgOU6wWzRQpOQtoJqb7kcmC/pMUFkZ1zs=;
 b=NQ/r3EB7QkndBUfPPvbXChAgTSO+BbC/AhMraWj948j3ZvO2qhDBOn6RAD2WIALmQ9B0LVoB7OBMc2O7MY+1KLWYF3P8sNf0Y//KXId062gwPwEgQnBuNAOhFZjL0V6YQ22gYRfPF1jgjy1vG2QeaovnY3e8F8/7LvS9OHuagiXPouJgklbznFkL0iM6wzDI1FBP8x5trWvIog/uDnY7sH8kd5gUoqA8NDGMCPs8mDyovce3DNBVCuAeSDwv0NJolBebifesiCAVr00iVjeoAGSwCljRmsTD1SiFidODmhmaXDbdTEYQwYbi6oXhZxcjXNj2CRFezNOytgB0s6zgkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FwfKb5gW+OgOU6wWzRQpOQtoJqb7kcmC/pMUFkZ1zs=;
 b=JcgY1HV6yPnrm7U23SLbMt1uYwI5EGBJQEw+j7QarlRYjgu+Uh6MFYEG+57mQEwFOwfaMTJq2ZVrf9XNjUL1KGFft09s9U2k7FTdq+Fxrw9jXpljSrLQfQ/yibpcNPHQlCocCGtcFd5H4+SM+8hqsUKnvUL/b/AwOW5PmX7uh9o=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com (2603:10a6:102:46e::7)
 by FRRPR08MB11966.eurprd08.prod.outlook.com (2603:10a6:d10:1d0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 11:27:21 +0000
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15]) by PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15%7]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 11:27:21 +0000
Message-ID: <55b306e3-1e33-4a5b-a2ce-043132db7154@arm.com>
Date: Mon, 1 Jun 2026 12:27:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/13] coresight: etm4x: exclude ss_status from
 drvdata->config
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, leo.yan@arm.com, jie.gan@oss.qualcomm.com
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-6-yeoreum.yun@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260519154812.254884-6-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0061.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::6) To PAWPR08MB10975.eurprd08.prod.outlook.com
 (2603:10a6:102:46e::7)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAWPR08MB10975:EE_|FRRPR08MB11966:EE_|DU2PEPF0001E9C5:EE_|DU0PR08MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: 5abe1147-37cc-4a15-3594-08debfd0e419
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|4143699003|56012099006|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info-Original: cHhGGpNw53I8xvv/BmHMuXUW6MZIm0lSYatv3xkcNEeH607mVqILpRXrShJdA70ZTbOxpzi5/seXNxN3H8N5cvwFuXZR0NLSO2TmBl0+DCZ1IAJ4p0LqmE2BQAf+ESjft2o7phsZip/00nJ70N/+KMheEuAcejneCm9+l2LSTWjQesO+PUrMUY4h8TaY9AR+6YkRrpn+gSsKgl/Z7YLKyz5u6otmQD5tAh0rz5wQ/GOWMd9I5y1UxzKn6EYUiTm3LeNTY2vX6dniAnvEYFCd/VtwC9OOKPPiaMREug6u8dRsQ73a1yC5CgS9ktMyW2JqEMsMJihg6sGJPKt53IWFxhM8Zj6cdZeDA5mAnQ3NdTaWMMksP6QFTKa6lYJyskJvSCuWOAPSKEHxA3adzZ71I2ha5XpO3+7ORFJ6aOsiccvJkeR8lZxqnHzTzan1WRcwAyfAegmeE9chu6dgOz5c2Fkqu+rEJuH8guWX8h44cRbpAYWrr+ehE7qps4dXjFfC+/iLQLWGHdwNaF0DjatbWeK/B7fxyHez79n4t+MP3Mk/mFYunFTc6EhktRpN8emXaimKDi6DfS3/mN3SARFVHlksC5+7xjlbwi5NpHlImzDVUBz07fXioMWP6qWJc6XDtKdmwo0inIa1zoDaCiHB30Bt/460J3ar5tPu/br6qS3LMbfKqKS43rEp3ljoW1AB
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB10975.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: FpcYgsqaq/qKzxs33KpDa6emc90va93H+mKU9zRrwCAZ8Y1fdzD+52Ni6lBB8ObjfSLLlWxWaohhn68FPWdP2KgyCVmaa1tKEa9ejG9SPMajtx676aIVsO4Qxe62982yc/Eoz3jkYIQQWWGYDzDb5G0jNp2ntYy11KVAvgZGs891Fi1a1zPXY3JCcsPbCpguC4LepPI2wha59npjn1yUhfn8SJcbdLtlNY7J/5OUuSkjd8NEszOhX1KBfP72QG+chrXDU2xw8XTaMG+PoLRghgoxul70bX5TgH11Lf/bDcCigiJoUo+DGoDNWrnSt1AmhITWsDaBLH23acsbKE4KcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR08MB11966
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1ccf8309-befa-497a-3b76-08debfd0bf0d
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|82310400026|376014|35042699022|36860700016|18002099003|22082099003|4143699003|6133799003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: 50x+dizgh8ttVvJi+jlsihQszeDkqkbVAFAqnzPqDLQ9j0rASzLQr2LGR1lg4CBxebOsVv4fp9smlS2w0yfqtIBncpWsoOf+deSWVgd7MZNikRCBCEmxaIfWRQWVfoYUakYZ6bIKAL9mLDLPIseSVefQSP5M3pWEm7FcY4vSwaP3MEWbfxsts0vbSKJZisHk/TQ5pfb4oWz9/cuHOQ8qdqRBCUatdvgFPO0cCHOI1fCkZ6eCGg/RVOJ98Vulmhe+nflBsm2mXXR2GMAgpKhWRrSqnj8ctzGLoav6Lfbt92X375M8WgSGUWLI+WHeCPFDvllUbkPbylc0xnvhFVLzRaElRNYlc29OxGJ0JbvpPG42YxLQaKyOvfCozjb7utb5DCUw80Q0XSjmgke7mhfREOiHEs73csXGUQg5Q/IEWdJaFEiwPilOkmlqTIdts3Di3qv/wUlzUQ4HxobbEvNZ9egZY4GNiL1tMM2z1UzSDAsjZNKicKOIuLaVKA1ilYzv4trBLThUxnRuTHHfve5gD4lKMYYAppByogA+l40JUhVecMm97H1ShEzbVJ3h6EcvK4qv3FvYTSWiXu2CAsq6KNOFHxdBYLEenTTkSmf67wAJGCxZupPXuiNH4USJ2cGjIQb5xNG5SQAX6CCBrEBRw2dbb9mr85yUj14tYZddMUs9Vb10bvlcME+pj2GGvM8gSnHh+MTzJF3Ca7g15VF/m8aqsGn3R8sR4Aei6ITvKQQ=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(82310400026)(376014)(35042699022)(36860700016)(18002099003)(22082099003)(4143699003)(6133799003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4C75cbnv2oyfAiWT33S3VOm/hUrTc1P64bFV5kb/mXOFw1itFB7SgzBfFORmwbX45iurC0NupzFmlTLtZhy6g7CFYP50DUOGFMfdbgWWiQFCnGu/XHb4pblmNNwdq7QrZCfQ136IZxRhOd0TVfRpwYZn6FwJwh0xSnI2XTpJ+EHjo5zsYWXOIwZXJEh7kNRtoYkwcBUhfpEEs5FMHG9eWXXj85mXCZK8yRLK08GCUghQ11GVTHkTdCYZPJ3NG4h0JfroMO27iQ+bfkm/ryTCi6e2x4SEddJsU7RHZ4nrUGh6m6w4tg6ZJ5PT7oMSZD/da9lKd/PqhGV9ZXjXTqA3pUDhSqn2XP/DD9Ij8sYiVRMVFW9dZUwm3g4yEM6ue51oZeirFEezahoy3Jyn2gE4e3jNfh7OoSVxHCwGg5QxjXlejR0FvVw2S14wj2zd60WY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 11:28:23.3074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abe1147-37cc-4a15-3594-08debfd0e419
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9751
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_042835_352766_D172C48D 
X-CRM114-Status: GOOD (  22.65  )
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

Hi Levi,

On 19/05/2026 16:48, Yeoreum Yun wrote:
> The purpose of TRCSSCSRn register is to show status of
> the corresponding Single-shot Comparator Control and input supports.
> That means writable field's purpose for reset or restore from idle status
> not for configuration.
> 
> Therefore, exclude ss_status from drvdata->config and move it to drvdata.

TRCSSCSRn has two different types of fields.

1. Capability
2. Status

Moving the entire register from "config" to a common dangling place 
looks like shifting the problem to me.

Could we do something like :

1. Split the fields to two.
   a. Store only the capability information in etmv4_caps. Bits[4:0]
   b. Store the Status bit in drvdata->config , as it is really matters
      to the session ? Bits[31:30]

Add a helper to write/read the TRCSSSRn which would apply/mask the bits 
from drvdata->etmv4_caps->fields to the Status/Pending

Suzuki

> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   .../hwtracing/coresight/coresight-etm4x-cfg.c    |  1 -
>   .../hwtracing/coresight/coresight-etm4x-core.c   | 16 +++++++++-------
>   .../hwtracing/coresight/coresight-etm4x-sysfs.c  | 10 +++++-----
>   drivers/hwtracing/coresight/coresight-etm4x.h    |  7 ++++++-
>   4 files changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> index e1a59b434505..9b4947d75fde 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> @@ -86,7 +86,6 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
>   		off_mask =  (offset & GENMASK(11, 5));
>   		do {
>   			CHECKREGIDX(TRCSSCCRn(0), ss_ctrl, idx, off_mask);
> -			CHECKREGIDX(TRCSSCSRn(0), ss_status, idx, off_mask);
>   			CHECKREGIDX(TRCSSPCICRn(0), ss_pe_cmp, idx, off_mask);
>   		} while (0);
>   	} else if ((offset >= TRCCIDCVRn(0)) && (offset <= TRCVMIDCVRn(7))) {
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 53fbc4826628..7783c97b53e8 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -95,7 +95,7 @@ static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
>   	const struct etmv4_caps *caps = &drvdata->caps;
>   
>   	return (n < caps->nr_ss_cmp) && caps->nr_pe_cmp &&
> -	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
> +	       (drvdata->ss_status[n] & TRCSSCSRn_PC);
>   }
>   
>   u64 etm4x_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
> @@ -571,11 +571,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
>   
>   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> -		/* always clear status bit on restart if using single-shot */
> +		/* always clear status and pending bits on restart if using single-shot */
>   		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> +			drvdata->ss_status[i] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
>   		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
> -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
> +		etm4x_relaxed_write32(csa, drvdata->ss_status[i], TRCSSCSRn(i));
>   		if (etm4x_sspcicrn_present(drvdata, i))
>   			etm4x_relaxed_write32(csa, config->ss_pe_cmp[i], TRCSSPCICRn(i));
>   	}
> @@ -772,6 +772,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>   	/* Clear configuration from previous run */
>   	memset(config, 0, sizeof(struct etmv4_config));
>   
> +
>   	if (attr->exclude_kernel)
>   		config->mode = ETM_MODE_EXCL_KERN;
>   
> @@ -1064,7 +1065,7 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>   
>   	/* read the status of the single shot comparators */
>   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> -		config->ss_status[i] =
> +		drvdata->ss_status[i] =
>   			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
>   	}
>   
> @@ -1497,8 +1498,9 @@ static void etm4_init_arch_data(void *info)
>   	 */
>   	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
>   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> -		drvdata->config.ss_status[i] =
> -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> +		drvdata->ss_status[i] = etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> +		drvdata->ss_status[i] &= (TRCSSCSRn_PC | TRCSSCSRn_DV |
> +					  TRCSSCSRn_DA | TRCSSCSRn_INST);
>   	}
>   	/* NUMCIDC, bits[27:24] number of Context ID comparators for tracing */
>   	caps->numcidc = FIELD_GET(TRCIDR4_NUMCIDC_MASK, etmidr4);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index 7de3c58a47b4..71e95d152ee6 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -1829,8 +1829,8 @@ static ssize_t sshot_ctrl_store(struct device *dev,
>   	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->ss_idx;
>   	config->ss_ctrl[idx] = FIELD_PREP(TRCSSCCRn_SAC_ARC_RST_MASK, val);
> -	/* must clear bit 31 in related status register on programming */
> -	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
> +	/* must clear bit 31 and 30 in related status register on programming */
> +	drvdata->ss_status[idx] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
>   	raw_spin_unlock(&drvdata->spinlock);
>   	return size;
>   }
> @@ -1844,7 +1844,7 @@ static ssize_t sshot_status_show(struct device *dev,
>   	struct etmv4_config *config = &drvdata->config;
>   
>   	raw_spin_lock(&drvdata->spinlock);
> -	val = config->ss_status[config->ss_idx];
> +	val = drvdata->ss_status[config->ss_idx];
>   	raw_spin_unlock(&drvdata->spinlock);
>   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>   }
> @@ -1879,8 +1879,8 @@ static ssize_t sshot_pe_ctrl_store(struct device *dev,
>   	raw_spin_lock(&drvdata->spinlock);
>   	idx = config->ss_idx;
>   	config->ss_pe_cmp[idx] = FIELD_PREP(TRCSSPCICRn_PC_MASK, val);
> -	/* must clear bit 31 in related status register on programming */
> -	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
> +	/* must clear bit 31 and 30 in related status register on programming */
> +	drvdata->ss_status[idx] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
>   	raw_spin_unlock(&drvdata->spinlock);
>   	return size;
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 6d4fbae78448..43db1eb6f8cd 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -213,6 +213,7 @@
>   #define TRCACATRn_EXLEVEL_MASK			GENMASK(14, 8)
>   
>   #define TRCSSCSRn_STATUS			BIT(31)
> +#define TRCSSCSRn_PENDING			BIT(30)
>   #define TRCSSCCRn_SAC_ARC_RST_MASK		GENMASK(24, 0)
>   
>   #define TRCSSPCICRn_PC_MASK			GENMASK(7, 0)
> @@ -730,6 +731,9 @@ static inline u32 etm4_res_sel_pair(u8 res_sel_idx)
>   #define ETM_DEFAULT_ADDR_COMP		0
>   
>   #define TRCSSCSRn_PC			BIT(3)
> +#define TRCSSCSRn_DV			BIT(2)
> +#define TRCSSCSRn_DA			BIT(1)
> +#define TRCSSCSRn_INST			BIT(0)
>   
>   /* PowerDown Control Register bits */
>   #define TRCPDCR_PU			BIT(3)
> @@ -978,7 +982,6 @@ struct etmv4_config {
>   	u32				res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
>   	u8				ss_idx;
>   	u32				ss_ctrl[ETM_MAX_SS_CMP];
> -	u32				ss_status[ETM_MAX_SS_CMP];
>   	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
>   	u8				addr_idx;
>   	u64				addr_val[ETM_MAX_SINGLE_ADDR_CMP];
> @@ -1073,6 +1076,7 @@ struct etmv4_save_state {
>    * @config:	structure holding configuration parameters.
>    * @save_state:	State to be preserved across power loss
>    * @paused:	Indicates if the trace unit is paused.
> + * @ss_status:	The status of the corresponding single-shot comparator.
>    * @arch_features: Bitmap of arch features of etmv4 devices.
>    */
>   struct etmv4_drvdata {
> @@ -1092,6 +1096,7 @@ struct etmv4_drvdata {
>   	u64				trfcr;
>   	struct etmv4_config		config;
>   	struct etmv4_save_state		*save_state;
> +	u32				ss_status[ETM_MAX_SS_CMP];
>   	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
>   };
>   


