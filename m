Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC908105F79D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8Jtch4f/UuCE4hoNuSIXfIvipGs++GHsow/CXrQVBI=; b=KK8exk/1Zv6zpVO/GuT293NsV8
	o6oe7z91SNKgCA1otR3fT5gsby4oT9YQKh9Xfmx+7f7X16McXzAgOznbb5JF0MgApg3KO3ccAY8Sg
	JniAoTvoJql6vO6jh0RIwm7KAhZ7zca41rtMNQol2+AB+ge33WCwGTXy34Pxgf/ewwwqy5ZRcm20f
	wZgyKtOv27YjgTdrPXR5jE2pEOctQlKtaJY/CkZchUbCY8PS8GZTmzPBrb1rNwVT3MvCpga/uyy6W
	WhOVdqOOgyofL2OdUKsRvd7f6cgwrKvymfYBYUBJJwqq0RNOKsR5DWmLSLZmrKcxQPjmyhw8OgIaY
	5HcAXnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10cN-000000001IN-0gTm;
	Fri, 13 Mar 2026 11:23:47 +0000
Received: from mail-westeuropeazon11011059.outbound.protection.outlook.com ([52.101.70.59] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10cK-000000001Hp-1NNV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:23:45 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=p3WyJTPVN2GhY1vJ9LKiGYgK5glISqMESirVbXdmqvOO7rtK+y1choQX57ytIG7e627PasafiBs9Thu/gd8Wgo6BdrAUU3hoRzcIXqTZwdyAJWPzU8z2C2k0KVtl+Gs+Em69raUktSn3FrqQQT4T1T6126U8cP5Oag+FzIDxsNThjU5ue4+fOsm0tZdBWvkPI7H5oTfnNPQfxMz5PUqeZTPOw9ALgKKE/9wswu4MscSOUmOyNwMSU+3FqtktR0aCCfzN43iBaW5kXcTpofpTv/hUz4CPg8aSiVRqPnR4rxRAX7jUrHb0wSL7RXryGIfqOUJG0DOcMjWs/MtWKovEnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8Jtch4f/UuCE4hoNuSIXfIvipGs++GHsow/CXrQVBI=;
 b=ZxyTpTw5xwCwnuiJ3XyFkF/ZsLaIB17WDF9YumRWNI+WDk3cKW6tMOXry5inRnW1ziZWkFr2VS2taEIuDcom1OBx1O3I31u4vOthO6OjHju7AeLGuSiOGZBOEumqHJjMl8y/D1SG38ATGuAvydCirA61qm8iNS/E4bi4gpCpL4yGIbwjcyUXurPj6oZrT7wEs/24zXfSJ2F3QJlK9QjPi87lPJ+apRWam4dr/UcntvuAqJd1gCIvHNznBEXgW/WoZ4ngteccBYpc4SUImo7OjyGIkLwVYFA6Kd9yqkQHYGjjfvkg5iPs2hIG4MLpBgGPcBZuKT3IUym4+0lqmZvH9w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8Jtch4f/UuCE4hoNuSIXfIvipGs++GHsow/CXrQVBI=;
 b=hnGRXV4w7LaDtJq0r6euQLkdaR2OGJRmSYki1jI+CQBdTypmOCYalkaZJhtdaj+IZezt9AixVq5OUX/wk1UcBmmI1LEQl6kBL7VvhLP1NImU0laP5IowkdMrHvFkR251RuEgEGAEE8FZ4zvnb6FbbuHDoYIh5WVwbvSyV+qbrsI=
Received: from DU7P194CA0010.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::13)
 by DBAPR08MB5861.eurprd08.prod.outlook.com (2603:10a6:10:1a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 11:23:36 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::a8) by DU7P194CA0010.outlook.office365.com
 (2603:10a6:10:553::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 11:23:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 11:23:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIiykp/aEaUP2gpw7v5c+zX+LFkc5rCpGjBM+HiBxDHPDXNcawhX8vZzUUezHCPJ3w9DL4eum2A7Pg4d1qEpblLhMhzGelYg1u6y9uunK6+h0Ab43VytSK+VVOYOqQBtkziOdwL0WVJhsoC9t8nDuBDvB/7Sv0Sbh3WfuaJhyRKRJWCri5cQBl43ZhBfpNInrqe4ppCG0xeSbYMnKBR7MqODDpbL+VyDt8ZaRnTcNIty1IDezBHmd+n+ZVDbQupUyKGUxCbFVfXO1hIe9kaR5hQvLeJVcb9YbsPCFTq08a5wyNnduqkMibXSgSLR0HE0lAkndKxM09ZJ7PzpqTB7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8Jtch4f/UuCE4hoNuSIXfIvipGs++GHsow/CXrQVBI=;
 b=ZXYMKuV31OZl8Vde/xmhYMD0NO0sifafaXc4QrUhXNqVLlyeg6B6MrvNVCNk7CeHrAXZXMxR/+qfmGmvXyu54mxPtFFRNA4VhsQSSVTI5knUNYMLcc/HXdq0GCNHYlROBvVbf95t7lG2HOWx9G8vE8/V/Sms8IIYj8+FWQuFpClR4dKgNd9/w1nNOloqHIcqVbTk0D/zlOi8JbWP3Cr+Mo6HnWHJEIOuGzJIet1eFnia3de900FGc21yHdWHAy9G+v6HmQ6KIvHLZXBvu/UP7xbxwd9YYE61bVFe9eQnL56MtTmCi1S7N8H9oXqRjikKbMLY8hwZ/Hr+KT97jF01jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8Jtch4f/UuCE4hoNuSIXfIvipGs++GHsow/CXrQVBI=;
 b=hnGRXV4w7LaDtJq0r6euQLkdaR2OGJRmSYki1jI+CQBdTypmOCYalkaZJhtdaj+IZezt9AixVq5OUX/wk1UcBmmI1LEQl6kBL7VvhLP1NImU0laP5IowkdMrHvFkR251RuEgEGAEE8FZ4zvnb6FbbuHDoYIh5WVwbvSyV+qbrsI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by DU0PR08MB8639.eurprd08.prod.outlook.com (2603:10a6:10:401::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 11:22:33 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 11:22:33 +0000
Message-ID: <e2131c5c-d55c-4569-b877-811be6b95576@arm.com>
Date: Fri, 13 Mar 2026 11:22:32 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/19] coresight: Set per-CPU source pointer
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
 <20260305-arm_coresight_path_power_management_improvement-v6-2-eff765d211a9@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-2-eff765d211a9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0208.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::6) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|DU0PR08MB8639:EE_|DB3PEPF0000885D:EE_|DBAPR08MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 867e8705-d72c-4db9-20fa-08de80f2f7ed
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info-Original: MliGB9zF9WUTbdMuY09nBPXPWhNx/okrzAhcU7s2nOLk696iKvRrfreHubs0Hg1g21JxK0L7NQz1iPH/+F0L8x6MDcwg8ZJ5T4S2uDE51OVzeGz3TTeJdwRe3bukE0BZ7IvdUuFlWFg/FXF349nCAelT4M8p5IoEhriuTRIfcT17a4L7Sgh+sMF1iUATwgWhxivakzVYGGmlN8YqnBGraH5ASJ0pywyQemmgOfbRBdmYNOX0UWv8C9v9VkAR84HmSfIDtDCQ0C86vBfSopZXIw+IHMeKSnozo+Rl21YbHTKj8A1Y+Ag3yRpUYJ/0epWZOsLpeci3im2HAtyqrzu8wEgpzXM9z1j7T+3hCEyKRAv9eXssHXG25Ftu0QP1k7J1gr9+9U47LzKjeXN9xtTvs4Xs/atnqrBrNNdWNbz34ieauVqLiayS5z3Oy9rXNqHJctLdtRJ0m5cSVodakyqLCf12eJRAQV6QXgZHszChdyS0Sbm4vt48xv899yL2bX52CP65wJ6WMOeUHxAGCTqwCa/OdkFCuEJdfHqIWHBqXy04YbJ2u/SkWP0g95Q9QiJwESrqho4IRnECVaXJXn70bCYOZNHhVh581/rPeAt07G2cAHkSiWXwODrtG+Tg+gZkkZ9dB8Xef57DY3LaZlceVt4hnd0YqfQDgiAJWLuf+RNlea935sQ0uRuJ40pAU21Ohp6uVVoLjEtqF2qXfMW84dR80H9R1/wOBQPZFCRXg+xTx3fjL3E/uUiCi/tKRW2fH+8IW0d53iRV5DoAW9D4+g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: EpKaIyEJyduz00+xJe+JwisNQuuZ7Ew+8JOcX/vxyuOCWydsW0ekFcp5UC900i3DsXx1eOdr9ia+kwQcLvt4U0unVraHF3NjnBghfG8zwqRAxCyLuTuFUzryBWmUmuDxKQ8VurTpwMzZ3+mhH6FQyt5O1fHr0R7Kyy2kf5IsaX/dMxQRnN+Y3TROXrsDJc1KYaWVuHbWhyfCl4t0fTHCrpcjgLBMaVMG5+J1B1Uls+Z8+RgWHuVfS3OprAX+vxoIZEsRLdS4TJm0gt66Qde/fmSczdLzRi3KUqNIgmdpKkrMStJjkodcSLALgpVMWjTEt/igLf6zDMeKz7ROIdjbJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8639
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 79c19a1e-d7c0-4ff0-1169-08de80f2d277
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|35042699022|36860700016|14060799003|1800799024|376014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: tFGRb/xIg6sDHWJc3SOn9OXWFwu0bkpj6VKSDGHVFKo5yVqOiIMUxW9S2xe5CXg49esyWF+A7DPqXvRmK7wmNxJk4zhxw4wXZJGlSEtglp/3gAPG6vyEIISTyW1WFaq6p0GQGAppgaDw87Dm3e5gjUv03GpuQLB0E7zpAEI+bljyY1p4wq2Sa3ItI9r97CEGUyKQpf9bbXgfJR7tH7J05asQMF0h0z5ocoxGAqF9Ryv6rDfvgREiz0pW2LQc+50PmnZFyNnNGChOg3tKNIdh6igStytl4vAgMVjQKnniUt9956Kp6UHp6thDQIPYjuDAgN5g69tJHOpodfNMhpRonddzy8TkdyogjARL2aHXdgS41wEGp0xa0af3tMVCf2yUMXJVlM85CxvonKAUbcduZtpWcqjCEWhuQBxKoRmNQ/Kq6a6b+Ahc6GGf6FPCaNgr9hGYbm1DlyijPpGeJGE8UxjIL+i87m9Go6R2euY0pTuBXiKvQvczERr53R+3JTdFt5bg0T9QM3Zz0//29zuTnZpav7kKQ6cHOgB8wPaZp7kBXVh3DtNmyqlH6z9YFtafE62y5f9wTw1xbwFkWNkdjZuidyCKrD7kVArHbL79DX9nu6qVUlaELBP6njxm5HZrZiymgSncgs59BJvrCnletRfPDLLiA26AwZ5ewxbGvDFOm+YSw09QeugvaEe5cRrMjx1Az0qkp6DXKvn0cMLEiBa15vhIo8cz+tBoBY0e/R5T7k5GjJ5cAGQnNpDh1NvdrPk/FpwqCM37Uru+Koi+oA32ULD5/EPYRKZE6UFQIP1wNyI9oFDPZT+gdqKk357d
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700016)(14060799003)(1800799024)(376014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4+AcTGk2xLWVVBado+ZvXpLt0f9BsiOtuWepcsiCxLuUsCd84p1hwyeBpytG5NTLqpRcFmPOEdmtZLjWtVW/ApGZdlm8sbfhfxjOXbbM5BgW6KPK3BnIEGTMAMfIvIQRXZBhl3bksRm8qIc866PPQ58XcA24LUxRcLEwvagCU112/6BwxU0ql5EAvT59nS9mKPr0uGcXnXjk21SOm19Zzby1G0YnByRQbJr2toeziyjY5F7rxuMZTRGieUJpMUCd+OtBYG3p0tJgHrpmit0Yss31RzdFF7I4M5Jyhs7XHjtV+GxWC5NZS3fnNtS5PG3AaVcXKXPRR/ykPyxJWP1midgQ6W+UUuamCUuQxr3rAoMaidziyLZ1UBRvY6ow2Fj5RaxzP4W4vKVafcnUJN0DYzdbGIUFlRIXphk/3BCyaDaX360ZhX8wVc5lsGBvc6Y4
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:23:36.2166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 867e8705-d72c-4db9-20fa-08de80f2f7ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5861
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_042344_686500_0A528FA9 
X-CRM114-Status: GOOD (  23.49  )
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

On 05/03/2026 10:17, Leo Yan wrote:
> Add coresight_{set|clear}_percpu_source() helpers to set and clear the
> per-CPU source device.  These helpers are called during device
> registration and unregistration.
> 
> If the helper is called from a CPU hotplug notifier (see
> etm4_probe_cpu()), it sets the pointer directly since it is already
> running on the local CPU.
> 
> Otherwise, to avoid races with CPU hotplug and CPU idle, it acquires the
> CPU lock and issues an SMP call to update the per-CPU pointer on the
> target CPU.  If that fails, it sets the pointer as a last resort.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 54 ++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index f191a0fe802ac6ae1342872e01fff463775c8a20..cda1e9b065a056e57030e52e07502554c71014ca 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -34,6 +34,7 @@
>    */
>   DEFINE_MUTEX(coresight_mutex);
>   static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
> +static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
>   
>   /**
>    * struct coresight_node - elements of a path, from source to sink
> @@ -82,6 +83,56 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
>   
> +static void coresight_set_percpu_source_local(void *csdev)
> +{
> +	this_cpu_write(csdev_source, csdev);
> +}


> +
> +static void _coresight_set_percpu_source(int cpu, struct coresight_device *csdev)
> +{

While at it, why not add a coresight_get_percpu_source() and hide the 
implementation for the subsequent patches ?

Cheers
Suzuki


> +	/*
> +	 * Directly set per CPU pointer if running on the local CPU.  This
> +	 * avoids to acquire CPU lock duplicately if it is called from CPU
> +	 * hotplug notifier, see etm4_probe_cpu().
> +	 */
> +	if (get_cpu() == cpu) {
> +		this_cpu_write(csdev_source, csdev);
> +		put_cpu();
> +		return;
> +	}
> +
> +	put_cpu();
> +
> +	/* Avoid race condition with CPU hotplug */
> +	guard(cpus_read_lock)();
> +
> +	if (!smp_call_function_single(cpu, coresight_set_percpu_source_local,
> +				      csdev, 1))
> +		return;
> +
> +	/*
> +	 * If SMP call fails (e.g., the CPU is offline), directly update the
> +	 * per CPU pointer as last resort.
> +	 */
> +	per_cpu(csdev_source, cpu) = csdev;
> +}
> +
> +static void coresight_set_percpu_source(struct coresight_device *csdev)
> +{
> +	if (!coresight_is_percpu_source(csdev))
> +		return;
> +
> +	_coresight_set_percpu_source(csdev->cpu, csdev);
> +}
> +
> +static void coresight_clear_percpu_source(struct coresight_device *csdev)
> +{
> +	if (!coresight_is_percpu_source(csdev))
> +		return;
> +
> +	_coresight_set_percpu_source(csdev->cpu, NULL);
> +}
> +
>   static struct coresight_device *coresight_get_source(struct coresight_path *path)
>   {
>   	struct coresight_device *csdev;
> @@ -1401,6 +1452,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   
>   	mutex_unlock(&coresight_mutex);
>   
> +	coresight_set_percpu_source(csdev);
> +
>   	if (cti_assoc_ops && cti_assoc_ops->add)
>   		cti_assoc_ops->add(csdev);
>   
> @@ -1427,6 +1480,7 @@ void coresight_unregister(struct coresight_device *csdev)
>   	if (cti_assoc_ops && cti_assoc_ops->remove)
>   		cti_assoc_ops->remove(csdev);
>   
> +	coresight_clear_percpu_source(csdev);
>   	mutex_lock(&coresight_mutex);
>   	etm_perf_del_symlink_sink(csdev);
>   	coresight_remove_conns(csdev);
> 


