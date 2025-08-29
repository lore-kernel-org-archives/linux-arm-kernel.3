Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A6ECA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 08:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJWd13X60oQhQxVNoySzZj+jiy/53hYqUs08u45wvuI=; b=r+ybQLmAwiYsPUcMPIkReCfkTn
	y2zhjUisIHbJ6EBWfjs7/BIDR9IETlP8hHqZqGGRatYXF/oZKGkiYAWaf2YUDpcMA7BP3jJytMpLo
	AKk24oTVYNg3qk9L0w/HrU4JilZLJacZG9Xk/0GG697TifFGUVdEHa5K/hRNu+8WTie/RVqXP/w7A
	ru8vIXEXrJEPfF1w6VgsL83MxqKM9NnaHoSwFc7Q4IUr+pcSUNuxPNbE5Z2ABUtv60iFokawcR3/A
	pc/32AZjdxcpvW5eZJ7yIfZBcOmSyNTx/kwqqBIA5UdeWl1dEP+1JvTnvfFVjBD0Rw0dLh9EXwaWj
	aKtKBETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urucB-00000004zz4-0LlF;
	Fri, 29 Aug 2025 08:37:43 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uru9Y-00000004u1r-3hYD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 08:08:09 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T849MA020485;
	Fri, 29 Aug 2025 08:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=gJWd13X60oQhQxVNoySzZj+jiy/53hYqUs08u45wvuI=; b=
	SH1LJSYOPfeeFJA0FycBUMxoPcm9xn/N6QDPil5ByledzZN0DknD9zuKd0iGlrkx
	SPpAO8t8n23RNtLhNcyOfcHfACxAMxBuaUpy+X9CDg2ynfuTwdRPYrRoYw76/+aW
	s4JnC+cSkw9/lmEGCsbJ7Mhhh+vrOPEFvj+nj14oTWmnhXsg/of2LZOz9V9epucF
	+yp/y8O7+m/2XYCJXJliMy7og+NnEWf744okA7ybTbgDDMUa61fqoYlIJmf4iSEC
	U5X2YSWr+/zkVM/sLPULZ9z6z7/nXmA4+EdLsmv5eHjGBZTKoM0ensdiryF4Ct9u
	xhtKQeDAYYsDR3ga9ty+ZA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q679215y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 08:07:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57T81eRB027290;
	Fri, 29 Aug 2025 08:07:45 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q43cqnxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 08:07:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpvU8G5e2HokZmbRXsJJqRiIITavdk6NTBzDz1nsByhQa5oQH5ZFaDwNIV3h9YhK/Vz4V3bpBlYW/OTytgqTx7af6d8HSj/Rtnv+y8NwRG6tV8juISjOzPsVrseS42AgqwcesJjz3bKAYx7+Bamfrb33Wps/tXX8aMZt58+nwawUU4SVI0qpUoHs5kju3Sw3sdEzGfzURvNVO9PcN8hoK9kFf6zExv3ER5KPHslYP7lPwfz3SJNOf2qAps1eHd0x2e3zFx4AfiP6ZCDd3i2Wm7SnlmvJrklzgXHqL2O9UTovr5foh0+r/wFK8m+QRPSdb1VNtC/k40cprIB2KQzPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJWd13X60oQhQxVNoySzZj+jiy/53hYqUs08u45wvuI=;
 b=tTlpkssxE/x5F0mbrzDYx5ElyFV5JTXAVGZJCy0IblWlkfuRNdb2ueDIgd3464BoL0EUpRNufQklpL1trXHCr/nDfvkAeId3zBbOgsSTrETJQrbDTHGFWdS93JqBTGY95OyUxgFMBDluDJd6RhlBvwl0pyOx7fhVJTaqyBsIpH9Zms3/SFXei9v0lhJZzCJnSTRDanRCDadJgQ8jBSTi7RuGNrUP53mpCQ9UnQSl23SAIE4DTDiHmJYIM5oJUP+gzJ5rfnhsInXbIlgeL8LX48YHOhoELUFO0hVXH8QSQ3kAqrTJO1uzeTWtnVPM6Z4v5UHIhvzfgu4zQdcfXuLlKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJWd13X60oQhQxVNoySzZj+jiy/53hYqUs08u45wvuI=;
 b=Q8ab4UNXe3X8zJg4GSelJkmy6+cu6UPsKiFrYIq4ZaoV8ObtNUX/QRJt0jUU/LJJvfgTsAL0Jn71v9pKK1nEpLDhSPkSP4MnR3KiBF491H4qZsB2OXCOzzItJM6dZp1qWZ4t5mZ26NmljINKuDn6VvJduouL1UxbsUKntHncBQU=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by MN0PR10MB6008.namprd10.prod.outlook.com (2603:10b6:208:3c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 08:07:40 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574%4]) with mapi id 15.20.9052.013; Fri, 29 Aug 2025
 08:07:40 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Cc: arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org,
        peterz@infradead.org, akpm@linux-foundation.org, mark.rutland@arm.com,
        harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, memxor@gmail.com,
        zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com,
        joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: [PATCH v4 2/5] arm64: barrier: Add smp_cond_load_relaxed_timewait()
