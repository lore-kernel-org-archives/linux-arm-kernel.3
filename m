Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2191D262AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 22:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUmID5o1/8uK+RIJjbsWNgpb07SZyI74ifIYWrC9Crw=; b=2djQwELkWTm/zK+ZRo+kscbcb8
	4gaeDlWTANLjpiRBj5GAyUtkNQBc6VUvdiNo/1J7bsZAUAlJsZEnnsEzGdeNhsEnM0B8cmfZh/PGb
	86EP9e78SuI0ewxDkETLh8nsMkyT/uwiHTHeOK9X4GImap7kvfS23uZArMn+OGjzGEXhEGeeI9LDR
	z4D9LVQBwCi/fRo2yM84OuQFDhLgXRF7YnoXRt8pyatRfVD3p9tYUCbiJt3c+OU/rNv+n3jefB6v5
	00qb45WMOSr1iIJM+I+zbdS2hEr2C8fnk0XsZfQiFC12d1QVapap8m2U+nQvKLtBxMFUieNkdzGYZ
	jw6tQCuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKhC-00000004bME-0JzQ;
	Tue, 20 Jan 2026 22:59:34 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKh9-00000004bLr-3jEE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 22:59:33 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KIMF3R3031717;
	Tue, 20 Jan 2026 22:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wUmID5o1/8uK+RIJjbsWNgpb07SZyI74ifIYWrC9Crw=; b=
	ICNZ6ADPvVga9Tu9MnbSSsUAEXWYtXwWv3b3gnnZ848rJL8/ERUP4Yo671VYqBkY
	CkiyrI/GX6IX0vHxPwnR7cl3IOzghQ+caCLaVcI8JQf2ccFiTLu+jI8xKRcrXTCQ
	16eMi6DHDli9MfyVQDHF3ezrF6QSVE/ve3xcRYlJYnIFy+hFMJTPjRE4VZA5rJ7U
	5i44DF8mvzbJ/8XxMOzBwL9+bM6g1Js/FCAwQSnhmkfDYKKwNdcKel0MfpJTGxYO
	aeHypOR+r0zH+sFUY7se/OK0CzOwD09BDhh4tXj0qN8arETw64GPsXX4AJbWr7XI
	qBgQDl2LUNZF40WMGAIx5A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br2ypvk1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jan 2026 22:59:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60KLv25S038783;
	Tue, 20 Jan 2026 22:59:13 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013042.outbound.protection.outlook.com [40.93.196.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vac2eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jan 2026 22:59:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCmNafqoN5GB3RZ+5kZVHcqLe5PBnZjuDh34j7upciGv6qIW7Ao/iwgRDv6Efr/L1fZlPR4Xf97SJrxxIqMozPR/LdXm0sGereDsVVCbbXZEc9FVYCGCANipl3Z6ap8cgMXdHBayU20+tmioswdCruhPSKneMd09wSbbMy0CsHkoxlsm/Cvy0zbLsRssBaghbyK2iAlez+9EYPQ/4IobskuIlVAoxluEUnoPeqV8XZrxlO23GINHAsUA3WKI81P4LsyqZ6D+W7Dav9leRFVJMarJq4WdYj+lxkofpcx9igCKq5RhXEL6500NpDdgrjTZ5E87Vhy/vY5vieHKFUqfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUmID5o1/8uK+RIJjbsWNgpb07SZyI74ifIYWrC9Crw=;
 b=Pkyo1YVkpjmCBObdJ2232yGC2OI5HIcfgq88+2W8yIh6XfWM7I+PJfeG6sADLZgWs/Hi3a/bAptCHlP0SUyJiwlYoJZAk0kzMtlzF094dlmW8I6qKi2N71mObA343cr6yZB4fZ/AP3zea1G/ZP1c/2Cd7oyv3ufJEyqTsqXPOLL42iGoBpx3cJmXFnZNptNzPG2lO8U4wjsZTic+vmCMChzT4niAovNAijUyGauLsTDJN1X8PuFCJrkzb1Gizqto9zPm9XaxFLyed63GQ42lverqP9A0uSonj5KVHAGnsfiN2al9+1K6+zfjH9llbrWgyZ8WHcEGQMMmPHPhoPxs3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUmID5o1/8uK+RIJjbsWNgpb07SZyI74ifIYWrC9Crw=;
 b=dYUh7ExicmEcwVyjOufaqpjRHcByyWnDQCpgPSiXjw1VLL7dYLj52Nyaqi3puB4KLT8WbdV7RdyLrQIz6DZdrzRKoYxrOZthiKc7cV4qD6CFys1ld3UzyXy6MSch7UEAv5aFjD71V1rUiu+473MkY/Wj9FS5Bdye4HZ4a4uYaBA=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by CO6PR10MB5650.namprd10.prod.outlook.com (2603:10b6:303:14f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 22:59:06 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 22:59:06 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: sudeep.holla@arm.com
Cc: Shubhang@os.amperecomputing.com, arnd@arndb.de,
        bjorn.andersson@oss.qualcomm.com, catalin.marinas@arm.com,
        cl@gentwo.org, ebiggers@kernel.org, geert+renesas@glider.be,
        jeremy.linton@arm.com, krzysztof.kozlowski@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        nfraprado@collabora.com, nm@ti.com, patches@amperecomputing.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, shijie@os.amperecomputing.com,
        will@kernel.org, Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_SCHED_CLUSTER
Date: Tue, 20 Jan 2026 14:59:04 -0800
Message-Id: <20260120225904.2206939-1-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250821-sloppy-urchin-of-fantasy-ecc4ce@sudeepholla>
References: <20250821-sloppy-urchin-of-fantasy-ecc4ce@sudeepholla>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0327.namprd04.prod.outlook.com
 (2603:10b6:303:82::32) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|CO6PR10MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a7752b-1b3a-4367-0707-08de58778355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KtE7U4WmbLOuyqxprPq63SSZgusNs5Qrh7RuUoZ8E6skoJOD+nJF8OSjjOqo?=
 =?us-ascii?Q?kF8DP/YBv3BgShZ1Sv12l1p0cQ/ITUj379CeCtyM3iDS2JdMKfzYTMaxL6mA?=
 =?us-ascii?Q?VZ04+tPYk2UaS+Wva6rlxPx1CtHklr9NY3Q/SR9Tg7Nfsa/vZbS70YDuxjJ7?=
 =?us-ascii?Q?piw69MlaTzjuwPgNKvoNpgCU8sLT6MnrICF7GXJaxeungBNPc+jSJMF7E4h9?=
 =?us-ascii?Q?+Tfy6cJ1V1L11eSY8JWrRZH1Cz5pSc2P8uTFAh2vk7j/MUXPE4A+IpgBxOox?=
 =?us-ascii?Q?L2/yCj6VuD/HAFIw/KXDvkVxLzpN6ZW2n2rMbhVD5TMqttnTVpD3XD8M57kK?=
 =?us-ascii?Q?FIS8NVhYsnG/6S9UFIn9ZNeWB3Pnen7R4d4WMWhcY0WU9e7d8xRLKCrAKYzL?=
 =?us-ascii?Q?So7xlEr3j25+5nIep495xYGDuP4vM3UtSBTOYr0cBbg+++9t0rcJQFKTe09J?=
 =?us-ascii?Q?HII9M+t1XMUihRVTN55cVfvJlHnanwl5/QABOLggxz2k26ewmxtex+npa6/Y?=
 =?us-ascii?Q?cdtnGbuRejjAqygDIS8y3hqhfIJ3H0TeNct9KTma5XA6LOw0Q2VtnTrqR3T5?=
 =?us-ascii?Q?lJMwp97j2bTkqnVjs1xgtpqSOZY8GuDD0HRPNZws8NtMyMc03ZJxNJrIdzJF?=
 =?us-ascii?Q?ifZRwaWGzSs1v7nZ3fyex+2hEwcDAR0cmmfSSqX9S/NjiPeCD7qUO5bVhiEU?=
 =?us-ascii?Q?CyHjQc5EwjUSleEKvhHCu0Bb5E3uhmJ/qmo9YMzEBfmpX+H6W+/oE6YhdvLd?=
 =?us-ascii?Q?K7j+mHM8Eu5rFmBXuIvXRe5MOqJd51UewIGpB7/mzcZOTdpQCJHEvosXEeZt?=
 =?us-ascii?Q?3XZVk4gil3OXOt47g/7FJw7tGKZzoBVZ4R9rmNEs0SShe/g1/xK5Ow2K8l5t?=
 =?us-ascii?Q?JTxNqZcjKAGtz4XKerqi1IRBGuZ77md7s5wc7quSRz4MiAUuNztOXcyDWfnH?=
 =?us-ascii?Q?Uv6dhmiq0YT121M89bHZNnLcOhocWwTD61zBjuPt3cqT++f63V3TLpmLy+Us?=
 =?us-ascii?Q?xTTk+F6Ll50Xv0sTNf2zlM79qOPXMRFdj+pcCv7R1tiXaUM2TLXx1n+lTYcw?=
 =?us-ascii?Q?+euIWABKV8F+Zvi9NGQrOh73xq7BrR9P6FxI1ib+4gbx2FfpbpCU1CAw0iKr?=
 =?us-ascii?Q?gI5hddG9zhBwy7E8+Akx5vcTRP3QG1C85O0Kgpn3c7uOwIGAjIQorOhXD1I4?=
 =?us-ascii?Q?pRIp+4T0XKB3oo8bvKyevJAV/ZQ5+KI9339nKrpdj0MxJ+uZG5BdGOFMVIxv?=
 =?us-ascii?Q?4jbkHvtqRsE4UPoNoaQZ+Dhf9eOLhqkTvOazZQ13YXRvgzDe6Nu1220NrnAO?=
 =?us-ascii?Q?+vBQP9ohWB5eQziZuek+1s6XSrez7/qT/awoqfavb4tsr0xu8KrpFvBsWmmI?=
 =?us-ascii?Q?fNCjZo8uBwt5LUErdq6Un3q3dpXMvfaf0AS3Ve4yu3fsDPFNRLNOyaSy/Ev8?=
 =?us-ascii?Q?XoKBwXrCEuWqJ3unFYGKvUiSKUx/i22Jvfdt7EJywaS/PqaHnm8Qp34wY/R9?=
 =?us-ascii?Q?MopiyWtphMJFlfl1Id+el/oDREQcinsLOmbCLmFT4uZFXNCkZ1Nwbp8Jb4V7?=
 =?us-ascii?Q?Uy2pkVDcENTF6zTMO0g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hzBaX4Kqpbiomwyv6OE62vDKf2V+bXfmXNtdaKa0s5ipCJTeFjlEzo4/zhef?=
 =?us-ascii?Q?l0b0r5bOO7VNitjN/pRvH98GRZnXpUSNrmBfFSxq95YTE04nz636Wu2X0V3X?=
 =?us-ascii?Q?OsHopHMu3BERK+lvf9TSafKOAxGHfrc+aWeXzhqdEZQSLGjWSIJjz2gzHf2r?=
 =?us-ascii?Q?B/eQSosBeNvP4KchFlTJRFU3uGYvjkkKcww4T/wp9LkrpOpCFBQONxAe2NSZ?=
 =?us-ascii?Q?7dHz5nfa46nJdI11ZdrR5lI3P8lbAJXAvc9V2joRHcl5BdWHyqqZhB2GkeDi?=
 =?us-ascii?Q?CfqFeEetJgpuvDsYpAUPb9jwvXzncEuobC6QOMXp0mQARpmeTJanSokEr2nl?=
 =?us-ascii?Q?22qJgWNeCxtn/F6sYIjmBgcuWVm5uBMVOxNP5U0kk/R98vGdViQ6eDJOWru8?=
 =?us-ascii?Q?z24Ds/KXmPQFNEp/2sHAAqFz6WF9/dwVDIckkvrIjULxN6OSmC1kQvDdIFyw?=
 =?us-ascii?Q?VUjdaIHbR2RmXF5LSNa2R6SU2f8mWQTWYcZxAbv0WCkwE5iiB6uPAT8oYU5L?=
 =?us-ascii?Q?HREWtPSv/ydETC+ZLtcVOOFlx/pJnc/NCkQKbP2ybZfN6EbxL/igaCWbRPcS?=
 =?us-ascii?Q?SSsBAVhhEH8qzxVBGR2dzvKSN+DRR0oGZ5tLATZa/upMuDoRQlRt++jLJmms?=
 =?us-ascii?Q?Xzo1Gdh46gGichUYOwTrx2/gJ2TtZGlRSmNJG3IMbRYRFNp3aoff/LuLroaF?=
 =?us-ascii?Q?EfS69oG2YDP6LWC5DOZlr5eG9/OnGotG0D62alIgjmoarxCJnQxXUhaVUrjL?=
 =?us-ascii?Q?r3OHfjNz/ZlntsZ054om2Wg/KaKXaUfqdNVmNZozdFW1PSDcZ2B86RxyXkWq?=
 =?us-ascii?Q?wUq37S5Z6BIcKnY5yF9g40oLC3plkLU3IF+BY8A/wtjDnzGztBKomSXxeXnJ?=
 =?us-ascii?Q?jhj3VWH0mq0VCL2hF6rXAEHWijqErB6euM31pp1dodturraWhQd66j88aazD?=
 =?us-ascii?Q?oJ5eCS06RO+8p7hjY9bfT0/XZeEHJGhtaKS/FgfSil4C0N75QnpAxpIMUNdA?=
 =?us-ascii?Q?bXm99A/l0mPqaQ4l0sm6fD0FFhPBEggIQWycSv0vmpsBJdKe4hZE/Mt2mfwB?=
 =?us-ascii?Q?PCZc+svbcmaY9KYpJhd2JKQV3aS8p2Mnc8joAka2PUrtG3wx9lzKJPjZTe4y?=
 =?us-ascii?Q?aps6nF8xdGAkr3eNSpoOFGagPyUfJo59BIIBzS0FsmkqAFexo7u/z2rC/Zri?=
 =?us-ascii?Q?zq9D5ZomzSDPc02PSVyFWoKZy0Q565oxi4uMoVUyvHWhMUQBvY8IjH3xBzaM?=
 =?us-ascii?Q?hempwaPeQ5RsXjiQR4/rIafsYpc3z0l5tVjlyD/ckNK5M+EXqlxwxV0ZwvhT?=
 =?us-ascii?Q?BFD/xSCi0aeevhxn0SRBZYSv3PvuPmxx5Ew8fZqHdfPWLnKQwcWB1P/hyba7?=
 =?us-ascii?Q?ZqutRMALkcj4U7i8bnmvnlYJL3HmMQIUovkfvaLhT9C6S6vQinqWIFMtoZG+?=
 =?us-ascii?Q?dKJF2J4xwOw/eWD1qAD7wCRdgEjsHggkRIv8LOmKw4KpsyYPg4lYnhge3x8a?=
 =?us-ascii?Q?gV3DcOBncvLwKhPReAjAOzgzW2L8IJJCvDrHCxuhuTod/V626cTl2YK8z3Ks?=
 =?us-ascii?Q?eNk7zQvouWepVaPOQHMYO81zrgd7d8qdOrS93fmKTiq9XfCJBxIkKlDOkh6K?=
 =?us-ascii?Q?KfnZZY6OMYQcHIHzFTSy0VGb5MCshCYLD70vQ3BofIHJXKKUG/jrqW8ucOhb?=
 =?us-ascii?Q?Sz62gYHyFwEC6FO/xzN/StCXjgXhZ2JAr27qz1oun4VKvT9Dn+G8TgGuy3sy?=
 =?us-ascii?Q?/mzL1RqLSeOhpUov945/EXPY6Q/bKec=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /4fE8tqo8NBpBWNv35dmA5b4Db1zYOgFeP9xkb94tFNW0qG+qGEEaql+3f5UIyhn/vnUZB/na2PSdxQT91Ft/yvcSBTqMUzMhwd5bKxz1KJ0Gt0isoSgVd/BNL3rgXCips/sVB0M8FDZmiFUPf77txcHvXL57/3Gr1AMSO7b+RV5U3TdWCEYmNDnCKjcKIo+hhyvr8c1ZMqV9XPT+nIEiCngUWsIq4zJJrJ4mGDV1P7PKd9QJ4nqBxX33y++eoEIhRxTXdL0cuP6TBzbrALxBdr+QyPGu4oiN7S5yObRdhU/d6wJkb7GjG07ZmWT2j3OC6QIATyKZSnoS4wqZ3MRHahGlAJLLFPdHW2JYagTVzunNlF4tNC6AZ62iCiqpOTgFO3AXjlQgUWZqRM5WBivImODvUYJX+rgGAQ1hcOUXiYt90JoTuHMkhQODIXRRysENODD3J0nRDsIsfKBynMds6HFqTh9Xbu97PqFSRz4F35qqlmMJg1gq5HxDwBBpRUD7eAfYPVcjgjJS9M9E1xakUr3ZCQaew0GKNon4QGkgRyWVHlL+jqBB+3avlj10nhJ15Hy5oLT2FI4vzdpD2aeqDaqk3TvYuwWUCQsrfaYFL8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a7752b-1b3a-4367-0707-08de58778355
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 22:59:06.3148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJdbkTBDsmcJGPENH0pKyb8BIA0aO91DLZgBZwFpnwwe2hZAqTVAXIcWfLxWS15cZWHZVmuC9eWNDbf5WBxA4AvpwfDtIATca1irBTzJZOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5650
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601200191
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE5MSBTYWx0ZWRfX/V9C0b49JacP
 udVWvGY/ZczhdF9bvLcav6Fl2j/9Hs9KVHD4f0i8Uc46n4bUB61jC7oiqEcED92B5Tivreqi094
 rtwSrYZoyZqYiRswm1e1O9yID7yl48wkZHNIG9I+iP3r4Fl+EF+LC5KMA0DnMZUUrgiU1emDzV5
 d/xeLaRcbQe5pdzEXRfonRvKYUv9231H5wbJkLhkYgDao4v5paJ2QRK0rIY6EGrYV2qkSTK1pwk
 0Zlt1Ev1nL6xamN7+/hFTJ1er43aSm6oeouzfefyDqNS6qPxJqL8xkkst9pI5zb3tI0+7a04qSX
 bvp7zHZOLp+jH5SH14O24cg/q2zDDyWwxIp+5f9NcRVg+2nZASzKHKPotsNcEDXtkwbv0bRfPsx
 tDShUaU/DfrXTnJIsimBzPkdYw5MZmvR88z+uIaNYsQYb0NUOvlTmn6gxMB2L1UKAUz1f6jxLj5
 az/au1WyzmPbJU1IR5A==
X-Authority-Analysis: v=2.4 cv=de6NHHXe c=1 sm=1 tr=0 ts=697008c1 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7CQSdrXTAAAA:8
 a=DJcKb9eyg7JZAck8et4A:9 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Qlwje0H7lzExWA49CPUiy4yHvVFTOAsa
X-Proofpoint-GUID: Qlwje0H7lzExWA49CPUiy4yHvVFTOAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_145931_940963_1A1F601C 
X-CRM114-Status: GOOD (  36.12  )
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

Suddep Holla <sudeep.holla@arm.com> writes:

> On Wed, Aug 20, 2025 at 04:44:29PM -0700, Christoph Lameter (Ampere) wrote:
> > On Mon, 18 Aug 2025, Sudeep Holla wrote:
> >
> > > > But returning to the original point, its not clear to me that the HW
> > > > 'cluster' information is really causing the performance boost vs, just
> > > > having a medium size scheduling domain (aka just picking an arbitrary size
> > > > 4-16 cores) under MC, or simply 'slicing' a L3 in the PPTT such that the M
> C
> > > > domains are smaller, yields the same effect. I've seen a number of cases
> > > > where 'lying' about the topology yields a better result in a benchmark. Th
> is
> > > > is largely what is happening with these Firmware toggles that move/remove
> > > > the NUMA domains too. Being able to manually reconfigure some of these
> > > > scheduling levels at runtime might be useful...
> > > >
> > >
> > > I share your concern and hence completely again representation of any fake
> > > data in the ACPI topology just to get improved performance. Yes we have seen
> > > that in the past.
> >
> > Depends on what you call fake. There are microarchitectural issues
> > regarding the proximity of the processors that the customer may not know
> > about and therefore the data provides by the vendor may be considered
> > "fake". Certainly that is not the case for our processors.
> 
> Fair enough. We have seen systems with fake data as those data seem to
> accidentally improve performance.
> 
> > This is a common feature and widely available on other platforms.
> > There is no need to do anything but enable the functionality. Having a
> > special version of ACPI for arm64 or a special handling for arm64 does not
> > make sense.
> >
> 
> I am not suggesting to make it any special on Arm64, we would never want
> that unless absolutely needed and this is not one such thing.
> 
> > The ACPI subsystem provides the ability to add blacklists. If a vendor has
> > problems with their firmward providing data that reduces the performance
> > and is unable to fix it othereise then the vendor can use that feature to
> > disable these ACPI features for their platform by submitting a patch.
> >
> 
> I don't have a strong opinion on that approach. IIUC, maintaining list
> needs change in the kernel which Jeremy mentioned is not what distro
> prefer over command line parameter. We can always have a parameter to
> disable the feature and keep the build config enabled as in this patch.
> So only platforms that have performance issue by enabling this will have
> to add the command line parameter(hopefully that works for all)

Resurrecting this old thread.

We enable CONFIG_SCHED_CLUSTER by default on Oracle UEK kernels. And,
this thread didn't really come to a consensus, but I'm trying to figure
out what's the best approach if we want to enable this by default?

Thanks
--
ankur

