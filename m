Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCFDD5D683
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 19:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/7lVyfIFoYvOw/bCZEaRVQqXNTqEcVFYh9ptR2EzVI=; b=KMVwq9+y+m96QORVW6q8/xYvEo
	9ezNjR/keT6q7rpfWdXFTDT3ub+SXqnq94PhtZPX5PtkaDBxv/l4KgKjJuWRGS7t6DuBfjprmV76G
	sK2tBJTBDKfPhErK0wLyua1QfP73PdZEVp3gKoN1V7GkUizuhFUbagc+mxqWcruoRFo54LCYS7l8c
	rZrWnO715ZsRN6pUR2Z1UoPq77bmeFEp231g6E8UkRbKsGOc2eu5MdqJVbDzFOqPaArjCEwH5pAWA
	55XcmUZA9TBxrhh2ABv2PQEJD8wec72XPy6iI1eXkUXh8isGOKAlYiSVrUi7qke6fH1J2yD1JcQTF
	fRhFgYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98AT-000000084oh-1V5V;
	Thu, 07 Nov 2024 19:27:45 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97sZ-000000081Cz-1kst
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 19:09:17 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7HBfIi004745;
	Thu, 7 Nov 2024 19:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=v/7lVyfIFoYvOw/bCZEaRVQqXNTqEcVFYh9ptR2EzVI=; b=
	Lt/tyFAT2WywQx13oK9zeshBd6/PhWBP4RzobJdrXq/q704g6RlDzbDzX8afVAIP
	J5fBkp1TX0Pgx2LaGiNSDm4hlVJd/NZ/97cQDntl9ywoKtl3tAEQ3oUudZnH7vev
	XOuE+kXiKMIv88PUK0yFIF71FGszqJqvaUNvTw7MHe9Xs6n4uBpvO2/gT3NXnRsr
	1JGDEWgy9ZNwR8eKJ0KoR519/VjP0Vf50rMfHxyth826zd0JLSYC13hE1RnzZBu4
	01u0ZnXvgIc6zZv2UUQg3MX17xxGYaJP8eKBCF+Mpud5Jw/JSjbrwZAc9fBFtIy4
	2P62KP1NfcA4Qy6Uf4EcdQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nap03d7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Nov 2024 19:08:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7I8FXA036113;
	Thu, 7 Nov 2024 19:08:38 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahgsuqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Nov 2024 19:08:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9WanmIovLtlnwGrab1sDs195fePP7ctFCxiSjhXfUkP6a25TaxYMvoqXADCcZBgAhDyAHRNQbCQCQcXjTAxH2YibpM+mOYF43o+Ej8mTvv6KF52T9zDbm8cmpNRaffLgrmzn2dlnciIq1ZkFh0/x76BNV7206E+WjLbBKAN0b0BBQzTYZytpxhIswYaosiUGQG0EzLF1NY4pA8CAdCtlPHMh/ANtNURHOLENjinTfNhag2UL/Blzz+FNpxjQw4uCF9DNJdnkyfLa034j/Goh6mlRPPJ6ZxGdbAyEMpMVgRqqCvUu/r5ovhwcvFKDlNSNt82iJmBurgY7Pu3nk17rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/7lVyfIFoYvOw/bCZEaRVQqXNTqEcVFYh9ptR2EzVI=;
 b=kmp9n1qW72EtDF0OL1OcqW/JxKCTFsuB+s/84ldcf55nRde5Hx+KdpbF44FJscXvb1hVrOIXXhoUaefsoMNTGtEgVSFImtG5LwAARdDHSWBKc9vsZRQS0nrQSoZHOcXYZKfi27WK8rW7YSM1EE+5jBlKa2mWSZC2cL2zDLcr/4iw13v4JwBn5U7Q/HTeALmLTS9yXOm0GUrnA44F1F5vo19aT8gtX9W3K5KOwObO0ESW9fTJWqVS6joBzW0FQFE7lpQncx5VwrSM4n5p4uYRhx4MrVFZ23XpO2YRKu4aVxuDc9oQrzMclBVOkirTV267VWsrabdzybMory/jMPWFOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/7lVyfIFoYvOw/bCZEaRVQqXNTqEcVFYh9ptR2EzVI=;
 b=qXWBKLjJdf1d0rDDBfp//a2wUcfsCK67fuiA7zAGV4d/TiCImft2JBxT4YVs/Fdx4bdDGxCQgGXu2ub2i8hBGsU5rjmwHpoY3QSmDgAzsEjDQR97A06D5YYsXIVKQmL8W5MZ10FR835MFyMDIQ03icB2F4XibXdG1Kpae/9gcRM=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by CY8PR10MB7148.namprd10.prod.outlook.com (2603:10b6:930:71::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 19:08:31 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 19:08:31 +0000
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
Subject: [PATCH v9 04/15] Kconfig: move ARCH_HAS_OPTIMIZED_POLL to arch/Kconfig
Date: Thu,  7 Nov 2024 11:08:07 -0800
Message-Id: <20241107190818.522639-5-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241107190818.522639-1-ankur.a.arora@oracle.com>
References: <20241107190818.522639-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0096.namprd04.prod.outlook.com
 (2603:10b6:303:83::11) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|CY8PR10MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ba2132-184b-4f91-0ad2-08dcff5f91a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BlWNPt+x7vHkxDjPY6q5KpTd8SHwx/astqD0kxR7jzsRr/+S6Wxmvm1Id6bL?=
 =?us-ascii?Q?5P36R14GkP4E9RhJaijmIbx5JEPL1GbBfhKXQD0aL+uvDoU23/P7TXCihLIA?=
 =?us-ascii?Q?eQKBni+lzvg+E4hD9FytSM3PVjToHhJsBEwOrLbQd+KsX3bnrAV5v0+GSEyy?=
 =?us-ascii?Q?tWnApCJUsqc+j6JCG/INA1jArhrV06gXqCBhlqiqCOR/iLncyqeXscdmWHrl?=
 =?us-ascii?Q?JB8cLIews1vsnd2iWUbYbZpMp/l/lhKGD7ms/AOVBaukvcFlM+cXSyaw4UPJ?=
 =?us-ascii?Q?+D5xEYQX2NBAYV9FBnAlqISHU/ZiM3h/ZJKC6OUePP8/7+4wJhsZJyjzWtZ9?=
 =?us-ascii?Q?OH519EIW/KkA3jV8h+jbFqZxscf/9D0O1e69RyHYqQgqOYdoN+eYgLVpIAW7?=
 =?us-ascii?Q?qxnmbKw2uxKzdNlVy5SIslbKxv3JY0yUqB+2uDrT0PHLdHdfIboGzlo/+tRl?=
 =?us-ascii?Q?wqRUjEESRSNUH1zI2k+GoE+JEZKVOeV7D5Lnhiqij/8fsS/lf6ihDqCWnTg4?=
 =?us-ascii?Q?ZA3UXF1rluqjAsYHbHBtG8A+WvtgHRqptNmYu9EFiIy84TjLFvc8GiZZW2aP?=
 =?us-ascii?Q?5hk1jCS5gCsfDLCWiIzegN2CRm9SV9fwyTDg69nlINWv0QqB76VDTpKxM/rS?=
 =?us-ascii?Q?xLC8lNFu/SFg7fhOrsrQky6bQfEd6yx4SVOlreS/v/xkoG3AMqNpc0swBUcw?=
 =?us-ascii?Q?kZ/nuX5W/5lqh8nq66AHKggys4vGF6k81agqRKD2UAN6kjF+2cDjeqQ3sWpo?=
 =?us-ascii?Q?mAuxagapXuoeK+6IalnFqH3skZ34cJ6eAfcV+81Ef9emjM8V2NitYhS3ZhgB?=
 =?us-ascii?Q?eujmbexZOUxehTOISY5bF1U9Ma6NwwYaB4z7N63ZkjLPfiqkKXnJczNJYBlK?=
 =?us-ascii?Q?oBzoajG0L39ihu3Q1YmkI/W83Ly8X6geUdbxbMWLCyXIBo+OTVNkR32SVLuF?=
 =?us-ascii?Q?pcZUcthfP6t9h/m5c1yWmGMsUMTWf0T0PmsGI++96CVCCIEJGS7NPgqCSVUu?=
 =?us-ascii?Q?XlP4S/caZVHI+j69Lqb0lTMoz+qFBm/brV+cTV/fRlbmB+qqlM5y6VisqYvz?=
 =?us-ascii?Q?HXJw/S+Kz9+3MNPGEQ+0QDzk3BaGLTQhUIgZLsHqLq1sBXLrm+Zo5LItmmAL?=
 =?us-ascii?Q?3Dyr4qCHcXhoMZz4/19gSIB2poCIAw5nY/GjmVCyRVFNaZgfs214pC180G2z?=
 =?us-ascii?Q?KArXscPdnL1M+FApVUOP2QUizoVdmOuBEwBxKV8r3FqDNhT1NMeb+oQiRV2G?=
 =?us-ascii?Q?rvz+kii8EgoBPLCOg0zyCldfjxHXmJmP6ew1e2t1GyymthPRIN25HD/Dk1Bl?=
 =?us-ascii?Q?kz3aQ7RvSO+y8Iff9clIljQ8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aOq6QZbgzYmeh0c7AIBL+K2gHDeHba66gmv9B6BGb2mbtNzJIZDX+qMtOxBL?=
 =?us-ascii?Q?oUd0Gb49Xueg1mzk++lPdXSEBVPizDHDXVnnVpswfj17mzsCashW4VGYf0ek?=
 =?us-ascii?Q?RshpqZVMUEBzcktXdxzQFnrL64yh9NKTaPhkeEzR2s/vic8OO7VZ/pSm3Mf1?=
 =?us-ascii?Q?B0kBnEY8jB2B/nthd0lfMYA0ysjvW5wyBGgu/RkhStoRxerfKCvKN1m5Hzh4?=
 =?us-ascii?Q?bTT8AoBtB5rDY/XJKj0RiNIBUjsBrGenNt0Ss4h0Gt7EbYSzaB71TJT3QKaP?=
 =?us-ascii?Q?n0omuJ50vCZNZm91yfXY83mJGDJ1XkHC91wDtyV/di8mRQ0uEIRWqPTWYX9N?=
 =?us-ascii?Q?elQ+46+ZgklDzWSXMe1R2zEi+ACgB/CzGsJtqLD9UREUqZSuu8663GbCNmPL?=
 =?us-ascii?Q?CGqBnt1VOZI6D1aFd0EhM2eK75acNEbzIP97EjP1F7G3BQqcI5pj2/dyjJTm?=
 =?us-ascii?Q?zrfkYHqmqnEbeECyFh56W9rpzu2T1ZK7IUcumr+LLfJ4M8kz3AiukeCz/Qt6?=
 =?us-ascii?Q?rdeRLyGZy71xOsN8FpyNo86ufpe1Gtcq1rkTvkFNxEY3kbrLcIZgq41aWSKd?=
 =?us-ascii?Q?7qTVAZWTfF0+yNmEWAbrgvf4/ZSj0KWupcOAcJpwGm+7iq3bsUQcK+p51nA9?=
 =?us-ascii?Q?cAmpEHikEYjz3/xtiFP6E9iQcY5gQOLVgsrlXS95zKAzhnCwHYPY+dHdVq8S?=
 =?us-ascii?Q?CWcA/xdsyShXOrjsDm3h10c5Mc7srIj7YVJHqSpHewim/LVmx+paLLt+2Kfi?=
 =?us-ascii?Q?9beD/mgNLAwoDB2k8cUMEQIo7tIGghEvhz5te4dygvbU5uQfrcTyhzReCfaB?=
 =?us-ascii?Q?x5K1BrpmVad8GJeIVBW2WD16Tr+YrZ5zL2XGZ8nb/4nTUvADld7sXcIJW+oq?=
 =?us-ascii?Q?kmNTHG7bjoQXF/bR3J2dz80ZTdIH6TLhAac/wAjXWLUZJX3EOOqkoSNuPXnH?=
 =?us-ascii?Q?yKRIex4YNLKKuUvvB2IAIxB9559l78zbgeoyNAuyZtthC12yoFcKgIWMvXpH?=
 =?us-ascii?Q?TrxTcTH+7OnuqKYmLG2++XtkqhvSpnwWV0G2gb4dCUVTI45+/+/ylX7d88/g?=
 =?us-ascii?Q?MZAxvp+XzA6NjarCbT4tVKfD70F9ulx106Qa6HdgD0rrCbyX4SyIUQscgsu1?=
 =?us-ascii?Q?snAGDiPi/GLh0PVPqUTiplrTzrg0D9EcOhSaILJI6V1tsBOjcv3BxQ+QrQMo?=
 =?us-ascii?Q?esZELZ59AVSIQ81DCQBC4wZ+ZWhDBSaEARLoX8kj3yJQDKsrTIvq+Yrg264s?=
 =?us-ascii?Q?hSxnnHNk7skxklF+wvI0DM3fhHTRiAwYSTtFHpIVIBOJSd3WXShEgA61JsJN?=
 =?us-ascii?Q?plqWojn2tBj8gLuOHIi9DlcG0LNSqNFWgsIRkj9dSOa3Zhw7OK8IyHbNwW8U?=
 =?us-ascii?Q?KWgsG6Y4dMBOCxSB1krN0lmrnCnH06tJtB8rcY7OgXzbDxAfdEOodP+tVCjf?=
 =?us-ascii?Q?GUWIFh/sVClMPPTkLN3gavEImcWOKdycqc3AXehFjEUn8mUJ9ZFFx7F8FYqA?=
 =?us-ascii?Q?xQPxeVqmHZoMFGL0mlsaZ4UUyT6M1i6cDHnw0g0Un5gOf7orzxYF0ok66a4d?=
 =?us-ascii?Q?Kq2t8ItZ7Yfd+wEtoef8pHIpfD0gueAfxDfLPIEs6Rq3e9oshqqi038WxUoX?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: He/+vt5GqqrpG4dJr0Iio3YXh6ABPaCA4hHgQfTQ9RsYzBZofUtHyLqeusgNB01WVHNvVpbfP72TkG7beX/7xppBA/fgNQK34ITx69F4NSKWCaVQZNZmT2GbAtBwHaH33nanj5sax4MyDo4H6WWDkLH1s4scJ+hdlWV6XEnDebOfvkaHz/ycKZ1bpkABSZmoXqNPEE0rrPpOu4ZsIMqbrsB+wZco/1bYUzgemDpmm9+4pj7XLb0r+4dZF25NLVpPxP+K4hgXrhnbhFreeZiGRQSIj3mBZmC43JqjCWJkmaLaqEmGy2l3GRORvv8h+nzjWPdhXl1oo2s6pbp28a/ScYmmOw7RL+b8+xhNR1yDEY/zXvOgTgDGIDsDrly8ZOXbOr3E6qOPByLIpnxsSPTme5+xdVzC+Ehs2nEWj0r+qHS0ThjF0jsQ4H/7aVyXHI5ictxWfwwZfF7UZweWxJJgzePOr/10R9bxrV4+90fa/3ZSfS5KEtAly23FaBw5I9xUU/Uxqn6iF7QRuzrXxMSEB3rFQwY4b3N2baL+mIT4ha/p6TLymIBng214FgCtk92f0KQo5iiv60o6YUh4SyYym0NTs2jCJReBd+CyOxmuubI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ba2132-184b-4f91-0ad2-08dcff5f91a4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 19:08:31.2781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ar3g8dVwZCfJuo4Ria3tNAzYUoeR8DYLWTbkvkulhacLP50FEX2f4G7HCHwl2k80zSK1mvUWKZLRiFFVCB0iWHRzKotCm5vCtAlYJPUUlAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7148
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-07_08,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411070150
X-Proofpoint-ORIG-GUID: aq1DsHo4V0hYNVc-lty7h9dL8F-XcWNh
X-Proofpoint-GUID: aq1DsHo4V0hYNVc-lty7h9dL8F-XcWNh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_110915_474342_01A84316 
X-CRM114-Status: GOOD (  14.37  )
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

