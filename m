Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD98AE8B39F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 05:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zI0XxsNKoDLbUMOceZWbKpDqM29Jna77M1X3nPyaRM=; b=oTI9MvgmQrj49ZyUkwWiRpekdB
	/yqF0hADLcB4v6Yc46RphBZt7dLrWiZ59NLBe5kTfAoGR+qDmfDbCokwclSmOClQ5RCR/aQHMXeV6
	RSdOtq5N9ldKrSy0V7paPzxr+k6r/uAjIAsJSta2O9xOdjx5yzmuBK1jKGC90Zr6ijAaoYXGO00q7
	FMB8jL1zySWv7tlLoOXk8TfsASu0xH0ApW13w9KtP6RlB03CBya75c6qzQjTDnSJm+MsvKNLH1zkg
	2Pos9x4BqnuFBnnvp7fVHRzVd7A1xZKbQOoelQytBwbsKloDGG76SxMifhauSyqjnRIj7AO0v+sdg
	IJtrxXcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnVnw-00000007y8i-2o7o;
	Wed, 04 Feb 2026 05:51:56 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnVnu-00000007y8K-2YXZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 05:51:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CoglrnrkI2ZrGXsUSxEvIyFEwBhLNQltA3PjWTlxS5vKJ9rv4I/3OcZjQWxuV5Ks1xAAlU1wrZi5OydXyPj5YKKqQ6zy7r70zsWV6mzzGctuL7Uj7ROE4jBpCbkrf+v0+uSlX58mOow8DtjtQfODkJbqe0TXJfMCsnOrhtq24PKP17CTJ1IUi/2zxk49a18F/gJoBDSY2ZfvLJ2SRGVaC4yom32g3uHmeL9BbJokO58Ze2z/xSJk0H8+Q4yNeaD8JunrFyh7l5MEO26Zvio4AroVYJ+igQR0HubJkp6Z+Xoh9EVwS9oOPMr9gYimxwEh2fgrQ314HM2vGy0fyoh0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zI0XxsNKoDLbUMOceZWbKpDqM29Jna77M1X3nPyaRM=;
 b=HRBr7ykjW3uD/ssYopM0k03riH3E8xOsqeokR4Bp1BpDdEZnTVEwNEPoBuabZojHdBAaXxsB4L1Bd5+Y9MleiX1C4nfJfUmS3n1tbEDf4XmxZEy2c6xbwqLRni+B8XIw9q2uOb57zJzCBzxm0N2SVVaBQAOctIaLmSUNviqKKNWbLBoNxxTPrbcnlP2dSQ56wQ9lXHKoXNFQt2naec+KS+sNuGzxmq5OaA06jGIah8ITG6Df+oAgHASFSfREzdWcyxXPPIzsytd+4tLh1Gz3hN4BLflfe3wZ3cKfaTzzFoG6nO4dwQFab4zokfJih9pOC9CH6uqe8f9f1bS2xuRmrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zI0XxsNKoDLbUMOceZWbKpDqM29Jna77M1X3nPyaRM=;
 b=XQxMXPkJvyAo+5Rrm7VRKY42gRfEZmMsWnAyVjeup+8A09V9zJWmSQPeclj+oPJr6ZcdSrQdX4aOKqguAIEuRwpucqpnK+YeyUeKVB2+C4cKH3awniWGhyEoLbbwYcRTuTctJYX2H6BvxmAlVXyuMoefsn2F08hT5aqkn1W6BuRFWo+TMCHjhuiYZ0DzY2WUVTk3kbh8x3sQCwyR/0S5Kh/Dp7HwpZusbhsUQtjJYVRnMSIoN4mCsP8Y3hCglGnDBzepA+bQ+kt1MEKyaoDE8CIyHS1q6BoqmXtvhH8sPq4pVj1RjgfAhuEb5G5oNIKA5ddc4lPXrPGJyBjA9R5p/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AM0PR04MB7187.eurprd04.prod.outlook.com (2603:10a6:208:196::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 05:51:48 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 05:51:48 +0000
Date: Wed, 4 Feb 2026 13:44:21 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: dwc3: add may_lose_power flag
Message-ID: <pzvceukkxvg6qy6ar6tj2lst7k5tyud3uhj5egy6dioeayajtq@3n2gwr35wwnc>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-2-c44a5e919380@nxp.com>
 <aYDEb+nZe2efehEr@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYDEb+nZe2efehEr@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:4:186::23) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AM0PR04MB7187:EE_
