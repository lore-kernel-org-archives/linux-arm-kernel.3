Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28385C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 20:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOHkY4RUVsYWmJMhbswUMjtGGP98J7jseP2pspI8CFo=; b=tR/QFvFVq5Xa6VpdqQYDLQz4EK
	wP+oDoWrvOqKtnHTV5osH6lWCSnxeGpy+BmOj84KhBhQX+8EkK0xD09P2F7SvYvKPj/BDmXpuvSCl
	j7QTHimMvxfpKYC1gLeBBAlMZeNDGlXINfM3O7+ILrJqAPdno8WapJaesMChXSwyQjEvJDHZOLtmv
	+84ebnQ2RX7cUw2zMeUGVK052DS1mapvbUweYYOuY3Lroh31ntbkWia0jG6wd2vYhJnIpsm0azO1J
	YZ1KpYygNEPFCzEquzhI2FbEM2HFYQwdOgYbedREgkTzXIELS+cZPBN2ocwkY+AutxkZpSo1d8RoZ
	uHVjN8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2yHD-0000000Bl9c-3DoS;
	Thu, 10 Apr 2025 20:13:31 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2yDQ-0000000BkfH-0jFw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 20:09:37 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AJlqfP019707;
	Thu, 10 Apr 2025 20:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=LOHkY4RUVsYWmJMhbswUMjtGGP98J7jseP2pspI8CFo=; b=
	DX2ekmdd9cf2dFk4lnnMIOacBFRZsgFjxr+k1sfocP8/1B7pr4CEPdH1WnbE2hYT
	xCpNpmPgmoyrTIBXPyFs9zqHvDkqlTDpI8VkR5foZh9qOXhdB55UiIEm0VgYTnaV
	O0hvskE3Imfi6Or0gwFW+PPzv6c8OS9occRuLhEgdm2g2XOYCuLByXi4zIai/XtE
	pPKZ+ufCTtxCWWI9+SCYVpyZB/r+fuvPMhXuJQjnMW+DBE6GFAtxYG5gu5y20hyO
	MmZr6Cqr/FvKmmPKXgwmUXSvWVLPCovZDBzohKfHjwlP3v5MyDjdrf8ipVPxkx/3
	nfz09KqSKQwwccYA474Skw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45xmf3r1t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 20:09:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53AIpAir023922;
	Thu, 10 Apr 2025 20:09:23 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazlp17010004.outbound.protection.outlook.com [40.93.11.4])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyk3ey0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 20:09:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWJ7aDonO2hX+mNF2L+uAq834a2f1GKhc1R9lAd5wrYcHcfwSRmBLBbGpHiM/UPri577/TMHp4/75+DqLXCfxiH+PhLfehL1gPfrNbVAEjN3SeXtJZmmfSsOIQ3L3cu1N1nRavp2L8mXjVaKKx7R+KqHneybJcyenSxXdmtCaI0La8S3PHd9xrn6hZYTqMvk0rtpo2fHSFCgpDsBN5Qs8Uncwkn0ewHxjYjqGOA7BkOtOsobrwR4FMBXHLbvVg96SptGOGvhDQFhn3lB/Xm2nHYdit1ofrCfq/u0uPItaOOM0rq9w+4XL8TDJUGUM1tluvfg3QIASNxAvP2leM1brA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOHkY4RUVsYWmJMhbswUMjtGGP98J7jseP2pspI8CFo=;
 b=l7VVrTkjEDPh1uNEtARrQ8pXokEWajvl21Rv4Tq4lLG8Viy+o2DvO0yl8O/9TQcQ7DOKPT5EPyZTL21PQUOIV8zKtbA12FXga923RNmba8F/45edfNPBUI2IeRPPHN1Bw5ILrPIuloDkV9LhP797K091FAD9cDe1P8PMTOM62pfjgt+W9vgbUXrxUVR+wOn7JX8z/bLNiYDwiWfP6lAfZ7FUo9DA22KOBafun9781xuztR/XPoo95qQaRwmazl67ooUakrBfN23ulrWRIwhZKqbCdX8KPxk/rsxj8qBayfkUK8oZSQxZ0MYZzY1S/W0ajoeOZSf7wB6tnZAThMKSfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOHkY4RUVsYWmJMhbswUMjtGGP98J7jseP2pspI8CFo=;
 b=fZqbHPU+9CK7D+xFiZ5M9Ek2D+vEpeU3E7eiXvPeQnGHF/KrY4ScoVV800NCEWVAkyikHL6ZU2Ns5vUIBr0IZKmLfXSZgrB5sKwf6K9XKx5VvL9Fa0hlFM2+pSHyPoCHLJ7L1L9I6wMky0uT3RRxUd/w7uNT4REUFZAsntF45YE=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CH0PR10MB5004.namprd10.prod.outlook.com (2603:10b6:610:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 20:09:14 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.8632.017; Thu, 10 Apr 2025
 20:09:14 +0000
Message-ID: <8a0f6f24-3344-4842-a9fc-e138860ad954@oracle.com>
Date: Fri, 11 Apr 2025 01:39:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] PCI: imx6: Skip one dw_pcie_wait_for_link() in
 workaround link training
