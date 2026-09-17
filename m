Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37E9C982CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 07:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1138K3mbIV0drhW5O78QUbyWnAzVEbciXkIEgMvarNc=; b=apRfc2l1cMTGA4VEV+W8qASrIv
	GBKOJY6yhMBHxfWxyfkizlJE+TaqNNj+MDBzstB4+8EV6hefpdegMZ0jRGwlhPUmop/0o1AARlmg5
	JItthk7y9res06Znos5x1eJwYtfqCTXso3zwqOMiul1mUAcd8YxK3uOoRTig2SSNWrs+L0DlFPGot
	ar7EmnfHdRr2cXzVwiQ/fgSWxHYPI6uiPdcqI/LhuTiTDG6D0FsH5WEyihkXLdz1ePwDgOvY5QVdR
	Uo+hqhivjEVf7QvulbfPr7vE9GAsy6zI5KXMk4L3HSeeRnBy/jJiWXVT7Oc2Zw+T4WG+dCtBSRtA6
	GeKe+fRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76HI-0000000AkJI-3PIq;
	Thu, 17 Sep 2026 07:11:28 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76HD-0000000AkId-3yff
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 07:11:26 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GM3ITl3190779;
	Thu, 17 Sep 2026 07:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1138K3mbIV0drhW5O78QUbyWnAzVEbciXkIEgMvarNc=; b=
	fb1q6MBSCbFv2xDT0PsvpN2hK9v56A+O+/0SGnBuManJ8P3bFX2tLGQWvVBVcHrF
	IVK+kGQRizc6pXpkYOvQ40DaKrPXQt5QrHupXuFgkeWa3IfZY0cAJ4OX1PFfhjPD
	ibfOj/8YE2ZX/8MY51NsY8wxpSPgV7fqD8/uE6cDMCFNb9WWnPE4YHHYe/7lpBgL
	fXTrvlsxFCeHHS/dmpWEyJANG/KB8ZsVg5KMM5dCHNOd9bN9C1y316YBj8ed7kT5
	gB9T69cuWYvIQOXlwGkAq0VHuGqYHWMq0iAcCSOn1cYjAat9LNG8sxR35klUgxbI
	bKLrpt7LXZZ7KrGnn70Eqw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gmxm7f05h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Sep 2026 07:10:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68H79tXK010937;
	Thu, 17 Sep 2026 07:10:49 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013041.outbound.protection.outlook.com [40.107.201.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gmw6cadkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Sep 2026 07:10:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPl6TycrlhOxUWjBZ4+LyB9mm5MsUy1q3/a1hvuNODMsZFspfUjx0UcB5XyeFdHG0f5F2GElYz78sw+2EXE6vheHyfODiZlHkINkuFK71NUP0fCq+RT2gg9NWlakhZxiMMhNZ9O9UR094BPMJeybYHhryk67BXjgQm5p1dIuWQcl/GHLS6gUghLdIqhAHgCBBcHGjDbv6UPAp5ED7mfbubUsW5EBd7S2o/+tHe5tq2/hqymwOm20WgXhgLhTN7iL+nMX32wKpSPkd3NiMO/ikFpjDkZvgc4LDT+QeulYoLVlcZWrT8SVs8osvH4OmbGeGLxTmvXiXoMmKzckNdxUnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1138K3mbIV0drhW5O78QUbyWnAzVEbciXkIEgMvarNc=;
 b=Cj2aAUlD9/otHw1D+b/peCkf4wPkOVDZ1PRb0Qtmh5ujgzDq0Qcvbe+Rvr06UOibjQ6mxH4cCmrwuvbWTJLhrkmmAZkrQTFdVrITWDYSVj2yCLdjftN39DPtxco5CfzlbachRbMJtmOLCFhUEinBobuA//EC1J9pWkrSbzDgmV9qpP5ufdSQdfw+AStGVdz4B8KQ+m7F7t1MPfLBzkkvLUsO9yHpdOYX8pOUFc4y1vv7h/E4Ufd7alDmE6KndrDhGcfZto0M0naUR7WVk1bFjBH6bWmd8GttrPg0+F89KrBddr6r4o/lMIQOkbqViE2VJOPVmwhOc2zhEb/Vhyjr8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1138K3mbIV0drhW5O78QUbyWnAzVEbciXkIEgMvarNc=;
 b=xnuLNLpFA/xL/KTOHeHSPoztmWYVHynnW9V4i5tN60KdX2wZh9SvoeGvQ8wZYj5+unSIwt12inSkvZknw0bYkR5a4M0k+GEyokOriKDy8KZksTQUmruEhkz6/LIx/KSTFroaQGBYtccID1KtNaOmTanD1LhVuFkJBBQyHUiD2lY=
Received: from DS7PR10MB4909.namprd10.prod.outlook.com (2603:10b6:5:3b0::11)
 by MN6PR10MB8118.namprd10.prod.outlook.com (2603:10b6:208:4fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Thu, 17 Sep
 2026 07:10:45 +0000
Received: from DS7PR10MB4909.namprd10.prod.outlook.com
 ([fe80::3f78:c489:86a0:3622]) by DS7PR10MB4909.namprd10.prod.outlook.com
 ([fe80::3f78:c489:86a0:3622%6]) with mapi id 15.21.0451.004; Thu, 17 Sep 2026
 07:10:45 +0000
Message-ID: <33592fca-88a8-44aa-8d94-40e1e604554e@oracle.com>
Date: Thu, 17 Sep 2026 08:10:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 1/1] bpf: btf: add btf=off boot parameter to
 disable and free vmlinux BTF
To: "Wang, Jay" <wanjay@amazon.com>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
        "daniel@iogearbox.net" <daniel@iogearbox.net>,
        "andrii@kernel.org" <andrii@kernel.org>
Cc: "yonghong.song@linux.dev" <yonghong.song@linux.dev>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>,
        "Doebel, Bjoern" <doebel@amazon.de>,
        "jay.wang.upstream@gmail.com" <jay.wang.upstream@gmail.com>
References: <20260917000201.25581-1-wanjay@amazon.com>
 <20260917000201.25581-2-wanjay@amazon.com>
 <DLH7UY9PDSQP.2AXEGNH838JS0@gmail.com>
 <C1DF89F9-B9F4-4FBC-9B94-E250AAAFEDA2@amazon.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <C1DF89F9-B9F4-4FBC-9B94-E250AAAFEDA2@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0246.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::15) To DS7PR10MB4909.namprd10.prod.outlook.com
 (2603:10b6:5:3b0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4909:EE_|MN6PR10MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: bb7fbfec-ef9f-4b8e-eff4-08df148aca85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|3023799007|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: G3X9BYvDr+sUjXYRsIA7Rp0kHVJr90RrPbR9yXNWiWYs0/fSffe2DhqBrW0AtGMIXv9Uzatf3eeybL9jZD4XSJQ0bFNKIfnuAp/3ryQ0kvOcF+MqOeKAjcTslH638aoSP1AD23yfjNeRPydjc8aElY7BnfJ7suEnlTwZQp7+VQeoWOtcBFZMCsk1L7899oN2EZ8jgDlz8nNyxjh4k3wrcLPRfO4Y+KZEbgsCoIWdVun8CjReH1Szw2FdSXuBSknZ5rrcjlOGdG+1EjZWvK+45NtpiAPdA81fJmO9lNfFQhRfSPHLkxn5y15ccJTvqIMnDC/h1wpzAn3zhM+a2hFTxolNeI7aySXkF/Q6FajQUACA1orYg8Oo8lpqdKBiyEv/QqRduTig0Tjl/LwYKDx3FOgd/tDFjb62NuLm8WRglHgbMQdLW59EPkMR/uFZMH2R774c6GP9IuXrBmpzc4lsfLkNFsg+bL8pg536FakEL7tCBYaK+POkMudu499jBVT0iZMjE3udUkMW34cJA/MwQb3h7zlSXCmye76aJHBxFHc008Jn7ERKeuiwSsEfFjYoJP8znHsX6xIhO5fZXgZcCSZ1zrKO5vWM4tM3s/XydvilIPSoNUvg7MdVhEZSN3CXMyN6HsAWFnqh3nCI7NmWw+d+oWlsVFBb1YOqfixz+Ss=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4909.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(3023799007)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGdyemJxajE3RDhzQ3lBandYMFBkUllTL2NYeklnNXNzOE1BelV6Z29PVWZy?=
 =?utf-8?B?a0l3TjhvdUdlVVhuK0tkZENYbjR4WkJKY2lsaEJSUGhCc2tiRkNGZXBpZno2?=
 =?utf-8?B?QkgvQ0E3cHBYWmt5NVlSSGF1V3FmRFUzR3R5KzZwaTJXSUlLSVVCdXAraEJW?=
 =?utf-8?B?ckNLTnFjT01sOWZXcE1ETVlKekU0d1hkenY1TGpVU1FxZEZXOS9IQXc4dUxN?=
 =?utf-8?B?Y1phY1BNQlVacnI0Si9HZHB3TmJFazFKYmZhNkgvc3pKVWo0bGphZnVDVUND?=
 =?utf-8?B?OUFBZVYzc3NmdGVDdkFia2p4UGhsMzZDRjVObGFWOHUrWS9rOXNuKzJkN3dh?=
 =?utf-8?B?QWF4YUxYQXlOVHdBTkNpVmdiY25PQjUzZUtOVnloK3g1KzNKS2g2LzBveHNO?=
 =?utf-8?B?NmUxZTEzU3VZaTJSVXRoQkpTd2xZSGUwd3dOS3VIaEt3Z083aDF2UWh6dXRi?=
 =?utf-8?B?WnFkUnVWSjJIVHRJeW82SHZwMlczYlp4VWJoeGJPUGlIc2dESzZCc0VtaWFG?=
 =?utf-8?B?QlE5b3BmSk1XRm9IZ3NtWFJaK3ZaTFJpU1gyNXRvRERNWktmUU5DQmFSV241?=
 =?utf-8?B?OUFEZ0ZDR2wzK1lNQ2YwZTd2MklZUHk1K3JFbWNzeFNFcWtKdXMyOU5qZGxM?=
 =?utf-8?B?N2pHcHlkWDNNQ3gwRmg3WGt3RGdKYlIrbzhQcHhBMk5NZTFUeE85Q0dMZDFx?=
 =?utf-8?B?NEdVVlluY1pZUTZJeDRJWGtpeEtMeWo5bGZpRkhKckFiVldYM21vOFZQNnBQ?=
 =?utf-8?B?WEFMVTV0N0x2eHZwa3hZU3dUNzJXRzFoT0ZuY3RqbEZ6WE96MFk4MndGeUZZ?=
 =?utf-8?B?TVk0UEd5Vlowb1ZCU01IR2VOdUgxeER0U1FIcE9OT3cwOTBDa0NCd1hYK0Jz?=
 =?utf-8?B?RFFCZWhBSHlxZ0hvb1k4NUhYN0J6M0JDTDJLeFdQWFc1dGNrUGw2NHdpaitG?=
 =?utf-8?B?NU1uSTZTMEhtZXZCbVZkR2lobnA3WGVuSk9DMElhYjZhZjFvdDFXUk55Mkla?=
 =?utf-8?B?L0ZjdlptV1V5cEYrK1A2MEUzT0k0YWgyR25La2tWWnVCOW0ySjNCZUpNQzZn?=
 =?utf-8?B?VUZ3YlRjdk8waGVTT0pMaExLVUk2eCtNWHdYWVpYSGZ3b0ZabUpSZGlURTAz?=
 =?utf-8?B?MGdhSUxMUnZDdnY2Vlh6RisvNERVV0FZaEduVnlaek9IWUsyNFdlNXJhNWor?=
 =?utf-8?B?a0c1UDkrK2tybmI1WUt1ZGxOOG9TelhyVnFKcXFFaUVJSmRtdU9mb2dvL01R?=
 =?utf-8?B?bmM1WStoTlRjZzlKRUdUYjFSVWtKYmY4VzZrV09xa0MyM0dDdGFUckdWWXlj?=
 =?utf-8?B?bFN6M3hVSHJybE9Zd08vdzgwbFA1T0hYOGEvY3Y4eG10MDEwMENTUTNIdUdM?=
 =?utf-8?B?VHZCZWlhNmE5ZkZFQmhhN3BIdVAvQUNpSHlHQTA3T25MTXowNFZpNmJjYTMr?=
 =?utf-8?B?U3dCeWZ5MmVmb3k5Vm03cGxhWGlBeUhjRW9QcjNaY01ZT3VZNnlVdHZJWGhx?=
 =?utf-8?B?L2UrWitwY2hmTFZ3dlFPTWRHTzczYXkyeTVqc2prdUFwTXZrZGxmbDhFR1pj?=
 =?utf-8?B?VGhrUlNPenlZTmpJSnV5aDJ3Y3hvQTQvS2gzMFZNV3pVTGNXUUJlU1NodDlr?=
 =?utf-8?B?Q0dvbGxFdHcyMFlPTTVKaEU3VGNqTUhBcWdkUzlJeFUxN01ISzFwS1lMRHJl?=
 =?utf-8?B?RjN4NVBBbklHVTMrNU9jV0ovcE9FQUFndFg0NmdacExiVi8wU3REYXcrVWF6?=
 =?utf-8?B?cnJoWHZoQ2txRWpObUhVVkZXM2ZCZTNJc2JrSlN3ZS83aDM0ZnlKcmY4QmxV?=
 =?utf-8?B?SzhYVStrbE1LY2FWaG01bHdPSFhkZ1hRVnl4ajVsV29FVEJnTlpFbk53Nyt6?=
 =?utf-8?B?d2c5a0dScEVxRlc0ZjV3bVQ0dEV1dFE4b3VETFZmWkFHVktJcTd6SEVDZERJ?=
 =?utf-8?B?eHlCRHpFU0xiQThNWkcyZFNYSE5GWXA3SmZmRC9QVEUwK0tORW9PZm9HZGta?=
 =?utf-8?B?TGQrK0d6ZmVlZzAzejV6emg2dDIveFF0WWNyMWVnTHYwQWYzcVNGVTUyU1c0?=
 =?utf-8?B?VjhWcFpKY3RWSjY4YmwzZ1NxaTB2cUtKWXlOdTlxMnp1R2tIOVJCZHdMTy8z?=
 =?utf-8?B?OVRMYzRpdlc1ejd0eEVXS1I1a2V6eWQvOWNHSEpFNVY4WCt4MVlwNnc3SllJ?=
 =?utf-8?B?cGV4UW55eUpmK3ozRDkvMlJoOHJCTDd2TkVFT1Y5bjR1RitkMlEwYzdiNVVW?=
 =?utf-8?B?SFJjMkNxa3g3cGpxZHVydVdrRjhFNmpYRWZpU2R1SkkrMDJFUE9aN29KZWV3?=
 =?utf-8?B?WVpqNERpV00xQnprdC9ta2RXeG0wVkUwRDFDakRTMVlwNWtLQXBCdz09?=
X-Exchange-RoutingPolicyChecked: cnpUecHftMi8/XAniMv857ZMPQU0Ug6FpP41uKzJMWFFLVb1YRgz7Rom9/Oym9Z066WVEmdA534P5ABW5QGe0W9b05C6jmIk9OawK2l2ehls96Ja5374fBYu0x5Lqz4F1m42gGycO8DiUDP3Dm9aC+UGhHZNRpva/4iZXvmfyyDoYu1xWjFuPqb6ghUEaSgZLjfGkg1C09qCZMKd8QYVTYg+TpnhMRUxRW71qPQTXO8FYWbFCB/ZbyeISk2+TaAVUyAEnS/HKqZ1x7R7Xyqm1JUoGcns+HEzeIQMGs4jjc0LUZwyGg8ypRBfIM9+ZbQ8hUKrQUXy6tDyW+0Aiy//sw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: frTu4kK6N+fqktY/AXk3+2u6RUZiqMwudKgimrBKDvAadVDx1X9O8vsADtQf+eKeY7M3Vjvlqa8c+aGey9ybURvU0RJPfg+CN13UJgoUaDj4worKmzVcbtPXqs0HtDnx+gRf45vL+b+FEY7T1m44sfXpkOUYr+J7MpxtT6A92mcSTfuGG1R7m46r7Kw1otm8nA3OUErBy9QWd+aSeXlvp7EOjmaEwblssFQxBkvQgDoRSZ0PGOL+ra17djB0X23Bw3H//BcZpsddbVfOjU/vKUddWNRY6g04XEUQyqpkPq/q3LuLvIubgRLqPtK871T9MQ9+NrNxuv9GkMBcsWTvgAyOSeQXB3CMowJGuPTjL7M7qQxU6NcJ6bolD//12e9sYkxM/e/zfY5WbsMRB3GGPDCws8mjLn3gxVVXdZQKNPblFK+UUSR/aEGQLO7A/BD0ZmDmlijqH+DiGV5uT9Dc9mHhlTcsSBdv3mUx2SXJt4s6PisDinIdAAilNULKHJ02e229g2KtLMrVdP9yoWiVI12O8hqC6igHkDUadoqp9qhOC/yv4qnl+y0dzxyp/u0XXeegQ6d7rWyOdaWp4E1h5r1YUU14VKsuY5S0+ydUipk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7fbfec-ef9f-4b8e-eff4-08df148aca85
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4909.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 07:10:45.0382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGh5t0eu0xcqYsyrLx8HtwcMV/uGVmpC31YG37Uwh6YlxsAe8bed+ydCtjZyXL6vwXohO/1Dr2ZFTZxZFisUoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8118
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2609170095
X-Proofpoint-GUID: bBg3Il8P5bWUi2QK1VUcb6RUpbzYaBCK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5NSBTYWx0ZWRfX1alPl3n9QTaj
 /bC3wN8HlJSSXPRZFvzwrQLEycN7PCsTUb8l12HDC02qWpwPQxJqU/bxaiaV1duh/iMODK2EW9E
 tlmw1rAjqQoMolcfSM/1Bqya6VzKYfxYMINGKyMtXpJI/pLD2AWsaGFTZLEZ48kHsva4CySpfZz
 3tGkQN9Uzubisuq7OPVKo0fjZlcfWkyQzb1/7bIFg/Qgk/2/0qUxIM7r3+bja+Wk5w44EThjBMq
 ukRnZvCPgRynwaFptNLPKb9q9GSMyCuYcp7K7ON0uNZ3KTGeH41mLZ58/eym0XARPbqB0qsN68Y
 TIDCg6iug3GfocgvZXtv4+kSgrQSse3NEwEsmTTLQb3r3FqaLht+bxPZIZZbyAQXN/t2PWE2qYI
 DK5V68cKG+EU5VfBrYQPjxkFjeWiuZPiJtbJEdkfH/MmAPjzgPCCjgGsaoW3QXk1b4+Sqn0WX9W
 MAvgVUlsnmsPCqJuecQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA5NSBTYWx0ZWRfXxx1AawYjf3b7
 bFK32tokRTeDc8bsNo33C5sqjRe/HO9sOm4K0nr4f0bttNwtVw9siOZfHywHtESo4KHtY1dHh/6
 KN7E/1blJsv5dm7LCE33aFC5VhqF6isp8ODSJv1wDItYQhA1ZcvO
X-Proofpoint-ORIG-GUID: bBg3Il8P5bWUi2QK1VUcb6RUpbzYaBCK
X-Authority-Analysis: v=2.4 cv=A/n5rKWG c=1 sm=1 tr=0 ts=6aab927a b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=vggBfdFIAAAA:8 a=SsSHnGsaPNJL6Sn65hIA:9
 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=WmVTiCyuxqgg3mnwYu6p:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_001124_359272_C8D58A4E 
X-CRM114-Status: GOOD (  20.63  )
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

On 17/09/2026 05:07, Wang, Jay wrote:
>> Consider using Alan's approach and support CONFIG_DEBUG_INFO_BTF=m
> 
> Thanks for the suggestion. We’ll explore how we can make CONFIG_DEBUG_INFO_BTF=m supportable and may post a v2 patch later.
> 
> Best,
> Jay
> 

See some of the machinery in [1] for hints on how to do this. Ideally
we would want the first user of vmlinux to force the module to load,
/sys/kernel/btf/vmlinux to behave similarly as before etc. The approach
there does this for vmlinux.inline so adapting something like that is
likely the way to go.

The challenging part I suspect will be how to preserve your goal - 
avoiding memory allocation - while supporting module BTF. Specifically
for cases where vmlinux BTF has not been used yet and modules load.
Since you'd need to preserve the module BTF for later use on load (due to
the nature of the ELF section it is in), I'm not sure that part would be feasible,
unless you wanted to just support BTF for modules loaded after vmlinux BTF 
was.