X-MS-Office365-Filtering-Correlation-Id: b9a1d0f0-f112-4154-01f6-08de63b17c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cU9qMDNRUjNPekd6Zm96ZlBKRENTdVY5dUtkMHpET2Y2ZkZ1eGNPbi9INkpD?=
 =?utf-8?B?dWpsZEZld2R1eVVJQkRKaklPV0Z2b05qRUNnWEk5ZUwwblBPTWpXV0dLdkF3?=
 =?utf-8?B?L0tVejFNOXJNOEs0aDR6em5hRjAxUVZUY2NMNGp6U1pYc09XU21ZcFVKU1Bi?=
 =?utf-8?B?ZFhNZW9velN0NkFoWkljS2RPS1BPUVV6OUtkQ05vZ1VhbWxYVm9FREU5YmlM?=
 =?utf-8?B?eDZHYXNDQm9BWjdCcExVbUpzVUczN3hUZkQ3OWJPREJSdEh1OHhsTmMvSFNt?=
 =?utf-8?B?bWkvanZ0MGtGYW9lOXh6Q1U2TXd6K2ExaVFXeDR3Q2MvQVd1V3IyaDhaTlFC?=
 =?utf-8?B?MERvRnh6YkZFdzRXdjZiNCttNjd4S0tiTlBIcU8vWmlLTUNKU09hcFd6VmJ1?=
 =?utf-8?B?MDlQY0IvMmRxd29JWWFVN2VHdmZWcmNLVm5rUkhWN3ZmVUJ4bVJyelp5dldz?=
 =?utf-8?B?WVZSY21sZ014VjlkRHBMS3dFTG81bkg5aWtZS0I1OHhXUWdSbkpHeEF4N1Jo?=
 =?utf-8?B?em5ZdFROZEJ4K21yY2pYelNBZFFHNWdzeHZEa2lJNkZnNE5KeFNqc3NnNURU?=
 =?utf-8?B?NVE2cWZiU1dMcE5FTFMzSFNORWt0ditMQVNRTnE1aFNCbkxrMWZ6OFY4NlF6?=
 =?utf-8?B?dkZjT05NU1l5TXBtaDBQdjVzMzQxMXJpKy9NVUhXZVVucWlPaWNYZHRmT2tY?=
 =?utf-8?B?L1hXVVlRNnBaOUM2RU5LYXZhT3M2dVBrSDFhR28yODhTNW9Wb0VoMVZYN1JW?=
 =?utf-8?B?STRpYkV5WHI4ZkthV1Z2WUZETS9tV2hwY1ZSeUZFV2pCZC93OVZjYmF4Q2hN?=
 =?utf-8?B?bWYrMmFqMTVGUG5oZmxJOW8xT1ppclljcDBBM1hsci85RHRHUXkrM3pDVkds?=
 =?utf-8?B?N0VaSDZnd1VVZE5tWUYyWXJzeEJ3M21IQ0NBL3NxWUZWcmFRZWZaUHpJbTho?=
 =?utf-8?B?QnhYbTRJQVZoRmc1YThhQnU4QWZlZnUyT1QyVDl5ZDhobklKV0RWOVFZNHdm?=
 =?utf-8?B?Z1pOVHIrdEIzTnQrTVNpbjNRMXhtRHhQN2VtbjdJN1lYZkhWSmIzQmg4Y2RC?=
 =?utf-8?B?SmhndzYyaUhTcXlRVUR1bC8vRVV3V3NlT1lSSm1IUkc3UTlyS3cySnhEYkk3?=
 =?utf-8?B?d3orUE1hL0tkc2N0aktVNDdZN2tXakI0MFZiam5VdEtldnovajI3enNqYXVB?=
 =?utf-8?B?c2I2NlZwUU9yTGdJT3VRK2I0OEZsQVFqc2pTRk04dThuZ1BFYk0rMVJnNkpJ?=
 =?utf-8?B?M0RoZGt2NzVFUzUwNnVYNGczbjVMUDFaUGJLYjRodDJiajMxNlJhY3o2Ukhj?=
 =?utf-8?B?S2dHeFdFQW1SQTRmYVdLVThCSnl5WXAxTUgvQ3I5RmZPYzFMTzJ0NEREeSt0?=
 =?utf-8?B?a0VpNUNpaTBkZHBndCtCTE5uZkZSOHg5NU1tWkF5NUFSZFJSdDNmU3htVURp?=
 =?utf-8?B?ajM4aFU1TWNNVi9sbGMzdDFSVGg5K1VtTjhXMmRTUmhTVElGRS9pNHJkZjc3?=
 =?utf-8?B?L1czVEx4K3RhaWJMTjFrdTFuUldBWDRxZWRsUkdFYU1HcHk2WWZIUkNZMGxJ?=
 =?utf-8?B?UG9QNm5jNTF4S1E4dlN4b1dabHFqS09RMTdZWUFJUHVZb2xmYSs5VVV0UDlC?=
 =?utf-8?B?ZUlUZWRQN3ZRYm5Qc1Zra1JjaS90cThTWFpvSnNoVnIxUENYbVI0cEluS3ZJ?=
 =?utf-8?B?Wkt5OXlDdktLMmZxa1BONU4zaDk2QnZTNndTQkJha3RxODRXSjJ0ckpXSDYz?=
 =?utf-8?B?OHpBYy8rWExCWGNjbTh4b2FxMEU3bzhpeEQ0T0xTMklEckxsekRGUHpZL3Zs?=
 =?utf-8?B?SEtFTjRteFl1bWRmYm9NTEFTOFRRNDZsUENxTXF4SVNTVHlhUXo1cmxEUERv?=
 =?utf-8?B?SVZYN0MxdnVZQXBaNHJKMHdzWXhLVnlBWDlGOSt1VmNyTEp4R0dLMVh3L1dR?=
 =?utf-8?B?cmo2Mzk1Q2doS0dsSk5HQ0c5N1M0U2NEeGppYXVFcFdnTUlrSVlVMzkvK1cw?=
 =?utf-8?B?cDJVQlFnbWROeDg4QXdmbnFGSVdyS1RxRytCVEVFT00xVDE3UnI0QzVxYmdH?=
 =?utf-8?B?ZEdPZ0g3a0V0K3VRenNZZ1k5QVZLQ1pEMUFvQXgyM3lDTTR0cjNZdkRxbTd2?=
 =?utf-8?B?VW1MOG5Mci9hR293QTBXNVlXSHhuUEk1RjFiOFdQVWRPMVVuQUU2dm1VNWJZ?=
 =?utf-8?Q?r+9X396KEFQh6qe6TMPYFF0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWI1a2ExOVNZdHNtZzg4MytZUVdmOXo2RlNqVU5MRC9jdkFrZmpwUGN3YXRm?=
 =?utf-8?B?LytTbnZGMU9qV0twY25GRkowMTlMSWtLNXkrcDZTays5ZHBKYTd4ZXcrRlU4?=
 =?utf-8?B?OUhEUVh6ekYyZEpsOE5Lci9ISE44eDBLTXU5bDVKc3ErZXB4V2xHUXVFR3FL?=
 =?utf-8?B?UWtac21UaW5NMVZSVUdxQ3IzS3AzOFZwMkpyWnVrM2FxdUxadGtzM3hPa2N2?=
 =?utf-8?B?WkNOeEJ2dmZiY1ZyalFWeWJSc0I4RFdxc2gxRUxvWkUxS2tHQXhET1YxRWNI?=
 =?utf-8?B?V1o4N3laTXZXbWY1Y080Q3dyVjdURTlnYmV6eHF5V25zL1ZVMU5jbWtJMGNX?=
 =?utf-8?B?Uk1EWmdBZlpUdTNyYkk1MWxxd0tLVnYzNitIOEc2ZDAwY2t4VTI1SU0xUjdx?=
 =?utf-8?B?LzVkSEp3TjUvTmJYMms0QlllS1U5RU1EaGpEYVRSY0JZR3RYZTBJQ3VyQ1VV?=
 =?utf-8?B?Y0ZvNU9kQWZCYjdiaHN2aTRZallnWEY3MnRubXZLUW1xb0ZTc1MxcmxhOFpV?=
 =?utf-8?B?aVl4bEZTR0FvVHZSL080WWdvbzE3Qkk0anJ3c1d4UjFuZmxDWDlDUXVDeHRO?=
 =?utf-8?B?VkZNWUFzSXpaazdNMnQ4dkpQQ0xjQ1FDSHlwV28xM1lldExsZlRMMHNlVytF?=
 =?utf-8?B?WFF6Z1RnN0YweDI3SmdSZmN2c0hqMHRTMDVSeGR6dnQybk93UEJzUExwNlYy?=
 =?utf-8?B?VVUyamw3ZG1LdkR2bFJkdUtOTmZnOEUwWVh0R3l6NFdjTE1JV2VVMWR1Z3J5?=
 =?utf-8?B?VE9LVm11aWJHTU1jWXErMmJTWXVOZFlVbkRTL0JlSWRKT3lxREJhakRGWXI5?=
 =?utf-8?B?WVBlRTFkb0oweFJVcE5NTm5jbzA2b3lrZHpZV2VBUmd0TmozeC9COEQwdWtR?=
 =?utf-8?B?a29xUkJabFQ5MVZYK3B6Z3BnR2xBOS9qdVl0cFZKZmpDWjdTN1c1L3c4Y0lS?=
 =?utf-8?B?QWMrUVpKK3JJL3F2NmxSQ2NUaWNhZWNaUHBEb3FXbVAxTTZmSjZzczhocTJh?=
 =?utf-8?B?VUFXL0hkaE1lNnRrVHFWdTZHRmZWRGdEK0xubmxHT0dvUXBRVng3YVZ5TjBy?=
 =?utf-8?B?S0JydEJpWUFlSDBsM3p3KzdCTW9ZWkdqTXg2UCthQVJmQzRoaW9MZFdWVFR3?=
 =?utf-8?B?YUpHeHhaUW8rWnJLOGxNZ1RGNWVYb0Era3N3T0dNcm0reGc4Q1FlQzV0bGZ0?=
 =?utf-8?B?QVQ2MURsOWZlU3RnVGQ4WmV4WXc0S3FLNWNmOTVjdndTRmkwSEc1ejlUaUNG?=
 =?utf-8?B?Sm8yQUMzMy9Tb0pES3ZaOWxMdVFIWUJFSWlxZVBYa0FmUlY5RFoxVUMzc1Fh?=
 =?utf-8?B?czVjaXVQS2VmUXNBMzZKenk5VkpuK1F0QW1SeUMrajl1Q3BjLyt3cFlUTGR1?=
 =?utf-8?B?SWZZN3NBdHo2R3ZYbTd2TUtGTnc0dUdyRGtKUGVpNUt3RW1HbnllOVJRajNC?=
 =?utf-8?B?WVkralZrNDhsSUZkUnhLcWJ1SGp2UitpdkpOcHhNeUxMV0J4bnZ1RWxXVWls?=
 =?utf-8?B?cUIvaUpQb0ZoTktnaENwSDZrOFJsYkxTdysxd2JZMzRXb25pME1mRXliQVJh?=
 =?utf-8?B?c0FRTmtGdEtkOUdMNHBCbnRLQWhlNGdqUGErc1NhS2srSTV3Nm5ZcXZ6ekt3?=
 =?utf-8?B?alVmOW5wUnNWZmJseE8rRlhNNFRLbG9BWEFPMXJIRVpmd0V4dGVGWUJ6TXJq?=
 =?utf-8?B?VmVCWEQ3a2NIWW1vays1MXNkUVFCZ0ZlcUJtbGtRWDBZeVF6NWNvMFN0d1Yx?=
 =?utf-8?B?NlBLM1ExU0RPTVJBYklkYzVLMTB2SHNYVjQ2bW1ITitlY0MxOTBkSHNFcis1?=
 =?utf-8?B?N1k3TGhNN0VxaUlyWXliTkhsanJMR0lSV3pTb0hUL3RrMWI3ektiU2tzQUVv?=
 =?utf-8?B?c2RsQURNVWV5QngxSEJFbkh4M2VzZWk0N1lwcnJ5OUJWakZRQ2UrZjFkWHg2?=
 =?utf-8?B?R0tVK3RsV2RJeVBCdXVHaWtlaXZCam04WHloaTVkR1ZpQkVWUjRYRXRGY0VT?=
 =?utf-8?B?OThRbzFMa0Vla2hFamcxdVJXYU5JckdiVitacUpXZ0k3YmtacTVKS1MrWjJ1?=
 =?utf-8?B?QnR5ckVIallYOXZWSXJ1MzZaQ3I1Z2E5aUtEZkQxMVY5MEVSK3ZiaGRlZUZs?=
 =?utf-8?B?bWZiZVpVeHRuWHFENlNYZW1ibjNHN0JpOGZRWCszcWtSaEZ0QkUxTVFROFVD?=
 =?utf-8?B?VGpXQnZ2L3ZjNlBqMTJJRHBMdUpqZzZUeWQ2QkdGR3EwcldCeFZVc1h1TEdh?=
 =?utf-8?B?bHNrNjBwWGdQYU5YVGNObWNzd0R3NGFHRVM5WnduSU5Qd1NKSFdaclhiUFcr?=
 =?utf-8?B?ZVpXc00wc3NVcDVKQVpibHRKVVZkak5IN2FJUE5BMjh0dUZscDdudz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a1d0f0-f112-4154-01f6-08de63b17c50
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 05:51:48.0572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZeDqzI22WCF2mn/iHT/qlUOfMOgnG7WvoAspO55vtVkgRJqSrQUgtF5qzwU2YpRBCgLPGTymogfuycAoRy+oLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_215154_671394_29BB343C 
X-CRM114-Status: GOOD (  14.75  )
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

On Mon, Feb 02, 2026 at 10:36:15AM -0500, Frank Li wrote:
> On Mon, Feb 02, 2026 at 06:27:46PM +0800, Xu Yang wrote:
> > The current design assumes that the controller remains powered
> > when wakeup is enabled. However, some SoCs provide wakeup
> > capability even when the controller itself is powered down, using
> > separate dedicated wakeup logic. This allows additional power
> > savings, but requires the controller to be fully re‑initialized
> > after system resume.
> >
> > To support these SoCs, introduce a flag to track the controller’s
> > power state and use it throughout the suspend/resume flow.
> 
> Nit: next time, wrap at pos 75 to reduce some lines.

OK.

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