To: Richard Zhu <hongxing.zhu@nxp.com>, frank.li@nxp.com,
        l.stach@pengutronix.de, lpieralisi@kernel.org, kw@linux.com,
        manivannan.sadhasivam@linaro.org, robh@kernel.org, bhelgaas@google.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-3-hongxing.zhu@nxp.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250408025930.1863551-3-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CH0PR10MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: 90836d8d-baf6-4696-70df-08dd786b906d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGFZWTI5TTd2Y0Ixa3UyZWwwQUhzWVZzcUpzY1o5S3cvKzJCa3BwWHNiSmw1?=
 =?utf-8?B?MGlFNUthUGFQV3BrWU56TVRVUWtjNUlpeE95U1FsQlZHS0xUMUhUMGdwQTZy?=
 =?utf-8?B?QzBldmE2elBlUVZmWlBvNXZabFdPVjhJTlcvRjhjUGQ3ZXdFSjdxYkJwakdK?=
 =?utf-8?B?WGlMU2d2eGxVODlhMEMydzEzOWtRYW5ET3pMQkdpd29CRFNpR2dVc25hb25z?=
 =?utf-8?B?SVV1YnZ6cXl6OENNRDQ2SUtmeXQvT0YyYUVZSExlOVc0TzgvM1lBSmdYbXAz?=
 =?utf-8?B?RzE2K1pSOHNDclJiYXhrT2dTZWFmNXJCR2VQWUtnQVd4Z20yRUJvYzd1Ly9i?=
 =?utf-8?B?cFkzSGxUK3JNcGpMOXUwZXMwdUtMMVVKMlRueXdaZ0h4OWZENEc0U3RWK3RM?=
 =?utf-8?B?NE9YSFdQclBiWCtkK2ZLRE5KaGExQ1FKazgvZVJTdUNPUVZNVU4rbEdWQ1Yz?=
 =?utf-8?B?bDA4MVBmeWM4c0RleEpJVVJENkxTOHRJVWxzS1c3a2ZvcG5JUDJ2aFdydUxC?=
 =?utf-8?B?ZnhJOVhTamhzNkhPTkJhQkxkcGtwOGh3RW9NVkJlK0FLa2pYUTd2R2RVRThv?=
 =?utf-8?B?cXV1MFo5em01bTE3bUwrdEl2bTM2bG5pRm95MllHNkdhTGxWcUZ4Y3hHVzB3?=
 =?utf-8?B?RDFWaFl1MHJYWG9wVDg0WDJGVGw5NnV5MC84dkluWEViN1FJWVhsQjZ0c0tK?=
 =?utf-8?B?dFBibUJEZ1F6UVJoS2NCbzZPQ3FLdEc5UDZZVm5Gc0FiY1YzUURyQmFMY3ln?=
 =?utf-8?B?MDNhNnhYVlBoZWxRRnkvL1B4UkJEVEh4ck0wbzNrWlVlVEg1SkZ1b2xPWUZJ?=
 =?utf-8?B?NUFuOVo4UGNjZFM5SHJwUzNtYXZ2ZmRWTXdNbVoweVZZSzBVK1k1TVhBa3hM?=
 =?utf-8?B?cnVlaHVpbDUrVVJreWhxM1BaQUtXUTNPK0tLcXlvUmJ6eXIxaUFJeWxQd3lq?=
 =?utf-8?B?Y1o5VTE1ZGM5K2xqL3Y5RHQ5WHYrRlhuZ242WHMvL3Jub1NCTTMvVE5vV2pH?=
 =?utf-8?B?VFVKQmU5VXAzOUg1VkUwRDRZUGZ6OEhHTnhjK1hEK2h6bnM3VHNhV0RWTXlZ?=
 =?utf-8?B?aXVWL28rRGxZcEFmMDJSTDNwc1hDQXdINnV4ZTRGUW9lcWJaZ283b2xHYTM2?=
 =?utf-8?B?OExYSjZDQ3cydVZqMU94eHZjcGxoY25iNHlGSXBQbVR5NzB3WGZieWR6QUJY?=
 =?utf-8?B?QkVDMWlrYzNGU1EwTXp2czBZWUJBNkNNVjlKNUZaYzdZNlJhSmFtRUMzQytz?=
 =?utf-8?B?TUJZL2NCbzQxakVXWTB1ZFI2ZmQ0WUdHVFBiejRMdDMwbTlZazFPSnk1allu?=
 =?utf-8?B?cHFPQXpZY2pWY0JQdkxudWJUU3RqaXFPaUFCNFM3dzFrV040b1l0dW1wa205?=
 =?utf-8?B?bGhZZjR3YzdTZkZZR0JPOGpYRExVNG9CWlJ2YmlhR05IMEFpbjNEMTI5N0c1?=
 =?utf-8?B?WFpwWGpjcXRyUnZBUllqcnRqTjdxck9MY0MzN1lDU0tnMzBOa3dWZzN4L0lu?=
 =?utf-8?B?ZzAwSVFPMG1wYmppOCtiU1NZN0dWVjByK3NHb0pkTEJEK1dWZnkvb0xGaExE?=
 =?utf-8?B?OW5PTFRFY3ZDMVFRRncyTmdlcWpGMWdVTExLak9FTnhxOVJXZmsrNHBUQXk5?=
 =?utf-8?B?ZFVVMUZSMGJxYytNdE90ZHhvdXQxT3NGdFNNdTBlUTZwSWwwa1ZSdEVtVVM0?=
 =?utf-8?B?OVo5bkxvY1ZrNjdBZ0VHMGI2cHpYcVUwOWxDSWwrMi9QaVNlU0dsUHpmeCtM?=
 =?utf-8?B?UVNuMkxmQXV5akpzcTRUNVlFRlJlbU95d1JTSlgvaW9jbnl0bDB2c3lRUXNl?=
 =?utf-8?B?ZUVqTXN1M2xpcnRxa2g5R1dpUVExbTdKT0JVdEJDc213UUp6OHZkNWk4NFo2?=
 =?utf-8?B?NDYvQ2hYa2dZMFQ1bHFWVlFBZWk3c3J6cVNXdC92T1AzV2hseG5TVVlKTDRh?=
 =?utf-8?B?ek1ETjdCTVJoTWg1ODR6ejFub3hZbURLYlYzMFJaQ1VmM21UclJWa000Z2tL?=
 =?utf-8?B?YXZ4bnQwMnlRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVFVYVYzUEpueUhzNm42QkdQejI2SDcvOHpZODFtb1RUS2xEcG5obi9XWGpy?=
 =?utf-8?B?ZXRPNG10R3NFRFVTVmhkb0UxL0NuQVRQR0tTT3E0dTBiaHdQa0prck5JZkVQ?=
 =?utf-8?B?RGM3c3MrL2pjTEFub0RSQ0EvWWtrMXMvdkZzWDRESC9paTdJMjBQS0kwRVA0?=
 =?utf-8?B?T2tPMDY5ZVRNS1U3aXZxeWlwaVdyTm1uZnN6QjZvN3o5clNBWkwrM044T1Vk?=
 =?utf-8?B?UmxXMW82RzZ2aVl6L3V6aEVqeTZtVnhzYldaZWwvK2c2d1RDODdTaUszc2ZS?=
 =?utf-8?B?MHJyQW5rdU9nZElLRHRESTNXeFRrU21OVmRTNG5rcTBMUHpyNzhCL20xN2Qx?=
 =?utf-8?B?MVlxK1A1UDMxU1E3TldUK09jalYrSnliQTJQSlJPQW0yRG9ORGdzNXQ0L1Az?=
 =?utf-8?B?NGJiaFNWdytTV0VrUnFNYUg3SkxpZDdLb2FMdHdEcjRHUEZCU2I4dkJhQUVt?=
 =?utf-8?B?enh1bnh0aE1Xc0ZNWXFYZVoxcTcrWnBpL1c3bG5tdXBMU3djeFFuODBMQVcz?=
 =?utf-8?B?Sklic3FkcGViVkRLZnFPV084eWlJVkF3Zk92eTNXcmpGNlkwSjFyQ3htbmwx?=
 =?utf-8?B?TWg5L285YXJTKzdiWnMzdm5VVWFPT2NCd1FORUc3dVpQekJLakVSR1JuMWlq?=
 =?utf-8?B?RXlPU3JlMUpHckVCc0VFRVlGS1h5ZXVCZ1RDcVJkaW9NWkhCVzQ3U0FLSVAy?=
 =?utf-8?B?VDl5cjFGdTYxaVRETUZYTWpQRDV4ZEUzdnRDNU1BYnNoSm5qYmNTUFkzTkRj?=
 =?utf-8?B?anVEZllyNEVwQkNveTdOUG1NQTdncUt2MWs4ekVoN1FKdkd2UGl6akQvV3NE?=
 =?utf-8?B?RWRhSGlPUy85RXBjcXdEb21JK3B1NWZEanJaczVWekhSbWd2bkVLMk9ZSGhz?=
 =?utf-8?B?Q1pkS2JIcytsbzVpS21EWC9yQVRHUjM4ZUZQNGRwUm1xeFJUSk04djFRN0Ft?=
 =?utf-8?B?aysyOVFXUlhaMCtDVzl2QkRraVVoZzFsc001YUZPNHN0ZDA1SElURkVmNExm?=
 =?utf-8?B?bWpFQ2FWbWJMUUFhbWtIcnNLZkNodXlQMXNvRTQyWkhiNXgzV3dSK3pHSEJt?=
 =?utf-8?B?UzNRdWNlR3JOT0gvVkRBOW45VndqTFhuWGUxNUZud01nQVRhd29QbUY2dEZD?=
 =?utf-8?B?MEtlcFRVOWs4S0pjdTdETVVXTDFxd2xqOTYveG1QaU5EdnFWaHhBemg5YkRp?=
 =?utf-8?B?YWNsdzY1ODdFcHgvZlE2aFlKdWRjalgrSUxyL1B1RFhmR3FZWUk4TzZKdzJR?=
 =?utf-8?B?dW1MUGxiWWxGVWQ5aTlzWDFMNTlrRXFiYjl5RjRGanBjbVVQTWpvT3Jrc1hY?=
 =?utf-8?B?cXZnaEVCb2cyTkpLN0ZtNWhsaHJVeTZua0FwMmk1czR0MmxGVjk1TGRyWlp1?=
 =?utf-8?B?TEt2YjZFNFViRURvL3gvNTNKNEljdjM1d2FnOERYckh1VllEWTh4TXBvWisw?=
 =?utf-8?B?RGFxL25jaUV5NEk1Y1VUU0ZEUm1UL2ltMUFjbSsyaGVLT0oyU2w0WFBmOE1M?=
 =?utf-8?B?NDRwOTVEMmRrTUIzN1NPa3c2NzY2R1dGUi96SklqMU5VVkFTR3czeFZRKzBU?=
 =?utf-8?B?YVkvdUFSUFBvVDZDaDlZdWU1RUdHSzJoZlRlYTVkYlhtS3dWQllrakR4Mmlz?=
 =?utf-8?B?aVdNS0NuNGpOS2tJbzlBS0ROR1k0K1hNd1RUaVc1anBoVjc4YmFVNjU0SDhZ?=
 =?utf-8?B?V0ZkZG9XVDR0TVBuMHVubGF6QzlPRk1rN1dnTGkzK0pIelg5dVppUi9IdFho?=
 =?utf-8?B?YnVkdWFOQW9xNjROejRtQkNmeHptQmlPZkkwUTdGYTJST1NQZHVVV3hBNkpj?=
 =?utf-8?B?V0FuV094ZnVIQ3NxVHBKTnBmaGc1d3JoOUZjQWhzRnpYdm5NZGw2RElPYjFK?=
 =?utf-8?B?cE9jS1E3UnFxVVJZbXRMNzNLRjhFNW1oc21weE44WTlVdmxNbXRrRVRWOXdv?=
 =?utf-8?B?MkJ6cXVKbnNMMXRLOThiS3hVMFRyckhVUjF0aThxNHA4bmd3VlhqWUwwT1Mz?=
 =?utf-8?B?cTRlNzRPdExTMnBFc2xQTUFuVDhGZ2Nla3FxalR2K1lCQWpCZjV5K2JjMDJj?=
 =?utf-8?B?Vk1BbXR4bVkvTWIxOEUyME51MVQ3N3pqZDRXOXpoOEdaT1kwMVpaVU9mV3Z2?=
 =?utf-8?B?OUc0TDU5aVRGdHpSMmpmYklTaFdUSElxRkJnSENISmcxaTBSd0R6NzhHZWtj?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fEBPuLs6igY/io2kJvIzOX8CtqoyQ+19Rwc/0RpyEjJCCxPrU5gmbpPCuyNu8JJY/5eGm7QzMbJk3nTrI7SvNgiz6QTAgggiFygWECAcapnSExjxa0OO6d23WwgfOALEWPezFBrT1XEniy5VzYJhP01kJcT1WeLxkhbMXfBcgGTGFubrBOeat8SLy2xIWfFBneh0V2ch8JR0y3/ZqR9W5jLE7d2DEHwzlftgAnNwumJeirt8LxLmKV/iRi/wun0EbwG0GVoT9gFkkr/X2iO7HXoDl59PG6Rqti75hOWQ2+WC7HXN9eRgirVZEvgPQZxZBcwAU5aF+cxf27b0aAVrArG/G/2DEaq8C5GvwsJkBlWq5ip9wUwbMok3xC4VvxUoqE/tC0VpG8Xjsh62Szb3nrLFcpQLCJYzQPduTVCmoBl70dRhRwQfVSxQuEFzVdlI3hC+CNGFGsoRkvu3u0Pk5RS4SUtwYWlGzeA/txAKNNsRR4Rspb3SC6MZgXbf1kcH3M9uhL0jyyVwhC8F/nintizgm4PfykWyRZvc7ixHoGPuU4bCHYcQeicsl7/CuOfOrWuu/xY8ChCycWNIVz6E1OA7/hj7TzQWLOaRxrfbIl0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90836d8d-baf6-4696-70df-08dd786b906d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 20:09:14.0220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAmajSOSl69msBCaapzjTliqunsied+wfG1LdZUmq5J2vB3RrcK0CprAs/TnEjEys/YA9OdgTGP9FcT8IP5+VLFOW8cs+sJ1qA8LEZ+m5r8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5004
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504100146
X-Proofpoint-ORIG-GUID: cVmVefgPhCfL5Ff0eiffcEPCVkZr4JGV
X-Proofpoint-GUID: cVmVefgPhCfL5Ff0eiffcEPCVkZr4JGV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_130936_222100_5801503F 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
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



On 08-04-2025 08:29, Richard Zhu wrote:
> Remove one reduntant dw_pcie_wait_for_link() in link traning workaround
> because common framework already do that.
> 

typo: reduntant -> redundant ,traning ->training

> Suggested-by: Manivannan Sadhasivam<manivannan.sadhasivam@linaro.org>
> Signed-off-by: Richard Zhu<hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li<Frank.Li@nxp.com>

Thanks,
Alok