From: Joao Martins <joao.m.martins@oracle.com>

ARCH_HAS_OPTIMIZED_POLL gates selection of polling while idle in
poll_idle(). Move the configuration option to arch/Kconfig to allow
non-x86 architectures to select it.

Note that ARCH_HAS_OPTIMIZED_POLL should probably be exclusive with
GENERIC_IDLE_POLL_SETUP (which controls the generic polling logic in
cpu_idle_poll()). However, that would remove boot options
(hlt=, nohlt=). So, leave it untouched for now.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/Kconfig     | 3 +++
 arch/x86/Kconfig | 4 +---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index bd9f095d69fa..c3a9de71c09f 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -273,6 +273,9 @@ config HAVE_ARCH_TRACEHOOK
 config HAVE_DMA_CONTIGUOUS
 	bool
 
+config ARCH_HAS_OPTIMIZED_POLL
+	bool
+
 config GENERIC_SMP_IDLE_THREAD
 	bool
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 3fa741dc0445..df75df8467d1 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -138,6 +138,7 @@ config X86
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_HUGE_PMD_SHARE
+	select ARCH_HAS_OPTIMIZED_POLL
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if X86_64
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP	if X86_64
@@ -378,9 +379,6 @@ config ARCH_MAY_HAVE_PC_FDC
 config GENERIC_CALIBRATE_DELAY
 	def_bool y
 
-config ARCH_HAS_OPTIMIZED_POLL
-	def_bool y
-
 config ARCH_HIBERNATION_POSSIBLE
 	def_bool y
 
-- 
2.43.5


