Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BC2C624D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 20:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S20dGHKKS4wRGthBkiO1JlrzyRBsuGiJ35trtoHHkDY=; b=RwapSBAt0vnW136p6mD9KAe3zo
	EjuC/RYbwZ1/zXkmCdp+fMdyyKFJ100ozLtfngxfInU19NsdFwonw+EjqwAZqYgQ2doDSYR/DQmbL
	UmsoDoRMHilyIdo4UVoImXWNFKJy3n5zudkCY9Ai45xTZGq8k9BQ3f0tcH/2U+YBLUOPntSlRuSvY
	5QyQYP0uBYJe2X4tU7CUn9xU86kHC+QqBncDDC0YcWl+wFiCxd2HxZJx3xMb3YCE15gSf+UGHvPR1
	WCpL47b7BWfjO1+I+wZSF6KzQL1Y/9e0XqOartd2ilW+3tYzBwkL4R0xBx/T0Bv0PzDaubAJSxPod
	m1hFDU5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18Xo-0000000AS70-1vK8;
	Mon, 31 Aug 2026 20:23:52 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18Xf-0000000ARzF-1DE1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 20:23:44 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VGBsIX1775888;
	Mon, 31 Aug 2026 20:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=S20dGHKKS4wRGthBkiO1JlrzyRBsuGiJ35trtoHHkDY=; b=
	mhFdWEE3n+vMVEi3GLEK6Bk0PAjfBJUKoP74MAcLX3U4+el9AEO+3so+JFGlGnCC
	zbpLMRRjshIedFSKPe/r5hBje9vDGLvNC0t0FO/xJQOdedsw4whzlFIiwDQer+z9
	5BSk8GvRPYZusbyP3gpii1UVRPAsTHDPe64IdWGZ6xxTqN1hT4raOKN1YGiiALFE
	RLS5McBguEeJ9MWcgWKRDn0kwRI+d6wFzTQkrk8Kgo7dAx7EYlErMH7PfjZllTyk
	dKrMSnQc+RlpV2sC+O/oHlQOJ5NW7mEuoxmKr1r6uXOBTLrHHQ3Nb/qXlhQxA/ko
	1+NSC+3XytG4d622m5xHBA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbp72bbj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 20:23:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67VKFg78032987;
	Mon, 31 Aug 2026 20:23:20 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011051.outbound.protection.outlook.com [40.93.194.51])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvpqtth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 31 Aug 2026 20:23:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8tVffNgKANasgEoapzGt9R3EWEZ4xjqjJUwQcAzM8QwACfba2ew7Ko7tl0SnSutsi0p2EinAL/HCTfnK71GNQOxX6tQ2gYIn7iITx9kbWhcC6sW09ziOvnBPzYUJ4Jge85U6b+G1g+TkC0+3sJZdlLKOEhI/yjneXz9QUbVIb/VtgWnm0466wSbmJ4yW51/3t7lbqHnQ3QT8THz4GKKb2We3sl43ga3kbBSC9nt5SfmHYEH8D6spSIbCgLq7xASxrquSCPVR2XpPgQsMb7We9RaPTLrFdBuIB/TqRk9Tx2NSteGCrwIXv8EhYAUkS4gtn0fKBYMgoslIUIKJgzJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S20dGHKKS4wRGthBkiO1JlrzyRBsuGiJ35trtoHHkDY=;
 b=iFCkugXa6YA4fQsCprolfeTFpM38bAPGAHzzs3uVoJkR1NdHuX+PvjYF1nCK2XHAQ+k4dOTaWJx8nnVZApovWyzevj72rhhgFL2G6olbbjhuwiaYu7G3BY4xK2t4MgObjmNL5EYLlFgdwz9kgjtXcvqRgRV75YtuYB1xqkyhc1QbPn0e7VKiZq1296XoylLi7W08hZ/niihufqUndcPNWoT4+80b8zJTOtot88HkWfnm/qGpie1J0gjLGMNEue6dgRtbBgo/khS7iK0Fsm17f7V9bHKPtQWXJVPjvPdE27wCrqxYzI4/VOBAIq+CYtrVQOWFLj5hLFXT79hbHFosSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S20dGHKKS4wRGthBkiO1JlrzyRBsuGiJ35trtoHHkDY=;
 b=hursHWJsWlVNW7DcNxhX+5BGy0mj92d0SJXIQjXwC+QojHPxPkEwIfUwNMQ08dc9bp0yvSQE4TFXJ0Nknu3OBHXTA85jLCZABifaeRfk9u/2M+Sghs9vRi++59bK3poBOcBAJ9ED++wmP2Lnb8akjys7DmT6+5STkHJPCQ3wR64=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by PH7PR10MB6179.namprd10.prod.outlook.com (2603:10b6:510:1f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 31 Aug
 2026 20:23:16 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574%6]) with mapi id 15.21.0382.007; Mon, 31 Aug 2026
 20:23:14 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        bpf@vger.kernel.org
