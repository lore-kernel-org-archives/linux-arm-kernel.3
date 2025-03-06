Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D85DC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOvlUZOc1n/MGIjKD/9YOZaVszAp2gsVr3Iy066nDsk=; b=rDTtwx1oOtC1LP41/SlBN71OLR
	H5aw53pR38lr2WeTHHF0wd0HPcdqWQnM73QXQ5Zy39v20nOU+RVi6woUQyTXBi1yDdWzdSM3IFKv6
	zg19TG/EQd7a7jROoRtJyGtuvK/h7ZDpAOVmABLRiHuUkl7LU/hEiBdMgYUZEbdIHSvixajf0zt5W
	V4lDZIrb1V66g0wwSc0sobEY4JfZ5KAoBQlIg9S9JApB+DObSlGbFJQ0CHdn1Egn8KmoCslbKu4+V
	O79KbT0PwF4hEpF0e8I6oFIn21zdiEVBYaOjrnIMKMF/TnBozQm3PpnlqjNRKHjRZ+CPwA0ePDwv4
	Ie8pMWPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCNx-0000000BE07-3Jac;
	Thu, 06 Mar 2025 14:39:41 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCMK-0000000BDpm-1HMP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 14:38:01 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=q8yF+Sl8xqB8dg7kVfVKBSs3BWEM/c3fJtXWcSYgnlnJSvp3h++FCRL0x462AMpYIzll97eAgm1e7ZzU6jD5fBNlfqBhKZwefhDCJ6jsIger2pv+/eriVC3JCz9sMqGawwPOgUxcgQ/+kzm0j6sKzhayI7T5sjgjeCE0Lsx0z7t5bM/RVc5t83dpzz6fGqJFgOOajHuUlbKKBixDzyBua+CroSQFN+Pvyl3GwbIY714/R85p/1Leegm/HlSbAZi1bnXTZv+qBX7HHEqLlbbnEJGKFrzSWSjQFSICuNjYzEsT+v4yiQOa+8/QEsC5gyWBgllROQP7tDoPAopB5xK1ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOvlUZOc1n/MGIjKD/9YOZaVszAp2gsVr3Iy066nDsk=;
 b=gECm2pGNCmXyw90Wq4Erjxt8TbiiSNTKbm0NIpF8yTyPx+Lam+uKCyV7aoDJ3e/ETkcWAFrRI5z4ulU1u/pNj7HqTBtZLJIiELRrY2PIHoRqdPsLFQQ5fOiYOmuyAzUEp7Qoh7jHq5IPNQhrizughkt7VTS0PUjKkXYfAJv0WFfygUpcRdvvheGR0ddIJdLG69JIW/Tm1ubh6zB9l07ib4/1xLqkyTfzR4dVZrYmkYZL/eiu/b6EPSluY4Qz2DOD368c2y3BaBh0s1Zp+INdayLML4gR8CkwGQqvEYJ12rn70d6IgXIMfE7+g+KmPS7yaq7r6IhKOUcTMixiapYPtA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOvlUZOc1n/MGIjKD/9YOZaVszAp2gsVr3Iy066nDsk=;
 b=OhLNHnouceGnrLkpwq5jL16r0KkMgPr82NkT1aT4E1CE2amca7pcRYLYxkes0HURryyrMHg4sbq3GaZgRFBfag4BxO5DkWfE6pNX9Z0rXNifP3JMhUyPAEKRClTDYnwtQ7WXU6h21rGwSm5mbjR7I6e+p52rDeBfMyLr6+fVSYg=
