Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91496E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 10:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpG26aKeKvBOHjm21QagtL3uNtREt1b3l05PWBCPkv4=; b=n36yyB88xR6Yvn9ZEGUgWGo70i
	aAVhlrj/ZDTG7fdpGqsWdd60E5K24/2/Q7xOhigFKFyNNuhVL+6TBn/ln/IF7ILf3MrkAx+mZGraz
	/gShERjNYv9B3AglrVte9oWY4a3f19qwRTqTd1zLEBgVLMrQMe10BLg1hrpXmQwlTDePKZs1UM/rC
	ylgOH6wH/SwiGprn6bX2zanoBaa2W9g50AIttWsf8T2eqM8X2h1DoQL3dcPfx3ZxJ54EB2/Xmo/+f
	o1KP4RuJ2evXQ6HgRSIPNVXWvTnbsIftNnvzcy7eit0nJf7AY/0Z/2iAMHzBx8ijSemw9FbNIkitU
	+MOPT27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOa8w-00000004ZXr-2Lxs;
	Fri, 20 Dec 2024 10:22:02 +0000
Received: from mail-vi1eur02on2062c.outbound.protection.outlook.com ([2a01:111:f403:2607::62c] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOa0p-00000004Y9H-2JgC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:13:40 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wRJsQnXCzc1J83C/eLDco/3g9nbUooOUDXceb8rqsGT4fcvb+wd6sSzSbHHcB2ZAXDL54vcAUddofz31TqmAYzvlOlwcNFYZDbCJ54Yz8BHmnkIZHmESNEKMX96Y47J8V2Vh0eeffiKiRK1q9gR0cwgpuEdI0iNDY9CUR1fUPg2KIrmtf5OVTfFoAk1gW6shYBQ7D2N3Qm28WOPFPpob/B9UNZUetcAxxfObAcgYCi0tQyb1zBq2eISnbZO/0lyaMYyNtqDXXW2PXDMgFAPv+lLuea1y9P60K3f5uNn1YvnlIXdp1UJD5a7WsbZZ/thPu6LHToELUJgQOz9VBD1MgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpG26aKeKvBOHjm21QagtL3uNtREt1b3l05PWBCPkv4=;
 b=Hvw+DrDitTTbRBa7dv3/Hf37j+YACkFQLxgRhT0hfKhjzuGiAL44svJGG/9R3VgHvLRdtoSM7FtLortHb/QSdN4LGLWzX7kwnbXpKpQWLOKgr13X+F5RDz9pTpSUOUSlvqC0hqSlNOXmJrYPruD8VBJ7iH3n9re4gLItAIzewERANkpUDHTUOFqcGPZEg/N+cVMD+7J4CT2oSXEVjeE8uQZKwJwkwXE+mihRsVAYMO4ePQ6vbydm/McP68p2b8kfzAhefT9a0Tm7ovMiejw8YV8GYz5Wjcu83GGYojGmyeVkSBEa/HUtUFTse8iNSSYNYSU7HAZCp8zlSQXsswdRPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpG26aKeKvBOHjm21QagtL3uNtREt1b3l05PWBCPkv4=;
 b=hKh0arBdzqYmpCOCDCwwzwdjc1Adr3jEnvghFr4FAiqoZY/xIRpds7aTlkLgJVSipiJu+vm53iitdDmmhtIo7pHEMooYPwp0JsgtK7BD+e1Ulc7476z8PnMXT2rh7fw3ahlAJWrVoV+KP7f7gEOBjymjq1LtH/Sw2Iu7hvaaes8=
Received: from AS4P189CA0017.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::7)
 by AS2PR08MB9221.eurprd08.prod.outlook.com (2603:10a6:20b:59f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 10:13:33 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::c2) by AS4P189CA0017.outlook.office365.com
 (2603:10a6:20b:5db::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 10:13:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Fri, 20 Dec 2024 10:13:33 +0000
Received: ("Tessian outbound 42d62cca2da1:v528"); Fri, 20 Dec 2024 10:13:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ca2666e53f2d8fa7
X-TessianGatewayMetadata: tcUtm5MEj3rPH+fi296pD1Qeq9vf+Kmnxw8IFll4Xq3o4+pftjzHfsVpy30vAEkzjEgjg7MDPAvq7EGcwtbqaT3RvVEnAgsjMA59GCgSaYrCHdPIZCTkuu5dJABvjhljxIhUzKHooGoy5JEkruPKyw==
X-CR-MTA-TID: 64aa7808
Received: from Le92edc3f682e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E883FF8A-6669-4085-B03D-1DE80EFC0D06.1;
	Fri, 20 Dec 2024 10:13:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le92edc3f682e.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 20 Dec 2024 10:13:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhClF1IDXMYY2rEpuaeVt3Wl1jmb2udSS/HOQgFOSKh1dC4U+P1kb4jmbsJSqk2c4NPODpemKawc5oFQNem7Rj//7NlMAXIAkdMYECx9hAc72ZoB9l93guUv3EMIhrRgrMPf66U4B+1U9l9t7jPW1AprmSzyILxxL1QubokZh28/U7zd1ZDhUNIAURIQZmkoAXpG3qp86keoKbqXhNoZd0vingi7jfmGmHTAuhtrD7I9Vf++BnxjUL1kKIQ/nxrF0Btcd0yoL1NjVSKuEOmYgz1c+gdhbtUIqc5hxGAVWgfKRt8Cf7JBUbyq0D4ZmmDj+vz9uCBwUrKDuc+/dfzwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpG26aKeKvBOHjm21QagtL3uNtREt1b3l05PWBCPkv4=;
 b=n5sbISwsCUKSTTFkk+lbRVbV2ghupI3t5eRT0qZwoSWvocVGcTKvK7HecUvWVpMi7yfiCEE2XbkB4IimJRxbeVL1OUba/UkSV/HdSwFie9hB1jtIPuTZVearkjyV3nHI9RyVXv+plD3o/pqU7q8+ZYlfn47N+5t6jdK+GqtvKkwZzpaMyA+aOeRcMMMPtsApqRDpQ19uaPWuaIc+y7nY2EAjYWApDoNIi66BK4Q4cbEzHPJ8OEHYax0XQ5LH2D7qNRSHkJlXNczp978gJcueKOTqi5JfkS9Mj5bHMiEW833JRSU/TZOa8DT0L2Pu9+hTstz50xygwPxYEJ8GhKO07g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpG26aKeKvBOHjm21QagtL3uNtREt1b3l05PWBCPkv4=;
 b=hKh0arBdzqYmpCOCDCwwzwdjc1Adr3jEnvghFr4FAiqoZY/xIRpds7aTlkLgJVSipiJu+vm53iitdDmmhtIo7pHEMooYPwp0JsgtK7BD+e1Ulc7476z8PnMXT2rh7fw3ahlAJWrVoV+KP7f7gEOBjymjq1LtH/Sw2Iu7hvaaes8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by VI0PR08MB10681.eurprd08.prod.outlook.com
 (2603:10a6:800:204::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 10:13:19 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 10:13:19 +0000
Date: Fri, 20 Dec 2024 10:13:17 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: suzuki.poulose@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 2/9] coresight-etm4x: change etmv4_drvdata spinlock
 type to raw_spinlock_t
Message-ID: <Z2VDPQMUH61THA8r@e129823.arm.com>
References: <20241216115006.415861-1-yeoreum.yun@arm.com>
 <20241216115006.415861-3-yeoreum.yun@arm.com>
 <CAJ9a7Vj6_ek9D-ZySt6dNAGWwWV=7yX36T=n7+n-Nak=UEhMdw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7Vj6_ek9D-ZySt6dNAGWwWV=7yX36T=n7+n-Nak=UEhMdw@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0214.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::21) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|VI0PR08MB10681:EE_|AMS1EPF00000048:EE_|AS2PR08MB9221:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f0224ef-503d-4959-dce9-08dd20def5cd
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?cTBNdc4KTdnowUyQEHxtOo5wytOJjuacGGwvggV73ysUNmnmLNaRltSxuEKX?=
 =?us-ascii?Q?t6KjzRwAeGyHqd5HZCcS0Y/aMjmpXsDbuVIyv4Cb1hv/roVNF3MLXx4/+WqK?=
 =?us-ascii?Q?ksIY5SWuLpi0LNdMQOppL+mllvcDCBfsaKDzh3lBKsVLKeqd3E+0Tq2HircE?=
 =?us-ascii?Q?qBfR4LlcTdMooj9JCczVTUOsYCeD2oQ8yicMsD2F2nn6EPg1gvomJ+XHNGVP?=
 =?us-ascii?Q?8s9AWQPPTX8fm34jptGnMNzdtMJZEFrm4r9ldDOrBN9SCbin1qVhokKXcop+?=
 =?us-ascii?Q?IpsrKLT+GI2PIo63P7RK/sLj9icr2U5Wc1aI6HBRKCttHOnJ66V0kcO8+xXg?=
 =?us-ascii?Q?2oth2lWLz847VkPTAxXVt8v+jjL6WNiIFZZKNaFSbyVepN2TatnMW9P8sChI?=
 =?us-ascii?Q?rrNBDmWe6/8MJnTvOpjSiUNVs9fw50DFDzwTaDTyL+IkocqoNd+rORtlLrQu?=
 =?us-ascii?Q?BOe9bOv8KtMzxt5s+3tZBCrJ79PgVz0KVZfM1ZlL1B4hMIHH/Dn36o26OmH7?=
 =?us-ascii?Q?ELbkg5t+/RQIP4qF8KuTXPokwIUM9Gr15tfHJEl8wSpFhl5UT+lq5SbDXzva?=
 =?us-ascii?Q?wZK6eHSdiMj5t+ooGVJI3Dxbp5ccenxcmOzWbZ3SMAeOYjbOovKTWk6YelYq?=
 =?us-ascii?Q?SwnnSIN0gXZLIZgUavZDKy1RIUGVnwYhzphKsGtZubeExD8qiD03yP/k2gZH?=
 =?us-ascii?Q?SgaUeCS0PY/w+Xme8TkeOfRzG0yYqLiczHmjB9SX3dTtbTVD8baz7J9D7JIk?=
 =?us-ascii?Q?4ltz6F9OrKjoohTNIoZpAyfA4wMRZrZDVHKUEu7trqrP/Gte5AIvSPVDG3bl?=
 =?us-ascii?Q?C7JCD7x9Vv8HPiZurZ0rKgTL/aRSUvAES63hsUboFhxBPi4syFm15wteamTi?=
 =?us-ascii?Q?mmowEI8OvX+4UcSACh31nCdx61uxavt7HoqBRHGfpE3+jGcAgGe1usc02EOr?=
 =?us-ascii?Q?tJKspaaX2wG4c7CKVmYSFZY90BAF1fBiiDFzsaBjNzybWVT4ONAtBMoCKhdP?=
 =?us-ascii?Q?buu2HStp/wNBhdhSnpFgxoSimd2XSj89x1FeutvJB/tXgiYab58Sj3vARlew?=
 =?us-ascii?Q?agWvHSw2sgHDj/BkgXSaZ7bfjw/h2YSyRp0cAB7GbMKbqOPmQEbLFPYo4FNJ?=
 =?us-ascii?Q?MukIfNXY/CR8Ju8nC1O3+siMX0VOOfGJxW7svyfUc29F3QQTzUIeFmTjcGSY?=
 =?us-ascii?Q?nED2p37T7whydcPOPpq6SktxcXQsSvXqvuXZXDl39VVzgCFM7IWhQKkw+cai?=
 =?us-ascii?Q?l8m+U8g8dmnCIeySWnmy1HEx6IYLC535t14fy2fcYKbRP1/mS9tk9A6vKvar?=
 =?us-ascii?Q?lDG2n73Fj7xhvvWDMRJstEDWTKAsI3X2Q8uKIVIwWO1ga+XsDyx8BIRW8srQ?=
 =?us-ascii?Q?jWMFHjns8oH6RyUxZ+bSq0RdEsjT?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10681
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 56344e1a-8338-4a39-ddf9-08dd20deed52
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|35042699022|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6neaVNFAlSD5z2M55Rd18gPlS/Q9slwhQQ6IpIP/KDSNPiY9fssUdN52Frfc?=
 =?us-ascii?Q?yHRqepBxRK9z3p1mkopEcgn8hBECJNIeA7Dqy6Wx0bJocYH3wVTWHwJidZTt?=
 =?us-ascii?Q?SMX+e96d6UIN3YieaNHtRwyH5YOyOG9ZCnMkWmKsWvDIHsgYOJKez/XYy3gq?=
 =?us-ascii?Q?FwSb7O8X3r0q3ktOg+nZdEJGillD2djAPSB9o3fWd5vAFnfd0InVWt+YfDUA?=
 =?us-ascii?Q?rTzZGYIdW/JuYgq7Y/ntWvlkzm+L4IHkfzVNKxBeicHN0G3PJwQMjsLiApLS?=
 =?us-ascii?Q?ZzePtMdxueYgzb8nG7wnL3aoIDj/IBFKb3wHh71K14RBxGj+E/5RNN8vIrzl?=
 =?us-ascii?Q?rAp4Td8TIixBWkLC5fuuGU6tlJQFZ7Ev3jgPR3+mPUMtrz7w4+3geqCRJT2p?=
 =?us-ascii?Q?sACLYJUGgStR44OF+szF/x36Kd4+WiEqeX3CZWszEndDrjFiVBDrUrAgMt9l?=
 =?us-ascii?Q?wopwEHVy8gEIHGnWMgRk/R65f/p1ycW5Ekv1IPa3dFA3+jP7sMfabW2LcmiK?=
 =?us-ascii?Q?eGbGtzxWXLPi+iMUTJ/RJ1RpOUE7lUeeJvf0Qc+Rgz4ymPuICuV7i5D9NPXt?=
 =?us-ascii?Q?2h/UGF5z/aIKnLGLilKSKqv+DRx0Hee9Qx461kUEfDq/IYFU/gyakdXmIDUN?=
 =?us-ascii?Q?8xrKo+Zw14kAQpvrxrg3fPsZX4jwLDfKh0iN4lMmWTNZCslfSJVZqHd+/uFi?=
 =?us-ascii?Q?HhlQ5XRWrMRDJhZClVFqrNhPh+jR/XLjIzQ1sCOcExifV1ADoX2wBubuRc5i?=
 =?us-ascii?Q?sBxMcb80ulQS0DKMM7CaT9MQFso5kTiiDG442xI6R4Z2qrU/XtnS13FyRtzv?=
 =?us-ascii?Q?z8Ik44eDJEep6EZ3ieecuBFHF8hx/jWBy7ArYo1wM/T8o6qcsHpJiqc46nxr?=
 =?us-ascii?Q?ztb1jJ4LxwHIdlbLk90aaY+1YNU+EFzARukRnZIg58Dals5m3rOeThJcZKea?=
 =?us-ascii?Q?BiLU0jBDtgmT0OJVimU1kgLnStzlwweITRDikI4ghLyO6TlvJx7fe/dCJplC?=
 =?us-ascii?Q?+owzbSdEZWaLzV0siMhN0vHLVbvGUoOAZynlkll4QlKkbXPR4MmgnIUfY566?=
 =?us-ascii?Q?aYV4ByCA8bUMu+MwNxOThr8FmusTkcqdwa5a9qS7OXOquku033gCzqFLpB7P?=
 =?us-ascii?Q?h78NqvivfhLnIDdeohqQM9oUdKjGcmlC5LqGgUrlwrxA6EpsehIBykcDzg+j?=
 =?us-ascii?Q?Y8az1yIeYNwEYpjkCERgp/s/8T8rfLkFzZYyJfigh+wXRVyQItWcEOVwy3eP?=
 =?us-ascii?Q?JKmzBnqAAMuEnW0TjHGR2AjdRmOXQ7YGKbM8E2qoEhELD3gRLYt/QfwlXr86?=
 =?us-ascii?Q?+WI36SgliqFaAdN5+5b7QM7Re8ek5TnEpKRquV/CGc/G46Sde9AbFUWnZp0A?=
 =?us-ascii?Q?IoO9Iqkm5gSvYP/KO9JK4fyGHGt8XRUm2guAqy5ovHBoEAxcyJNDIHwGhWHO?=
 =?us-ascii?Q?U5ZyzJQUq4EYGz2iVt//wLDzJt5uBK5VYYNlwgTpp1CxfWdNoEPctaLpaMEq?=
 =?us-ascii?Q?mWRAKH4CUjXpV1s=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:13:33.4747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0224ef-503d-4959-dce9-08dd20def5cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_021339_591531_38AE11B0 
X-CRM114-Status: GOOD (  11.44  )
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

Hi Mike.
> > diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> > index 6ba013975741..b9ebc9fcfb7f 100644
> > --- a/drivers/hwtracing/coresight/coresight-config.h
> > +++ b/drivers/hwtracing/coresight/coresight-config.h
> > @@ -206,7 +206,7 @@ struct cscfg_feature_csdev {
> >         const struct cscfg_feature_desc *feat_desc;
> >         struct coresight_device *csdev;
> >         struct list_head node;
> > -       spinlock_t *drv_spinlock;
> > +       raw_spinlock_t *drv_spinlock;
> >         int nr_params;
> >         struct cscfg_parameter_csdev *params_csdev;
> >         int nr_regs;
>
> The above changes are not etm4x specific - should be in the previous patch.

Yes, However when this changes, etm4x should be changed at the same time
because of build failures.

That's why I modified this with etm4x where currenly cscfg is used only.

Thanks

