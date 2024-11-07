Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B46D5D685
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 19:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHv9Cs/97issh5XVuPCDyjXjH4adZ/Hx6B4wv0PiYXc=; b=KIjEqiU3gh/fRjYdvXx0FZd9a8
	bm3KoV5dGQrlymy+P2NhRgzYtMdImPpD12gNLcr8tZNIRX121+VzuVtcCP74z89m3zebfIRilNVw3
	df4wLW7Z8PrCg7b6Vl82r94lgsOAHi7ak0VD6CVyFqOo5TH2L2lZtk5gmy4f754KSu0fxYFXr/hm+
	/v3bmHOoaeH0n88vDmCsozO4eAA+Jucsz05JkxogOrw7c7u84GL7sMXLCbE59cmYW9phznk82Ix7w
	RG15YAtSHiyThWD6YWz64VkNYWqmwuZ/L12vCbhFTqnwH8KQ4d+sq08wCpQIxQaiO8EmJYgX5YwZh
	80e0p3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t980A-000000083Gg-3VDS;
	Thu, 07 Nov 2024 19:17:06 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97sU-000000081A5-1j7m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 19:09:11 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7HBdq9002594;
	Thu, 7 Nov 2024 19:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=SHv9Cs/97issh5XVuPCDyjXjH4adZ/Hx6B4wv0PiYXc=; b=
	Jr1gkE9cOaR4qQqzPgjnBwV/3Oh9zPP5BsgI4jCY8ND3VUDvXMC5M9ywthr/j8Na
	00iXnNy77f5GO9EutajSwqWOwx/skRsR8eiuSpdvrjY1/8ARB/xtyJCqycScGGW7
	NyTprBfTKWDlOQDe4udbdi7vD7XCd/Uttppk+972776aNl+mC3B9Gnb5fMKfYeNs
	47hCxXF4IKm6I9qv3f+3xpG9ADpkMRvUbfEwTDLow42jS6svYR8MXKk6FaXYiR3v
	fXy5+4LP3t5FU98NiKc6zgsXyFwwBU+HH9+n9KEUaN0oBiCNiO9pwHXjyK12MUJg
	QymoUaUtCUuIfqbGyT5rxA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42ncmtbbax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Nov 2024 19:08:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7I0lqj004996;
	Thu, 7 Nov 2024 19:08:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42p87duyxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Nov 2024 19:08:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DB52quUMObLJ0HnX5CiICNgtgYfz6gDAlT7N6VNiwILbaAOZ2cLM/utqN88Jz/mQhfl/XJXby+w+gaGyMwC5ebhUzPkTNEPrkOuR2ZtlXw2RYtng9bb8JcMELmw2bfVfRLdD79MO1BGQUtviUQZ/O2Y3PsgF9ib06swKTcMEdXZfPZdhex7RPal31MzPUgHxX/2axPY1Yj6vsBuBvo8T+7qff2mT/TkDtPJQ8S/uwIPCGnPAkHjqB7CuBhamvpxDiOUOlpF/2IL8I//x0WVo7pDBS7FV07Ez0ulS8DuefE/fX4I/ukKK0nEIFl6Dj00r3uIAWpbKTBgODoh2p+yGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHv9Cs/97issh5XVuPCDyjXjH4adZ/Hx6B4wv0PiYXc=;
 b=aP+j89vpfCBoB6/cMvbBea7N4DkY4XjVeY9+vJ7yyljBk1c9tr1/zZmuSHrYtF3BeeXuTEgWrWPX9UXHwZ6g6Q0feVtMTCEeMskml0h/R8DxA+EFOV2QgOcyK67qL7QqiJBETXLb9mUIqm0hKRsu5bMtKE663BnlWm+zC87Ql9ji7ILZwCRDLQ1gTyXI6dTWJG2xtf93FHoXSA/7nND1eF5CR8ayO3RoYW9LN2biKxu97KIEK0rdjledjiDmjBeUh2ZzE8amD3h8hDVQhPD7ovMQQJnMKqXPrfZdej2oLTb3t1/mWQ+DX+Sr3UPio3MPxyiSfOl1eokXIkI9d0mr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHv9Cs/97issh5XVuPCDyjXjH4adZ/Hx6B4wv0PiYXc=;
 b=ag+ycG2BuMOU8X1gHOl9+6jkaKoop6HyLzOPE3V5qRQ0YjZXPkMh3eQm1xpTjMqqy/U0fz+14nYGV3b6efaBPSbOoWWwo59Rp57R2xw92duUU/i8znnHhbvj6pnQpMTljlsop/rIskOPUdndXBPy+twMXM5OckRJmThQekuAuCw=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by CY8PR10MB7148.namprd10.prod.outlook.com (2603:10b6:930:71::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 19:08:24 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 19:08:24 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-pm@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com, pbonzini@redhat.com,
        vkuznets@redhat.com, rafael@kernel.org, daniel.lezcano@linaro.org,
        peterz@infradead.org, arnd@arndb.de, lenb@kernel.org,
        mark.rutland@arm.com, harisokn@amazon.com, mtosatti@redhat.com,
        sudeep.holla@arm.com, cl@gentwo.org, maz@kernel.org,
        misono.tomohiro@fujitsu.com, maobibo@loongson.cn,
        zhenglifeng1@huawei.com, joao.m.martins@oracle.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: [PATCH v9 02/15] cpuidle/poll_state: poll via smp_cond_load_relaxed_timeout()
Date: Thu,  7 Nov 2024 11:08:05 -0800
Message-Id: <20241107190818.522639-3-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241107190818.522639-1-ankur.a.arora@oracle.com>
References: <20241107190818.522639-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0119.namprd04.prod.outlook.com
 (2603:10b6:303:83::34) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|CY8PR10MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 496191a5-1878-475e-e1ca-08dcff5f8da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0hgg8iECDlfMrJVT497GNuuC2359l9sNOBiOixGHERemZwXSvDnmzXyUDifD?=
 =?us-ascii?Q?7AQuGuARtou6PxTYzeQxGZvDhd0bPNQy4JbMAarjuroGNwVEkC/1mAFj2i6H?=
 =?us-ascii?Q?xuNwJGpeHHYNmsqeuEll84IpqEYUNmotRYPtJVqxtSMUA/7NiHASksmAE5zo?=
 =?us-ascii?Q?2cDNllJN8f0Rno4MG43Luj67nibdZ2H7VwIjpiSQJoTC0GqxS5UWo/0n6jla?=
 =?us-ascii?Q?e5o1m2B3fTPcYsMa7AVIkipUxbBohhNujyFWA6tgSEAxhLFKMASVCLfxbxrV?=
 =?us-ascii?Q?vsTeruXjoa1TwEhvZ1F5j4k9++Ek4BYLwX3gudYgKhi706rEXMz9+3lmKPaK?=
 =?us-ascii?Q?2NcSW5VmswomDbhgRm5PZvTeParNBu7tRL2aOPf0k79MVUChLlidvTQYyyz4?=
 =?us-ascii?Q?k4iiQuGmAIt53BjjGBJ5yUDsss/Ocuk/kLX5aEhbCLQqeBV9Rjh7JIGK4vcQ?=
 =?us-ascii?Q?fRcCN1Oe78ZcyI23hkZcLqjjxG05PjKcg4+Tl2sKjD88oAxO18ibPNdKm2nW?=
 =?us-ascii?Q?hokhb4vG4nj1RLTLjN1Ysv4t2yxVP7pbMLCEdk7KeqKI9K4t4MXkcblzySS3?=
 =?us-ascii?Q?SizdsxzOOYkBUrIhinh7WjayV5JxGJlXlAWQCkR/fNTy1VbyByA4WQcJ9QAn?=
 =?us-ascii?Q?PGqVlMdUk3HRwga4ZK5FA5IRv9yFp/PopYTvB4fYcSUo3lWVTspMPz2i8Yv8?=
 =?us-ascii?Q?v7QEo2VWIzxd6EPod7+RPPmBgACuManKosoBua7xB3RrMP5vZrIC83dEl0yr?=
 =?us-ascii?Q?UKr8rlW3pjGNCFyNafHmCfHb4u5m3WSz7jeIYtHTyXDD/rRjdrjERt5jyc/N?=
 =?us-ascii?Q?GNFS+8RDSRA8UAGxKAchZ4ixHvS0IPxNv6D7h8CJfVhhJMhFbkz+QLbzrfqe?=
 =?us-ascii?Q?8pkvQOQ5Vp6yLSXpUGWPGLzMsWFwKVzuE5FTjnmkT/B0jjMS1bXv3GsacvuA?=
 =?us-ascii?Q?rq6oa7WbYd5FsjTIGJKG1GkEmLgClc2JZAQgy3oO57Xy+4UyDIsyeeXR//Wm?=
 =?us-ascii?Q?GzwGu93k6dbo6fRwr3/QmDs5JDAttfXrBNZ0EeC7qoPcvcZzxklWWXUTkAcn?=
 =?us-ascii?Q?9I8ZkbVYvi6yjkp1cp3IFnPbqXmX9t5wddMlKCL56ZqzwZFrNiryF5GhBIJB?=
 =?us-ascii?Q?j5fpyg3h3Rn06zSaqZ+3YC33PVaEQSJbRAdKzRFcj0cHxsFHd2dA9OYf24Wy?=
 =?us-ascii?Q?5I7Tk8QEDgHvkusxiM528Q0p9AObfnLxqdKUs+KYYfEDXA/HgwvIZsWHV2d2?=
 =?us-ascii?Q?j4HOXQBAaLpgzPKhAgSiikuRB35AVPfi5wBLU7ail8KkFS3RLg3KU2hL/C8E?=
 =?us-ascii?Q?YxU07AT9I8G40TbuX+zJOueP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rej+Jse6ecDynO96bmye2pZSvmjMq9kAZJPxT/ncHRD5mQ6s9sVmmUUQICyz?=
 =?us-ascii?Q?l42aVZZrR+fbHLjiEAOrD0IDA3ZmnQ6vfu2E1Pjex6W38oAjX9ns/3Of3GfX?=
 =?us-ascii?Q?vAyhmz7+GxNBxbPMGsUUKyS5eYPLZ7oBp6UinfV7kI0XOw29BBStwEUBiatv?=
 =?us-ascii?Q?L5OO4SbTVeWD9VmaF4Ocw/qsNrIKKLDB4iOUTYA9yXtiVyvJrAvlX7U2FSKP?=
 =?us-ascii?Q?iVp8IlGvswSZAKSVjOZ2JWbOMdJJ+9mGDc373h7sNjI7EaGyIGJmBjoDmxQu?=
 =?us-ascii?Q?cHuQuMqfouJilKg61mOT897aLiShCLqdpl8fxpc+jwXHJ9XwlDF6ywx6XJzt?=
 =?us-ascii?Q?hvcOyT6tAIYtxSmvN0b3y3aeJYizO4BXdVcN632KUgUkHNGM5LJ4HhvXMRsk?=
 =?us-ascii?Q?LkXUqEIGrzg7fDYR4MCsUV6UCiTspo4YMtj6828o7Iy2So1kgHg1bsbROfOx?=
 =?us-ascii?Q?vlx6R1rmmm1vTtcD3u/RuTNKRWfOucIz+Bjq68taD8M1rxFPX+O4WfexMFdt?=
 =?us-ascii?Q?RxOh1X+2SUrkmv9RLfsCBGRqzJrIhMHXXoJUdvpAoZkoSTpcjSEnxp7vYFo+?=
 =?us-ascii?Q?VmqRGZi0nsUCDd03NrupxSLCyFN7wRegX4kpwpaTgkC1aeYlFq4mUVg1Vysw?=
 =?us-ascii?Q?pSDWQY+kiUEAQg/2MHfxjkavCRWXrF4Q36WB11GtOP/lE+IRCUNNGFeo3IFb?=
 =?us-ascii?Q?RBin5+Ej0X531eHGk+W4UR+46ze1ifvksWwpYUYcuv8tkP+rg4cFmUPbDEY2?=
 =?us-ascii?Q?wPRN9RJT68wAiLRHKrEWzlmwuGrpUgEuuHy/RlunTycQUQ/o8P4qV2iVO59v?=
 =?us-ascii?Q?BCgndL/JPI2QDS7KgFX0SAalHqUNIW1vPSc0X9JKKVqd6e6gCA67Bnkn/t0k?=
 =?us-ascii?Q?B2JdFdkA78BikygyKe5CcFKQwoHa7ASfUmo5pOC1MiJKR9C80ihe2/2AeWxU?=
 =?us-ascii?Q?hM4s4qkrwM7oDDsIAc3KUnngsh0eahloCNKntqQa07AB20Jidt8rksVM0jNx?=
 =?us-ascii?Q?B1Q+iIuRb0nwuBVpONIRv1jF0i3wR7UumzYX1kaUZS4L+rbiDTHsi9XTo1rW?=
 =?us-ascii?Q?55uW4AFSwTpub6NUbZVzKpEjNKPoiDwBF3MVvAp+Op5y2NQ5hwCynuzfrR5b?=
 =?us-ascii?Q?qhphCrKrJnX4uhtCmPwQ3UadnWOzwWSJUYKuO4fG35Kd5VCkg8Z0VEuA3hfi?=
 =?us-ascii?Q?o0xzE1jwUUOdpcxwRCgtJ5CTg1j9eWSuHv7YXdQ4mKGXG4FLDgX5ymdOPJWD?=
 =?us-ascii?Q?LZsRiEixgWpcqeNM3+0TRfpFKG/Pr5T3r+PEuZb2AvwWVTye3ATIQT63UTMn?=
 =?us-ascii?Q?21eKpYn63vhmlsjw5fkH7WqtzE0N33SNdnp5dlIclTdN3/Nu/dwaoc4+EQtU?=
 =?us-ascii?Q?2XY1fohI+L/1k/ELMvmMFktziPT09CH4+HE7QAS46DcAeKwkycAJ2nB65q9q?=
 =?us-ascii?Q?smRkav5n3i3tTNeH7j+7RAjDBF2hq200LIO5utMTn99Tlv/LOa+KX2zwYSb9?=
 =?us-ascii?Q?EvBcTt15DncoYIG40+JFk7m0ofcFdI0izvLwJLH+IQ8dzVsAaTQXgARuiRpW?=
 =?us-ascii?Q?jmJr9wMpGGyHwQEAyQ1Sy/MnbXxcPghqcqoZUD6wmgbRB7aY/9DJ2b6zjvbW?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: j4zQ5Ppm0Hs3XQX6k714dkqePtgcKgxXMBlPMYS6cT/qKiRxLpdN52+QGoqRx0M0c+Ip2N53xaB+VQytLPSMbIKLMXG5GUzsdItm5Xg5TBfQYQ1cDMO4z8M7NaBole4EHMPIcU5U14sroMjxWztCoPcAHMk4au8s4fEjkPgwGtpalpI4+CYgViWZw8NQzPJzeLFevNYb0Po3c22Mkw7eig+gEmpL+y4aGoklvTx/AA36VGW4DlLuwx+TeOgtJ046NUsv0eD9VytoykR5dQq8H6jwcbCaUWJ4LtCS4k5Dp3Lp7XONMAOSponm7ouC6VlxkBde5z6x6SVkkM9DU3QAIPhSCD11hThVNoX+szY828Ex5P4Z+vynbpJcXCzbTGnEdOz/IfpJ+fwh6TI+O1E92WHa49L2g9Lvro/+6EMV5iPQShNkoEZD6qNviRscCsrN4926m4V+XhKd+SVZvWaJDqWsARSYpFjVNKxTBlL+wHmrXGb7EhZU46186AdTE0OE3EO5u9m6QVdOkMt7rhVmfat/svyk6LHN+z6uvlf5fbjKbCfKUb8NNhAcN1aQ1lCj/JiSIjJsqVTL4FsDTNnwM/Z2ivTD0G678btK5votWkU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496191a5-1878-475e-e1ca-08dcff5f8da0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 19:08:24.4522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pzka9mZ6XuFs1pIry/37ut3+5SEkXymxlIydrJItch0xjJPbt6OBtgRa6xT9j2T02fBRE51rakmSdrlKf48FhbXxhPIw+1hqonfGWUL9P5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7148
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-07_08,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411070150
X-Proofpoint-GUID: yk1XHf2qy2c34TBbM0O0V8qKz8aAcW-i
X-Proofpoint-ORIG-GUID: yk1XHf2qy2c34TBbM0O0V8qKz8aAcW-i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_110910_468454_F66035C8 
X-CRM114-Status: GOOD (  17.65  )
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

The inner loop in poll_idle() polls to see if the thread's
TIF_NEED_RESCHED bit is set. The loop exits once the condition is met,
or if the poll time limit has been exceeded.

To minimize the number of instructions executed in each iteration, the
time check is rate-limited. In addition, each loop iteration executes
cpu_relax() which on certain platforms provides a hint to the pipeline
that the loop is busy-waiting, which allows the processor to reduce
power consumption.

However, cpu_relax() is defined optimally only on x86. On arm64, for
instance, it is implemented as a YIELD which only serves as a hint
to the CPU that it prioritize a different hardware thread if one is
available. arm64, does expose a more optimal polling mechanism via
smp_cond_load_relaxed_timeout() which uses LDXR, WFE to wait until a
store to a specified region, or until a timeout.

These semantics are essentially identical to what we want
from poll_idle(). So, restructure the loop to use
smp_cond_load_relaxed_timeout() instead.

The generated code remains close to the original version.

Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 drivers/cpuidle/poll_state.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/cpuidle/poll_state.c b/drivers/cpuidle/poll_state.c
index 9b6d90a72601..0b42971393c9 100644
--- a/drivers/cpuidle/poll_state.c
+++ b/drivers/cpuidle/poll_state.c
@@ -8,35 +8,24 @@
 #include <linux/sched/clock.h>
 #include <linux/sched/idle.h>
 
-#define POLL_IDLE_RELAX_COUNT	200
-
 static int __cpuidle poll_idle(struct cpuidle_device *dev,
 			       struct cpuidle_driver *drv, int index)
 {
-	u64 time_start;
-
-	time_start = local_clock_noinstr();
 
 	dev->poll_time_limit = false;
 
 	raw_local_irq_enable();
 	if (!current_set_polling_and_test()) {
-		unsigned int loop_count = 0;
-		u64 limit;
+		unsigned long flags;
+		u64 time_start = local_clock_noinstr();
+		u64 limit = cpuidle_poll_time(drv, dev);
 
-		limit = cpuidle_poll_time(drv, dev);
+		flags = smp_cond_load_relaxed_timeout(&current_thread_info()->flags,
+						      VAL & _TIF_NEED_RESCHED,
+						      local_clock_noinstr(),
+						      time_start + limit);
 
-		while (!need_resched()) {
-			cpu_relax();
-			if (loop_count++ < POLL_IDLE_RELAX_COUNT)
-				continue;
-
-			loop_count = 0;
-			if (local_clock_noinstr() - time_start > limit) {
-				dev->poll_time_limit = true;
-				break;
-			}
-		}
+		dev->poll_time_limit = !(flags & _TIF_NEED_RESCHED);
 	}
 	raw_local_irq_disable();
 
-- 
2.43.5