On-demand vmlinux BTF availability would still be a win.

[1] https://lore.kernel.org/bpf/20260901165757.801449-16-alan.maguire@oracle.com/

> ﻿On 9/16/26, 6:56 PM, "Alexei Starovoitov" <alexei.starovoitov@gmail.com <mailto:alexei.starovoitov@gmail.com>> wrote:
> 
> 
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> 
> 
> 
> On Thu, Sep 17, 2026 at 12:02 AM Jay Wang <wanjay@amazon.com <mailto:wanjay@amazon.com>> wrote:
>>
>> Add a "btf=off" early boot parameter, similar to the existing "selinux=0"
>> parameter, so users who do not want BTF can turn it off at boot; the
>> section is then freed to save memory.
> 
> 
> tbh I'm not excited about btf=off. BTF is not debug info anymore.
> sched_ext, bpf-lsm (systemd uses it), hid-bpf, most of bcc/bpftrace
> quietly stop working, and we'll be the ones triaging "libbpf: failed
> to find valid kernel BTF" reports from people who copy-pasted a
> "save 5MB" tuning guide.
> This needs more thought.
> 
> 
>> .../admin-guide/kernel-parameters.txt | 14 +++
>> arch/arm64/mm/mmu.c | 108 +++++++++++++++++-
>> arch/x86/mm/init_64.c | 30 +++++
>> arch/x86/mm/pat/set_memory.c | 28 ++++-
>> include/linux/btf.h | 9 ++
>> kernel/bpf/btf.c | 51 ++++++++-
>> kernel/bpf/sysfs_btf.c
> | 7 ++
>> kernel/bpf/verifier.c | 2 +-
> 
> 
> This doesn't apply to bpf-next.
> Consider using Alan's approach and support CONFIG_DEBUG_INFO_BTF=m
> 
> 
> pw-bot: cr
> 
> 
> 