Date: Fri, 29 Aug 2025 01:07:32 -0700
Message-Id: <20250829080735.3598416-3-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250829080735.3598416-1-ankur.a.arora@oracle.com>
References: <20250829080735.3598416-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0129.namprd04.prod.outlook.com
 (2603:10b6:303:84::14) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|MN0PR10MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: cedf065e-edef-4bd7-7fa4-08dde6d31f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0qDfoBBLjLnqYrhsfXdV7CP8/yroDijKw862Yliu2yW6OP9oJ2hTonYcrbSk?=
 =?us-ascii?Q?STKJ8Y8bqbdueqykHtKxsNc0F/JtI+1LomqSvZsXR8GE5U/dO6V1xe5O5jyp?=
 =?us-ascii?Q?VKSqMbvgc6QorGm11GvjA1xV1GlIevh4OB/tJWJFvoHLn4PCpYHs4mAQgUGk?=
 =?us-ascii?Q?2yoCVZsP9mcQF7yisEbCz9CGvmAYollgcYtuK+D9/kmneau1peaLQ7zbe1sv?=
 =?us-ascii?Q?OuLMXOfWVyrsKCgyNZNZ22QrmfM1miyarVy78gDUiqKY4NLLRBXmGIFE1K+y?=
 =?us-ascii?Q?LozrUqWRmmj9/W/CVGR9btuWvyXVyDdHHAzELEh9b9HPcWrkerTyWJPtjri1?=
 =?us-ascii?Q?f0flqC6JZJYWmpemsxl8hiI/wBbhgCJ+0fByewZn5S3FOeOx//wsob4jxXqc?=
 =?us-ascii?Q?Qy1vp3jK2D5Qq5vmtX44Ro9Zsj8xWbhA1OryCQfDB+1xpyVWohOgHIqPzgsL?=
 =?us-ascii?Q?O4kV37hLvqoYpSaYIsHaBOzn5NYnVAUSSk58s/xGBu6OhkLvk/cMji/j3094?=
 =?us-ascii?Q?sq4c/xrv4jA4XMYvcPeRy9Zd1U+fQ9nR6+jLDtlgdlOe130EG9wu5Y8WPOra?=
 =?us-ascii?Q?bUyA6mF2W3Jgn03lk0XOl8NFNqrrXc03jq9fYPkUQkjgzUD0x1P8DeZeMGvo?=
 =?us-ascii?Q?xnhIKrfbI3Bfs7HaA4nRKOOIyacRxoKQ3L97oZsuLohR89Tw1+XxnZgla9lv?=
 =?us-ascii?Q?JMRHU78dYUoJUiAiLJqWcy9Wy1g9N0t7YlykobhJ3VWZx0+dwSMXCH78kuqD?=
 =?us-ascii?Q?h+3ydMxkwR2TRTfzXH34U9zoPgvfMnUnWTyyjvhd43Edhl+zqG2P4pYAE3Sm?=
 =?us-ascii?Q?YvhHJNCCnXKD0oISl/2+XxTk0wtXnRknYbImOGekDUNsFC/BKW906/VObXsn?=
 =?us-ascii?Q?ZkSwHNB60NAVLFtvHVKnkJjHqAtwFJdE7KYbcEQErpkRTBg57lBzlrr+RAkm?=
 =?us-ascii?Q?bhks2cEbAAuuQGPH67hcuVBL1Inwu1dqYA6ackXlUla6YjxXXwHBfwsy5nZC?=
 =?us-ascii?Q?q8wyMk5rR0ooVmraTElnUn3JndlLf2uvfXywT53oyO8PKY5xkwx7uN6YILZ8?=
 =?us-ascii?Q?2y0NJ/VSwZ7vXv4twn4Xrvg3fHIe3PeAJ5WkPpJ9uyt3cyCJIdcNuBYrvsBQ?=
 =?us-ascii?Q?6MST+AN28hIyh1t5lin+2rI5mFJ96ZlSUi+iWBlg66Uh0NrK7U6C+oHPPwPz?=
 =?us-ascii?Q?y19HAoIAbVp3T/CH7l8afpvmevAYfll7WmigaaUcS8Ot3CDebIupIj+Spjfp?=
 =?us-ascii?Q?n68yIPbAQWVGpCMrAaS5gdtT4rvXsSZSXkzqMTCSRsVhADNHIzLc8GGf1MJn?=
 =?us-ascii?Q?pus0xwIeTNEfjs3d1wudKar0cZNn9LXh35znW2paDKe80kgrNMkzljyUdBwR?=
 =?us-ascii?Q?xKHnh6xq1W16xt86I8Hv9UIQHmhvtKJtcJGgqcPAlkv7q09N8EKWg+baPpBp?=
 =?us-ascii?Q?QEuoynUKoi4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qz3re6HK/sPfLOVw+0G8tI6hyGtFX9oltuxTLVaBpj7KES3wkBenjaxquWJc?=
 =?us-ascii?Q?t446yEXBm82esrFADgz9/9Jsg8ve3qhMoIar1pUFQ9iEt+nJeJlDBwNZ+cFd?=
 =?us-ascii?Q?MF/NlbDPEitq7+lu+0n6FBRjiDdtCQsxcEa9Z/6UVSfLKrxSiPQbSqg+aCYT?=
 =?us-ascii?Q?tpxPCfziWMewbHXXjNFh1t4hewZmGLYOVKgjBXHcCSqYicdhb94QbSiH0G7/?=
 =?us-ascii?Q?zlLCrPjYprA0orx8cyksFLCb6qI6GD9an65meU4PLXzeca9sRgGxI9DhA8D/?=
 =?us-ascii?Q?eLrHZQcZkMTBpbV2I7TxjEmuufFYGCfdIkvZMf47XRZgej/QQdMOr8U4KpPJ?=
 =?us-ascii?Q?/3uKjreq0xkdmij8zpwQ4LMuM60MA/QDktx9hLWj8w4tdWFsmRZH1Akfujrx?=
 =?us-ascii?Q?Gh7Xk5tb+5uUOpUERTejQDzEyUFLTqc51LEPsY0AGq7PPwZEI3T6MrqVmiM0?=
 =?us-ascii?Q?jnILIBaGpBLSsVDI+7fRj/H4M5T4VTpj2/ON2/0f7WTHjpEY18t4mbrXnRed?=
 =?us-ascii?Q?8E+vzac5Dr6E3tKpXnOl7mtRwW8FQOVj2kdXp+hxIHduSmaqOr/xaviZH+kX?=
 =?us-ascii?Q?oEU42yyfcFFoVq1TkS5MpEqo9JXJIfagBt1AVfNkvKtPdCEmXa1t/we9dF7b?=
 =?us-ascii?Q?eSgyonQvSH0yG82XDU/OUn+IIq07vdVcI8QoiWL1HTQOE8J2XyRKEFid8709?=
 =?us-ascii?Q?F+pZo35Sx/7ioHWgZfdCzn7oEudbQRdGT7nzKN4ZLnMDaUhL4aZM81ugoWCx?=
 =?us-ascii?Q?xwIbk1lUR6rvNeC281rzBvE1K6dVOC5RPZqWxLYkVjQLygbREdvFV/Aud1wI?=
 =?us-ascii?Q?GQJpUFmYUoGRYIR0Vv1xf1V9WO3+diWin+UgNf30FzD8+QFWfSxUtxd5v+Ip?=
 =?us-ascii?Q?l63MezVjkQ6t+6/OZqGmMs1KjbISskj3yNqCuVW2zVqjXwunyJUPvEHqxx+6?=
 =?us-ascii?Q?bRlAWycI556CY9MwcAS4Ti/RsOg3fpQYTXRrVQ8CvpjUjgeXGC6kfhvpPjVN?=
 =?us-ascii?Q?dZbirK2ACKU3/3TyjihHpzPeezDLkOxbJ0DOfYAwuJSHolgqJtqtPzM3HHXE?=
 =?us-ascii?Q?PVydL+5TLtLXjSI/Q5lKWv6mcYztzVeeqZHrnyhkb0yGwWrfzJSxWBTNwzYV?=
 =?us-ascii?Q?nn9GSgHdw6d0W75Jc3VBwE6vNjVCAMw+b1XIUYsZrYiV8wfURA7HNl1rqUw7?=
 =?us-ascii?Q?6p/zTsRqxiS6CdnNlZKoVlP4uK47d1eoo3CFiiPincVMVXXkZ+8zUklqnDS0?=
 =?us-ascii?Q?XhJ7ViXrOqgpXCnJ9p0z6PEgtBSOQ+iWeQyxUtrSzyKRUihm8cbQUJTyusDM?=
 =?us-ascii?Q?esDU+AQobVJRo6w1MKnwqTBS5fznNlcQ5tcLTJnmLR06HLAOjoGQ+vpy8rCr?=
 =?us-ascii?Q?Q/u/lPX82C8cv4o2NiRF+MdIxLTJfuwKtjLj6VYPAL2Gm7BDpmPHSnjeSH5z?=
 =?us-ascii?Q?OynSUNVjHiRZxt9QuxVp9bkmpSVZZk149HyM2t4eN0yqeTcXHEEFeLFtIldb?=
 =?us-ascii?Q?AhgkGczD2YHGpLzRZFPLd1jC/arZUoTcdCudkpEbtAV5bQ2Fz+CeD2r0kNiC?=
 =?us-ascii?Q?Rg3f86hzcI2OgzNVvCLCv54Q9P1zcIC5ChYuta1VpKMlY4lJXDQ1QL4yc908?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: k21SpPZWEXUutiuagb1eRFPN4k5P2oVS9w5gpgHBzh+ibp0XkG44ion8bfE3dpYFNGjR0hmQ9QjaFuL2IT7VM13OiwTp1Ph7XdspeCHEpnBMmSUjeuoIxST+1SoGgQQTxgQlNggbQcayYR9VAu99SW+aSOJO7jusVTDpUrIwZOyOXlMlM6drJrGwrNF5RMNrzTMLZMrkZGSatdifGtwNLgEBINzfP0anjU4jTbDR72UT7NEy6J1qac5W0y1gPfScRbesyg/EHKbTx2UsHie9Q517LaK+ZR/qCsVM4HlHWQoux6WrCldPJgf2Pfiu16Izhf5wwdGBLXJLrvLaSlpmMoZy5DDQzwwxSbhM8Oynk6zodGq/eO536LuADx0fwImqHVJEgsmrxBZkTVnx4Kvx+iP2eb9ZrPt7H8tBiLbAuBhcG5manHO773jxydzQQ4K78gY9xHjTJOBg26LZ86nX8asF2GEyk6zhLmdUka8qekS1jij8QO8/Wk12JyXtO+oO7yarezHABnV4MYCPkSz4RFwFQvgsBDvL+1a3bioIhYUUbsg6xUQX3/k58AlBZksXE7BT526bJ4GMoSN0dP0nRp3Tkop05K/kueWN21xZPuc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cedf065e-edef-4bd7-7fa4-08dde6d31f9f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 08:07:40.0928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfW8ki6IHdsmOYIUbWXEdmBIAiiITB7e3kYp36sTIPLvtm8x+d937LjBaor8HwmayZMi+ATVhgdgiF/HvgehoQ7dBcwpHup7Ia4hkY0VkR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508290066