Cc: arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org,
        peterz@infradead.org, akpm@linux-foundation.org, mark.rutland@arm.com,
        harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, memxor@gmail.com, zhenglifeng1@huawei.com,
        xueshuai@linux.alibaba.com, rdunlap@infradead.org,
        david.laight.linux@gmail.com, broonie@kernel.org,
        joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ashok.bhat@arm.com,
        Ankur Arora <ankur.a.arora@oracle.com>,
        Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH v15 08/16] locking/atomic: scripts: build atomic_long_cond_read_*_timeout()
Date: Mon, 31 Aug 2026 13:22:43 -0700
Message-Id: <20260831202251.305046-9-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20260831202251.305046-1-ankur.a.arora@oracle.com>
References: <20260831202251.305046-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0160.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::24) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|PH7PR10MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: 750f7ef7-e699-4832-22a1-08df079daf57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BUmqseN4hGBccqeA8cHXGeJ9FFOVRE+FlxQ/sNCzMbE00i7qhnGSVxTSoidb/Ln1VH3jYOEUeHjwuaXi3EhllIJnilbSs4lWrKnDu/1d/iSPs1tmmTzc6f+sYKR0Zn60xNV7CozJaMOPZf759ty7d46QXmkZSAP2bb35cCm9MJQBbPUfrIkma8gLMsmHfSw4Bxu+nBpXbOFYLXLWq5mgZkTwI9FAMqXvggTpbIEw5VXWGY0YOWwskFytJ0U8ZGShC0tocRtS9IfSOwjekz5gqa/fiR2xB4V9imva+kiMO/t4GEl6lJ7gfHRiaOHDSjAezyRu7Opll4069gN2v5I77vt+iaJ5k2LgpwOTQIBRc8J7T7NNhCIzouTdn+3lwrgBzS8kSj4BJpm5bP9VJ5yAtstiL1r5UCC3wHkA7QaShn+Zhn7ZFZXTDHqXvABPBe0PCxlk1U0SPHgiYoH78KH9uCu6PiBC3xC0P70yNkYCOod9dJ4Vq6B+g+uzhuSccBxmdRi2nJ1HHqJhicCy8DueYqF2uKVK6VJXsVJwAZLbIOw37ldXOU/Zfh0TQELppVZjE8m9yvaB2bMA3kJUp5xKWgvAP2qdlOOyRweT+UKbcU87JvqL1nKaQekqDiC4WO1FKG9K/PenZr+7bqy8hRx/pAmLx9VIaJbdh4gHzvoKwh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EUXJg6NeohRvujTHyCL12yuSjrF549sVSfAgtwncuYOOiZZlhOpJ5N3MTLze?=
 =?us-ascii?Q?607JWw2/zCBQTnZ4hoqMboGGxR5wOO4Ys23d1ujDwr15czE9khugQQY6eWn/?=
 =?us-ascii?Q?+3SmvJ5mffTzjolxW6GqYFOVUHHBlQuZsZNhDC/xf1uw5rPgErXdcpOzY/UT?=
 =?us-ascii?Q?yIZxUOv0+gfttebI+6hZtwpXm3x6bv/I8VExHblQYs95FtoDtvkkmBNZJcS8?=
 =?us-ascii?Q?F6/b49/5cHgF2VfO7iGQ3w0OSDznrumEqT8KEf1kOGeO8kCVzdGZHC5kPfsu?=
 =?us-ascii?Q?kEfowFUdDpG/H32pymZG+X2BZCk3Aebbtr8jnOP6YRgBpzfYVeMac8ctKwGp?=
 =?us-ascii?Q?SiUt0MTAkeyOCcu9KBgxJlvyuEztXjjmUSlXH0TpqJi7OWkBi2zXVejHoJM3?=
 =?us-ascii?Q?4xU/PPwz/Jr/4qnVJZdrExI4bRQ+OZp4zDF9PfoF3YeDbqmSAylojd8S1umx?=
 =?us-ascii?Q?/SRHM+/4hZtq8An1MB9CC+iOP/cZBQTHz9wpxanpenKvm0uZ+M51dUxLO4Bf?=
 =?us-ascii?Q?kIwk3+Rj1maPHv3hGO6goP/75/G/K3fH3FZieAj0cUhDHYL57dbrsC2lOzGu?=
 =?us-ascii?Q?zbnKEVgmQCa3lH4rFFWElM5vwA6FUEbDAAv3z39GM7wZ4hLl1Cbqd31tFFYm?=
 =?us-ascii?Q?1dieE3qCM95xGaaLaAm4/1JZLiQss3yJxni0Rlx5YFgKsNkpeM6GnVigI2wk?=
 =?us-ascii?Q?vVPvas+0AdWE4i+6qZUAsoLIBuwZNUeyx6sV8UiSKhsmlkAEYC04tO9uV8oK?=
 =?us-ascii?Q?0AIwmbNPm9JbjD6AwpYowH++X2SEa586nV6FOeIfbqpXhr5ymmFa7SJmpatQ?=
 =?us-ascii?Q?XWKsTJ9lx+ZUiVqic8X+uRb09FX4ZC5+JKKh9Yz/AcIn1mHKDZEygSCsFBDT?=
 =?us-ascii?Q?HHEvhtaHoMa1g4nOrs1zMGoylVjna/bhidgypXJCxLNNYF7g6E0dokO3Y3On?=
 =?us-ascii?Q?LBdNZ9pUl8yBfkQkQTkW63L0qcyXcjFm/vGvhf+NvozRt5tNJhXXnbzFS7zf?=
 =?us-ascii?Q?i6MLP3vyC+NMd7siblnksrt0ieT+wvH3Xdl2g4Shi+CePrdZES9Mjkvl4iA2?=
 =?us-ascii?Q?GjvezER+yZzjy0tyb7qXH2e2H4/eLTkwsek06Nb5fpej69W9YMAmceUgzalN?=
 =?us-ascii?Q?qn6C2S6Cr4feRJ8qZxzASAqnODjR6YIsrS5iTmVL8rBIKheRMU1SHHxoeh7j?=
 =?us-ascii?Q?7SS/kLz7UuIwREhrQMaOrOkXx9CQwqyPEbxStPNofoxu9zlIa7brpkcK9SEH?=
 =?us-ascii?Q?cAO2GrO1ePdCiBa+bN9m+oiuIFcg1tyV+1BkqfeIQOjDJeq9mtrT7OmaP4rB?=
 =?us-ascii?Q?ildfyyqvwVv1ntWk1wXPSAKouCHoF6dwE2XF1x3TzIy5DFG1Tho3NtpWV+6F?=
 =?us-ascii?Q?KKeU6e+MiMeAkk79lc76iJMTIPA9gcHhVKYXFyVZ6P8BBiqBbvSQ4RDi/hCk?=
 =?us-ascii?Q?JS9P0N+jBq8vGtIcWeQ1egtZEjjKB8NbU/duaq4L9H45X9p2UPgykqpSQbcU?=
 =?us-ascii?Q?b6nmb09fSEkVwBCpNZLCQKXeEt5mlAanG1CcJqSJGEkC0xaoC6r6AhDtVamq?=
 =?us-ascii?Q?eRdIAJUouzvpScv7OwcAv/cJHXr5b/N9QFlPO/pVGCIzBzkLjlvRoOGKeywv?=
 =?us-ascii?Q?CU4lx5gPL3kPLC6f2xpjGeIllM8WI+t0mGGHFuystSMxxPAxE1My51hblB5y?=
 =?us-ascii?Q?/IC9NMwymA2rxDOM83qyr3QfyOG771oofO1l/ApWvXSZy6BTU5sFNGZo9L/W?=
 =?us-ascii?Q?o5F29rqFHz8scR/3bZ8PH/6VMvw5yiQ=3D?=
