Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0875BC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 08:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZjcstD+IMf1qzNJ48GoEX8KRmhOvaBQYt4G4tB3sX4=; b=Ns6LGr+koNfZVQfCrgDkAynHC9
	tLfAjhfsKTIbx1C4LuM6soNyW/FwQvwlS52oqsnusqUTnshqilUPWLNQ3ekQeRezVGdreqgNNPEgf
	9YPfqwM39mhbBZtlKdziSuhLShmhjHHAWgyBozJyI9o+Q/75B4apzGTU+lTcefpxg10wV/mjDTHEd
	zepweFaLzzpqtlqt7zH5PcykMVPvz1pAmX8xcmEaZdqqVSKNoJ+o2Aem1pu3aIHr6tV9vsdSAXCtT
	oCn+c8HmlsQU8bUPUOIc4xOcJ29ShFgM662xILOHsw5yjkYyIdUBQ/o6uQh+G7omRjoubcPJ7o++T
	qRl62l7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKyM-0000000BEeJ-2c1G;
	Mon, 10 Aug 2026 08:03:02 +0000
Received: from mx0a-00823401.pphosted.com ([148.163.148.104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKyI-0000000BEdK-46nB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 08:03:01 +0000
Received: from pps.filterd (m0355086.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5GXMR1073079;
	Mon, 10 Aug 2026 08:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=cZjcstD+IMf1qzNJ48GoEX8KRmhOvaBQYt4G4tB3sX4=; b=D/SvS5YLy6il
	6MFy2W0KsYGur6Td6TZgb79MK7/f5WDjgHFPN6xFkNVve9LSx+5edHth4uOnH3dn
	DnbFZsVoKfDg4fyXDJYQF9f7OR3kOXklsBNgVgojJNA1Pi9F5VxMG8cO859lp/Bf
	TBNMFGFcUXZTq+tPtdVdHDNNTQ2gGuX4Fp6sr1FDEnglBrHdejafua52SYnESGbb
	fRRnaud6iffkdSXIJwvTQtsFzP+0CfsbZiVLFtPKL7LhsfSBO+LJKkCFU4QaB9xv
	EZT9PRqU4VdkGQ+bF6KZcgoLOsagt2ext7w+D8NLTBNexvp4NBwwun9Xdhj3YSKn
	kWwVZAhMTA==
Received: from seypr02cu001.outbound.protection.outlook.com (mail-koreacentralazon11013027.outbound.protection.outlook.com [40.107.44.27])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4fxj7h9gck-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 08:02:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvUk+IZBtvdtzl2FQqd3jpRIksI51eEBMOhVGlYyrAx+6GsdLJoSlNc8aEXjmyieA8xyukVZeW4TQuSyLVqMW9v9JyhSMB5+VY8rSM8zsb+YCVLx0wT5YcolvHG3BUFhsc7ixQmKBHY1PK9+hMCS/O7IpNiHGqb8B8cLdKtkTBfXRgtl7SNIJUIcbtIg66I2U0BSwk80ZO1N4Hz3GuZe+L+NceYMIkLBzor+92v2y/CaFkHepjZg+EAqjawTSSL0/v2GqnU363r0lqKzKEwj9/3XEPJqZqonlB2ATuRiSbPPj7J6EfIWCyaPyzrtYkIg8JuGjt24jSo8m8JKdg7l4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZjcstD+IMf1qzNJ48GoEX8KRmhOvaBQYt4G4tB3sX4=;
 b=kH9H8drbXWaqxCdBmW5UgExnYwb58Dl9o4P805ZT4KJlT9mzJAMjO/hjjLgBVQA+JEiyxsAr12OQeMi6MSxCuOw44Dyg/yTuTbxCo05d8oJUGe7QWJinqXsmnuMi0U7TQzoAZj+GzXntr+0QPWyzpoFf0MEmJHsI1PvdRl+kY+CNjOTcOu6rx7MGVWLDiq3FkAGpn3w8JdaMOLMQGglYFbrc5tN8uZvy3eM5vPTU7BuLevRQL+d2XVWjOFxctzPDPpSNF83pubZL5F4AirrWzvFZjJBgXJI+VtyS+PXlphD6fvkzzJsMAhkj5rJpI/q+slyWj2dlfG640akHJsiqHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from SI2PR03MB6688.apcprd03.prod.outlook.com (2603:1096:4:1eb::14)
 by SEYPR03MB7842.apcprd03.prod.outlook.com (2603:1096:101:178::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 08:02:23 +0000
Received: from SI2PR03MB6688.apcprd03.prod.outlook.com
 ([fe80::7943:fe42:e5e5:f477]) by SI2PR03MB6688.apcprd03.prod.outlook.com
 ([fe80::7943:fe42:e5e5:f477%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 08:02:23 +0000
From: Sean Wang1 <seanwang1@lenovo.com>
To: Beata Michalska <beata.michalska@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Lifeng Zheng <zhenglifeng1@huawei.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Sumit Gupta <sumitg@nvidia.com>, Yunhui Cui
	<cuiyunhui@bytedance.com>,
        Xuewen Yan <xuewen.yan@unisoc.com>
Subject: Re: Re: [PATCH] arm64: topology: fix arch_cpu_idle_enter()
Thread-Topic: Re: [PATCH] arm64: topology: fix arch_cpu_idle_enter()
Thread-Index: AQHdKJ6TNbNs3voJ1kivjesK0Nl8jA==
Date: Mon, 10 Aug 2026 08:02:23 +0000
Message-ID: <SI2PR03MB66884FBA8868A2066B061BE693DE2@SI2PR03MB6688.apcprd03.prod.outlook.com>
References: <20260807135216.9919-1-seanwang1@lenovo.com>
 <anlu_3eDiRLG6liF@arm.com>
In-Reply-To: <anlu_3eDiRLG6liF@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6688:EE_|SEYPR03MB7842:EE_
x-ms-office365-filtering-correlation-id: 85d68e1c-eb74-482d-e767-08def6b5b5be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|10067099003|11063799006|5023799004|4143699003|56012099006|38070700021|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info: AN5gCg5Vy4quR03LCd9Xn0d23vXCTEFPVd413p4uPBYPIIeGvuvY0s1+0CJlME2Gk6U4OzaufQZpJsMl9PCARANeZJcj0H4TlTjx2UdFzF/IFuvjuUkNwCifCzNfJ0bRxJShyyM+CJG+Kst1urKcEdQss95buyWsODNmcjCR7XzaRhOMdsX03PtufFsUQSKfEODUV3tnHOqDaNIif+VBDDANPbHZkwdC+TTqFaUQGCy3mNSXOxCFPcLAP5s8rul+LuCcMGo51PsA4oRS3FvNNKosfD7Dl+2jtY7iZSkhH6O/rIueUIxFDU66OeYja3aEm81ahTVIpLRMsF8PdDi9RJdrHEmnvdTm63ZHx1Lw8wSFsH6pAEO9f3ac7f6A9Q1/lquCtAjATwKZZT+jlvGOl6U3RqJFFObBLP0++opZLxyXPITegGBZkLoZPLGgCw+GWYdyz5NdZnoQ+t0ozl7ESpakW9xl2iziMaF4BZUJa/0WOvMoQxwdN382l81AFBpFGUfTG3PoJApfLTOPE4wWZWdMIHnqSrnkgCNfZyTLxkQWvIDW9IOsaWJXr+WDFvNBvx1kd7wOpLgT405wd32iLDaAbedPy9/jogGK73hMVLZ7UQJwr5rivGJ6sqQrunTuz4DP5lDtZDmxF3qckfwsfSc58kZVO7E+DbWv4mcVV2xh12CBXT5OsZTgF2QMuiGSQztT/r3ip4ruOBX12Yzom8U8c9/V8LiE4CA++YerYGU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6688.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(38070700021)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qxLvjrHrhV39Q6KKIdSDbH/AYHmjx55ENeAO5UAMfMPd6mOLRh4TA3K21bUR?=
 =?us-ascii?Q?lcBfrTcarc7pryHBmFvb5HIN5fHfxhGwFRkc34/4uvXY5tmSnF+Lur5LPrtI?=
 =?us-ascii?Q?oUv0EhI1EsPO6pzQeb7gd82sqQmUNdBsRXWbm8lYpfA6awG/+L9qJh2wVHhb?=
 =?us-ascii?Q?ZwaUOsQMblvKFyhYLHzw19f3+5knRmKNTbK5SVIFzNJvawgZ1xmCkzVe5rvi?=
 =?us-ascii?Q?nmMATTvuscK8j6iEucbLGlLERhNnMN/IyjREr/6J/GZM8/UQXwKhk3nKgLn6?=
 =?us-ascii?Q?yl8gn3yp8fZ7HjFlim5NlYEltlv3a6jt67powEiLe8j4RQCDYIvL5F3UU9ME?=
 =?us-ascii?Q?BRB7SlOhFMWHMZzm1hM5RBdOHKo8V59pPHmh6Qwm/gDbV/xWlz+jvsHcgdMu?=
 =?us-ascii?Q?dbSEWxYbchTr78dTtsYZYT4RH/2r/Fr96dnTgfHvgIxJtl+n3bLxe3qB3UtP?=
 =?us-ascii?Q?mm9Cuc+ud8pcoq5jdKjH/X6L8WCnUBsSLitLUhwDLnbnaM0W7d0UOiM7VO8j?=
 =?us-ascii?Q?JpD4KxKEpIbWSgg6NNGb2qZBnEyyptyGvB3xLzR8KJyWORLG6Zq7vKAiTYRR?=
 =?us-ascii?Q?keV5ga9BC0foxaWHJYky3cCfjVCtpmZfYqLxuYIgbkBMIiTuC6GUZeTx0ivO?=
 =?us-ascii?Q?Z8BgelBeYYgLVuZJk9WsmQsM3WRxwl0bF0LZTy55Ax5cMNjaG6iHlBfaFve8?=
 =?us-ascii?Q?qAraet9DYuwLXy3Rgz8vTT/P09dLPKa8G7uCJmlW08SZZ29F4efMc49h/Vhx?=
 =?us-ascii?Q?qVFPlDd8gbHVban5iTxaRlflpihBH/g33/dGURs4391g53lgHmwWG5DVbgDA?=
 =?us-ascii?Q?EkKud1yCiDtXb2ziCm+Mk+ZzpUKB1vWx55EEInvsC1r+MuH5LbRy+DF0yCXF?=
 =?us-ascii?Q?VJUifTv1WaSA+jykOiU8uUGxikfZ/WiHDsxMB/dS2EoZEDDTiKKMj+zJtLx2?=
 =?us-ascii?Q?xX6f5DLwTDiwexb6mw7yBnPjSTQKMokjNcfamFRLth+KB9H6YXsCqpvjIuNM?=
 =?us-ascii?Q?rS77vrcMS58q0sSnEI6k++zeVgkwILogmZK6MWgC63II6hof+aQZNmwFZqep?=
 =?us-ascii?Q?MC17lYZGnHh5eJ/uItSaA+1gtp3XZntH+9YBExih//8ow5INlPgxPIKos1Uw?=
 =?us-ascii?Q?M/17d8DvsOU19kfnUiVOzSeXD0ZyFT35dce67t4bwvC0Q/ZFIDVLqEuOMGYY?=
 =?us-ascii?Q?fOde6PAHNkewBsPaL7AWyr3n/0mcUztF6ffhl/kI/huE9/3TmGdqYbX/IG2c?=
 =?us-ascii?Q?U0y+WPm/JFxSIDjbs/SetHlpjBvK8zDnR8mAWyxFh/KuHrUXWr/awqaN/zPs?=
 =?us-ascii?Q?VM8z0FISR9SAy1417FsC1vWMt7FEN2GB9AZnAvTyuvQej074+Voe6LqcsZ4u?=
 =?us-ascii?Q?JO9pl6UoamzPwm7Ax0uyz2DTpiSCgnc74vcmbof6gE/T/kW6o6eQMY9UzTpr?=
 =?us-ascii?Q?aAtPyHkqGbFzPq8FobkwBvYCl0siMmDyKzGmS2ThMWEHKJyjQZs66zOYO1jp?=
 =?us-ascii?Q?zKZSOxAJNyPORm56XWb736Bn7mH0TJAZ/GHmkcIIXcCvumvVPG9yLggsxjAz?=
 =?us-ascii?Q?NxDyEh1wckjL3IcJEAwJy0IkYhALlKJu5Zp6yqxv9FQ8iz+IXXySO/ehF7SZ?=
 =?us-ascii?Q?nfOEYaH03iMSNxbFIVjp90vOf1tfTmoJ5KyVyxjtTqX4ovcTE6V/BOxCVMWR?=
 =?us-ascii?Q?9kar9Cn7QBDhN6MQOWFKiJWNgXTv2IzIJzXM8aF8xNtH0V/O?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hjAGEyKJLf4rETvDSLfjsLYMFnjKuSk9/y4DACO+1riLjcDg9O0kMwc+3OvPXumC3H5wnxybABDKxPu5lkjN/LGK8AqeJieONRFhUYJ8YPclFusqkxcP1/KLfTastFvPx8aVZYAuThKR7HcTm3TfhKPGgTqfOHMQtHwCJi3fzgx0w/ifJzAUBRbLMSa919pRE4k4EcOAb8jAlxfCjyOc4XeqVtgtg+LLhaIxAIaaCldGj6qRqLFflKiKssL/PkuNnOU7Z4axEMcVUU/hnRbqNRXDb0APtjlvbjLSpD10lfl7kXG16vrwvUHeCOBvcvLYQevrQlfUBduxY7mWYhAVtQ==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6688.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d68e1c-eb74-482d-e767-08def6b5b5be
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 08:02:23.1377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TYpIGMSIKjcr+Ppug5H2MlIF3hxEUFIspruRDhVW1aQErqBzCy9EL7+9WtUM4oKOMzk+2P0hTgFho7pnFKcYxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7842
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA2OCBTYWx0ZWRfX4pADMFp05+cQ
 Jn032uOyNfcF+hz9i2hxqI/OlTdbH7WZ0Dfn0zBAdPxAzzomMG2WC22x82flcgOJrPJ4px5RQig
 +15aWEIjFkDeNA0usGDDI+lx4sOr5fQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA2OCBTYWx0ZWRfX1MfYyGAVDRXK
 JGyENCF/0kTLJsgEPKkwWw42sKXq/iFCZfQ2O6qtn4qwmvVMs1XoRASSjjWIVMh4WDpI/NlKhRe
 BnlzGoE0vzCNqOAPbDPE5j+OtAhBvBLCb//FCfMklrBDbw5chyP8fUR7lQgvsMv9BJRLFt9Fmkm
 jRebD9ieCkpZrzadAkQAz5fy8LWdy5Hi6+y85tjX1ZYMCJbTIuxUSU4Qttgin0/Zj0G8Jj5SKuK
 ZquCPiedfWV5WoB0UkjVGdD4Azf1bq+TKa1MWr1DvWuJs/Hz2UIGPoOoVXMCRLtng5qR6Sh5u9U
 hXLMUeBKIFsCTik8PDK8yZy715wHUMbOnvZTTXU3ywETwNz0WMoLAzU7Y1Jh21UNgPSd/RvdHiZ
 wvBzRxbam2BnK/V5vMN69CDeBkDWYWVgh1v6KvrXMtILUSbti2fjoYl44zM6EWcixCeGWYhRfN8
 +3yaNDy9u+YtegrVGaQ==
X-Authority-Analysis: v=2.4 cv=cvOrVV4i c=1 sm=1 tr=0 ts=6a798592 cx=c_pps
 a=dsIthHTsXEBkGW0VS6idzA==:117 a=fVfL832+mzDTHoFKNp42fb2xq0E=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22 a=hJVLCblJc-VYA0_z04R5:22
 a=_l52MOeoZC6LHq0WmqMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: 4r8Jb1ft_5WYTq9UDHKkKIN4y2TR-0mf
X-Proofpoint-ORIG-GUID: 4r8Jb1ft_5WYTq9UDHKkKIN4y2TR-0mf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_010259_231391_DCB5E020 
X-CRM114-Status: GOOD (  12.72  )
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

On Mon, Aug 10, 2026 at 02:26PM, Beata Michalska wrote:
>
> That actually changes semantics here. This path is strictly AMU-oriented =
and
> topology_scale_freq_tick is a dispatcher that does not really care about =
the
> actual source of the scale info. So it would be best if this could verify=
 whether
> AMUs are the current source and call a tick only then, bailing out otherw=
ise.

You're right. Using topology_scale_freq_tick() here would incorrectly invok=
e a non-AMU source's callback if one has been registered after AMU was clea=
red.

I'll add a helper topology_scale_freq_source() to check whether AMU is the =
current source.

I will send v2 with this approach.