X-Proofpoint-GUID: rdmgMuTMKVSPQNmtMQi1U9a4gPiPUxCH
X-Proofpoint-ORIG-GUID: rdmgMuTMKVSPQNmtMQi1U9a4gPiPUxCH
X-Authority-Analysis: v=2.4 cv=NrLRc9dJ c=1 sm=1 tr=0 ts=68b15fd2 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=7CQSdrXTAAAA:8
 a=yPCof4ZbAAAA:8 a=rPp4lnVFDGyTbJpFzw4A:9 a=1CNFftbPRP8L7MoqJWF3:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNSBTYWx0ZWRfXxoBLkJMP4ujL
 GinV4KMoVo6NB/+7g2F9kFkPL38V07zd/spr7CL6LYw9slQoe3o/4aW9pupvn5GRn22n7c4kfTH
 Vj1UIxxEalBN2rp8sK/GGjp1hPX2t/ILfmcLZ+2sP9lAkvI2M5uMfkOaePdYx71i37EB0aKr6JA
 hUNXkucyshCQFjMvwE0XxV7mjWBmRkWK4grHMSig0TUa7xHjutjJ+aPeV1bheRNxq+JnUOscvuM
 mSfOQQNnI8szZQscQYDyGHL0L2NCD6uWjIH5O4A/gV7NUe81qLcC7pFEoHkP4I1B7Pv/ORIXJDN
 54m+aCjGqxU2zMVS0FcY4RK9ldRWNut5Bddt8bCGvnEZcYVvuEzD115e3BEGi8q4FzzkmE4F7LH
 ep7gwnU5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_010808_920864_7AD37CFE 