X-Exchange-RoutingPolicyChecked: r8V+1Ur9QLhH5xJrodUqgz7SeQTP3SBdWPZYS5dVUIfgmCp6Klh/wuuD0mForMMt+dR6b3t3Fwz9Th7UKODu+lWUsM+KJF73tX7nTlLD69v24M7WR7tYs2rfLd/9FeIt6+IiDaU7JCFEdi8wu5KI/fZEYmBHCMwPVQdabUmry/rvKzoqzbe6lMZ3uCBwUlOoCfaUciUkjAIElM/WFplRNzK1wMQTixcGGZRWFSpbz0SyO8gVyOxQe59KufTMaAibNkKLG785yQzdQf7Blv7PQ3EWdXg4RCqLzFg3XZMYv3aCGeGDaTseu2rIfDyXPdKfOgCQBZ2pS1iL+c62woT5Ng==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: M6cfWqYSlTy7V5bmBG+35ObzHjUbN0Cha0BsrodX8JRfHJIsSAS8MpOLsUxf9czcSj3rLkENoJ7hjldz5PXcFDnL2fL019RM/KHuiOgOEaxx29GNLcs9QEUkGJrb4yNSVPwcjzymQyQjRd1T8ESXJECP5gxdqIpeLY+kRx3mIMEZWCyEmWCxSw1t3bjBjYZA5/HJvpzV4IxS85ffxbRWYurE+fyqwDg7LiWlhFQOA6HFByOQXdz7oMxSnihe7/Y06lW4xieuHJFAgM6wjuihA7SLrn2qy7eVn+OIF/WBBrjiaJgC2wY+cjr/IZuCY+XDhRi/2OkhH0y9IcLh+7EXjJ2WvepVcrg4W3iDtXcy6f8WSzTr/IrUY+AWVus5nNxixYFa5JqinnMd29IE0P5pdwkrUkhbjOdNoDsMki3FPsaF8jBM4t05siAptBw4vnukzme06gHffaRkoCcss4UNzcwDFxltqLeatgFZa6jc1AerSgPp8wWT0zZxfjjOVCnLUd8d2VWUMeVpuNQUd6xZDLbnWBWzv8Mvl5o4BI61OV9q/IihXcV8F8XSCUwI135es8YaSlDIysLID9iYw0/0Js2rLn3Ay5s+wGkPwMiPc9Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750f7ef7-e699-4832-22a1-08df079daf57
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 20:23:14.4352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87F8WtEzyvlHDJDlGer1xGYR7bn1lSgBUrBbtsVzb2Wp4wZkdVtK16Lw7N85u3oEPNDNbDfgtxyg3GcFR7/QmoHJ4XLxUq/F8Dj5EY7wd00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6179
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608310175
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE3NiBTYWx0ZWRfXx27kVLs+hOpw
 /ovWkXlUF8Fz92FXQDfxcZPlbUALoxSe8VEf6/9w5lNlkGa2Nj2FsrxViDbJSF+afCOLGa0XYCG
 Vhl4Cuvo8uaq+JlX5fDC6Dub+srxTva7nn+olhcL2y5omgRdznLu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE3NiBTYWx0ZWRfX6tdFocUIwdb8
 Ny7EsyKEL+Z3ihhUpUliG+0PE209y3btoZw1BaBHQCcUtoyzWLBYuYZy+cVHkG/BVDBxmB+wNr5
 ejOsZW/Cx5EpK+DwgENh3F4zLp3129DBiTGxBu31mSYYDUNTqrSzPUJ+6igxKYuQPOccT4b5MG0
 ErsSteJ9Etjzh7B2B72r2GwaCyYV5EPdO7FO2MEs2O3cMfyBuOZWmlVDNW541xqzAEmXUPr4MdP
 ktMoHdwCWPtkMXjPJc73BMKQO8Vpb0hl7lzdm38df8uoK/kWWvf/WawnI5TziTnEaV5xBYxFOQ3
 hJBQ2pezAD/59Ne35b6wssqpQNb9vArbXylPpzDpp8NV8YG7m6C0rXaECuHmJuSkbFwxWy8DB1T
 X5bBNYMfO8BZPBtw145wCLIDfNXNWMW6/oILrX4nClZEUT2HVFfwnjJ5AlIiJkVBeEOPmi1tvZw
 bTWloREM7m+HcG2QZt/TlE2Ygh3PgXJsan2v+LMM=
