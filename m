Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8736C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 20:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Urzdw0yqkCzs1wDL5pmAGbiBV1x7SWWrwo4lrMKHUE=; b=2TBs2sER2I/XoeblsUtdxRO4zV
	D4KrTahgBG9bbkzE6ncpB94/+lot7/sejE8D2tvXYRpE4qAhYi8xIHJbRNh5iEJCZ6tuGmnTscy2+
	w6Q+CaWOPlg//FUwXhe4XCsJluI81/er5qk7ZuLbC03jPRWCyc4e5l+SeOo1yotfZDCHTq7K+hmvS
	VIggKYmbZEEh28uwQWSTTs07VO+9wKgEPTYSJ2SkXG213a6/tOCWsvn022MedsQ218lkaGWswrDiW
	QKCmIrClQnmfMmSSglt5agaje67YEDrwVhsPOX8qz8t0qKGMZqnvxplhqc+Y8p7Yq6d3djwZ6v9kp
	labULa0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18Xp-0000000AS8U-0SYs;
	Mon, 31 Aug 2026 20:23:53 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18Xj-0000000AS1p-0nWI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 20:23:48 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VGBo602165320;
	Mon, 31 Aug 2026 20:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=5Urzdw0yqkCzs1wDL5pmAGbiBV1x7SWWrwo4lrMKHUE=; b=
	rvabvwIR3biTgjH7cZITlXJQzWkXEQ+pY6N8ojld2SIcbsJ8Opn3kcBml2MBj53d
	7gM1UmPGQ4ashTQ34izgLwmJWZSp0xoKEh8tpw1EwiPwpJCk5flacmq5Ry0n96Os
	v+S1QTFURKeg3/hkYimZoeR2yLGV+LHBVofU7PZ4AkdnapWLbbFdPgA+gRNGU3CP
	vOM3/gSdOoOcrnzM5c1VDZNTRnVTnCqLdeJdjMzc0IC44VR9oKMHZ69ATXtN2SIR
	rwzDd+xsIOygHhff1+BFnUfvNypkDcTqGN8vi/GfmlYQy49tuWrWbNn/pkMmOj+q
	KksWi993sVX8wBdq71quGg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbqa7kbkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 20:23:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67VKK56A033202;
	Mon, 31 Aug 2026 20:23:25 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvdc4s7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 31 Aug 2026 20:23:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOoI8PTtgxlQnY72HWqyJeFCKYdx8iK8dbPn9EgjfTIv8Ikb6RUQPOn09pnjT0BsJGOU8v1JmLo00x0m2Cti1PhL1nt4Kp0ywDGDXfKFap4sYCOv0mT9dCPIHs4H/U0JcuyppXNzLOfH1DZE/6ceWWyNraptrY4vLCgCdr15lx0/GvLqm4REpbsTCo7RwvpK69kyrN2MWv7ZmSC14mzO/aG05AjeHIlBnBHbyqKe95anKQzijFMjYgHcZwsQ96LjkANlHg80W00nxEKRZcdajHonrMEqgfTMV2aA3EarGf0ka/2a+XbKIfy8TxPFDkd75Z/TFxvrJcPlHTpTSbSefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Urzdw0yqkCzs1wDL5pmAGbiBV1x7SWWrwo4lrMKHUE=;
 b=rc1Ms98LYvI/ZnasLmqozu/7cCVGUETHMe2rAdbctXop5Vq2K4HVSB/9xUmnmON/qmWejz8ihCQc43rNO/bXpeHt7TTrOk2x5lp3kMEg0tK6fp9x9FnuPcRkbB8JgMcYUcpweADZyIOY0ruLXhlt2s56GTyLfw7UXZdRAfEuZNSZnY9+jb4mCTsUi5+Sby1ry0nozwcsgeNCoy6zliGGQIVW8RCiPBBibq2R5nLtfhtUTXAB0dsCQbrVP5Vss3DxD+ZUbGIf/a1y7QwGzwxibLO18mYt6LeNobjqkyEmQ0Jv5Z/c8YCciT1LETIQihuogE+5uGQzRFOKNacyk2z4zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Urzdw0yqkCzs1wDL5pmAGbiBV1x7SWWrwo4lrMKHUE=;
 b=wg2c6ooh7XEwRFKOR3ph6ImQtqRM9sX5ySpcGUp34rt8C9uAPpAjSw8aj1cfHnwnC2oPo0wONVGoxq/2o6tHS1loNPe4cqq+0UNi3XVx+ksyTMk/ZLZUbemYR2z4P92ZpfGmoYvg+wZnHeK1Tni3sN1pqkScJ+cBZbmDfiYxccE=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by IA1PR10MB964822.namprd10.prod.outlook.com (2603:10b6:208:5ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 31 Aug
 2026 20:23:22 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574%6]) with mapi id 15.21.0382.007; Mon, 31 Aug 2026
 20:23:21 +0000
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
        Ankur Arora <ankur.a.arora@oracle.com>, Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v15 11/16] sched: add need-resched timed wait interface