Received: from PA7P264CA0062.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2de::17)
 by DBAPR08MB5797.eurprd08.prod.outlook.com (2603:10a6:10:1a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 14:37:55 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:102:2de:cafe::3e) by PA7P264CA0062.outlook.office365.com
 (2603:10a6:102:2de::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Thu,
 6 Mar 2025 14:37:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Thu, 6 Mar 2025 14:37:54 +0000
Received: ("Tessian outbound 93a06e49d4fd:v585"); Thu, 06 Mar 2025 14:37:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 58b9c54bdc31bfca
X-TessianGatewayMetadata: deAWYjpjz94onbbAxOEaBCvl+LXT+djYe/v/vOvNtaFZKVg3XeH+OHLAj4Uw04Sr4jU41Au9h/5WUI6LQDYurVq4B1zEkvwAzbCIYvOmCbz/R5XNgyWWBZencW2S+NBZzoDqFIXbSHQBR8eJKVretA==
X-CR-MTA-TID: 64aa7808
Received: from Ldf03ee2da3e2.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1A9CF1D5-B243-41EE-80AC-7A4BDAEAB902.1;
	Thu, 06 Mar 2025 14:37:44 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ldf03ee2da3e2.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 06 Mar 2025 14:37:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtGcVvtL/2LWKo1CiwNdt0/7VWjR0qRMs962yc5sZ6yECDaxsQZKYA8RfaU5cbYtvanE9bIcclVmiTVid+5Ek+GYpcflGZs41m2YjuDE/UHLahgtHWiJeb7zqoObDiHo9Md4OnW3mnsl959zUOCQ1t5If56PuuEVgiGWYNo0+Cbb8nOgaMLIaEAMrysfVhnPvb7EENf8i2zw666gcU7fg5JgKE3MoSAi5YtPC7b4uhxwVpTR1BKk+mjs9h8C6oNg27kUeupbWwjyu/NqfOz6/z7idx9cv5BJxfExSos0jBHuYm/0BeFFvIFuD9/BPLydqnZ2X5sd+Osrlrz5ydITfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOvlUZOc1n/MGIjKD/9YOZaVszAp2gsVr3Iy066nDsk=;
 b=sHlx985VNPKQYIfhdmtJMHnfQSxPjwCraqHJfeaF1FpwnP44e9ySnAU5X7lZlgWwicoVmHsWlZNbiq6th4Ltrt87dS0QfCRBS5ZgbDup++qvXNU0/WM/FUEhjUhQVieYfi7hZi8ITOcvNzxAcI/kXZ4qNlTQ/IBe2OLGTDZUF46bJqcu7pgGWwL0fvHMUmIF9BThX4jSs/9sDxSwQAWmghWUH5A5bVBr1scwl9qKWqYTl+nhwJPcwUVZX9yEbbFLms0WWssfEhymfmE3WhEIpDmRdnpIUBN+N84M41qvbxHUOl2iKfK/lg4+0kyQ7ukmx/CEae+Fxf4NJaTdp9ISbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOvlUZOc1n/MGIjKD/9YOZaVszAp2gsVr3Iy066nDsk=;
 b=OhLNHnouceGnrLkpwq5jL16r0KkMgPr82NkT1aT4E1CE2amca7pcRYLYxkes0HURryyrMHg4sbq3GaZgRFBfag4BxO5DkWfE6pNX9Z0rXNifP3JMhUyPAEKRClTDYnwtQ7WXU6h21rGwSm5mbjR7I6e+p52rDeBfMyLr6+fVSYg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB4PR08MB9286.eurprd08.prod.outlook.com
 (2603:10a6:10:3f6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 14:37:38 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8511.015; Thu, 6 Mar 2025
 14:37:38 +0000
Date: Thu, 6 Mar 2025 14:37:36 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v6 2/9] coresight-etm4x: change etmv4_drvdata spinlock
 type to raw_spinlock_t
Message-ID: <Z8mzMI2xGm3qX9an@e129823.arm.com>
References: <20250306121110.1647948-1-yeoreum.yun@arm.com>
 <20250306121110.1647948-3-yeoreum.yun@arm.com>
 <bd9040a2-b03a-4e4a-96a9-27f6a8db1d48@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd9040a2-b03a-4e4a-96a9-27f6a8db1d48@arm.com>
X-ClientProxiedBy: LO4P123CA0592.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::9) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DB4PR08MB9286:EE_|AMS0EPF000001B7:EE_|DBAPR08MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: c548cd37-6aa0-4ffa-00de-08dd5cbc7b44
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?UceU1VHfGetIRuV5rpEoHudThM02JZXFJu/lvGx2ImbT3bxWK4/ZVCsVd0M6?=
 =?us-ascii?Q?nqdPgE+DBvgTdoZk1uH6J+dJ+ycX8JzQvLUPMAG4EDLiP5Ue4IwjYIPW9k8P?=
 =?us-ascii?Q?kFCSneNhGSIH+dYRe35G2XQa9Zs4jhY2mW3YSo3GXD/570ceAvAniQcGd61k?=
 =?us-ascii?Q?wsxoon+piQmq91rOWy5rlOIML2mz9nMoSyg9mesXpqUz5uHDn6QCDxwlEpCR?=
 =?us-ascii?Q?ULZ8NLNXa2f0mJUo3YLB0HJUGT1wCUe0ZNQeQCPBpPjpCX5sv2WBLo8eMkca?=
 =?us-ascii?Q?v7DqMDvc/PWyygEiX/M5jHAr5IMw+VdaGU9F8ImCl+trB8gZBbXgp2z/lyN1?=
 =?us-ascii?Q?x8gmsgrsNTrxnok7cpmG7wdRRPexCE6mqci8GoQKS9t36CVlh5z6BnNh1Vxc?=
 =?us-ascii?Q?e7GRF4nA7rZ8Zjlr5soqLZRV0pzF55xlt8ukj91DHcU8a0GUQMamug/roGkL?=
 =?us-ascii?Q?0cvhmRVbZziEtiTCWqtHBID9IfTiy4WWz9u+Ob9lRzjDEeyJR8VyKRH1gMHw?=
 =?us-ascii?Q?A4qeqc3mzRM6avea6MyVTtbitE7tfN7AVWsu67Rp1RpOKKucLwBLJXyFkGkE?=
 =?us-ascii?Q?qupICRvipHth7LP3ewAnp6pGGxL8Pg+W+qsBKXGetbDmOfrWMethhYKDZXkC?=
 =?us-ascii?Q?X/IDwa8gxi6lQrhS3/bLupYxDwncYaWA5frSYFZR7tqVARkOw44qQOXNXetC?=
 =?us-ascii?Q?IoEhevpKnohGZtiWOZTbP4UU2ufAxfwN/prfADlqXqty6nmMjQhdwKxvZ1xH?=
 =?us-ascii?Q?MoT32pyDUKg6cDv2+CHNs8uU4OOXKZNI2m80soxGYyxnRnxZodBsUHHeLyls?=
 =?us-ascii?Q?613mxXVp0Sx/Nia89zmtsFNZRgGe4t2qiTPNVEMS4EG90g9uYYKbpkYwATMu?=
 =?us-ascii?Q?B4k9xsvYTLau+p1Eql879MpEx96FXebrYvgn//F6/lhVTWfWUKaCpsUjbF2Y?=
 =?us-ascii?Q?NJlpMtPQkhtaTnn9CgrYPiyDr6Z1K7l5gyl0579vlZGvA39TT3hxSHnnmakG?=
 =?us-ascii?Q?emyPZlUIO3of3Suk+3oh3U/dmxyAlcIO6gfG+tEfjSVYB96GoM9e3t94YGAo?=
 =?us-ascii?Q?ajLCeQyA2i5EdFOUD7bQHGoFQj+DDBfe4QUrkcgV+wjmltCLBXIbjHD8JMPa?=
 =?us-ascii?Q?F5sE+Rs/48O7QT+UssFWrIYWBrIvtAkviReh9q/CODBfHD8Mct81gSWhIcB2?=
 =?us-ascii?Q?zKJsNPXEF7DdOZXuNxVg9SIHFIj5ut7iEpJqE27C3f3ddYmHpFfCnuIbvJiw?=
 =?us-ascii?Q?/SNXtE/5KhnJDC/++mpfA/w1gEXJmrnzZTnV+RFv+gXB/eSh46onRQICoTkh?=
 =?us-ascii?Q?/ENWgbRQvI9Ybsv9lXqrdAIKROx2dLnFaRELKK4Ajj4LCe+h8pS36T5108dO?=
 =?us-ascii?Q?irrVOd/KDPwV8UCTQm9zJxnlD/BT?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9286
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 58d1e47a-ad77-4aa9-0920-08dd5cbc7172
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|82310400026|376014|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HyElSQzx8gvcwcqM+SakzciiCy4RAeA1qsdTbCm/adZE/EuF3vHusnfVH0uY?=
 =?us-ascii?Q?iIeV3qqhUyc16RseJhULmy81zI0kHhRWWugAThOQ+r2yReT/NrommZ5lTx70?=
 =?us-ascii?Q?dwPE2NjfnXzSKIGkf0nZyGjnHGTUFmOq2snpfG8973A0+Vmb8/8dgx1j2v7z?=
 =?us-ascii?Q?cnhg1cfV0blXPB0DemRPz7oqLJ/8QXllx7koVVoBtny9YCuSSrYtzBl1Z2oN?=
 =?us-ascii?Q?ewvf8cPY3PLqjwS1wHe8eHkx+ORBIylRXcLlgXOX0KJczEtG1A/+dbP+5PzW?=
 =?us-ascii?Q?YpHv6CI55m7V5TlONHK5GT0Dnr53V+I4p6viz78bzrvwa4wiuAt70u4Mh/9I?=
 =?us-ascii?Q?9UOCP8yOXAsKQCkl0v4EvCGQpXYK3rhBQogvPZICi/O+TxqUpZKIBxjZSTaU?=
 =?us-ascii?Q?qAo/6aD0vK/g3PtXxH8lMLRomW+9E4P++PFVdRzY+Z1yV0NqQ8TcyW4sCiIq?=
 =?us-ascii?Q?KsW7wuYGh0jgl4cq3KmmTNyltgNvQNXykuvg152xTgkg16FEa2SWqlLLqmYx?=
 =?us-ascii?Q?cpO1Xc+cWIZxnVzs5iSqnWNDra67gSd0H0vLQQIG4xtUO2PJuE/IpiJImMVQ?=
 =?us-ascii?Q?3rQIUuVIe2o6zd1awbFyeRDPGlh+ejIjBwYViGWYUs7rbzwsuqoJYrZx41tP?=
 =?us-ascii?Q?UHF6iErZcb2S3BAsh+I1Tp6Xrecw3yg/SS1xaBSqqnlF3qB5Y0qJ547vVkzD?=
 =?us-ascii?Q?KnZq+cyjA7sP7GT4U7Hf4O3lxmPtm06tHfGNLM1ccoLgvFsa+BY1fxw8kUlV?=
 =?us-ascii?Q?qsO2fh4rGHcTs61HPkwfJuvbgxyZk0XmMuUnlvVcOY6CqQEh5+Yb7V701bs0?=
 =?us-ascii?Q?UNMDw8xqqzKWH4PFtstF8Ny58DPtc8yaqwvyqAZ7Nmelt5NiUKjjjvXYmuoA?=
 =?us-ascii?Q?dFunYvSBK8Dw20nYyQD7HzZkCyOZzm6Pi3/Lqs2TZpFSFY/CiBzVq6WE9NCt?=
 =?us-ascii?Q?bQwbyQGD/opsDSu+UoavGABbE9baBsrgJwIrH2DYEHYi0Ann//7FDCdWSVSg?=
 =?us-ascii?Q?RNvW4EO8Zmtnkr6f4ZkC+BSR/2CmTHYeTN4mEPM8A/Nko+nKENq/U3xZQY+n?=
 =?us-ascii?Q?GRICN0ivV9cJVRXmCkWgE90cVk0JM/3/KrAvvMaFdWP7gd2LQR+mcSpE5MX5?=
 =?us-ascii?Q?igwPVSYebr937L/67t2ITzYYy2XREmlQf8pMXtXqd+wT+dSnX+LfnUCF1SJ9?=
 =?us-ascii?Q?/HdeTNfU3TNfZAGS1vujFGe+hny1yZhoebg0jEf+oPYROq/I3bVZW5vTHUtb?=
 =?us-ascii?Q?5Rje4+LmgSKB6d2AtgU59PMK+octMDSgmSd2AZcZDO4eFt1d+QufaGae3cmU?=
 =?us-ascii?Q?O9hrldh08j7dcxtYsVcuHaYScDQqHLBhP4Nv+T1ntrJg1EYksujuJuomBKXn?=
 =?us-ascii?Q?9LssClE1VdtpfA9FMUy9JAO/r5U7KsZsNtVF/Ig9T4Cw9N/x1qKGBA5utkEk?=
 =?us-ascii?Q?Jf5akPHObNLb6M0YaWSEY5WIsSdYJuG1SNpkrpf9kc3mIOkP0+XEZ+mCz/dX?=
 =?us-ascii?Q?mXmPZAb8vv8ZVLI=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 14:37:54.7670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c548cd37-6aa0-4ffa-00de-08dd5cbc7b44
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5797
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_063800_498465_660CCAA6 
X-CRM114-Status: GOOD (  11.96  )
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

