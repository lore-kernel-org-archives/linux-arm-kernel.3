Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBECE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 10:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zi2D3wX94ds7+VL8S86+8OXA7csTpDwIy6Pn91E307g=; b=QmSkcRG2EAwEjeCcZIpWOkR1HW
	7hQhqpGqYALUZNAciSHywt8Zsm9z977A8+txcmh7eegRCQR0mu0CfezejWuI4rWFS9RQctF3ygRP8
	jv5+f1iZo+/MovId06JK0JiuxP/vGAeCBFNkExeY50WdoRe6Lr0GMGR5N4VPuqtmFH72Eq/EtA824
	BwEarnADE91QxPxP/CecKzfmMDTSeAOBLtkv7/LGPeRs1WCt/TC/YgLej+7KEJryUnZD/EukYe08K
	QD/Ipk7hdAFmjR2TC5dD4F4e8ssXxIvCt+SGdPsjitnADDxbcQ0fZBFGZ5mH/aPYrzMBZr/JqDbO7
	DwiqeqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOa5a-00000004Z3U-3skv;
	Fri, 20 Dec 2024 10:18:34 +0000
Received: from mail-vi1eur05on20604.outbound.protection.outlook.com ([2a01:111:f403:2613::604] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZuC-00000004WdW-3R4q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:06:50 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xQ0xFojja6TrgG519w7HyZQuh7CHDfykQwzaxEdOP4U0w21BsLZkUsx7uX7BfDcWBHMwiyZkosU6mbfQh42+0Ja7djaJ1ZvRH9znSP8ABCKgY3vwAvMQPAl1rGu2eEDPzn4SyvbRl0w5zJkp2ztvW9mtZavqZZttNXJX4RsnxkHBMtfOA/M8qhQWNp69+j+eT02kMVaUIO3gzSLEJpkxwswIyFIH2SK0pw+PjRvrZgOEDzc2dSlJUCQTnl/2ByM8SxPzhbLRcEjKJpgL1e3H4GKG2wF9y8CkFA7ZvAUo/R07qlvuzi5KW+w6tzIyPdsVslVuUjilaWoXYtYUkv0PTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zi2D3wX94ds7+VL8S86+8OXA7csTpDwIy6Pn91E307g=;
 b=MvqvG6y7iHJpHWDHoVi6awia5J0uhiHWUkeoFFnVAsdY/P+AWi5LCgZFc4lZw/lgaIyeuLRDjWu6A5sVUp9hSpIcCWv2UI+As8saiaAbDyRNlL+ELOebO3cvU/X+OFtaCM7Qx11PxQgpAhE6yEpWDIz8pkwDcUzRDSPw6xg3HDiKr3/MMGYp1cukST8F2g6jD1nrfJ2PWVrNnz3DcUhGo04qEJDdSL8XM4m2m3blOOkCT9fweI7hofV+4XhZsm2DvR/KwLlxt5yL/0sAtWplWarSGblktQG/fcOJQ30nviS5CwHWlDrQEz6XrtyGnsoCuZXo9x1I7ebgcjrq2aXiNw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zi2D3wX94ds7+VL8S86+8OXA7csTpDwIy6Pn91E307g=;
 b=RNvD/zb4dvFDkybHzgTMK7cupvX3+Tt/l5pVQuaGXA0jtwcwkk3tBHJ0+34mPQN1NYrKG95voENOREISYlhf9rSDs54EypIXk4vgudvadxAeWdhMV9NoHzjXVbIPvrp1M1k7eUgqLlLWblPzGFzhTOe5kL6MayQaVlyaDu8owcw=
Received: from PA7P264CA0196.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36d::9)
 by GV2PR08MB9328.eurprd08.prod.outlook.com (2603:10a6:150:d4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 10:06:40 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:102:36d:cafe::f2) by PA7P264CA0196.outlook.office365.com
 (2603:10a6:102:36d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 10:06:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Fri, 20 Dec 2024 10:06:39 +0000
Received: ("Tessian outbound 42d62cca2da1:v528"); Fri, 20 Dec 2024 10:06:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 401d422e52448a13
X-TessianGatewayMetadata: lJNSKSG/GuAIWLatLtFIfW/L9uBhgpV2Ctzl23lUTV4+eDREGmkW40H4JEubRGiFarohrA4hKK1uLa+UuFnWYPhhjExIDwIV/ZXItkB7+h3ZzsMBq7VzAUUAjLi6WfQUjqE0EKfFoLiciAtpddkVeg==
X-CR-MTA-TID: 64aa7808
Received: from L22146301a8cf.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8373BE85-76DA-4ED7-A701-EFC107865682.1;
	Fri, 20 Dec 2024 10:06:32 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L22146301a8cf.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 20 Dec 2024 10:06:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cElut7eXM1GPhqnlgd5mNS1TlTWJsFmX07sqG2tE8+8N29uO3QpjaVqTIrs0qc1PNPOuZdMEZiRjCcqw7AICZGqoCXpH8mOdhPEPIN0d2azH0lbkJwMDCMdiwr5IrKFL06BV0gOB47mb10xHrvYrR2mBlKwU5ermxHsi04awb/CmP8QKXxEH44+Or7iVRYDkcGthad1aJw9P8Fv+pYfAu4ykJaUDFRec4o00PcT1S3kUY++LrECvo4j08HEFvbucJAoJ9ULsn/l2+93se883k+1htRupT7gCX2gI4SL/gybfhDf+f0pUyMQxG7hxyc38jr6NF7UgYc7vpMV5HrJoEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zi2D3wX94ds7+VL8S86+8OXA7csTpDwIy6Pn91E307g=;
 b=irw1Dh2jq91hHEumJOcRn32ov6zEnDsfpJ+ZePXcdF1dJ5STXdgU0HTjupVhK636q7ZTCVPNfYzsbDc+PfURXMwUOoKWWOsdtri1fCwBjcYl76qM8+ciRVYwpJrfPkz+L3HlWVOtaMaGW0/Rv2Baq1w/C50TklBGXGTz404/6xgUFkgzXxZJTVrhVEjoL5CpWCbB5LkCzQ+cZsVuy4x0se5wjMMKTpNLZuo8oZD6CIZopRZOY9TK7SqjjbTVnBZPig1Uj5iPzeIVbH6qOD3E4uZuC5uU5GnTzT5yXqgYTXnCiSILzxLwI1zLhi9nH+QNwKQCXriJWGpAvEctwzD0IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zi2D3wX94ds7+VL8S86+8OXA7csTpDwIy6Pn91E307g=;
 b=RNvD/zb4dvFDkybHzgTMK7cupvX3+Tt/l5pVQuaGXA0jtwcwkk3tBHJ0+34mPQN1NYrKG95voENOREISYlhf9rSDs54EypIXk4vgudvadxAeWdhMV9NoHzjXVbIPvrp1M1k7eUgqLlLWblPzGFzhTOe5kL6MayQaVlyaDu8owcw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB8202.eurprd08.prod.outlook.com
 (2603:10a6:10:39d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 10:06:31 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 10:06:30 +0000
Date: Fri, 20 Dec 2024 10:06:27 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: suzuki.poulose@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Message-ID: <Z2VBoxu/pAnkiWMh@e129823.arm.com>
References: <20241216115006.415861-1-yeoreum.yun@arm.com>
 <CAJ9a7VhxG_8R6j5uRCzOhLpy4ZmzyVvyW0+ryCcd4w7wqpZ2ew@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VhxG_8R6j5uRCzOhLpy4ZmzyVvyW0+ryCcd4w7wqpZ2ew@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0089.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::22) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DB9PR08MB8202:EE_|AMS0EPF000001A1:EE_|GV2PR08MB9328:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a09e067-f499-4e2c-c492-08dd20ddfef7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ZjO4eRDQMMAg1stVtFWwXkjkgbzlr/JlnVzY/W9fZWmfCu8Uh0RzynBopvqr?=
 =?us-ascii?Q?xUnPO5reasF1YU8H25D8bAuWNkYjaZSGOE3gD+PGP03x6P4j00UTyiKqwvKt?=
 =?us-ascii?Q?DM8sVv267+zCkAg5nUAgJJjTkvlnLuniu69c6DPFASsKseH0tq1APMvyiouq?=
 =?us-ascii?Q?iLZ2Sz7V2i1biIAXWoRD/lYsu5MBDIkogifWCD/KDqnitP3CSO/Emqgnyd21?=
 =?us-ascii?Q?1/lK7moJ8cyTw3KWCaNK7NA/50K3eAT46oN5tMfiMP5cOYDcY4HOPqhp6Vxb?=
 =?us-ascii?Q?rh50goBSkwJDbM1UKgzMn4GbnHSGVeqon4kKFqxFXeBO0Tk79f8D/BtMBhx4?=
 =?us-ascii?Q?FpenQB21jupYsMdlDD+4hvXFYSF3T8lgLzX3DT82llJu50mKvVXWtpPWv9hr?=
 =?us-ascii?Q?rXkkWqzbnYc9sNRsTrAitpt1vD0D4yY0gOGFX/Dbs+DVCs947DMAyNrIe4Yz?=
 =?us-ascii?Q?ZT11tCMbu4EBenhgzUWw41QtOoLW5gSm3atv7mZXLFfGClX4AD3lglHOYZb2?=
 =?us-ascii?Q?VUf4ik1j6rVYuf/xFKUmuat1GNsvHrslBx/zKZlpyd8Aqx9WZstyNx7q9C96?=
 =?us-ascii?Q?oz5d0V60hmGzhmVXrYqQD4kfYT30fdIIQDRCO6UuC9QNxgeCszJ3rzIH+mxV?=
 =?us-ascii?Q?alw8VrVH7UqW6tojLp0u4iSXuDb/qudwF4O3F4R7vKf1pGoQcIYPZx+AsIo/?=
 =?us-ascii?Q?hS8Y3FVk3Tkzth81r/U8AnZbmSEnc9iszcqS1zcQAZdmfe5n/1p6C+Fvd1VM?=
 =?us-ascii?Q?yR7s6424w5IFzTa/q26mtWovznuTxqxSdHENheVJu486p/0HBGSD51e0yJ9J?=
 =?us-ascii?Q?XrAsq6SeEOGjCaMBRtffLGw67P56k7AVQGj55XuLWQnq8AIRgQAoGmnGjKs9?=
 =?us-ascii?Q?WbdvmH1ciZchyNW4lZfjE0N7Zo+ZXC/bp8J3KiasmIML+AB6MSPMZFjyeqjU?=
 =?us-ascii?Q?NmH9teRcM/xP7M1DtqFiJG20ECUCOi7mP/nO/ydvGwi69kY41x3igALowJqj?=
 =?us-ascii?Q?O0mh1qExnhdrGKAExopiqfz/Mjzjit+r/6auKc1oBIWUkNV4/UkR4WoskAFj?=
 =?us-ascii?Q?9snQ3YZlro39QLnezxoFOswgn6/CuY1XhRySBcbDua6JwVmO3Xv8Aolesm57?=
 =?us-ascii?Q?m8SRfXFY6E5XZvlB0Bij6n9Jyg7Wm0IBIwUWq90D15f6hnJW1+Cr8V4+832q?=
 =?us-ascii?Q?PbP4S5ALis1QhXNeU6n026V6e+9qNFwm10HCJDVQo34pcTf+zpWF5noJJmpd?=
 =?us-ascii?Q?oSaHA4otCpgYVN2yvDD+RlLsN1+utXhZgYPG5noXI6K4GnqPD6YCHDfZde63?=
 =?us-ascii?Q?o2IdPFn9TGSTGx/6fpJmZvK1EDAqAW7TRepu3kGDdo4XCLVcGbJo6yVmezMj?=
 =?us-ascii?Q?O4PHruXic8CTKCjWtX1kcjxcnwUj?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8202
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: eb3c2971-189d-4b38-1b80-08dd20ddf980
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|82310400026|14060799003|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kOFvxsVzxEVuUTbz4MiIRghMDbWFGoMUlj/j942OjSQ26Uk05jwZAstmh7/+?=
 =?us-ascii?Q?yA6VnUPzFJlFPmf6O0cT3+anI3DOXveykGPZD0veEVsNkYCUrHsw0HkGs6hh?=
 =?us-ascii?Q?C5JoaMLRrsGGXzJSnPwHMtiDkRlyxGFmloJusUuR4UoCI0pU5/vhe+lu1mXF?=
 =?us-ascii?Q?Xa+SLsK+cy2LxksAtenhMDy1mbeaJKpoLcZ2sc1rrqfLYOLsa3pFtZp8G2Gj?=
 =?us-ascii?Q?rJjXiOXmFJts0vfrswhirUcfhpMKNWvniep2GvcmjvUb4vD28KEYA6gAkGaT?=
 =?us-ascii?Q?vcMJmRUdUC+/ZGrr9fQkk9mtEYAcdhm6jZf3rcWTFnCuaRvCJRXsUcynO5nQ?=
 =?us-ascii?Q?VR2NY0r0oCtmczS6oNkdGqeMppk3Eoob23cgWay/CfQwgm60R8TSL6l3UC7V?=
 =?us-ascii?Q?6QM2aq41k55v/YTf0P1qHqPbY0ci6Y9foe+VcUx8YRGIs9XXe49AyMKi9QzU?=
 =?us-ascii?Q?2lCtbZXYFSmvDfDUd7rJToB2idHZCL4+9yhwmMCrLnmqBc5ejkg5YWTkgamI?=
 =?us-ascii?Q?iIzNGS7wk11TJ/DwlTATb7Rr9GQHp5YrE5kqfNMdNAH4/r+AvGytZoYF/2jR?=
 =?us-ascii?Q?fW8AiimUs9yzCPZJ0tQADtQK+aYj9vFNvCSqYfYqYmPUQHUPvDfoLDgoIwEZ?=
 =?us-ascii?Q?4Fw8/ieK7jgbo6Klf2LsqfzUoEBypCu12PAJPznIAYq8lFiroSuy/+4U/yLy?=
 =?us-ascii?Q?wanoOXPXmj9+hBoUtDr8umym7XhlXX+dYHi5Es94zWMJbVp32xAKWrFAjlzk?=
 =?us-ascii?Q?rwcRHfcQX9iRPfnoj859Akp8iaCubq4dlyn3wttesIzCixom2nowMv3ykX1p?=
 =?us-ascii?Q?GmfAWQpsEHQFShpU5Yg72bLB3Nz92daDWH5txz+2hdlEUftSiT238hxzudnl?=
 =?us-ascii?Q?jyhu84UZk+SiEkQy2FKm+qop95huwiuQRArLEbA5SO9JpkGX1+xbA2gCLPqS?=
 =?us-ascii?Q?odzYdROc11A6nvxXtytem5HrAPtfa9Fl8X71d8RiAo1kxxFHafnCcEjm8Ca+?=
 =?us-ascii?Q?OMW8BvrfPiXgGl+BZoHYHD1+MkUeAbzFk55fdenVDT7g832hZrXOTqHwxte4?=
 =?us-ascii?Q?plcfY5abpug4N63G4AH0kJFMBc2VVrgQRc9ZKZWg7fvoCtofe2vufddw/yo0?=
 =?us-ascii?Q?fa3eARQ/aaYf3PzwmoNEYFsGKBXUE0DXDCS4CoG3UfpLNDan9/TqlnArl5WJ?=
 =?us-ascii?Q?AxScuLrNLCruqHpkSwTn4Odo7+5gQiG/YHBjxL0gEcKHdNZ3mgUkgZYwR4GE?=
 =?us-ascii?Q?Ekhs80PPwp52vSN+uyB4AAg15Czeah2J5WpTJT69gewUmKagKUd9o7yxnFOB?=
 =?us-ascii?Q?TEXtgsAG7BsRHntKIMC+fcbdOvH+mzjdpXcp4PI3ZlQ4b+2MWVasA2Wi7IfD?=
 =?us-ascii?Q?q8d2Hd4kDezrzteg5J/nRKJo2v3iU4yZuPTkwoZWXgo15NI8axf7NbZebYA+?=
 =?us-ascii?Q?AHgdWfMTVKz4OhDq88iEgLD3DYvCtyTViJ+Orh0JzimTJiUHRiecE24yhnVM?=
 =?us-ascii?Q?xCuP3Np89sZDKXU=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:06:39.3365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a09e067-f499-4e2c-c492-08dd20ddfef7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9328
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_020649_308503_CF3521DF 
X-CRM114-Status: GOOD (  12.90  )
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

Hi Mike,

> Hi,
>
> On Mon, 16 Dec 2024 at 11:50, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> >
> > In some coresight drivers, drvdata->spinlock can be held during __schedule()
> > by perf_event_task_sched_out()/in().
> >
> > Since drvdata->spinlock type is spinlock_t and
> > perf_event_task_sched_out()/in() is called after acquiring rq_lock,
> > which is raw_spinlock_t (an unsleepable lock),
> > this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.
> >
> > To address this,change type drvdata->spinlock in some coresight drivers,
> > which can be called by perf_event_task_sched_out()/in(),
> > from spinlock_t to raw_spinlock_t.
> >
> > Reviewed-by: James Clark <james.clark@linaro.org>
> >
> > v2 to v3:
> >     - Fix build error
> >
> > v1 to v2:
> >     - seperate patchsets to change locktype and apply gurad API.
> >
> > Yeoreum Yun (9):
> >   coresight: change coresight_device lock type to  raw_spinlock_t
> >   coresight-etm4x: change etmv4_drvdata spinlock type to  raw_spinlock_t
> >   coresight: change coresight_trace_id_map's lock type to
> >     raw_spinlock_t
> >   coresight-cti: change cti_drvdata spinlock's type to raw_spinlock_t
> >   coresight-etb10: change etb_drvdata spinlock's type to raw_spinlock_t
> >   coresight-funnel: change funnel_drvdata spinlock's type to
> >     raw_spinlock_t
> >   coresight-replicator: change replicator_drvdata spinlock's type to
> >     raw_spinlock_t
> >   coresight-tmc: change tmc_drvdata spinlock's type to raw_spinlock_t
> >   coresight/ultrasoc: change cti_drvdata spinlock's type to
> >     raw_spinlock_t
> >
> >  .../hwtracing/coresight/coresight-config.c    |   8 +-
> >  .../hwtracing/coresight/coresight-config.h    |   2 +-
> >  drivers/hwtracing/coresight/coresight-core.c  |   2 +-
> >  .../hwtracing/coresight/coresight-cti-core.c  |  44 +--
> >  .../hwtracing/coresight/coresight-cti-sysfs.c |  76 +++---
> >  drivers/hwtracing/coresight/coresight-cti.h   |   2 +-
> >  drivers/hwtracing/coresight/coresight-etb10.c |  26 +-
> >  .../coresight/coresight-etm4x-core.c          |  18 +-
> >  .../coresight/coresight-etm4x-sysfs.c         | 250 +++++++++---------
> >  drivers/hwtracing/coresight/coresight-etm4x.h |   2 +-
> >  .../hwtracing/coresight/coresight-funnel.c    |  12 +-
> >  .../coresight/coresight-replicator.c          |  12 +-
> >  .../hwtracing/coresight/coresight-syscfg.c    |  26 +-
> >  .../hwtracing/coresight/coresight-tmc-core.c  |   6 +-
> >  .../hwtracing/coresight/coresight-tmc-etf.c   |  48 ++--
> >  .../hwtracing/coresight/coresight-tmc-etr.c   |  40 +--
> >  drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
> >  .../hwtracing/coresight/coresight-trace-id.c  |  22 +-
> >  drivers/hwtracing/coresight/ultrasoc-smb.c    |  12 +-
> >  drivers/hwtracing/coresight/ultrasoc-smb.h    |   2 +-
> >  include/linux/coresight.h                     |   4 +-
> >  21 files changed, 308 insertions(+), 308 deletions(-)
> >
> > --
> > LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> >
>
> Notably missing is the same changes for the etm3x driver. The ETMv3.x
> and PTM1.x are supported by this driver, and these trace source
> variants are also supported in perf in the cs_etm.c code.
>
> STM is also missing, though this is not directly enabled via perf -
> but could perhaps run concurrently as it can be a target output for
> ftrace.
>
> Regards

Thanks for review. okay I'll back with new patch set including etm3 /
stm.

Thanks!

> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK

