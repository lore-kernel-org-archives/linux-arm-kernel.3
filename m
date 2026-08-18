Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8543EC5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 04:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:In-reply-to:Subject:Cc:To:From:References:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkNW9QolmLTmy2Nk9yQOO5VcD9BUaRy/KiFAyy183rM=; b=R1nQxf1xhjfka6JXAIwXMXR02v
	CZDKUZ2qMvowpoAcdfIKl4412k7RM9yx2WhTkVrP1RQsfaJxiZpDrRWIEeyu7l4WwoTbfL4VUDhGo
	0xrWUUzDjI15bl6CjCwcUl75S5Kkhlctb0p04ujMgDf2tAqcwD9hB2Mnh4byjXQMyIqReqbuefEcs
	SjZe7n7DAh8gZWsJGjDksYDvyyIPt7iv1gT/aA8Za1GCm4+fwheE+LJMDAVFioKpI6T5T4iDVmyWQ
	tK2gQk5OLK2fR/4yhy611JqUOG3be//1yZpHoWzHB0vCIUv6vWhhq1khxqycpKAhBlibfcwB7elcv
	Trv3qZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwBgt-00000007I5t-3HMM;
	Tue, 18 Aug 2026 04:44:47 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwBgr-00000007I54-18eW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 04:44:46 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLMi8O1332746;
	Tue, 18 Aug 2026 04:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=RkNW9QolmLTmy2Nk9y
	QOO5VcD9BUaRy/KiFAyy183rM=; b=bslbzq/q3sN4zhYD4KoCwBjugSY124k7CQ
	FndqyFCRwbuQc7IQbWPnFcFPVKn4EbV6u3OCcUwWOzs3VkkYaJ3YUCgF4cuJxsGu
	pjgxZdNMp3oqwjEMWU1JGqL1XkmnsuWOwgmL1cko9gcXUa+gA8qex/5862VVImhJ
	TTdcho+9P4WqUwJYp2ZFur2CWOkNPjOrNqK/hWuCqbKWuvE3NPQ1Oc+seB99A0+4
	i27DWUMmAbKiggk9gsGASIIjEm1lE1JM7hLyACx03rTf3ArpyW4vpsiHPLxOs1Kh
	DFRyWqwg70fBbZqARnsNMoMzJontrOPoI6CeLqgsnCuiUFlYh9OQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g2gns3f03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2026 04:44:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67I4UgHQ030298;
	Tue, 18 Aug 2026 04:44:10 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013044.outbound.protection.outlook.com [40.107.201.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4g2ejq5b1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Aug 2026 04:44:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iwed+g2J2H53E79PCtUUA0aLLCc6+xug1qOTRReKSR7Z/jyjcci9K0q8nw1/gGKTIkAWaOv1FnPcjvOsmgsUvurezNa+79Q0jeWudAcBDTewMrN1FXhBTPpkOoTtecUsqt1/+9LfkVffaOsG/kUNZc1ruTam69MC9Und2vZXk7Jq8pPmtzAIG3STYQIHd7PgkLGNtJdbPdDGz2WfoVzn7pesfHxI2YJ2GszgJpzhjoHh1NPJPDfhn0sxKOb5k9gjWeM1GCTQz2d/ZCCwB3Scp06mAHv27TEr0Mt6pXxTtm16osfcso+LOJ/3dtAkdtuMsLOW5R0OidHtshJ6FQ7UBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkNW9QolmLTmy2Nk9yQOO5VcD9BUaRy/KiFAyy183rM=;
 b=cSBKkpDKoH/SjfafgwIljNmCBKpl8gCORo14KABOM7CDjPyD8DdujZcMbAmafca+lmZcsHuexKMWoGrxYweon4c7JlNrruGg6BjeKjp6GrwBhMiWSKtoPRDnPcX7Pd0eSIxP5DkSr2i6yHxhy/zjgX3MJjLITcdlaIwBSaz9sBUvKRwKVtSzZOnrtZIrqkhP1PaYESPmJ+b1DZ6d5Zd9oereObgF1DsAu/LsuVUaZrhQ7mxLJsmVGuEoCMJuYStYbgD9TaSsUHceRsBA7CDEe0hEM+qrZDyS7v0qe/+jXgPzjt8rabPh9A+Y8iD4jlsTyKiDfLT2l75q2lour2lgaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkNW9QolmLTmy2Nk9yQOO5VcD9BUaRy/KiFAyy183rM=;
 b=uJFTpWygBdNGdJt8ew7nGaq9UUVwO5o0WzNELzBN/ZhEiwU4gR7RIwYrHZiRpTFNi+Kjxhad8ybXKUsSFcr15kWxdEBv11zJvnPIzimPTXR7itouhTHCwoTIU2PKiY3WIEqbLGQC6QBCM8GpDpCfGuXS88nnpGmHDJriWqRW7VM=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by DM4PR10MB6839.namprd10.prod.outlook.com (2603:10b6:8:105::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 04:44:06 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574%6]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 04:44:06 +0000
References: <20260714073041.40250-1-ankur.a.arora@oracle.com>
 <20260714073041.40250-14-ankur.a.arora@oracle.com>
 <amiUWpsL1QGf929i@willie-the-truck> <87tspi7lzk.fsf@oracle.com>
 <178700204950.2504314.3914062953110867251.b4-reply@b4>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Haris Okanovic <harisokn@amazon.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, Will Deacon <will@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
        peterz@infradead.org, akpm@linux-foundation.org, mark.rutland@arm.com,
        cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, memxor@gmail.com, zhenglifeng1@huawei.com,
        xueshuai@linux.alibaba.com, rdunlap@infradead.org,
        david.laight.linux@gmail.com, broonie@kernel.org,
        joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ashok.bhat@arm.com
Subject: Re: [PATCH v14 13/15] arm64/delay: enable testing
 smp_cond_load_relaxed_timeout()
In-reply-to: <178700204950.2504314.3914062953110867251.b4-reply@b4>
Date: Mon, 17 Aug 2026 21:44:03 -0700
Message-ID: <87y0e4yr58.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:303:b7::31) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|DM4PR10MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c0d480-d745-4050-daea-08defce35584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: JcgS8+XarVZp21zwpplwPE0036hhpD9q0Tdf6XU4BjIO5bvFRJDP/5Vx7NVnHMpWIdXG2Gr68edaoG8yre0S/I/gIv9oTU9eLfgA4RxY/tngWl+cyRegNZhVyN/rc9i2dR2OrXg3Dj4wbe1uajzTCWMCqFmYURAKnDz3eH+S2lw+IPEzArzzPjPJST6M3uxl9f6CSsTYftNYOEqwo/cLu0i+erWrNGELEl8LB8M1f6gWVX4muq6ScZmogJ745ug/f9AhcAEtOf2QbTAJz0M7BafOlEh8UwX/lDbwkHtACsp7t184a3TOsVUHYmG45BDmdXGD2ruFL5A9PkS7jivg6w04aOzl/w6MAsIitDvUxFrvvlCDyNQ/cpwCknd7uHSlLj2fzv71vxzzAIufuNsQSjbD1c8I98ec5F7UM1EELvbKoZ6iqIKTtE4O5Yfe88Abb+hfzM2KFwRV4dBZRvmFACJOQsXAg2f0t56gJZ+gy9OaEcQUj/K5BllxdTiQQsMteYB6lL2FlxVG6kdKIs8dlhnWvbpPdSR3gxDBOMEnpoWHpVa+1xXduimlo/9d3uxK8rhZR0xI84VlhHuOnt73i32m+Xc7qOpaJkuD4bGcoWOteZ8qEV+6gJSoDR10sTRhA3+JjfLYXsYIMDTjS313IW/FYmiZlAN6W+Xm+XJJcNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N+8acVqxJgHFCcZQi/TxKp8B08vCIrzfAHUnRQYWcBwyi3W5RsVkjIMhiko0?=
 =?us-ascii?Q?fFIPPGIleYuU+3sMtFec3Lj4K1ioIFU/6TfiMDRnt8IS9X+MhTDGRhxHtXQ8?=
 =?us-ascii?Q?i1RUl9bcOSduruZRP0Wf6I8aL3E+R5SPZ5PiQJfBQgubsAfn3qo55zJSc45q?=
 =?us-ascii?Q?7Bp4C1tDkYK8WXM5QeGw8ciawd7FjJytvu0/AqfVjqC1sOxcIO4viMtHOk0D?=
 =?us-ascii?Q?X3nZbWWBToDpzB7lklZESbzWLiqfhUe2oBXj3e0u+x6tjAkUhi1MV5TwDS15?=
 =?us-ascii?Q?dkf87dwXXmSuHNKCjRQ6F5m+L3yyCl70BcWjMGbRGv1GpRkshea9HehPXol2?=
 =?us-ascii?Q?QUE5OhK3tRBeEdJWFeUArIAHuLiCMfAVIzlUnfDKJ0BCqNMHQ91rkJUaV+59?=
 =?us-ascii?Q?fsDzFVYz7LOYvKSK2srV21HD5V3gFuENsqzh+1D0lxxQM6K7MIYgezitMn0p?=
 =?us-ascii?Q?8NBa0Pvjwqh3L39nMMH1Vm34nX1Iv/8j81S80oGRcgPGGQU96xeTFTGlkZJv?=
 =?us-ascii?Q?VVWZHOGdYy6Bt29ZuTtcSGKNOpaVutnjxiov0xzAXei6qEuiGPi6Vmz4DtnR?=
 =?us-ascii?Q?iD7KwzOkKTxTqQnuVAzkZlop9v/zsNAWJ7PKmoSXav1FQCbHb63HG+kql6s5?=
 =?us-ascii?Q?wnJDk/OduxMOjsVJW6q32axl0Fog5Z3gHdjLXcjajAvP8ZseaPUuZbxfG8Bn?=
 =?us-ascii?Q?QIZ7OsZ631B/wSalH26uHWTPU6HHbPIp9MwiAwqc2jWKCc2EafglYoadpSeS?=
 =?us-ascii?Q?XbiVTrTbgLZ/Ciu24cokCwqgx0mz6syjcaFnNO6XrrEXIdk1M9mZPGo1D/7+?=
 =?us-ascii?Q?RpE39fOSDIyfiqUulCQWhLxKi3+pe0rvR+hB3FN4hsUOryMKwZK4hJNONe6E?=
 =?us-ascii?Q?Zo4Z4wlAoKDFAy9t+UAy8N2DTmbnDl4G77Hws4peGXqJS0CJeYm6UhRmqDNv?=
 =?us-ascii?Q?03i3iS0cKNKwZBdU+w1CIx8HsrJcUfXugXEGd2AbO9aohcGO5BHNxHY8qWnP?=
 =?us-ascii?Q?Z+K9fvnVLbai8qEw8kkqukfMjAA4Qls6tRYu9qrkJ3Bt44I64nPhYeWyH43z?=
 =?us-ascii?Q?yqz2/DkejhLN+iEhKyhLI8B5+xe9mQoLwBkunURPUTpjsrbJaW9NWCDYQO1O?=
 =?us-ascii?Q?GZ3oLc2kJgShFPRvfmUx0Hi+F93ALab657lNEWZub5K59itAeok8xvW9jWBr?=
 =?us-ascii?Q?SHdnVTPsJLgcK4xL2u+qj4dGeyptSZaWynSR3HMjL+NOVbk7UshRCP8u8kcv?=
 =?us-ascii?Q?ZJYUXWTMnrNfKq6PMVzsKp+eDBI/Zp1VS/SHkv7caNSuT6+CdIxxzZ2vWcR1?=
 =?us-ascii?Q?3g/2qfIsbLUL83eArlYJtvQhUnPB2KBff7mQLBHehVkk49yXi9Co0M4hSy0K?=
 =?us-ascii?Q?FpdEbLITeuFFMClxGuwAR148Kl73DW2nX8N93HNSKunF1czUrvEIFe1SMMy7?=
 =?us-ascii?Q?sJZ/3/ZfOe5maFe9k3kGr+lr+qqUMaM06RZztXwjHPpLQIzco+SHgYiv3LYi?=
 =?us-ascii?Q?uFYNAgaAiMF556Z9FOR5niDK/Z4ZZYqZJ+LnBx8RAWCeZErp6RUjPMrOobWg?=
 =?us-ascii?Q?NqcMO2vV2pdY46HSlRJTSb4g1nouRLseAGGF1AjG/cK4UWrOGSNkoKR41wY3?=
 =?us-ascii?Q?rC3daXH9dMGIrZQbsFlMdvcpp1NHdJ8OC2FFW97AfQQOWqLLWMRHdBoYozIx?=
 =?us-ascii?Q?hvoTieoIIutcCAxRlckyXz4Rf1bHJlo7VYAdbUvjUMer6bG1AfYLPAnyeAla?=
 =?us-ascii?Q?aJhWlZikmEBXojHakjkgp8x+2RzyThI=3D?=
X-Exchange-RoutingPolicyChecked: CHuGgcL1PItVoVPa4/76EPOH1glYLVAP6DoY4PfaWWCCgAcCHteFhOo5Jn2d0QH1wFEHOLDVH+DPR5Dj5gMoNsgMaI/orxUKAcomOTlR6kXErAWxTzD8H+Vof/qLTRO8oGsF4gTRKc8bqk3teG+m+24VuB3ELeJEPwSqiW96rH27FlkZTl+0M/JUrFO49Vp01lqHhNWVv7ZsRMM240zF4KAbVCfTvfoNynHsKHmRp+r+zwg0jpYiX8I+2fJMFJU89sSrXnizBWSwSWHlguLqfoIzumwkUGJgFctU5pUjz/PZZy8zxpylGWsRjTYJ15XXwKaE9D2c4VoPVJjmWtPoaQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: VodMX2bTbNnUW5lqu0i7T3NFp2NhBgb5Jvyr33bT1gl2hbmIsrTLUfm3/P/pOZar8XMR1iSClRuN1n+x+q+4sOhKa7epyRBAZflpNj+oNst1KWi/Xl9nzMjDcYH6kC3oL8/bUbKYLoVYM5+yby2Ih2t4cK3KApulOxtJLdVWS9i2+U+dAATNgIhggoiLqCjWWYJX36JNhMaS9XHfMmSfnpoci9zPGr1JJhgK6r+Ku05K6qb+FPLlW72Ale40lO8xcl0omgsFSKuPYeOioh/DPPZj6OBFMAijSxmnevLVP9UUChQKCeF6GKlkYOLEhvaHJT16x6kHDpimgKfa0Xj3nyPlj2t09pV8PMX2TlsjIkLWD/omd/jDbZ8Au6/jKTJ2M8yBy3h8b1/kUwi8VVArni21VwLXyWm9tScerc5oMW7O9XQt9MeYaJ3cimWqaSd++m1aPuVKxMaYiGdbfwa+Yi9512zLT62K35y9JlaF+nWhRBgvpv3g+LiVrUIY+KOcdR26F6WRPwvjvbVUfTbNP/55L99CGdj2v3irKpgRFUjTvJAu4o2KG+UVFglD9Iut5+uQyYKVGgjdkzh4O6aNTBQJW9kXqe9SFO3yY4KOJ38=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c0d480-d745-4050-daea-08defce35584
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 04:44:05.9759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: taFR6SRgTv3KZc/7PkgwQ6PZd6jCVgaASW36KuPp6Q6DMP9Eb3tgkSoz5F+FUWn/Lks2gWYnna9GkMGeQFE8JKy+xUuHnkylKp6gjGqymzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6839
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=904
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608180031
X-Proofpoint-GUID: a51T9LyGGkPnHto-iOMVOSMvuE0Ei3kD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzMyBTYWx0ZWRfX5WPR+ISCCiP0
 UVSCjVQbne8fFGXhIJlD/57th2ZotRKU/Io7T8Bd8H286TAd0J+P3J7Wfi1zcoValVRVLnjScUb
 fDqpDr7yKvacto3vCrE8gduFRoHgG3odmTtAUNJNqZ2B08nr2CH9
X-Proofpoint-ORIG-GUID: a51T9LyGGkPnHto-iOMVOSMvuE0Ei3kD
X-Authority-Analysis: v=2.4 cv=a8UAM0SF c=1 sm=1 tr=0 ts=6a83e31b b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=vggBfdFIAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=yPCof4ZbAAAA:8 a=NaRaTxz1LYebIvW7r9MA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13509
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzMyBTYWx0ZWRfX3Sv26xvU6YiO
 AKhL0yQZFqGduQ9B9JV08j0zVN4EYjjOkGM3Pi3Hh4MioizFEBaBrHN3CKxZK3729/szakOE3Ij
 3yOCDRXH4MgbLhsYgTsm7myTH28nKIV8NIeSNRA/7xLM4un3mRlxz+/6LYxwhTaSl25tL3Cpntu
 RC6y+EGRulHoL2pnQfZffiWWSV7gtxciSuvFDkcgRJ74irmr2jGxec5jHyj9n2erp0JPRWw+d/y
 0Ih5caflNX1MO5WQhI3RsDgB5xH1e/8SVN0X/07kqu6Cvgh9fKL8JXQl9fYLWfnKxxYzh2BaG4C
 1oG8Ulxwjnpnp5UjmQPuHBbCe7COaEPqbUmz4lwkPObAf0RLJHyN1nPKEIXUVXhZCFMmdp8OrBk
 LC/LIJuZspgSV5Ef5XMcOPY94tpEzXGTUStpWUc9wHQWAmz22CtHKr8hDKQOEM7cqCMHSuWDoyG
 KyApwpvzWCEX5EmeeZF+SHRK5sLwNDjnkXfsByuI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_214445_315772_D6F9374C 
