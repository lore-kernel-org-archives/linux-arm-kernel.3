Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8BDC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 03:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szVHSC5xpU7/GKrK3OMt4XGipxTCcnvAj0Y5/D31qhY=; b=wRsSkdYQoHFgPOKJojz6pDymVa
	fVRYr8S4f/LK8cmhiLO4kvMLFcEh97xEsDrpuWibCnvAKM2Of9Pn1tgBsCg4qpMmV59+9P0FHQMb8
	cWmOs6lLwNWMcroa0pyLZYw4YS4o1XknorWadTtHkR+yF6Ty3fAYDK5JISgeXgKwIEedLwYMmmRkP
	CXAzQSSQZOrfrFyAjc1tv/ceCR9OKKXbRNisfF19P2X5PU77kgUBP1xoZGBZJiZlLXsMkKa5Uv0gc
	00sksm+Pi1Dz+yvD26heZ7ZrIUVNKgeFhyJUKTE23oR0YtJ3dX56Wbu7Gafife00WR0cj5+QIRKvA
	2l+r/AmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSSf9-0000000EgAI-3HfT;
	Fri, 20 Jun 2025 03:43:35 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSSak-0000000EfpJ-2Uur
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 03:39:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVqYyXFjytbIAvEUk/IcAmKTNU5mvsNxvImVN8MflQFAdM8KQn0OX+zpPAge7CB2DDwuGGj2SWYw8YeQGHZ21S8w0OfRdQZGAAmSzVeBduANLfiW9LJlASXDtEaTZ0as5tp/vxFC4j33O8NPMYVkHhYzuvpOF39nLg0KHJ+GI03u9ZV8YX1fNWiglIJbbP5X1s89VjnP0W57cn9DwFTJSUybunPElOPqF1QQm1CWhmlbMVbTLVCBLMGq/fHcaPIyIFpPVINJ8SDDrUn/rT9rgDDCPsLo71hwsukUiQB/btssXx+ecH5r6FhPkqM7oqNb+a21EFExdjkoY1LCKLEuPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szVHSC5xpU7/GKrK3OMt4XGipxTCcnvAj0Y5/D31qhY=;
 b=h0ioJOpSz0sj1LIOuFKOUq/J7/W1tG7AX6m4WDdM506/zLqcaa/rFtfLnboiOZyg4q55algAfcYWmL1Bn0hqld80DKr9gA6IBZptgtggGI34gO1nOiHcnk9I89kza06j3DFUyRprLNGopnm8jS5zSaWOLxA/QjY13TpjZ6aZgc1NdKkFQk+xdQPw/wjSNN+aMB5VNfo9iuiFATxJntwsg0qhEcXR3R6gKCEyfU9QT1f6cTrp6jCMpUXGQBksw4YV16ZII6/Wu76VAmPkSf5VTkN8DiwFua6i8qDfVxwtt/jutkainc8xUTBZTumU5e6ELsKg7tJDjtreKVQ+vbn/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szVHSC5xpU7/GKrK3OMt4XGipxTCcnvAj0Y5/D31qhY=;
 b=tc61JB9AghNzDV47FcWiOFaW3OkH7lwrwy5DNuRuIEiTDMjZJcBoUjOlJAzTM1M5GxTIKn4txaQ6kTC46duwqWEz5y6c7Td0VSqwE2HyVSeCkesSz9lTZxwPre3GOL5eIla97ajKr2EX2vL/z52xxMPZLUmEURLoNmp/3d8O5qd8fbcxnOz/gUw7yiQOYEyrWW8Ol2r1mRpewm/2tyMBeUuZySCCQhTI1fH+16lbbH7ylLdSRggHddS6tncjf8gH1Fo7ST/Od75kGFUJ6KeN+/X03KpCQyv0KGQ0e9F1ZDNlXJYQG82h0pAAj3PIhrjgIdAUIJMfFOjLi+3JvXXPMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7369.eurprd04.prod.outlook.com (2603:10a6:102:89::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 03:39:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.021; Fri, 20 Jun 2025
 03:39:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 20 Jun 2025 11:37:13 +0800
Subject: [PATCH 1/2] firmware: arm_scmi: bus: Add pm ops
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-scmi-pm-v1-1-c2f02cae5122@nxp.com>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
In-Reply-To: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>, 
 Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750390643; l=1852;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=LMghJZrfvKXKbNZ2kf+WRtqaW7cOykumzI9k3cqHJbU=;
 b=mzXxnLpipbn4qOnG/aQSx5rhg0v3sGZq2KWnW8t+1ulx4PqqrvYJS3qlWQkKt0e7sgRMKHUjX
 FK3WZr53MLOBzSCAUI0uID+izeWJfIwHIi1e0fRUzK2aPZl/qt4n5ln
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: bc016974-30e9-4482-0db0-08ddafabfe86
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEE0eW5iZFV3VEVtWnVsUXpIWkgxRzZsMUl0c0EzYlJ2MDNQVUhkNy9IeEF2?=
 =?utf-8?B?SWVDRndJcUF0V3pYYkdBU01MT0t4RzFyZUhvcXozcGZONG5SNnZ2SzE1cFE2?=
 =?utf-8?B?RUsvRGt2QXBnRm1TYUdkRzRWajhpZXl5WklTdTdKdWIrNnBnWCtldFJDOGJy?=
 =?utf-8?B?Vys3Z3R6WXNHUlpWMHFURDducVI3Q3V0WnhpSjc3NXB2NFZ6L2ZXdllqQlFq?=
 =?utf-8?B?cUdiMjlxTjN1d05kUEJTOW5mRTRpaDd3V0xmL0x5Y0VpZ0xDMnEwOG9QcWYr?=
 =?utf-8?B?K254YUg0cjk4QXBEclV5ZEhub01FZng5SlJIK2tXYktsUGdYTGk1Ulg5NUZk?=
 =?utf-8?B?Ky9uMUJZVzVHR1ZZajZOQ2RScWhNdTJYN1VJY09IdEpad3NlMFlRZXozUUxs?=
 =?utf-8?B?ZW9vOXJ2eDIxVnBrclBHelFYNW9IZ0ZNUEIrdkpUcUJDcDArMyticENPNy84?=
 =?utf-8?B?d2pjRENxa1JCd3FBelhTVXB0TVY0Qjg4eTZ0VnJuN05aaXZqdGY2VHFsNk5z?=
 =?utf-8?B?ajBNZ3FUSHhCZHhhU3UrdjMzeFhqVmZEVEp0aDY4UkFZc1BLZGV4S1pTNGE3?=
 =?utf-8?B?bytiMnBYdTR3N25WYjRvOGhBL0JidEJ5SGdkZjV5Q0N1OUR4djBJSndFVnl5?=
 =?utf-8?B?ZTdtYmt0YmtBVzdKUnVqTVRINkViWHFmL3JBN1d4cE5OK2VvVGRnQ2VWdEsw?=
 =?utf-8?B?eHJWWlAzM3BiNjFwdnBtcXNiaHNCMmtWSnIvRkp1UmRVWXh5RGNwWWY3R0E1?=
 =?utf-8?B?ZExvWWZ5TmkxUVB5ZmlOQ0VYU042RFlDdTJYYUR5Y3hkTWxuK0hrYmVSVENJ?=
 =?utf-8?B?Tk9qWHB4ZWJNK2JNUnBveDlKKzhYOWY2WkJHa25nTHphNnh2OVBrTkk5Y29r?=
 =?utf-8?B?cWdEd0s4UVhmdElySmpxc2tUYk1sdkZjTEVkc3c3RkQ0OGtyVWVLdjVvcFVP?=
 =?utf-8?B?WE5xcGx2bytHU21ELys3Tk52SVR1VGxtMFRsMXdkdTdFZFNyNGI1MUQ5THlL?=
 =?utf-8?B?Wi94aDd4YkZ3bXpPL1pXQm9FMTBHcGVVYXFpdjFUT1phM3VyVW56YVlSOUpp?=
 =?utf-8?B?dHVwVUh5Z3g2N2RIM1paU0VHN0UxNzc1cHduOVVQMy9sbm5HRlRzbDlrbFJG?=
 =?utf-8?B?TnVKdTFmRDlPMmZqQ09lekZpSW5pd1YzQ0RNWFd1WHpMTmhSVUhRYjU5bkRU?=
 =?utf-8?B?dHRUOG1GeW1FMmR0eFpkY1lCRG1RTGJBYTlzdytMcDJvVUhRaUxCUjViV2FN?=
 =?utf-8?B?S0ZWS3I0djhnVzFpMytFcVBGRmlManV5Z1o4SEY5WHY2N3JXcTZMU0FFVUJG?=
 =?utf-8?B?Yi9VQ0kwQjRjTHpvWVZtaUY2RjhSc3pQcTVNeDlZTDBZVTJqb3RnYU5uQjZH?=
 =?utf-8?B?TE1wWjJTeHhHeDgyeTFTczFackc5eUR1VzFRcHNqS2pJK3RvN3lodFVLKzNM?=
 =?utf-8?B?K0JDQUdLZzE5VFp1R0REL3dkUWQ5RHVsdHcvekk0ZUVQeHRLSERMZ05WYTlt?=
 =?utf-8?B?NHNyUGFPaEhSa2pEdmgvTjkxbENQdVZSVFBqMVg4dTlSS2g1SmJYM2FKUjEw?=
 =?utf-8?B?ZCtJdlVXcmU5MXhBTWdjRUUwYWVndkRNT05Velg2SUMyeExBcWh0d0tBaEFa?=
 =?utf-8?B?d0gyd05ZZ2xkajZ6SW5aem5Qa1NmV0JZcFBLem5SczlyZno1UUlYRkVVcVB1?=
 =?utf-8?B?MXdSczBkckxOamZKNjlqSURtdmp2ZklBcHJyclFmSzFTVlgxMHZ0ZFN3VEpU?=
 =?utf-8?B?dXI1cmNBMm96YUpDK1h2ZkFNaVMwc0xlN3QxUk5uS0RrcXVTZ0pYS2JiRVlK?=
 =?utf-8?B?aHJhYjd6TUR6R3A0NjRZcDloWFZLZWtIZnVjN1daQjBqZUhvL2xEcHJ5UTk2?=
 =?utf-8?B?M3Q1c05ob1gxbDA2SlgrVzNuMmd5U3ZLQXZZWndxYmd6UjhuMXM0eXFsWFFC?=
 =?utf-8?B?THNSUDdCWkEvL0x0SnBBdG1jT2ZSM0FPaHhtbmxlRTVBUW5hclV6MVZwKzdm?=
 =?utf-8?B?eTBjdENjcmNBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0VDM1lQODBHaE9wd01CTnNmZysvTHl5OFBVQWxSZ05kQzZlTWQ1ZUZGNjQr?=
 =?utf-8?B?S3RpVFFkaWY1ZEZIdU8vcDRQQytRWFJldy9zcE5BUS9keStDeXc0WXRIVDlG?=
 =?utf-8?B?MVhHc3NXZmxNVU1INHo1dG13QlJNbjlsZGJkcE85OFZqMGZ3TjJlNjg5MVRn?=
 =?utf-8?B?djkxQW1YeS9KUXBtNE9uVFVNQ05GVzN6dUJUVlByQlorajFyWWdsT3IveU0y?=
 =?utf-8?B?YjZMTVhVMkZSSm1LakV6REhkUTUzMjRMM1lWMUZZSFRnMjNwQmQyNXhWTmV2?=
 =?utf-8?B?ek1jZkpybzZMQUc2RDJsdnphMHozU2NyYVRnNDJNVXNNSmVWancxVFA5MHIr?=
 =?utf-8?B?ZERUVGh0SElzODRLQmNIc2JuSGdHaGJwOUR4MmRSTmNNc2tlUXBTcUhRblk1?=
 =?utf-8?B?VkpkeXpWQXhvMHVIelhGNDYwekFoWkZUdmlCUUsrRkRZcG54SXZ6ZDhPWWZm?=
 =?utf-8?B?em1NOHpVcXA5a0R0NXA3YTFlMWc0Y0puWTNzTHBuRzQ3ZkNpcWJhMG1HSmtG?=
 =?utf-8?B?ZXVRRVd6Y2xJdHdVWXNmd0d3dmFkWDVHWU5sNDFjV3dNREZKU2JrUTVhbG9s?=
 =?utf-8?B?YnU3RVk0Sndvd3JBdmM5WEtYN2RrUWd5SXd0QzBmOEdsRU1KeUR3RkJYYjcr?=
 =?utf-8?B?NmtqaUNTNkhucElySk9EMzNCYjJBNTFoQjUwMmxQbGRWd05PT3ptUC9EeHpT?=
 =?utf-8?B?ZWEyRG8zSS94RW8yaG52a2gwOTA1eGxLVHhIcmpSK1JFQ28wQ3ovUjRyTU54?=
 =?utf-8?B?NW1zcCtzajI0dFJ2bnVTWHNtbnVXVmZkaW54eDdqd3VkYXhXZmtXM0FBZWZh?=
 =?utf-8?B?RUV6aGRPZ3o3U0IramdxSHlzY2RQdmpkcXY1RGVVK252YUdQNjVIcEdnRTdQ?=
 =?utf-8?B?dFJSODlRVmdNUHltaHlkLy9rV2pDdnZlRTJrS2lrZC82MEZMY0k3Rm5md1JM?=
 =?utf-8?B?WmROaGlhbVUrcEdPRmxjZjhNUW9zNG9McmZ5M2V6WGtOVzYwTHlMYnBxVWdF?=
 =?utf-8?B?Z0VRU2lUMG9hUlJ0bGd3eDdmRmFOWGpjVzh4UGlDWEFKRG0xSDJFRTNjajFP?=
 =?utf-8?B?TitwZWYxd3VPTCtwRWx1ZGdsbnRhOG0wN3E2MHA0SkxORU42Rlo0Vk4xL3du?=
 =?utf-8?B?bWZKaXJYOHRxNjVCNnp3SllqZ0xaL1hiNzdoMlhUN0JSc1BiOVpVUndFY2sz?=
 =?utf-8?B?VGsvVzVCaTQwSFQvR1NDdDVKZVNFQXBreXhTYkpLdENJbFU5V3F3S2h4ZVkr?=
 =?utf-8?B?Q2crNXZRNjlGcHl4SHIzQ3ZzTjJnOFBVRElVdkFJdXZ1RlRCTFUrYTkyVGRl?=
 =?utf-8?B?bFVWMzBTUGZQUzFHekVaY002K2xEdDVudDJlT0xUZUI5RlNlVWV6Q3g0MCtM?=
 =?utf-8?B?bUxocGNML2hURzd3OVVqL2p0Mm5LUGpVZ2RVdDkwYVFXYmdGQlVnOTRUa3pY?=
 =?utf-8?B?VUJUeW9wSWxib2lGM2t0WCtHWjV1Q0RqTytNTXd3YkQ0TVVrU1ZMV0RWc1Bw?=
 =?utf-8?B?aUJKWnF4Y3pzdXNCa1REbzZNUDlqaHZ6eW9ISHhISTlhdjhRYjl3L3YxS3NK?=
 =?utf-8?B?bUxDbWQ4clVjUzltdDk2aVNsaE8rZWptaFJMMU01VTBxM3N2UFJrdk9CdTJo?=
 =?utf-8?B?dEZTazBudjZpaGFNNzBINnorZWJzK2NzUERVdXhEY0szM0MwMEdxY3NWQW95?=
 =?utf-8?B?R1FjSDIwYlBIMnA2Y2ZIT1FqOU0vTXJZVjFmYXdpY0pZcEg2dDVJZHhaQU1O?=
 =?utf-8?B?MnNXQy9RcEVPSWllM0RIazR0QW9lc0Eyck96NjFMSENKN05SbzFxL2xtVlZ2?=
 =?utf-8?B?VEhweDZaNFdFOXlyejBwcjdGN0lOTEd3Y0diOEJGUFpaZFFMb1oxTnprS2Zl?=
 =?utf-8?B?bTEzck0yTnhVNkQ5Z1ZSOUNQV1UxZUZITHZUVXBTOVVEVDVZNEczaWZzcDhl?=
 =?utf-8?B?dVQzZ0FFZk1SNmpQbXMwOHMvcStidkhuSFdjVHVGQkdGMElZZWVWVE93bFRX?=
 =?utf-8?B?djRwWVlEaTFpUmQyektka2VLUzRvdENEZWZDd3VpZmhPbnFSVTVrZkE5dDE4?=
 =?utf-8?B?Nlo5NnlWZWpRNU54cUprV3V2NUl6aTYwaTZCN0Fic1h3dEwreWRTalQybU4y?=
 =?utf-8?Q?7t4k4Wg8CWE0XOv/Y0JQO+yc9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc016974-30e9-4482-0db0-08ddafabfe86
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 03:39:00.2098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maIUk+T0IRzq0NtmvLB4lLI8uLnANkMREKq5AxXILuU4/vGtu4XzIvXHZK3x8hRHZLhgk03dz4MZmYUDf8LAOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_203902_640517_C75A6C10 
X-CRM114-Status: GOOD (  11.12  )
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

From: Peng Fan <peng.fan@nxp.com>

Take platform_pm_ops as reference. Add pm ops for scmi_bus_type,
then the scmi devices under scmi bus could have their own hooks for
suspend, resume function.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/bus.c | 45 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 1adef03894751dae9bb752b8c7f86e5d01c5d4fd..2d1ef73cb6d39ac611afa5d0008c46515e297b93 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -323,6 +323,50 @@ static struct attribute *scmi_device_attributes_attrs[] = {
 };
 ATTRIBUTE_GROUPS(scmi_device_attributes);
 
+#ifdef CONFIG_SUSPEND
+static int scmi_pm_suspend(struct device *dev)
+{
+	const struct device_driver *drv = dev->driver;
+	int ret = 0;
+
+	if (!drv)
+		return 0;
+
+	if (drv->pm) {
+		if (drv->pm->suspend)
+			ret = drv->pm->suspend(dev);
+	}
+
+	return ret;
+}
+
+static int scmi_pm_resume(struct device *dev)
+{
+	const struct device_driver *drv = dev->driver;
+	int ret = 0;
+
+	if (!drv)
+		return 0;
+
+	if (drv->pm) {
+		if (drv->pm->resume)
+			ret = drv->pm->resume(dev);
+	}
+
+	return ret;
+}
+
+static const struct dev_pm_ops scmi_dev_pm_ops = {
+	.suspend = scmi_pm_suspend,
+	.resume = scmi_pm_resume,
+};
+#else
+static const struct dev_pm_ops scmi_dev_pm_ops = {
+	.suspend = NULL,
+	.resume = NULL,
+};
+#endif
+
 const struct bus_type scmi_bus_type = {
 	.name =	"scmi_protocol",
 	.match = scmi_dev_match,
@@ -330,6 +374,7 @@ const struct bus_type scmi_bus_type = {
 	.remove = scmi_dev_remove,
 	.uevent	= scmi_device_uevent,
 	.dev_groups = scmi_device_attributes_groups,
+	.pm = &scmi_dev_pm_ops,
 };
 EXPORT_SYMBOL_GPL(scmi_bus_type);
 

-- 
2.37.1