X-CRM114-Status: GOOD (  14.98  )
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

Add smp_cond_load_relaxed_timewait(), a timed variant of
smp_cond_load_relaxed().

This uses __cmpwait_relaxed() to do the actual waiting, with the
event-stream guaranteeing that we wake up from WFE periodically
and not block forever in case there are no stores to the cacheline.

For cases when the event-stream is unavailable, fallback to
spin-waiting.

Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/arm64/include/asm/barrier.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
index f5801b0ba9e9..9b29abc212db 100644
--- a/arch/arm64/include/asm/barrier.h
+++ b/arch/arm64/include/asm/barrier.h
@@ -219,6 +219,28 @@ do {									\
 	(typeof(*ptr))VAL;						\
 })
 
+extern bool arch_timer_evtstrm_available(void);
+
+#define smp_cond_load_relaxed_timewait(ptr, cond_expr, time_check_expr)	\
+({									\
+	typeof(ptr) __PTR = (ptr);					\
+	__unqual_scalar_typeof(*ptr) VAL;				\
+	bool __wfe = arch_timer_evtstrm_available();			\
+									\
+	for (;;) {							\
+		VAL = READ_ONCE(*__PTR);				\
+		if (cond_expr)						\
+			break;						\
+		if (time_check_expr)					\
+			break;						\
+		if (likely(__wfe))					\
+			__cmpwait_relaxed(__PTR, VAL);			\
+		else							\
+			cpu_relax();					\
+	}								\
+	(typeof(*ptr)) VAL;						\
+})
+
 #include <asm-generic/barrier.h>
 
 #endif	/* __ASSEMBLY__ */
-- 
2.31.1