Date: Mon, 31 Aug 2026 13:22:46 -0700
Message-Id: <20260831202251.305046-12-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20260831202251.305046-1-ankur.a.arora@oracle.com>
References: <20260831202251.305046-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0179.namprd04.prod.outlook.com
 (2603:10b6:303:85::34) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|IA1PR10MB964822:EE_
X-MS-Office365-Filtering-Correlation-Id: d76f881c-9ea1-4936-e8cc-08df079db3bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|56012099006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: l3pFoc0B4H2v001Q8upudyFx+hbVNvh1UWOUZedPFagdURdhbr2/BsUyXswJC8clQ/VSy/CL9I8GEqg8DkDnxHht1uOMKAKhxALD0PV9xRlI+C1XdKKqDl2LscKZx+asmGfGvkdMxVTWM8LYroCGFc5IAOjs55WvsbLxX63W/NLy2HzoqWggPHmu+1t7xU/h4mb0M9+6NNu0++urtSzOZRDozvvNgfKy/PMcjtMe/k8MtmvTNz/QjmhfglFl8lectj86+vBXuR2OzbzynvE4YYrkBq1/K/lF1CAlgP977Ac0p46Viyb5Z7dCvrliHqMuFWE6B8IOJbImXvQxOrgmKTIEQh55mmunCwtX+iDlu22/IHLuLn0R4ePS47udtIBYhhFPiLUGtobgG955dNXkt9dUFAilYCsBDTDu46Jbd9klWAYTuySUioqLsLm2IyFgSEkn92CGqTnCfwFdAnLCg0eBcB0rYtDm1E7a8I0Wbau2iK+8uY66Ze7ln6JFWD1oNTOLV08Z0jpwHpuYul1G2wRSTF+XAz9Ql/9Jj3W2j+JhoHqYwSYDX80YjiroSRGgk/hko4OF6RMbMiodDNl8lwOumi5m9BijO3ix6C+BizzMD3mVoU2MAo46aHYt4cH7WxCKK9C6Z3FSZPYwHrH6re2VwOK/s6vpAKGpePn0ikI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ELBz3n0eCFL2OCJgEFjpe8gzqRSglHQYLEyQoS+S/MtqV/YhZfgIbyYcLLYw?=
 =?us-ascii?Q?5iRvNDnkBV77Cg7nvGJifSt165m+tC7jDtyLdJdRlEKo5o8MfLsglfzSdcz4?=
 =?us-ascii?Q?cIMgRy5P5LZsUyFDYR27LIFPNN6Bbf+AgbfWyBIdc3r7LHpLwuFJYrtkU1Gy?=
 =?us-ascii?Q?J5ThW68W882mL/YZe0Leqz5HHThc0D102uLgYlhpFP9kuE8IGlg2V6aYWrnT?=
 =?us-ascii?Q?gPT87/hKYQA5cFX3/aPLBe4eXGnPHBZpC040lpNQ1/pE5e3283GykcgMNHtF?=
 =?us-ascii?Q?2JYawS8yTDBZ7oGYo93K9Adff6A4xOlNsgzUHn5d5IV2dgm3kZgKZGWVCbXA?=
 =?us-ascii?Q?YQZkMftOUbvC7MAUarlpjjgBT++9u3AvIKCXlCAuRrIGLoDJGKHbWlOE0Pl5?=
 =?us-ascii?Q?t+yu1HdHLQiAm3GSd63+Suq1zYPra92t55Y83Jg83RkFX3fhkEGT6jVow5j/?=
 =?us-ascii?Q?kuZJu6G9R3GJcAAW+BsCfdQ6xux2C75Y7vjFLOcGNJSIbnRlMcBeh10xKiOs?=
 =?us-ascii?Q?FCjtdkgyM/DBckSQ/eTTROHv/qAT9s9zZI3DxL0txH1UkzvDOWbWCUtYtprO?=
 =?us-ascii?Q?nExuOZnD7rSMEgveiOo4zVWB4NNYeo2TGF8BaPIRd8jhZi1bgp6UBA1lWpsv?=
 =?us-ascii?Q?M0Hoe3cYh0vlvTzXX+vDDAgpyjk/asBEJN3+QEeKQetkI7vEw+Od446b1SIf?=
 =?us-ascii?Q?xbrFaDQuVlgJ+/bsSkiuz3SQBvLdagqVYsRDK1W6wWKxYq15LMvFGbBdNaWq?=
 =?us-ascii?Q?g5kTPu/MnXAxxB4qFESRW+t3iRK2psSnxPFJSHMetIfM1FgHHLi6xqgA1Ukt?=
 =?us-ascii?Q?Ml0RuWflpli+3qczE0Jskfj7KgEn8/LyKOnVnPO9G0X4djNU5Lbu0SbZ5h3/?=
 =?us-ascii?Q?0oGfEg+Fz4KROLmtXRlKzxYJE0jtrIhH2sl82Yyl8p0anKVz1BhzAeUfEdJu?=
 =?us-ascii?Q?CaW4uQJQchmut0HI4UWr4jx2Y7D7uPG1IIjlGCxO/GqBZ4qLgLQ7xy1ihN6k?=
 =?us-ascii?Q?vkXJbR0OzF8dr9/fzgFl4wWp1oN2AtkfVsWhiYzOkNxGjzvymy5VC1rt7dBc?=
 =?us-ascii?Q?DvwTLAiXfOUosHAOEax3DiS0ZOeZ6VXxxNwPt/W0dTg/xSMSNvHFT+7cLyJX?=
 =?us-ascii?Q?/8jkSdlJnWVY7tGvAsmv5P7Bhb2VIyz8NhF+u5lQJGLlGP/Secj1nPw3vc1i?=
 =?us-ascii?Q?1WmPuJlmysHYYpMvQ533TiOXMWQhgAVW78U96i7pf//QzxMV0NH1hKYOeGjY?=
 =?us-ascii?Q?k5lpL+/pfaD0gwsqWy6rU0zI6rQXvAD7kBp6ZO0lO54otq9ko3EwQXDKZh2L?=
 =?us-ascii?Q?lsG7B3a+8SGLvunSpTdKvLAANMRFguijwrU7eYRqu6ESj4UL3ScOPKwLIYE0?=
 =?us-ascii?Q?OOxlvhwdWwfOtWpU1Y21hZlhAccpCUA453EhAfga0zixS26ACCOFhQPd29Xe?=
 =?us-ascii?Q?w6a3gzfn54gyU9QxHHMJtISu1eFZpO8q6r2QpUq18dBMTbrGK98yI/DDetgj?=
 =?us-ascii?Q?JMDBO1en6CtDSYZikkOFWVGoz6VC73Kk1SxOPF7AS5pYNzfSzo6q1DzzXhBg?=
 =?us-ascii?Q?V5u5VVO8JPxuHHjnYi41rEjTzKFH2H78ZTFe6VbxDGxGuQEM/UEwqurQmO2c?=
 =?us-ascii?Q?C5EsmFe29wtln7xPA1PKghDMK5uMJG5nr//jx6O68J1bfo15lT/hPAbX8XuO?=
 =?us-ascii?Q?OgYIIjXW/TghpHEQbJdKd9Ps2y69oHNCmEjfJ5gfnHH5lhjKP0DfOGceESbk?=
 =?us-ascii?Q?7TBy6JJMwg8IjX9tSU1VMQW+f2zfLJM=3D?=