X-CRM114-Status: GOOD (  15.21  )
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


Haris Okanovic <harisokn@amazon.com> writes:

> Hi Ankur,
>
> On 2026-07-28 16:06 -0700, Ankur Arora wrote:
>>
>> Will Deacon <will@kernel.org> writes:
>>
>> > Hello, Ankur,
>> >
>> > On Tue, Jul 14, 2026 at 12:30:39AM -0700, Ankur Arora wrote:
>> >> This enables the barrier tests to be built as a module.
>> >>
>> >> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> >> Cc: Will Deacon <will@kernel.org>
>> >> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
>> >> ---
>> >>  arch/arm64/lib/delay.c               | 2 ++
>> >>  drivers/clocksource/arm_arch_timer.c | 2 ++
>> >>  2 files changed, 4 insertions(+)
>> >
>> > Acked-by: Will Deacon <will@kernel.org>
>>
>> Thanks Will.
>>
>> > I think this is looking good from the arm64 side now (and appears to have
>> > all the relevant Acks). What's the plan to get this series merged?
>>
>> Let me ask Andrew if he can pick this up via nonmm.
>
> Any progress on merging this?

Hey Haris. Andrew asked me to take care of the remaining sashiko
comments.

Some of them need somewhat careful changes. I'll be sending out the
series this week.

--
ankur