X-Authority-Analysis: v=2.4 cv=G7os1dk5 c=1 sm=1 tr=0 ts=6a95e2b9 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8
 a=7CQSdrXTAAAA:8 a=yPCof4ZbAAAA:8 a=LKnZA62imwlViN-40TMA:9
 a=1CNFftbPRP8L7MoqJWF3:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13521
X-Proofpoint-GUID: R4VJBAxKaYccmmAcz4l6QkILg-DiStit
X-Proofpoint-ORIG-GUID: R4VJBAxKaYccmmAcz4l6QkILg-DiStit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_132343_493958_EE5B1337 
X-CRM114-Status: GOOD (  11.16  )
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

Add the atomic long wrappers for the cond-load timeout interfaces.

Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 include/linux/atomic/atomic-long.h | 18 +++++++++++-------
 scripts/atomic/gen-atomic-long.sh  | 16 ++++++++++------
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/include/linux/atomic/atomic-long.h b/include/linux/atomic/atomic-long.h
index 6a4e47d2db35..553b6b0e0258 100644
--- a/include/linux/atomic/atomic-long.h
+++ b/include/linux/atomic/atomic-long.h
@@ -11,14 +11,18 @@
 
 #ifdef CONFIG_64BIT
 typedef atomic64_t atomic_long_t;