X-Exchange-RoutingPolicyChecked: gx/F6J0lmTSPVt2PlU0H7TdndRAeoK5qVm3KDLEgnbtjLEROIozU06Fzn88qSBzRXpCXjNXHMK0Jb3dK+0PmsfcNFmoJwsk8vkc8a2ifniUo86/ciihyFRi/qL/+pp2p1HRzFQB9JIs0FWMzcYXdjuPELl91gFB6FYgpZ2/GPhzAEcOLBqEj2Y0ueTMsvVsSqRFJ0z2oJujs6sfW1NiPgYkqiI7K9bPZJW0oBjxNuDIQK0cKcveeIy2i5jdSMwgeM74rvi1ebhW0AwN6unAaLdxUvsOZ8y42sYoCE7Q7EgEgw0falo4F+cIUWJav29d2ENjprO5M8/zceikJMITeXg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: OxV9FfcfcaxzKO9xUm7crpHRA94nQC7U5LcJywnHy4Hlt0v6AcnWfNVP1J6TgMKo/RVofsshdww8aBl4e3+f/3E0T/BCLn5mqWuRCQ0wlg32Y+NVcf6amxEeViE/vV/rm4YQRRwqV0i0uPWRB5c+SI6iYgs7D+1AklGqkUKauaGwIsMgdONpsIPB+QW9mg6jiFqPDG0vCSmebKCUHC2I/eYtXgMTqkk7EZYwsZmbosKP+RTPyHaTzCWj9zaatA9Yp/U3BexipOSlnYGkID4LHfmadFh1KiU2J0o0aWWThw4kSA5x/BxcOpA6xCA9pOooVINuV4opMgSNvofR4ImLol3lhqE2Ckj81/v77XFba3LG4RJIMK+gwXFnWLmIptY8O/ZhUaouLh9cQdP04h8ccHIkGHnZWTNWtxaY+mcvryqxRz1SuTgMSyfKs5qUdHIsTtl2JOgo85dsD0/LC7YF3/Y1tNp37qRAtpCTN8cBgy3QPMoWQ1F8o19K/Ji7qMMKOR7dfgbAighO/h26It3aXe+cWgkQjylFQFTIjh0gd6fnXRbVsDCp4OWQj7Rg+UNXLot4p/QenzXWVUHJngP6PbKhPR3S2+yhmyS2i3gmIok=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d76f881c-9ea1-4936-e8cc-08df079db3bd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 20:23:21.7669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nupX2+OEWF6PrQdY2BrpNp4AlgZSoHFs80+EWoOiqD0EYuVv2UChKtlEiZtWuPqxDD2dGbOktVZ+B03IMQ0Q4ppQp868Db57cMMonOg2CdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB964822
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608310176
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE3NiBTYWx0ZWRfX4i0B7zbhJA+k
 83wytf7TmIJwar2YjpbVTMz+7a50jcm4cjMzzs9OLgo5rQ12sMQ/6mMNFN+Z0/SC9J0ae9qoqMK
 Sf3DzHBoL3g3Ga8OEoK4zEX6Ml0r6e8N8pUDXguid5fkpm3hJFE1