Hi Suzuki,

> > diff --git a/drivers/hwtracing/coresight/coresight-config.c b/drivers/hwtracing/coresight/coresight-config.c
> > index 4723bf7402a2..4f72ae71b696 100644
> > --- a/drivers/hwtracing/coresight/coresight-config.c
> > +++ b/drivers/hwtracing/coresight/coresight-config.c
> > @@ -76,10 +76,10 @@ static int cscfg_set_on_enable(struct cscfg_feature_csdev *feat_csdev)
> >   	unsigned long flags;
> >   	int i;
> > -	spin_lock_irqsave(feat_csdev->drv_spinlock, flags);
> > +	raw_spin_lock_irqsave(feat_csdev->drv_spinlock, flags);
> >   	for (i = 0; i < feat_csdev->nr_regs; i++)
> >   		cscfg_set_reg(&feat_csdev->regs_csdev[i]);
> > -	spin_unlock_irqrestore(feat_csdev->drv_spinlock, flags);
> > +	raw_spin_unlock_irqrestore(feat_csdev->drv_spinlock, flags);
> >   	dev_dbg(&feat_csdev->csdev->dev, "Feature %s: %s",
> >   		feat_csdev->feat_desc->name, "set on enable");
> >   	return 0;
> > @@ -91,10 +91,10 @@ static void cscfg_save_on_disable(struct cscfg_feature_csdev *feat_csdev)
> >   	unsigned long flags;
> >   	int i;
> > -	spin_lock_irqsave(feat_csdev->drv_spinlock, flags);
> > +	raw_spin_lock_irqsave(feat_csdev->drv_spinlock, flags);
> >   	for (i = 0; i < feat_csdev->nr_regs; i++)
> >   		cscfg_save_reg(&feat_csdev->regs_csdev[i]);
> > -	spin_unlock_irqrestore(feat_csdev->drv_spinlock, flags);
> > +	raw_spin_unlock_irqrestore(feat_csdev->drv_spinlock, flags);
> >   	dev_dbg(&feat_csdev->csdev->dev, "Feature %s: %s",
> >   		feat_csdev->feat_desc->name, "save on disable");
> >   }
> > diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> > index 6ba013975741..b9ebc9fcfb7f 100644
> > --- a/drivers/hwtracing/coresight/coresight-config.h
> > +++ b/drivers/hwtracing/coresight/coresight-config.h
> > @@ -206,7 +206,7 @@ struct cscfg_feature_csdev {
> >   	const struct cscfg_feature_desc *feat_desc;
> >   	struct coresight_device *csdev;
> >   	struct list_head node;
> > -	spinlock_t *drv_spinlock;
> > +	raw_spinlock_t *drv_spinlock;
> >   	int nr_params;
> >   	struct cscfg_parameter_csdev *params_csdev;
> >   	int nr_regs;
>
> The changes above seems to be unrelated etm4x and not called for in the
> patch description. Is there any reason why this cannot be separated from
> etm4x changes ?
>
> Suzuki

This is change for cscfg_csdev_enable_active_config() function
which used in etm4x's enable path.
currently, the user of this function is only etm4x driver,
I've included these change in etm4x patch together
to solving the issue in etm4x driver.

Though it seems unrelated to solve the issue happening in etm4x,
I think it seems good to put together.

Any thought?

Thanks!