-#define ATOMIC_LONG_INIT(i)		ATOMIC64_INIT(i)
-#define atomic_long_cond_read_acquire	atomic64_cond_read_acquire
-#define atomic_long_cond_read_relaxed	atomic64_cond_read_relaxed
+#define ATOMIC_LONG_INIT(i)			ATOMIC64_INIT(i)
+#define atomic_long_cond_read_acquire		atomic64_cond_read_acquire
+#define atomic_long_cond_read_relaxed		atomic64_cond_read_relaxed
+#define atomic_long_cond_read_acquire_timeout	atomic64_cond_read_acquire_timeout
+#define atomic_long_cond_read_relaxed_timeout	atomic64_cond_read_relaxed_timeout
 #else
 typedef atomic_t atomic_long_t;
-#define ATOMIC_LONG_INIT(i)		ATOMIC_INIT(i)
-#define atomic_long_cond_read_acquire	atomic_cond_read_acquire
-#define atomic_long_cond_read_relaxed	atomic_cond_read_relaxed
+#define ATOMIC_LONG_INIT(i)			ATOMIC_INIT(i)
+#define atomic_long_cond_read_acquire		atomic_cond_read_acquire
+#define atomic_long_cond_read_relaxed		atomic_cond_read_relaxed
+#define atomic_long_cond_read_acquire_timeout	atomic_cond_read_acquire_timeout
+#define atomic_long_cond_read_relaxed_timeout	atomic_cond_read_relaxed_timeout
 #endif
 
 /**
@@ -1809,4 +1813,4 @@ raw_atomic_long_dec_if_positive(atomic_long_t *v)
 }
 
 #endif /* _LINUX_ATOMIC_LONG_H */
-// 4b882bf19018602c10816c52f8b4ae280adc887b
+// 79c1f4acb5774376ceed559843d5d9ed1348df99
diff --git a/scripts/atomic/gen-atomic-long.sh b/scripts/atomic/gen-atomic-long.sh
index 9826be3ba986..874643dc74bd 100755
--- a/scripts/atomic/gen-atomic-long.sh
+++ b/scripts/atomic/gen-atomic-long.sh
@@ -79,14 +79,18 @@ cat << EOF
 
 #ifdef CONFIG_64BIT
 typedef atomic64_t atomic_long_t;
-#define ATOMIC_LONG_INIT(i)		ATOMIC64_INIT(i)
-#define atomic_long_cond_read_acquire	atomic64_cond_read_acquire
-#define atomic_long_cond_read_relaxed	atomic64_cond_read_relaxed
+#define ATOMIC_LONG_INIT(i)			ATOMIC64_INIT(i)
+#define atomic_long_cond_read_acquire		atomic64_cond_read_acquire
+#define atomic_long_cond_read_relaxed		atomic64_cond_read_relaxed
+#define atomic_long_cond_read_acquire_timeout	atomic64_cond_read_acquire_timeout
+#define atomic_long_cond_read_relaxed_timeout	atomic64_cond_read_relaxed_timeout
 #else
 typedef atomic_t atomic_long_t;
-#define ATOMIC_LONG_INIT(i)		ATOMIC_INIT(i)
-#define atomic_long_cond_read_acquire	atomic_cond_read_acquire
-#define atomic_long_cond_read_relaxed	atomic_cond_read_relaxed
+#define ATOMIC_LONG_INIT(i)			ATOMIC_INIT(i)
+#define atomic_long_cond_read_acquire		atomic_cond_read_acquire
+#define atomic_long_cond_read_relaxed		atomic_cond_read_relaxed
+#define atomic_long_cond_read_acquire_timeout	atomic_cond_read_acquire_timeout
+#define atomic_long_cond_read_relaxed_timeout	atomic_cond_read_relaxed_timeout
 #endif
 
 EOF
-- 
2.43.7