X-Proofpoint-GUID: lSm9UUT7yFIMLDJPhtcv_018-mLywfkY
X-Authority-Analysis: v=2.4 cv=DPu/JSNb c=1 sm=1 tr=0 ts=6a95e2bd b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=KKAkSRfTAAAA:8
 a=yPCof4ZbAAAA:8 a=DC2jtUcBNbVnd9lHvZoA:9 a=WmVTiCyuxqgg3mnwYu6p:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lSm9UUT7yFIMLDJPhtcv_018-mLywfkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE3NiBTYWx0ZWRfXzaKjrb1/zkOZ
 LEhQIsDJdbKVJwk8oScOuPFOR6pIAYoArLWMFXDvVs8hnCZE3BHw4utdynvo5pK0V78XbEF5lZR
 6U8JmNnoyvFPKzpnAqjDy1vRzh8I+cq0MogJpNqRvRaxBnyupGnRTxj0dzzoNcaNIT61GRM+CFh
 Q2Nc25wl4kCNcRzOjO9MOLMC+83dnVvUdkWTxiAD+YLlJ1SSSPAjsg052qxy4FLDyV+6Nvfv5wN
 59mButah+U0Ydv8aA/8D4L7tZW8o4/A3vQ2Q/0qwxK0Y5Wsv/bhk4MgcpV7pk8aDWEH91gM8BjL
 dOZA5MRy8sk93+nlOXo9fviRNTEIkIjaG2hiJUMDteQarefNSiUrKTq66x1bJ9nmFrlbUzuIVaL
 VNGpA91kX4njPOJ2n9tT9WHHYUn4favicSjzMfTAnTi/wus66UWLdfysXrSaHHwbW8e0ZWgyXM5
 k0RttIixqIQXihM6iOA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_132347_274070_02993D6E 
X-CRM114-Status: GOOD (  15.98  )
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

Add tif_bitset_relaxed_wait() (and tif_need_resched_relaxed_wait()
which wraps it) which takes the thread_info bit and timeout duration
as parameters and waits until the bit is set or for the expiration
of the timeout.

The wait is implemented via smp_cond_load_relaxed_timeout().

smp_cond_load_relaxed_timeout() essentially provides the pattern used
in poll_idle() where we spin in a loop waiting for the flag to change
until a timeout occurs.

tif_need_resched_relaxed_wait() allows us to abstract out the internals
of waiting, scheduler specific details etc.

Placed in linux/sched/idle.h instead of linux/thread_info.h to work
around recursive include hell.

Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 include/linux/sched/idle.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/linux/sched/idle.h b/include/linux/sched/idle.h
index 8465ff1f20d1..ddee9b019895 100644
--- a/include/linux/sched/idle.h
+++ b/include/linux/sched/idle.h
@@ -3,6 +3,7 @@
 #define _LINUX_SCHED_IDLE_H
 
 #include <linux/sched.h>
+#include <linux/sched/clock.h>
 
 enum cpu_idle_type {
 	__CPU_NOT_IDLE = 0,
@@ -113,4 +114,32 @@ static __always_inline void current_clr_polling(void)
 }
 #endif
 
+/*
+ * Caller needs to make sure that the thread context cannot be preempted
+ * or migrated, so current_thread_info() cannot change from under us.
+ *
+ * This also allows us to safely stay in the local_clock domain.
+ */
+static __always_inline bool tif_bitset_relaxed_wait(int tif, u64 timeout_ns)
+{
+	unsigned long flags;
+
+	flags = smp_cond_load_relaxed_timeout(&current_thread_info()->flags,
+					      (VAL & BIT(tif)),
+					      local_clock_noinstr(),
+					      timeout_ns);
+	return flags & BIT(tif);
+}
+
+/**
+ * tif_need_resched_relaxed_wait() - Wait for need-resched being set
+ * with no ordering guarantees until a timeout expires.
+ *
+ * @timeout_ns: timeout value.
+ */
+static __always_inline bool tif_need_resched_relaxed_wait(u64 timeout_ns)
+{
+	return tif_bitset_relaxed_wait(TIF_NEED_RESCHED, timeout_ns);
+}
+
 #endif /* _LINUX_SCHED_IDLE_H */
-- 
2.43.7


